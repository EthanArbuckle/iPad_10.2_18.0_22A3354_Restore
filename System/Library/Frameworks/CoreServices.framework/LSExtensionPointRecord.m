@implementation LSExtensionPointRecord

- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (id)nameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return (id)_CSStringCopyCFString();
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  id v6;

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_SDKDictionary, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v6, "detach");

}

- (unsigned)extensionPointType
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_extensionPointTypeWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)TCCPolicy
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_TCCPolicyWithContext_tableID_unitID_unitBytes_);
}

- (id)SDKDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->var5, *(_QWORD *)&a5);
}

- (id)parentAppRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  LSApplicationRecord *v8;
  uint64_t var7;
  id v10;
  id v12;

  if (!a6->var7)
    return 0;
  v8 = [LSApplicationRecord alloc];
  var7 = a6->var7;
  v12 = 0;
  v10 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:](v8, "_initWithContext:bundleID:bundleData:error:", a3, var7, 0, &v12);

  return v10;
}

- (unsigned)extensionPointTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return a6->var8;
}

- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return a6->var4;
}

- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  __int128 v6;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = *(_OWORD *)&a6->var2._opaque[16];
  v8[0] = *(_OWORD *)a6->var2._opaque;
  v8[1] = v6;
  _LSVersionNumberGetStringRepresentation(v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)TCCPolicyWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return a6->var9;
}

- (void)_LSRecord_resolve_name
{
  id v2;

  v2 = -[LSExtensionPointRecord name](self, "name");
}

- (NSString)name
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_nameWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_version
{
  id v2;

  v2 = -[LSExtensionPointRecord version](self, "version");
}

- (NSString)version
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_versionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_parentAppRecord
{
  id v2;

  v2 = -[LSExtensionPointRecord parentAppRecord](self, "parentAppRecord");
}

- (LSApplicationRecord)parentAppRecord
{
  return (LSApplicationRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_parentAppRecordWithContext_tableID_unitID_unitBytes_);
}

+ (id)_propertyClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_LSRecord_resolve_SDKDictionary
{
  id v2;

  v2 = -[LSExtensionPointRecord SDKDictionary](self, "SDKDictionary");
}

- (LSPropertyList)SDKDictionary
{
  return (LSPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_SDKDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)platform
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_platformWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_identifier
{
  id v2;

  v2 = -[LSExtensionPointRecord identifier](self, "identifier");
}

- (NSString)identifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_identifierWithContext_tableID_unitID_unitBytes_);
}

+ (id)enumeratorForExtensionPointIdentifier:(id)a3
{
  return -[_LSExtensionPointRecordEnumerator initWithExtensionPointIdentifier:]([_LSExtensionPointRecordEnumerator alloc], "initWithExtensionPointIdentifier:", a3);
}

+ (LSExtensionPointRecord)extensionPointRecordForCurrentProcess
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  pid_t v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  id *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  pid_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = (id *)&v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__26;
  v14 = __Block_byref_object_dispose__26;
  v15 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  objc_storeStrong(v11 + 5, (id)currentExtensionPointRecord);
  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
  v2 = v11[5];
  if (!v2)
  {
    if (_LSCurrentProcessMayMapDatabase())
    {
      +[LSBundleRecord bundleRecordForCurrentProcess](LSBundleRecord, "bundleRecordForCurrentProcess");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "extensionPointRecord");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = v11[5];
        v11[5] = (id)v4;
      }
      else
      {
        _LSExtensionsLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = getpid();
          *(_DWORD *)buf = 67109120;
          v17 = v6;
          _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_INFO, "Bundle record not found for current process %d", buf, 8u);
        }
      }

    }
    else
    {
      +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_40);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63__LSExtensionPointRecord_extensionPointRecordForCurrentProcess__block_invoke_2;
      v9[3] = &unk_1E1044078;
      v9[4] = &v10;
      objc_msgSend(v3, "getExtensionPointRecordForCurrentProcessWithCompletionHandler:", v9);
    }

    v2 = v11[5];
    if (v2)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
      objc_storeStrong((id *)&currentExtensionPointRecord, v11[5]);
      os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
      v2 = v11[5];
    }
  }
  v7 = v2;
  _Block_object_dispose(&v10, 8);

  return (LSExtensionPointRecord *)v7;
}

+ (BOOL)isCurrentProcessAnApplicationExtension
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "identifierForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (NSString)identifierForCurrentProcess
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("NSExtension"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 && v6)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v7 = 0;
        goto LABEL_22;
      }

    }
    else
    {

      if (!v7)
      {
LABEL_22:
        v8 = 0;
        goto LABEL_23;
      }
    }
    v9 = objc_opt_class();
    objc_msgSend(v7, "objectForKey:", CFSTR("NSExtensionPointIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v10;
    if (v9 && v10)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_22;
      }
    }
    else if (!v10)
    {
LABEL_23:

      goto LABEL_24;
    }
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[LSExtensionPointRecord identifierForCurrentProcess].cold.2((uint64_t)v8, v11);

    objc_msgSend(v3, "bundlePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13 || objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("appex")))
    {
      _LSDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        +[LSExtensionPointRecord identifierForCurrentProcess].cold.1((uint64_t)v8, (uint64_t)v13, v14);

      v8 = 0;
    }

    goto LABEL_23;
  }
  v8 = 0;
LABEL_24:

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 parentAppRecord:(id)a5 error:(id *)a6
{
  LaunchServices::DatabaseContext *MayMapDatabase;
  _LSDServiceDomain *v11;
  void **v12;
  uint64_t v13;
  int v14;
  void (*v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  id v18;
  _LSDServiceDomain *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  int v22;
  uint64_t v23;
  LSExtensionPointRecord *v24;
  id v25;
  void **v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void *v30;
  id *v31;
  objc_super v33;
  _QWORD v34[6];
  void (*v35[5])(_QWORD, _QWORD);
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  void **CurrentContext;
  void **p_CurrentContext;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSExtensionPointRecord.mm"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointIdentifier != nil"));

  }
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    p_CurrentContext = 0;
    LOBYTE(v44) = 0;
    v45 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v12 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v11, 0);

    if (v12)
    {
      LODWORD(v34[0]) = 0;
      v36 = 0;
      if (a5)
        v13 = objc_msgSend(a5, "unitID");
      else
        v13 = 0;
      v22 = _LSExtensionPointFindWithIdentifier(*v12, (const __CFString *)a3, a4, v13, v34, &v36);
      if (_LSGetNSErrorFromOSStatusImpl(v22, a6, (uint64_t)"-[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:]", 85))
      {
        v23 = *((unsigned int *)*v12 + 402);
        v33.receiver = self;
        v33.super_class = (Class)LSExtensionPointRecord;
        v24 = -[LSRecord _initWithContext:tableID:unitID:](&v33, sel__initWithContext_tableID_unitID_, v12, v23, LODWORD(v34[0]));
        goto LABEL_29;
      }
    }
    else if (a6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v19 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v20 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v19, 0);

      if (v20)
        v21 = 0;
      else
        v21 = objc_retainAutorelease(v45);
      *a6 = v21;
    }

    v24 = 0;
LABEL_29:
    if (CurrentContext && (_BYTE)v44)
      _LSContextDestroy(CurrentContext);
    v26 = p_CurrentContext;
    CurrentContext = 0;
    p_CurrentContext = 0;

    LOBYTE(v44) = 0;
    v27 = v45;
    v45 = 0;

    return v24;
  }
  v31 = a6;
  CurrentContext = 0;
  p_CurrentContext = (void **)&CurrentContext;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__26;
  v46 = __Block_byref_object_dispose__26;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__26;
  v40 = __Block_byref_object_dispose__26;
  v14 = 11;
  v41 = 0;
  v15 = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  while (1)
  {
    v35[0] = v15;
    v35[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v35[2] = (void (*)(_QWORD, _QWORD))___ZL12getEPFromLSDP8NSStringjPU15__autoreleasingP7NSError_block_invoke;
    v35[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FB88;
    v35[4] = (void (*)(_QWORD, _QWORD))&CurrentContext;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v15;
    v34[1] = 3221225472;
    v34[2] = ___ZL12getEPFromLSDP8NSStringjPU15__autoreleasingP7NSError_block_invoke_2;
    v34[3] = &unk_1E10440A0;
    v34[4] = &v36;
    v34[5] = &CurrentContext;
    objc_msgSend(v16, "getExtensionPointRecordWithIdentifier:platform:completionHandler:", a3, a4, v34);
    if (v37[5] || !_LSNSErrorIsXPCConnectionInterrupted(p_CurrentContext[5]))
      break;

    if (--v14 <= 1)
      goto LABEL_13;
  }

LABEL_13:
  v17 = (void *)v37[5];
  if (v17)
  {
    v18 = 0;
  }
  else
  {
    v18 = objc_retainAutorelease(p_CurrentContext[5]);
    v17 = (void *)v37[5];
  }
  v24 = v17;
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&CurrentContext, 8);
  v25 = v18;

  if (v31 && !v24)
    *v31 = objc_retainAutorelease(v25);

  return v24;
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 error:(id *)a4
{
  return -[LSExtensionPointRecord initWithIdentifier:parentAppRecord:error:](self, "initWithIdentifier:parentAppRecord:error:", a3, 0, a4);
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 parentAppRecord:(id)a4 error:(id *)a5
{
  return -[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:](self, "initWithIdentifier:platform:parentAppRecord:error:", a3, dyld_get_active_platform(), a4, a5);
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5
{
  return -[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:](self, "initWithIdentifier:platform:parentAppRecord:error:", a3, *(_QWORD *)&a4, 0, a5);
}

void __63__LSExtensionPointRecord_extensionPointRecordForCurrentProcess__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)setExtensionPointRecordForCurrentProcess:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  objc_storeStrong((id *)&currentExtensionPointRecord, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  return -[LSExtensionPoint _initWithRecord:resolveAndDetach:]([LSExtensionPoint alloc], "_initWithRecord:resolveAndDetach:", self, 0);
}

+ (id)enumerator
{
  return -[_LSDBEnumerator _initWithContext:]([_LSExtensionPointRecordEnumerator alloc], "_initWithContext:", 0);
}

+ (id)enumeratorWithParentApplicationRecord:(id)a3
{
  id v4;

  v4 = -[_LSDBEnumerator _initWithContext:]([_LSExtensionPointRecordEnumerator alloc], "_initWithContext:", 0);
  objc_msgSend(v4, "setParentApplicationRecord:", a3);
  return v4;
}

+ (void)identifierForCurrentProcess
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Found extension point identifier %{public}@ for the current process", (uint8_t *)&v2, 0xCu);
}

@end
