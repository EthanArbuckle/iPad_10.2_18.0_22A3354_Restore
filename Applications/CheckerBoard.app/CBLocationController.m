@implementation CBLocationController

+ (id)sharedLocationController
{
  void *v2;
  CBLocationController *v3;
  void *v4;

  v2 = (void *)qword_10008BD10;
  if (!qword_10008BD10)
  {
    v3 = objc_alloc_init(CBLocationController);
    v4 = (void *)qword_10008BD10;
    qword_10008BD10 = (uint64_t)v3;

    v2 = (void *)qword_10008BD10;
  }
  return v2;
}

- (id)aliasDict
{
  NSDictionary *aliasDict;
  NSBundle *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;

  aliasDict = self->_aliasDict;
  if (!aliasDict)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CBLocationController, a2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", CFSTR("CountryAlias"), CFSTR("plist")));
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v6));
    v8 = self->_aliasDict;
    self->_aliasDict = v7;

    aliasDict = self->_aliasDict;
  }
  return aliasDict;
}

- (id)_checkForAliases:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v18;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocationController aliasDict](self, "aliasDict"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("countryAlias")));

    v7 = objc_msgSend(v4, "count");
    if (v7)
    {
      v8 = (unint64_t)v7;
      v9 = 0;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v10));
        if (v12)
        {
          v13 = objc_opt_class(NSArray, v11);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            v14 = v12;
          }
          else
          {
            v18 = v12;
            v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
          }
          v16 = v14;
          objc_msgSend(v4, "replaceObjectsInRange:withObjectsFromArray:", v9, 1, v14);
          v15 = (uint64_t)objc_msgSend(v16, "count");

        }
        else
        {
          v15 = 1;
        }
        v9 += v15;

      }
      while (v9 < v8);
    }

  }
  return v4;
}

- (id)_checkForAliasesOrInvalid:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  NSSet *validCountries;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = v4;
  if (!self->_validCountries)
  {
    v6 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale availableLocaleIdentifiers](NSLocale, "availableLocaleIdentifiers"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale canonicalLocaleIdentifierFromString:](NSLocale, "canonicalLocaleIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i)));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale componentsFromLocaleIdentifier:](NSLocale, "componentsFromLocaleIdentifier:", v12));

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSLocaleCountryCode));
          if (v14)
            -[NSSet addObject:](v6, "addObject:", v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v9);
    }

    validCountries = self->_validCountries;
    self->_validCountries = v6;

    v4 = v25;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocationController _checkForAliases:](self, "_checkForAliases:", v4));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
        if (-[NSSet containsObject:](self->_validCountries, "containsObject:", v21))
        {
          objc_msgSend(v5, "addObject:", v21);
        }
        else
        {
          v22 = CheckerBoardLogHandleForCategory(0);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v21;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Location: Found country '%@', but this is not a valid country code, ignoring", buf, 0xCu);
          }

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v18);
  }

  return v5;
}

- (id)_checkedArrayForString:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocationController _checkForAliases:](self, "_checkForAliases:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (CBLocationController)init
{
  CBLocationController *v2;
  CBLanguageComposite *v3;
  CBLanguageComposite *languageComposite;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBLocationController;
  v2 = -[CBLocationController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(CBLanguageComposite);
    languageComposite = v2->_languageComposite;
    v2->_languageComposite = v3;

    if (!v2->_guessedCountries)
    {
      if (+[CBUtilities isRunningOnPhysicalHardware](CBUtilities, "isRunningOnPhysicalHardware"))
        -[CBLocationController _startWifiScan](v2, "_startWifiScan");
      else
        -[CBLocationController _scanComplete:](v2, "_scanComplete:", &__NSArray0__struct);
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CBLocationController _closeWifiConnection](self, "_closeWifiConnection");
  v3.receiver = self;
  v3.super_class = (Class)CBLocationController;
  -[CBLocationController dealloc](&v3, "dealloc");
}

- (id)guessedLanguages
{
  CBLocationController *v2;
  void *v3;
  void *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSArray *guessedCountries;
  CBLocationController *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  NSArray *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v2 = self;
  if (-[NSArray count](self->_guessedCountries, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = v2;
    v5 = v2->_guessedCountries;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[IntlUtility preferredLanguagesForRegion:](IntlUtility, "preferredLanguagesForRegion:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i)));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reverseObjectEnumerator"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));

          objc_msgSend(v4, "addObject:", v12);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v7);
    }

    while (1)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = v4;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      if (!v14)
        break;
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
          if (v20)
          {
            if ((objc_msgSend(v3, "containsObject:", v20) & 1) == 0)
              objc_msgSend(v3, "addObject:", v20);
            objc_msgSend(v19, "removeLastObject");
            v16 = 1;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v15);

      if ((v16 & 1) == 0)
        goto LABEL_25;
    }

LABEL_25:
    v2 = v25;
  }
  else
  {
    v3 = 0;
  }
  v21 = CheckerBoardLogHandleForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    guessedCountries = v2->_guessedCountries;
    *(_DWORD *)buf = 138412546;
    v35 = guessedCountries;
    v36 = 2112;
    v37 = v3;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Language Location: Languages for countries %@ = %@", buf, 0x16u);
  }

  if (!v2->_firstGuessedLanguages)
    -[CBLocationController setFirstGuessedLanguages:](v2, "setFirstGuessedLanguages:", v3);
  return v3;
}

- (void)_startWifiScan
{
  CWFInterface *v3;
  CWFInterface *cwInterface;
  CWFInterface *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
  cwInterface = self->cwInterface;
  self->cwInterface = v3;

  v5 = self->cwInterface;
  if (!v5)
  {
    v6 = CheckerBoardLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Language Location: CWFInterface failed", v8, 2u);
    }

    v5 = self->cwInterface;
  }
  -[CWFInterface activate](v5, "activate");
  -[CBLocationController _scanWifiList](self, "_scanWifiList");
}

- (void)_scanWifiList
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  CWFInterface *cwInterface;
  _QWORD v9[5];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Language Location: started wifi scan", buf, 2u);
  }

  v5 = objc_alloc_init((Class)CWFScanParameters);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_100078F10));
  objc_msgSend(v5, "setIncludeProperties:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[CBLocationController setWirelessScanStartDate:](self, "setWirelessScanStartDate:", v7);

  cwInterface = self->cwInterface;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000166B4;
  v9[3] = &unk_100075898;
  v9[4] = self;
  -[CWFInterface performScanWithParameters:reply:](cwInterface, "performScanWithParameters:reply:", v5, v9);

}

- (void)_scanComplete:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  char *v7;
  id v8;
  id v9;
  char *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *m;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  id v35;
  void *v36;
  CBLocationController *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  v4 = a3;
  v5 = v4;
  if (self->_guessedCountries)
    goto LABEL_44;
  v6 = (char *)objc_msgSend(v4, "count");
  if (!v6)
    goto LABEL_44;
  v7 = v6;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_alloc_init((Class)NSCountedSet);
  for (i = 0; i != v7; ++i)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "countryCode"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "countryCode"));
      objc_msgSend(v8, "addObject:", v13);

    }
  }
  v38 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocationController _checkForAliasesOrInvalid:](self, "_checkForAliasesOrInvalid:", v8));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v16);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v20)
  {
    v37 = self;
    v21 = 0;
    v22 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(v19);
        v24 = objc_msgSend(v19, "countForObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)k), v37);
        if (v24 > v21)
          v21 = v24;
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v20);

    if (!v21)
    {
      v20 = 0;
      self = v37;
      goto LABEL_36;
    }
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = v19;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
      do
      {
        for (m = 0; m != v27; m = (char *)m + 1)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)m);
          if (objc_msgSend(v25, "countForObject:", v30) == v21)
            objc_msgSend(v20, "addObject:", v30);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      }
      while (v27);
    }
    self = v37;
  }

LABEL_36:
  v31 = objc_msgSend(v20, "count");
  v32 = CheckerBoardLogHandleForCategory(0);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v34)
    {
      v35 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134217984;
      v52 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Language Location: Adding %lu countries from Wifi scan.", buf, 0xCu);
    }

    -[CBLocationController setGuessedCountries:](self, "setGuessedCountries:", v20);
  }
  else
  {
    if (v34)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Language Location: No valid countries in Wifi scan.", buf, 2u);
    }

  }
LABEL_44:
  -[CBLocationController _closeWifiConnection](self, "_closeWifiConnection");
  -[CBLocationController updateLanguageComposite](self, "updateLanguageComposite");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v36, "postNotificationName:object:", CFSTR("CBLanguageCompositeWifiScanComplete"), 0);

}

- (void)_closeWifiConnection
{
  CWFInterface *cwInterface;
  CWFInterface *v4;

  cwInterface = self->cwInterface;
  if (cwInterface)
  {
    -[CWFInterface invalidate](cwInterface, "invalidate");
    v4 = self->cwInterface;
    self->cwInterface = 0;

  }
}

- (void)reset
{
  -[CBLocationController setGuessedCountries:](self, "setGuessedCountries:", 0);
}

- (void)updateLanguageComposite
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IntlUtility baseSystemLanguages](IntlUtility, "baseSystemLanguages"));
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", v9));
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForLanguage:context:", v9, 4));

        if (!v11)
          v11 = v9;
        objc_msgSend(v3, "setValue:forKey:", v11, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocationController guessedLanguages](self, "guessedLanguages"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[IntlUtility baseLanguageIdentifierFromIdentifier:](IntlUtility, "baseLanguageIdentifierFromIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j)));
        objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  objc_msgSend(v13, "addObjectsFromArray:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "array"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocationController languageComposite](self, "languageComposite"));
  objc_msgSend(v21, "setLanguageCodes:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBLocationController languageComposite](self, "languageComposite"));
  objc_msgSend(v22, "setLanguageStrings:", v3);

}

- (void)selectLanguage:(id)a3 restartAfterCompletion:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = (void (**)(_QWORD))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "languageCode"));

  if (v7 != v16)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBLocationController sharedLocationController](CBLocationController, "sharedLocationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "guessedCountries"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

    v11 = v16;
    if (objc_msgSend(v10, "length"))
    {
      v12 = objc_claimAutoreleasedReturnValue(+[IntlUtility languageIdentifierFromIdentifier:withRegion:](IntlUtility, "languageIdentifierFromIdentifier:withRegion:", v11, v10));

      v11 = (id)v12;
    }
    +[NSLocale setLocaleAfterLanguageChange:](NSLocale, "setLocaleAfterLanguageChange:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localeIdentifier"));
    +[NSLocale setLanguageToPreferredLanguages:fallback:](NSLocale, "setLanguageToPreferredLanguages:fallback:", v11, v14);

    if (v5)
      v5[2](v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBSystemService sharedInstance](FBSystemService, "sharedInstance"));
    objc_msgSend(v15, "exitAndRelaunch:", 1);

  }
}

- (NSArray)guessedCountries
{
  return self->_guessedCountries;
}

- (void)setGuessedCountries:(id)a3
{
  objc_storeStrong((id *)&self->_guessedCountries, a3);
}

- (NSArray)firstGuessedLanguages
{
  return self->_firstGuessedLanguages;
}

- (void)setFirstGuessedLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_firstGuessedLanguages, a3);
}

- (NSDate)wirelessScanStartDate
{
  return self->_wirelessScanStartDate;
}

- (void)setWirelessScanStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_wirelessScanStartDate, a3);
}

- (CBLanguageComposite)languageComposite
{
  return self->_languageComposite;
}

- (void)setLanguageComposite:(id)a3
{
  objc_storeStrong((id *)&self->_languageComposite, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageComposite, 0);
  objc_storeStrong((id *)&self->_wirelessScanStartDate, 0);
  objc_storeStrong((id *)&self->_firstGuessedLanguages, 0);
  objc_storeStrong((id *)&self->cwInterface, 0);
  objc_storeStrong((id *)&self->_validCountries, 0);
  objc_storeStrong((id *)&self->_aliasDict, 0);
  objc_storeStrong((id *)&self->_guessedCountries, 0);
}

@end
