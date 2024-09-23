@implementation _LSPersonaDatabase

- (id)initPrivately
{
  NSObject *v3;
  _LSPersonaDatabase *v4;
  _LSPersonaDatabase *v5;
  NSDictionary *cachedBundleIDToPersonasMap;
  NSString *cachedSystemPersonaUniqueString;
  objc_super v9;

  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer") & 1) != 0)
  {
    _LSDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[_LSPersonaDatabase initPrivately].cold.1(v3);

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_LSPersonaDatabase;
    v5 = -[_LSPersonaDatabase init](&v9, sel_init);
    v4 = v5;
    if (v5)
    {
      cachedBundleIDToPersonasMap = v5->_cachedBundleIDToPersonasMap;
      *(_QWORD *)&v5->_ivarLock._os_unfair_lock_opaque = 0;
      v5->_cachedBundleIDToPersonasMap = 0;

      cachedSystemPersonaUniqueString = v4->_cachedSystemPersonaUniqueString;
      v4->_cachedSystemPersonaUniqueString = 0;

      v4->_userManagementGenerationNumber = 0;
    }
  }
  return v4;
}

+ (id)sharedInstance
{
  objc_opt_self();
  if (+[_LSPersonaDatabase sharedInstance]::onceToken != -1)
    dispatch_once(&+[_LSPersonaDatabase sharedInstance]::onceToken, &__block_literal_global_82);
  return (id)+[_LSPersonaDatabase sharedInstance]::sharedInstance;
}

- (id)_getPersonaAttributesRetryingIfNecessary
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v2 = 0;
  v3 = 0;
  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0CB2FE0];
  v5 = *MEMORY[0x1E0CB2938];
  v6 = 10;
  do
  {

    objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v7, "listAllPersonaAttributesWithError:", &v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v25;

    if (objc_msgSend(v8, "count"))
      break;
    if (v3)
    {
      _LSDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v3;
        _os_log_error_impl(&dword_182882000, v9, OS_LOG_TYPE_ERROR, "error getting persona attributes list: %@", buf, 0xCu);
      }
    }
    else
    {
      _LSDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_error_impl(&dword_182882000, v10, OS_LOG_TYPE_ERROR, "UM returned empty array or nil (%@) but not an error!?", buf, 0xCu);
      }

      v26 = v5;
      v27 = CFSTR("placeholder for missing error; file a bug");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl(v4, 5, (uint64_t)"-[_LSPersonaDatabase _getPersonaAttributesRetryingIfNecessary]", 239, v9);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }

    usleep(0x186A0u);
    v2 = v8;
    --v6;
  }
  while (v6);
  if (!v8)
  {
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_LSPersonaDatabase _getPersonaAttributesRetryingIfNecessary].cold.1((uint64_t)v3, v11, v18, v19, v20, v21, v22, v23);
    goto LABEL_16;
  }
  if (!objc_msgSend(v8, "count"))
  {
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_LSPersonaDatabase _getPersonaAttributesRetryingIfNecessary].cold.2((uint64_t)v3, v11, v12, v13, v14, v15, v16, v17);
LABEL_16:

  }
  return v8;
}

- (void)getUncachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5
{
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id *v24;
  id v27;
  id obj;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[16];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v24 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Fetching persona data from usermanager.", buf, 2u);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_LSPersonaDatabase _getPersonaAttributesRetryingIfNecessary](self, "_getPersonaAttributesRetryingIfNecessary");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v27 = 0;
    v29 = 0;
    v30 = *(_QWORD *)v39;
    do
    {
      v10 = 0;
      v31 = v9;
      do
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(obj);
        v32 = v10;
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
        objc_msgSend(v11, "userPersonaUniqueString", v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (objc_msgSend(v11, "isSystemPersona"))
          {
            v13 = v12;

            v29 = v13;
            v14 = 3;
          }
          else if (objc_msgSend(v11, "isPersonalPersona"))
          {
            v15 = v12;

            v27 = v15;
            v14 = 1;
          }
          else
          {
            v16 = objc_msgSend(v11, "isEnterprisePersona");
            v14 = 2;
            if (!v16)
              v14 = 0;
          }
          v33 = v14;
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v11, "userPersonaBundleIDList");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v35 != v19)
                  objc_enumerationMutation(v17);
                v21 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
                objc_msgSend(v8, "objectForKeyedSubscript:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v22)
                {
                  v22 = (void *)objc_opt_new();
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, v21);
                }
                objc_msgSend(v7, "objectForKey:", v12);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v23)
                {
                  v23 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], v33, v12);
                  objc_msgSend(v7, "setObject:forKey:", v23, v12);
                }
                objc_msgSend(v22, "addObject:", v23);

              }
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v18);
          }

        }
        v10 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v9);
  }
  else
  {
    v27 = 0;
    v29 = 0;
  }

  if (a3)
    objc_storeStrong(a3, v8);
  if (a4)
    objc_storeStrong(a4, v29);
  if (v24)
    objc_storeStrong(v24, v27);

}

- (void)refreshFromUserManagementIfNecessary
{
  void *v3;
  unint64_t v4;
  id v5;
  NSObject *v6;
  NSDictionary *cachedBundleIDToPersonasMap;
  NSString *cachedSystemPersonaUniqueString;
  uint8_t v9[8];
  id v10;

  objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v4 = objc_msgSend(v3, "personaGenerationIdentifierWithError:", &v10);
  v5 = v10;

  if (self->_userManagementGenerationNumber != v4)
  {
    self->_userManagementGenerationNumber = v4;
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Persona list did update.", v9, 2u);
    }

    os_unfair_lock_lock(&self->_ivarLock);
    cachedBundleIDToPersonasMap = self->_cachedBundleIDToPersonasMap;
    self->_cachedBundleIDToPersonasMap = 0;

    cachedSystemPersonaUniqueString = self->_cachedSystemPersonaUniqueString;
    self->_cachedSystemPersonaUniqueString = 0;

    os_unfair_lock_unlock(&self->_ivarLock);
  }

}

- (void)getCachedBundleIDToPersonasWithAttributesMap:(id *)a3 systemPersonaUniqueString:(id *)a4 personalPersonaUniqueString:(id *)a5
{
  NSDictionary *cachedBundleIDToPersonasMap;
  os_unfair_lock_s *p_ivarLock;
  id v11;
  id v12;
  id v13;
  id obj;

  -[_LSPersonaDatabase refreshFromUserManagementIfNecessary](self, "refreshFromUserManagementIfNecessary");
  v13 = 0;
  obj = 0;
  v12 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_userManagementGenerationNumber
    && (cachedBundleIDToPersonasMap = self->_cachedBundleIDToPersonasMap) != 0)
  {
    obj = cachedBundleIDToPersonasMap;
    v13 = self->_cachedSystemPersonaUniqueString;
    v12 = self->_cachedPersonalPersonaUniqueString;
    p_ivarLock = &self->_ivarLock;
  }
  else
  {
    os_unfair_lock_unlock(&self->_ivarLock);
    os_unfair_lock_lock(&self->_uncachedCalloutLock);
    -[_LSPersonaDatabase getUncachedBundleIDToPersonasWithAttributesMap:systemPersonaUniqueString:personalPersonaUniqueString:](self, "getUncachedBundleIDToPersonasWithAttributesMap:systemPersonaUniqueString:personalPersonaUniqueString:", &obj, &v13, &v12);
    os_unfair_lock_lock(&self->_ivarLock);
    if (self->_userManagementGenerationNumber)
    {
      objc_storeStrong((id *)&self->_cachedBundleIDToPersonasMap, obj);
      objc_storeStrong((id *)&self->_cachedSystemPersonaUniqueString, v13);
      objc_storeStrong((id *)&self->_cachedPersonalPersonaUniqueString, v12);
    }
    os_unfair_lock_unlock(&self->_ivarLock);
    p_ivarLock = &self->_uncachedCalloutLock;
  }
  os_unfair_lock_unlock(p_ivarLock);
  if (a3)
    objc_storeStrong(a3, obj);
  if (a4)
    objc_storeStrong(a4, v13);
  v11 = v12;
  if (a5)
  {
    objc_storeStrong(a5, v12);
    v11 = v12;
  }

}

- (id)getBundleIDToPersonasWithAttributesMap
{
  id v3;
  id v5;

  -[_LSPersonaDatabase refreshFromUserManagementIfNecessary](self, "refreshFromUserManagementIfNecessary");
  v5 = 0;
  -[_LSPersonaDatabase getCachedBundleIDToPersonasWithAttributesMap:systemPersonaUniqueString:personalPersonaUniqueString:](self, "getCachedBundleIDToPersonasWithAttributesMap:systemPersonaUniqueString:personalPersonaUniqueString:", &v5, 0, 0);
  v3 = v5;

  return v3;
}

- (id)getPersonalPersonaUniqueString
{
  id v1;
  id v3;

  if (!a1)
    return 0;
  v3 = 0;
  objc_msgSend(a1, "getCachedBundleIDToPersonasWithAttributesMap:systemPersonaUniqueString:personalPersonaUniqueString:", 0, 0, &v3);
  v1 = v3;

  return v1;
}

- (id)personasWithAttributesForBundleIdentifier:(void *)a1
{
  id v3;
  void *v4;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) != 0
      || (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isUsingEphemeralStorage") & 1) != 0)
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(a1, "getBundleIDToPersonasWithAttributesMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        -[_LSPersonaDatabase getPersonalPersonaUniqueString](a1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], 1, v7);
          v9[0] = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (-[_LSPersonaDatabase personasWithAttributesForBundleIdentifier:]::once != -1)
            dispatch_once(&-[_LSPersonaDatabase personasWithAttributesForBundleIdentifier:]::once, &__block_literal_global_41);
          v4 = (void *)MEMORY[0x1E0C9AA60];
        }

      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)personasWithAttributesForPersonaUniqueStrings:(_QWORD *)a3 error:
{
  NSObject *v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  void *v42;
  uint8_t v43[128];
  uint8_t buf[4];
  int v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  if (a1)
  {
    objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "listAllPersonaWithAttributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v7 = v29;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v11, "userPersonaType") != 4)
          {
            objc_msgSend(v11, "userPersonaUniqueString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              objc_msgSend(v11, "userPersonaUniqueString");
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (!v13)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v3 = objc_claimAutoreleasedReturnValue();
                v14 = v3;
              }
              objc_msgSend(v6, "setObject:forKey:", v11, v14);
              if (!v13)

            }
            else
            {
              _LSDefaultLog();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                v15 = objc_msgSend(v11, "userPersonaType");
                *(_DWORD *)buf = 67109120;
                v45 = v15;
                _os_log_error_impl(&dword_182882000, v13, OS_LOG_TYPE_ERROR, "persona with type %d did not have a persona unique string, ignoring!", buf, 8u);
              }
            }

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v8);
    }

    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v31;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v34;
      while (2)
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v6, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (!v21)
          {

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no known persona with unique string %@"), v20);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = *MEMORY[0x1E0CB2938];
            v42 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 2, (uint64_t)"-[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]", 454, v27);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = 0;
            goto LABEL_28;
          }
          v23 = LSPersonaTypeForPersonaAttributes(v21);
          v24 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], v23, v20);
          objc_msgSend(v16, "addObject:", v24);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (v17)
          continue;
        break;
      }
    }
    v25 = 0;
LABEL_28:

    if (a3 && !v16)
      *a3 = objc_retainAutorelease(v25);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (_QWORD)generationIsCurrent:(_QWORD *)result
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "refreshFromUserManagementIfNecessary");
    if (a2)
      return (_QWORD *)(v3[5] == a2);
    else
      return 0;
  }
  return result;
}

- (_QWORD)currentGeneration
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "refreshFromUserManagementIfNecessary");
    return (_QWORD *)v1[5];
  }
  return result;
}

- (id)personasWithType:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _LSPersonaWithAttributes *v11;
  void *v12;
  _QWORD *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend((id)getUMUserManagerClass(), "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listAllPersonaWithAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (LSPersonaTypeForPersonaAttributes(v10) == a2)
        {
          v11 = [_LSPersonaWithAttributes alloc];
          objc_msgSend(v10, "userPersonaUniqueString", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:](v11, a2, v12);
          objc_msgSend(v3, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPersonalPersonaUniqueString, 0);
  objc_storeStrong((id *)&self->_cachedSystemPersonaUniqueString, 0);
  objc_storeStrong((id *)&self->_cachedBundleIDToPersonasMap, 0);
}

- (void)initPrivately
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "lightweight system server does not support keybagd; bailing",
    v1,
    2u);
}

- (void)_getPersonaAttributesRetryingIfNecessary
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a2, a3, "list of persona attributes was of length zero, last error: %@", a5, a6, a7, a8, 2u);
}

@end
