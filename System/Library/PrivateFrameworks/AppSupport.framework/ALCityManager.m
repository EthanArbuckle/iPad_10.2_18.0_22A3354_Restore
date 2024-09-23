@implementation ALCityManager

- (ALCityManager)init
{
  ALCityManager *v2;
  NSRecursiveLock *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)ALCityManager;
  v2 = -[ALCityManager init](&v33, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v2->_databaseAccessRecursiveLock = v3;
    -[NSRecursiveLock setName:](v3, "setName:", CFSTR("com.apple.AppSupport.ALCityManager.databaseAccessLock"));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppSupport"));
    v5 = sqlite3_open_v2((const char *)objc_msgSend((id)objc_msgSend(v4, "pathForResource:ofType:", CFSTR("CityInfo"), CFSTR("db")), "UTF8String"), &v2->_db, 1, "unix-none");
    if ((_DWORD)v5)
    {
      v6 = v5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ALCityManager init].cold.3(v6, v7, v8, v9, v10, v11, v12, v13);
      v2->_db = 0;

      return 0;
    }
    else
    {
      v14 = (void *)objc_msgSend(v4, "pathForResource:ofType:", CFSTR("Localizable_Places"), CFSTR("db"));
      if (objc_msgSend(v14, "length"))
      {
        v15 = sqlite3_open_v2((const char *)objc_msgSend(v14, "UTF8String"), &v2->_localizedDb, 1, "unix-none");
        if ((_DWORD)v15)
        {
          v16 = v15;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[ALCityManager init].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
          v2->_localizedDb = 0;
        }
        else
        {
          sqlite3_create_function(v2->_localizedDb, "CDLIKE", 1, 1, v2, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))ALBasicDiacriticMatch, 0, 0);
        }
      }
      else
      {
        v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v24)
          -[ALCityManager init].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
        v2->_localizedDb = 0;
      }
      sqlite3_create_function(v2->_db, "CDLIKE", 1, 1, v2, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))ALBasicDiacriticMatch, 0, 0);
    }
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_5);
  return (id)sharedManager__sharedManager;
}

ALCityManager *__30__ALCityManager_sharedManager__block_invoke()
{
  ALCityManager *result;

  result = objc_alloc_init(ALCityManager);
  sharedManager__sharedManager = (uint64_t)result;
  return result;
}

- (id)allCities
{
  id v3;

  v3 = -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", CFSTR("identifier IS NOT NULL"));
  if (self->_localizedDb)
    -[ALCityManager localizeCities:](self, "localizeCities:", v3);
  return v3;
}

- (id)citiesMatchingName:(id)a3
{
  return -[ALCityManager citiesMatchingName:localized:](self, "citiesMatchingName:localized:", a3, 1);
}

- (id)citiesMatchingName:(id)a3 localized:(BOOL)a4
{
  _BOOL4 v4;
  _UNKNOWN **v7;
  id v8;
  id v9;
  sqlite3 *localizedDb;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  void *v19;
  const char *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  char *pzErrmsg;
  int pnColumn[2];
  char **pazResult;

  v4 = a4;
  -[NSRecursiveLock lock](self->_databaseAccessRecursiveLock, "lock");

  self->_citySearchMatcher = -[CPSearchMatcher initWithSearchString:]([CPSearchMatcher alloc], "initWithSearchString:", a3);
  v7 = &off_1E2880000;
  v8 = +[ALCityManager newCitiesByIdentifierMap:](ALCityManager, "newCitiesByIdentifierMap:", -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", CFSTR("CDLIKE(name) = 1 OR CDLIKE(country_name) = 1")));
  -[ALCityManager _whileDatabaseLocked_ensureGreenKeyValueCaches](self, "_whileDatabaseLocked_ensureGreenKeyValueCaches");
  if (self->_greenKey2ValueCache
    && objc_msgSend(-[ALCityManager _whileDatabaseLocked_localeCodesMatchingQualifier:](self, "_whileDatabaseLocked_localeCodesMatchingQualifier:", CFSTR("CDLIKE(country_name) = 1 AND code = \"CN\")), "count") == 1&& self->_greenKey2ValueCache)
  {
    v9 = +[ALCityManager newCitiesByIdentifierMap:](ALCityManager, "newCitiesByIdentifierMap:", -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", CFSTR("locale_code = \"TW\")));
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);

  }
  if (!v4 || (localizedDb = self->_localizedDb) == 0)
  {

    self->_citySearchMatcher = 0;
    -[NSRecursiveLock unlock](self->_databaseAccessRecursiveLock, "unlock");
    v19 = (void *)objc_msgSend(v8, "allValues");

    return v19;
  }
  *(_QWORD *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  if (sqlite3_get_table(localizedDb, (const char *)objc_msgSend(CFSTR("SELECT code FROM locale_names WHERE CDLIKE(name) = 1"), "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg)|| (v11 = pnColumn[1], pnColumn[1] < 1))
  {
    if (pzErrmsg)
    {
      v21 = (const char *)objc_msgSend(a3, "UTF8String");
      printf("Error fetching locales matching %s: %s\n", v21, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult)
      sqlite3_free_table(pazResult);
    goto LABEL_33;
  }
  pazResult += pnColumn[0];
  if (!self->_greenKey2ValueCache)
  {
    v18 = 1;
    goto LABEL_27;
  }
  LOBYTE(v12) = 0;
  v13 = 0;
  v14 = 1;
  do
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", pazResult[pnColumn[0] * v13]);
    v16 = v15;
    if ((v12 & 1) != 0)
    {
      v12 = 1;
      if ((v14 & 1) == 0)
        goto LABEL_17;
    }
    else
    {
      v12 = objc_msgSend(v15, "isEqualToString:", CFSTR("CN"));
      if ((v14 & 1) == 0)
        goto LABEL_17;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("TW")))
      v14 = 0;
LABEL_17:
    ++v13;
  }
  while (v13 < pnColumn[1]);
  v17 = v14;
  if (!v12)
    v17 = 0;
  v11 += v17;
  v18 = v17 == 0;
  v7 = &off_1E2880000;
LABEL_27:
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 22 * v11 - 4);
  objc_msgSend(v22, "appendFormat:", CFSTR("locale_code = \"%@\"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *pazResult));
  if (pnColumn[1] >= 2)
  {
    v23 = 1;
    do
      objc_msgSend(v22, "appendFormat:", CFSTR(" OR locale_code = \"%@\"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", pazResult[pnColumn[0] * v23++]));
    while (v23 < pnColumn[1]);
  }
  if (!v18)
    objc_msgSend(v22, "appendString:", CFSTR(" OR locale_code = \"TW\"));
  v24 = -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", v22);

  pazResult -= pnColumn[0];
  sqlite3_free_table(pazResult);
  v25 = (void *)objc_msgSend(v7[88], "newCitiesByIdentifierMap:", v24);
  objc_msgSend(v8, "addEntriesFromDictionary:", v25);

LABEL_33:
  if (sqlite3_get_table(self->_localizedDb, (const char *)objc_msgSend(CFSTR("SELECT id FROM city_names WHERE CDLIKE(name) = 1 OR CDLIKE(country_name) = 1"), "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      printf("Error getting city names: %s\n", pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult)
      sqlite3_free_table(pazResult);
  }
  else
  {
    pazResult += pnColumn[0];
    v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v27 = (void *)objc_msgSend(v26, "initWithCapacity:", pnColumn[1]);
    if (pnColumn[1] >= 1)
    {
      v28 = 0;
      do
      {
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", pazResult[pnColumn[0] * v28]);
        objc_msgSend(v27, "addObject:", v29);

        ++v28;
      }
      while (v28 < pnColumn[1]);
    }
    v30 = -[ALCityManager citiesWithIdentifiers:](self, "citiesWithIdentifiers:", v27);

    pazResult -= pnColumn[0];
    sqlite3_free_table(pazResult);
    v31 = (void *)objc_msgSend(v7[88], "newCitiesByIdentifierMap:", v30);
    objc_msgSend(v8, "addEntriesFromDictionary:", v31);

  }
  v32 = (void *)objc_msgSend(v8, "allValues");
  -[ALCityManager localizeCities:](self, "localizeCities:", v32);

  self->_citySearchMatcher = 0;
  -[NSRecursiveLock unlock](self->_databaseAccessRecursiveLock, "unlock");
  return v32;
}

- (void)localizeCities:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  const char *v17;
  char **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  uint64_t v23;
  char **v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  char **v41;
  uint64_t v42;
  char **v43;
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char *pzErrmsg;
  int pnColumn[2];
  char **pazResult;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (self->_localizedDb && objc_msgSend(a3, "count"))
  {
    *(_QWORD *)pnColumn = 0;
    pazResult = 0;
    pzErrmsg = 0;
    -[NSRecursiveLock lock](self->_databaseAccessRecursiveLock, "lock");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", (unint64_t)(objc_msgSend(a3, "count") + 1) >> 1);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v60 != v8)
            objc_enumerationMutation(a3);
          v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "localeCode");
          if (v11)
          {
            v12 = v11;
            v13 = (void *)objc_msgSend(v5, "objectForKey:", v11);
            if (!v13)
            {
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
              objc_msgSend(v5, "setObject:forKey:", v13, v12);

            }
            objc_msgSend(v13, "addObject:", v10);
          }
          else
          {
            objc_msgSend(v10, "setCountryName:", &stru_1E2882B60);
          }
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v7);
    }
    v14 = (void *)objc_msgSend(v5, "allKeys");
    if (!objc_msgSend(v14, "count"))
    {
LABEL_48:

      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 16 * objc_msgSend(a3, "count") + 40);
      objc_msgSend(v35, "appendFormat:", CFSTR("SELECT id,name,country_name FROM city_names WHERE id IN(%d"), objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "identifier"));
      v36 = objc_msgSend(a3, "objectAtIndex:", 0);
      objc_msgSend(v34, "setObject:forKey:", v36, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "identifier")));
      if ((unint64_t)objc_msgSend(a3, "count") >= 2)
      {
        v37 = 1;
        do
        {
          v38 = (void *)objc_msgSend(a3, "objectAtIndex:", v37);
          v39 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v38, "identifier"));
          objc_msgSend(v35, "appendFormat:", CFSTR(",%@"), v39);
          objc_msgSend(v34, "setObject:forKey:", v38, v39);
          ++v37;
        }
        while (objc_msgSend(a3, "count") > v37);
      }
      objc_msgSend(v35, "appendString:", CFSTR(")"));
      if (sqlite3_get_table(self->_localizedDb, (const char *)objc_msgSend(v35, "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
      {
        if (pzErrmsg)
        {
          v40 = (const char *)objc_msgSend(v35, "UTF8String");
          printf("Error getting city localizations from query \"%s\": %s\n", v40, pzErrmsg);
          sqlite3_free(pzErrmsg);
        }
        v41 = pazResult;
        if (!pazResult)
          goto LABEL_65;
      }
      else
      {
        v42 = pnColumn[0];
        v43 = &pazResult[pnColumn[0]];
        pazResult = v43;
        if (pnColumn[1] >= 1)
        {
          v44 = 0;
          do
          {
            v45 = (void *)objc_msgSend(v34, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", atoi(pazResult[pnColumn[0] * v44])));
            if (v45)
            {
              v46 = v45;
              objc_msgSend(v45, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", pazResult[pnColumn[0] * v44 + 1]));
              if (pazResult[pnColumn[0] * v44 + 2])
                objc_msgSend(v46, "setCountryOverride:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:"));
            }
            ++v44;
          }
          while (v44 < pnColumn[1]);
          v42 = pnColumn[0];
          v43 = pazResult;
        }
        v41 = &v43[-v42];
        pazResult = v41;
      }
      sqlite3_free_table(v41);
LABEL_65:

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v47 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v52 != v49)
              objc_enumerationMutation(a3);
            -[ALCityManager _whileDatabaseLocked_modifyCityForGreen:](self, "_whileDatabaseLocked_modifyCityForGreen:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
          }
          v48 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
        }
        while (v48);
      }
      goto LABEL_72;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 16 * objc_msgSend(v5, "count") + 40);
    objc_msgSend(v15, "appendFormat:", CFSTR("SELECT code,name FROM locale_names WHERE code IN (\"%@\"), objc_msgSend(v14, "objectAtIndex:", 0));
    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
    {
      v16 = 1;
      do
        objc_msgSend(v15, "appendFormat:", CFSTR(",\"%@\"), objc_msgSend(v14, "objectAtIndex:", v16++));
      while (objc_msgSend(v14, "count") > v16);
    }
    objc_msgSend(v15, "appendString:", CFSTR(")"));
    if (sqlite3_get_table(self->_localizedDb, (const char *)objc_msgSend(v15, "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
    {
      if (pzErrmsg)
      {
        v17 = (const char *)objc_msgSend(v15, "UTF8String");
        printf("Error getting locale localizations from query \"%s\": %s\n", v17, pzErrmsg);
        sqlite3_free(pzErrmsg);
      }
      v18 = pazResult;
      if (!pazResult)
        goto LABEL_47;
    }
    else
    {
      v23 = pnColumn[0];
      v24 = &pazResult[pnColumn[0]];
      pazResult = v24;
      if (pnColumn[1] >= 1)
      {
        v25 = 0;
        do
        {
          v26 = objc_alloc(MEMORY[0x1E0CB3940]);
          v27 = (void *)objc_msgSend(v26, "initWithUTF8String:", pazResult[pnColumn[0] * v25 + 1]);
          v28 = (void *)objc_msgSend(v5, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", pazResult[pnColumn[0] * v25]));
          if (v28)
          {
            v29 = v28;
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v56;
              do
              {
                for (k = 0; k != v31; ++k)
                {
                  if (*(_QWORD *)v56 != v32)
                    objc_enumerationMutation(v29);
                  objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "setCountryName:", v27);
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
              }
              while (v31);
            }
          }

          ++v25;
        }
        while (v25 < pnColumn[1]);
        v23 = pnColumn[0];
        v24 = pazResult;
      }
      v18 = &v24[-v23];
      pazResult = v18;
    }
    sqlite3_free_table(v18);
LABEL_47:

    goto LABEL_48;
  }
  if (!objc_msgSend(a3, "count"))
    return;
  -[NSRecursiveLock lock](self->_databaseAccessRecursiveLock, "lock");
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v67;
    do
    {
      for (m = 0; m != v20; ++m)
      {
        if (*(_QWORD *)v67 != v21)
          objc_enumerationMutation(a3);
        -[ALCityManager _whileDatabaseLocked_modifyCityForGreen:](self, "_whileDatabaseLocked_modifyCityForGreen:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * m));
      }
      v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v20);
  }
LABEL_72:
  -[NSRecursiveLock unlock](self->_databaseAccessRecursiveLock, "unlock");
}

+ (id)newCitiesByIdentifierMap:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(v9, "identifier"));
        objc_msgSend(v4, "setObject:forKey:", v9, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)citiesWithIdentifiers:(id)a3
{
  id v3;
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 4 * objc_msgSend(v3, "count"));
  objc_msgSend(v5, "appendString:", objc_msgSend(v3, "objectAtIndex:", 0));
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v6 = 1;
    do
      objc_msgSend(v5, "appendFormat:", CFSTR(",%@"), objc_msgSend(v3, "objectAtIndex:", v6++));
    while (objc_msgSend(v3, "count") > v6);
  }
  v7 = -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier IN (%@)"), v5));
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = v3;
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v11);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "intValue");
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v7);
              v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              if (v13 == objc_msgSend(v18, "identifier"))
              {
                objc_msgSend(v20, "addObject:", v18);
                goto LABEL_20;
              }
            }
            v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v15)
              continue;
            break;
          }
        }
LABEL_20:
        ;
      }
      v3 = v11;
      v9 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }
  return v20;
}

- (id)_cityForClassicIdentifier:(id)a3 commaSearchOptions:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v6 = objc_msgSend(a3, "rangeOfString:options:", CFSTR(", "), a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v8 = v6;
  v9 = objc_msgSend(a3, "substringToIndex:", v6);
  v10 = (void *)objc_msgSend(a3, "substringFromIndex:", v8 + 2);
  v11 = objc_msgSend(v10, "length")
      ? objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name = \"%@\" and country_name = \"%@\"), v9, v10): objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name = \"%@\"), v9, v16);
  v12 = -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", v11);
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, "count"))
      return (id)objc_msgSend(v13, "objectAtIndex:", 0);
  }
  v14 = objc_msgSend(v10, "length")
      ? objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name LIKE \"%%%@%%\" and country_name LIKE \"%%%@%%\"), v9, v10): objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name LIKE \"%%%@%%\"), v9, v17);
  v15 = -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", v14);
  if (v15 && (v13 = v15, objc_msgSend(v15, "count")))
    return (id)objc_msgSend(v13, "objectAtIndex:", 0);
  else
    return 0;
}

- (id)cityForClassicIdentifier:(id)a3
{
  id result;

  result = -[ALCityManager _cityForClassicIdentifier:commaSearchOptions:](self, "_cityForClassicIdentifier:commaSearchOptions:", a3, 4);
  if (!result)
    return -[ALCityManager _cityForClassicIdentifier:commaSearchOptions:](self, "_cityForClassicIdentifier:commaSearchOptions:", a3, 0);
  return result;
}

- (id)bestCityForLegacyCity:(__CFArray *)a3
{
  const void *Identifier;
  id v6;
  id v7;
  CPSearchMatcher *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (CFArrayGetCount(a3) > 9)
  {
    Identifier = CPCityGetIdentifier(a3);
    if (Identifier)
    {
      v6 = -[ALCityManager cityForClassicIdentifier:](self, "cityForClassicIdentifier:", Identifier);
      if (v6)
        return v6;
    }
  }
  if (CFArrayGetCount(a3) <= 6)
    return 0;
  v7 = -[ALCityManager citiesMatchingName:](self, "citiesMatchingName:", CPCityGetLocalizedCityName(a3));
  if (objc_msgSend(v7, "count") == 1)
    v8 = 0;
  else
    v8 = -[CPSearchMatcher initWithSearchString:]([CPSearchMatcher alloc], "initWithSearchString:", CPCityGetLocalizedCountryName(a3));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
LABEL_12:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(v7);
      v6 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v12);
      if (!v8
        || -[CPSearchMatcher matches:](v8, "matches:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "countryName")))
      {
        break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v6 = 0;
        if (v10)
          goto LABEL_12;
        break;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (__CFArray)legacyCityForCity:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "unlocalizedName");
  v5 = objc_msgSend(a3, "unlocalizedCountryName");
  v6 = objc_msgSend(a3, "localeCode");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "latitude");
  objc_msgSend(v7, "addObject:", objc_msgSend(v8, "numberWithFloat:"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "longitude");
  objc_msgSend(v7, "addObject:", objc_msgSend(v9, "numberWithFloat:"));
  objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "identifier")));
  objc_msgSend(v7, "addObject:", objc_msgSend(a3, "timeZone"));
  if (v6)
    v10 = (const __CFString *)v6;
  else
    v10 = &stru_1E2882B60;
  objc_msgSend(v7, "addObject:", v10);
  objc_msgSend(v7, "addObject:", objc_msgSend(a3, "name"));
  objc_msgSend(v7, "addObject:", objc_msgSend(a3, "countryName"));
  objc_msgSend(v7, "addObject:", v4);
  objc_msgSend(v7, "addObject:", v5);
  objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v4, v5));
  return (__CFArray *)v7;
}

- (id)citiesMatchingQualifier:(id)a3
{
  _BOOL4 v5;
  const __CFString *v6;
  const char *v7;
  void *v8;
  id v9;
  int v10;
  ALCity *v11;
  ALCity *v12;
  char *pzErrmsg;
  int pnColumn[2];
  char **pazResult;

  *(_QWORD *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  -[NSRecursiveLock lock](self->_databaseAccessRecursiveLock, "lock");
  v5 = -[ALCityManager _shouldUseTablesAlternate1](self, "_shouldUseTablesAlternate1");
  v6 = CFSTR("cities");
  if (v5)
    v6 = CFSTR("cities_alternate_1");
  if (sqlite3_get_table(self->_db, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name,country_name,country_override,longitude,latitude,timezonename,yahoocode,identifier,code FROM %@ LEFT OUTER JOIN locales ON %@.locale_code = locales.code WHERE %@ ORDER BY name,country_name"), v6, v6, a3), "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      v7 = (const char *)objc_msgSend(a3, "UTF8String");
      printf("error getting cities matching \"%s\" - %s\n", v7, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult)
      sqlite3_free_table(pazResult);
    v8 = 0;
  }
  else
  {
    pazResult += pnColumn[0];
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v8 = (void *)objc_msgSend(v9, "initWithCapacity:", pnColumn[1]);
    if (pnColumn[1] >= 1)
    {
      v10 = 0;
      do
      {
        v11 = [ALCity alloc];
        v12 = -[ALCity initWithSQLRow:](v11, "initWithSQLRow:", &pazResult[pnColumn[0] * v10]);
        objc_msgSend(v8, "addObject:", v12);

        ++v10;
      }
      while (v10 < pnColumn[1]);
    }
    pazResult -= pnColumn[0];
    sqlite3_free_table(pazResult);
  }
  -[NSRecursiveLock unlock](self->_databaseAccessRecursiveLock, "unlock");
  return v8;
}

- (id)_whileDatabaseLocked_localeCodesMatchingQualifier:(id)a3
{
  const char *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  char *pzErrmsg;
  int pnColumn[2];
  char **pazResult;

  *(_QWORD *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  if (sqlite3_get_table(self->_db, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT code FROM locales WHERE %@"), a3), "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      v4 = (const char *)objc_msgSend(a3, "UTF8String");
      printf("error getting locale codes matching \"%s\" - %s\n", v4, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult)
      sqlite3_free_table(pazResult);
    v5 = 0;
  }
  else
  {
    pazResult += pnColumn[0];
    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v5 = (void *)objc_msgSend(v6, "initWithCapacity:", pnColumn[1]);
    if (pnColumn[1] >= 1)
    {
      v7 = 0;
      do
      {
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        v9 = (void *)objc_msgSend(v8, "initWithUTF8String:", pazResult[pnColumn[0] * v7]);
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
      }
      while (v7 < pnColumn[1]);
    }
    pazResult -= pnColumn[0];
    sqlite3_free_table(pazResult);
  }
  return v5;
}

- (void)_whileDatabaseLocked_ensureGreenKeyValueCaches
{
  double v3;
  ALSCGreenClient *greenClient;
  ALSCGreenClientProtocol **p_greenClient;

  if (!self->_greenKeyValueCacheExpirationDate
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "now"), "timeIntervalSinceDate:", self->_greenKeyValueCacheExpirationDate), v3 <= 0.0))
  {
    p_greenClient = &self->_greenClient;
    if (self->_greenClient)
      return;
    goto LABEL_6;
  }

  self->_greenKeyValueCacheExpirationDate = 0;
  p_greenClient = &self->_greenClient;
  greenClient = (ALSCGreenClient *)self->_greenClient;
  if (!greenClient)
  {
LABEL_6:
    greenClient = objc_alloc_init(ALSCGreenClient);
    *p_greenClient = (ALSCGreenClientProtocol *)greenClient;
  }
  if (!-[ALSCGreenClient valuesFinalized](greenClient, "valuesFinalized"))
    self->_greenKeyValueCacheExpirationDate = (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
  self->_greenKey1ValueCache = -[ALSCGreenClientProtocol key1Value](self->_greenClient, "key1Value");
  self->_greenKey2ValueCache = -[ALSCGreenClientProtocol key2Value](self->_greenClient, "key2Value");
  self->_greenKey3ValueCache = -[ALSCGreenClientProtocol key3Value](self->_greenClient, "key3Value");
}

- (void)_whileDatabaseLocked_modifyCityForGreen:(id)a3
{
  uint64_t v5;
  const __CFString *v6;

  -[ALCityManager _whileDatabaseLocked_ensureGreenKeyValueCaches](self, "_whileDatabaseLocked_ensureGreenKeyValueCaches");
  if (*(_WORD *)&self->_greenKey1ValueCache
    && objc_msgSend((id)objc_msgSend(a3, "localeCode"), "isEqualToString:", CFSTR("CN"))
    && objc_msgSend(a3, "identifier") != 118)
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppSupport")), "localizedStringForKey:value:table:", CFSTR("CHINA"), &stru_1E2882B60, CFSTR("Localizable"));
  }
  else
  {
    v5 = 0;
  }
  if (self->_greenKey2ValueCache
    && objc_msgSend((id)objc_msgSend(a3, "localeCode"), "isEqualToString:", CFSTR("TW")))
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppSupport")), "localizedStringForKey:value:table:", CFSTR("TAIPEI_TAIWAN_CHINA"), &stru_1E2882B60, CFSTR("Localizable"));
    objc_msgSend(a3, "setDisplayNameIncludingCountryShowsOnlyCountry:", 1);
  }
  if (self->_greenKey3ValueCache)
  {
    if (objc_msgSend(a3, "identifier") == 118)
    {
      v6 = CFSTR("HONG_KONG");
    }
    else
    {
      if (!objc_msgSend((id)objc_msgSend(a3, "localeCode"), "isEqualToString:", CFSTR("MO")))
        goto LABEL_15;
      v6 = CFSTR("MACAO");
    }
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppSupport")), "localizedStringForKey:value:table:", v6, &stru_1E2882B60, CFSTR("Localizable"));
  }
LABEL_15:
  if (v5)
  {
    objc_msgSend(a3, "setUnlocalizedCountryOverride:", v5);
    objc_msgSend(a3, "setCountryOverride:", v5);
  }
}

- (id)_cityForTimeZone:(id)a3 localeCode:(id)a4
{
  uint64_t v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  char **v11;
  uint64_t v12;
  id v13;
  char *pzErrmsg;
  int pnColumn[2];
  char **pazResult;

  if (objc_msgSend(a3, "length"))
  {
    if (!a4)
      a4 = &stru_1E2882B60;
    -[NSRecursiveLock lock](self->_databaseAccessRecursiveLock, "lock");
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timezonename = \"%@\" and locale_code = \"%@\"), a3, a4);
    v8 = -[ALCityManager _shouldUseTablesAlternate1](self, "_shouldUseTablesAlternate1");
    v9 = CFSTR("timezone_locale_to_city_map");
    if (v8)
      v9 = CFSTR("timezone_locale_to_city_map_alternate_1");
    *(_QWORD *)pnColumn = 0;
    pazResult = 0;
    pzErrmsg = 0;
    if (sqlite3_get_table(self->_db, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT city_id FROM %@ WHERE %@"), v9, v7), "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
    {
      if (pzErrmsg)
        sqlite3_free(pzErrmsg);
      if (pazResult)
        sqlite3_free_table(pazResult);
    }
    else
    {
      v11 = pazResult;
      if (pnColumn[1] < 1)
        v12 = 0;
      else
        v12 = atoi(pazResult[pnColumn[0]]);
      sqlite3_free_table(v11);
      if (pnColumn[1] >= 1)
      {
        v13 = -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier = %d"), v12));
        if (objc_msgSend(v13, "count"))
        {
          v10 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
LABEL_19:
          -[NSRecursiveLock unlock](self->_databaseAccessRecursiveLock, "unlock");
          return v10;
        }
      }
    }
    v10 = 0;
    goto LABEL_19;
  }
  return 0;
}

+ (id)_localeDictionaryFromSQLRow:(char *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *a3), CFSTR("code"));
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3[1]), CFSTR("name"));
  if (a3[2])
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:"), CFSTR("mainCity"));
  if (a3[3])
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:"), CFSTR("mapLongitude"));
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3[4]), CFSTR("mapLatitude"));
    if (a3[5])
    {
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:"), CFSTR("mapWidth"));
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3[6]), CFSTR("mapHeight"));
    }
  }
  return v4;
}

- (id)allLocales
{
  id v3;
  char **v4;
  int v5;
  char *pzErrmsg;
  int pnColumn[2];
  char **pazResult;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  -[NSRecursiveLock lock](self->_databaseAccessRecursiveLock, "lock");
  if (!sqlite3_get_table(self->_db, (const char *)objc_msgSend(CFSTR("select code,country_name,main_city,map_center_longitude,map_center_latitude,map_width,map_height from locales"), "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pnColumn[1] >= 1)
    {
      v5 = 0;
      do
      {
        ++v5;
        objc_msgSend(v3, "addObject:", objc_msgSend((id)objc_opt_class(), "_localeDictionaryFromSQLRow:", &pazResult[pnColumn[0] * v5]));
      }
      while (v5 < pnColumn[1]);
    }
    v4 = pazResult;
    goto LABEL_10;
  }
  if (pzErrmsg)
  {
    printf("couldn't get all locales: \"%s\"\n", pzErrmsg);
    sqlite3_free(pzErrmsg);
  }
  v4 = pazResult;
  if (pazResult)
LABEL_10:
    sqlite3_free_table(v4);
  -[NSRecursiveLock unlock](self->_databaseAccessRecursiveLock, "unlock");
  return v3;
}

- (id)localeWithCode:(id)a3
{
  const char *v5;
  void *v6;
  uint64_t v8;
  char *pzErrmsg;
  int pnColumn[2];
  char **pazResult;

  *(_QWORD *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  -[NSRecursiveLock lock](self->_databaseAccessRecursiveLock, "lock");
  if (sqlite3_get_table(self->_db, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select code,country_name,main_city,map_center_longitude,map_center_latitude,map_width,map_height from locales where code = \"%@\"), a3), "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      v5 = (const char *)objc_msgSend(a3, "UTF8String");
      printf("couldn't get locale with code %s: \"%s\"\n", v5, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult)
      sqlite3_free_table(pazResult);
    goto LABEL_6;
  }
  if (pnColumn[1])
    goto LABEL_8;
  sqlite3_free_table(pazResult);
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3), "regionCode");
  if (!v8)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 0;
  if (!sqlite3_get_table(self->_db, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select code,country_name,main_city,map_center_longitude,map_center_latitude,map_width,map_height from locales where code = \"%@\"), v8), "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pnColumn[1])
    {
LABEL_8:
      v6 = (void *)objc_msgSend((id)objc_opt_class(), "_localeDictionaryFromSQLRow:", &pazResult[pnColumn[0]]);
      sqlite3_free_table(pazResult);
    }
  }
LABEL_9:
  -[NSRecursiveLock unlock](self->_databaseAccessRecursiveLock, "unlock");
  return v6;
}

- (id)defaultCitiesForLocaleCode:(id)a3 options:(int)a4
{
  id v7;
  sqlite3 *db;
  void *v9;
  id v10;
  const char *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  unint64_t v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  char *pzErrmsg;
  int pnColumn[2];
  char **pazResult;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = -[ALCityManager localeWithCode:](self, "localeWithCode:");
  *(_QWORD *)pnColumn = 0;
  pazResult = 0;
  pzErrmsg = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v41 = a3;
    v42 = 1024;
    v43 = a4;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ALCityManager defaultCitiesForLocaleCode: %@ options: %x", buf, 0x12u);
  }
  -[NSRecursiveLock lock](self->_databaseAccessRecursiveLock, "lock");
  db = self->_db;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a3;
  if (v7)
    v10 = (id)objc_msgSend(v7, "objectForKey:", CFSTR("code"));
  if (sqlite3_get_table(db, (const char *)objc_msgSend((id)objc_msgSend(v9, "stringWithFormat:", CFSTR("select city_id from defaults where locale_code = \"%@\"), v10), "UTF8String"), &pazResult, &pnColumn[1], pnColumn, &pzErrmsg))
  {
    if (pzErrmsg)
    {
      v11 = (const char *)objc_msgSend(a3, "UTF8String");
      printf("couldn't get default cities for locale %s: \"%s\"\n", v11, pzErrmsg);
      sqlite3_free(pzErrmsg);
    }
    if (pazResult)
      sqlite3_free_table(pazResult);
    -[NSRecursiveLock unlock](self->_databaseAccessRecursiveLock, "unlock");
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v12)
      -[ALCityManager defaultCitiesForLocaleCode:options:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    return 0;
  }
  else
  {
    ++pazResult;
    v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v22 = (id)objc_msgSend(v21, "initWithCapacity:", pnColumn[1]);
    v23 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("mainCity"));
    if (pnColumn[1] >= 1)
    {
      v24 = 0;
      do
        objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", pazResult[v24++]));
      while (v24 < pnColumn[1]);
    }
    sqlite3_free_table(--pazResult);
    v25 = -[ALCityManager citiesWithIdentifiers:](self, "citiesWithIdentifiers:", v22);
    v20 = v25;
    if (v23 && objc_msgSend(v25, "count"))
    {
      v26 = 0;
      v27 = 0;
      do
      {
        v28 = (void *)objc_msgSend(v20, "objectAtIndex:", v26);
        v29 = objc_msgSend(v23, "intValue");
        v30 = objc_msgSend(v28, "identifier");
        if ((a4 & 1) != 0 && v29 == v30)
        {
          v31 = v28;
          objc_msgSend(v20, "removeObjectAtIndex:", v26);
          objc_msgSend(v20, "insertObject:atIndex:", v28, 0);

          v27 = v28;
        }
        ++v26;
      }
      while (objc_msgSend(v20, "count") > v26);
      if ((a4 & 2) != 0)
      {
        if (v27)
        {
          v32 = objc_msgSend(v27, "timeZone");
          if (objc_msgSend(v20, "count"))
          {
            v33 = 0;
            v34 = 0;
            do
            {
              v35 = (void *)objc_msgSend(v20, "objectAtIndex:", v33);
              if (v35 != v27 && objc_msgSend((id)objc_msgSend(v35, "timeZone"), "isEqualToString:", v32))
              {
                objc_msgSend(v20, "removeObjectAtIndex:", v33);
                --v34;
              }
              v33 = ++v34;
            }
            while (objc_msgSend(v20, "count") > (unint64_t)v34);
          }
        }
      }
    }
    -[NSRecursiveLock unlock](self->_databaseAccessRecursiveLock, "unlock");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v20;
      _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ALCityManager defaultCitiesForLocaleCode: returning %@", buf, 0xCu);
    }
  }
  return v20;
}

- (id)defaultCitiesForLocaleCode:(id)a3
{
  return -[ALCityManager defaultCitiesForLocaleCode:options:](self, "defaultCitiesForLocaleCode:options:", a3, 1);
}

- (id)defaultCitiesShownInWorldClock
{
  return -[ALCityManager citiesWithIdentifiers:](self, "citiesWithIdentifiers:", &unk_1E2889DD8);
}

- (id)defaultCityForTimeZone:(id)a3
{
  CFLocaleRef v5;
  id v6;

  v5 = CFLocaleCopyCurrent();
  v6 = -[ALCityManager _defaultCityForTimeZone:localeCode:](self, "_defaultCityForTimeZone:localeCode:", a3, MEMORY[0x193FF68B4]());
  if (v5)
    CFRelease(v5);
  return v6;
}

- (id)defaultCityForTimeZone:(id)a3 localeCode:(id)a4
{
  if (a4)
    return -[ALCityManager _defaultCityForTimeZone:localeCode:](self, "_defaultCityForTimeZone:localeCode:", a3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[ALCityManager defaultCityForTimeZone:localeCode:].cold.1((uint64_t)a3);
  return 0;
}

- (id)_defaultCityForTimeZone:(id)a3 localeCode:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  CFTimeZoneRef v18;
  const __CFTimeZone *v19;
  CFAbsoluteTime Current;
  double SecondsFromGMT;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = a3;
    v30 = 2112;
    v31 = a4;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ALCityManager defaultCityForTimeZone: %@ localeCode: %@", buf, 0x16u);
  }
  if (!a3
    || (!a4
     || (v7 = -[ALCityManager _cityForTimeZone:localeCode:](self, "_cityForTimeZone:localeCode:", objc_msgSend(a3, "name"), a4)) == 0&& (v7 = -[ALCityManager _cityForTimeZone:localeCode:](self, "_cityForTimeZone:localeCode:", objc_msgSend(a3, "name"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a4), "regionCode"))) == 0)&& (v7 = -[ALCityManager _cityForTimeZone:localeCode:](self, "_cityForTimeZone:localeCode:", objc_msgSend(a3, "name"), &stru_1E2882B60)) == 0)
  {
    v8 = -[ALCityManager citiesWithTimeZone:](self, "citiesWithTimeZone:", a3);
    v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "name"), "componentsSeparatedByString:", CFSTR("/"));
    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      v10 = objc_msgSend(v9, "objectAtIndex:", 1);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
LABEL_11:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v8);
          v7 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v14);
          if ((objc_msgSend((id)objc_msgSend(v7, "name"), "isEqualToString:", v10) & 1) != 0)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v12)
              goto LABEL_11;
            goto LABEL_19;
          }
        }
        if (v7)
          goto LABEL_33;
      }
    }
LABEL_19:
    if (objc_msgSend(v8, "count"))
    {
      v7 = (id)objc_msgSend(v8, "objectAtIndex:", 0);
      if (!a3)
        goto LABEL_33;
    }
    else
    {
      v7 = 0;
      if (!a3)
        goto LABEL_33;
    }
    if (a4 && !v7)
    {
      v15 = -[ALCityManager defaultCitiesForLocaleCode:options:](self, "defaultCitiesForLocaleCode:options:", a4, 1);
      if (v15
        && (v16 = v15, objc_msgSend(v15, "count"))
        && (v17 = (void *)objc_msgSend(v16, "objectAtIndexedSubscript:", 0),
            (v18 = CFTimeZoneCreateWithName((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)objc_msgSend(v17, "timeZone"), 1u)) != 0))
      {
        v19 = v18;
        Current = CFAbsoluteTimeGetCurrent();
        SecondsFromGMT = CFTimeZoneGetSecondsFromGMT((CFTimeZoneRef)a3, Current);
        if (SecondsFromGMT == CFTimeZoneGetSecondsFromGMT(v19, Current))
          v7 = (id)objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        else
          v7 = 0;
        CFRelease(v19);
      }
      else
      {
        v7 = 0;
      }
    }
  }
LABEL_33:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v7;
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ALCityManager defaultCityForTimeZone: returning %@", buf, 0xCu);
  }
  return v7;
}

- (id)citiesWithTimeZone:(id)a3
{
  return -[ALCityManager citiesMatchingQualifier:](self, "citiesMatchingQualifier:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timezonename = \"%@\"), objc_msgSend(a3, "name")));
}

- (void)dealloc
{
  sqlite3 *db;
  sqlite3 *localizedDb;
  objc_super v5;

  db = self->_db;
  if (db)
    sqlite3_close(db);
  localizedDb = self->_localizedDb;
  if (localizedDb)
    sqlite3_close(localizedDb);

  -[ALSCGreenClientProtocol release](self->_greenClient, "release");
  v5.receiver = self;
  v5.super_class = (Class)ALCityManager;
  -[ALCityManager dealloc](&v5, sel_dealloc);
}

- (BOOL)_shouldUseTablesAlternate1
{
  return +[ALCityManager willApplyTimeZoneChanges1](ALCityManager, "willApplyTimeZoneChanges1");
}

+ (BOOL)willApplyTimeZoneChanges1
{
  if (willApplyTimeZoneChanges1_onceToken != -1)
    dispatch_once(&willApplyTimeZoneChanges1_onceToken, &__block_literal_global_154);
  return willApplyTimeZoneChanges1_shouldUseTablesAlternate1;
}

void __42__ALCityManager_willApplyTimeZoneChanges1__block_invoke()
{
  id v0;
  char v1;
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = (id)MGCopyAnswer();
  if ((objc_msgSend(v0, "isEqualToString:", CFSTR("CH")) & 1) != 0)
    goto LABEL_2;
  willApplyTimeZoneChanges1_shouldUseTablesAlternate1 = objc_msgSend(v0, "isEqualToString:", CFSTR("ZA"));
  if ((willApplyTimeZoneChanges1_shouldUseTablesAlternate1 & 1) != 0
    || !objc_msgSend(v0, "isEqualToString:", CFSTR("ZP")))
  {
    goto LABEL_9;
  }
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), "countryCode");
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("CN")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("HK")) & 1) != 0)
  {
LABEL_2:
    v1 = 1;
  }
  else
  {
    v1 = objc_msgSend(v2, "isEqualToString:", CFSTR("MO"));
  }
  willApplyTimeZoneChanges1_shouldUseTablesAlternate1 = v1;
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", willApplyTimeZoneChanges1_shouldUseTablesAlternate1);
    _os_log_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ALCityManager _shouldUseTablesAlternate1 %@", (uint8_t *)&v3, 0xCu);
  }
}

- (CPSearchMatcher)citySearchMatcher
{
  return self->_citySearchMatcher;
}

- (void)init
{
  OUTLINED_FUNCTION_1_1(&dword_18EB0F000, MEMORY[0x1E0C81028], a3, "ALCityManager couldn't open main database: error %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0_2();
}

- (void)defaultCitiesForLocaleCode:(uint64_t)a3 options:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_18EB0F000, MEMORY[0x1E0C81028], a3, "ALCityManager defaultCitiesForLocaleCode: returning nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0_2();
}

- (void)defaultCityForTimeZone:(uint64_t)a1 localeCode:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 138412546;
  v2 = a1;
  v3 = 2112;
  v4 = 0;
  _os_log_error_impl(&dword_18EB0F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ALCityManager defaultCityForTimeZone: %@ localeCode: %@ returning nil", (uint8_t *)&v1, 0x16u);
}

@end
