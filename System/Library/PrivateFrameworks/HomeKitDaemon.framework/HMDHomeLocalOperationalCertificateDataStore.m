@implementation HMDHomeLocalOperationalCertificateDataStore

- (HMDHomeLocalOperationalCertificateDataStore)initWithMOC:(id)a3
{
  id v5;
  HMDHomeLocalOperationalCertificateDataStore *v6;
  HMDHomeLocalOperationalCertificateDataStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHomeLocalOperationalCertificateDataStore;
  v6 = -[HMDHomeLocalOperationalCertificateDataStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localMOC, a3);

  return v7;
}

- (id)currentOperationalCertDataForFabric:(id)a3 withMOC:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "hmd_assertIsExecuting");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__229087;
  v21 = __Block_byref_object_dispose__229088;
  v22 = 0;
  +[MKFLocalOperationalCertificateData fetchRequest](MKFLocalOperationalCertificateData, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __97__HMDHomeLocalOperationalCertificateDataStore_currentOperationalCertDataForFabric_withMOC_error___block_invoke;
  v14[3] = &unk_24E796EE0;
  v11 = v7;
  v15 = v11;
  v16 = &v17;
  objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)saveOperationalCertData:(id)a3 forFabricID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HMDHomeLocalOperationalCertificateDataStore localMOC](self, "localMOC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __83__HMDHomeLocalOperationalCertificateDataStore_saveOperationalCertData_forFabricID___block_invoke;
  v12[3] = &unk_24E79A910;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v10, "performBlock:", v12);

}

- (id)operationalCertDataForFabricID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__229087;
  v21 = __Block_byref_object_dispose__229088;
  v22 = 0;
  -[HMDHomeLocalOperationalCertificateDataStore localMOC](self, "localMOC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__HMDHomeLocalOperationalCertificateDataStore_operationalCertDataForFabricID___block_invoke;
  v12[3] = &unk_24E79B670;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  v8 = v5;
  v14 = v8;
  v16 = &v17;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v8, "performBlock:", v12);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void)removeOperationalCertDataForFabricID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  NSObject *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  -[HMDHomeLocalOperationalCertificateDataStore localMOC](self, "localMOC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__HMDHomeLocalOperationalCertificateDataStore_removeOperationalCertDataForFabricID___block_invoke;
  v10[3] = &unk_24E79B670;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v8 = v6;
  v12 = v8;
  v14 = v15;
  v9 = v5;
  v13 = v9;
  objc_msgSend(v8, "performBlock:", v10);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(v15, 8);
}

- (NSManagedObjectContext)localMOC
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocalMOC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localMOC, 0);
}

void __84__HMDHomeLocalOperationalCertificateDataStore_removeOperationalCertDataForFabricID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v22 = 0;
  objc_msgSend(v2, "currentOperationalCertDataForFabric:withMOC:error:", v3, v4, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error fetching currentCertData for fabric %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);

    v5 = 0;
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v5);
    v13 = *(void **)(a1 + 48);
    v21 = 0;
    v14 = objc_msgSend(v13, "save:", &v21);
    v7 = v21;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v14;
  }
  else
  {
    v7 = 0;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v24 = v18;
    v25 = 2112;
    v26 = v19;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@LocalOperationalCertificateData deletion results = %@, fabricID %@ error %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __78__HMDHomeLocalOperationalCertificateDataStore_operationalCertDataForFabricID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v26 = 0;
  objc_msgSend(v2, "currentOperationalCertDataForFabric:withMOC:error:", v3, v4, &v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v26;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v28 = v10;
      v29 = 2112;
      v30 = v6;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error %@ fetching currentCertData for fabric %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);

  }
  else if (v5)
  {
    v17 = objc_alloc(MEMORY[0x24BE4EF58]);
    objc_msgSend(v5, "fabricID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootCert");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "operationalCert");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ownerNodeID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ipk");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v17, "initWithFabricID:rootCert:operationalCert:ownerNode:ipk:", v18, v19, v20, v21, v22);
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    goto LABEL_10;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No locally saved data for fabricID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __83__HMDHomeLocalOperationalCertificateDataStore_saveOperationalCertData_forFabricID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v30 = 0;
  objc_msgSend(v2, "currentOperationalCertDataForFabric:withMOC:error:", v3, v4, &v30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v30;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v32 = v11;
      v33 = 2112;
      v34 = v7;
      v35 = 2112;
      v36 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error %@ fetching currentCertData for fabric %@", buf, 0x20u);

    }
  }
  else
  {
    if (!v5)
    {
      v13 = (void *)MEMORY[0x24BDBB658];
      +[MKFLocalOperationalCertificateData entity](MKFLocalOperationalCertificateData, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertNewObjectForEntityForName:inManagedObjectContext:", v15, *(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v32 = v19;
        v33 = 2112;
        v34 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Created new model for LocalOperationalCertificateData for fabric %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }
    objc_msgSend(v5, "setFabricID:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 56), "operationalCert");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOperationalCert:", v21);

    objc_msgSend(*(id *)(a1 + 56), "rootCert");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRootCert:", v22);

    objc_msgSend(*(id *)(a1 + 56), "ownerNode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOwnerNodeID:", v23);

    objc_msgSend(*(id *)(a1 + 56), "ipk");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIpk:", v24);

    v25 = *(void **)(a1 + 48);
    v29 = 0;
    objc_msgSend(v25, "save:", &v29);
    v7 = v29;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(void **)(a1 + 40);
      HMFBooleanToString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v26;
      v33 = 2112;
      v34 = v27;
      v35 = 2112;
      v36 = v28;
      v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@LocalOperationalCertificateData for fabricID %@ save resuls = %@, error %@", buf, 0x2Au);

    }
  }

  objc_autoreleasePoolPop(v8);
}

void __97__HMDHomeLocalOperationalCertificateDataStore_currentOperationalCertDataForFabric_withMOC_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalOperationalCertificateData entity](MKFLocalOperationalCertificateData, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isKindOfEntity:", v8);

  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v12, "fabricID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "isEqual:", v11);

    if ((_DWORD)v10)
    {
      *a4 = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
  }

}

+ (id)localOperationalCertDataStore
{
  if (localOperationalCertDataStore_dispatchOnce != -1)
    dispatch_once(&localOperationalCertDataStore_dispatchOnce, &__block_literal_global_229108);
  return (id)localOperationalCertDataStore_result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_229103 != -1)
    dispatch_once(&logCategory__hmf_once_t7_229103, &__block_literal_global_6_229104);
  return (id)logCategory__hmf_once_v8_229105;
}

void __58__HMDHomeLocalOperationalCertificateDataStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_229105;
  logCategory__hmf_once_v8_229105 = v0;

}

void __76__HMDHomeLocalOperationalCertificateDataStore_localOperationalCertDataStore__block_invoke()
{
  HMDHomeLocalOperationalCertificateDataStore *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = [HMDHomeLocalOperationalCertificateDataStore alloc];
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "container");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "newBackgroundContext");
  v3 = -[HMDHomeLocalOperationalCertificateDataStore initWithMOC:](v0, "initWithMOC:", v2);
  v4 = (void *)localOperationalCertDataStore_result;
  localOperationalCertDataStore_result = v3;

}

@end
