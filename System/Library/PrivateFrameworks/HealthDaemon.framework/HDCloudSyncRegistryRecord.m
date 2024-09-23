@implementation HDCloudSyncRegistryRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("CloudSyncRegistryRecord");
}

+ (BOOL)hasFutureSchema:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 && objc_msgSend(v3, "integerValue") > 1;

  return v5;
}

+ (id)recordIDWithZoneID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C95070];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRecordName:zoneID:", CFSTR("CloudSyncRegistry"), v4);

  return v5;
}

+ (BOOL)isRegistryRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncRegistryRecord"));

  return v4;
}

+ (BOOL)isRegistryRecordID:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncRegistry"));

  return v4;
}

+ (id)sharedProfileIdentifierForOwnerProfileIdentifier:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  switch(v5)
  {
    case 1:
      goto LABEL_5;
    case 2:
    case 4:
      _HKInitializeLogging();
      v6 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v7 = v6;
        objc_msgSend(v4, "type");
        HKStringFromProfileType();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v8;
        _os_log_fault_impl(&dword_1B7802000, v7, OS_LOG_TYPE_FAULT, "Owner profile identifier of unexpected type %@", (uint8_t *)&v12, 0xCu);

      }
      goto LABEL_5;
    case 3:
      v3 = v4;
      goto LABEL_6;
    default:
      if (v5 == 100)
      {
LABEL_5:
        v9 = (void *)MEMORY[0x1E0CB6A10];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_profileWithUUID:type:", v10, 3);
        v3 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_6:

      return v3;
  }
}

- (id)initInZone:(id)a3 ownerProfileIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedProfileIdentifierForOwnerProfileIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDCloudSyncRegistryRecord initInZone:ownerProfileIdentifier:sharedProfileIdentifier:](self, "initInZone:ownerProfileIdentifier:sharedProfileIdentifier:", v7, v6, v8);

  return v9;
}

- (id)initInZone:(id)a3 ownerProfileIdentifier:(id)a4 sharedProfileIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HDCloudSyncRegistryRecord *v13;
  HDCloudSyncRegistryRecord *v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncRegistryRecord"), v11);
  v13 = -[HDCloudSyncRegistryRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v12, 1);
  v14 = v13;
  if (v13)
  {
    -[HDCloudSyncRegistryRecord setOwnerProfileIdentifier:](v13, "setOwnerProfileIdentifier:", v8);
    -[HDCloudSyncRegistryRecord setSharedProfileIdentifier:](v14, "setSharedProfileIdentifier:", v9);
  }

  return v14;
}

- (HDCloudSyncRegistryRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncRegistryRecord *v4;
  HDCloudSyncRegistryRecord *v5;
  void *v6;
  HDCloudSyncCodableRegistry *v7;
  HDCloudSyncCodableRegistry *v8;
  NSObject *v9;
  HDCloudSyncRegistryRecord *v10;
  HDCloudSyncCodableRegistry *v11;
  HDCloudSyncCodableRegistry *underlyingRegistry;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncRegistryRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v15, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableRegistry);
    underlyingRegistry = v5->_underlyingRegistry;
    v5->_underlyingRegistry = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableRegistry initWithData:]([HDCloudSyncCodableRegistry alloc], "initWithData:", v6);
  v8 = v5->_underlyingRegistry;
  v5->_underlyingRegistry = v7;

  if (v5->_underlyingRegistry)
  {
LABEL_8:

LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
  {
    v14[0] = 0;
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying registry.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)deleted
{
  return -[HDCloudSyncCodableRegistry deleted](self->_underlyingRegistry, "deleted");
}

- (void)setDeleted:(BOOL)a3
{
  -[HDCloudSyncCodableRegistry setDeleted:](self->_underlyingRegistry, "setDeleted:", a3);
}

- (NSString)displayFirstName
{
  return -[HDCloudSyncCodableRegistry displayFirstName](self->_underlyingRegistry, "displayFirstName");
}

- (void)setDisplayFirstName:(id)a3
{
  -[HDCloudSyncCodableRegistry setDisplayFirstName:](self->_underlyingRegistry, "setDisplayFirstName:", a3);
}

- (NSString)displayLastName
{
  return -[HDCloudSyncCodableRegistry displayLastName](self->_underlyingRegistry, "displayLastName");
}

- (void)setDisplayLastName:(id)a3
{
  -[HDCloudSyncCodableRegistry setDisplayLastName:](self->_underlyingRegistry, "setDisplayLastName:", a3);
}

- (NSDate)displayNameModificationDate
{
  void *v3;
  void *v4;

  if (-[HDCloudSyncCodableRegistry hasDisplayNameModificationDate](self->_underlyingRegistry, "hasDisplayNameModificationDate"))
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    -[HDCloudSyncCodableRegistry displayNameModificationDate](self->_underlyingRegistry, "displayNameModificationDate");
    objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (void)setDisplayNameModificationDate:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    -[HDCloudSyncCodableRegistry setDisplayNameModificationDate:](self->_underlyingRegistry, "setDisplayNameModificationDate:");
  }
  else
  {
    -[HDCloudSyncCodableRegistry setHasDisplayNameModificationDate:](self->_underlyingRegistry, "setHasDisplayNameModificationDate:");
  }
}

- (id)_profileIdentifierWithCodableProfileIdentifier:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = (void *)MEMORY[0x1E0CB3A28];
    v4 = a2;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_UUIDWithData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "type");
    if (v6 && objc_msgSend(MEMORY[0x1E0CB6A10], "isValidProfileType:", v7))
    {
      objc_msgSend(MEMORY[0x1E0CB6A10], "_profileWithUUID:type:", v6, v7);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (HDCloudSyncCodableProfileIdentifier)_codableProfileIdentifierWithProfileIdentifier:(uint64_t)a1
{
  id v2;
  HDCloudSyncCodableProfileIdentifier *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v2 = a2;
    v3 = objc_alloc_init(HDCloudSyncCodableProfileIdentifier);
    -[HDCloudSyncCodableProfileIdentifier setType:](v3, "setType:", objc_msgSend(v2, "type"));
    objc_msgSend(v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "hk_dataForUUIDBytes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableProfileIdentifier setIdentifier:](v3, "setIdentifier:", v5);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (HKProfileIdentifier)ownerProfileIdentifier
{
  void *v3;
  void *v4;

  -[HDCloudSyncCodableRegistry ownerProfileIdentifier](self->_underlyingRegistry, "ownerProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRegistryRecord _profileIdentifierWithCodableProfileIdentifier:]((uint64_t)self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKProfileIdentifier *)v4;
}

- (void)setOwnerProfileIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncRegistryRecord.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileIdentifier != nil"));

    v5 = 0;
  }
  -[HDCloudSyncRegistryRecord _codableProfileIdentifierWithProfileIdentifier:]((uint64_t)self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableRegistry setOwnerProfileIdentifier:](self->_underlyingRegistry, "setOwnerProfileIdentifier:", v6);

}

- (HKProfileIdentifier)sharedProfileIdentifier
{
  void *v3;
  void *v4;

  -[HDCloudSyncCodableRegistry sharedProfileIdentifier](self->_underlyingRegistry, "sharedProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRegistryRecord _profileIdentifierWithCodableProfileIdentifier:]((uint64_t)self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKProfileIdentifier *)v4;
}

- (void)setSharedProfileIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncRegistryRecord.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileIdentifier != nil"));

    v5 = 0;
  }
  -[HDCloudSyncRegistryRecord _codableProfileIdentifierWithProfileIdentifier:]((uint64_t)self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableRegistry setSharedProfileIdentifier:](self->_underlyingRegistry, "setSharedProfileIdentifier:", v6);

}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableRegistry data](self->_underlyingRegistry, "data");
}

- (NSSet)disabledOwnerIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HDCloudSyncCodableRegistry disabledOwnerIdentifiers](self->_underlyingRegistry, "disabledOwnerIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSSet *)v7;
}

- (void)setDisabledOwnerIdentifiers:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v5, "mutableCopy");
  -[HDCloudSyncCodableRegistry setDisabledOwnerIdentifiers:](self->_underlyingRegistry, "setDisabledOwnerIdentifiers:", v4);

}

- (NSSet)disabledSyncIdentities
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[HDCloudSyncCodableRegistry disabledSyncIdentities](self->_underlyingRegistry, "disabledSyncIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HDCloudSyncCodableRegistry disabledSyncIdentities](self->_underlyingRegistry, "disabledSyncIdentities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_225);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v6;
}

id __51__HDCloudSyncRegistryRecord_disabledSyncIdentities__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", a2, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_fault_impl(&dword_1B7802000, v5, OS_LOG_TYPE_FAULT, "Failed to decode codableIdentity with error: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (void)setDisabledSyncIdentities:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_map:", &__block_literal_global_204_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[HDCloudSyncCodableRegistry setDisabledSyncIdentities:](self->_underlyingRegistry, "setDisabledSyncIdentities:", v5);

}

uint64_t __55__HDCloudSyncRegistryRecord_setDisabledSyncIdentities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableSyncIdentity");
}

- (NSSet)ownerIdentifiers
{
  void *v3;
  void *v4;
  void *v5;

  -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_mapToSet:", &__block_literal_global_206_0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v5;
}

uint64_t __45__HDCloudSyncRegistryRecord_ownerIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ownerIdentifier");
}

- (NSSet)syncIdentities
{
  void *v3;
  void *v4;
  void *v5;

  -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_mapToSet:", &__block_literal_global_207_1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v5;
}

id __43__HDCloudSyncRegistryRecord_syncIdentities__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "hasSyncIdentity"))
  {
    objc_msgSend(v2, "syncIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;

    if (!v4)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v5;
        _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "Failed to decode codableIdentity with error: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)childHeaderRecordIDs
{
  uint64_t i;
  void *v3;
  void *v4;
  id v5;
  void *v6;
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
  void *v17;
  id obj;
  uint64_t v20;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v23)
  {
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v3, "ownerIdentifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v3, "storeIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
        -[HDCloudSyncRecord recordID](self, "recordID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "zoneID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDCloudSyncStoreRecord recordIDForOwnerIdentifier:storeIdentifier:zoneID:](HDCloudSyncStoreRecord, "recordIDForOwnerIdentifier:storeIdentifier:zoneID:", v4, v7, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v10);

        objc_msgSend(v3, "ownerIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v3, "storeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);
        -[HDCloudSyncRecord recordID](self, "recordID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "zoneID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDCloudSyncSequenceRecord recordIDsForOwnerIdentifier:storeIdentifier:zoneID:](HDCloudSyncSequenceRecord, "recordIDsForOwnerIdentifier:storeIdentifier:zoneID:", v11, v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObjectsFromArray:", v17);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v23);
  }

  return (NSArray *)v22;
}

- (id)storeIdentifiersForOwnerIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__HDCloudSyncRegistryRecord_storeIdentifiersForOwnerIdentifier___block_invoke;
    v9[3] = &unk_1E6D0E120;
    v10 = v4;
    objc_msgSend(v6, "hk_mapToSet:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __64__HDCloudSyncRegistryRecord_storeIdentifiersForOwnerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "ownerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)storeIdentifiersForSyncIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__HDCloudSyncRegistryRecord_storeIdentifiersForSyncIdentity___block_invoke;
    v9[3] = &unk_1E6D0E120;
    v10 = v4;
    objc_msgSend(v6, "hk_mapToSet:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __61__HDCloudSyncRegistryRecord_storeIdentifiersForSyncIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "syncIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "codableSyncIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "storeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)addStoreIdentifier:(id)a3 ownerIdentifier:(id)a4 syncIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HDCloudSyncCodableRegisteredStore *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v13 = objc_alloc_init(HDCloudSyncCodableRegisteredStore);
  -[HDCloudSyncCodableRegisteredStore setOwnerIdentifier:](v13, "setOwnerIdentifier:", v9);

  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCodableRegisteredStore setStoreIdentifier:](v13, "setStoreIdentifier:", v11);
  objc_msgSend(v8, "codableSyncIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCodableRegisteredStore setSyncIdentity:](v13, "setSyncIdentity:", v12);
  -[HDCloudSyncCodableRegistry addStores:](self->_underlyingRegistry, "addStores:", v13);

}

- (void)removeStoreIdentifier:(id)a3 ownerIdentifier:(id)a4 syncIdentity:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableRegistry stores](self->_underlyingRegistry, "stores");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__HDCloudSyncRegistryRecord_removeStoreIdentifier_ownerIdentifier_syncIdentity___block_invoke;
  v15[3] = &unk_1E6D0E148;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v11, "hk_removeObjectsPassingTest:", v15);

}

uint64_t __80__HDCloudSyncRegistryRecord_removeStoreIdentifier_ownerIdentifier_syncIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "syncIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "syncIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "codableSyncIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      objc_msgSend(v3, "storeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    objc_msgSend(v3, "ownerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 48)))
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v3, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));
  }

LABEL_9:
  return v8;
}

- (id)printDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncRegistryRecord disabledOwnerIdentifiers](self, "disabledOwnerIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRegistryRecord disabledSyncIdentities](self, "disabledSyncIdentities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("+ Disabled Owners: %@\n| Disabled Sync Identities: %@\n+--------------------------------------------------"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRegistry, 0);
}

@end
