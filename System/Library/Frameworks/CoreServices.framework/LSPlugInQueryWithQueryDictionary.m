@implementation LSPlugInQueryWithQueryDictionary

- (id)_initWithQueryDictionary:(id)a3 applyFilter:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)LSPlugInQueryWithQueryDictionary;
  v8 = -[LSPlugInQuery _init](&v22, sel__init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[2];
    v8[2] = v9;

    objc_msgSend(v6, "ls_parseQueryForIdentifiers:", CFSTR("NSExtensionIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = (void *)v8[3];
    v8[3] = v12;

    objc_msgSend(v6, "ls_parseQueryForIdentifiers:", CFSTR("NSExtensionPointName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    v16 = (void *)v8[4];
    v8[4] = v15;

    v17 = objc_msgSend(v7, "copy");
    v18 = (void *)v8[5];
    v8[5] = v17;

    objc_msgSend(v6, "objectForKey:", CFSTR("LSShouldORIdentifiers"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)v8[2];
      v8[2] = 0;

    }
  }
  if (!_LSCurrentProcessMayMapDatabase() && pluginQueryFault(void)::onceToken != -1)
    dispatch_once(&pluginQueryFault(void)::onceToken, &__block_literal_global_59);

  return v8;
}

- (id)_queryDictionary
{
  return self->_queryDict;
}

- (id)systemMode
{
  os_unfair_lock_s *p_systemModeMutex;
  optional<NSString *> *p_cachedSystemMode;
  void *v5;
  uint64_t v6;
  NSString *val;
  NSString *v8;
  id result;

  p_systemModeMutex = (os_unfair_lock_s *)&self->_systemModeMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_systemModeMutex);
  p_cachedSystemMode = &self->_cachedSystemMode;
  if (self->_cachedSystemMode.__engaged_)
    goto LABEL_6;
  +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemMode");
  v6 = objc_claimAutoreleasedReturnValue();
  if (p_cachedSystemMode->__engaged_)
  {
    val = p_cachedSystemMode->var0.__val_;
    p_cachedSystemMode->var0.__val_ = (NSString *)v6;

  }
  else
  {
    p_cachedSystemMode->var0.__val_ = (NSString *)v6;
    p_cachedSystemMode->__engaged_ = 1;
  }

  if (p_cachedSystemMode->__engaged_)
  {
LABEL_6:
    v8 = p_cachedSystemMode->var0.__val_;
    os_unfair_lock_unlock(p_systemModeMutex);
    return v8;
  }
  else
  {
    std::__throw_bad_optional_access[abi:nn180100]();
    __break(1u);
  }
  return result;
}

- (BOOL)matchesPlugin:(unsigned int)a3 pluginData:(const LSPluginData *)a4 withDatabase:(id)a5
{
  id v8;
  uint64_t active_platform;
  unsigned int v10;
  NSDictionary *queryDict;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  id v18;
  void (**v19)(_QWORD);
  NSDictionary *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSDictionary *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  char v32;
  unsigned __int8 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  NSDictionary *v41;
  char v42;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  void (**v48)(_QWORD);
  uint64_t *v49;
  uint64_t *v50;
  const LSPluginData *v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  const LSPluginData *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[5];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;

  v8 = a5;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  active_platform = dyld_get_active_platform();
  if (_LSPluginIsValid(v8, a3, (uint64_t)a4, self->_filterBlock, 0, 0))
  {
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    if (getkMISMinSupportedSignatureVersion_ptr(void)::onceToken != -1)
      dispatch_once(&getkMISMinSupportedSignatureVersion_ptr(void)::onceToken, &__block_literal_global_99);
    if (getkMISMinSupportedSignatureVersion_ptr(void)::ptr)
      v10 = *(_DWORD *)getkMISMinSupportedSignatureVersion_ptr(void)::ptr;
    else
      v10 = 0;
    queryDict = self->_queryDict;
    v12 = objc_opt_class();
    -[NSDictionary objectForKey:](queryDict, "objectForKey:", CFSTR("LS:IncludeUnsupportedCodeSignatures"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12 && v13 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v14 = 0;
    }
    v15 = objc_msgSend(v14, "BOOLValue");

    if (a4->var0.signatureVersion >= v10)
      v16 = 1;
    else
      v16 = v15;
    v17 = MEMORY[0x1E0C809B0];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke;
    v62[3] = &unk_1E1041C30;
    v62[4] = &v63;
    _LSEnumerateSliceMask(a4->var0._sliceMask, v62);
    v56 = 0;
    v57 = &v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__37;
    v60 = __Block_byref_object_dispose__37;
    v61 = 0;
    v52[0] = v17;
    v52[1] = 3221225472;
    v52[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_45;
    v52[3] = &unk_1E1044A28;
    v54 = &v56;
    v18 = v8;
    v53 = v18;
    v55 = a4;
    v19 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](v52);
    v20 = self->_queryDict;
    if (!v20
      && (*((_BYTE *)v64 + 24) ? (v21 = v16) : (v21 = 0), v21 == 1 && a4->var0.platform == (_DWORD)active_platform))
    {
      *((_BYTE *)v68 + 24) = 1;
    }
    else if ((v16 & 1) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("LS:ExtensionPlatforms"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v22;
      v23 = objc_msgSend(v22, "count");
      v24 = (void *)MEMORY[0x1E0C99E60];
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", active_platform);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setWithObject:", v26);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[LSPlugInQueryWithQueryDictionary systemMode](self, "systemMode");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = self->_queryDict;
      v28 = objc_opt_class();
      -[NSDictionary objectForKey:](v27, "objectForKey:", CFSTR("LS:IncludeRestricted"));
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      if (v28 && v29 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        v30 = 0;
      }
      v31 = objc_msgSend(v30, "BOOLValue");

      if (v45)
        v32 = v31;
      else
        v32 = 1;
      if ((v32 & 1) != 0)
      {
        v33 = 0;
      }
      else
      {
        v19[2](v19);
        v34 = (void *)v57[5];
        v35 = objc_opt_class();
        objc_msgSend(v34, "objectForKey:", CFSTR("LSExtensionRestrictedSystemModes"));
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (v35 && v36 && (objc_opt_isKindOfClass() & 1) == 0)
        {

          v37 = 0;
        }
        v33 = objc_msgSend(v37, "containsObject:", v45);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4->var0.platform);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v25;
      v40 = objc_msgSend(v25, "containsObject:", v38);

      if (((v40 ^ 1 | v33) & 1) == 0)
      {
        v41 = self->_queryDict;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_2;
        v46[3] = &unk_1E1044A78;
        v49 = &v67;
        v51 = a4;
        v47 = v18;
        v48 = v19;
        v50 = &v56;
        -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v41, "enumerateKeysAndObjectsUsingBlock:", v46);

      }
    }
    else
    {
      *((_BYTE *)v68 + 24) = 0;
    }

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v63, 8);
  }
  v42 = *((_BYTE *)v68 + 24);
  _Block_object_dispose(&v67, 8);

  return v42;
}

BOOL __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _BOOL8 result;

  result = _LSIsCPUTypeSubtypeRunnable(a2, SHIDWORD(a2));
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_45(uint64_t a1, uint64_t a2, _LSPlistHint *a3)
{
  _LSDatabase *v4;
  unsigned int SDKDictionaryDataUnit;
  _LSPlistHint *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    _LSPlistGetDictionary(*(_LSDatabase **)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 48) + 136), a3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_LSDatabase **)(a1 + 32);
    SDKDictionaryDataUnit = _LSPluginGetSDKDictionaryDataUnit(v4, 0, *(_QWORD *)(a1 + 48));
    _LSPlistGetDictionary(v4, SDKDictionaryDataUnit, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ls_resolvePlugInKitInfoPlistWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  char v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v10 = a2;
  v7 = a3;
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("ENTITLEMENT:")) & 1) != 0
    || (objc_msgSend(v10, "hasPrefix:", CFSTR("NSUserElection")) & 1) != 0
    || _NSIsNSString() && (objc_msgSend(v7, "hasPrefix:", CFSTR("?CODEREQUIREMENT")) & 1) != 0
    || (_NSIsNSDictionary() & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("LS:ExtensionPlatforms")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("LS:IncludeUnsupportedArchitectures")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("LS:IncludeRestricted")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_10;
  }
  getValueForKeyFromPlugin((NSString *)v10, *(const LSPluginData **)(a1 + 64), *(_LSDatabase **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    getValueForKeyFromPlist((NSString *)v10, *(NSDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAA0]))
  {
    if (v8)
      v9 = objc_msgSend(v8, "isEqual:", MEMORY[0x1E0C9AAA0]);
    else
      v9 = 1;
    goto LABEL_24;
  }
  if (!v8)
  {
LABEL_27:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_28;
  }
  if (!objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    if (_NSIsNSString())
    {
      v9 = objc_msgSend(v8, "ls_matchesForPluginQuery:", v7);
LABEL_24:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
      goto LABEL_28;
    }
    if (_NSIsNSArray())
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_3;
      v11[3] = &unk_1E1044A50;
      v13 = *(_QWORD *)(a1 + 48);
      v12 = v7;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

      goto LABEL_28;
    }
    goto LABEL_27;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "isEqual:", MEMORY[0x1E0C9AAA0]) ^ 1;
LABEL_28:

LABEL_10:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

void __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (_NSIsNSString())
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "ls_matchesForPluginQuery:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int inited;
  id v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  LSPlugInQueryWithQueryDictionary *v40;
  id v41;
  id v42;
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (v6)
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[LSPlugInQueryWithQueryDictionary _enumerateWithXPCConnection:block:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  v42 = 0;
  v43 = 0;
  inited = _LSContextInitReturningError(&v43, &v42);
  v17 = v42;
  if (inited)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_extensionIdentifiers, "count")
      || -[NSArray count](self->_extensionPointIdentifiers, "count"))
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3321888768;
      v38[2] = __70__LSPlugInQueryWithQueryDictionary__enumerateWithXPCConnection_block___block_invoke;
      v38[3] = &unk_1E103E298;
      v39 = v18;
      v40 = self;
      v41 = v43;
      v19 = (void *)MEMORY[0x186DAE9BC](v38);
      v36 = 0u;
      v37 = 0u;
      v35 = 0u;
      v34 = 0u;
      v20 = self->_extensionIdentifiers;
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v20);
            _LSDatabaseGetStringForCFString(v43, *(const __CFString **)(*((_QWORD *)&v34 + 1) + 8 * i), 0);
            _LSDatabaseEnumeratingBindingMap();
          }
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
        }
        while (v21);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v24 = self->_extensionPointIdentifiers;
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v31 != v26)
              objc_enumerationMutation(v24);
            _LSDatabaseGetStringForCFString(v43, *(const __CFString **)(*((_QWORD *)&v30 + 1) + 8 * j), 0);
            _LSDatabaseEnumeratingBindingMap();
          }
          v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        }
        while (v25);
      }

    }
    else
    {
      v29 = v43;
      v28 = v18;
      _CSStoreEnumerateUnits();

    }
    -[LSPlugInQuery sort:pluginIDs:andYield:context:](self, "sort:pluginIDs:andYield:context:", 1, v18, v7, &v43);
    _LSContextDestroy(&v43);

  }
  else
  {
    v7[2](v7, 0, v17);
  }

}

void __70__LSPlugInQueryWithQueryDictionary__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:");

  if ((v5 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "matchesPlugin:pluginData:withDatabase:", a3, _LSGetPlugin(*(_QWORD *)(a1 + 48), a3), *(_QWORD *)(a1 + 48)))
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:");

    }
  }
}

void __70__LSPlugInQueryWithQueryDictionary__enumerateWithXPCConnection_block___block_invoke_60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  if (a3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "matchesPlugin:pluginData:withDatabase:", a2, a3, *(_QWORD *)(a1 + 48)))
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:");

    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSDictionary *queryDict;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LSPlugInQueryWithQueryDictionary;
  if (!-[LSPlugInQuery isEqual:](&v12, sel_isEqual_, v4) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  v6 = v5;
  queryDict = self->_queryDict;
  if (!queryDict)
  {
    objc_msgSend(v5, "_queryDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v10 = 1;
      goto LABEL_7;
    }
    queryDict = self->_queryDict;
  }
  objc_msgSend(v6, "_queryDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSDictionary isEqual:](queryDict, "isEqual:", v9);

LABEL_7:
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v3 = -[NSDictionary ls_hashQuery](self->_queryDict, "ls_hashQuery");
  v5.receiver = self;
  v5.super_class = (Class)LSPlugInQueryWithQueryDictionary;
  return -[LSPlugInQuery hash](&v5, sel_hash) ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_queryDict, CFSTR("query"));
}

- (LSPlugInQueryWithQueryDictionary)initWithCoder:(id)a3
{
  void *v4;
  LSPlugInQueryWithQueryDictionary *v5;

  objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("query"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LSPlugInQueryWithQueryDictionary _initWithQueryDictionary:applyFilter:](self, "_initWithQueryDictionary:applyFilter:", v4, 0);

  return v5;
}

- (void).cxx_destruct
{
  if (self->_cachedSystemMode.__engaged_)

  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifiers, 0);
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_queryDict, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 48) = 0;
  *((_BYTE *)self + 56) = 0;
  *((_DWORD *)self + 16) = 0;
  return self;
}

- (void)_enumerateWithXPCConnection:(uint64_t)a3 block:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_182882000, a1, a3, "LSPlugInQuery for plugin search called from a processs that cannot map the database", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_33();
}

@end
