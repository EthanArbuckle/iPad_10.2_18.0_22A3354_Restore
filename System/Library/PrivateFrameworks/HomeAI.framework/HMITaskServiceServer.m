@implementation HMITaskServiceServer

- (HMITaskServiceServer)init
{
  HMITaskServiceServer *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMITaskServiceServer;
  v2 = -[HMITaskService initPrivate](&v6, sel_initPrivate);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_nextTaskID = 1;
  }
  return v2;
}

- (int)getNextTaskID
{
  os_unfair_lock_s *p_lock;
  int v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[HMITaskServiceServer nextTaskID](self, "nextTaskID");
  -[HMITaskServiceServer setNextTaskID:](self, "setNextTaskID:", (v4 + 1));
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int)submitTaskWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id);
  uint64_t v11;
  id v12;
  void *v13;
  HMITaskServiceServer *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("taskType"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (id)v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x220735570]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v16;
      _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_DEBUG, "%{public}@options is empty/nil, defaulting to Home persons clustering task with impure person cleanup", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    if (v8)
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v8);
    else
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("doImpurePersonCleanup"));
    v18 = objc_msgSend(v17, "copy");

    v12 = (id)HMITaskTypeHomePersonClusteringTask;
    v8 = (id)v18;
  }
  if (objc_msgSend(v12, "isEqualToString:", HMITaskTypeUpdatePersonsModelTask))
  {
    v33 = 0;
    v19 = (id *)&v33;
    -[HMITaskServiceServer buildUpdatePersonsModelTaskFromOptions:error:](self, "buildUpdatePersonsModelTaskFromOptions:error:", v8, &v33);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v12, "isEqualToString:", HMITaskTypeRemovePersonsModelTask))
  {
    v32 = 0;
    v19 = (id *)&v32;
    -[HMITaskServiceServer buildRemovePersonsModelTaskFromOptions:error:](self, "buildRemovePersonsModelTaskFromOptions:error:", v8, &v32);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v12, "isEqualToString:", HMITaskTypeHomePersonClusteringTask))
  {
    v31 = 0;
    v19 = (id *)&v31;
    -[HMITaskServiceServer buildHomePersonClusteringTaskFromOptions:error:](self, "buildHomePersonClusteringTaskFromOptions:error:", v8, &v31);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v12, "isEqualToString:", HMITaskTypeEmptyTask))
  {
    v30 = 0;
    v19 = (id *)&v30;
    -[HMITaskServiceServer buildEmptyTaskFromOptions:error:](self, "buildEmptyTaskFromOptions:error:", v8, &v30);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v12, "isEqualToString:", HMITaskTypeFaceMisclassificationTask))
  {
    v29 = 0;
    v19 = (id *)&v29;
    -[HMITaskServiceServer buildFaceMisclassificationTaskFromOptions:error:](self, "buildFaceMisclassificationTaskFromOptions:error:", v8, &v29);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v12, "isEqualToString:", HMITaskTypePersonsModelsSummaryTask))
  {
    v28 = 0;
    v19 = (id *)&v28;
    -[HMITaskServiceServer buildPersonsModelsSummaryTaskFromOptions:error:](self, "buildPersonsModelsSummaryTaskFromOptions:error:", v8, &v28);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v12, "isEqualToString:", HMITaskTypeFeedbackTask))
  {
    v27 = 0;
    v19 = (id *)&v27;
    -[HMITaskServiceServer buildSubmitFeedbackTaskFromOptions:error:](self, "buildSubmitFeedbackTaskFromOptions:error:", v8, &v27);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v12, "isEqualToString:", HMITaskTypeUpdateTorsoModelTask))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown task type: %@"), v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1042, v24);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
    v26 = 0;
    v19 = (id *)&v26;
    -[HMITaskServiceServer buildUpdateTorsoModelTaskFromOptions:error:](self, "buildUpdateTorsoModelTaskFromOptions:error:", v8, &v26);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
  v22 = *v19;
  if (!v21)
  {
LABEL_28:
    v34 = CFSTR("resultCode");
    v35 = CFSTR("Error");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v21, v22);
    v23 = -1;
    goto LABEL_29;
  }
  v23 = -[HMITaskServiceServer submitTask:progressHandler:completionHander:](self, "submitTask:progressHandler:completionHander:", v21, v9, v10);
LABEL_29:

  return v23;
}

- (int)submitTask:(id)a3 progressHandler:(id)a4 completionHander:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, v8);
  v11 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __68__HMITaskServiceServer_submitTask_progressHandler_completionHander___block_invoke;
  v22[3] = &unk_24DBEB7D0;
  v12 = v9;
  v23 = v12;
  objc_msgSend(v8, "setProgressBlock:", v22);
  v16 = v11;
  v17 = 3221225472;
  v18 = __68__HMITaskServiceServer_submitTask_progressHandler_completionHander___block_invoke_2;
  v19 = &unk_24DBE9F90;
  objc_copyWeak(&v21, &location);
  v13 = v10;
  v20 = v13;
  objc_msgSend(v8, "setCompletionBlock:", &v16);
  -[HMITaskServiceServer operationQueue](self, "operationQueue", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v8);

  LODWORD(v14) = objc_msgSend(v8, "taskID");
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
  return (int)v14;
}

uint64_t __68__HMITaskServiceServer_submitTask_progressHandler_completionHander___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__HMITaskServiceServer_submitTask_progressHandler_completionHander___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

}

- (BOOL)cancelTask:(int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  -[HMITaskServiceServer operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__HMITaskServiceServer_cancelTask___block_invoke;
  v8[3] = &unk_24DBEB7F8;
  v9 = a3;
  v8[4] = &v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = v11[5];
  if (v6)
    objc_msgSend((id)v11[5], "cancel");
  _Block_object_dispose(&v10, 8);

  return v6 != 0;
}

void __35__HMITaskServiceServer_cancelTask___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "taskID") == *(_DWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)buildUpdatePersonsModelTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  HMIHomeKitClient *v15;
  HMIHomeKitClient *v16;
  HMITaskServiceServer *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMIExternalPersonDataSourceHomeKit *v22;
  void *v23;
  void *v24;
  HMIUpdatePersonsModelTask *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  id v30;
  _BOOL8 v31;
  HMITaskServiceServer *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  HMIHomeKitClient *v46;
  HMIHomeKitClient *v47;
  void *context;
  _BOOL4 contexta;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isExternal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1026, CFSTR("HMIUpdatePersonsModelTaskIsExternal is nil"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (a4)
        *a4 = objc_retainAutorelease(v26);
      HMIErrorLog(self, v27);

      v25 = 0;
      goto LABEL_32;
    }
    v10 = objc_msgSend(v8, "BOOLValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringPreferenceForKey:defaultValue:", CFSTR("personDataSourceDiskStoragePath"), &stru_24DBF1B40);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", &stru_24DBF1B40);

      if (v14)
      {
        v15 = objc_alloc_init(HMIHomeKitClient);
        v16 = v15;
        if ((_DWORD)v10)
        {
          context = (void *)MEMORY[0x220735570]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v46 = v16;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v52 = v19;
            v53 = 2112;
            v54 = v7;
            v55 = 2112;
            v56 = v11;
            _os_log_impl(&dword_219D45000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Creating HMPhotosPersonManager for homeUUID:%@ sourceUUID:%@", buf, 0x20u);

            v16 = v46;
          }

          objc_autoreleasePoolPop(context);
          -[HMIHomeKitClient photosPersonManagerForHomeUUID:sourceUUID:](v16, "photosPersonManagerForHomeUUID:sourceUUID:", v7, v11);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            v22 = -[HMIExternalPersonDataSourceHomeKit initWithHMPhotosPersonManager:]([HMIExternalPersonDataSourceHomeKit alloc], "initWithHMPhotosPersonManager:", v20);
            contexta = 0;
LABEL_24:

            v30 = 0;
            v31 = contexta;
            goto LABEL_25;
          }
          v39 = (void *)MEMORY[0x24BDD1540];
          v40 = CFSTR("Failed to get HMPhotosPersonManager");
        }
        else
        {
          contexta = -[HMIHomeKitClient isCurrentDevicePrimaryResident](v15, "isCurrentDevicePrimaryResident");
          v45 = (void *)MEMORY[0x220735570]();
          v32 = self;
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v47 = v16;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v34;
            v53 = 2112;
            v54 = v7;
            _os_log_impl(&dword_219D45000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Creating HMHomePersonManager for homeUUID:%@", buf, 0x16u);

            v16 = v47;
          }

          objc_autoreleasePoolPop(v45);
          -[HMIHomeKitClient homePersonManagerForHomeUUID:](v16, "homePersonManagerForHomeUUID:", v7);
          v35 = objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            v21 = (void *)v35;
            v22 = -[HMIHomePersonDataSourceHomeKit initWithHMHomePersonManager:]([HMIHomePersonDataSourceHomeKit alloc], "initWithHMHomePersonManager:", v35);
            goto LABEL_24;
          }
          v39 = (void *)MEMORY[0x24BDD1540];
          v40 = CFSTR("Failed to get HMHomePersonManager");
        }
        objc_msgSend(v39, "hmiPrivateErrorWithCode:description:", 1026, v40, v45);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (a4)
        {
          v44 = objc_retainAutorelease(v43);
          *a4 = v44;
        }
        HMIErrorLog(self, v44);

LABEL_30:
        v25 = 0;
        goto LABEL_31;
      }
      if ((_DWORD)v10)
      {
        v50 = 0;
        v22 = -[HMIPersonDataSourceDisk initWithHomeUUID:sourceUUID:error:]([HMIExternalPersonDataSourceDisk alloc], "initWithHomeUUID:sourceUUID:error:", v7, v11, &v50);
        v30 = v50;
        if (v22)
        {
          v31 = 0;
LABEL_25:
          v25 = -[HMIUpdatePersonsModelTask initWithTaskID:homeUUID:sourceUUID:dataSource:externalLibrary:removeExcessFaceCrops:]([HMIUpdatePersonsModelTask alloc], "initWithTaskID:homeUUID:sourceUUID:dataSource:externalLibrary:removeExcessFaceCrops:", -[HMITaskServiceServer getNextTaskID](self, "getNextTaskID"), v7, v11, v22, v10, v31);

LABEL_31:
LABEL_32:

          goto LABEL_33;
        }
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1026, CFSTR("Failed to initialize data source"), v30);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (a4)
          *a4 = objc_retainAutorelease(v41);
        HMIErrorLog(self, v42);

        goto LABEL_30;
      }
      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = CFSTR("Disk-based Home Person Data Source not supported");
    }
    else
    {
      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = CFSTR("HMIPersonsModelTaskSourceUUID is nil");
    }
    objc_msgSend(v28, "hmiPrivateErrorWithCode:description:", 1026, v29);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a4)
      *a4 = objc_retainAutorelease(v36);
    HMIErrorLog(self, v37);

    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1026, CFSTR("HMITaskHomeUUIDKey is nil"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (a4)
    *a4 = objc_retainAutorelease(v23);
  HMIErrorLog(self, v24);

  v25 = 0;
LABEL_33:

  return v25;
}

- (id)buildRemovePersonsModelTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HMIRemovePersonsModelTask *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1027, CFSTR("HMITaskHomeUUIDKey is nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    HMIErrorLog(self, v8);
    goto LABEL_10;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1027, CFSTR("HMIPersonsModelTaskSourceUUID is nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    HMIErrorLog(self, v12);

LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v9 = -[HMIRemovePersonsModelTask initWithTaskID:homeUUID:sourceUUID:]([HMIRemovePersonsModelTask alloc], "initWithTaskID:homeUUID:sourceUUID:", -[HMITaskServiceServer getNextTaskID](self, "getNextTaskID"), v7, v8);
LABEL_11:

  return v9;
}

- (id)buildFaceMisclassificationTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HMIHomeKitClient *v8;
  void *v9;
  HMIHomePersonDataSourceHomeKit *v10;
  void *v11;
  HMIFaceMisclassificationTask *v12;
  HMIHomeKitClient *v13;
  HMIHomePersonDataSourceHomeKit *v14;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(HMIHomeKitClient);
    -[HMIHomeKitClient homePersonManagerForHomeUUID:](v8, "homePersonManagerForHomeUUID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[HMIHomePersonDataSourceHomeKit initWithHMHomePersonManager:]([HMIHomePersonDataSourceHomeKit alloc], "initWithHMHomePersonManager:", v9);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceCrop"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMIFaceMisclassificationTask initWithTaskID:dataSource:faceCrop:]([HMIFaceMisclassificationTask alloc], "initWithTaskID:dataSource:faceCrop:", -[HMITaskServiceServer getNextTaskID](self, "getNextTaskID"), v10, v11);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1029, CFSTR("Failed to get HMHomePersonManager"));
      v14 = (HMIHomePersonDataSourceHomeKit *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      HMIErrorLog(self, v10);
      v12 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1029, CFSTR("HMITaskHomeUUIDKey is nil"));
    v13 = (HMIHomeKitClient *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (a4)
      *a4 = objc_retainAutorelease(v13);
    HMIErrorLog(self, v8);
    v12 = 0;
  }

  return v12;
}

- (id)buildHomePersonClusteringTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6;
  HMIHomeKitClient *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMIHomePersonDataSourceHomeKit *v16;
  void *v17;
  void *v18;
  HMIHomePersonClusteringTask *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  HMIHomePersonClusteringTask *v23;
  HMIEmptyTask *v24;
  void *v25;
  HMITaskServiceServer *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMIHomePersonDataSourceHomeKit *v30;
  void *v31;
  unsigned int v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((HMIIsResidentDevice() & 1) != 0)
  {
    v7 = objc_alloc_init(HMIHomeKitClient);
    if (-[HMIHomeKitClient isCurrentDevicePrimaryResident](v7, "isCurrentDevicePrimaryResident"))
    {
      -[HMIHomeKitClient homePersonManagersForCurrentDevice](v7, "homePersonManagersForCurrentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        v9 = arc4random();
        v10 = v9 % objc_msgSend(v8, "count");
        objc_msgSend(v8, "allObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIHomeKitClient homeForHMPersonManagerUUID:](v7, "homeForHMPersonManagerUUID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = -[HMIHomePersonDataSourceHomeKit initWithHMHomePersonManager:]([HMIHomePersonDataSourceHomeKit alloc], "initWithHMHomePersonManager:", v12);
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("doImpurePersonCleanup"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("doImpurePersonCleanup"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v18, "BOOLValue");

            v34 = v15;
            v19 = [HMIHomePersonClusteringTask alloc];
            v20 = -[HMITaskServiceServer getNextTaskID](self, "getNextTaskID");
            objc_msgSend(v12, "UUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v19;
            v15 = v34;
            v24 = -[HMIHomePersonClusteringTask initWithTaskID:homeUUID:dataSource:sourceUUID:personsModelManager:doImpurePersonCleanup:error:](v23, "initWithTaskID:homeUUID:dataSource:sourceUUID:personsModelManager:doImpurePersonCleanup:error:", v20, v34, v16, v21, v22, v33, a4);

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1028, CFSTR("cleanup key is missing"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v31;
            if (a4)
              *a4 = objc_retainAutorelease(v31);
            HMIErrorLog(self, v21);
            v24 = 0;
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1028, CFSTR("HomeUUID is nil"));
          v30 = (HMIHomePersonDataSourceHomeKit *)objc_claimAutoreleasedReturnValue();
          v16 = v30;
          if (a4)
            *a4 = objc_retainAutorelease(v30);
          HMIErrorLog(self, v16);
          v24 = 0;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1028, CFSTR("Failed to get HMHomePersonManager"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v29;
        if (a4)
          *a4 = objc_retainAutorelease(v29);
        HMIErrorLog(self, v12);
        v24 = 0;
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x220735570]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v28;
        _os_log_impl(&dword_219D45000, v27, OS_LOG_TYPE_INFO, "%{public}@Current device is not primary resident, skipping clustering", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      v24 = -[HMITask initWithTaskID:]([HMIEmptyTask alloc], "initWithTaskID:", -[HMITaskServiceServer getNextTaskID](v26, "getNextTaskID"));
    }

  }
  else
  {
    v24 = -[HMITask initWithTaskID:]([HMIEmptyTask alloc], "initWithTaskID:", -[HMITaskServiceServer getNextTaskID](self, "getNextTaskID"));
  }

  return v24;
}

- (id)buildPersonsModelsSummaryTaskFromOptions:(id)a3 error:(id *)a4
{
  void *v6;
  HMIPersonsModelsSummaryTask *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[HMIPersonsModelsSummaryTask initWithTaskID:homeUUID:]([HMIPersonsModelsSummaryTask alloc], "initWithTaskID:homeUUID:", -[HMITaskServiceServer getNextTaskID](self, "getNextTaskID"), v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1030, CFSTR("HMITaskHomeUUIDKey is nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    HMIErrorLog(self, v9);

    v7 = 0;
  }

  return v7;
}

- (id)buildSubmitFeedbackTaskFromOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  HMIFeedbackTask *v8;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cameraProfileUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clipUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMIFeedbackTask initWithTaskID:cameraProfileUUID:clipUUID:]([HMIFeedbackTask alloc], "initWithTaskID:cameraProfileUUID:clipUUID:", -[HMITaskServiceServer getNextTaskID](self, "getNextTaskID"), v6, v7);
  return v8;
}

- (id)buildUpdateTorsoModelTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HMIUpdateTorsoModelTask *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1039, CFSTR("HMITaskHomeUUIDKey is nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    HMIErrorLog(self, v8);
    goto LABEL_10;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("torsoAnnotations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1039, CFSTR("HMIUpdateTorsoModelTaskAnnotationsKey is nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    HMIErrorLog(self, v12);

LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v9 = -[HMIUpdateTorsoModelTask initWithTaskID:homeUUID:torsoAnnotations:]([HMIUpdateTorsoModelTask alloc], "initWithTaskID:homeUUID:torsoAnnotations:", -[HMITaskServiceServer getNextTaskID](self, "getNextTaskID"), v7, v8);
LABEL_11:

  return v9;
}

- (id)buildEmptyTaskFromOptions:(id)a3 error:(id *)a4
{
  void *v6;
  HMIEmptyTask *v7;
  uint64_t v8;
  HMIEmptyTask *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("duration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [HMIEmptyTask alloc];
    v8 = -[HMITaskServiceServer getNextTaskID](self, "getNextTaskID");
    objc_msgSend(v6, "doubleValue");
    v9 = -[HMIEmptyTask initWithTaskID:duration:](v7, "initWithTaskID:duration:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1039, CFSTR("HMIEmptyTaskDurationKey is nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    HMIErrorLog(self, v11);

    v9 = 0;
  }

  return v9;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (int)nextTaskID
{
  return self->_nextTaskID;
}

- (void)setNextTaskID:(int)a3
{
  self->_nextTaskID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
