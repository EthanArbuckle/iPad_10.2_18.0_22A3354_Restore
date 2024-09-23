@implementation NSCloudKitMirroringDelegatePreJazzkonMetadata

+ (uint64_t)allDefaultsKeys
{
  _QWORD v1[9];

  v1[8] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("NSCloudKitMirroringDelegateInitializedZoneDefaultsKey");
  v1[1] = CFSTR("NSCloudKitMirroringDelegateInitializedZoneSubscriptionDefaultsKey");
  v1[2] = CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey");
  v1[3] = CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey");
  v1[4] = CFSTR("PFCloudKitServerChangeTokenKey");
  v1[5] = CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey");
  v1[6] = CFSTR("NSCloudKitMirroringDelegateServerChangeTokensKey");
  v1[7] = CFSTR("NSCloudKitMirroringDelegateInitializedDatabaseSubscriptionKey");
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 8);
}

- (NSCloudKitMirroringDelegatePreJazzkonMetadata)initWithStore:(id)a3
{
  NSCloudKitMirroringDelegatePreJazzkonMetadata *v4;
  NSCloudKitMirroringDelegatePreJazzkonMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSCloudKitMirroringDelegatePreJazzkonMetadata;
  v4 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak((id *)&v4->_store, a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_store, 0);

  self->_ckIdentityRecordName = 0;
  self->_keyToPreviousServerChangeToken = 0;

  self->_lastHistoryToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegatePreJazzkonMetadata;
  -[NSCloudKitMirroringDelegatePreJazzkonMetadata dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  NSString *ckIdentityRecordName;
  NSString *v11;
  NSDictionary *keyToPreviousServerChangeToken;
  NSDictionary *v13;
  NSPersistentHistoryToken *lastHistoryToken;
  objc_super v16;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_store);
    v6 = objc_loadWeakRetained((id *)a3 + 1);
    if (self->_loaded != *((unsigned __int8 *)a3 + 16)
      || self->_hasInitializedZone != *((unsigned __int8 *)a3 + 18)
      || self->_hasCheckedCKIdentity != *((unsigned __int8 *)a3 + 32)
      || self->_hasInitializedZoneSubscription != *((unsigned __int8 *)a3 + 19)
      || self->_hasInitializedDatabaseSubscription != *((unsigned __int8 *)a3 + 20))
    {
      goto LABEL_25;
    }
    v7 = (void *)objc_msgSend(WeakRetained, "identifier");
    v8 = objc_msgSend(v6, "identifier");
    if (v7 != (void *)v8)
    {
      v9 = 0;
      if (!v7 || !v8)
        goto LABEL_26;
      if (!objc_msgSend(v7, "isEqualToString:", v8))
        goto LABEL_25;
    }
    ckIdentityRecordName = self->_ckIdentityRecordName;
    v11 = (NSString *)*((_QWORD *)a3 + 3);
    if (ckIdentityRecordName != v11)
    {
      v9 = 0;
      if (!ckIdentityRecordName || !v11)
        goto LABEL_26;
      if (!-[NSString isEqualToString:](ckIdentityRecordName, "isEqualToString:"))
        goto LABEL_25;
    }
    keyToPreviousServerChangeToken = self->_keyToPreviousServerChangeToken;
    v13 = (NSDictionary *)*((_QWORD *)a3 + 5);
    if (keyToPreviousServerChangeToken != v13)
    {
      v9 = 0;
      if (!keyToPreviousServerChangeToken || !v13)
        goto LABEL_26;
      if (!-[NSDictionary isEqualToDictionary:](keyToPreviousServerChangeToken, "isEqualToDictionary:"))
        goto LABEL_25;
    }
    lastHistoryToken = self->_lastHistoryToken;
    if (lastHistoryToken == *((NSPersistentHistoryToken **)a3 + 6)
      || -[NSPersistentHistoryToken isEqual:](lastHistoryToken, "isEqual:"))
    {
      v9 = 1;
    }
    else
    {
LABEL_25:
      v9 = 0;
    }
LABEL_26:

    return v9;
  }
  v16.receiver = self;
  v16.super_class = (Class)NSCloudKitMirroringDelegatePreJazzkonMetadata;
  return -[NSCloudKitMirroringDelegatePreJazzkonMetadata isEqual:](&v16, sel_isEqual_, a3);
}

- (id)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  NSDictionary *keyToPreviousServerChangeToken;
  _QWORD v11[5];

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->_loaded)
    v6 = CFSTR("loaded");
  else
    v6 = CFSTR("not-loaded");
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; %@"), v5, self, v6);
  v8 = v7;
  if (self->_loaded)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR(",changed:%d"), self->_hasChanges);
    objc_msgSend(v8, "appendFormat:", CFSTR(",initZone:%d"), self->_hasInitializedZone);
    objc_msgSend(v8, "appendFormat:", CFSTR(",initZoneSub:%d"), self->_hasInitializedZoneSubscription);
    objc_msgSend(v8, "appendFormat:", CFSTR(",initDatabaseSub:%d"), self->_hasInitializedDatabaseSubscription);
    objc_msgSend(v8, "appendFormat:", CFSTR(",identity:%@"), self->_ckIdentityRecordName);
    objc_msgSend(v8, "appendFormat:", CFSTR(",checkedIdentity:%d"), self->_hasCheckedCKIdentity);
    objc_msgSend(v8, "appendString:", CFSTR(",changeTokens:"));
    if (-[NSDictionary count](self->_keyToPreviousServerChangeToken, "count"))
    {
      keyToPreviousServerChangeToken = self->_keyToPreviousServerChangeToken;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __60__NSCloudKitMirroringDelegatePreJazzkonMetadata_description__block_invoke;
      v11[3] = &unk_1E1EE1E78;
      v11[4] = v8;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](keyToPreviousServerChangeToken, "enumerateKeysAndObjectsUsingBlock:", v11);
    }
    else
    {
      objc_msgSend(v8, "appendString:", CFSTR("empty"));
    }
    objc_msgSend(v8, "appendFormat:", CFSTR("historyToken:%@"), self->_lastHistoryToken);
  }
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  return v8;
}

uint64_t __60__NSCloudKitMirroringDelegatePreJazzkonMetadata_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(",%@:%@"), a2, a3);
}

- (BOOL)hasInitializedZoneSubscription
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (result)
  {
    if (!*(_BYTE *)(result + 16))
    {
      v1 = (void *)MEMORY[0x1E0C99DA0];
      v2 = *MEMORY[0x1E0C99768];
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_opt_class();
      v5 = (void *)objc_msgSend(v1, "exceptionWithName:reason:userInfo:", v2, objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@ called before load."), v4, NSStringFromSelector(sel_hasInitializedZoneSubscription)), 0);
      objc_exception_throw(v5);
    }
    return *(_BYTE *)(result + 19) != 0;
  }
  return result;
}

- (BOOL)hasInitializedDatabaseSubscription
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (result)
  {
    if (!*(_BYTE *)(result + 16))
    {
      v1 = (void *)MEMORY[0x1E0C99DA0];
      v2 = *MEMORY[0x1E0C99768];
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_opt_class();
      v5 = (void *)objc_msgSend(v1, "exceptionWithName:reason:userInfo:", v2, objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@ called before load."), v4, NSStringFromSelector(sel_hasInitializedDatabaseSubscription)), 0);
      objc_exception_throw(v5);
    }
    return *(_BYTE *)(result + 20) != 0;
  }
  return result;
}

- (id)ckIdentityRecordName
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (result)
  {
    if (!*((_BYTE *)result + 16))
    {
      v1 = (void *)MEMORY[0x1E0C99DA0];
      v2 = *MEMORY[0x1E0C99768];
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_opt_class();
      v5 = (void *)objc_msgSend(v1, "exceptionWithName:reason:userInfo:", v2, objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@ called before load."), v4, NSStringFromSelector(sel_ckIdentityRecordName)), 0);
      objc_exception_throw(v5);
    }
    return *((id *)result + 3);
  }
  return result;
}

- (BOOL)hasCheckedCKIdentity
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (result)
  {
    if (!*(_BYTE *)(result + 16))
    {
      v1 = (void *)MEMORY[0x1E0C99DA0];
      v2 = *MEMORY[0x1E0C99768];
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_opt_class();
      v5 = (void *)objc_msgSend(v1, "exceptionWithName:reason:userInfo:", v2, objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@ called before load."), v4, NSStringFromSelector(sel_hasCheckedCKIdentity)), 0);
      objc_exception_throw(v5);
    }
    return *(_BYTE *)(result + 32) != 0;
  }
  return result;
}

- (uint64_t)changeTokenForZoneWithID:(uint64_t)a3 inDatabaseWithScope:
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (result)
  {
    if (!*(_BYTE *)(result + 16))
    {
      v3 = (void *)MEMORY[0x1E0C99DA0];
      v4 = *MEMORY[0x1E0C99768];
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = objc_opt_class();
      v7 = (void *)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@ called before load."), v6, NSStringFromSelector(sel_changeTokenForZoneWithID_inDatabaseWithScope_)), 0);
      objc_exception_throw(v7);
    }
    return objc_msgSend(*(id *)(result + 40), "objectForKey:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForZoneName:owner:databseScope:](objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName"), a3));
  }
  return result;
}

- (id)_keyForZoneName:(uint64_t)a1 owner:(uint64_t)a2 databseScope:(uint64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForDatabaseScope:](a3));
  objc_msgSend(v5, "appendFormat:", CFSTR(".%@.%@"), a1, a2);
  v6 = (id)objc_msgSend(v5, "copy");

  return v6;
}

- (uint64_t)changeTokenForDatabaseScope:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (result)
  {
    if (!*(_BYTE *)(result + 16))
    {
      v2 = (void *)MEMORY[0x1E0C99DA0];
      v3 = *MEMORY[0x1E0C99768];
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = objc_opt_class();
      v6 = (void *)objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@ called before load."), v5, NSStringFromSelector(sel_changeTokenForDatabaseScope_)), 0);
      objc_exception_throw(v6);
    }
    return objc_msgSend(*(id *)(result + 40), "objectForKey:", -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForDatabaseScope:](a2));
  }
  return result;
}

- (__CFString)_keyForDatabaseScope:(uint64_t)a1
{
  if ((unint64_t)(a1 - 1) >= 3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown database scope: %lu"), a1), 0));
  return off_1E1EE1E98[a1 - 1];
}

- (uint64_t)lastHistoryToken
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (result)
  {
    if (!*(_BYTE *)(result + 16))
    {
      v1 = (void *)MEMORY[0x1E0C99DA0];
      v2 = *MEMORY[0x1E0C99768];
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_opt_class();
      v5 = (void *)objc_msgSend(v1, "exceptionWithName:reason:userInfo:", v2, objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@ called before load."), v4, NSStringFromSelector(sel_lastHistoryToken)), 0);
      objc_exception_throw(v5);
    }
    return *(_QWORD *)(result + 48);
  }
  return result;
}

- (uint64_t)load:(uint64_t)a1
{
  uint64_t v3;
  id Weak;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  int v44;
  id v46;
  id v47;
  uint64_t v48;
  _BYTE buf[12];
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!*(_BYTE *)(a1 + 16))
  {
    Weak = objc_loadWeak((id *)(a1 + 8));
    v47 = (id)objc_msgSend(Weak, "persistentStoreCoordinator");
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v46 = Weak;
    v6 = (void *)objc_msgSend(Weak, "metadata");
    *(_BYTE *)(a1 + 18) = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateInitializedZoneDefaultsKey")), "BOOLValue");
    *(_BYTE *)(a1 + 19) = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateInitializedZoneSubscriptionDefaultsKey")), "BOOLValue");
    *(_BYTE *)(a1 + 20) = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateInitializedDatabaseSubscriptionKey")), "BOOLValue");
    *(_QWORD *)(a1 + 24) = (id)objc_msgSend(v6, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"));
    *(_BYTE *)(a1 + 32) = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey")), "BOOLValue");
    v7 = 1;
    v8 = objc_msgSend(v6, "objectForKey:", CFSTR("PFCloudKitServerChangeTokenKey"));
    if (v8)
    {
      *(_QWORD *)buf = 0;
      v9 = (void *)MEMORY[0x1E0CB3710];
      getCloudKitCKServerChangeTokenClass[0]();
      v10 = objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, buf);
      if (v10
        || objc_msgSend(*(id *)buf, "code") == 4865
        && (v11 = (void *)objc_msgSend(*(id *)buf, "domain"),
            (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0))
      {
        v48 = 0;
      }
      else
      {
        v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deserialize '%@' out of the metadata for store: %@"), CFSTR("PFCloudKitServerChangeTokenKey"), v46);
        v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v13, "setObject:forKey:", v12, *MEMORY[0x1E0CB2D68]);
        if (*(_QWORD *)buf)
          objc_msgSend(v13, "setObject:forKey:", *(_QWORD *)buf, *MEMORY[0x1E0CB3388]);
        v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v15 = objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134402, v13);

        v48 = v15;
        v7 = 0;
      }
    }
    else
    {
      v48 = 0;
      v10 = 0;
    }
    v16 = objc_msgSend(v6, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateServerChangeTokensKey"));
    if (v16)
    {
      v44 = v7;
      v17 = v5;
      *(_QWORD *)buf = 0;
      v18 = (void *)MEMORY[0x1E0CB3710];
      v19 = (void *)MEMORY[0x1E0C99E60];
      v20 = objc_opt_class();
      v21 = objc_opt_class();
      getCloudKitCKServerChangeTokenClass[0]();
      v22 = (void *)objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0), v16, buf);
      if (v22)
      {
        *(_QWORD *)(a1 + 40) = v22;
        v5 = v17;
        v7 = v44;
      }
      else
      {
        v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deserialize '%@' out of the metadata for store: %@"), CFSTR("NSCloudKitMirroringDelegateServerChangeTokensKey"), v46);
        v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v5 = v17;
        objc_msgSend(v26, "setObject:forKey:", v25, *MEMORY[0x1E0CB2D68]);
        if (*(_QWORD *)buf)
          objc_msgSend(v26, "setObject:forKey:", *(_QWORD *)buf, *MEMORY[0x1E0CB3388]);
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v48 = objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134402, v26);

        v7 = 0;
      }
    }
    else
    {
      if (v10)
      {
        v23 = getCloudKitCKCurrentUserDefaultName[0]();
        v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForZoneName:owner:databseScope:]((uint64_t)CFSTR("com.apple.coredata.cloudkit.zone"), v23, 2), 0);
      }
      else
      {
        v24 = objc_alloc_init(MEMORY[0x1E0C99D80]);
      }
      *(_QWORD *)(a1 + 40) = v24;
    }
    v28 = objc_msgSend(v6, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"));
    if (v28)
    {
      *(_QWORD *)buf = 0;
      v29 = (void *)v48;
      v30 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v28, buf);
      if (v30)
      {
        *(_QWORD *)(a1 + 48) = v30;
      }
      else
      {
        v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deserialize '%@' out of the metadata for store: %@"), CFSTR("NSCloudKitMirroringDelegateLastHistoryTokenKey"), v46);
        v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v32, "setObject:forKey:", v31, *MEMORY[0x1E0CB2D68]);
        if (*(_QWORD *)buf)
          objc_msgSend(v32, "setObject:forKey:", *(_QWORD *)buf, *MEMORY[0x1E0CB3388]);
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = (void *)objc_msgSend(v33, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134402, v32);

        v7 = 0;
      }
    }
    else
    {
      v29 = (void *)v48;
    }
    objc_autoreleasePoolPop(v5);
    v34 = 0;
    if (!v7 && v29)
      v34 = v29;

    if (v7)
    {
      v3 = 1;
      *(_BYTE *)(a1 + 16) = 1;
LABEL_42:

      return v3;
    }
    if (v34)
    {
      if (a2)
      {
        v3 = 0;
        *a2 = v34;
        goto LABEL_42;
      }
    }
    else
    {
      v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v35, v36, v37, v38, v39, v40, v41, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegatePreJazzkonMetadata.m");
      v42 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegatePreJazzkonMetadata.m";
        v50 = 1024;
        v51 = 458;
        _os_log_fault_impl(&dword_18A253000, v42, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v3 = 0;
    goto LABEL_42;
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
}

@end
