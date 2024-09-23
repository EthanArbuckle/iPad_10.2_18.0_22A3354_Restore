@implementation MKFCKHome

- (BOOL)_importHomeManagerNewHome:(BOOL)a3 newPrimaryHome:(id)a4 newApplicationData:(id)a5 context:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MKFCKHome *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  MKFCKHome *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  MKFCKHome *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  MKFCKHome *v36;
  NSObject *v37;
  void *v38;
  MKFCKHome *v39;
  void *v40;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _BYTE *v46;
  id v47;
  uint8_t v48[4];
  id v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v8 = a3;
  v58 = *MEMORY[0x24BDAC8D0];
  v43 = a4;
  v10 = a5;
  v11 = a6;
  v47 = 0;
  +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:", v11, &v47);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v47;
  if (!v12)
  {
    v35 = (void *)MEMORY[0x227676638]();
    v39 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v40;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v42;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);

    }
    goto LABEL_20;
  }
  if (v8)
  {
    v13 = (void *)objc_opt_class();
    -[MKFCKHome modelID](self, "modelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_homeManagerHomeWithModelID:homeManager:context:", v14, v12, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v17;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "debugDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);

  }
  if (v43)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v55 = __Block_byref_object_copy_;
    v56 = __Block_byref_object_dispose_;
    v57 = 0;
    objc_msgSend(v12, "homes");
    v25 = objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __94__MKFCKHome_HomeManager___importHomeManagerNewHome_newPrimaryHome_newApplicationData_context___block_invoke;
    v44[3] = &unk_24E787B80;
    v45 = v43;
    v46 = buf;
    objc_msgSend((id)v25, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v44);

    objc_msgSend(v12, "primaryHome");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = objc_msgSend(v26, "isEqual:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    if ((v25 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "setPrimaryHome:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40)));
      v28 = self;
      HMFGetOSLogHandle();
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "handle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "homeUUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v48 = 138543874;
        v49 = v30;
        v50 = 2160;
        v51 = 1752392040;
        v52 = 2112;
        v53 = v32;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Setting new primary home with modelID %{mask.hash}@", v48, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
    }

    _Block_object_dispose(buf, 8);
  }
  if (v10)
  {
    objc_msgSend(v12, "appDataDictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = isEqualDeepCompare(v33, v10);

    if ((v34 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "setAppDataDictionary:", v10));
      v36 = self;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Setting new home manager application data: %@", buf, 0x16u);

      }
LABEL_20:

      objc_autoreleasePoolPop(v35);
    }
  }

  return v12 != 0;
}

- (BOOL)_importHomeManagerWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  MKFCKHome *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  MKFCKHome *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  MKFCKHome *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  MKFCKHome *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  MKFCKHome *v42;
  NSObject *v43;
  void *v44;
  char v45;
  void *v46;
  id v47;
  void *context;
  id v50;
  char v51;
  BOOL v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  char v58;
  _QWORD v59[7];
  _QWORD v60[4];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  uint64_t v70;
  uint8_t v71[4];
  void *v72;
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _QWORD v77[5];

  v77[2] = *MEMORY[0x24BDAC8D0];
  v70 = 0;
  v53 = a3;
  +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v4, "homes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithCapacity:", objc_msgSend(v7, "count") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "homes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3221225472;
    v68[2] = __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke;
    v68[3] = &unk_24E794318;
    v10 = v8;
    v69 = v10;
    objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v68);

    -[MKFCKHome modelID](self, "modelID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v10, "containsObject:", v11);

    if ((v51 & 1) == 0)
    {
      -[MKFCKHome modelID](self, "modelID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Detected new home manager home", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
    }
    +[MKFCKHome fetchRequest](MKFCKHome, "fetchRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKModel predicateWithModelIDs:](MKFCKHome, "predicateWithModelIDs:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPredicate:", v18);

    objc_msgSend(v17, "setFetchBatchSize:", 10);
    v77[0] = CFSTR("primaryHomeCounter");
    v77[1] = CFSTR("homeManagerApplicationData");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKModel appendDefaultPreloadedPropertiesTo:](MKFCKHome, "appendDefaultPreloadedPropertiesTo:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPropertiesToFetch:", v20);

    v67 = v5;
    objc_msgSend(v53, "executeFetchRequest:error:", v17, &v67);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v67;

    v52 = v21 != 0;
    if (v21)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v74 = __Block_byref_object_copy_;
      v75 = __Block_byref_object_dispose_;
      v76 = 0;
      v61 = 0;
      v62 = &v61;
      v63 = 0x3032000000;
      v64 = __Block_byref_object_copy_;
      v65 = __Block_byref_object_dispose_;
      v66 = 0;
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x2020000000;
      v60[3] = 0;
      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke_12;
      v59[3] = &unk_24E773240;
      v59[4] = buf;
      v59[5] = v60;
      v59[6] = &v61;
      objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v59);
      objc_msgSend(v4, "primaryHome");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "homeUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqual:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

      if ((v25 & 1) != 0)
      {
        v26 = 0;
      }
      else
      {
        v26 = *(id *)(*(_QWORD *)&buf[8] + 40);
        v35 = (void *)MEMORY[0x227676638]();
        v36 = self;
        HMFGetOSLogHandle();
        v37 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v71 = 138543362;
          v72 = v38;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Detected new primary home", v71, 0xCu);

        }
        objc_autoreleasePoolPop(v35);
      }
      v39 = (void *)v62[5];
      objc_msgSend(v4, "appDataDictionary");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = isEqualDeepCompare(v39, v40);

      if ((v39 & 1) != 0)
      {
        v41 = 0;
      }
      else
      {
        v41 = (id)v62[5];
        context = (void *)MEMORY[0x227676638]();
        v42 = self;
        HMFGetOSLogHandle();
        v43 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v71 = 138543362;
          v72 = v44;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_DEBUG, "%{public}@Detected new home manager application data", v71, 0xCu);

        }
        objc_autoreleasePoolPop(context);
      }
      if (v26)
        v45 = 1;
      else
        v45 = v51 ^ 1;
      if ((v45 & 1) != 0 || v41)
      {
        objc_msgSend((id)objc_opt_class(), "_homeManagerContextFromContext:", v53);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke_14;
        v54[3] = &unk_24E78E830;
        v54[4] = self;
        v58 = v51 ^ 1;
        v55 = v26;
        v56 = v41;
        v47 = v46;
        v57 = v47;
        objc_msgSend(v47, "performBlockAndWait:", v54);

      }
      _Block_object_dispose(v60, 8);
      _Block_object_dispose(&v61, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v50;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
    }

    v5 = v50;
  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    v52 = 0;
  }

  return v52;
}

- (BOOL)_exportHomeManagerWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  MKFCKHome *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  MKFCKHome *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  MKFCKHome *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v40 = 0;
  +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:", v4, &v40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v40;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFetchBatchSize:", 10);
    v47[0] = CFSTR("primaryHomeCounter");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKModel appendDefaultPreloadedPropertiesTo:](MKFCKHome, "appendDefaultPreloadedPropertiesTo:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPropertiesToFetch:", v9);

    v39 = v6;
    objc_msgSend(v4, "executeFetchRequest:error:", v7, &v39);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v39;

    v12 = v10 != 0;
    if (!v10)
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v28;
        v43 = 2114;
        v44 = (uint64_t)v11;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      goto LABEL_19;
    }
    v38 = v11;
    objc_msgSend(v5, "primaryHome");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "homeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCoreDataCloudTransformHomeManager fixUpPrimaryHomeCounterForPrimaryHome:primaryHomeModelID:](HMDCoreDataCloudTransformHomeManager, "fixUpPrimaryHomeCounterForPrimaryHome:primaryHomeModelID:", v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v11 = v38;
      if (!-[MKFCKHome isEqual:](self, "isEqual:", v16))
      {
LABEL_18:

LABEL_19:
        v6 = v11;
        goto LABEL_20;
      }
      objc_msgSend(v5, "appDataDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKHome homeManagerApplicationData](self, "homeManagerApplicationData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = isEqualDeepCompare(v17, v18);

      if ((v19 & 1) == 0)
      {
        v20 = (void *)objc_msgSend(v17, "copy");
        -[MKFCKHome setHomeManagerApplicationData:](self, "setHomeManagerApplicationData:", v20);

      }
    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "primaryHome");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handle");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "homeUUID");
        v37 = v29;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v32;
        v43 = 2160;
        v44 = 1752392040;
        v45 = 2112;
        v46 = v33;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@No primary home yet: %{mask.hash}@", buf, 0x20u);

        v29 = v37;
      }

      objc_autoreleasePoolPop(v29);
    }
    v11 = v38;
    goto LABEL_18;
  }
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v24;
    v43 = 2114;
    v44 = (uint64_t)v6;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  v12 = 0;
LABEL_20:

  return v12;
}

void __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "handle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke_12(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 uu2[8];
  uint64_t v14;
  unsigned __int8 uu1[8];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "isFake") & 1) == 0)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
      goto LABEL_6;
    v4 = objc_msgSend(v3, "primaryHomeCounter");
    v5 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    if (v4 >= v5)
    {
      if (v4 != v5)
        goto LABEL_6;
      *(_QWORD *)uu1 = 0;
      v16 = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "getUUIDBytes:", uu1);
      *(_QWORD *)uu2 = 0;
      v14 = 0;
      objc_msgSend(v3, "modelID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getUUIDBytes:", uu2);

      if ((uuid_compare(uu1, uu2) & 0x80000000) == 0)
      {
LABEL_6:
        objc_msgSend(v3, "modelID");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1[4] + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        objc_msgSend(v3, "homeManagerApplicationData");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1[6] + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "primaryHomeCounter");
      }
    }
  }

}

uint64_t __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_importHomeManagerNewHome:newPrimaryHome:newApplicationData:context:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __94__MKFCKHome_HomeManager___importHomeManagerNewHome_newPrimaryHome_newApplicationData_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

+ (id)_homeManagerHomeWithModelID:(id)a3 homeManager:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  _MKFHomeManagerHome *v10;
  void *v11;
  HMDHomeManagerHomeHandle *v12;
  void *v13;
  HMDHomeManagerHomeHandle *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_MKFHomeManagerHome initWithContext:]([_MKFHomeManagerHome alloc], "initWithContext:", v7);

  +[HMDHomeManagerHomeModel deriveUUIDFromHomeUUID:](HMDHomeManagerHomeModel, "deriveUUIDFromHomeUUID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHomeManagerHome setModelID:](v10, "setModelID:", v11);

  v12 = [HMDHomeManagerHomeHandle alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDHomeManagerHomeHandle initWithBackingStoreUUID:homeUUID:](v12, "initWithBackingStoreUUID:homeUUID:", v13, v9);

  -[_MKFHomeManagerHome setHandle:](v10, "setHandle:", v14);
  -[_MKFHomeManagerHome setHomeManager:](v10, "setHomeManager:", v8);
  objc_msgSend(v8, "addHomes_Object:", v10);

  return v10;
}

+ (id)_homeManagerContextFromContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hmd_homeManagerContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Found existing home manager context", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_createHomeManagerContextFromContext:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Created home manager context", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v4, "setHmd_homeManagerContext:", v6);
    }
  }

  return v6;
}

+ (id)_createHomeManagerContextFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hmd_coreData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(v5, "newManagedObjectContext");
    objc_msgSend(v7, "setName:", CFSTR("HomeManager"));
    objc_msgSend(MEMORY[0x24BDBB758], "currentQueryGenerationToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v9 = objc_msgSend(v4, "setQueryGenerationFromToken:error:", v8, &v21);
    v10 = v21;

    if ((v9 & 1) != 0)
    {
      v11 = v7;
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = a1;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v19;
        v24 = 2114;
        v25 = v10;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to pin home manager context to current query generation: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v11 = 0;
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@HMDCoreData is no longer alive", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (BOOL)_importPersonsIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", a3, CFSTR("persons_"), a4);
}

- (BOOL)_exportPersonsFromLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", a3, CFSTR("persons_"), a4);
}

- (BOOL)_importUsersIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  MKFCKHome *v15;
  NSObject *v16;
  void *v17;
  id v18;
  MKFCKHome *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __objc2_class **p_superclass;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  __objc2_class **v30;
  void *v31;
  MKFCKHome *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  MKFCKHome *v36;
  NSObject *v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  BOOL v43;
  id v44;
  id v45;
  void *v46;
  MKFCKHome *v47;
  id v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", v6, CFSTR("users_"), v7))
  {
    v8 = v6;
    v9 = v7;
    if (self)
    {
      -[MKFCKHome owner](self, "owner");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = v10 != 0;
      if (v10)
      {
        v47 = self;
        objc_msgSend(v10, "fetchLocalModelWithContext:", v9);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "owner");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = (void *)MEMORY[0x227676638]();
          v15 = self;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v59 = v17;
            v60 = 2112;
            v61 = v46;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Setting owner during import: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          objc_msgSend(v8, "setOwner:", v46);
        }
        v40 = v11;
        v41 = v9;
        v42 = v8;
        v43 = v12;
        v44 = v7;
        v45 = v6;
        v18 = v9;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v19 = v47;
        -[MKFCKHome accessories](v47, "accessories");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v51;
          p_superclass = HMDMediaGroupsAggregatorBackupSender.superclass;
          v48 = v18;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v51 != v22)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              objc_msgSend(v25, "fetchLocalModelWithContext:", v18);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v27 = v26;
              else
                v27 = 0;
              v28 = v27;

              if (v28)
              {
                -[MKFCKAccessory _importOwnerSettingsIntoLocalModel:context:](v25, v28, v18);
              }
              else
              {
                v29 = v22;
                v30 = p_superclass;
                v31 = (void *)MEMORY[0x227676638]();
                v32 = v19;
                HMFGetOSLogHandle();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v54 = 138543618;
                  v55 = v34;
                  v56 = 2112;
                  v57 = v25;
                  _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local model for accessory: %@", v54, 0x16u);

                  v19 = v47;
                }

                objc_autoreleasePoolPop(v31);
                p_superclass = v30;
                v22 = v29;
                v18 = v48;
              }

            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
          }
          while (v21);
        }

        v7 = v44;
        v6 = v45;
        v12 = v43;
        v9 = v41;
        v8 = v42;
        v11 = v40;
      }
      else
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = self;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v38;
          v60 = 2112;
          v61 = v8;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Can't assign owner during import because the record hasn't downloaded yet: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v35);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_exportUsersFromLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  MKFCKHome *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  MKFCKHome *v23;
  uint64_t v24;
  __objc2_class **p_superclass;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  MKFCKHome *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  MKFCKHome *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  BOOL v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", v6, CFSTR("users_"), v7))
  {
    v8 = v6;
    v9 = v7;
    v10 = self != 0;
    if (self)
    {
      objc_msgSend(v8, "owner");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKHome owner](self, "owner");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v44 = self != 0;
        v45 = v7;
        v46 = v6;
        v41 = v11;
        +[MKFCKModel fetchWithLocalModel:context:](MKFCKUser, "fetchWithLocalModel:context:", v11, v9);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v58 = v17;
          v59 = 2112;
          v60 = v13;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Setting owner during export: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        v40 = (void *)v13;
        -[MKFCKHome setOwner:](v15, "setOwner:", v13);
        v43 = v8;
        v18 = v8;
        v42 = v9;
        v19 = v9;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v39 = v18;
        objc_msgSend(v18, "accessories");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
        if (v21)
        {
          v22 = v21;
          v23 = v15;
          v24 = *(_QWORD *)v50;
          p_superclass = HMDMediaGroupsAggregatorBackupSender.superclass;
          v47 = v19;
          do
          {
            v26 = 0;
            v48 = v22;
            do
            {
              if (*(_QWORD *)v50 != v24)
                objc_enumerationMutation(v20);
              v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v26);
              objc_msgSend(p_superclass + 204, "fetchWithLocalModel:context:", v27, v19);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v29 = v28;
              else
                v29 = 0;
              v30 = v29;

              if (v30)
              {
                -[MKFCKAccessory _exportOwnerSettingsFromLocalModel:context:](v30, v27, v19);
              }
              else
              {
                v31 = (void *)MEMORY[0x227676638]();
                v32 = v23;
                HMFGetOSLogHandle();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v34 = v24;
                  v35 = v20;
                  v36 = v23;
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v53 = 138543618;
                  v54 = v37;
                  v55 = 2112;
                  v56 = v27;
                  _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to find cloud model for accessory: %@", v53, 0x16u);

                  v23 = v36;
                  v20 = v35;
                  v24 = v34;
                  v19 = v47;
                }

                objc_autoreleasePoolPop(v31);
                p_superclass = (__objc2_class **)(HMDMediaGroupsAggregatorBackupSender + 8);
                v22 = v48;
              }

              ++v26;
            }
            while (v22 != v26);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
          }
          while (v22);
        }

        v7 = v45;
        v6 = v46;
        v10 = v44;
        v9 = v42;
        v8 = v43;
        v11 = v41;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)awakeFromInsert
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKFCKHome;
  -[MKFCKModel awakeFromInsert](&v4, sel_awakeFromInsert);
  v3 = MEMORY[0x24BDBD1B8];
  -[MKFCKHome setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", MEMORY[0x24BDBD1B8], CFSTR("guestAccessCodes"));
  -[MKFCKHome setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v3, CFSTR("removedUserAccessCodes"));
}

- (BOOL)_importRelationshipsIntoLocalModel:(id)a3 localRelationshipName:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  BOOL v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relationshipsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKFCKModel relationshipForLocalName:localModel:](self, "relationshipForLocalName:localModel:", v10, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __78__MKFCKHome__importRelationshipsIntoLocalModel_localRelationshipName_context___block_invoke;
  v33[3] = &unk_24E78F998;
  v19 = v17;
  v34 = v19;
  objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);

  objc_msgSend(v14, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKHome valueForKey:](self, "valueForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v22, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MKFCKHome _importIntoLocalHomeModel:cloudModels:localModelsByModelID:processedCloudModels:context:]((_BOOL8)self, v8, v22, v19, v23, v9)&& ((v24 = objc_msgSend(v23, "count"), v24 == objc_msgSend(v22, "count"))|| (objc_msgSend(v22, "minusSet:", v23), -[MKFCKHome _importIntoLocalHomeModel:cloudModels:localModelsByModelID:processedCloudModels:context:]((_BOOL8)self, v8, v22, v19, v23, v9))))
  {
    v28 = v18;
    v29 = 3221225472;
    v30 = __78__MKFCKHome__importRelationshipsIntoLocalModel_localRelationshipName_context___block_invoke_2;
    v31 = &unk_24E77B6F8;
    v25 = v19;
    v32 = v25;
    objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v28);
    -[MKFCKHome _maybeDeleteStaleLocalModels:context:](self, "_maybeDeleteStaleLocalModels:context:", v25, v9, v28, v29, v30, v31);

    v26 = 1;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)_maybeDeleteStaleLocalModels:(id)a3 context:(id)a4
{
  -[MKFCKHome _maybeDeleteStaleLocalModels:modelIDKey:context:](self, "_maybeDeleteStaleLocalModels:modelIDKey:context:", a3, CFSTR("modelID"), a4);
}

- (void)_maybeDeleteStaleLocalModels:(id)a3 modelIDKey:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  MKFCKHome *v20;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "hmd_coreData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudPrivateStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__MKFCKHome__maybeDeleteStaleLocalModels_modelIDKey_context___block_invoke;
  v16[3] = &unk_24E7784D8;
  v17 = v12;
  v18 = v8;
  v19 = v9;
  v20 = self;
  v13 = v9;
  v14 = v8;
  v15 = v12;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v16);

}

- (BOOL)_exportRelationshipsFromLocalHome:(id)a3 localRelationshipName:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relationshipsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKFCKModel relationshipForLocalName:localModel:](self, "relationshipForLocalName:localModel:", v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationship:cloudRelationship:context:](self, "_exportRelationshipsFromLocalHome:localRelationship:cloudRelationship:context:", v10, v13, v14, v8);
  return (char)v9;
}

- (BOOL)_exportRelationshipsFromLocalHome:(id)a3 localRelationship:(id)a4 cloudRelationship:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKHome valueForKey:](self, "valueForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[MKFCKHome _exportRelationshipsFromLocalModel:localRelationship:cloudRelationship:cloudModels:context:](self, "_exportRelationshipsFromLocalModel:localRelationship:cloudRelationship:cloudModels:context:", v13, v12, v11, v15, v10);
  return (char)self;
}

- (BOOL)_exportRelationshipsFromLocalModel:(id)a3 localRelationship:(id)a4 cloudRelationship:(id)a5 cloudModels:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MKFCKHome *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  void *context;
  void *v37;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  MKFCKHome *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  MKFCKHome *v47;
  id v48;
  id v49;
  id v50;
  _BYTE *v51;
  _QWORD v52[4];
  id v53;
  _BYTE buf[24];
  char v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v39 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v14, "hmd_coreData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cloudPrivateStore");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke;
  v52[3] = &unk_24E77B6F8;
  v17 = v16;
  v53 = v17;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v52);

  objc_msgSend(v39, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v12, "destinationEntity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "hmd_deletedModelIDsForEntity:modelIDKey:duration:context:", v20, CFSTR("modelID"), v14, 3600.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      goto LABEL_7;
    context = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "destinationEntity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to gather modelIDs for recently deleted %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(context);
  }
  v21 = 0;
LABEL_7:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v55 = 1;
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke_15;
  v44[3] = &unk_24E778528;
  v25 = v17;
  v45 = v25;
  v26 = v21;
  v46 = v26;
  v47 = self;
  v27 = v12;
  v48 = v27;
  v28 = v14;
  v49 = v28;
  v29 = v11;
  v50 = v29;
  v51 = buf;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v44);
  v30 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    objc_msgSend(v15, "workingStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke_17;
    v40[3] = &unk_24E778550;
    v32 = v31;
    v41 = v32;
    v42 = v28;
    v43 = self;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v40);

  }
  _Block_object_dispose(buf, 8);

  return v30 != 0;
}

- (int64_t)ensureCanonicalModel
{
  int64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  MKFCKHome *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v25;
  void *context;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  MKFCKHome *v34;
  uint64_t *v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  objc_super v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  MKFCKHome *v45;
  __int16 v46;
  void *v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)MKFCKHome;
  v3 = -[MKFCKModel ensureCanonicalModel](&v41, sel_ensureCanonicalModel);
  if (v3 == 1)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v4 = (void *)MEMORY[0x227676638]();
    v5 = CFSTR("HMD.CFU");
    objc_msgSend(MEMORY[0x24BDBB728], "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "propertiesByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("author"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKFCKHome entity](self, "entity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:](HMDCoreDataCloudTransform, "localTransformableEntityFromEntity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v31, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("(%K == %@)"), v11, CFSTR("HMD.CFU"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setPredicate:", v30);
    -[MKFCKHome managedObjectContext](self, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryWithFetchRequest:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmd_coreData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "workingStore");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v48[0] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAffectedStores:", v15);

    objc_msgSend(v13, "setFetchBatchSize:", 20);
    objc_msgSend(v13, "setResultType:", 5);
    v36 = 0;
    objc_msgSend(v12, "executeRequest:error:", v13, &v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v36;
    objc_msgSend(v16, "result");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __33__MKFCKHome_ensureCanonicalModel__block_invoke;
    v32[3] = &unk_24E778578;
    v18 = v9;
    v33 = v18;
    v34 = self;
    v35 = &v37;
    v19 = objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);
    if (*((_BYTE *)v38 + 24))
    {
      context = (void *)MEMORY[0x227676638](v19);
      v20 = self;
      HMFGetOSLogHandle();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v4;
        HMFGetLogIdentifier();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        -[MKFCKModel debugDescription](v20, "debugDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v22;
        v44 = 2112;
        v45 = v20;
        v46 = 2112;
        v47 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Re-doing delete of record since it is locally deleted by the user: %@\n%@", buf, 0x20u);

        v4 = v25;
      }

      objc_autoreleasePoolPop(context);
      objc_msgSend(v12, "deleteObject:", v20);
      v3 = -2;
    }
    else
    {
      v3 = 1;
    }

    objc_autoreleasePoolPop(v4);
    _Block_object_dispose(&v37, 8);
  }
  return v3;
}

void __33__MKFCKHome_ensureCanonicalModel__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  objc_msgSend(a2, "changes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__MKFCKHome_ensureCanonicalModel__block_invoke_2;
  v7[3] = &unk_24E77D330;
  v8 = *(id *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

void __33__MKFCKHome_ensureCanonicalModel__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "changedObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isKindOfEntity:", *(_QWORD *)(a1 + 32));

  if (v8 && objc_msgSend(v13, "changeType") == 2)
  {
    objc_msgSend(v13, "tombstone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("modelID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "modelID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }

  }
}

void __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "modelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke_15(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v6);
    v8 = (void *)v7;
    goto LABEL_3;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6))
  {
    objc_msgSend(v5, "entity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = +[HMDCoreDataCloudTransform exportTransformableClassFromEntity:](HMDCoreDataCloudTransform, "exportTransformableClassFromEntity:", v32);

    -[objc_class createWithLocalModel:context:](v33, "createWithLocalModel:context:", v5, *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v8, "setHome:", *(_QWORD *)(a1 + 48));
LABEL_3:
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "exportFromLocalModel:updatedProperties:context:", v5, v9, *(_QWORD *)(a1 + 64));

    if ((v10 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      *a3 = 1;
LABEL_30:

      goto LABEL_31;
    }
    if (v7)
    {
      v11 = objc_msgSend(v8, "hasPersistentChangedValues");
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v11)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v45;
          v49 = 2112;
          v50 = v8;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during export: %@", buf, 0x16u);

        }
        goto LABEL_29;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "changedValues");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v16;
        v49 = 2112;
        v50 = v8;
        v51 = 2114;
        v52 = (uint64_t)v18;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during export: %@ (%{public}@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "debugDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v22;
        v49 = 2112;
        v50 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v12 = (void *)MEMORY[0x227676638]();
      v24 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
LABEL_25:

LABEL_29:
        objc_autoreleasePoolPop(v12);
        goto LABEL_30;
      }
    }
    else
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v37;
        v49 = 2112;
        v50 = v8;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during export: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v38 = (void *)MEMORY[0x227676638]();
      v39 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "debugDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v41;
        v49 = 2112;
        v50 = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      v12 = (void *)MEMORY[0x227676638]();
      v24 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        goto LABEL_25;
    }
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v43;
    v49 = 2112;
    v50 = v44;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    goto LABEL_25;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "entity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v48 = v29;
    v49 = 2114;
    v50 = v31;
    v51 = 2160;
    v52 = 1752392040;
    v53 = 2112;
    v54 = v6;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not recreating deleted model <%{public}@: %{mask.hash}@>", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v26);
LABEL_31:

}

void __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke_17(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:](HMDCoreDataCloudTransform, "localTransformableEntityFromEntity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(a1[4], "hmd_modelWasDeletedWithID:modelIDKey:entity:duration:context:", v5, CFSTR("modelID"), v8, a1[5], 0.0);
  v10 = (void *)MEMORY[0x227676638]();
  v11 = a1[6];
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v14;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Deleting model during export: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = objc_msgSend(a1[5], "deleteObject:", v6);
  }
  else
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Not deleting model during export - not previously deleted: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  v17 = (void *)MEMORY[0x227676638](v15);
  v18 = a1[6];
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v20;
    v24 = 2112;
    v25 = v21;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@%@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v17);

}

void __61__MKFCKHome__maybeDeleteStaleLocalModels_modelIDKey_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCoreDataCloudTransform exportTransformableEntityFromEntity:](HMDCoreDataCloudTransform, "exportTransformableEntityFromEntity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(a1 + 32), "hmd_modelWasDeletedWithID:modelIDKey:entity:duration:context:", v5, *(_QWORD *)(a1 + 40), v8, *(_QWORD *)(a1 + 48), 0.0);
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v14;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Deleting model during import: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v6);
  }
  else
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Not deleting model during import - not previously deleted: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  v17 = (void *)MEMORY[0x227676638](v15);
  v18 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v20;
    v24 = 2112;
    v25 = v21;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@%@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v17);

}

void __78__MKFCKHome__importRelationshipsIntoLocalModel_localRelationshipName_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "modelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

- (BOOL)_importIntoLocalHomeModel:(void *)a3 cloudModels:(void *)a4 localModelsByModelID:(void *)a5 processedCloudModels:(void *)a6 context:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _BOOL8 v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (a1)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 1;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __101__MKFCKHome__importIntoLocalHomeModel_cloudModels_localModelsByModelID_processedCloudModels_context___block_invoke;
    v18[3] = &unk_24E778500;
    v19 = v15;
    v20 = a1;
    v21 = v14;
    v22 = v13;
    v23 = v11;
    v24 = &v25;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
    a1 = *((_BYTE *)v26 + 24) != 0;

    _Block_object_dispose(&v25, 8);
  }

  return a1;
}

void __78__MKFCKHome__importRelationshipsIntoLocalModel_localRelationshipName_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "modelID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

void __101__MKFCKHome__importIntoLocalHomeModel_cloudModels_localModelsByModelID_processedCloudModels_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_msgSend(v5, "isReadyToImportIntoLocalModelWithContext:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    objc_msgSend(v5, "modelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    if (objc_msgSend(v5, "isDeletedLocallyWithContext:", *(_QWORD *)(a1 + 32)))
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v10;
        v49 = 2112;
        v50 = v5;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Skip create/update since model is already deleted locally: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      goto LABEL_33;
    }
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (!v15)
    {
      objc_msgSend(v5, "createLocalModelWithContext:", *(_QWORD *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValue:forKey:", *(_QWORD *)(a1 + 64), CFSTR("home"));
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v5, "importIntoLocalModel:updatedProperties:context:", v16, v17, *(_QWORD *)(a1 + 32));

    if ((v18 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      *a3 = 1;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    if (v15)
    {
      v19 = objc_msgSend(v16, "hasPersistentChangedValues");
      v20 = (void *)MEMORY[0x227676638]();
      v21 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (!v19)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v45;
          v49 = 2112;
          v50 = v16;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during import: %@", buf, 0x16u);

        }
        goto LABEL_31;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "changedValues");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "allKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sortedArrayUsingSelector:", sel_compare_);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v24;
        v49 = 2112;
        v50 = v16;
        v51 = 2114;
        v52 = v26;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during import: %@ (%{public}@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      v27 = (void *)MEMORY[0x227676638]();
      v28 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "debugDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v30;
        v49 = 2112;
        v50 = v31;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      v20 = (void *)MEMORY[0x227676638]();
      v32 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
LABEL_27:

LABEL_31:
        objc_autoreleasePoolPop(v20);
        goto LABEL_32;
      }
    }
    else
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v37;
        v49 = 2112;
        v50 = v16;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v38 = (void *)MEMORY[0x227676638]();
      v39 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "debugDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v41;
        v49 = 2112;
        v50 = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      v20 = (void *)MEMORY[0x227676638]();
      v32 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        goto LABEL_27;
    }
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v43;
    v49 = 2112;
    v50 = v44;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    goto LABEL_27;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v14;
    v49 = 2112;
    v50 = v5;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping import into local model because cloud model is not ready: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
LABEL_34:

}

+ (unint64_t)cloudStoreTypes
{
  return 1;
}

+ (id)rootKeyPath
{
  return 0;
}

+ (id)createWithModelID:(id)a3 persistentStore:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v8);
  objc_msgSend(v8, "assignObject:toPersistentStore:", v11, v9);

  objc_msgSend(v11, "setModelID:", v10);
  return v11;
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  +[MKFCKModel modelWithObjectID:context:error:](MKFCKHome, "modelWithObjectID:context:error:", v8, v10, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  if (!v11
    || (objc_msgSend(v11, "owner"), (v13 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v14 = (void *)v13,
        objc_msgSend(v11, "defaultRoom"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MKFCKHome _importWithContext:updatedProperties:]((uint64_t)v11, v10, v16);

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v21;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Skip import cloud model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 1;
  }

  return v17;
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v13;

  v13 = 0;
  v8 = a6;
  v9 = a4;
  +[MKFCKModel modelWithObjectID:context:error:](MKFCKHome, "modelWithObjectID:context:error:", a3, v8, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MKFCKHome _importWithContext:updatedProperties:]((uint64_t)v10, v8, v9);

  return v11;
}

+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v33 = 0;
    +[_MKFModel modelWithModelID:context:error:](_MKFHome, "modelWithModelID:context:error:", v11, v13, &v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v33;
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v13, "deleteObject:", v14);
      objc_msgSend((id)objc_opt_class(), "_homeManagerContextFromContext:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __72__MKFCKHome_importDeleteWithObjectID_modelID_additionalUpdates_context___block_invoke;
      v29[3] = &unk_24E796490;
      v30 = v17;
      v32 = a1;
      v31 = v11;
      v18 = v17;
      objc_msgSend(v18, "performBlockAndWait:", v29);

    }
    else if (v15)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v27;
        v36 = 2114;
        v37 = v16;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local model: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      v19 = 0;
      goto LABEL_12;
    }
    v19 = 1;
LABEL_12:

    goto LABEL_13;
  }
  v20 = (void *)MEMORY[0x227676638]();
  v21 = a1;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v23;
    v36 = 2114;
    v37 = v10;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Can't process import delete for %{public}@ without a modelID", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  v19 = 1;
LABEL_13:

  return v19;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  int v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectWithID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchWithLocalModel:context:", v11, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v16;
      v55 = 2112;
      v56 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unexpected existing cloud model during local insert: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = (void *)v12;
  }
  else
  {
    objc_msgSend(a1, "createWithLocalModel:context:", v11, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MKFCKHome _exportFromLocalModel:updatedProperties:context:](v17, v11, v18, v10);

  if (v19)
  {
    v52 = v9;
    if (v12)
    {
      v20 = objc_msgSend(v17, "hasPersistentChangedValues");
      v21 = (void *)MEMORY[0x227676638]();
      v22 = a1;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v20)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v51 = v21;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "changedValues");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "allKeys");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "sortedArrayUsingSelector:", sel_compare_);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v54 = v25;
          v55 = 2112;
          v56 = (uint64_t)v17;
          v57 = 2114;
          v58 = v27;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during export: %@ (%{public}@)", buf, 0x20u);

          v21 = v51;
        }

        objc_autoreleasePoolPop(v21);
        v28 = (void *)MEMORY[0x227676638]();
        v29 = v22;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "debugDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v31;
          v55 = 2112;
          v56 = (uint64_t)v32;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        v21 = (void *)MEMORY[0x227676638]();
        v22 = v29;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          goto LABEL_25;
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "debugDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v33;
        v55 = 2112;
        v56 = (uint64_t)v34;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

      }
      else
      {
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
LABEL_25:

          objc_autoreleasePoolPop(v21);
          v9 = v52;
          goto LABEL_26;
        }
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v33;
        v55 = 2112;
        v56 = (uint64_t)v17;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during export: %@", buf, 0x16u);
      }

      goto LABEL_25;
    }
    v35 = (void *)MEMORY[0x227676638]();
    v36 = a1;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v38;
      v55 = 2112;
      v56 = (uint64_t)v17;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during export: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v39 = (void *)MEMORY[0x227676638]();
    v40 = v36;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "debugDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v42;
      v55 = 2112;
      v56 = (uint64_t)v43;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

      v9 = v52;
    }

    objc_autoreleasePoolPop(v39);
    v44 = (void *)MEMORY[0x227676638]();
    v45 = v40;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "debugDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v47;
      v55 = 2112;
      v56 = (uint64_t)v48;
      _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

      v9 = v52;
    }

    objc_autoreleasePoolPop(v44);
    objc_msgSend(v45, "_rebalanceFakeHomesWithContext:", v10);
  }
LABEL_26:

  return v19;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  BOOL v34;
  void *v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "objectWithID:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MKFPropertyNamesFromDescriptions(v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchWithLocalModel:context:", v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    v38 = v15;
    v19 = (void *)MEMORY[0x227676638]();
    v32 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v33;
      v41 = 2112;
      v42 = v14;
      v43 = 2114;
      v44 = v38;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Local model updated but no cloud model exists: %@ (%{public}@)", buf, 0x20u);

    }
    goto LABEL_17;
  }
  if (-[MKFCKHome _exportFromLocalModel:updatedProperties:context:](v16, v14, v11, v13))
  {
    v37 = v12;
    v38 = v15;
    v18 = objc_msgSend(v17, "hasPersistentChangedValues");
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v23;
        v41 = 2112;
        v42 = v17;
        v43 = 2114;
        v44 = v38;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during export: %@ (%{public}@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v20;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "debugDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v27;
        v41 = 2112;
        v42 = v28;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

        v24 = v36;
      }

      objc_autoreleasePoolPop(v24);
      v19 = (void *)MEMORY[0x227676638]();
      v29 = v25;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "debugDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v30;
      v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    }
    else
    {
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:
        v12 = v37;
LABEL_17:

        objc_autoreleasePoolPop(v19);
        v34 = 1;
        v15 = v38;
        goto LABEL_18;
      }
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v30;
      v41 = 2112;
      v42 = v17;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during export: %@", buf, 0x16u);
    }

    goto LABEL_16;
  }
  v34 = 0;
LABEL_18:

  return v34;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v26 = 0;
    +[MKFCKModel modelWithModelID:context:error:](MKFCKHome, "modelWithModelID:context:error:", v11, v13, &v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v26;
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v13, "deleteObject:", v14);
      objc_msgSend(a1, "_rebalanceFakeHomesWithContext:", v13);
    }
    else if (v15)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = a1;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v24;
        v29 = 2114;
        v30 = v16;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud model: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v20;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Can't process export delete for %{public}@ without a modelID", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

  return 1;
}

+ (id)createWithLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_coreData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudPrivateStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "modelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createWithModelID:persistentStore:context:", v10, v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_exportFromLocalModel:(void *)a3 updatedProperties:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (objc_msgSend(a1, "copyPropertiesFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportResidentsFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportRoomsFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportZonesFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportAccessoriesFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportApplicationDataFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportMatterKeyValueStoreFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportUsersFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportGuestsFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportScenesFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportSettingsFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportServiceGroupsFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportTriggersFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportPersonsFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportInvitationOutgoingFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportNetworkProtectionGroupsFromLocalModel:context:", v7, v9)
      && objc_msgSend(a1, "_exportPinCodesFromLocalModel:context:", v7, v9))
    {
      a1 = (void *)objc_msgSend(a1, "_exportHomeManagerWithContext:", v9);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __72__MKFCKHome_importDeleteWithObjectID_modelID_additionalUpdates_context___block_invoke(id *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  id v18;
  uint8_t v19[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v18 = 0;
  +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:", v2, &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  if (v3)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__23012;
    v27 = __Block_byref_object_dispose__23013;
    v28 = 0;
    objc_msgSend(v3, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __72__MKFCKHome_importDeleteWithObjectID_modelID_additionalUpdates_context___block_invoke_21;
    v15[3] = &unk_24E787B80;
    v16 = a1[5];
    v17 = buf;
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_msgSend(v3, "removeHomes_Object:");
      objc_msgSend(a1[4], "deleteObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1[6];
      HMFGetOSLogHandle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = a1[5];
        *(_DWORD *)v19 = 138543874;
        v20 = v13;
        v21 = 2160;
        v22 = 1752392040;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Couldn't find home manager home to delete with modelID %{mask.hash}@", v19, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1[6];
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __72__MKFCKHome_importDeleteWithObjectID_modelID_additionalUpdates_context___block_invoke_21(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (uint64_t)_importWithContext:(void *)a3 updatedProperties:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_27;
  if (!objc_msgSend((id)a1, "isDeletedLocallyWithContext:", v5))
  {
    objc_msgSend((id)a1, "fetchLocalModelWithContext:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      if ((-[MKFCKHome _importIntoLocalModel:updatedProperties:context:]((void *)a1, v11, v6, v5) & 1) != 0)
      {
        v13 = objc_msgSend(v12, "hasPersistentChangedValues");
        v14 = (void *)MEMORY[0x227676638]();
        v15 = (id)a1;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v38;
            v43 = 2112;
            v44 = v12;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during import: %@", buf, 0x16u);

          }
          goto LABEL_25;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "changedValues");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "allKeys");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sortedArrayUsingSelector:", sel_compare_);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v18;
          v43 = 2112;
          v44 = v12;
          v45 = 2114;
          v46 = v20;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during import: %@ (%{public}@)", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v14);
        v21 = (void *)MEMORY[0x227676638]();
        v22 = v15;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "debugDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v24;
          v43 = 2112;
          v44 = v25;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        v14 = (void *)MEMORY[0x227676638]();
        v26 = v22;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
LABEL_25:

          objc_autoreleasePoolPop(v14);
          a1 = 1;
          goto LABEL_26;
        }
LABEL_21:
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "debugDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v36;
        v43 = 2112;
        v44 = v37;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

        goto LABEL_25;
      }
    }
    else
    {
      objc_msgSend((id)a1, "createLocalModelWithContext:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOwned:", MEMORY[0x24BDBD1C8]);
      if ((-[MKFCKHome _importIntoLocalModel:updatedProperties:context:]((void *)a1, v12, v6, v5) & 1) != 0)
      {
        v27 = (void *)MEMORY[0x227676638]();
        v28 = (id)a1;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v30;
          v43 = 2112;
          v44 = v12;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        v31 = (void *)MEMORY[0x227676638]();
        v32 = v28;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "debugDescription");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v34;
          v43 = 2112;
          v44 = v35;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        v14 = (void *)MEMORY[0x227676638]();
        v26 = v32;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          goto LABEL_25;
        goto LABEL_21;
      }
    }
    a1 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v7 = (void *)MEMORY[0x227676638]();
  v8 = (id)a1;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v10;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Skip import processing since home model is already deleted locally: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  a1 = 1;
LABEL_27:

  return a1;
}

- (uint64_t)_importIntoLocalModel:(void *)a3 updatedProperties:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(a1, "copyPropertiesIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importResidentsIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importRoomsIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importZonesIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importAccessoriesIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importApplicationDataIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importMatterKeyValueStoreIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importUsersIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importGuestsIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importScenesIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importSettingsIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importServiceGroupsIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importTriggersIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importPersonsIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importInvitationOutgoingIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importNetworkProtectionGroupsIntoLocalModel:context:", v7, v9)
    && objc_msgSend(a1, "_importPinCodesIntoLocalModel:context:", v7, v9))
  {
    v10 = objc_msgSend(a1, "_importHomeManagerWithContext:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)validateOwner:(id *)a3 error:(id *)a4
{
  BOOL v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  MKFCKHome *v14;
  NSObject *v15;
  void *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  MKFCKHome *v21;
  const __CFString *v22;
  int v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!-[MKFCKModel shouldSkipValidationDuringImport](self, "shouldSkipValidationDuringImport"))
  {
    v8 = *a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      -[MKFCKHome users](self, "users");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v10);

      if ((v12 & 1) != 0)
      {
        v7 = 1;
LABEL_15:

        return v7;
      }
      v13 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (const __CFString *)*a3;
        v24 = 138543618;
        v25 = v16;
        v26 = 2112;
        v27 = v22;
        v18 = "%{public}@Owner missing from users: %@";
        v19 = v15;
        v20 = 22;
        goto LABEL_13;
      }
    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *a3;
        v24 = 138543874;
        v25 = v16;
        v26 = 2114;
        v27 = CFSTR("owner");
        v28 = 2112;
        v29 = v17;
        v18 = "%{public}@Invalid value for %{public}@: %@";
        v19 = v15;
        v20 = 32;
LABEL_13:
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v24, v20);

      }
    }

    objc_autoreleasePoolPop(v13);
    objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, CFSTR("owner"));
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  return 1;
}

- (BOOL)_importNetworkProtectionGroupsIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  objc_msgSend(v6, "networkProtectionGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke;
  v33[3] = &unk_24E7794A0;
  v12 = v9;
  v34 = v12;
  v13 = v10;
  v35 = v13;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);

  -[MKFCKHome networkProtectionGroups](self, "networkProtectionGroups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke_2;
  v28[3] = &unk_24E7794C8;
  v28[4] = self;
  v29 = v6;
  v15 = v12;
  v30 = v15;
  v16 = v7;
  v31 = v16;
  v32 = v13;
  v17 = v13;
  v18 = v6;
  objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);

  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke_3;
  v25[3] = &unk_24E77FFA0;
  v26 = v15;
  v27 = v16;
  v19 = v16;
  v20 = v15;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);
  v21 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v20, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNetworkProtectionGroups_:", v23);

  return 1;
}

- (BOOL)_exportNetworkProtectionGroupsFromLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  MKFCKHome *v19;
  NSObject *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, _BYTE *);
  void *v26;
  MKFCKHome *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  objc_msgSend(v6, "networkProtectionGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __91__MKFCKHome_NetworkProtectionGroups___exportNetworkProtectionGroupsFromLocalModel_context___block_invoke;
  v26 = &unk_24E7794F0;
  v27 = self;
  v10 = v7;
  v28 = v10;
  v30 = &v31;
  v11 = v9;
  v29 = v11;
  v12 = objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v23);
  if (*((_BYTE *)v32 + 24))
  {
    objc_msgSend(v11, "allKeys", v23, v24, v25, v26, v27, v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectsForKeys:notFoundMarker:", v14, MEMORY[0x24BDBD1B8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKHome networkProtectionGroups](self, "networkProtectionGroups");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

    if ((v17 & 1) == 0)
      -[MKFCKHome setNetworkProtectionGroups:](self, "setNetworkProtectionGroups:", v15);

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638](v12);
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to encode network protection groups so leaving unchanged", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
  }

  _Block_object_dispose(&v31, 8);
  return 1;
}

void __91__MKFCKHome_NetworkProtectionGroups___exportNetworkProtectionGroupsFromLocalModel_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a2;
  objc_msgSend(v5, "modelID");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)(a1 + 32))
  {

    goto LABEL_5;
  }
  v6 = v5;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manufacturer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "category");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetProtectionMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_encodeNetworkProtectionGroupModelID:manufacturer:category:targetProtectionMode:", v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_5:
    v12 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a3 = 1;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v12, v13);
LABEL_6:

}

void __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "modelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

void __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  _MKFAccessoryNetworkProtectionGroup *contextc;
  void *context;
  void *contexta;
  void *contextb;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v7 = a2;
  v8 = v3;
  v9 = v5;
  v10 = v6;
  if (v4)
  {
    objc_msgSend(v7, "hmf_UUIDForKey:", CFSTR("i"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "hmf_stringForKey:", CFSTR("m"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v7, "hmf_numberForKey:", CFSTR("c"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v46 = v8;
          objc_msgSend(v7, "hmf_numberForKey:", CFSTR("p"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              contextc = -[_MKFAccessoryNetworkProtectionGroup initWithContext:]([_MKFAccessoryNetworkProtectionGroup alloc], "initWithContext:", v10);
              -[_MKFAccessoryNetworkProtectionGroup setModelID:](contextc, "setModelID:", v11);
              -[_MKFAccessoryNetworkProtectionGroup setHome:](contextc, "setHome:", v46);
              objc_msgSend(v4, "writerTimestamp");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MKFAccessoryNetworkProtectionGroup setWriterTimestamp:](contextc, "setWriterTimestamp:", v16);

              v15 = contextc;
            }
            context = v15;
            objc_msgSend(v15, "manufacturer");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = HMFEqualObjects();

            if ((v18 & 1) == 0)
              objc_msgSend(context, "setManufacturer:", v12);
            objc_msgSend(context, "category");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = HMFEqualObjects();

            if ((v20 & 1) == 0)
              objc_msgSend(context, "setCategory:", v13);
            objc_msgSend(context, "targetProtectionMode");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = HMFEqualObjects();

            if ((v22 & 1) == 0)
              objc_msgSend(context, "setTargetProtectionMode:", v14);
          }
          else
          {
            contextb = (void *)MEMORY[0x227676638]();
            v41 = v4;
            HMFGetOSLogHandle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = v45;
              v55 = 2112;
              v56 = v7;
              _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Invalid protection mode for network protection group dictionary: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(contextb);
            context = 0;
          }

          v8 = v46;
        }
        else
        {
          contexta = (void *)MEMORY[0x227676638]();
          v36 = v4;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v48 = v9;
            v38 = v10;
            v39 = v8;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v40;
            v55 = 2112;
            v56 = v7;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Invalid category for network protection group dictionary: %@", buf, 0x16u);

            v8 = v39;
            v10 = v38;
            v9 = v48;
          }

          objc_autoreleasePoolPop(contexta);
          context = 0;
        }

      }
      else
      {
        v47 = v9;
        v30 = v10;
        v31 = v8;
        v32 = (void *)MEMORY[0x227676638]();
        v33 = v4;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v35;
          v55 = 2112;
          v56 = v7;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Invalid manufacturer for network protection group dictionary: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        context = 0;
        v8 = v31;
        v10 = v30;
        v9 = v47;
      }

    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v4;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = v9;
        v27 = v10;
        v28 = v8;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v29;
        v55 = 2112;
        v56 = v7;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Invalid modelID for network protection group dictionary: %@", buf, 0x16u);

        v8 = v28;
        v10 = v27;
        v9 = v26;
      }

      objc_autoreleasePoolPop(v23);
      context = 0;
    }

  }
  else
  {
    context = 0;
  }

  v43 = context;
  if (context)
  {
    objc_msgSend(context, "modelID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", context, v44);
    objc_msgSend(*(id *)(a1 + 64), "removeObject:", v44);

    v43 = context;
  }

}

void __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v4);
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v3);
  }

}

+ (id)_encodeNetworkProtectionGroupModelID:(id)a3 manufacturer:(id)a4 category:(id)a5 targetProtectionMode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[4];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v13, "integerValue");
    v21[0] = CFSTR("i");
    v21[1] = CFSTR("m");
    v22[0] = v10;
    v22[1] = v11;
    v21[2] = CFSTR("c");
    v21[3] = CFSTR("p");
    v14 = &unk_24E96A808;
    if (v12)
      v14 = v12;
    v22[2] = v14;
    v22[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Not going to export network protection group model with nil manufacturer", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (BOOL)_importSettingsIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _MKFHomeMediaSetting *v11;
  id v12;
  void *v13;
  _MKFHomeMediaSetting *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  _MKFHomeNetworkRouterSetting *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  void *v40;
  MKFCKHome *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  MKFCKHome *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  id v58;
  _MKFHomePersonManagerSetting *v59;
  id v60;
  void *v61;
  _MKFHomePersonManagerSetting *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  id v69;
  _MKFHomeSoftwareUpdateSetting *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  void *v79;
  char v80;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  _MKFHomeMediaSetting *v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  uint64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v92 = 0;
  v93 = 0;
  v90 = 0;
  v91 = 0;
  v6 = a4;
  v7 = a3;
  -[MKFCKHome _settingModelsForHome:media:networkRouter:personManager:softwareUpdate:]((uint64_t)self, v7, &v93, &v92, &v91, &v90);
  v8 = v93;
  v9 = v92;
  v86 = v91;
  v87 = v90;
  v10 = v7;
  v11 = (_MKFHomeMediaSetting *)v8;
  v12 = v6;
  v13 = v12;
  v88 = v11;
  v89 = v9;
  if (!self)
  {

    v82 = v10;
    v29 = (_MKFHomeNetworkRouterSetting *)v9;
    v83 = v13;
    goto LABEL_31;
  }
  v14 = v11;
  if (!v11)
  {
    v14 = -[_MKFHomeMediaSetting initWithContext:]([_MKFHomeMediaSetting alloc], "initWithContext:", v12, v86);
    objc_msgSend(v10, "modelID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeMediaSettingsModel modelIDForHomeUUID:](HMDHomeMediaSettingsModel, "modelIDForHomeUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeMediaSetting setModelID:](v14, "setModelID:", v16);

    -[MKFCKHome writerTimestamp](self, "writerTimestamp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeMediaSetting setWriterTimestamp:](v14, "setWriterTimestamp:", v17);

    -[_MKFHomeMediaSetting setHome:](v14, "setHome:", v10);
  }
  -[_MKFHomeMediaSetting mediaPassword](v14, "mediaPassword", v86);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKHome mediaPassword](self, "mediaPassword");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = HMFEqualObjects();

  if ((v20 & 1) == 0)
  {
    -[MKFCKHome mediaPassword](self, "mediaPassword");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeMediaSetting setMediaPassword:](v14, "setMediaPassword:", v21);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKHome mediaPeerToPeerEnabled](self, "mediaPeerToPeerEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHomeMediaSetting mediaPeerToPeerEnabled](v14, "mediaPeerToPeerEnabled");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = HMFEqualObjects();

  if ((v24 & 1) == 0)
    -[_MKFHomeMediaSetting setMediaPeerToPeerEnabled:](v14, "setMediaPeerToPeerEnabled:", v22);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[MKFCKHome mediaMinimumUserPrivilege](self, "mediaMinimumUserPrivilege"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHomeMediaSetting minimumMediaUserPrivilege](v14, "minimumMediaUserPrivilege");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = HMFEqualObjects();

  if ((v27 & 1) == 0)
    -[_MKFHomeMediaSetting setMinimumMediaUserPrivilege:](v14, "setMinimumMediaUserPrivilege:", v25);

  v28 = v10;
  v29 = (_MKFHomeNetworkRouterSetting *)v9;
  v30 = v13;
  if (!v29)
  {
    v29 = -[_MKFHomeNetworkRouterSetting initWithContext:]([_MKFHomeNetworkRouterSetting alloc], "initWithContext:", v30);
    objc_msgSend(v28, "modelID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeNetworkRouterSettingsModel modelIDForHomeUUID:](HMDHomeNetworkRouterSettingsModel, "modelIDForHomeUUID:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeNetworkRouterSetting setModelID:](v29, "setModelID:", v32);

    -[MKFCKHome writerTimestamp](self, "writerTimestamp");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeNetworkRouterSetting setWriterTimestamp:](v29, "setWriterTimestamp:", v33);

    -[_MKFHomeNetworkRouterSetting setHome:](v29, "setHome:", v28);
  }
  -[MKFCKHome activeNetworkRouter](self, "activeNetworkRouter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHomeNetworkRouterSetting networkAccessory](v29, "networkAccessory");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "modelID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "modelID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = HMFEqualObjects();

  if ((v38 & 1) == 0)
  {
    if (v34)
    {
      objc_msgSend(v34, "fetchLocalModelWithContext:", v30);
      v39 = objc_claimAutoreleasedReturnValue();

      v40 = (void *)MEMORY[0x227676638]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v39)
      {
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v95 = v44;
          v96 = 2112;
          v97 = v39;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Assigning new active network router: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);
        goto LABEL_25;
      }
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v95 = v49;
        v96 = 2112;
        v97 = (uint64_t)v34;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to find local network router matching cloud: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
    }
    else
    {
      v45 = (void *)MEMORY[0x227676638]();
      v46 = self;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v95 = v48;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Removing active network router", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v45);

    }
    v39 = 0;
LABEL_25:
    -[_MKFHomeNetworkRouterSetting setNetworkAccessory:](v29, "setNetworkAccessory:", v39);
    v35 = (void *)v39;
  }
  -[MKFCKHome minimumHomeKitVersionForNetworkRouterSupport](self, "minimumHomeKitVersionForNetworkRouterSupport");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "versionString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MKFHomeNetworkRouterSetting minimumNetworkRouterSupportHomeKitVersion](v29, "minimumNetworkRouterSupportHomeKitVersion");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = HMFEqualObjects();

  if ((v53 & 1) == 0)
    -[_MKFHomeNetworkRouterSetting setMinimumNetworkRouterSupportHomeKitVersion:](v29, "setMinimumNetworkRouterSupportHomeKitVersion:", v51);
  -[MKFCKHome minimumHomeKitVersionForAccessoryNetworkProtectionChanges](self, "minimumHomeKitVersionForAccessoryNetworkProtectionChanges");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "versionString");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MKFHomeNetworkRouterSetting minHomeKitVersionForAccessoryNetworkProtectionChange](v29, "minHomeKitVersionForAccessoryNetworkProtectionChange");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = HMFEqualObjects();

  if ((v57 & 1) == 0)
    -[_MKFHomeNetworkRouterSetting setMinHomeKitVersionForAccessoryNetworkProtectionChange:](v29, "setMinHomeKitVersionForAccessoryNetworkProtectionChange:", v55);

LABEL_31:
  v58 = v10;
  v59 = (_MKFHomePersonManagerSetting *)v86;
  v60 = v13;
  v61 = v60;
  if (self)
  {
    v62 = v59;
    if (!v59)
    {
      v62 = -[_MKFHomePersonManagerSetting initWithContext:]([_MKFHomePersonManagerSetting alloc], "initWithContext:", v60);
      objc_msgSend(v58, "modelID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHomePersonManagerSettingsModel modelIDForHomeUUID:](HMDHomePersonManagerSettingsModel, "modelIDForHomeUUID:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFHomePersonManagerSetting setModelID:](v62, "setModelID:", v64);

      -[MKFCKHome writerTimestamp](self, "writerTimestamp");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFHomePersonManagerSetting setWriterTimestamp:](v62, "setWriterTimestamp:", v65);

      -[_MKFHomePersonManagerSetting setHome:](v62, "setHome:", v58);
    }
    -[MKFCKHome personDataZoneUUID](self, "personDataZoneUUID", v86);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomePersonManagerSetting zoneUUID](v62, "zoneUUID");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = HMFEqualObjects();

    if ((v68 & 1) == 0)
      -[_MKFHomePersonManagerSetting setZoneUUID:](v62, "setZoneUUID:", v66);

    v69 = v58;
    v70 = (_MKFHomeSoftwareUpdateSetting *)v87;
    v71 = v61;
    if (!v70)
    {
      v70 = -[_MKFHomeSoftwareUpdateSetting initWithContext:]([_MKFHomeSoftwareUpdateSetting alloc], "initWithContext:", v71);
      objc_msgSend(v69, "modelID");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHomeSettingsModel modelIDForHomeUUID:](HMDHomeSettingsModel, "modelIDForHomeUUID:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFHomeSoftwareUpdateSetting setModelID:](v70, "setModelID:", v73);

      -[MKFCKHome writerTimestamp](self, "writerTimestamp");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFHomeSoftwareUpdateSetting setWriterTimestamp:](v70, "setWriterTimestamp:", v74);

      -[_MKFHomeSoftwareUpdateSetting setHome:](v70, "setHome:", v69);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKHome automaticSoftwareUpdateEnabled](self, "automaticSoftwareUpdateEnabled"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeSoftwareUpdateSetting automaticSoftwareUpdateEnabled](v70, "automaticSoftwareUpdateEnabled");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = HMFEqualObjects();

    if ((v77 & 1) == 0)
      -[_MKFHomeSoftwareUpdateSetting setAutomaticSoftwareUpdateEnabled:](v70, "setAutomaticSoftwareUpdateEnabled:", v75);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKHome automaticThirdPartyAccessorySoftwareUpdateEnabled](self, "automaticThirdPartyAccessorySoftwareUpdateEnabled"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeSoftwareUpdateSetting automaticThirdPartyAccessorySoftwareUpdateEnabled](v70, "automaticThirdPartyAccessorySoftwareUpdateEnabled");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = HMFEqualObjects();

    if ((v80 & 1) == 0)
      -[_MKFHomeSoftwareUpdateSetting setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:](v70, "setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", v78);

  }
  else
  {

    v84 = v58;
    v70 = (_MKFHomeSoftwareUpdateSetting *)v87;
    v85 = v61;
  }

  return 1;
}

- (BOOL)_exportSettingsFromLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  MKFCKHome *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  char v42;
  HMDHomeKitVersion *v43;
  void *v44;
  void *v45;
  char v46;
  HMDHomeKitVersion *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v82 = 0;
  v83 = 0;
  v80 = 0;
  v81 = 0;
  v6 = a4;
  v7 = a3;
  -[MKFCKHome _settingModelsForHome:media:networkRouter:personManager:softwareUpdate:]((uint64_t)self, v7, &v83, &v82, &v81, &v80);
  v8 = v83;
  v9 = v82;
  v77 = v81;
  v79 = v80;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  v13 = v12;
  v78 = v11;
  v76 = v10;
  if (!self)
  {

    v69 = v10;
    v70 = v9;
    v71 = v13;
    goto LABEL_27;
  }
  if (v11)
  {
    objc_msgSend(v11, "mediaPassword");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaPeerToPeerEnabled");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v11, "minimumMediaUserPrivilege");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");
  }
  else
  {
    -[MKFCKHome entity](self, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "attributesByName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("mediaPeerToPeerEnabled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "defaultValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("mediaMinimumUserPrivilege"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v23, "unsignedIntegerValue");

    v14 = 0;
  }

  -[MKFCKHome mediaPassword](self, "mediaPassword");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = HMFEqualObjects();

  if ((v25 & 1) == 0)
    -[MKFCKHome setMediaPassword:](self, "setMediaPassword:", v14);
  if ((_DWORD)v16 != -[MKFCKHome mediaPeerToPeerEnabled](self, "mediaPeerToPeerEnabled"))
    -[MKFCKHome setMediaPeerToPeerEnabled:](self, "setMediaPeerToPeerEnabled:", v16);
  if (-[MKFCKHome mediaMinimumUserPrivilege](self, "mediaMinimumUserPrivilege") != v18)
    -[MKFCKHome setMediaMinimumUserPrivilege:](self, "setMediaMinimumUserPrivilege:", v18);

  v26 = v10;
  v27 = v9;
  v28 = v13;
  if (!v27)
  {
    v36 = 0;
    v31 = 0;
    goto LABEL_20;
  }
  v29 = v28;
  objc_msgSend(v27, "networkAccessory");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
    goto LABEL_17;
  +[MKFCKHAPAccessory fetchWithLocalModel:context:](MKFCKHAPAccessory, "fetchWithLocalModel:context:", v30, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v75 = v32;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v85 = v35;
      v86 = 2112;
      v87 = v30;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to find cloud network router matching local: %@", buf, 0x16u);

      v32 = v75;
    }

    objc_autoreleasePoolPop(v32);
LABEL_17:
    v31 = 0;
  }
  objc_msgSend(v27, "minimumNetworkRouterSupportHomeKitVersion");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minHomeKitVersionForAccessoryNetworkProtectionChange");
  v27 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
  v37 = v9;
  -[MKFCKHome activeNetworkRouter](self, "activeNetworkRouter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = HMFEqualObjects();

  if ((v39 & 1) == 0)
    -[MKFCKHome setActiveNetworkRouter:](self, "setActiveNetworkRouter:", v31);
  -[MKFCKHome minimumHomeKitVersionForNetworkRouterSupport](self, "minimumHomeKitVersionForNetworkRouterSupport");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "versionString");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = HMFEqualObjects();

  if ((v42 & 1) == 0)
  {
    v43 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v36);
    -[MKFCKHome setMinimumHomeKitVersionForNetworkRouterSupport:](self, "setMinimumHomeKitVersionForNetworkRouterSupport:", v43);

  }
  -[MKFCKHome minimumHomeKitVersionForAccessoryNetworkProtectionChanges](self, "minimumHomeKitVersionForAccessoryNetworkProtectionChanges");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "versionString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = HMFEqualObjects();

  if ((v46 & 1) == 0)
  {
    v47 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v27);
    -[MKFCKHome setMinimumHomeKitVersionForAccessoryNetworkProtectionChanges:](self, "setMinimumHomeKitVersionForAccessoryNetworkProtectionChanges:", v47);

  }
  v9 = v37;
LABEL_27:

  v48 = v9;
  v49 = v76;
  v50 = v77;
  v51 = v13;
  v52 = v51;
  if (self)
  {
    -[MKFCKHome personDataZoneUUID](self, "personDataZoneUUID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "zoneUUID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = HMFEqualObjects();

    if ((v55 & 1) == 0)
    {
      objc_msgSend(v50, "zoneUUID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKHome setPersonDataZoneUUID:](self, "setPersonDataZoneUUID:", v56);

    }
    v57 = v49;
    v58 = v79;
    v59 = v79;
    v60 = v52;
    if (v59)
    {
      objc_msgSend(v59, "automaticSoftwareUpdateEnabled");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "BOOLValue");

      objc_msgSend(v59, "automaticThirdPartyAccessorySoftwareUpdateEnabled");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "BOOLValue");
    }
    else
    {
      -[MKFCKHome homeModelID](self, "homeModelID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHomeSettingsModel defaultModelForHomeUUID:](HMDHomeSettingsModel, "defaultModelForHomeUUID:", v65);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = v79;
      objc_msgSend(v63, "automaticSoftwareUpdateEnabled");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v66, "BOOLValue");

      objc_msgSend(v63, "automaticThirdPartyAccessorySoftwareUpdateEnabled");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v67, "BOOLValue");

    }
    if ((_DWORD)v62 != -[MKFCKHome automaticSoftwareUpdateEnabled](self, "automaticSoftwareUpdateEnabled"))-[MKFCKHome setAutomaticSoftwareUpdateEnabled:](self, "setAutomaticSoftwareUpdateEnabled:", v62);
    if ((_DWORD)v64 != -[MKFCKHome automaticThirdPartyAccessorySoftwareUpdateEnabled](self, "automaticThirdPartyAccessorySoftwareUpdateEnabled"))-[MKFCKHome setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:](self, "setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", v64);
  }
  else
  {

    v72 = v49;
    v58 = v79;
    v73 = v79;
    v74 = v52;
  }

  return 1;
}

- (void)_settingModelsForHome:(_QWORD *)a3 media:(_QWORD *)a4 networkRouter:(_QWORD *)a5 personManager:(_QWORD *)a6 softwareUpdate:
{
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v10 = a2;
  v11 = v10;
  if (a1)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__71801;
    v42 = __Block_byref_object_dispose__71802;
    v43 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__71801;
    v36 = __Block_byref_object_dispose__71802;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__71801;
    v30 = __Block_byref_object_dispose__71802;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__71801;
    v24 = __Block_byref_object_dispose__71802;
    v25 = 0;
    objc_msgSend(v10, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __94__MKFCKHome_Settings___settingModelsForHome_media_networkRouter_personManager_softwareUpdate___block_invoke;
    v14[3] = &unk_24E77F090;
    v17 = &v32;
    v18 = &v20;
    v19 = &v26;
    v16 = &v38;
    v14[4] = a1;
    v15 = v11;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

    *a3 = objc_retainAutorelease((id)v39[5]);
    *a4 = objc_retainAutorelease((id)v33[5]);
    *a5 = objc_retainAutorelease((id)v21[5]);
    *a6 = objc_retainAutorelease((id)v27[5]);

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);

  }
}

void __94__MKFCKHome_Settings___settingModelsForHome_media_networkRouter_personManager_softwareUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFHomeMediaSetting entity](_MKFHomeMediaSetting, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isKindOfEntity:", v6);

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 48);
LABEL_9:
    objc_storeStrong((id *)(*(_QWORD *)(v8 + 8) + 40), a2);
    goto LABEL_10;
  }
  +[_MKFHomeNetworkRouterSetting entity](_MKFHomeNetworkRouterSetting, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isKindOfEntity:", v9);

  if (v10)
  {
    v8 = *(_QWORD *)(a1 + 56);
    goto LABEL_9;
  }
  +[_MKFHomePersonManagerSetting entity](_MKFHomePersonManagerSetting, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "isKindOfEntity:", v11);

  if (v12)
  {
    v8 = *(_QWORD *)(a1 + 64);
    goto LABEL_9;
  }
  +[_MKFHomeSoftwareUpdateSetting entity](_MKFHomeSoftwareUpdateSetting, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "isKindOfEntity:", v13);

  if (v14)
  {
    v8 = *(_QWORD *)(a1 + 72);
    goto LABEL_9;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 40);
    v20 = 138543874;
    v21 = v18;
    v22 = 2112;
    v23 = v19;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Unhandled setting model for home %@: %@", (uint8_t *)&v20, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
LABEL_10:

}

- (BOOL)_importRoomsIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  MKFCKHome *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  MKFCKHome *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", v6, CFSTR("rooms_"), v7))
  {
    -[MKFCKHome defaultRoom](self, "defaultRoom");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v8 != 0;
    if (v8)
    {
      objc_msgSend(v8, "fetchLocalModelWithContext:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "defaultRoom");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543618;
          v23 = v16;
          v24 = 2112;
          v25 = v11;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Setting default room during import: %@", (uint8_t *)&v22, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        objc_msgSend(v6, "setDefaultRoom:", v11);
      }

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Can't assign default room during import because the record hasn't downloaded yet: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_exportRoomsFromLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MKFCKHome *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", v6, CFSTR("rooms_"), v7);
  if (v8)
  {
    objc_msgSend(v6, "defaultRoom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKHome defaultRoom](self, "defaultRoom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      +[MKFCKModel fetchWithLocalModel:context:](MKFCKRoom, "fetchWithLocalModel:context:", v9, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v15;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Setting default room during export: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      -[MKFCKHome setDefaultRoom:](v13, "setDefaultRoom:", v11);

    }
  }

  return v8;
}

- (BOOL)_importApplicationDataIntoLocalModel:(id)a3 context:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[MKFCKHome applicationData](self, "applicationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFApplicationData setAppDataDictionary:forContainer:](_MKFApplicationData, "setAppDataDictionary:forContainer:", v6, v5);

  return 1;
}

- (BOOL)_exportApplicationDataFromLocalModel:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  +[_MKFApplicationData appDataDictionaryForContainer:](_MKFApplicationData, "appDataDictionaryForContainer:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKHome applicationData](self, "applicationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
    -[MKFCKHome setApplicationData:](self, "setApplicationData:", v5);

  return 1;
}

- (BOOL)_importTriggersIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", a3, CFSTR("triggers_"), a4);
}

- (BOOL)_exportTriggersFromLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", a3, CFSTR("triggers_"), a4);
}

- (BOOL)_importScenesIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", a3, CFSTR("actionSets_"), a4);
}

- (BOOL)_exportScenesFromLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", a3, CFSTR("actionSets_"), a4);
}

- (BOOL)_importResidentsIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", a3, CFSTR("residents_"), a4);
}

- (BOOL)_exportResidentsFromLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", a3, CFSTR("residents_"), a4);
}

- (BOOL)_importMatterKeyValueStoreIntoLocalModel:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "matterKeyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKHome matterKeyValueStore](self, "matterKeyValueStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects();

  if ((v8 & 1) == 0)
  {
    -[MKFCKHome matterKeyValueStore](self, "matterKeyValueStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMatterKeyValueStore:", v9);

  }
  return 1;
}

- (BOOL)_exportMatterKeyValueStoreFromLocalModel:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "matterKeyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_opt_self();
        if ((objc_msgSend(v11, "hasPrefix:", CFSTR("HMDHMMKVS.")) & 1) != 0
          || (objc_msgSend(v11, "hasPrefix:", CFSTR("CHIPPluginStorageKey_")) & 1) != 0
          || (objc_msgSend(v11, "hasPrefix:", CFSTR("DeviceTopologyDict")) & 1) != 0
          || (objc_msgSend(v11, "hasPrefix:", CFSTR("f/")) & 1) != 0
          || (objc_msgSend(v11, "hasPrefix:", CFSTR("g/")) & 1) != 0
          || objc_msgSend(v11, "isEqualToString:", CFSTR("IPK")))
        {

LABEL_13:
          objc_msgSend(v4, "matterKeyValueStore");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

          goto LABEL_14;
        }
        v14 = objc_msgSend(v11, "hasPrefix:", CFSTR("HMD.MTRPlugin"));

        if (v14)
          goto LABEL_13;
LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v8 = v15;
    }
    while (v15);
  }

  -[MKFCKHome matterKeyValueStore](self, "matterKeyValueStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = HMFEqualObjects();

  if ((v17 & 1) == 0)
  {
    v18 = (void *)objc_msgSend(v5, "copy");
    -[MKFCKHome setMatterKeyValueStore:](self, "setMatterKeyValueStore:", v18);

  }
  return 1;
}

- (BOOL)_importZonesIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", a3, CFSTR("zones_"), a4);
}

- (BOOL)_exportZonesFromLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", a3, CFSTR("zones_"), a4);
}

- (BOOL)_importAccessoriesIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", a3, CFSTR("accessories_"), a4);
}

- (BOOL)_exportAccessoriesFromLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", a3, CFSTR("accessories_"), a4);
}

+ (void)_rebalanceFakeHomesWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (isInternalBuild() && (objc_msgSend(v4, "hmd_fakeRecordsEnabled") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Fake record injection disabled, this had better be a unit test!", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    objc_msgSend(a1, "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKModel defaultPreloadedProperties](MKFCKHome, "defaultPreloadedProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPropertiesToFetch:", v6);

    objc_msgSend(v5, "setFetchBatchSize:", 3);
    v17 = 0;
    objc_msgSend(v4, "executeFetchRequest:error:", v5, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (v7)
    {
      if (objc_msgSend(v7, "count"))
      {
        if ((unint64_t)objc_msgSend(v7, "count") > 3)
          objc_msgSend(a1, "_maybeDeleteFakeHomes:context:", v7, v4);
        else
          objc_msgSend(a1, "_maybeCreateFakeHomes:context:", v7, v4);
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v12;
        v20 = 2114;
        v21 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch other homes when balancing fake homes: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
}

+ (void)_maybeCreateFakeHomes:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  uint32_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  unint64_t i;
  id v25;
  NSObject *v26;
  void *v27;
  _BYTE v28[22];
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = v8;
  if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138543618;
      *(_QWORD *)&v28[4] = v13;
      *(_WORD *)&v28[12] = 2048;
      *(_QWORD *)&v28[14] = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not creating or deleting any fake homes as home count is within normal range: %lu", v28, 0x16u);

    }
LABEL_22:

    objc_autoreleasePoolPop(v10);
    goto LABEL_23;
  }
  if (v8 <= 2)
    v14 = 2 - v8;
  else
    v14 = 0;
  v15 = arc4random_uniform(3 - v8);
  if (v14 <= v15)
    v16 = v15;
  else
    v16 = v14;
  if (!v16)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138543362;
      *(_QWORD *)&v28[4] = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Not creating any fake homes", v28, 0xCu);

    }
    goto LABEL_22;
  }
  objc_msgSend(v7, "hmd_coreData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cloudPrivateStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x227676638]();
  v20 = a1;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = "";
    *(_DWORD *)v28 = 138543874;
    *(_QWORD *)&v28[4] = v22;
    if (v16 > 1)
      v23 = "s";
    *(_WORD *)&v28[12] = 2048;
    *(_QWORD *)&v28[14] = v16;
    v29 = 2080;
    v30 = v23;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Creating %lu fake home%s", v28, 0x20u);

  }
  objc_autoreleasePoolPop(v19);
  for (i = 0; i < v16; ++i)
    v25 = (id)objc_msgSend(v20, "_createFakeHomeInPersistentStore:context:", v18, v7, *(_OWORD *)v28);

LABEL_23:
}

+ (void)_maybeDeleteFakeHomes:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  BOOL v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __56__MKFCKHome_FakeRecords___maybeDeleteFakeHomes_context___block_invoke;
  v20[3] = &unk_24E78E120;
  v10 = v9;
  v21 = v10;
  v19 = v6;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);
  objc_msgSend(v10, "sortUsingComparator:", &__block_literal_global_183116);
  if (objc_msgSend(v10, "count"))
    v11 = v8 >= 4;
  else
    v11 = 0;
  if (v11)
  {
    v12 = v8 - 1;
    do
    {
      objc_msgSend(v10, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x227676638](objc_msgSend(v10, "removeLastObject"));
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v17;
        v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Pruning fake home: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v7, "deleteObject:", v13);

      if (!objc_msgSend(v10, "count"))
        break;
    }
    while (v12-- > 3);
  }

}

+ (id)_createFakeHomeInPersistentStore:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint32_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint32_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];
  const __CFString *v34;
  void *v35;
  _QWORD v36[3];
  _QWORD v37[4];

  v37[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCEB8];
  v8 = a3;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKHome createWithModelID:persistentStore:context:](MKFCKHome, "createWithModelID:persistentStore:context:", v10, v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v11);
  v36[0] = CFSTR("foo");
  randomStringWithLength(32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v12;
  v36[1] = CFSTR("bar");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", arc4random_uniform(0x400u));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v13;
  v36[2] = CFSTR("baz");
  v34 = &stru_24E79DB48;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setApplicationData:", v16);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)(86400 * (unint64_t)arc4random_uniform(0x800u)));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCreationDate:", v17);

  objc_msgSend(v11, "setDoorbellChimeEnabled:", arc4random_uniform(1u) != 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFirstHAPAccessoryAddedDate:", v18);

  objc_msgSend(v11, "setHasAnyUserAcknowledgedCameraRecordingOnboarding:", arc4random_uniform(1u) != 0);
  objc_msgSend(v11, "setHasOnboardedForAccessCode:", arc4random_uniform(1u) != 0);
  objc_msgSend(v11, "setHasOnboardedForWalletKey:", arc4random_uniform(1u) != 0);
  objc_msgSend(v11, "setHomeManagerApplicationData:", MEMORY[0x24BDBD1B8]);
  objc_msgSend(v11, "setMultiUserEnabled:", arc4random_uniform(1u) != 0);
  v19 = arc4random_uniform(0x14u);
  randomStringWithLength(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setName:", v20);

  +[HMDHomeNFCReaderKey createRandomKey](HMDHomeNFCReaderKey, "createRandomKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNfcReaderKey:", v21);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPersonDataZoneUUID:", v22);

  objc_msgSend(v11, "setPrimaryHomeCounter:", arc4random_uniform(0x40u));
  objc_msgSend(v11, "setAutomaticSoftwareUpdateEnabled:", arc4random_uniform(1u) != 0);
  objc_msgSend(v11, "setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", arc4random_uniform(1u) != 0);
  objc_msgSend(v11, "setMediaMinimumUserPrivilege:", arc4random_uniform(4u));
  v23 = arc4random_uniform(0x14u);
  randomStringWithLength(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMediaPassword:", v24);

  objc_msgSend(v11, "setMediaPeerToPeerEnabled:", arc4random_uniform(1u) != 0);
  objc_msgSend(v11, "setDidOnboardMemory:", arc4random_uniform(1u) != 0);
  objc_msgSend(v11, "setMemoryEnabled:", arc4random_uniform(1u) != 0);
  if (arc4random_uniform(1u))
  {
    objc_msgSend(v11, "setNetworkProtectionGroups:", &unk_24E971168);
    objc_msgSend(v11, "setNetworkProtectionMode:", arc4random_uniform(4u));
  }
  objc_msgSend(a1, "_balanceFakeRoomsForHome:context:", v11, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v25);

  objc_msgSend(a1, "_balanceFakeUsersForHome:context:", v11, v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v26);

  objc_msgSend(a1, "_balanceFakeZonesForHome:context:", v11, v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v27);

  objc_msgSend(a1, "_balanceFakeHAPAccessoriesForHome:context:", v11, v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v28);

  objc_msgSend(a1, "_balanceFakeMediaAccessoriesForHome:context:", v11, v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v29);

  objc_msgSend(a1, "_balanceFakeScenesForHome:context:", v11, v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v30);

  objc_msgSend(a1, "_balanceFakeTriggersForHome:context:", v11, v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v31);

  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __67__MKFCKHome_FakeRecords___createFakeHomeInPersistentStore_context___block_invoke;
  v33[3] = &__block_descriptor_40_e27_v32__0__MKFCKModel_8Q16_B24l;
  v33[4] = a1;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);

  return v11;
}

+ (void)_setCommonPropertiesOnAccessory:(id)a3
{
  void *v3;
  uint32_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint32_t v8;
  void *v9;
  uint32_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint32_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setApplicationData:", MEMORY[0x24BDBD1B8]);
  v4 = arc4random_uniform(0x14u);
  randomStringWithLength(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConfiguredName:", v5);

  randomStringWithLength(14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIdentifier:", v6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", arc4random_uniform(0x40u));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInitialCategory:", v7);

  v8 = arc4random_uniform(0x14u);
  randomStringWithLength(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInitialManufacturer:", v9);

  v10 = arc4random_uniform(0x14u);
  randomStringWithLength(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInitialModel:", v11);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setModelID:", v12);

  randomStringWithLength(16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setProductData:", v13);

  v14 = arc4random_uniform(0x14u);
  randomStringWithLength(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSerialNumber:", v15);

  if (arc4random_uniform(1u))
  {
    objc_msgSend(v19, "setNetworkClientIdentifier:", arc4random_uniform(0x20u));
    objc_msgSend(v19, "setNetworkClientLAN:", arc4random_uniform(0x20u));
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNetworkRouterUUID:", v16);

  }
  objc_msgSend(v3, "rooms");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anyObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRoom:", v18);

}

+ (id)_balanceFakeHAPAccessoriesForHome:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint32_t v9;
  uint64_t v10;
  MKFCKHAPAccessory *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = arc4random_uniform(0x14u);
  if (v9)
  {
    v10 = v9;
    do
    {
      v11 = -[MKFCKHAPAccessory initWithContext:]([MKFCKHAPAccessory alloc], "initWithContext:", v7);
      objc_msgSend(v8, "addObject:", v11);
      -[MKFCKHAPAccessory setHome:](v11, "setHome:", v6);
      objc_msgSend(a1, "_setCommonPropertiesOnAccessory:", v11);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", arc4random_uniform(6u));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKHAPAccessory setCertificationStatus:](v11, "setCertificationStatus:", v12);

      -[MKFCKHAPAccessory setHasOnboardedForNaturalLighting:](v11, "setHasOnboardedForNaturalLighting:", arc4random_uniform(1u) != 0);
      HMFRandomDataWithLength();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKHAPAccessory setPublicKey:](v11, "setPublicKey:", v13);

      v14 = (void *)MEMORY[0x24BDD17C8];
      -[MKFCKHAPAccessory identifier](v11, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@+1"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKHAPAccessory setUniqueIdentifier:](v11, "setUniqueIdentifier:", v16);

      --v10;
    }
    while (v10);
  }
  v17 = (void *)objc_msgSend(v8, "copy");

  return v17;
}

+ (id)_balanceFakeMediaAccessoriesForHome:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint32_t v9;
  uint64_t v10;
  MKFCKAppleMediaAccessory *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = arc4random_uniform(2u);
  if (v9)
  {
    v10 = v9;
    do
    {
      v11 = -[MKFCKAppleMediaAccessory initWithContext:]([MKFCKAppleMediaAccessory alloc], "initWithContext:", v7);
      objc_msgSend(v8, "addObject:", v11);
      -[MKFCKAppleMediaAccessory setHome:](v11, "setHome:", v6);
      objc_msgSend(a1, "_setCommonPropertiesOnAccessory:", v11);
      objc_msgSend(MEMORY[0x24BE3F228], "pairingIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKAppleMediaAccessory setPairingIdentity:](v11, "setPairingIdentity:", v12);

      --v10;
    }
    while (v10);
  }
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

+ (id)_balanceFakeRoomsForHome:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  MKFCKRoom *v8;
  void *v9;
  uint32_t v10;
  uint64_t v11;
  MKFCKRoom *v12;
  void *v13;
  uint32_t v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MKFCKRoom initWithContext:]([MKFCKRoom alloc], "initWithContext:", v6);
  objc_msgSend(v7, "addObject:", v8);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKRoom setModelID:](v8, "setModelID:", v9);

  -[MKFCKRoom setHome:](v8, "setHome:", v5);
  objc_msgSend(v5, "setDefaultRoom:", v8);

  v10 = arc4random_uniform(8u);
  if (v10)
  {
    v11 = v10;
    do
    {
      v12 = -[MKFCKRoom initWithContext:]([MKFCKRoom alloc], "initWithContext:", v6);
      objc_msgSend(v7, "addObject:", v12);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKRoom setModelID:](v12, "setModelID:", v13);

      -[MKFCKRoom setHome:](v12, "setHome:", v5);
      v14 = arc4random_uniform(0x14u);
      randomStringWithLength(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKRoom setName:](v12, "setName:", v15);

      --v11;
    }
    while (v11);
  }
  v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

+ (id)_balanceFakeScenesForHome:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint32_t v8;
  uint64_t v9;
  MKFCKScene *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint32_t v15;
  void *v16;
  uint32_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  MKFCKScene *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = arc4random_uniform(0xAu);
  if (v8 <= 4)
    v9 = 4;
  else
    v9 = v8;
  do
  {
    v10 = -[MKFCKScene initWithContext:]([MKFCKScene alloc], "initWithContext:", v6);
    objc_msgSend(v7, "addObject:", v10);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKScene setModelID:](v10, "setModelID:", v11);

    -[MKFCKScene setHome:](v10, "setHome:", v5);
    v30 = CFSTR("foo");
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKScene setActions:](v10, "setActions:", v14);

    -[MKFCKScene setApplicationData:](v10, "setApplicationData:", MEMORY[0x24BDBD1B8]);
    v15 = arc4random_uniform(0x14u);
    randomStringWithLength(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKScene setName:](v10, "setName:", v16);

    v17 = arc4random_uniform(0x14u);
    randomStringWithLength(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKScene setType:](v10, "setType:", v18);

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    objc_msgSend(v5, "accessories");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = arc4random_uniform(objc_msgSend(v19, "count"));

    v29 = v13;
    if (v27[3])
    {
      objc_msgSend(v5, "accessories");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __60__MKFCKHome_FakeRecords___balanceFakeScenesForHome_context___block_invoke;
      v23[3] = &unk_24E78E1A8;
      v24 = v10;
      v25 = &v26;
      objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);

    }
    _Block_object_dispose(&v26, 8);

    --v9;
  }
  while (v9);
  v21 = (void *)objc_msgSend(v7, "copy");

  return v21;
}

+ (id)_balanceFakeTriggersForHome:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  MKFCKEventTrigger *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  MKFCKEventTrigger *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  MKFCKEventTrigger *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  MKFCKEventTrigger *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = arc4random_uniform(2u);
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = -[MKFCKEventTrigger initWithContext:]([MKFCKEventTrigger alloc], "initWithContext:", v6);
      objc_msgSend(v7, "addObject:", v11);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKEventTrigger setModelID:](v11, "setModelID:", v12);

      -[MKFCKEventTrigger setHome:](v11, "setHome:", v5);
      -[MKFCKEventTrigger setAutoDelete:](v11, "setAutoDelete:", arc4random_uniform(1u) != 0);
      randomStringWithLength(20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKEventTrigger setConfiguredName:](v11, "setConfiguredName:", v13);

      -[MKFCKEventTrigger setEnabled:](v11, "setEnabled:", arc4random_uniform(1u) != 0);
      -[MKFCKEventTrigger setExecuteOnce:](v11, "setExecuteOnce:", arc4random_uniform(1u) != 0);
      randomStringWithLength(20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKEventTrigger setName:](v11, "setName:", v14);

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("foo = %@"), &unk_24E96C3E0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKEventTrigger setCondition:](v11, "setCondition:", v15);

      -[MKFCKEventTrigger setEvents:](v11, "setEvents:", &unk_24E971180);
      v44 = 0;
      v45 = &v44;
      v46 = 0x2020000000;
      v47 = 0;
      objc_msgSend(v5, "scenes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = arc4random_uniform(objc_msgSend(v16, "count"));

      v47 = v17;
      if (v45[3])
      {
        objc_msgSend(v5, "scenes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v10;
        v41[1] = 3221225472;
        v41[2] = __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke;
        v41[3] = &unk_24E78E1D0;
        v42 = v11;
        v43 = &v44;
        objc_msgSend(v18, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v41);

      }
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      objc_msgSend(v5, "accessories");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = arc4random_uniform(objc_msgSend(v19, "count"));

      v40 = v20;
      if (v38[3])
      {
        objc_msgSend(v5, "accessories");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v10;
        v34[1] = 3221225472;
        v34[2] = __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke_2;
        v34[3] = &unk_24E78E1A8;
        v35 = v11;
        v36 = &v37;
        objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v34);

      }
      v30 = 0;
      v31 = &v30;
      v32 = 0x2020000000;
      v33 = 0;
      objc_msgSend(v5, "users");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = arc4random_uniform(objc_msgSend(v22, "count"));

      v33 = v23;
      if (v31[3])
      {
        objc_msgSend(v5, "users");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v10;
        v27[1] = 3221225472;
        v27[2] = __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke_3;
        v27[3] = &unk_24E78E1F8;
        v28 = v11;
        v29 = &v30;
        objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);

      }
      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v44, 8);

      --v9;
    }
    while (v9);
  }
  v25 = (void *)objc_msgSend(v7, "copy");

  return v25;
}

+ (void)_setPropertiesOnUser:(id)a3 isOwner:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  uint32_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a4;
  v16 = a3;
  objc_msgSend(v16, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = arc4random_uniform(0x14u);
  randomStringWithLength(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccountHandle:", v7);

  objc_msgSend(v16, "setAnnounceAccessLevel:", arc4random_uniform(4u));
  objc_msgSend(v16, "setCamerasAccessLevel:", arc4random_uniform(4u));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setModelID:", v8);

  objc_msgSend(v16, "setPrivilege:", arc4random_uniform(4u));
  objc_msgSend(v16, "setRemoteAccessAllowed:", arc4random_uniform(1u) != 0);
  objc_msgSend(MEMORY[0x24BE3F228], "pairingIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BE1BBB0]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publicKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v9, "privateKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_msgSend(v10, "initWithIdentifier:publicKey:privateKey:permissions:", v12, v13, v14, v4);
  objc_msgSend(v16, "setPairingIdentity:", v15);

  if (v4)
  {

    objc_msgSend(v5, "setOwner:", v16);
    objc_msgSend(v16, "setOwnedHome:", v5);
  }
  else
  {

  }
}

+ (id)_balanceFakeUsersForHome:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MKFCKUser *v9;
  uint32_t v10;
  uint64_t v11;
  MKFCKUser *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MKFCKUser initWithContext:]([MKFCKUser alloc], "initWithContext:", v7);
  objc_msgSend(v8, "addObject:", v9);
  -[MKFCKUser setHome:](v9, "setHome:", v6);
  objc_msgSend(a1, "_setPropertiesOnUser:isOwner:", v9, 1);

  v10 = arc4random_uniform(2u);
  if (v10)
  {
    v11 = v10;
    do
    {
      v12 = -[MKFCKUser initWithContext:]([MKFCKUser alloc], "initWithContext:", v7);
      objc_msgSend(v8, "addObject:", v12);
      -[MKFCKUser setHome:](v12, "setHome:", v6);
      objc_msgSend(a1, "_setPropertiesOnUser:isOwner:", v12, 0);

      --v11;
    }
    while (v11);
  }
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

+ (id)_balanceFakeZonesForHome:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint32_t v8;
  uint64_t v9;
  MKFCKZone *v10;
  void *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  MKFCKZone *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = arc4random_uniform(0);
  if (v8)
  {
    v9 = v8;
    do
    {
      v10 = -[MKFCKZone initWithContext:]([MKFCKZone alloc], "initWithContext:", v6);
      objc_msgSend(v7, "addObject:", v10);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKZone setModelID:](v10, "setModelID:", v11);

      -[MKFCKZone setHome:](v10, "setHome:", v5);
      v12 = arc4random_uniform(0x14u);
      randomStringWithLength(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKZone setName:](v10, "setName:", v13);

      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      objc_msgSend(v5, "rooms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = arc4random_uniform(objc_msgSend(v14, "count") - 1);

      v25 = v15;
      if (v23[3])
      {
        objc_msgSend(v5, "rooms");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __59__MKFCKHome_FakeRecords___balanceFakeZonesForHome_context___block_invoke;
        v19[3] = &unk_24E78E220;
        v20 = v10;
        v21 = &v22;
        objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);

      }
      _Block_object_dispose(&v22, 8);

      --v9;
    }
    while (v9);
  }
  v17 = (void *)objc_msgSend(v7, "copy");

  return v17;
}

void __59__MKFCKHome_FakeRecords___balanceFakeZonesForHome_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "homeDefault");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

    v6 = v10;
  }
  else
  {
    objc_msgSend(v10, "zones");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v10;
    if (!v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addRoomsObject:", v10);
      v6 = v10;
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(_QWORD *)(v8 + 24) - 1;
      *(_QWORD *)(v8 + 24) = v9;
      if (!v9)
        *a3 = 1;
    }
  }

}

uint64_t __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "addScenesObject:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v6 + 24) - 1;
  *(_QWORD *)(v6 + 24) = v7;
  if (!v7)
    *a3 = 1;
  return result;
}

uint64_t __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "addAccessoriesObject:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v6 + 24) - 1;
  *(_QWORD *)(v6 + 24) = v7;
  if (!v7)
    *a3 = 1;
  return result;
}

uint64_t __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "addUsersObject:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v6 + 24) - 1;
  *(_QWORD *)(v6 + 24) = v7;
  if (!v7)
    *a3 = 1;
  return result;
}

uint64_t __60__MKFCKHome_FakeRecords___balanceFakeScenesForHome_context___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "addAccessoriesObject:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v6 + 24) - 1;
  *(_QWORD *)(v6 + 24) = v7;
  if (!v7)
    *a3 = 1;
  return result;
}

void __67__MKFCKHome_FakeRecords___createFakeHomeInPersistentStore_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638](objc_msgSend(v3, "convertToFakeModel"));
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Created fake model: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __56__MKFCKHome_FakeRecords___maybeDeleteFakeHomes_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isFake"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __56__MKFCKHome_FakeRecords___maybeDeleteFakeHomes_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "flags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)_importInvitationOutgoingIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", a3, CFSTR("invitations_"), a4);
}

- (BOOL)_exportInvitationOutgoingFromLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", a3, CFSTR("invitations_"), a4);
}

- (BOOL)_importGuestsIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", a3, CFSTR("guests_"), a4);
}

- (BOOL)_exportGuestsFromLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", a3, CFSTR("guests_"), a4);
}

- (BOOL)_importServiceGroupsIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _importRelationshipsIntoLocalModel:localRelationshipName:context:](self, "_importRelationshipsIntoLocalModel:localRelationshipName:context:", a3, CFSTR("serviceGroups_"), a4);
}

- (BOOL)_exportServiceGroupsFromLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHome _exportRelationshipsFromLocalHome:localRelationshipName:context:](self, "_exportRelationshipsFromLocalHome:localRelationshipName:context:", a3, CFSTR("serviceGroups_"), a4);
}

- (id)_populateGuestAccessCodeWithDictionary:(id)a3 hh2ModelID:(id)a4 home:(id)a5 groupsByModelID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _MKFGuestAccessCode *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  MKFCKHome *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "hmf_stringForKey:", CFSTR("a"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_stringForKey:", CFSTR("l"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_numberForKey:", CFSTR("uu"));
  v40 = objc_claimAutoreleasedReturnValue();
  if (v13 && v17 && v18 && objc_msgSend(v17, "length"))
  {
    v37 = v14;
    objc_msgSend(v14, "modelID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeAccessCodeModel modelUUIDForHomeUUID:accessCodeValue:](HMDHomeAccessCodeModel, "modelUUIDForHomeUUID:accessCodeValue:", v19, v17);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKeyedSubscript:", v13);
    v20 = (_MKFGuestAccessCode *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v20 = -[_MKFGuestAccessCode initWithContext:]([_MKFGuestAccessCode alloc], "initWithContext:", v16);
      -[_MKFGuestAccessCode setModelID:](v20, "setModelID:", v38);
      -[_MKFGuestAccessCode setHh2ModelID:](v20, "setHh2ModelID:", v13);
      -[MKFCKHome writerTimestamp](self, "writerTimestamp");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFGuestAccessCode setWriterTimestamp:](v20, "setWriterTimestamp:", v21);

    }
    -[_MKFGuestAccessCode accessCode](v20, "accessCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = HMFEqualObjects();

    if ((v23 & 1) == 0)
      -[_MKFGuestAccessCode setAccessCode:](v20, "setAccessCode:", v17);
    -[_MKFGuestAccessCode label](v20, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = HMFEqualObjects();

    v26 = (void *)v40;
    if ((v25 & 1) == 0)
      -[_MKFGuestAccessCode setLabel:](v20, "setLabel:", v18);
    -[_MKFGuestAccessCode userUniqueIDForAccessories](v20, "userUniqueIDForAccessories");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = HMFEqualObjects();

    if ((v28 & 1) == 0)
      -[_MKFGuestAccessCode setUserUniqueIDForAccessories:](v20, "setUserUniqueIDForAccessories:", v40);

    v14 = v37;
  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = v13;
      v32 = v16;
      v33 = v15;
      v34 = v14;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v35;
      v43 = 2112;
      v44 = v17;
      v45 = 2112;
      v46 = v18;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Invalid accessCode [%@] or label [%@] for guest access code. Not importing.", buf, 0x20u);

      v14 = v34;
      v15 = v33;
      v16 = v32;
      v13 = v39;
    }

    objc_autoreleasePoolPop(v29);
    v20 = 0;
    v26 = (void *)v40;
  }

  return v20;
}

- (BOOL)_importGuestAccessCodesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  v8 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v6, "guestAccessCodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "guestAccessCodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __69__MKFCKHome_PinCodes___importGuestAccessCodesIntoLocalModel_context___block_invoke;
  v27[3] = &unk_24E7983F8;
  v13 = v10;
  v28 = v13;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);

  -[MKFCKHome guestAccessCodes](self, "guestAccessCodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __69__MKFCKHome_PinCodes___importGuestAccessCodesIntoLocalModel_context___block_invoke_2;
  v23[3] = &unk_24E798420;
  v23[4] = self;
  v15 = v13;
  v24 = v15;
  v16 = v7;
  v25 = v16;
  v17 = v6;
  v26 = v17;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v23);

  v18 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v15, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "guestAccessCodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = HMFEqualObjects();

  if ((v12 & 1) == 0)
    objc_msgSend(v17, "setGuestAccessCodes_:", v20);

  return 1;
}

- (id)_populateRemovedUserAccessCodeFromDictionary:(id)a3 withAccessCode:(id)a4 hh2ModelID:(id)a5 home:(id)a6 groupsByModelID:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _MKFRemovedUserAccessCode *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  MKFCKHome *v44;
  NSObject *v45;
  void *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  void *v50;
  MKFCKHome *v51;
  NSObject *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  MKFCKHome *v58;
  NSObject *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  MKFCKHome *v64;
  NSObject *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  MKFCKHome *v71;
  NSObject *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *context;
  void *contexta;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v15 || !objc_msgSend(v15, "length"))
  {
    v43 = (void *)MEMORY[0x227676638]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
LABEL_26:

      objc_autoreleasePoolPop(v43);
      v31 = 0;
      goto LABEL_45;
    }
    HMFGetLogIdentifier();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v93 = v46;
    v94 = 2112;
    v95 = v14;
    v47 = "%{public}@Without accessCode cannot import _MKFRemovedUserAccessCode : %@";
    v48 = v45;
    v49 = 22;
LABEL_25:
    _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, v47, buf, v49);

    goto LABEL_26;
  }
  if (!v16)
  {
    v43 = (void *)MEMORY[0x227676638]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    HMFGetLogIdentifier();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v93 = v46;
    v47 = "%{public}@Without hh2ModelID cannot import _MKFRemovedUserAccessCode";
    v48 = v45;
    v49 = 12;
    goto LABEL_25;
  }
  objc_msgSend(v14, "hmf_stringForKey:", CFSTR("ui"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20 && objc_msgSend(v20, "length"))
  {
    objc_msgSend(v14, "hmf_stringForKey:", CFSTR("un"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 && objc_msgSend(v22, "length"))
    {
      objc_msgSend(v14, "hmf_UUIDForKey:", CFSTR("i"));
      v24 = objc_claimAutoreleasedReturnValue();
      v89 = (void *)v24;
      if (v24)
      {
        v25 = v24;
        objc_msgSend(v14, "hmf_dateForKey:", CFSTR("d"));
        v26 = objc_claimAutoreleasedReturnValue();
        context = (void *)v26;
        if (v26)
        {
          v81 = v21;
          v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD7910]), "initWithName:userUUID:userID:dateRemoved:", v23, v25, v21, v26);
          objc_msgSend(v17, "modelID");
          v28 = v23;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = (void *)v27;
          +[HMDRemovedUserAccessCodeModel modelUUIDForHomeUUID:removedUserInfo:accessCode:](HMDRemovedUserAccessCodeModel, "modelUUIDForHomeUUID:removedUserInfo:accessCode:", v29, v27, v15);
          v30 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "objectForKeyedSubscript:", v16);
          v31 = (_MKFRemovedUserAccessCode *)objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            v31 = -[_MKFRemovedUserAccessCode initWithContext:]([_MKFRemovedUserAccessCode alloc], "initWithContext:", v19);
            -[_MKFRemovedUserAccessCode setModelID:](v31, "setModelID:", v30);
            -[_MKFRemovedUserAccessCode setHh2ModelID:](v31, "setHh2ModelID:", v16);
          }
          -[_MKFRemovedUserAccessCode userName](v31, "userName", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v28;
          v33 = HMFEqualObjects();

          if ((v33 & 1) == 0)
            -[_MKFRemovedUserAccessCode setUserName:](v31, "setUserName:", v28);
          -[_MKFRemovedUserAccessCode userModelID](v31, "userModelID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v89;
          v36 = HMFEqualObjects();

          if ((v36 & 1) == 0)
            -[_MKFRemovedUserAccessCode setUserModelID:](v31, "setUserModelID:", v89);
          -[_MKFRemovedUserAccessCode userID](v31, "userID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = HMFEqualObjects();

          if ((v38 & 1) == 0)
            -[_MKFRemovedUserAccessCode setUserID:](v31, "setUserID:", v81);
          -[_MKFRemovedUserAccessCode dateRemoved](v31, "dateRemoved");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = HMFEqualObjects();

          if ((v40 & 1) == 0)
            -[_MKFRemovedUserAccessCode setDateRemoved:](v31, "setDateRemoved:", context);
          -[_MKFRemovedUserAccessCode accessCode](v31, "accessCode");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = HMFEqualObjects();

          if ((v42 & 1) == 0)
            -[_MKFRemovedUserAccessCode setAccessCode:](v31, "setAccessCode:", v15);

          v21 = v81;
          v23 = v85;
        }
        else
        {
          v82 = (void *)MEMORY[0x227676638]();
          v71 = self;
          HMFGetOSLogHandle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v88 = v23;
            v73 = v19;
            v74 = v18;
            v75 = v17;
            v76 = v21;
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v93 = v77;
            v94 = 2112;
            v95 = v14;
            _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_ERROR, "%{public}@No dateRemoved field found for removed user access code: %@. Not importing _MKFRemovedUserAccessCode", buf, 0x16u);

            v21 = v76;
            v17 = v75;
            v18 = v74;
            v19 = v73;
            v23 = v88;
          }

          objc_autoreleasePoolPop(v82);
          v31 = 0;
          v35 = v89;
        }

      }
      else
      {
        contexta = (void *)MEMORY[0x227676638]();
        v64 = self;
        HMFGetOSLogHandle();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v87 = v23;
          v66 = v19;
          v67 = v18;
          v68 = v17;
          v69 = v21;
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v93 = v70;
          v94 = 2112;
          v95 = v14;
          _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_ERROR, "%{public}@No modelID field found for removed user access code: %@. Not importing _MKFRemovedUserAccessCode", buf, 0x16u);

          v21 = v69;
          v17 = v68;
          v18 = v67;
          v19 = v66;
          v23 = v87;
        }

        objc_autoreleasePoolPop(contexta);
        v31 = 0;
        v35 = 0;
      }

    }
    else
    {
      v86 = v23;
      v57 = (void *)MEMORY[0x227676638]();
      v58 = self;
      HMFGetOSLogHandle();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v91 = v19;
        v60 = v18;
        v61 = v17;
        v62 = v21;
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v63;
        v94 = 2112;
        v95 = v14;
        _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_ERROR, "%{public}@No userName field found for removed user access code: %@. Not importing _MKFRemovedUserAccessCode", buf, 0x16u);

        v21 = v62;
        v17 = v61;
        v18 = v60;
        v19 = v91;
      }

      objc_autoreleasePoolPop(v57);
      v31 = 0;
      v23 = v86;
    }

  }
  else
  {
    v50 = (void *)MEMORY[0x227676638]();
    v51 = self;
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v90 = v19;
      v53 = v18;
      v54 = v17;
      v55 = v21;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v93 = v56;
      v94 = 2112;
      v95 = v14;
      _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@No userID field found for removed user access code: %@. Not importing _MKFRemovedUserAccessCode", buf, 0x16u);

      v21 = v55;
      v17 = v54;
      v18 = v53;
      v19 = v90;
    }

    objc_autoreleasePoolPop(v50);
    v31 = 0;
  }

LABEL_45:
  return v31;
}

- (BOOL)_importRemovedUserAccessCodesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  v8 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v6, "removedAccessCodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removedAccessCodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __75__MKFCKHome_PinCodes___importRemovedUserAccessCodesIntoLocalModel_context___block_invoke;
  v27[3] = &unk_24E798448;
  v13 = v10;
  v28 = v13;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);

  -[MKFCKHome removedUserAccessCodes](self, "removedUserAccessCodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __75__MKFCKHome_PinCodes___importRemovedUserAccessCodesIntoLocalModel_context___block_invoke_2;
  v23[3] = &unk_24E798420;
  v23[4] = self;
  v15 = v13;
  v24 = v15;
  v16 = v7;
  v25 = v16;
  v17 = v6;
  v26 = v17;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v23);

  v18 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v15, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "removedAccessCodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = HMFEqualObjects();

  if ((v12 & 1) == 0)
    objc_msgSend(v17, "setRemovedAccessCodes_:", v20);

  return 1;
}

- (BOOL)_importPinCodesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  if (-[MKFCKHome _importGuestAccessCodesIntoLocalModel:context:](self, "_importGuestAccessCodesIntoLocalModel:context:", v6, v7))
  {
    v8 = -[MKFCKHome _importRemovedUserAccessCodesIntoLocalModel:context:](self, "_importRemovedUserAccessCodesIntoLocalModel:context:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_exportGuestAccessCodesFromLocalModel:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(a3, "guestAccessCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKHome guestAccessCodes](self, "guestAccessCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__MKFCKHome_PinCodes___exportGuestAccessCodesFromLocalModel_context___block_invoke;
  v15[3] = &unk_24E798470;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __69__MKFCKHome_PinCodes___exportGuestAccessCodesFromLocalModel_context___block_invoke_2;
  v13[3] = &unk_24E798498;
  v13[4] = self;
  v10 = v9;
  v14 = v10;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
  -[MKFCKHome guestAccessCodes](self, "guestAccessCodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = HMFEqualObjects();

  if ((v8 & 1) == 0)
    -[MKFCKHome setGuestAccessCodes:](self, "setGuestAccessCodes:", v10);

  return 1;
}

- (BOOL)_exportRemovedUserAccessCodesFromLocalModel:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(a3, "removedAccessCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKHome removedUserAccessCodes](self, "removedUserAccessCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__MKFCKHome_PinCodes___exportRemovedUserAccessCodesFromLocalModel_context___block_invoke;
  v15[3] = &unk_24E798470;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __75__MKFCKHome_PinCodes___exportRemovedUserAccessCodesFromLocalModel_context___block_invoke_2;
  v13[3] = &unk_24E7984C0;
  v13[4] = self;
  v10 = v9;
  v14 = v10;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
  -[MKFCKHome removedUserAccessCodes](self, "removedUserAccessCodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = HMFEqualObjects();

  if ((v8 & 1) == 0)
    -[MKFCKHome setRemovedUserAccessCodes:](self, "setRemovedUserAccessCodes:", v10);

  return 1;
}

- (BOOL)_exportPinCodesFromLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  if (-[MKFCKHome _exportGuestAccessCodesFromLocalModel:context:](self, "_exportGuestAccessCodesFromLocalModel:context:", v6, v7))
  {
    v8 = -[MKFCKHome _exportRemovedUserAccessCodesFromLocalModel:context:](self, "_exportRemovedUserAccessCodesFromLocalModel:context:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __75__MKFCKHome_PinCodes___exportRemovedUserAccessCodesFromLocalModel_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((id)*MEMORY[0x24BDBD430] == v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __75__MKFCKHome_PinCodes___exportRemovedUserAccessCodesFromLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "accessCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "hh2ModelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((void *)*MEMORY[0x24BDBD430] == v7)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v24;
        v33 = 2112;
        v34 = v3;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Not exporting %@ as it is marked as tomb stoned record.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
    }
    else
    {
      v8 = (void *)objc_opt_class();
      objc_msgSend(v3, "userID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userModelID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dateRemoved");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_encodeRemovedUserInfoWithUserID:removedUserModelID:userName:dateRemoved:", v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v29[0] = CFSTR("a");
        v29[1] = CFSTR("ru");
        v30[0] = v4;
        v30[1] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(a1 + 40);
        objc_msgSend(v3, "hh2ModelID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

      }
      else
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v28;
          v33 = 2112;
          v34 = v3;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Not exporting %@ could not encode removed user info", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
      }

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v20;
      v33 = 2112;
      v34 = v3;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not exporting %@ as access code is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

void __69__MKFCKHome_PinCodes___exportGuestAccessCodesFromLocalModel_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((id)*MEMORY[0x24BDBD430] == v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __69__MKFCKHome_PinCodes___exportGuestAccessCodesFromLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "accessCode");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "label"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "hh2ModelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((void *)*MEMORY[0x24BDBD430] == v9)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v25;
        v28 = 2112;
        v29 = v3;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Not exporting %@ as it is marked as tomb stoned record.", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accessCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("a"));

      objc_msgSend(v3, "label");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("l"));

      objc_msgSend(v3, "userUniqueIDForAccessories");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v3, "userUniqueIDForAccessories");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("uu"));

      }
      v15 = (void *)objc_msgSend(v10, "copy");
      v16 = *(void **)(a1 + 40);
      objc_msgSend(v3, "hh2ModelID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v21;
      v28 = 2112;
      v29 = v3;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not exporting %@ as access code or label is nil", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }

}

void __75__MKFCKHome_PinCodes___importRemovedUserAccessCodesIntoLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "hh2ModelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

}

void __75__MKFCKHome_PinCodes___importRemovedUserAccessCodesIntoLocalModel_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if ((id)*MEMORY[0x24BDBD430] == v6)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v16;
      v23 = 2160;
      v24 = 1752392040;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Found tomb stoned removed user access code with modelID: %{mask.hash}@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v20;
        v23 = 2112;
        v24 = (uint64_t)v8;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Going to delete the removed user access code from working store: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v8);
    }
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ru"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("a"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_populateRemovedUserAccessCodeFromDictionary:withAccessCode:hh2ModelID:home:groupsByModelID:context:", v8, v9, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "hh2ModelID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v12);

    }
  }

}

void __69__MKFCKHome_PinCodes___importGuestAccessCodesIntoLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "hh2ModelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

}

void __69__MKFCKHome_PinCodes___importGuestAccessCodesIntoLocalModel_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((id)*MEMORY[0x24BDBD430] == v6)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v13;
      v20 = 2160;
      v21 = 1752392040;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Found tomb stoned guest access code with modelID: %{mask.hash}@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v17;
        v20 = 2112;
        v21 = (uint64_t)v8;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Going to delete the guest access code from working store: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v8);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_populateGuestAccessCodeWithDictionary:hh2ModelID:home:groupsByModelID:context:", v6, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "hh2ModelID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);

    }
  }

}

+ (id)_encodeRemovedUserInfoWithUserID:(id)a3 removedUserModelID:(id)a4 userName:(id)a5 dateRemoved:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("ui");
  v16[1] = CFSTR("un");
  v17[0] = a3;
  v17[1] = a5;
  v16[2] = CFSTR("i");
  v16[3] = CFSTR("d");
  v17[2] = a4;
  v17[3] = a6;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)__removedUserInfoFromDictionaryForUnitTest:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BDD7910];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("un"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("i"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("ui"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_dateForKey:", CFSTR("d"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v5, "initWithName:userUUID:userID:dateRemoved:", v6, v7, v8, v9);
  return v10;
}

+ (id)__dictionaryFromHMRemovedUserInfoForUnitTest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  SEL v13;
  id v14;
  int v15;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_opt_class();
    objc_msgSend(v4, "userID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateRemoved");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_encodeRemovedUserInfoWithUserID:removedUserModelID:userName:dateRemoved:", v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    v12 = (void *)_HMFPreconditionFailure();
    return +[MKFCKHome __dictionaryFromGuestAccessCodeDictionaryForUnitTest:tombStonedPinCodes:](v12, v13, v14, v15);
  }
}

+ (id)__dictionaryFromGuestAccessCodeDictionaryForUnitTest:(id)a3 tombStonedPinCodes:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  SEL v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __102__MKFCKHome_PinCodeUnitTest____dictionaryFromGuestAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke;
    v15[3] = &unk_24E7984E8;
    v8 = v7;
    v16 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);
    if (a4 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

        --a4;
      }
      while (a4);
    }

    return v8;
  }
  else
  {
    v12 = (void *)_HMFPreconditionFailure();
    return +[MKFCKHome __accessCodeFromDictionaryForUnitTest:](v12, v13, v14);
  }
}

+ (id)__accessCodeFromDictionaryForUnitTest:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("a"));
}

+ (id)__labelFromDictionaryForUnitTest:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("l"));
}

+ (id)__userUniqueIDForAccessoriesFromDictionaryForUnitTest:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uu"));
}

+ (id)__dictionaryFromGuestAccessCodeForUnitTest:(id)a3 label:(id)a4 userUniqueIDForAccessories:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDBCED8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("a");
  v15[1] = CFSTR("l");
  v16[0] = v10;
  v16[1] = v9;
  v15[2] = CFSTR("uu");
  v16[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v13);
  return v11;
}

+ (id)__removedUserInfoDictionaryForUnitTest:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ru"));
}

+ (id)__dictionaryFromRemovedUserAccessCodeDictionaryForUnitTest:(id)a3 tombStonedPinCodes:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id result;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __108__MKFCKHome_PinCodeUnitTest____dictionaryFromRemovedUserAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke;
    v19 = &unk_24E798510;
    v9 = v8;
    v20 = v9;
    v21 = a1;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v16);
    if (a4 >= 1)
    {
      do
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null", v16, v17, v18, v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v11);

        --a4;
      }
      while (a4);
    }

    return v9;
  }
  else
  {
    v13 = _HMFPreconditionFailure();
    __108__MKFCKHome_PinCodeUnitTest____dictionaryFromRemovedUserAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke(v13, v14, v15);
  }
  return result;
}

void __108__MKFCKHome_PinCodeUnitTest____dictionaryFromRemovedUserAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("a");
  v11[1] = CFSTR("ru");
  v12[0] = a2;
  v5 = a3;
  v6 = a2;
  objc_msgSend((id)objc_opt_class(), "__dictionaryFromHMRemovedUserInfoForUnitTest:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

}

void __102__MKFCKHome_PinCodeUnitTest____dictionaryFromGuestAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("a");
  v11[1] = CFSTR("l");
  v12[0] = a2;
  v12[1] = a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKHome"));
}

@end
