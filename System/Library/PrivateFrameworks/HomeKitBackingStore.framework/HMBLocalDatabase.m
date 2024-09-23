@implementation HMBLocalDatabase

- (HMBLocalDatabase)initWithDatastorePath:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HMBLocalDatabase *v11;
  HMBLocalDatabase *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  v17 = 0;
  +[HMBLocalSQLContext openWithURL:error:](HMBLocalSQLContext, "openWithURL:error:", v6, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  if (v9)
  {
    v11 = -[HMBLocalDatabase initWithLocalSQLContext:configuration:](self, "initWithLocalSQLContext:configuration:", v9, v8);
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to create our local storage: %@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (HMBLocalDatabase)initWithLocalSQLContext:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMBLocalDatabase *v10;
  NSOperationQueue *v11;
  NSOperationQueue *queue;
  void *v13;
  uint64_t v14;
  NSMapTable *openZonesByZoneID;
  uint64_t v16;
  HMBModelContainer *modelContainer;
  id localZoneFactory;
  HMBLocalDatabase *v19;
  HMBLocalDatabase *result;
  HMBLocalDatabase *v21;
  SEL v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v21 = (HMBLocalDatabase *)_HMFPreconditionFailure();
    -[HMBLocalDatabase dealloc](v21, v22);
    return result;
  }
  v23.receiver = self;
  v23.super_class = (Class)HMBLocalDatabase;
  v10 = -[HMBLocalDatabase init](&v23, sel_init);
  if (v10)
  {
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v10->_queue;
    v10->_queue = v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_queue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v10->_queue, "setQualityOfService:", 25);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.HomeKitBackingStore.LocalDatabase"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v10->_queue, "setName:", v13);

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    openZonesByZoneID = v10->_openZonesByZoneID;
    v10->_openZonesByZoneID = (NSMapTable *)v14;

    objc_msgSend(v9, "modelContainer");
    v16 = objc_claimAutoreleasedReturnValue();
    modelContainer = v10->_modelContainer;
    v10->_modelContainer = (HMBModelContainer *)v16;

    objc_storeStrong((id *)&v10->_local, a3);
    localZoneFactory = v10->_localZoneFactory;
    v10->_localZoneFactory = &__block_literal_global_3004;

    v19 = v10;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMBLocalDatabase local](self, "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  v4.receiver = self;
  v4.super_class = (Class)HMBLocalDatabase;
  -[HMBLocalDatabase dealloc](&v4, sel_dealloc);
}

- (id)fetchZonesWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  HMBLocalZoneIDRow *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMBLocalZoneIDRow *v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2986;
  v28 = __Block_byref_object_dispose__2987;
  v29 = 0;
  -[HMBLocalDatabase local](self, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __40__HMBLocalDatabase_fetchZonesWithError___block_invoke;
  v23[3] = &unk_1E8932188;
  v23[4] = &v24;
  objc_msgSend(v4, "sqlBlockWithActivity:block:", 0, v23);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v5 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend((id)v25[5], "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)v25[5];
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v10 = [HMBLocalZoneIDRow alloc];
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "token");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[HMBLocalZoneIDRow initWithName:token:](v10, "initWithName:token:", v12, v14);
          objc_msgSend(v5, "addObject:", v15);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
      }
      while (v6);
    }

  }
  _Block_object_dispose(&v24, 8);

  return v5;
}

- (id)_openZoneWithZoneID:(id)a3 mirror:(id)a4 configuration:(id)a5 existingLocalZone:(id)a6 error:(id *)a7
{
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMBLocalDatabase *v17;
  NSObject *v18;
  void *v19;
  id v20;
  HMBLocalDatabase *v21;
  void *v22;
  void *v23;
  HMBLocalSQLContextRowZone *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  HMBLocalSQLContextRowZone *i;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  HMBLocalDatabase *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  HMBLocalDatabase *v41;
  NSObject *v42;
  void *v43;
  id v44;
  HMBLocalDatabase *v45;
  HMBLocalSQLContextRowZone *v46;
  void *v47;
  HMBLocalSQLContextRowZone *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void (**v52)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  HMBLocalDatabase *v59;
  NSObject *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  HMBLocalDatabase *v65;
  NSObject *v66;
  void *v67;
  id v68;
  HMBLocalDatabase *v69;
  id v71;
  os_unfair_lock *lock;
  id v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _BYTE buf[24];
  void *v89;
  HMBLocalSQLContextRowZone *v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v75 = a3;
  v71 = a4;
  v74 = a5;
  v73 = a6;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalDatabase openZonesByZoneID](self, "openZonesByZoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "token");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "delegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "delegate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1D17B6230]();
    v17 = self;
    if (v14 && v15 && v14 != v15)
    {
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v75;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot set a new delegate on local zone with identifier %@ because that local zone has already been opened with a different delegate", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 1);
        v20 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      HMFGetOSLogHandle();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_INFO, "%{public}@Returning existing HMBLocalZone instance: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v20 = v13;
    }

LABEL_41:
    goto LABEL_42;
  }
  v21 = self;
  v68 = v75;
  os_unfair_lock_assert_owner(lock);
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__2986;
  v86 = __Block_byref_object_dispose__2987;
  v87 = 0;
  v69 = v21;
  -[HMBLocalDatabase local](v21, "local");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = ____fetchStoreInfo_block_invoke;
  v81[3] = &unk_1E8932188;
  v81[4] = &v82;
  objc_msgSend(v22, "sqlBlockWithActivity:block:", 0, v81);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(v68, "token");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v28 = (id)v83[5];
    v24 = (HMBLocalSQLContextRowZone *)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, buf, 16);
    if (v24)
    {
      v29 = *(_QWORD *)v78;
      while (2)
      {
        for (i = 0; i != v24; i = (HMBLocalSQLContextRowZone *)((char *)i + 1))
        {
          if (*(_QWORD *)v78 != v29)
            objc_enumerationMutation(v28);
          v31 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v31, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "token");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqual:", v27);

          if ((v34 & 1) != 0)
          {
            v24 = v31;
            goto LABEL_26;
          }
        }
        v24 = (HMBLocalSQLContextRowZone *)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, buf, 16);
        if (v24)
          continue;
        break;
      }
    }
LABEL_26:

  }
  _Block_object_dispose(&v82, 8);

  if (v24)
  {
LABEL_28:
    v35 = (void *)MEMORY[0x1D17B6230]();
    v36 = v69;
    if (v73)
    {
      HMFGetOSLogHandle();
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v73;
        _os_log_impl(&dword_1CCD48000, v37, OS_LOG_TYPE_INFO, "%{public}@Using re-opened HMBLocalZone instance: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      v39 = v73;
      objc_msgSend(v39, "setZoneRow:", -[HMBLocalSQLContextRowZone zoneRow](v24, "zoneRow"));
    }
    else
    {
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v68;
        _os_log_impl(&dword_1CCD48000, v50, OS_LOG_TYPE_INFO, "%{public}@Creating new HMBLocalZone instance with ID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      -[HMBLocalDatabase localZoneFactory](v36, "localZoneFactory");
      v52 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HMBLocalSQLContextRowZone identifier](v24, "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, HMBLocalDatabase *, void *, unint64_t, id, id))v52)[2](v52, v36, v53, -[HMBLocalSQLContextRowZone zoneRow](v24, "zoneRow"), v74, v71);
      v39 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[HMBLocalDatabase openZonesByZoneID](v36, "openZonesByZoneID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "zoneID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "token");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKey:", v39, v56);

    v13 = v39;
    v14 = v24;
    v20 = v13;
    goto LABEL_41;
  }
  if ((objc_msgSend(v74, "createIfNeeded") & 1) != 0)
  {
    v40 = (void *)MEMORY[0x1D17B6230]();
    v41 = v69;
    HMFGetOSLogHandle();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v68;
      _os_log_impl(&dword_1CCD48000, v42, OS_LOG_TYPE_INFO, "%{public}@Creating new state for local zone with ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    v76 = 0;
    v44 = v68;
    v45 = v41;
    os_unfair_lock_assert_owner(lock);
    v46 = objc_alloc_init(HMBLocalSQLContextRowZone);
    -[HMBLocalDatabase local](v45, "local");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ____createZone_block_invoke;
    v89 = &unk_1E8932F30;
    v48 = v46;
    v90 = v48;
    v49 = v44;
    v91 = v49;
    objc_msgSend(v47, "sqlBlockWithActivity:error:block:", 0, &v76, buf);

    if (-[HMBLocalSQLContextRowZone zoneRow](v48, "zoneRow"))
    {
      -[HMBLocalSQLContextRowZone setIdentifier:](v48, "setIdentifier:", v49);
      v24 = v48;
    }
    else
    {
      v24 = 0;
    }

    v63 = v76;
    v14 = v63;
    if (!v24)
    {
      v64 = (void *)MEMORY[0x1D17B6230]();
      v65 = v45;
      HMFGetOSLogHandle();
      v66 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v67;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v49;
        *(_WORD *)&buf[22] = 2112;
        v89 = v14;
        _os_log_impl(&dword_1CCD48000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new state for local zone with ID %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v64);
      if (a7)
      {
        v14 = objc_retainAutorelease(v14);
        v13 = 0;
        v20 = 0;
        *a7 = v14;
      }
      else
      {
        v13 = 0;
        v20 = 0;
      }
      goto LABEL_41;
    }

    goto LABEL_28;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)MEMORY[0x1D17B6230]();
  v59 = v69;
  HMFGetOSLogHandle();
  v60 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v61 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "name");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v61;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v62;
    _os_log_impl(&dword_1CCD48000, v60, OS_LOG_TYPE_ERROR, "%{public}@Unable to open local zone that does not already exist and can't be created: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v58);
  v13 = 0;
  v20 = 0;
LABEL_42:

  os_unfair_lock_unlock(lock);
  return v20;
}

- (id)openZoneWithZoneID:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMBLocalDatabase *v13;
  SEL v14;
  id v15;
  id v16;
  id *v17;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = v9;
    if (v9)
    {
      -[HMBLocalDatabase _openZoneWithZoneID:mirror:configuration:existingLocalZone:error:](self, "_openZoneWithZoneID:mirror:configuration:existingLocalZone:error:", v8, 0, v9, 0, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v13 = (HMBLocalDatabase *)_HMFPreconditionFailure();
  return -[HMBLocalDatabase openZoneWithMirror:configuration:error:](v13, v14, v15, v16, v17);
}

- (id)openZoneWithMirror:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMBLocalDatabase *v14;
  SEL v15;
  id v16;
  id *v17;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v8, "zoneID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBLocalDatabase _openZoneWithZoneID:mirror:configuration:existingLocalZone:error:](self, "_openZoneWithZoneID:mirror:configuration:existingLocalZone:error:", v11, v8, v10, 0, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v14 = (HMBLocalDatabase *)_HMFPreconditionFailure();
  return (id)-[HMBLocalDatabase reopenZone:error:](v14, v15, v16, v17);
}

- (BOOL)reopenZone:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  HMBLocalDatabase *v15;
  SEL v16;
  id v17;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "setCreateIfNeeded:", 1);
    objc_msgSend(v7, "zoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mirror");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalDatabase _openZoneWithZoneID:mirror:configuration:existingLocalZone:error:](self, "_openZoneWithZoneID:mirror:configuration:existingLocalZone:error:", v10, v11, v9, v7, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;

    return v13;
  }
  else
  {
    v15 = (HMBLocalDatabase *)_HMFPreconditionFailure();
    return -[HMBLocalDatabase removeZone:](v15, v16, v17);
  }
}

- (id)removeZone:(id)a3
{
  id v4;
  void *v5;
  HMBLocalDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMBLocalDatabase *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing local zone: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "mirror");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing local zone mirror: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v9, "destroy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    v15 = -[HMBLocalDatabase removeLocalDataForZone:error:](v6, "removeLocalDataForZone:error:", v4, &v18);
    v16 = v18;
    if (v15)
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    else
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (BOOL)removeLocalDataForZone:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HMBLocalDatabase *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMBLocalDatabase *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing local data for zone: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMBLocalDatabase delegate](v8, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localDatabase:willRemoveZoneWithID:", v8, v12);

  }
  os_unfair_lock_lock_with_options();
  v25 = 0;
  v13 = objc_msgSend(v6, "destroyWithError:", &v25);
  v14 = v25;
  -[HMBLocalDatabase openZonesByZoneID](v8, "openZonesByZoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "token");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", v17);

  os_unfair_lock_unlock(&v8->_lock);
  v18 = (void *)MEMORY[0x1D17B6230]();
  v19 = v8;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_INFO, "%{public}@Successfully removed local data for zone: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v23;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove local data for zone %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }

  return v13;
}

- (void)handleLocalZoneShutdown:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalDatabase openZonesByZoneID](self, "openZonesByZoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMBLocalDatabase local](self, "local");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMBModelContainer)modelContainer
{
  return self->_modelContainer;
}

- (HMBLocalDatabaseDelegate)delegate
{
  return (HMBLocalDatabaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (HMBLocalSQLContext)local
{
  return self->_local;
}

- (void)setLocal:(id)a3
{
  objc_storeStrong((id *)&self->_local, a3);
}

- (NSMapTable)openZonesByZoneID
{
  return self->_openZonesByZoneID;
}

- (id)localZoneFactory
{
  return self->_localZoneFactory;
}

- (void)setLocalZoneFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_localZoneFactory, 0);
  objc_storeStrong((id *)&self->_openZonesByZoneID, 0);
  objc_storeStrong((id *)&self->_local, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modelContainer, 0);
}

id __40__HMBLocalDatabase_fetchZonesWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "_fetchAllZones:", &v8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  return v4;
}

HMBLocalZone *__58__HMBLocalDatabase_initWithLocalSQLContext_configuration___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMBLocalZone *v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = a2;
  v14 = -[HMBLocalZone initWithLocalDatabase:zoneID:zoneRow:configuration:mirror:]([HMBLocalZone alloc], "initWithLocalDatabase:zoneID:zoneRow:configuration:mirror:", v13, v12, a4, v11, v10);

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_3015 != -1)
    dispatch_once(&logCategory__hmf_once_t18_3015, &__block_literal_global_28);
  return (id)logCategory__hmf_once_v19_3016;
}

void __31__HMBLocalDatabase_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_3016;
  logCategory__hmf_once_v19_3016 = v0;

}

- (void)detectedLocalCorruptionWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMBLocalDatabase *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMBLocalDatabase *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMBLocalDatabase delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1D17B6230]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@HMBManager detected local corruption: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "localDatabase:detectedLocalCorruptionWithInfo:", v7, v4);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, "%{public}@HMBManager detected local corruption: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

@end
