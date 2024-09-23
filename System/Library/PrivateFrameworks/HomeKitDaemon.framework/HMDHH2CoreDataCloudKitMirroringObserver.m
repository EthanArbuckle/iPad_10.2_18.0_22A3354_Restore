@implementation HMDHH2CoreDataCloudKitMirroringObserver

- (HMDHH2CoreDataCloudKitMirroringObserver)initWithObjectIds:(id)a3 coreData:(id)a4 storeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDHH2CoreDataCloudKitMirroringObserver *v11;
  uint64_t v12;
  NSMutableSet *objectIdsToMonitor;
  void *v14;
  uint64_t v15;
  NSManagedObjectContext *cachedMOC;
  HMDHH2CoreDataCloudKitMirroringObserver *result;
  HMDHH2CoreDataCloudKitMirroringObserver *v18;
  SEL v19;
  id v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMDHH2CoreDataCloudKitMirroringObserver;
  v11 = -[HMDHH2CoreDataCloudKitMirroringObserver init](&v21, sel_init);
  if (!v11)
    goto LABEL_5;
  if (v10)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v8);
      v12 = objc_claimAutoreleasedReturnValue();
      objectIdsToMonitor = v11->_objectIdsToMonitor;
      v11->_objectIdsToMonitor = (NSMutableSet *)v12;

      v11->_totalObjectsToMonitor = objc_msgSend(v8, "count");
      objc_storeStrong((id *)&v11->_coreData, a4);
      objc_storeStrong((id *)&v11->_storeIdentifier, a5);
      v11->_isExportProgressRequestAlreadyInProgress = 0;
      v11->_numberOfIgnoredExportProgressRequest = 0;
      -[HMDHH2CoreDataCloudKitMirroringObserver coreData](v11, "coreData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "newManagedObjectContext");
      cachedMOC = v11->_cachedMOC;
      v11->_cachedMOC = (NSManagedObjectContext *)v15;

LABEL_5:
      return v11;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v18 = (HMDHH2CoreDataCloudKitMirroringObserver *)_HMFPreconditionFailure();
  -[HMDHH2CoreDataCloudKitMirroringObserver startMonitoring:](v18, v19, v20);
  return result;
}

- (void)startMonitoring:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  HMDHH2CoreDataCloudKitMirroringObserver *v8;
  SEL v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[HMDHH2CoreDataCloudKitMirroringObserver cachedMOC](self, "cachedMOC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDHH2CoreDataCloudKitMirroringObserver cachedMOC](self, "cachedMOC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__HMDHH2CoreDataCloudKitMirroringObserver_startMonitoring___block_invoke;
    v10[3] = &unk_24E79C2B8;
    v10[4] = self;
    v11 = v4;
    v7 = v4;
    objc_msgSend(v6, "performBlock:", v10);

  }
  else
  {
    v8 = (HMDHH2CoreDataCloudKitMirroringObserver *)_HMFPreconditionFailure();
    -[HMDHH2CoreDataCloudKitMirroringObserver stopMonitoring](v8, v9);
  }
}

- (void)stopMonitoring
{
  void *v3;
  _QWORD v4[5];

  -[HMDHH2CoreDataCloudKitMirroringObserver cachedMOC](self, "cachedMOC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__HMDHH2CoreDataCloudKitMirroringObserver_stopMonitoring__block_invoke;
  v4[3] = &unk_24E79C240;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)callClientsCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[HMDHH2CoreDataCloudKitMirroringObserver completionHandler](self, "completionHandler");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  -[HMDHH2CoreDataCloudKitMirroringObserver stopMonitoring](self, "stopMonitoring");
  if (v5)
    v5[2](v5, v4);

}

- (void)verifyModelsPushedToCloudKit
{
  void *v3;
  HMDHH2CoreDataCloudKitMirroringObserver *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDHH2CoreDataCloudKitMirroringObserver *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHH2CoreDataCloudKitMirroringObserver *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Going to verify models pushed to cloudKit using export stream", (uint8_t *)&v18, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHH2CoreDataCloudKitMirroringObserver objectIdsToMonitor](v4, "objectIdsToMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    if (!-[HMDHH2CoreDataCloudKitMirroringObserver verifyModelsPushedToCloudKitUsingCoreDataExportStream](v4, "verifyModelsPushedToCloudKitUsingCoreDataExportStream"))
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = v4;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while pushing the CD models to CloudKit.", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHH2CoreDataCloudKitMirroringObserver callClientsCompletionHandler:](v10, "callClientsCompletionHandler:", v13);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v4;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Looks like we are not monitoring any object changes. Not doing anything.", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }
}

- (void)processExportResult:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHH2CoreDataCloudKitMirroringObserver *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDHH2CoreDataCloudKitMirroringObserver *v14;
  NSObject *v15;
  void *v16;
  HMDHH2CoreDataCloudKitMirroringObserver *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDHH2CoreDataCloudKitMirroringObserver *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDHH2CoreDataCloudKitMirroringObserver *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDHH2CoreDataCloudKitMirroringObserver *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  _QWORD v45[5];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v11;
    v48 = 2112;
    v49 = v6;
    v50 = 2112;
    v51 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@process export result: %@, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = -[HMDHH2CoreDataCloudKitMirroringObserver setIsExportProgressRequestAlreadyInProgress:](v9, "setIsExportProgressRequestAlreadyInProgress:", 0);
  if (v7)
  {
    v13 = (void *)MEMORY[0x227676638](v12);
    v14 = v9;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v16;
      v48 = 2112;
      v49 = v7;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Core Data export stream indicated error while exporting models to CloudKit : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = v14;
    v18 = v7;
LABEL_7:
    -[HMDHH2CoreDataCloudKitMirroringObserver callClientsCompletionHandler:](v17, "callClientsCompletionHandler:", v18);
    goto LABEL_8;
  }
  objc_msgSend(v6, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __73__HMDHH2CoreDataCloudKitMirroringObserver_processExportResult_withError___block_invoke;
  v45[3] = &unk_24E78B428;
  v45[4] = v9;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v45);

  -[HMDHH2CoreDataCloudKitMirroringObserver objectIdsToMonitor](v9, "objectIdsToMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v23 = (void *)MEMORY[0x227676638]();
  v24 = v9;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
  if (!v22)
  {
    if (v26)
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v43;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Successfully exported all the CD objects to CloudKit.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v17 = v24;
    v18 = 0;
    goto LABEL_7;
  }
  if (v26)
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD16E0];
    v29 = -[HMDHH2CoreDataCloudKitMirroringObserver totalObjectsToMonitor](v24, "totalObjectsToMonitor");
    -[HMDHH2CoreDataCloudKitMirroringObserver objectIdsToMonitor](v24, "objectIdsToMonitor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithUnsignedLongLong:", v29 - objc_msgSend(v30, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDHH2CoreDataCloudKitMirroringObserver totalObjectsToMonitor](v24, "totalObjectsToMonitor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v27;
    v48 = 2112;
    v49 = v31;
    v50 = 2112;
    v51 = v32;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@CD to CK export progress : %@ out of %@ exported", buf, 0x20u);

    v20 = MEMORY[0x24BDAC760];
  }

  objc_autoreleasePoolPop(v23);
  v33 = (void *)MEMORY[0x227676638]();
  v34 = v24;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDHH2CoreDataCloudKitMirroringObserver numberOfIgnoredExportProgressRequest](v34, "numberOfIgnoredExportProgressRequest"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v36;
    v48 = 2112;
    v49 = v37;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Number of ignored export progress request:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v33);
  if (-[HMDHH2CoreDataCloudKitMirroringObserver numberOfIgnoredExportProgressRequest](v34, "numberOfIgnoredExportProgressRequest"))
  {
    v38 = (void *)MEMORY[0x227676638](-[HMDHH2CoreDataCloudKitMirroringObserver setNumberOfIgnoredExportProgressRequest:](v34, "setNumberOfIgnoredExportProgressRequest:", 0));
    v39 = v34;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v41;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Requesting to verify the models pushed to CK as we ignored few export progress request earlier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v38);
    -[HMDHH2CoreDataCloudKitMirroringObserver cachedMOC](v39, "cachedMOC");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v20;
    v44[1] = 3221225472;
    v44[2] = __73__HMDHH2CoreDataCloudKitMirroringObserver_processExportResult_withError___block_invoke_13;
    v44[3] = &unk_24E79C240;
    v44[4] = v39;
    objc_msgSend(v42, "performBlock:", v44);

  }
LABEL_8:

}

- (BOOL)verifyModelsPushedToCloudKitUsingCoreDataExportStream
{
  void *v3;
  HMDHH2CoreDataCloudKitMirroringObserver *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  HMDHH2CoreDataCloudKitMirroringObserver *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  BOOL v29;
  HMDHH2CoreDataCloudKitMirroringObserver *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDHH2CoreDataCloudKitMirroringObserver *v34;
  NSObject *v35;
  void *v37;
  id v39;
  _QWORD v40[6];
  uint8_t v41[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  void *v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (-[HMDHH2CoreDataCloudKitMirroringObserver isExportProgressRequestAlreadyInProgress](self, "isExportProgressRequestAlreadyInProgress"))
  {
    v3 = (void *)MEMORY[0x227676638](-[HMDHH2CoreDataCloudKitMirroringObserver setNumberOfIgnoredExportProgressRequest:](self, "setNumberOfIgnoredExportProgressRequest:", -[HMDHH2CoreDataCloudKitMirroringObserver numberOfIgnoredExportProgressRequest](self, "numberOfIgnoredExportProgressRequest")+ 1));
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDHH2CoreDataCloudKitMirroringObserver numberOfIgnoredExportProgressRequest](v4, "numberOfIgnoredExportProgressRequest"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@There is an export request already in progress. Will not create another one. : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    return 1;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBB628]);
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDD16E0];
      -[HMDHH2CoreDataCloudKitMirroringObserver objectIdsToMonitor](v11, "objectIdsToMonitor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Waiting for [%@] migrated models to be pushed to the cloud", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v51 = __Block_byref_object_copy__165644;
    v52 = __Block_byref_object_dispose__165645;
    v53 = 0;
    v17 = objc_alloc(MEMORY[0x24BDBB610]);
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __96__HMDHH2CoreDataCloudKitMirroringObserver_verifyModelsPushedToCloudKitUsingCoreDataExportStream__block_invoke;
    v40[3] = &unk_24E78B450;
    v40[4] = v11;
    v40[5] = buf;
    v18 = (void *)objc_msgSend(v17, "initWithOptions:completionBlock:", v9, v40);
    objc_msgSend(v18, "requestIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v19;

    -[HMDHH2CoreDataCloudKitMirroringObserver objectIdsToMonitor](v11, "objectIdsToMonitor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v18, "setObjectIDsToFetch:", v22);

    +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cloudPrivateStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAffectedStores:", v25);

    -[HMDHH2CoreDataCloudKitMirroringObserver cachedMOC](v11, "cachedMOC");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v26, "executeRequest:error:", v18, &v39);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v39;

    if (v27)
      v29 = v28 == 0;
    else
      v29 = 0;
    v8 = v29;
    if (v29)
    {
      v33 = (void *)MEMORY[0x227676638](-[HMDHH2CoreDataCloudKitMirroringObserver setIsExportProgressRequestAlreadyInProgress:](v11, "setIsExportProgressRequestAlreadyInProgress:", 1));
      v30 = v11;
      HMFGetOSLogHandle();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v41 = 138544130;
        v42 = v31;
        v43 = 2112;
        v44 = v32;
        v45 = 2112;
        v46 = v27;
        v47 = 2112;
        v48 = 0;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Successfully submitted NSCloudKitMirroringExportProgressRequest [%@] to CD. Result: %@, error: %@", v41, 0x2Au);

      }
    }
    else
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = v11;
      HMFGetOSLogHandle();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v41 = 138543618;
        v42 = v37;
        v43 = 2112;
        v44 = v28;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Got error while submitting export progress request: %@", v41, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v33);
    _Block_object_dispose(buf, 8);

  }
  return v8;
}

- (void)coreData:(id)a3 persistentStoreWithIdentifierDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHH2CoreDataCloudKitMirroringObserver *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  HMDHH2CoreDataCloudKitMirroringObserver *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received persistent store changed notification for store: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHH2CoreDataCloudKitMirroringObserver storeIdentifier](v9, "storeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HMFEqualObjects();

  if ((v13 & 1) != 0)
  {
    -[HMDHH2CoreDataCloudKitMirroringObserver cachedMOC](v9, "cachedMOC");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __91__HMDHH2CoreDataCloudKitMirroringObserver_coreData_persistentStoreWithIdentifierDidChange___block_invoke;
    v20[3] = &unk_24E79C240;
    v20[4] = v9;
    objc_msgSend(v14, "performBlock:", v20);

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v9;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHH2CoreDataCloudKitMirroringObserver storeIdentifier](v16, "storeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Wrong store identifier: Expecting %@ got %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (NSMutableSet)objectIdsToMonitor
{
  return self->_objectIdsToMonitor;
}

- (void)setObjectIdsToMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_objectIdsToMonitor, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HMDCoreData)coreData
{
  return self->_coreData;
}

- (void)setCoreData:(id)a3
{
  objc_storeStrong((id *)&self->_coreData, a3);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storeIdentifier, a3);
}

- (NSManagedObjectContext)cachedMOC
{
  return self->_cachedMOC;
}

- (void)setCachedMOC:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMOC, a3);
}

- (BOOL)isExportProgressRequestAlreadyInProgress
{
  return self->_isExportProgressRequestAlreadyInProgress;
}

- (void)setIsExportProgressRequestAlreadyInProgress:(BOOL)a3
{
  self->_isExportProgressRequestAlreadyInProgress = a3;
}

- (unint64_t)numberOfIgnoredExportProgressRequest
{
  return self->_numberOfIgnoredExportProgressRequest;
}

- (void)setNumberOfIgnoredExportProgressRequest:(unint64_t)a3
{
  self->_numberOfIgnoredExportProgressRequest = a3;
}

- (unint64_t)totalObjectsToMonitor
{
  return self->_totalObjectsToMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMOC, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_objectIdsToMonitor, 0);
}

uint64_t __91__HMDHH2CoreDataCloudKitMirroringObserver_coreData_persistentStoreWithIdentifierDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "verifyModelsPushedToCloudKit");
}

void __96__HMDHH2CoreDataCloudKitMirroringObserver_verifyModelsPushedToCloudKitUsingCoreDataExportStream__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v4;
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v3, "success");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "madeChanges");
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    objc_msgSend(v3, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    v4 = v19;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v12;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] export progress result completion handler block is called with : Success : %@, madeChanges: %@, result Class : %@, error: %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _HMFPreconditionFailure();
  if (objc_msgSend(v3, "success"))
  {
    objc_msgSend(v3, "objectIDToLastExportedToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "cachedMOC");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __96__HMDHH2CoreDataCloudKitMirroringObserver_verifyModelsPushedToCloudKitUsingCoreDataExportStream__block_invoke_19;
  v20[3] = &unk_24E79B5F8;
  v16 = *(_QWORD *)(a1 + 40);
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = v14;
  v22 = v3;
  v23 = v16;
  v17 = v3;
  v18 = v14;
  objc_msgSend(v15, "performBlock:", v20);

}

void __96__HMDHH2CoreDataCloudKitMirroringObserver_verifyModelsPushedToCloudKitUsingCoreDataExportStream__block_invoke_19(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[%@] processing export results", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processExportResult:withError:", v8, v9);

}

void __73__HMDHH2CoreDataCloudKitMirroringObserver_processExportResult_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectIdsToMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

}

uint64_t __73__HMDHH2CoreDataCloudKitMirroringObserver_processExportResult_withError___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "verifyModelsPushedToCloudKit");
}

void __57__HMDHH2CoreDataCloudKitMirroringObserver_stopMonitoring__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@stopMonitoring", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfIgnoredExportProgressRequest:", 0);
    objc_msgSend(*(id *)(a1 + 32), "objectIdsToMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "coreData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeNotificationListener:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@already stopped monitoring. Not doing anything.", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
}

uint64_t __59__HMDHH2CoreDataCloudKitMirroringObserver_startMonitoring___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@startMonitoring", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  if (!*(_QWORD *)(a1 + 40))
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "coreData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addNotificationListener:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "verifyModelsPushedToCloudKit");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_165686 != -1)
    dispatch_once(&logCategory__hmf_once_t20_165686, &__block_literal_global_165687);
  return (id)logCategory__hmf_once_v21_165688;
}

void __54__HMDHH2CoreDataCloudKitMirroringObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21_165688;
  logCategory__hmf_once_v21_165688 = v0;

}

@end
