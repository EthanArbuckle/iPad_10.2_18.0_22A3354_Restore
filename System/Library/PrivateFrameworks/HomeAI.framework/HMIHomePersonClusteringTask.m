@implementation HMIHomePersonClusteringTask

- (HMIHomePersonClusteringTask)initWithTaskID:(int)a3 homeUUID:(id)a4 dataSource:(id)a5 sourceUUID:(id)a6 personsModelManager:(id)a7 doImpurePersonCleanup:(BOOL)a8 error:(id *)a9
{
  _BOOL4 v9;
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  double v19;
  HMIHomePersonClusteringTask *v20;
  HMIHomePersonClusteringTask *v21;
  HMIGreedyClustering *v22;
  HMIGreedyClustering *clusterer;
  HMIFaceClassifierVIP *v24;
  id v25;
  HMIFaceClassifier *faceClassifier;
  HMIClusteringTaskSummary *v27;
  HMIClusteringTaskSummary *summary;
  HMIHomePersonClusteringTask *v29;
  id v30;
  id v32;
  objc_super v33;

  v9 = a8;
  v14 = *(_QWORD *)&a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = 500.0;
  if (v9)
    v19 = 1000.0;
  v33.receiver = self;
  v33.super_class = (Class)HMIHomePersonClusteringTask;
  v20 = -[HMIHomeTask initWithTaskID:homeUUID:timeout:](&v33, sel_initWithTaskID_homeUUID_timeout_, v14, a4, v19);
  v21 = v20;
  if (!v20)
    goto LABEL_6;
  objc_storeStrong((id *)&v20->_dataSource, a5);
  objc_storeStrong((id *)&v21->_sourceUUID, a6);
  objc_storeStrong((id *)&v21->_personsModelManager, a7);
  v21->_doImpurePersonCleanup = v9;
  v22 = -[HMIGreedyClustering initWithError:]([HMIGreedyClustering alloc], "initWithError:", 0);
  clusterer = v21->_clusterer;
  v21->_clusterer = v22;

  v32 = 0;
  v24 = -[HMIFaceClassifierVIP initWithError:]([HMIFaceClassifierVIP alloc], "initWithError:", &v32);
  v25 = v32;
  faceClassifier = v21->_faceClassifier;
  v21->_faceClassifier = (HMIFaceClassifier *)v24;

  if (v21->_faceClassifier)
  {
    v27 = objc_alloc_init(HMIClusteringTaskSummary);
    summary = v21->_summary;
    v21->_summary = v27;

    v21->_lock._os_unfair_lock_opaque = 0;
LABEL_6:
    v29 = v21;
    goto LABEL_10;
  }
  if (a9)
    *a9 = objc_retainAutorelease(v25);
  HMIErrorLogC(v25);
  v30 = objc_retainAutorelease(v25);
  *a9 = v30;

  v29 = 0;
LABEL_10:

  return v29;
}

- (void)mainInsideAutoreleasePool
{
  NSDate *v3;
  NSDate *startTime;
  void *v5;
  HMIHomePersonClusteringTask *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMICleanupImpureHomePersonsOperation *v11;
  void *v12;
  void *v13;
  HMICleanupImpureHomePersonsOperation *v14;
  void *v15;
  BOOL v16;
  void *v17;
  HMIHomePersonClusteringTask *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v3;

  if (-[HMIHomePersonClusteringTask doImpurePersonCleanup](self, "doImpurePersonCleanup"))
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIHomeTask homeUUID](v6, "homeUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@Spawning CleanupImpureHomePersonsOperation for %@ before home person clustering", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v11 = [HMICleanupImpureHomePersonsOperation alloc];
    -[HMIHomeTask homeUUID](v6, "homeUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIHomePersonClusteringTask dataSource](v6, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMICleanupImpureHomePersonsOperation initWithHomeUUID:dataSource:](v11, "initWithHomeUUID:dataSource:", v12, v13);

    -[HMFOperation start](v14, "start");
    -[HMICleanupImpureHomePersonsOperation waitUntilFinished](v14, "waitUntilFinished");
    -[HMFOperation error](v14, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15 == 0;
    v17 = (void *)MEMORY[0x220735570]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v23;
        _os_log_impl(&dword_219D45000, v20, OS_LOG_TYPE_INFO, "%{public}@CleanupImpureHomePersonOperation finished successfully", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFOperation error](v14, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = v22;
      _os_log_impl(&dword_219D45000, v20, OS_LOG_TYPE_ERROR, "%{public}@CleanupImpureHomePersonOperation finished with error:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);

  }
  objc_initWeak((id *)buf, self);
  -[HMIHomePersonClusteringTask dataSource](self, "dataSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __56__HMIHomePersonClusteringTask_mainInsideAutoreleasePool__block_invoke;
  v25[3] = &unk_24DBE9D08;
  objc_copyWeak(&v26, (id *)buf);
  objc_msgSend(v24, "performCloudPullWithCompletion:", v25);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __56__HMIHomePersonClusteringTask_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x220735570]();
      v6 = WeakRetained;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v8;
        v11 = 2112;
        v12 = v3;
        _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error performing cloud pull:%@", (uint8_t *)&v9, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
    }
    objc_msgSend(WeakRetained, "_stageZero_expireUnnamedPersons");
  }

}

- (void)_stageZero_expireUnnamedPersons
{
  void *v3;
  HMIHomePersonClusteringTask *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x220735570](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching persons", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_initWeak((id *)buf, v4);
  -[HMIHomePersonClusteringTask dataSource](v4, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke;
  v8[3] = &unk_24DBEB858;
  objc_copyWeak(&v9, (id *)buf);
  objc_msgSend(v7, "fetchAllPersonsWithCompletion:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t i;
  void *v16;
  void *v17;
  void (**v18)(double);
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  HMIPersonSourceUUIDPair *v24;
  void *v25;
  void *v26;
  HMIPersonSourceUUIDPair *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  __int128 v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[5];
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v52 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  v53 = v5;
  if (WeakRetained)
  {
    if (v5)
    {
      v51 = WeakRetained;
      objc_msgSend(v5, "na_map:", &__block_literal_global_34);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x220735570]();
      v9 = v51;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v53, "count");
        v13 = objc_msgSend(v53, "count");
        *(_DWORD *)buf = 138543874;
        v69 = v11;
        v70 = 2048;
        v71 = v12;
        v72 = 2048;
        v73 = v13 - objc_msgSend(v54, "count");
        _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu persons (%lu unnamed)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      obj = v53;
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      if (v57)
      {
        v56 = *(_QWORD *)v64;
        *(_QWORD *)&v14 = 138543618;
        v50 = v14;
        while (2)
        {
          for (i = 0; i != v57; ++i)
          {
            if (*(_QWORD *)v64 != v56)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            objc_msgSend(v9, "progressBlock", v50);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v9, "progressBlock");
              v18 = (void (**)(double))objc_claimAutoreleasedReturnValue();
              v18[2](0.0);

            }
            if (objc_msgSend(v9, "isCancelled"))
            {
              v41 = (void *)MEMORY[0x220735570]();
              v42 = v9;
              HMFGetOSLogHandle();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v69 = v44;
                _os_log_impl(&dword_219D45000, v43, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v41);

              goto LABEL_28;
            }
            objc_msgSend(v16, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = (void *)MEMORY[0x220735570]();
              v21 = v9;
              HMFGetOSLogHandle();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v69 = v23;
                _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Skipping named person", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v20);
            }
            else
            {
              v24 = [HMIPersonSourceUUIDPair alloc];
              objc_msgSend(v16, "UUID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "sourceUUID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:](v24, "initWithPersonUUID:sourceUUID:", v25, v26);

              objc_msgSend(v9, "personsModelManager");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "homeUUID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = 0;
              objc_msgSend(v28, "equivalencyCellForPerson:homeUUID:error:", v27, v29, &v62);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v62;

              v60[0] = MEMORY[0x24BDAC760];
              v60[1] = 3221225472;
              v60[2] = __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_104;
              v60[3] = &unk_24DBEDA78;
              v60[4] = v9;
              v61 = v54;
              if ((objc_msgSend(v30, "na_any:", v60) & 1) == 0)
              {
                v32 = (void *)MEMORY[0x220735570]();
                v33 = v9;
                HMFGetOSLogHandle();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v50;
                  v69 = v35;
                  v70 = 2112;
                  v71 = (uint64_t)v16;
                  _os_log_impl(&dword_219D45000, v34, OS_LOG_TYPE_INFO, "%{public}@Fetching face crops for person: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v32);
                objc_initWeak((id *)buf, v33);
                v58[0] = MEMORY[0x24BDAC760];
                v58[1] = 3221225472;
                v58[2] = __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_106;
                v58[3] = &unk_24DBEBEE0;
                objc_copyWeak(&v59, (id *)buf);
                v58[4] = v16;
                v36 = (void *)MEMORY[0x220735744](v58);
                objc_msgSend(v33, "dataSource");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = (void *)MEMORY[0x24BDBCF20];
                objc_msgSend(v16, "UUID");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "setWithObject:", v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "fetchFaceCropsForPersonsWithUUIDs:completion:", v40, v36);

                objc_destroyWeak(&v59);
                objc_destroyWeak((id *)buf);
              }

            }
          }
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          if (v57)
            continue;
          break;
        }
      }

      objc_msgSend(v9, "_stageOne_fetchFaceCrops");
LABEL_28:

      v7 = v51;
    }
    else
    {
      v45 = (void *)MEMORY[0x220735570]();
      v46 = v7;
      v47 = v7;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v49;
        v70 = 2112;
        v71 = (uint64_t)v52;
        _os_log_impl(&dword_219D45000, v48, OS_LOG_TYPE_ERROR, "%{public}@Error fetching persons:%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v45);
      objc_msgSend(v47, "cancelWithError:", v52);
      v7 = v46;
    }
  }

}

id __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_101(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_104(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v3 = a2;
  objc_msgSend(v3, "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "personUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v6 ^ 1 | v9;
}

void __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(WeakRetained, "personCreatedDateFromFaceCrops:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "timeIntervalSinceNow");
        v11 = v10;
        if (v10 < -864000.0)
        {
          v12 = (void *)MEMORY[0x220735570](v9);
          v13 = WeakRetained;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "UUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 138543874;
            v28 = v15;
            v29 = 2112;
            v30 = v16;
            v31 = 2048;
            v32 = -v11;
            _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_INFO, "%{public}@Deleting unnamed person %@ (age = %f seconds)", (uint8_t *)&v27, 0x20u);

          }
          objc_autoreleasePoolPop(v12);
          objc_msgSend(v13, "removePerson:", *(_QWORD *)(a1 + 32));
        }

      }
      else
      {
        v22 = (void *)MEMORY[0x220735570]();
        v23 = WeakRetained;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543618;
          v28 = v25;
          v29 = 2112;
          v30 = v26;
          _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_INFO, "%{public}@Deleting unnamed person %@ (0 face crops)", (uint8_t *)&v27, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(v23, "removePerson:", *(_QWORD *)(a1 + 32));
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x220735570]();
      v18 = WeakRetained;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(a1 + 32);
        v27 = 138543874;
        v28 = v20;
        v29 = 2112;
        v30 = v21;
        v31 = 2112;
        v32 = *(double *)&v6;
        _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching face crops for person:%@, error:%@", (uint8_t *)&v27, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
    }
  }

}

- (void)_stageOne_fetchFaceCrops
{
  void *v3;
  HMIHomePersonClusteringTask *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[HMIHomePersonClusteringTask isCancelled](self, "isCancelled"))
  {
    v3 = (void *)MEMORY[0x220735570]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[HMIHomePersonClusteringTask dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__HMIHomePersonClusteringTask__stageOne_fetchFaceCrops__block_invoke;
    v8[3] = &unk_24DBEB858;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v7, "fetchAllUnassociatedFaceCropsWithCompletion:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __55__HMIHomePersonClusteringTask__stageOne_fetchFaceCrops__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "_stageTwo_fetchFaceprints:", v5);
    }
    else
    {
      v9 = (void *)MEMORY[0x220735570]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v12;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error fetching face crops:%@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v10, "cancelWithError:", v6);
    }
  }

}

- (void)_stageTwo_fetchFaceprints:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonClusteringTask *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMIHomePersonClusteringTask isCancelled](self, "isCancelled"))
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_110);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    -[HMIHomePersonClusteringTask dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__HMIHomePersonClusteringTask__stageTwo_fetchFaceprints___block_invoke_2;
    v11[3] = &unk_24DBEBEE0;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v4;
    objc_msgSend(v10, "fetchFaceprintsForFaceCropsWithUUIDs:completion:", v9, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);

  }
}

uint64_t __57__HMIHomePersonClusteringTask__stageTwo_fetchFaceprints___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __57__HMIHomePersonClusteringTask__stageTwo_fetchFaceprints___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "_stageThree_generateFaceprintsForFaceCrops:existingFaceprints:", *(_QWORD *)(a1 + 32), v5);
    }
    else
    {
      v9 = (void *)MEMORY[0x220735570]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v12;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error fetching faceprints:%@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v10, "cancelWithError:", v6);
    }
  }

}

- (void)_stageThree_generateFaceprintsForFaceCrops:(id)a3 existingFaceprints:(id)a4
{
  void *v6;
  HMIHomePersonClusteringTask *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMIHomePersonClusteringTask *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMIHomePersonClusteringTask *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  HMIHomePersonClusteringTask *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  HMIHomePersonClusteringTask *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  HMIFaceprinter *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  HMIHomePersonClusteringTask *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v51 = a4;
  if (-[HMIHomePersonClusteringTask isCancelled](self, "isCancelled"))
  {
    v6 = (void *)MEMORY[0x220735570]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v9;
      _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v54 = self;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_alloc_init(HMIFaceprinter);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v47, "count");
    objc_msgSend(v47, "allObjects");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = vcvtpd_s64_f64((double)v10 / 100.0) | 0x4059000000000000;
    if ((int)v48 < 1)
    {
      v32 = 0;
LABEL_20:
      v12 = v32;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "timeIntervalSinceDate:", v46);
      v35 = v34;
      -[HMIHomePersonClusteringTask summary](v54, "summary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFaceprintingDuration:", v35);

      objc_msgSend(v50, "allObjects");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIHomePersonClusteringTask _stageFour_clusterFaceprints:](v54, "_stageFour_clusterFaceprints:", v37);

    }
    else
    {
      v11 = 0;
      v12 = 0;
      while (!-[HMIHomePersonClusteringTask isCancelled](v54, "isCancelled"))
      {
        objc_msgSend(v53, "count");
        v13 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v53, "subarrayWithRange:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = v12;
        -[HMIFaceprinter updatedFaceprintsForFaceCrops:withExistingFaceprints:error:](v49, "updatedFaceprintsForFaceCrops:withExistingFaceprints:error:", v55, v51, &v60);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v60;

        if (!v15)
        {
          v42 = (void *)MEMORY[0x220735570]();
          v43 = v54;
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v62 = v45;
            v63 = 2112;
            v64 = (uint64_t)v52;
            _os_log_impl(&dword_219D45000, v44, OS_LOG_TYPE_ERROR, "%{public}@Error faceprinting face crops:%@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v42);
          -[HMFOperation cancelWithError:](v43, "cancelWithError:", v52);

          v12 = v52;
          goto LABEL_27;
        }
        objc_msgSend(v15, "allAtCurrentVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "unionSet:", v16);
        objc_msgSend(v15, "createdAtCurrentVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          v18 = (void *)MEMORY[0x220735570]();
          v19 = v54;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v17, "count");
            *(_DWORD *)buf = 138543618;
            v62 = v21;
            v63 = 2048;
            v64 = v22;
            _os_log_impl(&dword_219D45000, v20, OS_LOG_TYPE_INFO, "%{public}@Storing %lu newly created faceprints", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          objc_initWeak((id *)buf, v19);
          -[HMIHomePersonClusteringTask dataSource](v19, "dataSource");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = MEMORY[0x24BDAC760];
          v58[1] = 3221225472;
          v58[2] = __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke;
          v58[3] = &unk_24DBE9D08;
          objc_copyWeak(&v59, (id *)buf);
          objc_msgSend(v23, "addFaceprints:completion:", v17, v58);

          objc_destroyWeak(&v59);
          objc_destroyWeak((id *)buf);
        }
        objc_msgSend(v15, "existingAtOtherVersions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
        {
          objc_msgSend(v24, "na_map:", &__block_literal_global_115);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x220735570]();
          v27 = v54;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v24, "count");
            *(_DWORD *)buf = 138543618;
            v62 = v29;
            v63 = 2048;
            v64 = v30;
            _os_log_impl(&dword_219D45000, v28, OS_LOG_TYPE_INFO, "%{public}@Removing %lu faceprints from old versions", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
          objc_initWeak((id *)buf, v27);
          -[HMIHomePersonClusteringTask dataSource](v27, "dataSource");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = MEMORY[0x24BDAC760];
          v56[1] = 3221225472;
          v56[2] = __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke_116;
          v56[3] = &unk_24DBE9D08;
          objc_copyWeak(&v57, (id *)buf);
          objc_msgSend(v31, "removeFaceprintsWithUUIDs:completion:", v25, v56);

          objc_destroyWeak(&v57);
          objc_destroyWeak((id *)buf);

        }
        ++v11;
        v32 = v52;
        v12 = v52;
        if (v11 == v48)
          goto LABEL_20;
      }
      v38 = (void *)MEMORY[0x220735570]();
      v39 = v54;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = v41;
        _os_log_impl(&dword_219D45000, v40, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
    }
LABEL_27:

  }
}

void __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6 = (void *)MEMORY[0x220735570]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error saving new faceprints:%@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

uint64_t __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke_113(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6 = (void *)MEMORY[0x220735570]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error removing faceprints from old versions:%@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_stageFour_clusterFaceprints:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonClusteringTask *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMIHomePersonClusteringTask *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMIGreedyClustering *clusterer;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  HMIHomePersonClusteringTask *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t i;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  HMIHomePersonClusteringTask *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  double v49;
  void *v50;
  HMIHomePersonClusteringTask *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  uint64_t v65;
  HMIPerson *v66;
  void *v67;
  HMIPerson *v68;
  void *v69;
  void *v70;
  HMIHomePersonClusteringTask *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  HMIHomePersonClusteringTask *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  HMIHomePersonClusteringTask *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id obj;
  id obja;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  uint8_t v100[128];
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  int v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMIHomePersonClusteringTask isCancelled](self, "isCancelled"))
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v102 = v8;
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    +[HMIFaceUtilities faceObservationsFromFaceprintsForClustering:](HMIFaceUtilities, "faceObservationsFromFaceprintsForClustering:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x220735570]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v102 = v13;
      v103 = 2048;
      v104 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_INFO, "%{public}@Number of faceprints to cluster: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = objc_msgSend(v9, "count");
    -[HMIHomePersonClusteringTask summary](v11, "summary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfFaceprintsClustered:", v14);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    clusterer = v11->_clusterer;
    v99 = 0;
    -[HMIGreedyClustering getClustersWithFaces:error:](clusterer, "getClustersWithFaces:error:", v9, &v99);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v99;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceDate:", v16);
    v22 = v21;
    -[HMIHomePersonClusteringTask summary](v11, "summary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setClusteringDuration:", v22);

    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x220735570]();
      v26 = v11;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 138543618;
        v102 = v28;
        v103 = 2048;
        v104 = v29;
        _os_log_impl(&dword_219D45000, v27, OS_LOG_TYPE_INFO, "%{public}@Number of clusters: %lu", buf, 0x16u);

      }
      v79 = v16;
      v80 = v4;

      objc_autoreleasePoolPop(v25);
      v30 = objc_msgSend(v18, "count");
      -[HMIHomePersonClusteringTask summary](v26, "summary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setNumberOfClusters:", v30);

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v78 = v18;
      v32 = v18;
      v81 = v9;
      v82 = v26;
      v86 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
      if (v86)
      {
        v85 = *(_QWORD *)v96;
        v84 = v32;
        while (2)
        {
          for (i = 0; i != v86; ++i)
          {
            if (*(_QWORD *)v96 != v85)
              objc_enumerationMutation(v32);
            v34 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
            objc_msgSend(v34, "objects");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "count");

            if (v36 > 9)
            {
              +[HMIGreedyClustering centermostFaceprintInCluster:faceObservations:](HMIGreedyClustering, "centermostFaceprintInCluster:faceObservations:", v34, v9);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMIHomePersonClusteringTask personsModelManager](v26, "personsModelManager");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMIHomeTask homeUUID](v26, "homeUUID");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = v19;
              objc_msgSend(v44, "predictHomePersonFromFaceObservation:homeUUID:error:", v43, v45, &v94);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              obj = v94;

              if (!v46)
              {
                if (objc_msgSend(obj, "code") != 1037)
                {
                  v74 = (void *)MEMORY[0x220735570]();
                  v75 = v26;
                  HMFGetOSLogHandle();
                  v76 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v102 = v77;
                    v103 = 2112;
                    v104 = (uint64_t)obj;
                    _os_log_impl(&dword_219D45000, v76, OS_LOG_TYPE_ERROR, "%{public}@Face prediction error:%@", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v74);
                  v19 = obj;
                  -[HMFOperation cancelWithError:](v75, "cancelWithError:", obj);

                  v16 = v79;
                  v4 = v80;
                  v18 = v78;
                  v58 = v84;
                  goto LABEL_44;
                }
                objc_msgSend(v83, "addObject:", v34);
              }
              objc_msgSend(v46, "confidence");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "floatValue");
              v49 = v48;

              if (v49 <= 0.83)
              {
                objc_msgSend(v83, "addObject:", v34);
              }
              else
              {
                v50 = (void *)MEMORY[0x220735570]();
                v51 = v26;
                HMFGetOSLogHandle();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "personUUID");
                  v54 = v24;
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v102 = v53;
                  v103 = 2112;
                  v104 = (uint64_t)v55;
                  _os_log_impl(&dword_219D45000, v52, OS_LOG_TYPE_INFO, "%{public}@Assigning cluster to existing person with UUID: %@", buf, 0x16u);

                  v24 = v54;
                  v26 = v82;

                  v9 = v81;
                }

                objc_autoreleasePoolPop(v50);
                objc_msgSend(v46, "personUUID");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v56, v34);

              }
              v19 = obj;
              v32 = v84;
            }
            else
            {
              v37 = (void *)MEMORY[0x220735570]();
              v38 = v26;
              HMFGetOSLogHandle();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objects");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v41, "count");
                *(_DWORD *)buf = 138543874;
                v102 = v40;
                v103 = 2048;
                v104 = v42;
                v105 = 1024;
                v106 = 10;
                _os_log_impl(&dword_219D45000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Cluster of size %lu beneath threshold of %d", buf, 0x1Cu);

                v26 = v82;
              }

              objc_autoreleasePoolPop(v37);
            }
          }
          v86 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
          if (v86)
            continue;
          break;
        }
      }
      v87 = v19;
      v57 = v24;

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v83, "count");
      -[HMIHomePersonClusteringTask summary](v26, "summary");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setNumberOfPersonsCreated:", v59);

      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      obja = v83;
      v61 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v91;
        do
        {
          for (j = 0; j != v62; ++j)
          {
            if (*(_QWORD *)v91 != v63)
              objc_enumerationMutation(obja);
            v65 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j);
            v66 = [HMIPerson alloc];
            objc_msgSend(MEMORY[0x24BDD1880], "UUID");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = -[HMIPerson initWithUUID:name:](v66, "initWithUUID:name:", v67, 0);

            objc_msgSend(v58, "addObject:", v68);
            -[HMIPerson UUID](v68, "UUID");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setObject:forKeyedSubscript:", v69, v65);

          }
          v62 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
        }
        while (v62);
      }

      v24 = v57;
      v4 = v80;
      -[HMIHomePersonClusteringTask _stageFive_addPersons:clusterMapping:faceprints:](v82, "_stageFive_addPersons:clusterMapping:faceprints:", v58, v57, v80);
      v9 = v81;
      v18 = v78;
      v16 = v79;
      v19 = v87;
LABEL_44:

    }
    else
    {
      v70 = (void *)MEMORY[0x220735570]();
      v71 = v11;
      HMFGetOSLogHandle();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v102 = v73;
        v103 = 2112;
        v104 = (uint64_t)v19;
        _os_log_impl(&dword_219D45000, v72, OS_LOG_TYPE_ERROR, "%{public}@Clustering error:%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v70);
      -[HMFOperation cancelWithError:](v71, "cancelWithError:", v19);
    }

  }
}

- (void)_stageFive_addPersons:(id)a3 clusterMapping:(id)a4 faceprints:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMIHomePersonClusteringTask *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[HMIHomePersonClusteringTask isCancelled](self, "isCancelled"))
  {
    v11 = (void *)MEMORY[0x220735570]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[HMIHomePersonClusteringTask dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __79__HMIHomePersonClusteringTask__stageFive_addPersons_clusterMapping_faceprints___block_invoke;
    v16[3] = &unk_24DBEDAE0;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v9;
    v18 = v10;
    objc_msgSend(v15, "addPersons:completion:", v8, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

void __79__HMIHomePersonClusteringTask__stageFive_addPersons_clusterMapping_faceprints___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = (void *)MEMORY[0x220735570]();
      v7 = v5;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v9;
        v12 = 2112;
        v13 = v3;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error adding new persons:%@", (uint8_t *)&v10, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(v7, "cancelWithError:", v3);
    }
    else
    {
      objc_msgSend(WeakRetained, "_stageSix_associateFaceCropsWithClusterMapping:faceprints:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
  }

}

- (void)_stageSix_associateFaceCropsWithClusterMapping:(id)a3 faceprints:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  HMIHomePersonClusteringTask *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  const __CFString *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *, void *);
  void *v37;
  id v38;
  HMIHomePersonClusteringTask *v39;
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__9;
  v46 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x24BDAC760];
  v35 = 3221225472;
  v36 = __89__HMIHomePersonClusteringTask__stageSix_associateFaceCropsWithClusterMapping_faceprints___block_invoke;
  v37 = &unk_24DBEDB30;
  v9 = v7;
  v38 = v9;
  v39 = self;
  v10 = v8;
  v40 = v10;
  v41 = &v42;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v34);
  v11 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v10, v11))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1048, CFSTR("Error on dispatch_group_wait (associateFaceCrops)"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](self, "cancelWithError:", v12);
  }
  else
  {
    v13 = (void *)MEMORY[0x220735570]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v16;
      _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_INFO, "%{public}@Finished calls to associateFaceCropsWithUUIDs", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    os_unfair_lock_lock_with_options();
    v17 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend((id)v43[5], "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithArray:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&v14->_lock);
    if ((objc_msgSend(v12, "hmf_isEmpty") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v12, "count");
      v21 = objc_msgSend(v12, "count");
      v22 = CFSTR("s");
      if (v21 <= 1)
        v22 = &stru_24DBF1B40;
      objc_msgSend(v19, "appendFormat:", CFSTR("Error associating face crops for %lu person%@: ("), v20, v22, v34, v35, v36, v37, v38, v39);
      v23 = (void *)MEMORY[0x24BDD17C8];
      v24 = objc_msgSend(v12, "count");
      if (v24 >= 3)
        v25 = 3;
      else
        v25 = v24;
      objc_msgSend(v12, "subarrayWithRange:", 0, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v12, "count");
      v29 = CFSTR(" ...");
      if (v28 <= 3)
        v29 = &stru_24DBF1B40;
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@%@"), v27, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "appendString:", v30);
      objc_msgSend(v19, "appendString:", CFSTR(")"));
      v31 = (void *)MEMORY[0x24BDD1540];
      v32 = (void *)objc_msgSend(v19, "copy");
      objc_msgSend(v31, "hmiPrivateErrorWithCode:description:", 1048, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMFOperation cancelWithError:](v14, "cancelWithError:", v33);
    }
    -[HMIHomePersonClusteringTask finish](v14, "finish");
  }

  _Block_object_dispose(&v42, 8);
}

void __89__HMIHomePersonClusteringTask__stageSix_associateFaceCropsWithClusterMapping_faceprints___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  id v23;
  id location;
  _QWORD v25[4];
  id v26;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "objects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __89__HMIHomePersonClusteringTask__stageSix_associateFaceCropsWithClusterMapping_faceprints___block_invoke_2;
  v25[3] = &unk_24DBEAF80;
  v26 = *(id *)(a1 + 32);
  objc_msgSend(v8, "na_map:", v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "summary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfUnknownFaceprintsAssociated");
  v14 = objc_msgSend(v11, "count") + v13;
  objc_msgSend(*(id *)(a1 + 40), "summary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfUnknownFaceprintsAssociated:", v14);

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __89__HMIHomePersonClusteringTask__stageSix_associateFaceCropsWithClusterMapping_faceprints___block_invoke_3;
  v20[3] = &unk_24DBEDB08;
  objc_copyWeak(&v23, &location);
  v17 = v6;
  v21 = v17;
  v19 = *(_OWORD *)(a1 + 48);
  v18 = (id)v19;
  v22 = v19;
  objc_msgSend(v16, "associateFaceCropsWithUUIDs:toPersonWithUUID:forSource:completion:", v11, v17, 3, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

id __89__HMIHomePersonClusteringTask__stageSix_associateFaceCropsWithClusterMapping_faceprints___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", (int)objc_msgSend(a2, "intValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceCropUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __89__HMIHomePersonClusteringTask__stageSix_associateFaceCropsWithClusterMapping_faceprints___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x220735570]();
      v6 = (os_unfair_lock_s *)WeakRetained;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 32);
        v10 = 138543874;
        v11 = v8;
        v12 = 2112;
        v13 = v9;
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error associating face crops with person (%@): %@", (uint8_t *)&v10, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      os_unfair_lock_lock_with_options();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
      os_unfair_lock_unlock(v6 + 88);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

- (void)finish
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMIHomePersonClusteringTask;
  -[HMFOperation finish](&v11, sel_finish);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHomePersonClusteringTask startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;
  -[HMIHomePersonClusteringTask summary](self, "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTotalDuration:", v6);

  -[HMFOperation error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHomePersonClusteringTask summary](self, "summary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setError:", v8);

  -[HMIHomePersonClusteringTask summary](self, "summary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIAnalytics sendEventForClusteringTask:](HMIAnalytics, "sendEventForClusteringTask:", v10);

}

- (id)personCreatedDateFromFaceCrops:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__HMIHomePersonClusteringTask_personCreatedDateFromFaceCrops___block_invoke;
  v6[3] = &unk_24DBEDB58;
  v6[4] = &v7;
  objc_msgSend(v3, "na_each:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __62__HMIHomePersonClusteringTask_personCreatedDateFromFaceCrops___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v11 = v3;
  if (!v4
    || (objc_msgSend(v3, "dateCreated"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "compare:", v5),
        v5,
        v7 = v11,
        v6 == -1))
  {
    objc_msgSend(v11, "dateCreated");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v7 = v11;
  }

}

- (void)removePerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HMIHomePersonClusteringTask dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__HMIHomePersonClusteringTask_removePerson___block_invoke;
  v11[3] = &unk_24DBEDAE0;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v12 = v9;
  v10 = v4;
  v13 = v10;
  objc_msgSend(v8, "removePersonsWithUUIDs:completion:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __44__HMIHomePersonClusteringTask_removePerson___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 32);
        v12 = 138543874;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        v16 = 2112;
        v17 = v3;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error removing person with UUID:%@, error:%@", (uint8_t *)&v12, 0x20u);
LABEL_7:

      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_INFO, "%{public}@Succesfully removed person %@", (uint8_t *)&v12, 0x16u);

      goto LABEL_7;
    }

    objc_autoreleasePoolPop(v5);
  }

}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 360, 1);
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 368, 1);
}

- (HMIPersonsModelManager)personsModelManager
{
  return (HMIPersonsModelManager *)objc_getProperty(self, a2, 376, 1);
}

- (HMIClusteringTaskSummary)summary
{
  return (HMIClusteringTaskSummary *)objc_getProperty(self, a2, 384, 1);
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 392, 1);
}

- (BOOL)doImpurePersonCleanup
{
  return self->_doImpurePersonCleanup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_personsModelManager, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_faceClassifier, 0);
  objc_storeStrong((id *)&self->_clusterer, 0);
}

@end
