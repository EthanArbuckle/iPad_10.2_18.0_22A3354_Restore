@implementation HMDCoreDataCloudMirroringExportStatusMonitor

- (HMDCoreDataCloudMirroringExportStatusMonitor)initWithCoreData:(id)a3 managedObjectContext:(id)a4
{
  id v7;
  id v8;
  HMDCoreDataCloudMirroringExportStatusMonitor *v9;
  HMDCoreDataCloudMirroringExportStatusMonitor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCoreDataCloudMirroringExportStatusMonitor;
  v9 = -[HMDCoreDataCloudMirroringExportStatusMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coreData, a3);
    objc_storeStrong((id *)&v10->_managedObjectContext, a4);
  }

  return v10;
}

- (BOOL)isComplete
{
  HMDCoreDataCloudMirroringExportStatusMonitor *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HMDCoreDataCloudMirroringExportStatusMonitor managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__HMDCoreDataCloudMirroringExportStatusMonitor_isComplete__block_invoke;
  v5[3] = &unk_24E79B698;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)configureWithExpectedObjectIDToExportedToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCoreDataCloudMirroringExportStatusMonitor managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __93__HMDCoreDataCloudMirroringExportStatusMonitor_configureWithExpectedObjectIDToExportedToken___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)verifyModelsExportStatus
{
  void *v3;
  _QWORD v4[5];

  -[HMDCoreDataCloudMirroringExportStatusMonitor managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__HMDCoreDataCloudMirroringExportStatusMonitor_verifyModelsExportStatus__block_invoke;
  v4[3] = &unk_24E79C240;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)coreData:(id)a3 persistentStoreWithIdentifierDidChange:(id)a4
{
  HMDCoreData *coreData;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];

  if (self)
    coreData = self->_coreData;
  else
    coreData = 0;
  v6 = a4;
  -[HMDCoreData cloudPrivateStore](coreData, "cloudPrivateStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (v9)
  {
    -[HMDCoreDataCloudMirroringExportStatusMonitor managedObjectContext](self, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __96__HMDCoreDataCloudMirroringExportStatusMonitor_coreData_persistentStoreWithIdentifierDidChange___block_invoke;
    v11[3] = &unk_24E79C240;
    v11[4] = self;
    objc_msgSend(v10, "performBlock:", v11);

  }
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (HMDCoreDataCloudMirroringExportStatusMonitorDelegate)delegate
{
  return (HMDCoreDataCloudMirroringExportStatusMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDToExportedToken, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __96__HMDCoreDataCloudMirroringExportStatusMonitor_coreData_persistentStoreWithIdentifierDidChange___block_invoke(uint64_t a1)
{
  -[HMDCoreDataCloudMirroringExportStatusMonitor _verifyModelsExportComplete](*(_QWORD *)(a1 + 32));
}

- (void)_verifyModelsExportComplete
{
  void *v2;
  _BYTE *v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[6];
  uint8_t v30[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  void *v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 8) && objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v2 = (void *)MEMORY[0x227676638]();
      v3 = (id)a1;
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Request to verify export while another is still in progress", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v2);
      v3[9] = 1;
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__158391;
      v42 = __Block_byref_object_dispose__158392;
      v43 = 0;
      v6 = objc_alloc_init(MEMORY[0x24BDBB628]);
      v7 = objc_alloc(MEMORY[0x24BDBB610]);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __75__HMDCoreDataCloudMirroringExportStatusMonitor__verifyModelsExportComplete__block_invoke;
      v29[3] = &unk_24E78B450;
      v29[4] = a1;
      v29[5] = &buf;
      v8 = (void *)objc_msgSend(v7, "initWithOptions:completionBlock:", v6, v29);
      objc_msgSend(v8, "requestIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v9;

      v11 = (void *)MEMORY[0x24BDBCF20];
      v12 = *(id *)(a1 + 40);
      objc_msgSend(v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObjectIDsToFetch:", v14);

      v15 = *(id *)(a1 + 32);
      objc_msgSend(v15, "cloudPrivateStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAffectedStores:", v17);

      objc_msgSend((id)a1, "managedObjectContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v18, "executeRequest:error:", v8, &v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v28;

      if (!v19 || v20)
      {
        v21 = (void *)MEMORY[0x227676638]();
        v26 = (id)a1;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v30 = 138543618;
          v31 = v27;
          v32 = 2114;
          v33 = v20;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Got error while submitting export progress request: %{public}@", v30, 0x16u);

        }
      }
      else
      {
        *(_BYTE *)(a1 + 8) = 1;
        v21 = (void *)MEMORY[0x227676638]();
        v22 = (id)a1;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v30 = 138544130;
          v31 = v24;
          v32 = 2114;
          v33 = v25;
          v34 = 2114;
          v35 = v19;
          v36 = 2114;
          v37 = 0;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Successfully submitted NSCloudKitMirroringExportProgressRequest [%{public}@] to CD. Result: %{public}@, error: %{public}@", v30, 0x2Au);

        }
      }

      objc_autoreleasePoolPop(v21);
      _Block_object_dispose(&buf, 8);

    }
  }
}

void __75__HMDCoreDataCloudMirroringExportStatusMonitor__verifyModelsExportComplete__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v4;
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
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
    v29 = v7;
    v30 = 2114;
    v31 = v8;
    v4 = v24;
    v32 = 2114;
    v33 = v9;
    v34 = 2114;
    v35 = v10;
    v36 = 2114;
    v37 = v11;
    v38 = 2114;
    v39 = v12;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Export progress result completion handler block is called with : Success : %{public}@, madeChanges: %{public}@, result Class : %{public}@, error: %{public}@", buf, 0x3Eu);

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
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v18;
      v30 = 2114;
      v31 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected export progress result error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __75__HMDCoreDataCloudMirroringExportStatusMonitor__verifyModelsExportComplete__block_invoke_5;
  v25[3] = &unk_24E79C0A8;
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(_QWORD *)(a1 + 40);
  v26 = v14;
  v27 = v22;
  v25[4] = v21;
  v23 = v14;
  objc_msgSend(v20, "performBlock:", v25);

}

void __75__HMDCoreDataCloudMirroringExportStatusMonitor__verifyModelsExportComplete__block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE buf[24];
  void *v36;
  id v37;
  id *v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Processing export results", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  if (v7)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v7;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Process export result: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10[5];
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __69__HMDCoreDataCloudMirroringExportStatusMonitor__processExportResult___block_invoke;
    v36 = &unk_24E78A6F0;
    v37 = v8;
    v38 = v10;
    v15 = v13;
    v39 = v15;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", buf);
    v16 = v10[5];
    objc_msgSend(v15, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectsForKeys:", v17);

    v18 = objc_msgSend(v10[5], "count");
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v10;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BDD16E0];
        v25 = v20[5];
        objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v23;
        v33 = 2114;
        v34 = v26;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@CD to CK export progress : %{public}@ remaining", (uint8_t *)&v31, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }
    else
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543362;
        v32 = v27;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Successfully exported all the CD objects to CloudKit.", (uint8_t *)&v31, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(v20[4], "removeNotificationListener:", v20);
      objc_msgSend(v20, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "monitorDidObserveExportComplete:", v20);

    }
  }

  v29 = *(_QWORD *)(a1 + 32);
  if (v29)
  {
    *(_BYTE *)(v29 + 8) = 0;
    v30 = *(_QWORD *)(a1 + 32);
    if (v30)
    {
      if (*(_BYTE *)(v30 + 9))
      {
        *(_BYTE *)(v30 + 9) = 0;
        -[HMDCoreDataCloudMirroringExportStatusMonitor _verifyModelsExportComplete](*(_QWORD *)(a1 + 32));
      }
    }
  }
}

void __69__HMDCoreDataCloudMirroringExportStatusMonitor__processExportResult___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  HMDAssertionLogEvent *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v21 = 0;
    v9 = objc_msgSend(v7, "compareToken:error:", v6, &v21);
    v10 = v21;
    if ((unint64_t)(v9 - 3) > 1)
    {
      if (!v9)
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = a1[5];
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v23 = v18;
          v24 = 2112;
          v25 = v10;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cloud Mirror Export Token Comparison Failed %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        v19 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Cloud Mirror Export Token Comparison Failed %@"), v10);
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "submitLogEvent:", v19);

      }
    }
    else
    {
      objc_msgSend(a1[6], "addObject:", v5);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1[5];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      v24 = 2114;
      v25 = v5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Cannot compare a nil result token for key %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

}

void __72__HMDCoreDataCloudMirroringExportStatusMonitor_verifyModelsExportStatus__block_invoke(uint64_t a1)
{
  -[HMDCoreDataCloudMirroringExportStatusMonitor _verifyModelsExportComplete](*(_QWORD *)(a1 + 32));
}

void __93__HMDCoreDataCloudMirroringExportStatusMonitor_configureWithExpectedObjectIDToExportedToken___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_storeStrong((id *)(v3 + 40), v2);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 32);
  else
    v5 = 0;
  objc_msgSend(v5, "addNotificationListener:");
  -[HMDCoreDataCloudMirroringExportStatusMonitor _verifyModelsExportComplete](*(_QWORD *)(a1 + 32));
}

uint64_t __58__HMDCoreDataCloudMirroringExportStatusMonitor_isComplete__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    result = objc_msgSend(*(id *)(v2 + 40), "count");
    LOBYTE(v2) = result == 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = v2;
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_158424 != -1)
    dispatch_once(&logCategory__hmf_once_t11_158424, &__block_literal_global_158425);
  return (id)logCategory__hmf_once_v12_158426;
}

void __59__HMDCoreDataCloudMirroringExportStatusMonitor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12_158426;
  logCategory__hmf_once_v12_158426 = v0;

}

@end
