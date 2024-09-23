@implementation LSApplicationExtensionRecord

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakContainingBundleRecord);
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  -[LSApplicationExtensionRecord uniqueIdentifier](self, "uniqueIdentifier");

  v15.receiver = self;
  v15.super_class = (Class)LSApplicationExtensionRecord;
  -[LSBundleRecord _detachFromContext:tableID:unitID:unitBytes:](&v15, sel__detachFromContext_tableID_unitID_unitBytes_, a3, v8, v7, a6);
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__containingBundleRecord);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "detach");

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_extensionPointRecord);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "detach");

}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_uniqueIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (id)uniqueIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  void *v6;
  void *v7;

  v6 = (void *)_CSStringCopyCFString();
  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)effectiveBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v6 = (void *)_CSStringCopyCFString();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)_CSStringCopyCFString();
  v9 = v8;

  return v9;
}

- (id)_containingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  id WeakRetained;
  _DWORD *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakContainingBundleRecord);

  if (!WeakRetained)
  {
    v9 = (_DWORD *)_LSBundleGet(a3->db, a6->var8);
    if (!v9)
      return v9;
    if (v9[42] == 2)
    {
      v9 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]([LSApplicationRecord alloc], "_initWithContext:bundleID:bundleData:error:", a3, a6->var8, v9, 0);
      return v9;
    }
  }
  v9 = 0;
  return v9;
}

- (void)_LSRecord_resolve_uniqueIdentifier
{
  id v2;

  v2 = -[LSApplicationExtensionRecord uniqueIdentifier](self, "uniqueIdentifier");
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  uint64_t infoDictionary;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  infoDictionary = a6->var0.infoDictionary;
  if ((_DWORD)infoDictionary)
  {
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, infoDictionary, *(_QWORD *)&a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("CFBundleIcons"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_12;
  objc_msgSend(v9, "objectForKey:", CFSTR("CFBundlePrimaryIcon"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v12 = v11;
  else
    v12 = 0;
  objc_msgSend(v10, "objectForKey:", CFSTR("ISGraphicIconConfiguration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSDictionary())
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("ISGraphicIconConfiguration"));

  if (v12)
  {
    objc_msgSend(v8, "addEntriesFromDictionary:", v12);
  }
  else
  {
LABEL_12:
    objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("CFBundleIconFile"), objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("CFBundleIconFile"));
    objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("CFBundleIconName"), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("CFBundleIconName"));

    v12 = 0;
  }
  v16 = (void *)objc_msgSend(v8, "copy");

  return v16;
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2;

  v2 = -[LSApplicationExtensionRecord iconDictionary](self, "iconDictionary");
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v7 = (uint64_t)a5;
  v8 = *(_QWORD *)&a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (a5 || (v7 = _LSGetPlugin((uint64_t)a3->db, a4)) != 0)
  {
    if (self)
      return -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:](self, "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", 0, 0, a3, a3->db->schema.pluginTable, v8, v7, a6);
  }
  else
  {
    if (a6)
    {
      v13 = *MEMORY[0x1E0CB2938];
      v14[0] = CFSTR("Unable to find this application extension record in the Launch Services database.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]", 243, v12);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return 0;
}

- (void)_LSRecord_resolve_effectiveBundleIdentifier
{
  id v2;

  v2 = -[LSApplicationExtensionRecord effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
}

- (NSString)effectiveBundleIdentifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_effectiveBundleIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (char)developerType
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  char v6;
  objc_super v8;

  -[LSApplicationExtensionRecord containingBundleRecord](self, "containingBundleRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "developerType");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LSApplicationExtensionRecord;
    v5 = -[LSBundleRecord developerType](&v8, sel_developerType);
  }
  v6 = v5;

  return v6;
}

- (void)_LSRecord_resolve__containingBundleRecord
{
  id v2;

  v2 = -[LSApplicationExtensionRecord _containingBundleRecord](self, "_containingBundleRecord");
}

- (LSBundleRecord)containingBundleRecord
{
  void *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakContainingBundleRecord);
  if (!WeakRetained)
  {
    -[LSApplicationExtensionRecord _containingBundleRecord](self, "_containingBundleRecord");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (LSBundleRecord *)WeakRetained;
}

- (LSBundleRecord)_containingBundleRecord
{
  return (LSBundleRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__containingBundleRecordWithContext_tableID_unitID_unitBytes_);
}

- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5
{
  id v5;
  objc_super v7;

  if (sel__containingBundleRecord == a4)
  {
    v5 = a3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)LSApplicationExtensionRecord;
    -[LSRecord _replacementObjectForResolvedPropertyValue:forGetter:encoder:](&v7, sel__replacementObjectForResolvedPropertyValue_forGetter_encoder_, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)_propertyClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extensionPointRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  int v7;
  id v8;
  LSExtensionPointRecord *v9;
  uint64_t v11;
  unsigned int v12;

  v12 = 0;
  v11 = 0;
  v7 = _LSExtensionPointFindWithStringID(a3->db, a6->var4, a6->var0.platform, 0, &v12, &v11);
  v8 = 0;
  if (!v7)
  {
    v9 = [LSExtensionPointRecord alloc];
    v8 = -[LSRecord _initWithContext:tableID:unitID:](v9, "_initWithContext:tableID:unitID:", a3, a3->db->schema.extensionPointTable, v12);
  }
  return v8;
}

+ (id)enumeratorWithExtensionPointRecord:(id)a3 options:(unint64_t)a4
{
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSRecord+Enumeration.mm"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointRecord != nil"));

  }
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPoint:options:]([_LSApplicationExtensionRecordEnumerator alloc], "initWithExtensionPoint:options:", a3, a4);
}

- (LSApplicationExtensionRecord)initWithURL:(id)a3 requireValid:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  FSNode *v8;
  LSApplicationExtensionRecord *v9;

  v6 = a4;
  v8 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", a3, 32, 0);
  v9 = -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:context:requireValid:error:](self, "_initWithUUID:node:bundleIdentifier:context:requireValid:error:", 0, v8, 0, 0, v6, a5);

  return v9;
}

- (BOOL)eligibleForRedaction
{
  FSNode *v3;
  void *v4;
  FSNode *v5;
  BOOL v6;

  v3 = [FSNode alloc];
  -[LSBundleRecord URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FSNode initWithURL:flags:error:](v3, "initWithURL:flags:error:", v4, 0, 0);
  v6 = -[FSNode isSecuredSystemContent](v5, "isSecuredSystemContent");

  return v6;
}

- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 extensionPointRecord:(id)a6 error:(id *)a7
{
  id v8;

  v8 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:](self, "_initWithContext:pluginID:pluginData:error:", a3, *(_QWORD *)&a4, a5, a7);
  objc_msgSend(v8, "_setResolvedPropertyValue:forGetter:", a6, sel_extensionPointRecord);

  return v8;
}

- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 context:(LSContext *)a6 requireValid:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  uint64_t v16;

  v9 = a7;
  LOBYTE(v16) = _LSCurrentProcessMayMapDatabase() == 0;
  return -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:](self, "_initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:", a3, a4, a5, 0, a6, v9, v16, a8);
}

- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 platform:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v12;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  LOBYTE(v12) = _LSCurrentProcessMayMapDatabase() == 0;
  return (LSApplicationExtensionRecord *)-[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:](self, "_initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:", 0, 0, a3, v7, 0, v8, v12, a6);
}

- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 context:(LSContext *)CurrentContext requireValid:(BOOL)a8 allowRedacted:(BOOL)a9 error:(id *)a10
{
  _BOOL4 v10;
  uint64_t v12;
  LaunchServices::DatabaseContext *MayMapDatabase;
  uint64_t v18;
  id v19;
  _LSDServiceDomain *v20;
  uint64_t v21;
  _LSDServiceDomain *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  int v28;
  LSContext *v29;
  id v30;
  char v31;
  id v32;

  v10 = a8;
  v12 = *(_QWORD *)&a6;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (!(_DWORD)MayMapDatabase && a9)
  {
    +[LSApplicationExtensionRecord redactedAppexRecordWithUUID:node:bundleIdentifier:platform:error:](LSApplicationExtensionRecord, "redactedAppexRecordWithUUID:node:bundleIdentifier:platform:error:", a3, a4, a5, v12, a10);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v18;
    if (!a3)
      return v19;
    goto LABEL_20;
  }
  if (!CurrentContext)
    CurrentContext = (LSContext *)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
  v29 = CurrentContext;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v20 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v21 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v29, v20, 0);

  if (!v21)
  {
    if (a10)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v22 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v23 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v29, v22, 0);

      if (v23)
        v24 = 0;
      else
        v24 = objc_retainAutorelease(v32);
      *a10 = v24;
    }
    goto LABEL_15;
  }
  v28 = 0;
  findPluginDataInContext(v21, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v10, v12, (uint64_t)&v28, a10);
  if (!v28)
  {
LABEL_15:

    v19 = 0;
    goto LABEL_16;
  }
  v19 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:](self, "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", a4, a5, v21, *(unsigned int *)(*(_QWORD *)v21 + 1604), a10);
LABEL_16:
  if (v29 && v31)
    _LSContextDestroy((void **)&v29->db);
  v25 = v30;
  v29 = 0;
  v30 = 0;

  v31 = 0;
  v26 = v32;
  v32 = 0;

  if (a3)
  {
LABEL_20:
    if (v19)
      objc_msgSend(v19, "_setResolvedPropertyValue:forGetter:", a3, sel_uniqueIdentifier);
  }
  return v19;
}

- (void)_LSRecord_resolve_extensionPointRecord
{
  id v2;

  v2 = -[LSApplicationExtensionRecord extensionPointRecord](self, "extensionPointRecord");
}

- (LSExtensionPointRecord)extensionPointRecord
{
  return (LSExtensionPointRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_extensionPointRecordWithContext_tableID_unitID_unitBytes_);
}

- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 error:(id *)a4
{
  return -[LSApplicationExtensionRecord initWithBundleIdentifier:requireValid:platform:error:](self, "initWithBundleIdentifier:requireValid:platform:error:", a3, 0, 0, a4);
}

+ (id)redactedAppexRecordWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  void (*v18[5])(_QWORD, _QWORD);
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = *(_QWORD *)&a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v18[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v18[2] = (void (*)(_QWORD, _QWORD))__108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke;
  v18[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FB88;
  v18[4] = (void (*)(_QWORD, _QWORD))&v25;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke_2;
  v17[3] = &unk_1E103FBB0;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend(v13, "getRedactedAppexRecordForSystemAppexWithUUID:node:bundleIdentifier:platform:completionHandler:", a3, a4, a5, v8, v17);

  v14 = (void *)v20[5];
  if (a7 && !v14)
  {
    *a7 = objc_retainAutorelease((id)v26[5]);
    v14 = (void *)v20[5];
  }
  v15 = v14;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (LSApplicationExtensionRecord)initWithUUID:(id)a3 error:(id *)a4
{
  return -[LSApplicationExtensionRecord initWithUUID:requireValid:error:](self, "initWithUUID:requireValid:error:", a3, 0, a4);
}

- (LSApplicationExtensionRecord)initWithUUID:(id)a3 requireValid:(BOOL)a4 error:(id *)a5
{
  return (LSApplicationExtensionRecord *)-[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:context:requireValid:error:](self, "_initWithUUID:node:bundleIdentifier:context:requireValid:error:", a3, 0, 0, 0, a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSApplicationExtensionRecord)initWithURL:(id)a3 error:(id *)a4
{
  return -[LSApplicationExtensionRecord initWithURL:requireValid:error:](self, "initWithURL:requireValid:error:", a3, 0, a4);
}

- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 error:(id *)a5
{
  return -[LSApplicationExtensionRecord initWithBundleIdentifier:requireValid:platform:error:](self, "initWithBundleIdentifier:requireValid:platform:error:", a3, a4, 0, a5);
}

void __108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
}

- (BOOL)appProtectionHidden
{
  void *v2;
  char v3;

  -[LSApplicationExtensionRecord containingBundleRecord](self, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "appProtectionHidden");

  return v3;
}

- (BOOL)appProtectionLocked
{
  void *v2;
  char v3;

  -[LSApplicationExtensionRecord containingBundleRecord](self, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "appProtectionLocked");

  return v3;
}

+ (id)applicationExtensionRecordsForUUIDs:(id)a3 outContainingBundleRecords:(id *)a4 error:(id *)a5
{
  _LSDServiceDomain *v6;
  uint64_t *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t PluginDataInContext;
  id v15;
  int v16;
  BOOL v17;
  id v18;
  id v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  int v33;
  uint64_t v34;
  char *v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  LSApplicationRecord *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  char v57;
  LSApplicationExtensionRecord *v58;
  id v59;
  id v60;
  id v61;
  _QWORD *j;
  id v63;
  _LSDServiceDomain *v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  void *v78;
  unsigned int *v79;
  void *context;
  unint64_t contexta;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  unsigned int v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  char *v94;
  char *v95;
  char *v96;
  void **v97;
  id v98;
  char v99;
  id v100;
  __int128 v101;
  __int128 v102;
  char **v103;
  uint64_t v104;
  void *v105;
  uint8_t v106[128];
  uint8_t buf[4];
  _BYTE v108[12];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v100 = 0;
  v97 = 0;
  v98 = 0;
  v99 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v7 = (uint64_t *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v97, v6, 0);

  if (v7)
  {
    v94 = 0;
    v95 = 0;
    v96 = 0;
    context = (void *)MEMORY[0x186DAE7A0]();
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v8 = a3;
    v9 = 0;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v90, v109, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v91 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          *(_DWORD *)buf = 0;
          v89 = v9;
          PluginDataInContext = findPluginDataInContext((uint64_t)v7, (uint64_t)v13, 0, 0, 0, 0, (uint64_t)buf, &v89);
          v15 = v89;

          v9 = v15;
          v16 = *(_DWORD *)buf;
          if (PluginDataInContext)
            v17 = *(_DWORD *)buf == 0;
          else
            v17 = 1;
          if (!v17)
          {
            v18 = v13;
            v19 = v18;
            v20 = v95;
            if (v95 >= v96)
            {
              v22 = (v95 - v94) >> 4;
              v23 = v22 + 1;
              if ((unint64_t)(v22 + 1) >> 60)
                abort();
              v24 = v96 - v94;
              if ((v96 - v94) >> 3 > v23)
                v23 = v24 >> 3;
              if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0)
                v25 = 0xFFFFFFFFFFFFFFFLL;
              else
                v25 = v23;
              v103 = &v96;
              v26 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>((uint64_t)&v96, v25);
              v28 = &v26[16 * v22];
              *(_DWORD *)v28 = v16;
              *((_QWORD *)v28 + 1) = v19;
              v30 = v94;
              v29 = v95;
              if (v95 == v94)
              {
                v32 = &v26[16 * v22];
              }
              else
              {
                v31 = v95;
                v32 = &v26[16 * v22];
                do
                {
                  v33 = *((_DWORD *)v31 - 4);
                  v31 -= 16;
                  *((_DWORD *)v32 - 4) = v33;
                  v32 -= 16;
                  v34 = *((_QWORD *)v31 + 1);
                  *((_QWORD *)v31 + 1) = 0;
                  *((_QWORD *)v32 + 1) = v34;
                }
                while (v31 != v30);
              }
              v21 = v28 + 16;
              v94 = v32;
              v95 = v28 + 16;
              v35 = v96;
              v96 = &v26[16 * v27];
              *(_QWORD *)&v102 = v29;
              *((_QWORD *)&v102 + 1) = v35;
              *(_QWORD *)&v101 = v30;
              *((_QWORD *)&v101 + 1) = v30;
              std::__split_buffer<std::pair<unsigned int,NSUUID * {__strong}>>::~__split_buffer((uint64_t)&v101);
            }
            else
            {
              *(_DWORD *)v95 = v16;
              *((_QWORD *)v20 + 1) = v18;
              v21 = v20 + 16;
            }
            v95 = v21;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v90, v109, 16);
      }
      while (v10);
    }

    objc_autoreleasePoolPop(context);
    v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101 = 0u;
    v102 = 0u;
    LODWORD(v103) = 1065353216;
    v36 = (int *)v94;
    v79 = (unsigned int *)v95;
    if (v94 != v95)
    {
      v74 = (void *)*MEMORY[0x1E0CB2F90];
      v75 = *MEMORY[0x1E0CB2938];
      do
      {
        contexta = *v36;
        v37 = _LSGetPlugin(*v7, *v36);
        v38 = v37;
        if (v37)
        {
          v88 = *(_DWORD *)(v37 + 224);
          if (v88)
          {
            v77 = v37;
            v39 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>(&v101, &v88);
            if (v39)
            {
              v40 = (id)v39[3];
              if (!v40)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSApplicationExtensionRecord.mm"), 315, CFSTR("why don't we have a container in the map?"));

                v40 = 0;
              }
            }
            else
            {
              v47 = [LSApplicationRecord alloc];
              v87 = v9;
              v48 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:](v47, "_initWithContext:bundleID:bundleData:error:", v7, v88, 0, &v87);
              v49 = v87;

              if (v48)
              {
                *(_DWORD *)buf = v88;
                v50 = v48;
                *(_QWORD *)&v108[4] = v50;
                std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,LSApplicationRecord * {__strong}>>((uint64_t)&v101, (unsigned int *)buf, (uint64_t)buf);

                v9 = v49;
                v40 = v50;
              }
              else
              {
                v40 = 0;
                v9 = v49;
              }
            }
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            v78 = v40;
            objc_msgSend(v40, "applicationExtensionRecords");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
            if (v52)
            {
              v53 = *(_QWORD *)v84;
LABEL_43:
              v54 = 0;
              while (1)
              {
                if (*(_QWORD *)v84 != v53)
                  objc_enumerationMutation(v51);
                v55 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v54);
                objc_msgSend(v55, "uniqueIdentifier");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = objc_msgSend(v56, "isEqual:", *((_QWORD *)v36 + 1));

                if ((v57 & 1) != 0)
                  break;
                if (v52 == ++v54)
                {
                  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
                  if (v52)
                    goto LABEL_43;
                  goto LABEL_49;
                }
              }
              v46 = v55;

              v38 = v77;
              if (v46)
                goto LABEL_52;
            }
            else
            {
LABEL_49:

              v38 = v77;
            }
          }
          v58 = [LSApplicationExtensionRecord alloc];
          v82 = v9;
          v46 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:](v58, "_initWithContext:pluginID:pluginData:error:", v7, contexta, v38, &v82);
          v59 = v82;

          v9 = v59;
          if (v46)
LABEL_52:
            objc_msgSend(v76, "addObject:", v46);
        }
        else
        {
          _LSDefaultLog();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v108 = contexta;
            _os_log_error_impl(&dword_182882000, v42, OS_LOG_TYPE_ERROR, "unexpected error finding plugin with unit %lu", buf, 0xCu);
          }

          v104 = v75;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not find plugin for unit %lu"), contexta);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          _LSMakeNSErrorImpl(v74, -10810, (uint64_t)"+[LSApplicationExtensionRecord applicationExtensionRecordsForUUIDs:outContainingBundleRecords:error:]", 340, v44);
          v45 = objc_claimAutoreleasedReturnValue();

          v46 = 0;
          v9 = (id)v45;
        }

        v36 += 4;
      }
      while (v36 != (int *)v79);
    }
    if (objc_msgSend(v76, "count"))
    {
      v60 = v76;
      if (a4)
      {
        v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        for (j = (_QWORD *)v102; j; j = (_QWORD *)*j)
          objc_msgSend(v61, "addObject:", j[3]);
        v63 = *a4;
        *a4 = v61;

      }
    }
    else
    {
      v60 = 0;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table((uint64_t)&v101);

    *(_QWORD *)&v101 = &v94;
    std::vector<std::pair<unsigned int,NSUUID * {__strong}>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v101);
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v64 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v65 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v97, v64, 0);

    if (v65)
      v9 = 0;
    else
      v9 = v100;
    v60 = 0;
  }
  if (a5 && !v60)
    *a5 = objc_retainAutorelease(v9);
  v66 = v60;
  if (v97 && v99)
    _LSContextDestroy(v97);
  v67 = v98;
  v97 = 0;
  v98 = 0;

  v99 = 0;
  v68 = v100;
  v100 = 0;

  return v66;
}

- (unsigned)pluginFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  return a6->var1;
}

- (unsigned)pluginFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_pluginFlagsWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)compatibilityState
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[LSApplicationExtensionRecord containingBundleRecord](self, "containingBundleRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "compatibilityState");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LSApplicationExtensionRecord;
    v5 = -[LSBundleRecord compatibilityState](&v8, sel_compatibilityState);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (id)managedPersonas
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord containingBundleRecord](self, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedPersonas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)associatedPersonas
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord containingBundleRecord](self, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedPersonas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_personasWithAttributes
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord containingBundleRecord](self, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_personasWithAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_usesSystemPersona
{
  void *v2;
  char v3;

  -[LSApplicationExtensionRecord containingBundleRecord](self, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_usesSystemPersona");

  return v3;
}

- (BOOL)_containerized
{
  return 1;
}

- (unint64_t)_containerClass
{
  return 4;
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  return +[LSPlugInKitProxy plugInKitProxyForPlugin:withContext:applicationExtensionRecord:resolveAndDetach:](LSPlugInKitProxy, "plugInKitProxyForPlugin:withContext:applicationExtensionRecord:resolveAndDetach:", *(_QWORD *)&a5, a3, self, 0);
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  void *v11;
  objc_super v12;

  if (a4->var3 != a3->db->schema.pluginTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationExtensionRecord.mm"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pi->tableID == ctx->db->schema.pluginTable"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LSApplicationExtensionRecord;
  return -[LSBundleRecord _initWithContext:persistentIdentifierData:length:](&v12, sel__initWithContext_persistentIdentifierData_length_, a3, a4, a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LSApplicationExtensionRecord;
  v4 = -[LSBundleRecord copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakContainingBundleRecord);
    objc_storeWeak(v4 + 10, WeakRetained);

  }
  return v4;
}

- (id)_intentsArrayForKey:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[LSBundleRecord infoDictionary](self, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v5, "objectForKey:", CFSTR("NSExtensionAttributes"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = v8;
        v8 = 0;
LABEL_10:

        goto LABEL_11;
      }
    }
    else if (!v7)
    {
      goto LABEL_11;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_opt_class();
      if ((_LSIsArrayWithValuesOfClass(v9, v10) & 1) != 0)
      {
LABEL_12:

        return v9;
      }
      goto LABEL_10;
    }
LABEL_11:
    v9 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
  return v9;
}

- (id)supportedIntents
{
  return -[LSApplicationExtensionRecord _intentsArrayForKey:](self, "_intentsArrayForKey:", CFSTR("IntentsSupported"));
}

- (id)intentsRestrictedWhileLocked
{
  return -[LSApplicationExtensionRecord _intentsArrayForKey:](self, "_intentsArrayForKey:", CFSTR("IntentsRestrictedWhileLocked"));
}

- (id)intentsRestrictedWhileProtectedDataUnavailable
{
  return -[LSApplicationExtensionRecord _intentsArrayForKey:](self, "_intentsArrayForKey:", CFSTR("IntentsRestrictedWhileProtectedDataUnavailable"));
}

- (id)supportedIntentMediaCategories
{
  return -[LSApplicationExtensionRecord _intentsArrayForKey:](self, "_intentsArrayForKey:", CFSTR("SupportedMediaCategories"));
}

void __108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4
{
  LSApplicationExtensionRecord *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;

  v7 = [LSApplicationExtensionRecord alloc];
  -[LSBundleRecord _node](self, "_node");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 0;
  v10 = -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:](v7, "_initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:", 0, v8, v9, -[LSBundleRecord platform](self, "platform"), a3, 1, v12, a4);

  return v10;
}

- (id)appProtectionEffectiveContainerWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  void *v6;
  void *v7;

  if (a6->var9)
  {
    v6 = (void *)_CSStringCopyCFString();
  }
  else
  {
    -[LSApplicationExtensionRecord containingBundleRecord](self, "containingBundleRecord", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSString)appProtectionEffectiveContainer
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_appProtectionEffectiveContainerWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_appProtectionEffectiveContainer
{
  id v2;

  v2 = -[LSApplicationExtensionRecord appProtectionEffectiveContainer](self, "appProtectionEffectiveContainer");
}

- (BOOL)optsOutOfAppProtectionShield
{
  return (-[LSApplicationExtensionRecord pluginFlags](self, "pluginFlags") >> 4) & 1;
}

+ (id)enumeratorWithOptions:(unint64_t)a3
{
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:]([_LSApplicationExtensionRecordEnumerator alloc], "initWithExtensionPointIdentifier:options:", 0, a3);
}

@end
