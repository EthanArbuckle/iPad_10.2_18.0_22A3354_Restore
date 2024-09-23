@implementation HDDataProvenanceManager

- (id)defaultLocalDataProvenanceWithDeviceEntity:(id)a3
{
  return -[HDDataProvenanceManager localDataProvenanceForSourceEntity:version:deviceEntity:](self, "localDataProvenanceForSourceEntity:version:deviceEntity:", 0, 0, a3);
}

- (id)localDataProvenanceForSourceEntity:(id)a3 version:(id)a4 deviceEntity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSString *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  uint64_t v26;
  NSString *localSystemBuild;
  NSString *localProductType;
  NSString *localSourceVersion;
  void *v30;
  NSString *v31;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  uint64_t v48;
  uint8_t buf[24];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[HDDataProvenanceManager _loadDefaults]((uint64_t)self);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
LABEL_6:
  -[HDDataProvenanceManager primaryUserContributorReference]((uint64_t)self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  v15 = (NSString *)v10;
  v16 = v12;
  v17 = v13;
  v18 = v17;
  v46 = v14;
  if (self)
  {
    v19 = v14;
    if (!v14)
    {
      -[HDDataProvenanceManager localSourceID]((uint64_t)self);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v16;
    if (!v16)
    {
      -[HDDataProvenanceManager deviceNoneID]((uint64_t)self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v18;
    if (!v18)
    {
      -[HDDataProvenanceManager noneContributorReference]((uint64_t)self);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v19 && v20 && v21)
    {
      memset(buf, 0, sizeof(buf));
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v41 = v8;
      v42 = v18;
      v44 = v16;
      v39 = v19;
      if (v22)
        objc_msgSend(v22, "operatingSystemVersion");
      else
        memset(buf, 0, sizeof(buf));
      v40 = v9;

      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v26 = objc_msgSend(WeakRetained, "currentSyncIdentityPersistentID");
      localSystemBuild = self->_localSystemBuild;
      localProductType = self->_localProductType;
      localSourceVersion = v15;
      if (!v15)
        localSourceVersion = self->_localSourceVersion;
      -[HDDataProvenanceManager _localTimeZoneName]((uint64_t)self);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *(_OWORD *)buf;
      v48 = *(_QWORD *)&buf[16];
      v31 = localProductType;
      v19 = v39;
      +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, v26, v31, localSystemBuild, &v47, localSourceVersion, v30, v39, v20, v21);
      self = (HDDataProvenanceManager *)objc_claimAutoreleasedReturnValue();

      v9 = v40;
      v8 = v41;
      v18 = v42;
      v16 = v44;
    }
    else
    {
      _HKInitializeLogging();
      v24 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v33 = v24;
        -[HDDataProvenanceManager localSourceID]((uint64_t)self);
        v45 = v16;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDataProvenanceManager deviceNoneID]((uint64_t)self);
        v43 = v18;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDataProvenanceManager noneContributorReference]((uint64_t)self);
        v36 = v19;
        v37 = v15;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2114;
        v50 = v38;
        _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "Missing local source (%{public}@), device (%{public}@) id or contributor (%{public}@)", buf, 0x20u);

        v15 = v37;
        v19 = v36;

        v18 = v43;
        v16 = v45;

      }
      self = 0;
    }
  }
  else
  {
    v21 = v17;
    v20 = v16;
    v19 = v14;
  }

  return self;
}

- (void)_loadDefaults
{
  unsigned __int8 v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  _BYTE buf[24];
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = atomic_load((unsigned __int8 *)(a1 + 72));
  if ((v2 & 1) != 0)
    return;
  -[HDDataProvenanceManager noneContributorReference](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  if (!v3)
  {
    +[HDContributorReference contributorReferenceForNoContributor](HDContributorReference, "contributorReferenceForNoContributor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
      v8 = *(void **)(a1 + 24);
      *(_QWORD *)buf = v4;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __56__HDDataProvenanceManager__setNoneContributorReference___block_invoke;
      v26 = &unk_1E6CE8080;
      v27 = a1;
      v9 = v7;
      v28 = v9;
      objc_msgSend(v8, "hk_withLock:", buf);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (objc_msgSend(WeakRetained, "profileType") != 1)
  {
    -[HDDataProvenanceManager primaryUserContributorReference](a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_10;
    +[HDContributorReference contributorReferenceForPrimaryUser](HDContributorReference, "contributorReferenceForPrimaryUser");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = v18;
      v20 = *(void **)(a1 + 24);
      *(_QWORD *)buf = v4;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __63__HDDataProvenanceManager__setPrimaryUserContributorReference___block_invoke;
      v26 = &unk_1E6CE8080;
      v27 = a1;
      WeakRetained = v19;
      v28 = WeakRetained;
      objc_msgSend(v20, "hk_withLock:", buf);

    }
    else
    {
      WeakRetained = 0;
    }
  }

LABEL_10:
  v12 = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = a1;
  v24 = 0;
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __40__HDDataProvenanceManager__loadDefaults__block_invoke;
  v23[3] = &unk_1E6CEBC00;
  v15 = objc_msgSend(v13, "performTransactionWithContext:error:block:inaccessibilityHandler:", v14, &v24, v23, 0);
  v16 = v24;

  if ((v15 & 1) == 0)
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v21 = v17;
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%@: Failed to load data provenance default values: %{public}@", buf, 0x16u);

    }
  }

}

- (id)localSourceID
{
  unsigned __int8 v1;
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (!a1)
    return 0;
  v1 = atomic_load((unsigned __int8 *)(a1 + 72));
  if ((v1 & 1) != 0)
    return *(id *)(a1 + 32);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__88;
  v10 = __Block_byref_object_dispose__88;
  v11 = 0;
  v2 = *(void **)(a1 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__HDDataProvenanceManager_localSourceID__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(v2, "hk_withLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_localTimeZoneName
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "daemon");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "behavior");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)defaultLocalDataProvenance
{
  return -[HDDataProvenanceManager localDataProvenanceForSourceEntity:version:deviceEntity:](self, "localDataProvenanceForSourceEntity:version:deviceEntity:", 0, 0, 0);
}

- (id)deviceNoneID
{
  unsigned __int8 v1;
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (!a1)
    return 0;
  v1 = atomic_load((unsigned __int8 *)(a1 + 72));
  if ((v1 & 1) != 0)
    return *(id *)(a1 + 48);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__88;
  v10 = __Block_byref_object_dispose__88;
  v11 = 0;
  v2 = *(void **)(a1 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__HDDataProvenanceManager_deviceNoneID__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(v2, "hk_withLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (HDDataProvenanceManager)initWithProfile:(id)a3
{
  id v4;
  HDDataProvenanceManager *v5;
  NSLock *v6;
  NSLock *propertyLock;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  HDDatabaseValueCache *v20;
  void *v21;
  uint64_t v22;
  HDDatabaseValueCache *persistentIDsByProvenanceKey;
  HDDatabaseValueCache *v24;
  void *v25;
  uint64_t v26;
  HDDatabaseValueCache *originProvenanceByPersistentID;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HDDataProvenanceManager;
  v5 = -[HDDataProvenanceManager init](&v29, sel_init);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    propertyLock = v5->_propertyLock;
    v5->_propertyLock = v6;

    v8 = objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(v4, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "behavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "currentOSBuild");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (__CFString *)v11;
    else
      v13 = CFSTR("UnknownBuild");
    objc_storeStrong((id *)&v5->_localSystemBuild, v13);

    objc_msgSend(v10, "currentDeviceProductType");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (__CFString *)v14;
    else
      v16 = CFSTR("UnknownDevice");
    objc_storeStrong((id *)&v5->_localProductType, v16);

    objc_msgSend(v10, "currentOSVersion");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = &stru_1E6D11BB8;
    objc_storeStrong((id *)&v5->_localSourceVersion, v19);

    v20 = [HDDatabaseValueCache alloc];
    -[HDDataProvenanceManager hk_classNameWithTag:](v5, "hk_classNameWithTag:", CFSTR("persistent-ids"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HDDatabaseValueCache initWithName:](v20, "initWithName:", v21);
    persistentIDsByProvenanceKey = v5->_persistentIDsByProvenanceKey;
    v5->_persistentIDsByProvenanceKey = (HDDatabaseValueCache *)v22;

    v24 = [HDDatabaseValueCache alloc];
    -[HDDataProvenanceManager hk_classNameWithTag:](v5, "hk_classNameWithTag:", CFSTR("provenances"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HDDatabaseValueCache initWithName:cacheScope:](v24, "initWithName:cacheScope:", v25, 2);
    originProvenanceByPersistentID = v5->_originProvenanceByPersistentID;
    v5->_originProvenanceByPersistentID = (HDDatabaseValueCache *)v26;

  }
  return v5;
}

- (id)provenanceEntityForProvenance:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__88;
  v20 = __Block_byref_object_dispose__88;
  v21 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__HDDataProvenanceManager_provenanceEntityForProvenance_error___block_invoke;
  v13[3] = &unk_1E6CE8DD8;
  v15 = &v16;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDataProvenanceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v8, a4, v13);

  if ((_DWORD)a4)
    v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

BOOL __63__HDDataProvenanceManager_provenanceEntityForProvenance_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "provenanceEntityForProvenance:transaction:error:", *(_QWORD *)(a1 + 40), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

- (id)provenanceEntityForProvenance:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSString *localSystemBuild;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  id v30;
  _HDDataProvenanceKey *v31;
  uint64_t v32;
  HDDataOriginProvenance *dataProvenance;
  uint64_t v34;
  NSString *localProductType;
  uint64_t v36;
  NSString *v37;
  uint64_t v38;
  uint64_t v39;
  HDDatabaseValueCache *persistentIDsByProvenanceKey;
  HDDatabaseValueCache *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _HDDataProvenanceKey *v46;
  HDDataProvenanceEntity *v47;
  id v49;
  _QWORD v50[4];
  id v51;
  HDDataProvenanceManager *v52;
  id v53;
  id v54;

  v8 = a3;
  v9 = a4;
  if (!self)
    goto LABEL_21;
  -[HDDataProvenanceManager _loadDefaults]((uint64_t)self);
  objc_msgSend(v8, "sourceVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
    objc_msgSend(v8, "setSourceVersion:", &stru_1E6D11BB8);
  objc_msgSend(v8, "deviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[HDDataProvenanceManager deviceNoneID]((uint64_t)self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeviceID:", v13);

  }
  objc_msgSend(v8, "contributorReference");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[HDDataProvenanceManager noneContributorReference]((uint64_t)self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContributorReference:", v15);

  }
  objc_msgSend(v8, "sourceID");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_14;
  v17 = (void *)v16;
  objc_msgSend(v8, "deviceID");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    goto LABEL_14;
  }
  v19 = (void *)v18;
  objc_msgSend(v8, "contributorReference");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_14:
    v42 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v8, "sourceID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contributorReference");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "hk_assignError:code:format:", a5, 3, CFSTR("Missing data provenance source (%@), device (%@) id or contributor (%@)"), v43, v44, v45);

    self = 0;
    goto LABEL_21;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "contributorManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contributorReference");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  objc_msgSend(v22, "insertOrLookupContributorEntityWithReference:transaction:error:", v23, v9, &v54);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v54;

  if (!v24)
  {
    v46 = (_HDDataProvenanceKey *)v25;
    v31 = v46;
    if (v46)
    {
      if (a5)
      {
        v31 = objc_retainAutorelease(v46);
        self = 0;
        *a5 = v31;
        goto LABEL_20;
      }
      _HKLogDroppedError();
    }
    self = 0;
    goto LABEL_20;
  }
  v49 = v25;
  localSystemBuild = self->_localSystemBuild;
  v27 = self->_localProductType;
  v28 = localSystemBuild;
  v29 = v27;
  v30 = v8;
  objc_opt_self();
  v31 = objc_alloc_init(_HDDataProvenanceKey);
  v32 = objc_msgSend(v30, "copy");

  dataProvenance = v31->_dataProvenance;
  v31->_dataProvenance = (HDDataOriginProvenance *)v32;

  v34 = -[NSString copy](v29, "copy");
  localProductType = v31->_localProductType;
  v31->_localProductType = (NSString *)v34;

  v36 = -[NSString copy](v28, "copy");
  v37 = v31->_localSystemBuild;
  v31->_localSystemBuild = (NSString *)v36;

  v38 = -[HDDataOriginProvenance hash](v31->_dataProvenance, "hash");
  v39 = -[NSString hash](v31->_localProductType, "hash") ^ v38;
  v31->_hash = v39 ^ -[NSString hash](v31->_localSystemBuild, "hash");

  persistentIDsByProvenanceKey = self->_persistentIDsByProvenanceKey;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __71__HDDataProvenanceManager__lookupOrInsertProvenance_transaction_error___block_invoke;
  v50[3] = &unk_1E6CF7A18;
  v51 = v30;
  v52 = self;
  v53 = v24;
  v41 = persistentIDsByProvenanceKey;
  v25 = v49;
  -[HDDatabaseValueCache fetchObjectForKey:transaction:error:faultHandler:](v41, "fetchObjectForKey:transaction:error:faultHandler:", v31, v9, a5, v50);
  self = (HDDataProvenanceManager *)objc_claimAutoreleasedReturnValue();

LABEL_20:
LABEL_21:

  if (self)
    v47 = -[HDSQLiteEntity initWithPersistentID:]([HDDataProvenanceEntity alloc], "initWithPersistentID:", -[HDDataProvenanceManager longLongValue](self, "longLongValue"));
  else
    v47 = 0;

  return v47;
}

- (id)noneContributorReference
{
  unsigned __int8 v1;
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (!a1)
    return 0;
  v1 = atomic_load((unsigned __int8 *)(a1 + 72));
  if ((v1 & 1) != 0)
    return *(id *)(a1 + 56);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__88;
  v10 = __Block_byref_object_dispose__88;
  v11 = 0;
  v2 = *(void **)(a1 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__HDDataProvenanceManager_noneContributorReference__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(v2, "hk_withLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

id __71__HDDataProvenanceManager__lookupOrInsertProvenance_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[4];

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "syncProvenance");
  v25 = objc_msgSend(*(id *)(a1 + 32), "syncIdentity");
  objc_msgSend(*(id *)(a1 + 32), "productType");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "systemBuild");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v27 = (void *)v7;
  v28 = (void *)v8;
  v26 = a3;
  v24 = v6;
  if (v9)
    objc_msgSend(v9, "operatingSystemVersion");
  else
    memset(v29, 0, 24);
  v10 = v5;
  v11 = *(_QWORD **)(a1 + 40);
  if (v11)
  {
    v13 = v11 + 12;
    v11 = (_QWORD *)v11[12];
    v12 = (void *)v13[1];
  }
  else
  {
    v12 = 0;
  }
  v14 = *(void **)(a1 + 32);
  v15 = v11;
  v23 = v12;
  objc_msgSend(v14, "sourceVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "timeZoneName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "persistentID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataProvenanceEntity insertOrLookupDataProvenanceForSyncProvenance:syncIdentity:originProductType:originSystemBuild:originOSVersion:localProductType:localSystemBuild:sourceVersion:timeZoneName:sourceID:deviceID:contributorID:transaction:error:](HDDataProvenanceEntity, "insertOrLookupDataProvenanceForSyncProvenance:syncIdentity:originProductType:originSystemBuild:originOSVersion:localProductType:localSystemBuild:sourceVersion:timeZoneName:sourceID:deviceID:contributorID:transaction:error:", v24, v25, v27, v28, v29, v23, v15, v21, v16, v17, v22, v18, v10, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setObject:forKey:transaction:", *(_QWORD *)(a1 + 32), v19, v10);

  return v19;
}

- (id)primaryUserContributorReference
{
  unsigned __int8 v1;
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (!a1)
    return 0;
  v1 = atomic_load((unsigned __int8 *)(a1 + 72));
  if ((v1 & 1) != 0)
    return *(id *)(a1 + 64);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__88;
  v10 = __Block_byref_object_dispose__88;
  v11 = 0;
  v2 = *(void **)(a1 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HDDataProvenanceManager_primaryUserContributorReference__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(v2, "hk_withLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)originProvenanceForPersistentID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  HDDatabaseValueCache *originProvenanceByPersistentID;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  originProvenanceByPersistentID = self->_originProvenanceByPersistentID;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__HDDataProvenanceManager_originProvenanceForPersistentID_transaction_error___block_invoke;
  v13[3] = &unk_1E6CF7A40;
  v14 = v8;
  v10 = v8;
  -[HDDatabaseValueCache fetchObjectForKey:transaction:error:faultHandler:](originProvenanceByPersistentID, "fetchObjectForKey:transaction:error:faultHandler:", v10, a4, a5, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __77__HDDataProvenanceManager_originProvenanceForPersistentID_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDDataProvenanceEntity originProvenanceForPersistentID:database:error:](HDDataProvenanceEntity, "originProvenanceForPersistentID:database:error:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)deviceIDsForSourceIDs:(id)a3 profile:(id)a4 error:(id *)a5
{
  return +[HDDataProvenanceEntity deviceIDsForSourceIDs:profile:error:](HDDataProvenanceEntity, "deviceIDsForSourceIDs:profile:error:", a3, a4, a5);
}

uint64_t __40__HDDataProvenanceManager__loadDefaults__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  _QWORD v40[5];
  BOOL v41;
  BOOL v42;
  BOOL v43;
  _QWORD v44[4];
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  _BYTE buf[24];
  void *v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[HDDataProvenanceManager deviceNoneID](*(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = 0;
    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "deviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v8, "deviceEntityForNoDeviceWithError:", &v48);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v48;

  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      v13 = *(void **)(v10 + 24);
      *(_QWORD *)buf = v5;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __44__HDDataProvenanceManager__setDeviceNoneID___block_invoke;
      v50 = &unk_1E6CE8080;
      v51 = v10;
      v52 = v11;
      objc_msgSend(v13, "hk_withLock:", buf);

    }
  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB52B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v12 = v14;
    v36 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%@: Failed to get device Entity for no device: %{public}@", buf, 0x16u);
  }

LABEL_9:
LABEL_10:
  -[HDDataProvenanceManager localSourceID](*(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = v6;
    goto LABEL_19;
  }
  v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v17, "sourceManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v6;
  objc_msgSend(v18, "localDeviceSourceWithError:", &v47);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v47;

  if (v19)
  {
    v20 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v19, "persistentID"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
    {
      v23 = *(void **)(v20 + 24);
      *(_QWORD *)buf = v5;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __45__HDDataProvenanceManager__setLocalSourceID___block_invoke;
      v50 = &unk_1E6CE8080;
      v51 = v20;
      v52 = v21;
      objc_msgSend(v23, "hk_withLock:", buf);

    }
  }
  else
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB52B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v22 = v24;
    v37 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%@: Failed to get local device source: %{public}@", buf, 0x16u);
  }

LABEL_18:
LABEL_19:
  -[HDDataProvenanceManager localDeviceID](*(_QWORD *)(a1 + 32));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = v16;
  }
  else
  {
    v27 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v27, "deviceManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v16;
    objc_msgSend(v28, "currentDeviceEntityWithError:", &v46);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v46;

    if (v29)
    {
      v30 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v29, "persistentID"));
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v30)
      {
        v33 = *(void **)(v30 + 24);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __45__HDDataProvenanceManager__setLocalDeviceID___block_invoke;
        v50 = &unk_1E6CE8080;
        v51 = v30;
        v52 = v31;
        objc_msgSend(v33, "hk_withLock:", buf);

      }
    }
    else
    {
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v38 = v34;
        v39 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v26;
        _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%@: Failed to get current device entity: %{public}@", buf, 0x16u);

      }
    }

    v5 = MEMORY[0x1E0C809B0];
  }
  v44[0] = v5;
  v44[1] = 3221225472;
  v44[2] = __40__HDDataProvenanceManager__loadDefaults__block_invoke_201;
  v44[3] = &unk_1E6CE80E8;
  v45 = *(_QWORD *)(a1 + 32);
  v40[0] = v5;
  v40[1] = 3221225472;
  v40[2] = __40__HDDataProvenanceManager__loadDefaults__block_invoke_2;
  v40[3] = &unk_1E6CF7A90;
  v40[4] = v45;
  v41 = v4 == 0;
  v42 = v15 == 0;
  v43 = v25 == 0;
  objc_msgSend(v3, "onCommit:orRollback:", v44, v40);

  return 1;
}

- (id)localDeviceID
{
  unsigned __int8 v1;
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (!a1)
    return 0;
  v1 = atomic_load((unsigned __int8 *)(a1 + 72));
  if ((v1 & 1) != 0)
    return *(id *)(a1 + 40);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__88;
  v10 = __Block_byref_object_dispose__88;
  v11 = 0;
  v2 = *(void **)(a1 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__HDDataProvenanceManager_localDeviceID__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(v2, "hk_withLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__HDDataProvenanceManager__loadDefaults__block_invoke_201(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 v2;
  void *v3;
  _QWORD v4[6];
  _QWORD v5[3];
  char v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = atomic_load((unsigned __int8 *)(v1 + 72));
    if ((v2 & 1) == 0)
    {
      v5[0] = 0;
      v5[1] = v5;
      v5[2] = 0x2020000000;
      v6 = 0;
      v3 = *(void **)(v1 + 24);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __47__HDDataProvenanceManager__checkDefaultsLoaded__block_invoke;
      v4[3] = &unk_1E6CE8110;
      v4[4] = v1;
      v4[5] = v5;
      objc_msgSend(v3, "hk_withLock:", v4);
      _Block_object_dispose(v5, 8);
    }
  }
}

uint64_t __40__HDDataProvenanceManager__loadDefaults__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];
  char v5;
  __int16 v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__HDDataProvenanceManager__loadDefaults__block_invoke_3;
  v4[3] = &unk_1E6CF7A68;
  v5 = *(_BYTE *)(a1 + 40);
  v4[4] = v1;
  v6 = *(_WORD *)(a1 + 41);
  return objc_msgSend(v2, "hk_withLock:", v4);
}

void __40__HDDataProvenanceManager__loadDefaults__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = 0;

  }
  if (*(_BYTE *)(a1 + 41))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

  }
  if (*(_BYTE *)(a1 + 42))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *localSourceVersion;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDDataProvenanceManager localSourceID]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataProvenanceManager localDeviceID]((uint64_t)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)&self->_localSystemBuild;
  localSourceVersion = self->_localSourceVersion;
  -[HDDataProvenanceManager _localTimeZoneName]((uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataProvenanceManager deviceNoneID]((uint64_t)self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataProvenanceManager noneContributorReference]((uint64_t)self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataProvenanceManager primaryUserContributorReference]((uint64_t)self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p source=%@, device=%@, build=%@, productType=%@, sourceVersion=%@, tz=%@, noneDevice=%@, noneContributor=%@, primaryUserContributor=%@>"), v4, self, v5, v6, v14, localSourceVersion, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

uint64_t __47__HDDataProvenanceManager__checkDefaultsLoaded__block_invoke(uint64_t result)
{
  _QWORD *v1;
  BOOL v2;

  v1 = *(_QWORD **)(result + 32);
  v2 = v1[4] && v1[5] && v1[6] && v1[7] != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(result + 32) + 72));
  return result;
}

void __40__HDDataProvenanceManager_localSourceID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

void __45__HDDataProvenanceManager__setLocalSourceID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

  }
}

void __40__HDDataProvenanceManager_localDeviceID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void __45__HDDataProvenanceManager__setLocalDeviceID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __39__HDDataProvenanceManager_deviceNoneID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __44__HDDataProvenanceManager__setDeviceNoneID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

  }
}

void __51__HDDataProvenanceManager_noneContributorReference__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __56__HDDataProvenanceManager__setNoneContributorReference___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v2;

  }
}

void __58__HDDataProvenanceManager_primaryUserContributorReference__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

void __63__HDDataProvenanceManager__setPrimaryUserContributorReference___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = v2;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProductType, 0);
  objc_storeStrong((id *)&self->_localSystemBuild, 0);
  objc_storeStrong((id *)&self->_originProvenanceByPersistentID, 0);
  objc_storeStrong((id *)&self->_persistentIDsByProvenanceKey, 0);
  objc_storeStrong((id *)&self->_propertyLock_primaryUserContributorReference, 0);
  objc_storeStrong((id *)&self->_propertyLock_noneContributorReference, 0);
  objc_storeStrong((id *)&self->_propertyLock_deviceNoneID, 0);
  objc_storeStrong((id *)&self->_propertyLock_localDeviceID, 0);
  objc_storeStrong((id *)&self->_propertyLock_localSourceID, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_localSourceVersion, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
