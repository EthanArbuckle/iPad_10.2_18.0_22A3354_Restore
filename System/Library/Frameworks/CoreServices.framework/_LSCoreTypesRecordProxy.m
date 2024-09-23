@implementation _LSCoreTypesRecordProxy

- (void)detach
{
  LSBundleRecord **p_realRecord;
  id obj;

  if (_LSCurrentProcessMayMapDatabase())
  {
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
    p_realRecord = &self->_realRecord;
    obj = (id)-[LSBundleRecord copy](*p_realRecord, "copy");
    if (obj)
      objc_storeStrong((id *)p_realRecord, obj);
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
    objc_msgSend(obj, "detach");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realRecord, 0);
}

- (id)URL
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/System/Library/CoreServices/MobileCoreTypes.bundle"), 1);
}

- (id)_loadRealRecord
{
  id WeakRetained;
  LaunchServices::DatabaseContext *MayMapDatabase;
  _LSDServiceDomain *v4;
  uint64_t v5;
  FSNode *v6;
  LSBundleRecord *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[11];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  void **CurrentContext;
  id v25;
  char v26;
  id v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = (id *)&v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__10;
  v32 = __Block_byref_object_dispose__10;
  v33 = 0;
  WeakRetained = objc_loadWeakRetained(&LaunchServices::Record::weakCoreTypesRecord);
  if (WeakRetained)
  {
    objc_storeStrong(v29 + 5, WeakRetained);
  }
  else
  {
    MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
    if ((_DWORD)MayMapDatabase)
    {
      CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
      v25 = 0;
      v26 = 0;
      v27 = 0;
      +[_LSDServiceDomain defaultServiceDomain]();
      v4 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v5 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v4, 0);

      if (v5)
      {
        v20 = 0;
        v21 = &v20;
        v22 = 0x2020000000;
        v23 = 0;
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v19 = 0;
        v15[5] = MEMORY[0x1E0C809B0];
        v15[6] = 3221225472;
        v15[7] = __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke;
        v15[8] = &unk_1E10420C8;
        v15[9] = &v16;
        v15[10] = &v20;
        _CSStoreEnumerateUnits();
        if (*((_DWORD *)v21 + 6))
        {
          v6 = -[FSNode initWithPath:flags:error:]([FSNode alloc], "initWithPath:flags:error:", CFSTR("/System/Library/CoreServices/MobileCoreTypes.bundle"), 8, 0);
          v7 = [LSBundleRecord alloc];
          v8 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:](v7, "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", v6, CFSTR("com.apple.mobilecoretypes"), v5, *(unsigned int *)(*(_QWORD *)v5 + 20), *((unsigned int *)v21 + 6), v17[3], 0);
          v9 = v29[5];
          v29[5] = (id)v8;

        }
        _Block_object_dispose(&v16, 8);
        _Block_object_dispose(&v20, 8);
      }
      if (CurrentContext && v26)
        _LSContextDestroy(CurrentContext);
      v10 = v25;
      CurrentContext = 0;
      v25 = 0;

      v26 = 0;
      v11 = v27;
      v27 = 0;

    }
    else
    {
      +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_439);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke_3;
      v15[3] = &unk_1E1042110;
      v15[4] = &v28;
      objc_msgSend(v12, "getBundleRecordForCoreTypesWithCompletionHandler:", v15);

    }
    LaunchServices::Record::storeWeakSharedRecord(v29[5], &LaunchServices::Record::weakCoreTypesRecord);
  }

  v13 = v29[5];
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (LSBundleRecord)_realRecord
{
  LSBundleRecord *realRecord;
  LSBundleRecord *v4;
  LSBundleRecord *v5;
  LSBundleRecord *v6;

  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
  realRecord = self->_realRecord;
  if (!realRecord)
  {
    -[_LSCoreTypesRecordProxy _loadRealRecord](self, "_loadRealRecord");
    v4 = (LSBundleRecord *)objc_claimAutoreleasedReturnValue();
    v5 = self->_realRecord;
    self->_realRecord = v4;

    realRecord = self->_realRecord;
  }
  v6 = realRecord;
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
  return v6;
}

- (id)bundleIdentifier
{
  return CFSTR("com.apple.mobilecoretypes");
}

- (id)applicationIdentifier
{
  return 0;
}

- (id)teamIdentifier
{
  return CFSTR("0000000000");
}

- (id)executableURL
{
  return 0;
}

- (char)developerType
{
  return 1;
}

- (id)machOUUIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)SDKVersion
{
  return 0;
}

- (unsigned)platform
{
  return 0;
}

- (BOOL)wasBuiltWithThreadSanitizer
{
  return 0;
}

- (id)serviceRecords
{
  return objc_alloc_init(MEMORY[0x1E0C99E60]);
}

- (id)dataContainerURL
{
  return 0;
}

- (id)localizedName
{
  return CFSTR("CoreTypes");
}

- (id)localizedShortName
{
  return CFSTR("CoreTypes");
}

- (id)localizedNameWithPreferredLocalizations:(id)a3
{
  return CFSTR("CoreTypes");
}

- (id)localizedShortNameWithPreferredLocalizations:(id)a3
{
  return CFSTR("CoreTypes");
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3
{
  return 0;
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4
{
  return 0;
}

- (id)signerOrganization
{
  return 0;
}

- (id)signerIdentity
{
  return 0;
}

- (BOOL)isProfileValidated
{
  return 0;
}

- (BOOL)isUPPValidated
{
  return 0;
}

- (BOOL)isFreeProfileValidated
{
  return 0;
}

- (id)managedPersonas
{
  return 0;
}

- (id)associatedPersonas
{
  return 0;
}

- (id)_personasWithAttributes
{
  return 0;
}

- (id)UIBackgroundModes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)accentColorName
{
  return 0;
}

- (id)WKBackgroundModes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsNowPlaying
{
  return 0;
}

- (id)intentDefinitionURLs
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)supportedIntents
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)intentsRestrictedWhileLocked
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)intentsRestrictedWhileProtectedDataUnavailable
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)supportedIntentMediaCategories
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)forwardInvocation:(id)a3
{
  id v4;

  -[_LSCoreTypesRecordProxy forwardingTargetForSelector:](self, "forwardingTargetForSelector:", objc_msgSend(a3, "selector"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "setTarget:");
  objc_msgSend(a3, "invoke");

}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)+[LSBundleRecord instanceMethodSignatureForSelector:](LSBundleRecord, "instanceMethodSignatureForSelector:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_LSCoreTypesRecordProxy URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self || (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
      LOBYTE(v5) = objc_msgSend(a3, "isEqual:", self);
  }
  return v5;
}

+ (id)description
{
  return CFSTR("LS(Proxied)BundleRecord");
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;

  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  if (self->_realRecord)
    v5 = CFSTR("yes");
  else
    v5 = CFSTR("no");
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> { resolved: %@ }"), v4, self, v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_class *Class;

  Class = object_getClass(self);
  if (!Class)
    return +[LSBundleRecord isSubclassOfClass:](LSBundleRecord, "isSubclassOfClass:", a3);
  while (Class != a3)
  {
    Class = class_getSuperclass(Class);
    if (!Class)
      return +[LSBundleRecord isSubclassOfClass:](LSBundleRecord, "isSubclassOfClass:", a3);
  }
  return 1;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return (Class)objc_opt_class() == a3 || objc_opt_class() == (_QWORD)a3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_class *v4;
  objc_class *v6;

  v4 = (objc_class *)objc_opt_class();
  if (class_conformsToProtocol(v4, (Protocol *)a3))
    return 1;
  v6 = (objc_class *)objc_opt_class();
  return class_conformsToProtocol(v6, (Protocol *)a3);
}

+ (id)classFallbacksForKeyedArchiver
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
