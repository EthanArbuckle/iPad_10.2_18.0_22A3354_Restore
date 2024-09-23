@implementation HDDataProvenanceCache

- (id)provenanceWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HDDataProvenanceManager *provenanceManager;
  HDDatabaseTransaction *transaction;
  void *v9;
  id v10;
  id v11;
  void *v12;
  HDProfile *profile;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_provenanceByID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    provenanceManager = self->_provenanceManager;
    transaction = self->_transaction;
    v35 = 0;
    -[HDDataProvenanceManager originProvenanceForPersistentID:transaction:error:](provenanceManager, "originProvenanceForPersistentID:transaction:error:", v4, transaction, &v35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v35;
    if (!v9)
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v38 = v4;
        v39 = 2114;
        v40 = v10;
        _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "failed to find provenance for provenance %{public}@: %{public}@", buf, 0x16u);
      }
      v6 = 0;
      goto LABEL_22;
    }
    v11 = v9;
    objc_msgSend(v11, "contributorReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    profile = self->_profile;
    v36 = 0;
    +[HDContributorEntity externalReferenceForContributorReference:profile:error:](HDContributorEntity, "externalReferenceForContributorReference:profile:error:", v12, profile, &v36);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v36;

    v34 = (void *)v14;
    if (!v14)
    {
      if (objc_msgSend(v15, "hk_isTransactionInterruptedError"))
      {
        v16 = v15;
        if (v16)
        {
          v17 = objc_retainAutorelease(v16);
          v18 = 0;

LABEL_16:
          v27 = v17;

          if (v18)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_provenanceByID, "setObject:forKeyedSubscript:", v18, v4);
            v6 = v18;
          }
          else
          {
            _HKInitializeLogging();
            v28 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v38 = v4;
              v39 = 2114;
              v40 = v27;
              _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "failed to externalize contributor for provenance %{public}@: %{public}@", buf, 0x16u);
            }
            v6 = 0;
          }
          v10 = v27;
LABEL_22:

          goto LABEL_23;
        }
        v34 = 0;
        v18 = 0;
LABEL_15:
        v17 = v10;

        goto LABEL_16;
      }
      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v15;
        _os_log_fault_impl(&dword_1B7802000, v20, OS_LOG_TYPE_FAULT, "Failed to externalize contributor reference: %{public}@", buf, 0xCu);
      }
      +[HDContributorReference contributorReferenceForNoContributor](HDContributorReference, "contributorReferenceForNoContributor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v31 = objc_msgSend(v11, "syncProvenance");
    v30 = objc_msgSend(v11, "syncIdentity");
    objc_msgSend(v11, "productType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemBuild");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "operatingSystemVersion");
    objc_msgSend(v11, "sourceVersion");
    v33 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeZoneName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceID");
    v32 = v15;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", v31, v30, v21, v22, buf, v23, v24, v25, v26, v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v32;
    v10 = v33;

    goto LABEL_15;
  }
  v6 = v5;
LABEL_23:

  return v6;
}

- (id)deviceForPersistentID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceByPersistentIDCache, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "deviceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceForPersistentID:error:", v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceByPersistentIDCache, "setObject:forKeyedSubscript:", v10, v8);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableObjectCollectionsByProvenance, 0);
  objc_storeStrong((id *)&self->_contributorByReferenceCache, 0);
  objc_storeStrong((id *)&self->_deviceByPersistentIDCache, 0);
  objc_storeStrong((id *)&self->_sourceRevisionsDictionaryBySourceCache, 0);
  objc_storeStrong((id *)&self->_sourceRevisionByDataProvenanceIDCache, 0);
  objc_storeStrong((id *)&self->_sourceByPersistentIDCache, 0);
  objc_storeStrong((id *)&self->_deviceUUIDBytesByID, 0);
  objc_storeStrong((id *)&self->_codableSourcesByID, 0);
  objc_storeStrong((id *)&self->_provenanceByID, 0);
  objc_storeStrong((id *)&self->_sourceEncoder, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_provenanceManager, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

- (id)codableProvenanceWithProvenance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDCodableProvenance *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;

  v4 = a3;
  -[HDDataProvenanceCache codableSourceWithProvenance:profile:](self, "codableSourceWithProvenance:profile:", v4, self->_profile);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HDDataProvenanceCache deviceUUIDBytesWithProvenance:](self, "deviceUUIDBytesWithProvenance:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(HDCodableProvenance);
    objc_msgSend(v4, "systemBuild");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableProvenance setOriginBuild:](v8, "setOriginBuild:", v9);

    objc_msgSend(v4, "productType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableProvenance setOriginProductType:](v8, "setOriginProductType:", v10);

    objc_msgSend(v4, "timeZoneName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableProvenance setTimeZoneName:](v8, "setTimeZoneName:", v11);

    objc_msgSend(v5, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableProvenance setSourceUUID:](v8, "setSourceUUID:", v12);

    -[HDCodableProvenance setSourceVersion:](v8, "setSourceVersion:", v7);
    -[HDCodableProvenance setDeviceUUID:](v8, "setDeviceUUID:", v6);
    if (v4)
    {
      objc_msgSend(v4, "operatingSystemVersion");
      -[HDCodableProvenance setOriginMajorVersion:](v8, "setOriginMajorVersion:", v22);
      objc_msgSend(v4, "operatingSystemVersion");
      -[HDCodableProvenance setOriginMinorVersion:](v8, "setOriginMinorVersion:", v21);
      objc_msgSend(v4, "operatingSystemVersion");
      v13 = v20;
    }
    else
    {
      -[HDCodableProvenance setOriginMajorVersion:](v8, "setOriginMajorVersion:", 0);
      -[HDCodableProvenance setOriginMinorVersion:](v8, "setOriginMinorVersion:", 0);
      v13 = 0;
    }
    -[HDCodableProvenance setOriginPatchVersion:](v8, "setOriginPatchVersion:", v13);
    objc_msgSend(v4, "contributorReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "contributorType");

    if (v15 != 2)
    {
      objc_msgSend(v4, "contributorReference");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_dataForUUIDBytes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableProvenance setContributorUUID:](v8, "setContributorUUID:", v18);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)deviceUUIDBytesWithProvenance:(id)a3
{
  void *v4;
  void *v5;
  HDDeviceEntity *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceUUIDBytesByID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = -[HDSQLiteEntity initWithPersistentID:]([HDDeviceEntity alloc], "initWithPersistentID:", objc_msgSend(v4, "longLongValue"));
    -[HDDatabaseTransaction unprotectedDatabase](self->_transaction, "unprotectedDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    -[HDDeviceEntity deviceUUIDInDatabase:error:](v6, "deviceUUIDInDatabase:error:", v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v8)
    {
      objc_msgSend(v8, "hk_dataForUUIDBytes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceUUIDBytesByID, "setObject:forKeyedSubscript:", v5, v4);
    }
    else
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v14 = v4;
        v15 = 2114;
        v16 = v9;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to find device %{public}@: %{public}@", buf, 0x16u);
      }
      v5 = 0;
    }

  }
  return v5;
}

- (id)allCodableObjectCollections
{
  NSMutableDictionary *codableObjectCollectionsByProvenance;
  void *v3;

  codableObjectCollectionsByProvenance = self->_codableObjectCollectionsByProvenance;
  if (codableObjectCollectionsByProvenance)
  {
    -[NSMutableDictionary allValues](codableObjectCollectionsByProvenance, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (void)clearCodableObjectCollections
{
  NSMutableDictionary *codableObjectCollectionsByProvenance;

  codableObjectCollectionsByProvenance = self->_codableObjectCollectionsByProvenance;
  self->_codableObjectCollectionsByProvenance = 0;

}

- (HDDataProvenanceCache)initWithProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5
{
  id v9;
  id v10;
  HDDataProvenanceCache *v11;
  HDDataProvenanceCache *v12;
  uint64_t v13;
  HDDataProvenanceManager *provenanceManager;
  NSMutableDictionary *v15;
  NSMutableDictionary *provenanceByID;
  NSMutableDictionary *v17;
  NSMutableDictionary *codableSourcesByID;
  NSMutableDictionary *v19;
  NSMutableDictionary *deviceUUIDBytesByID;
  NSMutableDictionary *v21;
  NSMutableDictionary *sourceByPersistentIDCache;
  NSMutableDictionary *v23;
  NSMutableDictionary *sourceRevisionByDataProvenanceIDCache;
  NSMutableDictionary *v25;
  NSMutableDictionary *sourceRevisionsDictionaryBySourceCache;
  NSMutableDictionary *v27;
  NSMutableDictionary *deviceByPersistentIDCache;
  NSMutableDictionary *v29;
  NSMutableDictionary *contributorByReferenceCache;
  uint64_t v31;
  HDEntityEncoder *sourceEncoder;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)HDDataProvenanceCache;
  v11 = -[HDDataProvenanceCache init](&v34, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_profile, a3);
    objc_msgSend(v9, "dataProvenanceManager");
    v13 = objc_claimAutoreleasedReturnValue();
    provenanceManager = v12->_provenanceManager;
    v12->_provenanceManager = (HDDataProvenanceManager *)v13;

    objc_storeStrong((id *)&v12->_transaction, a4);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    provenanceByID = v12->_provenanceByID;
    v12->_provenanceByID = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    codableSourcesByID = v12->_codableSourcesByID;
    v12->_codableSourcesByID = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceUUIDBytesByID = v12->_deviceUUIDBytesByID;
    v12->_deviceUUIDBytesByID = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sourceByPersistentIDCache = v12->_sourceByPersistentIDCache;
    v12->_sourceByPersistentIDCache = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sourceRevisionByDataProvenanceIDCache = v12->_sourceRevisionByDataProvenanceIDCache;
    v12->_sourceRevisionByDataProvenanceIDCache = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sourceRevisionsDictionaryBySourceCache = v12->_sourceRevisionsDictionaryBySourceCache;
    v12->_sourceRevisionsDictionaryBySourceCache = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceByPersistentIDCache = v12->_deviceByPersistentIDCache;
    v12->_deviceByPersistentIDCache = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contributorByReferenceCache = v12->_contributorByReferenceCache;
    v12->_contributorByReferenceCache = v29;

    +[HDSourceEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDSourceEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v9, v10, a5, 0, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    sourceEncoder = v12->_sourceEncoder;
    v12->_sourceEncoder = (HDEntityEncoder *)v31;

  }
  return v12;
}

- (id)codableSourceWithProvenance:(id)a3 profile:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  HDSourceEntity *v11;
  void *v12;
  _BOOL4 v13;
  HDEntityEncoder *sourceEncoder;
  HDDatabaseTransaction *transaction;
  id v16;
  NSObject *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[HDEntityEncoder purpose](self->_sourceEncoder, "purpose"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataProvenanceCache.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_sourceEncoder purpose] == HDEntityEncodingPurposeCodableObjectCreation"));

  }
  objc_msgSend(v7, "sourceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_codableSourcesByID, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = -[HDSQLiteEntity initWithPersistentID:]([HDSourceEntity alloc], "initWithPersistentID:", objc_msgSend(v9, "longLongValue"));
    -[HDDatabaseTransaction unprotectedDatabase](self->_transaction, "unprotectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HDSQLiteEntity existsInDatabase:](v11, "existsInDatabase:", v12);

    if (v13)
    {
      transaction = self->_transaction;
      sourceEncoder = self->_sourceEncoder;
      v20 = 0;
      -[HDSourceEntity codableSourceWithEncoder:transaction:profile:error:](v11, "codableSourceWithEncoder:transaction:profile:error:", sourceEncoder, transaction, v8, &v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v20;
      if (v10)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_codableSourcesByID, "setObject:forKeyedSubscript:", v10, v9);
      }
      else
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v22 = v9;
          v23 = 2114;
          v24 = v16;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Failed to get codable source for sourceID %{public}@: %{public}@", buf, 0x16u);
        }
      }

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)codableObjectCollectionForProvenance:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *codableObjectCollectionsByProvenance;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  HDCodableObjectCollection *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HDDatabaseTransaction *transaction;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HDCodableObjectCollection *v21;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  codableObjectCollectionsByProvenance = self->_codableObjectCollectionsByProvenance;
  if (!codableObjectCollectionsByProvenance)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = self->_codableObjectCollectionsByProvenance;
    self->_codableObjectCollectionsByProvenance = v9;

    codableObjectCollectionsByProvenance = self->_codableObjectCollectionsByProvenance;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](codableObjectCollectionsByProvenance, "objectForKeyedSubscript:", v6);
  v11 = (HDCodableObjectCollection *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_9;
  -[HDDataProvenanceCache codableSourceWithProvenance:profile:](self, "codableSourceWithProvenance:profile:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v11 = 0;
    goto LABEL_8;
  }
  -[HDDataProvenanceCache codableProvenanceWithProvenance:](self, "codableProvenanceWithProvenance:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(HDCodableObjectCollection);
  -[HDCodableObjectCollection setSource:](v11, "setSource:", v12);
  -[HDCodableObjectCollection setProvenance:](v11, "setProvenance:", v13);
  -[HDProfile syncIdentityManager](self->_profile, "syncIdentityManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "syncIdentity");
  transaction = self->_transaction;
  v24 = 0;
  objc_msgSend(v14, "identityForEntityID:transaction:error:", v15, transaction, &v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v24;

  if (v17)
  {
    objc_msgSend(v17, "identity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "codableSyncIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableObjectCollection setSyncIdentity:](v11, "setSyncIdentity:", v20);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_codableObjectCollectionsByProvenance, "setObject:forKeyedSubscript:", v11, v6);
LABEL_8:

LABEL_9:
    v11 = v11;
    v21 = v11;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v23 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v18;
    _os_log_fault_impl(&dword_1B7802000, v23, OS_LOG_TYPE_FAULT, "Unable to create sync identity from HDDataOriginProvenance  %{public}@", buf, 0xCu);
  }

  v21 = 0;
LABEL_10:

  return v21;
}

- (id)allCodableObjectCollectionsByProvenance
{
  if (self->_codableObjectCollectionsByProvenance)
    return self->_codableObjectCollectionsByProvenance;
  else
    return MEMORY[0x1E0C9AA70];
}

- (id)sourceRevisionForProvenanceID:(id)a3 dataProvenance:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  objc_class *v32;
  __CFString *v33;
  id v34;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (-[HDEntityEncoder purpose](self->_sourceEncoder, "purpose") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataProvenanceCache.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_sourceEncoder purpose] == HDEntityEncodingPurposeObjectInstantiation"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sourceRevisionByDataProvenanceIDCache, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
  }
  else
  {
    objc_msgSend(v12, "sourceID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    if (-[HDEntityEncoder purpose](self->_sourceEncoder, "purpose") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel__sourceForPersistentID_profile_error_, self, CFSTR("HDDataProvenanceCache.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_sourceEncoder purpose] == HDEntityEncodingPurposeObjectInstantiation"));

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sourceByPersistentIDCache, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(v17, "sourceManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "clientSourceForPersistentID:error:", v16, a6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sourceByPersistentIDCache, "setObject:forKeyedSubscript:", v18, v16);
    }

    if (v18)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_sourceRevisionsDictionaryBySourceCache, "objectForKeyedSubscript:", v18);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sourceRevisionsDictionaryBySourceCache, "setObject:forKeyedSubscript:", v20, v18);
      }
      v40 = v13;
      v43 = 0uLL;
      v44 = 0;
      if (v12)
        objc_msgSend(v12, "operatingSystemVersion");
      objc_msgSend(v12, "sourceVersion");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "productType");
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v41 = v43;
      v42 = v44;
      HKNSOperatingSystemVersionString();
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("<null>");
      if (v21)
        v25 = v21;
      else
        v25 = CFSTR("<null>");
      if (v22)
        v26 = v22;
      else
        v26 = CFSTR("<null>");
      if (v23)
        v24 = v23;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@\n%@"), v25, v26, v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        if (-[__CFString isEqualToString:](v21, "isEqualToString:", &stru_1E6D11BB8))
          v29 = 0;
        else
          v29 = v21;
        v39 = v20;
        v30 = v29;
        if (-[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("UnknownDevice")))
          v31 = 0;
        else
          v31 = v22;
        v32 = (objc_class *)MEMORY[0x1E0CB6C30];
        v38 = v23;
        v33 = v31;
        v34 = [v32 alloc];
        v41 = v43;
        v42 = v44;
        v28 = (void *)objc_msgSend(v34, "initWithSource:version:productType:operatingSystemVersion:", v18, v30, v33, &v41);

        v23 = v38;
        v20 = v39;
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v28, v27);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sourceRevisionByDataProvenanceIDCache, "setObject:forKeyedSubscript:", v28, v11);
      v15 = v28;

      v13 = v40;
    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (id)contributorForReference:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contributorByReferenceCache, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "contributorManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contributorForReference:error:", v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contributorByReferenceCache, "setObject:forKeyedSubscript:", v10, v8);
  }

  return v10;
}

@end
