@implementation UTTypeRecord

- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  NSObject *v18;

  if (a6)
  {
    -[UTTypeRecord declaringBundleRecord](self, "declaringBundleRecord", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a6->var2 & 0x2000) != 0 || !a6->var11)
    {
      v17 = v10;
      v11 = 0;
      v15 = 0;
      goto LABEL_19;
    }
    v11 = (void *)_CSStringCopyCFString();
    v12 = _LSBundleGet(a3->db, a6->var5);
    v13 = v12;
    if (v12 && *(_DWORD *)(v12 + 460))
    {
      v14 = (void *)_CSStringCopyCFString();
      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:relativeToURL:", v14, 1, v10);

        if (v15)
          v16 = v11 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v11, 1);
          v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

          return v17;
        }
LABEL_18:
        v17 = 0;
        goto LABEL_19;
      }
      _LSDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[UTTypeRecord(IconServices) iconResourceBundleURLWithContext:tableID:unitID:unitBytes:].cold.1((uint64_t)self, (unsigned int *)(v13 + 460), v18);

    }
    v15 = 0;
    goto LABEL_18;
  }
  v17 = 0;
  return v17;
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  uint64_t var10;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (a6)
  {
    var10 = a6->var10;
    if ((_DWORD)var10)
    {
      +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, var10, *(_QWORD *)&a5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_expensiveDictionaryRepresentation");
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v10;
    }
    else
    {
      v11 = 0;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    _UTTypeGetIconName(a3->db, (uint64_t)a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("UTTypeIconName"));
    _UTTypeGetIconNames(a3->db, (uint64_t)a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("UTTypeIconFiles"));
    _UTTypeGetGlyphName(a3->db, (uint64_t)a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("UTTypeGlyphName"));
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "addEntriesFromDictionary:", v11);
      v16 = objc_msgSend(v12, "copy");

      v11 = (void *)v16;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_LSRecord_resolve_iconResourceBundleURL
{
  id v2;

  v2 = -[UTTypeRecord iconResourceBundleURL](self, "iconResourceBundleURL");
}

- (NSURL)iconResourceBundleURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconResourceBundleURLWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2;

  v2 = -[UTTypeRecord iconDictionary](self, "iconDictionary");
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  id v7;

  -[UTTypeRecord identifier](self, "identifier", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedDescription);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v7, "detach");

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[UTTypeRecord identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  __CFString *v5;
  BOOL v6;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  -[UTTypeRecord identifier](self, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = UTTypeEqual(v5, (CFStringRef)objc_msgSend(a3, "identifier")) != 0;

  return v6;
}

- (id)preferredTagOfClass:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[UTTypeRecord tagSpecification](self, "tagSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:ofClass:valuesOfClass:", a3, v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5
{
  LaunchServices::DatabaseContext *MayMapDatabase;
  _LSDServiceDomain *v9;
  LSContext *v10;
  int v11;
  void *v12;
  _UTDeclaredTypeRecord *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  unsigned int v21;
  int v22;
  void **CurrentContext;
  id v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__52;
  v31 = __Block_byref_object_dispose__52;
  v32 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (!(_DWORD)MayMapDatabase)
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__UTTypeRecord_typeRecordWithTag_ofClass_conformingToIdentifier___block_invoke_2;
    v20[3] = &unk_1E1046290;
    v20[4] = &v27;
    objc_msgSend(v12, "getTypeRecordWithTag:ofClass:conformingToIdentifier:completionHandler:", a3, a4, a5, v20);

    goto LABEL_16;
  }
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
  v24 = 0;
  v25 = 0;
  v26 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v10 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0);

  if (v10)
  {
    v22 = 0;
    if (a5)
    {
      if (!_UTGetActiveTypeForCFStringIdentifier(v10->db, (const __CFString *)a5, &v22))
        goto LABEL_10;
      v11 = v22;
    }
    else
    {
      v11 = 0;
    }
    v21 = 0;
    if (_UTTypeGetActiveIdentifierForTag(v10->db, (const __CFString *)a4, (const __CFString *)a3, v11, (uint64_t)&v21))
    {
      v13 = [_UTDeclaredTypeRecord alloc];
      v14 = -[LSRecord _initWithContext:tableID:unitID:](v13, "_initWithContext:tableID:unitID:", v10, v10->db->schema.utypeTable, v21);
LABEL_11:
      v15 = (void *)v28[5];
      v28[5] = v14;

      goto LABEL_12;
    }
LABEL_10:
    fallbackDynamicOrBaseTypeRecord(v10, (const __CFString *)a3, (__CFString *)a4, (__CFString *)a5);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  if (CurrentContext && v25)
    _LSContextDestroy(CurrentContext);
  v16 = v24;
  CurrentContext = 0;
  v24 = 0;

  v25 = 0;
  v17 = v26;
  v26 = 0;

LABEL_16:
  v18 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return (UTTypeRecord *)v18;
}

- (NSString)localizedDescription
{
  void *v2;
  void *v3;

  -[UTTypeRecord _localizedDescription](self, "_localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)_typeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4
{
  _BOOL8 v4;
  LaunchServices::DatabaseContext *MayMapDatabase;
  _LSDServiceDomain *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  void **CurrentContext;
  id v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__52;
  v26 = __Block_byref_object_dispose__52;
  v27 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    v19 = 0;
    v20 = 0;
    v21 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v9 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0);

    if (v9)
    {
      objc_msgSend(a1, "_typeRecordWithContext:identifier:allowUndeclared:", v9, a3, v4);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v23[5];
      v23[5] = v10;

    }
    if (CurrentContext && v20)
      _LSContextDestroy(CurrentContext);
    v12 = v19;
    CurrentContext = 0;
    v19 = 0;

    v20 = 0;
    v13 = v21;
    v21 = 0;

  }
  else if (_UTTypeIdentifierIsValid((CFStringRef)a3))
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_80);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__UTTypeRecord__typeRecordWithIdentifier_allowUndeclared___block_invoke_2;
    v17[3] = &unk_1E1046290;
    v17[4] = &v22;
    objc_msgSend(v14, "getTypeRecordWithIdentifier:allowUndeclared:completionHandler:", a3, v4, v17);

  }
  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

+ (id)_typeRecordWithContext:(LSContext *)a3 identifier:(id)a4 allowUndeclared:(BOOL)a5
{
  _BOOL4 v5;
  _UTDeclaredTypeRecord *v9;
  unsigned int v10;

  v5 = a5;
  v10 = 0;
  if (_UTTypeIdentifierIsDynamic((const __CFString *)a4))
    return -[_UTDynamicTypeRecord _initWithContext:dynamicUTI:]([_UTDynamicTypeRecord alloc], "_initWithContext:dynamicUTI:", a3, a4);
  if (_UTGetActiveTypeForCFStringIdentifier(a3->db, (const __CFString *)a4, &v10))
  {
    v9 = [_UTDeclaredTypeRecord alloc];
    return -[LSRecord _initWithContext:tableID:unitID:](v9, "_initWithContext:tableID:unitID:", a3, a3->db->schema.utypeTable, v10);
  }
  else if (v5)
  {
    return -[_UTUndeclaredTypeRecord _initWithContext:identifier:]([_UTUndeclaredTypeRecord alloc], "_initWithContext:identifier:", a3, a4);
  }
  else
  {
    return 0;
  }
}

+ (BOOL)_typeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v6 = (void *)MEMORY[0x186DAE7A0](a1, a2);
  if (_LSCurrentProcessMayMapDatabase())
  {
    +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "conformsToTypeIdentifier:", a4);
      *((_BYTE *)v14 + 24) = v9;
    }
  }
  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_28_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__UTTypeRecord__typeIdentifier_conformsToTypeIdentifier___block_invoke_2;
    v12[3] = &unk_1E10463E8;
    v12[4] = &v13;
    objc_msgSend(v8, "getWhetherTypeIdentifier:conformsToTypeIdentifier:completionHandler:", a3, a4, v12);
  }

  objc_autoreleasePoolPop(v6);
  v10 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

+ (UTTypeRecord)typeRecordWithIdentifier:(id)a3
{
  return (UTTypeRecord *)objc_msgSend(a1, "_typeRecordWithIdentifier:allowUndeclared:", a3, 0);
}

void __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v6;
  id v7;
  id v8;

  if ((*(_BYTE *)(a4 + 8) & 1) != 0)
  {
    v6 = *(_DWORD *)(a1 + 48);
    if (!v6 || _UTTypeConformsTo(**(void ***)(a1 + 40), a3, v6))
    {
      v7 = -[LSRecord _initWithContext:tableID:unitID:]([_UTDeclaredTypeRecord alloc], "_initWithContext:tableID:unitID:");
      if (v7)
      {
        v8 = v7;
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
        v7 = v8;
      }

    }
  }
}

+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5
{
  LaunchServices::DatabaseContext *MayMapDatabase;
  _LSDServiceDomain *v9;
  LSContext *v10;
  id v11;
  _LSDatabase *db;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  LSContext *v25;
  int v26;
  int v27;
  void **CurrentContext;
  id v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__52;
  v36 = __Block_byref_object_dispose__52;
  v37 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    v29 = 0;
    v30 = 0;
    v31 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v10 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0);

    if (v10)
    {
      v27 = 0;
      if (!a5 || _UTGetActiveTypeForCFStringIdentifier(v10->db, (const __CFString *)a5, &v27))
      {
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        db = v10->db;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke;
        v23[3] = &unk_1E1046300;
        v26 = v27;
        v25 = v10;
        v13 = v11;
        v24 = v13;
        _UTEnumerateTypesForTag(db, (const __CFString *)a4, (const __CFString *)a3, v23);
        if (!objc_msgSend(v13, "count"))
        {
          fallbackDynamicOrBaseTypeRecord(v10, (const __CFString *)a3, (__CFString *)a4, (__CFString *)a5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v13, "addObject:", v14);

        }
        v15 = objc_msgSend(v13, "copy");
        v16 = (void *)v33[5];
        v33[5] = v15;

      }
    }
    if (CurrentContext && v30)
      _LSContextDestroy(CurrentContext);
    v17 = v29;
    CurrentContext = 0;
    v29 = 0;

    v30 = 0;
    v18 = v31;
    v31 = 0;

  }
  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_9_2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke_3;
    v22[3] = &unk_1E1046328;
    v22[4] = &v32;
    objc_msgSend(v19, "getTypeRecordsWithTag:ofClass:conformingToIdentifier:completionHandler:", a3, a4, a5, v22);

  }
  v20 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v20;
}

uint64_t __57__UTTypeRecord__typeIdentifier_conformsToTypeIdentifier___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (id)enumerator
{
  return -[_LSDBEnumerator _initWithContext:]([_LSTypeEnumerator alloc], "_initWithContext:", 0);
}

void __58__UTTypeRecord__typeRecordWithIdentifier_allowUndeclared___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (UTTypeRecord)typeRecordWithPotentiallyUndeclaredIdentifier:(id)a3
{
  return (UTTypeRecord *)objc_msgSend(a1, "_typeRecordWithIdentifier:allowUndeclared:", a3, 1);
}

+ (id)typeRecordsWithIdentifiers:(id)a3
{
  LaunchServices::DatabaseContext *MayMapDatabase;
  _LSDServiceDomain *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void **CurrentContext;
  id v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__52;
  v36 = __Block_byref_object_dispose__52;
  v37 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    v29 = 0;
    v30 = 0;
    v31 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v7 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v6, 0);

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v9 = a3;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v25 != v11)
              objc_enumerationMutation(v9);
            v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(a1, "_typeRecordWithContext:identifier:allowUndeclared:", v7, v13, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v13);

          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
        }
        while (v10);
      }

      v15 = objc_msgSend(v8, "copy");
      v16 = (void *)v33[5];
      v33[5] = v15;

    }
    if (CurrentContext && v30)
      _LSContextDestroy(CurrentContext);
    v17 = v29;
    CurrentContext = 0;
    v29 = 0;

    v30 = 0;
    v18 = v31;
    v31 = 0;

  }
  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_3_0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __43__UTTypeRecord_typeRecordsWithIdentifiers___block_invoke_2;
    v23[3] = &unk_1E10462B8;
    v23[4] = &v32;
    objc_msgSend(v19, "getTypeRecordsWithIdentifiers:completionHandler:", a3, v23);

  }
  v20 = (void *)v33[5];
  if (!v20)
  {
    v33[5] = MEMORY[0x1E0C9AA70];

    v20 = (void *)v33[5];
  }
  v21 = v20;
  _Block_object_dispose(&v32, 8);

  return v21;
}

void __43__UTTypeRecord_typeRecordsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5
{
  void *v8;
  void *v9;

  objc_msgSend(a5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "typeRecordWithTag:ofClass:conformingToIdentifier:", a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (UTTypeRecord *)v9;
}

+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5
{
  void *v8;
  void *v9;

  objc_msgSend(a5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "typeRecordsWithTag:ofClass:conformingToIdentifier:", a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __65__UTTypeRecord_typeRecordWithTag_ofClass_conformingToIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4
{
  return (UTTypeRecord *)objc_msgSend(a1, "typeRecordWithTag:ofClass:conformingToIdentifier:", a3, a4, 0);
}

+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4
{
  return (id)objc_msgSend(a1, "typeRecordsWithTag:ofClass:conformingToIdentifier:", a3, a4, 0);
}

+ (id)typeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4
{
  __CFString *v5;
  LaunchServices::DatabaseContext *MayMapDatabase;
  _LSDServiceDomain *v7;
  void **v8;
  uint64_t EntryWithClass;
  void *v10;
  void *v11;
  int v12;
  unsigned int TypeData;
  int v14;
  void *v15;
  int v16;
  int v17;
  unsigned int TypePackage;
  __CFString *v19;
  _UTDeclaredTypeRecord *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v27[5];
  unsigned int v28;
  int v29;
  unsigned int v30;
  void **CurrentContext;
  id v32;
  char v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v5 = (__CFString *)a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__52;
  v39 = __Block_byref_object_dispose__52;
  v40 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (!(_DWORD)MayMapDatabase)
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_11);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__UTTypeRecord_typeRecordForImportedTypeWithIdentifier_conformingToIdentifier___block_invoke_2;
    v27[3] = &unk_1E1046290;
    v27[4] = &v35;
    objc_msgSend(v11, "getTypeRecordForImportedTypeWithIdentifier:conformingToIdentifier:completionHandler:", a3, v5, v27);

    goto LABEL_25;
  }
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
  v32 = 0;
  v33 = 0;
  v34 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v8 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v7, 0);

  if (v8)
  {
    v30 = 0;
    if (!_UTGetActiveTypeForCFStringIdentifier(*v8, (const __CFString *)a3, &v30)
      || (EntryWithClass = _LSBindingListGetEntryWithClass(*v8)) == 0
      || !*(_DWORD *)(EntryWithClass + 4)
      || !*(_DWORD *)(EntryWithClass + 8))
    {
LABEL_19:
      if (v30)
      {
        v20 = [_UTDeclaredTypeRecord alloc];
        v21 = -[LSRecord _initWithContext:tableID:unitID:](v20, "_initWithContext:tableID:unitID:", v8, *((unsigned int *)*v8 + 8), v30);
        v22 = (void *)v36[5];
        v36[5] = v21;

      }
      goto LABEL_21;
    }
    v29 = 0;
    v10 = *v8;
    if (v5)
    {
      _UTGetActiveTypeForCFStringIdentifier(*v8, v5, &v29);
      goto LABEL_15;
    }
    v12 = v30;
    TypeData = _UTTypeGetTypeData((_LSDatabase *)*v8);
    v14 = _UTTypeConformsTo(v10, v12, TypeData);
    v15 = *v8;
    if (v14)
    {
      v16 = _UTTypeGetTypeData((_LSDatabase *)*v8);
    }
    else
    {
      v17 = v30;
      TypePackage = _UTTypeGetTypePackage((_LSDatabase *)*v8);
      if (!_UTTypeConformsTo(v15, v17, TypePackage))
        goto LABEL_15;
      v16 = _UTTypeGetTypePackage((_LSDatabase *)*v8);
    }
    v29 = v16;
LABEL_15:
    v19 = (__CFString *)_CSStringCopyCFString();
    if (v19)
    {
      v28 = 0;
      if (_UTTypeGetActiveIdentifierForTag(*v8, CFSTR("public.filename-extension"), v19, v29, (uint64_t)&v28))
        v30 = v28;
    }

    goto LABEL_19;
  }
LABEL_21:
  if (CurrentContext && v33)
    _LSContextDestroy(CurrentContext);
  v23 = v32;
  CurrentContext = 0;
  v32 = 0;

  v33 = 0;
  v24 = v34;
  v34 = 0;

LABEL_25:
  v25 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v25;
}

void __79__UTTypeRecord_typeRecordForImportedTypeWithIdentifier_conformingToIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)typeRecordForPromiseAtURL:(id)a3 error:(id *)a4
{
  FSNode *v6;
  FSNode *v7;
  _LSDServiceDomain *v8;
  uint64_t v9;
  void *v10;
  _LSDServiceDomain *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void **CurrentContext;
  id v18;
  char v19;
  id v20;

  v6 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", a3, 0, a4);
  v7 = v6;
  if (v6)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)v6);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v9 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0);

    if (v9)
    {
      objc_msgSend(a1, "_typeRecordWithContext:forPromiseAtNode:error:", v9, v7, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v12 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v11, 0);

      if (v12)
        v13 = 0;
      else
        v13 = objc_retainAutorelease(v20);
      v10 = 0;
      *a4 = v13;
    }
    else
    {
      v10 = 0;
    }
    if (CurrentContext && v19)
      _LSContextDestroy(CurrentContext);
    v14 = v18;
    CurrentContext = 0;
    v18 = 0;

    v19 = 0;
    v15 = v20;
    v20 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)identifier
{
  return (NSString *)&stru_1E10473A0;
}

- (NSNumber)version
{
  return 0;
}

- (BOOL)isDynamic
{
  return 0;
}

- (BOOL)isDeclared
{
  return 0;
}

- (BOOL)isWildcard
{
  return 0;
}

- (BOOL)isInPublicDomain
{
  return 0;
}

- (BOOL)isExported
{
  return 0;
}

- (BOOL)isImported
{
  return 0;
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isCoreType
{
  return 0;
}

- (LSBundleRecord)declaringBundleRecord
{
  return 0;
}

- (LSPropertyList)declaration
{
  return (LSPropertyList *)MEMORY[0x1E0C9AA70];
}

- (NSURL)referenceURL
{
  return 0;
}

- (BOOL)conformsToTypeRecord:(id)a3
{
  void *v4;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UTTypeRecord conformsToTypeIdentifier:](self, "conformsToTypeIdentifier:", v4);

  return (char)self;
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  return 0;
}

- (NSSet)pedigree
{
  void *v2;
  id v4;

  -[UTTypeRecord identifier](self, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v4, 1);

  return (NSSet *)v2;
}

- (NSOrderedSet)parentTypeIdentifiers
{
  return (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
}

- (NSSet)childTypeIdentifiers
{
  return (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
}

- (BOOL)isChildOfTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UTTypeRecord parentTypeIdentifiers](self, "parentTypeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "containsObject:", v5);

  return (char)v4;
}

- (void)enumeratePedigreeWithBlock:(id)a3
{
  -[UTTypeRecord _enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:](self, "_enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:", 0x7FFFFFFFFFFFFFFFLL, a3);
}

- (void)enumerateDescendantsWithBlock:(id)a3
{
  -[UTTypeRecord _enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:](self, "_enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:", 0x8000000000000000, a3);
}

- (void)enumerateParentTypesWithBlock:(id)a3
{
  -[UTTypeRecord _enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:](self, "_enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:", 1, a3);
}

- (void)enumerateChildTypesWithBlock:(id)a3
{
  -[UTTypeRecord _enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:](self, "_enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:", -1, a3);
}

- (id)localizedDescriptionWithPreferredLocalizations:(id)a3
{
  void *v4;
  void *v5;

  -[UTTypeRecord _localizedDescription](self, "_localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValueWithPreferredLocalizations:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)localizedDescriptionDictionary
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[UTTypeRecord _localizedDescription](self, "_localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allStringValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (_LSLocalizedStringRecord)_localizedDescription
{
  return 0;
}

- (NSData)_declaringBundleBookmark
{
  return 0;
}

- (NSString)_delegatePath
{
  return 0;
}

- (void)_enumerateRelatedTypesWithMaximumDegreeOfSeparation:(int64_t)a3 block:(id)a4
{
  void *v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _UTDeclaredTypeRecord *v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  BOOL v17;
  unsigned __int8 v18;
  _QWORD v19[7];
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __n128 (*v24)(__n128 *, __n128 *);
  void (*v25)(uint64_t);
  const char *v26;
  _BYTE v27[24];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  void **v34[2];

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__52;
  v32 = __Block_byref_object_dispose__52;
  v33 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x4812000000;
  v24 = __Block_byref_object_copy__20_0;
  v25 = __Block_byref_object_dispose__21_0;
  v26 = "";
  memset(v27, 0, sizeof(v27));
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke;
  v20[3] = &unk_1E1046398;
  v20[4] = self;
  v20[5] = &v28;
  v20[6] = &v21;
  v20[7] = a3;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_3;
  v19[3] = &unk_1E10415B8;
  v19[5] = a4;
  v19[6] = a3;
  v19[4] = self;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v20, v19);
  v5 = (void *)v29[5];
  if (!v5)
    goto LABEL_16;
  v6 = v5;
  v34[0] = v6;
  v18 = 0;
  v7 = v22[6];
  v8 = v22[7];
  if (v7 == v8)
    goto LABEL_15;
  v9 = v7 + 24;
  do
  {
    v10 = (void *)MEMORY[0x186DAE7A0]();
    if (*(_BYTE *)(v9 - 4))
    {
      v11 = *(unsigned int *)(v9 - 8);
      v12 = [_UTDeclaredTypeRecord alloc];
      v13 = -[LSRecord _initWithContext:tableID:unitID:](v12, "_initWithContext:tableID:unitID:", v34, *((unsigned int *)v34[0] + 8), v11);
      v14 = (void *)v13;
      if (*(_BYTE *)(v9 - 4))
      {
        if (!v13)
          goto LABEL_11;
LABEL_10:
        (*((void (**)(id, void *, _QWORD, unsigned __int8 *))a4 + 2))(a4, v14, *(_QWORD *)(v9 - 16), &v18);
        goto LABEL_11;
      }
    }
    else
    {
      v14 = 0;
    }
    v15 = -[_UTDynamicTypeRecord _initWithContext:dynamicUTI:]([_UTDynamicTypeRecord alloc], "_initWithContext:dynamicUTI:", v34, *(_QWORD *)(v9 - 24));

    v14 = v15;
    if (v15)
      goto LABEL_10;
LABEL_11:
    v16 = v18;

    objc_autoreleasePoolPop(v10);
    if (v16)
      break;
    v17 = v9 == v8;
    v9 += 24;
  }
  while (!v17);
  v6 = v34[0];
LABEL_15:

LABEL_16:
  _Block_object_dispose(&v21, 8);
  v34[0] = (void **)v27;
  std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::__destroy_vector::operator()[abi:nn180100](v34);
  _Block_object_dispose(&v28, 8);

}

uint64_t __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke(_QWORD *a1, id *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  _QWORD v10[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *a2);
  v7 = (void *)a1[4];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_2;
  v10[3] = &unk_1E1046370;
  v8 = a1[7];
  v10[4] = a1[6];
  return objc_msgSend(v7, "_enumerateRelatedTypeUnitsOrDynamicIdsWithContext:unitID:maximumDegreeOfSeparation:block:", a2, a4, v8, v10);
}

void __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_2(uint64_t a1, id *a2)
{
  std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::push_back[abi:nn180100]((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), (uint64_t)a2);

}

void __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_3(uint64_t a1)
{
  UTTypeRecord *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UTTypeRecord *v9;
  _QWORD v10[5];

  if (_LSCurrentProcessMayMapDatabase())
  {
    v2 = [UTTypeRecord alloc];
    objc_msgSend(*(id *)(a1 + 32), "persistentIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LSRecord initWithPersistentIdentifier:](v2, "initWithPersistentIdentifier:", v3);

    if (v9)
    {
      -[UTTypeRecord _enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:](v9, "_enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        objc_msgSend(v8, "_enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_5;
    v10[3] = &unk_1E10463C0;
    v6 = *(_QWORD *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "getRelatedTypesOfTypeWithIdentifier:maximumDegreeOfSeparation:completionHandler:", v5, v6, v10);

  }
}

void __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v6 = objc_msgSend(a2, "count");
  v7 = objc_msgSend(a3, "count");
  if (v7 >= v6)
    v8 = v6;
  else
    v8 = v7;
  v13 = 0;
  if (v8)
  {
    v9 = 1;
    do
    {
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(a2, "objectAtIndexedSubscript:", v9 - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "objectAtIndexedSubscript:", v9 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t, char *))(v10 + 16))(v10, v11, objc_msgSend(v12, "integerValue"), &v13);

      if (v9 >= v8)
        break;
      ++v9;
    }
    while (!v13);
  }
}

+ (id)_typeRecordWithContext:(LSContext *)a3 forPromiseAtNode:(id)a4 error:(id *)a5
{
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[UTTypeRecord _typeRecordWithContext:forPromiseAtNode:error:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("UTTypeRecord.mm"), 722, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ctx != NULL"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[UTTypeRecord _typeRecordWithContext:forPromiseAtNode:error:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("UTTypeRecord.mm"), 723, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node != nil"));

LABEL_3:
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__52;
  v27 = __Block_byref_object_dispose__52;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__52;
  v21 = __Block_byref_object_dispose__52;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__UTTypeRecord__typeRecordWithContext_forPromiseAtNode_error___block_invoke;
  v16[3] = &unk_1E103FED0;
  v16[4] = a4;
  v16[5] = &v23;
  v16[6] = &v17;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v16);
  v9 = v24[5];
  if (v9)
  {
    objc_msgSend(a1, "_typeRecordWithContext:forPromiseResourceValues:error:", a3, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)v18[5]);
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

void __62__UTTypeRecord__typeRecordWithContext_forPromiseAtNode_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v2, "sideFaultResourceValuesWithError:", &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

}

+ (id)_typeRecordWithContext:(LSContext *)a3 forPromiseResourceValues:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _LSDatabase *db;
  const __CFString **v13;
  void *v14;
  int v15;
  unsigned int TypeData;
  int v17;
  void *v18;
  int v19;
  _LSDatabase *v20;
  unsigned int TypeVolume;
  void *v22;
  id v23;
  _UTDeclaredTypeRecord *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;

  v31 = 0;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[UTTypeRecord _typeRecordWithContext:forPromiseResourceValues:error:]");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("UTTypeRecord.mm"), 751, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ctx != NULL"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[UTTypeRecord _typeRecordWithContext:forPromiseResourceValues:error:]");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("UTTypeRecord.mm"), 752, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("props != nil"));

LABEL_3:
  v30 = 0;
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0C99968]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
LABEL_13:
    v17 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0C99978]))
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0C999B8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    db = a3->db;
    if ((v11 & 1) != 0)
    {
      v13 = (const __CFString **)&kUTTypeAliasFile;
LABEL_12:
      _UTGetActiveTypeForCFStringIdentifier(db, *v13, &v30);
      v17 = 0;
      goto LABEL_20;
    }
    TypeData = _UTTypeGetTypeData(db);
    goto LABEL_15;
  }
  if (!objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0C99960]))
  {
    if (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0C99988]))
    {
      db = a3->db;
      v13 = (const __CFString **)&kUTTypeSymLink;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0C99A00]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    TypeData = _UTTypeGetTypePackage(a3->db);
LABEL_15:
    v30 = TypeData;
    v17 = 1;
    goto LABEL_20;
  }
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0C99A48]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = a3->db;
  if (v19)
    TypeVolume = _UTTypeGetTypeVolume(v20);
  else
    TypeVolume = _UTTypeGetTypeFolder(v20);
  v17 = 0;
  v30 = TypeVolume;
LABEL_20:

  if (v30)
  {
    if (v17)
    {
      objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0C99A90]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        _CFGetPathExtensionRangesFromPathComponent();

      }
    }
    v23 = 0;
    v31 = v30;

    if (v31)
    {
      v24 = [_UTDeclaredTypeRecord alloc];
      v23 = -[LSRecord _initWithContext:tableID:unitID:](v24, "_initWithContext:tableID:unitID:", a3, a3->db->schema.utypeTable, v31);
    }
  }
  else
  {
    v23 = 0;
  }
  if (a5 && !v23)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10813, (uint64_t)"+[UTTypeRecord _typeRecordWithContext:forPromiseResourceValues:error:]", 825, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v23;
}

+ (id)_propertyClasses
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  const __CFString *v9;
  __CFString *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a4->var3 != a3->db->schema.utypeTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTTypeRecord.mm"), 846, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pi->tableID == ctx->db->schema.utypeTable"));

  }
  if (a5 < 0x1D)
  {
    if (_UTTypeGet())
    {
      v12 = -[LSRecord _initWithContext:tableID:unitID:]([_UTDeclaredTypeRecord alloc], "_initWithContext:tableID:unitID:", a3, a4->var3, a4->var2);

    }
    else
    {
      _LSRecordLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a5, 0);
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_DEBUG, "Failed to initialize type record with persistent identifier %@ because the type could not be found.", buf, 0xCu);

      }
      return 0;
    }
  }
  else
  {
    v9 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a4->var5, a5 - 28, 4, 0);
    v10 = (__CFString *)v9;
    if (v9)
    {
      if (UTTypeIsDynamic(v9))
        v11 = -[_UTDynamicTypeRecord _initWithContext:dynamicUTI:]([_UTDynamicTypeRecord alloc], "_initWithContext:dynamicUTI:", a3, v10);
      else
        v11 = -[_UTUndeclaredTypeRecord _initWithContext:identifier:]([_UTUndeclaredTypeRecord alloc], "_initWithContext:identifier:", a3, v10);
      v12 = v11;

    }
    else
    {
      _LSRecordLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a5, 0);
        *(_DWORD *)buf = 138412290;
        v21 = v16;
        _os_log_impl(&dword_182882000, v15, OS_LOG_TYPE_DEBUG, "Failed to initialize type record with persistent identifier %@ because the stored type was not valid UTF-8.", buf, 0xCu);

      }
      v12 = 0;
    }

  }
  return v12;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[UTTypeRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> { identifier: %@ }"), v4, self, v5);

  return v6;
}

@end
