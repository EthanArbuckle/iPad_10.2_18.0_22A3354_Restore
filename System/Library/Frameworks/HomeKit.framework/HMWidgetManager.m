@implementation HMWidgetManager

- (HMWidgetManager)initWithHomeManager:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMWidgetManager *v9;
  HMWidgetManager *v10;
  HMUserCloudShareManager *v12;
  SEL v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v12 = (HMUserCloudShareManager *)_HMFPreconditionFailure();
    return (HMWidgetManager *)-[HMUserCloudShareManager initWithDataSource:](v12, v13, v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)HMWidgetManager;
  v9 = -[HMWidgetManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_homeManager, v6);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (void)monitorAndFetchStateForCharacteristics:(id)a3 widgetIdentifier:(id)a4 kind:(id)a5 completion:(id)a6
{
  -[HMWidgetManager monitorAndFetchStateForCharacteristics:monitorReachabilityChanges:widgetIdentifier:kind:completion:](self, "monitorAndFetchStateForCharacteristics:monitorReachabilityChanges:widgetIdentifier:kind:completion:", a3, 1, a4, a5, a6);
}

- (void)monitorAndFetchStateForCharacteristics:(id)a3 monitorReachabilityChanges:(BOOL)a4 widgetIdentifier:(id)a5 kind:(id)a6 completion:(id)a7
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMWidgetManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMWidgetManager *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void (**v59)(_QWORD, _QWORD, _QWORD);
  void *v60;
  _QWORD v61[5];
  id v62;
  void (**v63)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  _QWORD v76[5];
  _QWORD v77[7];

  v10 = a4;
  v77[5] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v14)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v15)
  {
LABEL_15:
    _HMFPreconditionFailure();
LABEL_16:
    _HMFPreconditionFailure();
  }
  if (!v16)
    goto LABEL_16;
  v59 = (void (**)(_QWORD, _QWORD, _QWORD))v16;
  v17 = objc_alloc(MEMORY[0x1E0D28540]);
  v18 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1A1AC1500](self, a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@, %s:%ld"), v19, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 120);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v17, "initWithName:", v20);

  -[HMWidgetManager homeManager](self, "homeManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v56 = v13;
    objc_msgSend(v13, "na_map:", &__block_literal_global_46671);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(v21, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithTarget:", v24);

    v76[0] = CFSTR("HMWM.widgetIdentifier");
    v76[1] = CFSTR("HMWM.widgetKind");
    v77[0] = v14;
    v77[1] = v15;
    v57 = (void *)v22;
    v77[2] = v22;
    v76[2] = CFSTR("HMWM.characteristics");
    v76[3] = CFSTR("HMWM.generationCounter");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "generationCounterPostHomeGraphUpdate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v26;
    v76[4] = CFSTR("HMWM.reachability");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v77[4] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    objc_msgSend(v21, "currentHome");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "uuid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("HMWM.currentHome"));

    v55 = v29;
    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMWM.monitorCharacteristics"), v25, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "shortDescription");
      v53 = v33;
      v38 = v14;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "identifier");
      v54 = v25;
      v40 = v15;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v65 = v36;
      v66 = 2114;
      v67 = v39;
      v68 = 2112;
      v69 = v41;
      v70 = 2112;
      v71 = v38;
      v72 = 2112;
      v73 = v40;
      v74 = 2112;
      v75 = v57;
      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Monitoring characteristics for widget (%@, %@): %@", buf, 0x3Eu);

      v15 = v40;
      v25 = v54;

      v14 = v38;
      v33 = v53;

    }
    objc_autoreleasePoolPop(v33);
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_59;
    v61[3] = &unk_1E3AB60C8;
    v61[4] = v34;
    v42 = v60;
    v62 = v60;
    v43 = v59;
    v63 = v59;
    objc_msgSend(v32, "setResponseHandler:", v61);
    -[HMWidgetManager context](v34, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "messageDispatcher");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "sendMessage:", v32);

    v13 = v56;
    v46 = v57;
  }
  else
  {
    v58 = v15;
    v47 = (void *)MEMORY[0x1A1AC1AAC]();
    v48 = self;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "identifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "shortDescription");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v50;
      v66 = 2114;
      v67 = v52;
      _os_log_impl(&dword_19B1B0000, v49, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v47);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v59;
    ((void (**)(_QWORD, _QWORD, void *))v59)[2](v59, 0, v46);
    v15 = v58;
    v42 = v60;
  }

}

- (void)fetchStateForCharacteristics:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMWidgetManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMWidgetManager *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  void (**v47)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  const __CFString *v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (!v8)
    goto LABEL_12;
  v10 = objc_alloc(MEMORY[0x1E0D28540]);
  v11 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1A1AC1500](self, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@, %s:%ld"), v12, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 194);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithName:", v13);

  -[HMWidgetManager homeManager](self, "homeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v7, "na_map:", &__block_literal_global_67);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(v15, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

    v56 = CFSTR("HMWM.characteristics");
    v57[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMWM.fetchState"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = v21;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v42 = v14;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "shortDescription");
      v43 = v7;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v41 = v19;
      v27 = v9;
      v28 = v15;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v49 = v24;
      v50 = 2114;
      v51 = v26;
      v52 = 2112;
      v53 = v29;
      v54 = 2112;
      v55 = v16;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Fetching state for characteristics: %@", buf, 0x2Au);

      v15 = v28;
      v9 = v27;
      v19 = v41;

      v7 = v43;
      v14 = v42;

      v21 = v40;
    }

    objc_autoreleasePoolPop(v21);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_68;
    v45[3] = &unk_1E3AB60C8;
    v45[4] = v22;
    v46 = v14;
    v47 = v9;
    objc_msgSend(v20, "setResponseHandler:", v45);
    -[HMWidgetManager context](v22, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "messageDispatcher");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendMessage:", v20);

  }
  else
  {
    v32 = v14;
    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "identifier");
      v37 = v7;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "shortDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v36;
      v50 = 2114;
      v51 = v39;
      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

      v7 = v37;
      v15 = 0;

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v16);
    v14 = v32;
  }

}

- (void)performRequests:(id)a3 forKind:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMWidgetManager *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMWidgetManager *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void (**v60)(void *, void *);
  void *v61;
  void *v62;
  HMWidgetManager *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void (**v69)(void *, void *);
  void *v70;
  HMWidgetManager *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void (**v76)(void *, void *);
  void *v77;
  HMWidgetManager *v78;
  void *aBlock;
  id v80;
  void *v81;
  id v82;
  id obj;
  void *v84;
  void *v85;
  _QWORD v86[5];
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  id v98;
  __int16 v99;
  void *v100;
  _QWORD v101[2];
  _QWORD v102[2];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
LABEL_44:
    _HMFPreconditionFailure();
  }
  if (!v10)
    goto LABEL_44;
  v12 = v11;
  v13 = objc_alloc(MEMORY[0x1E0D28540]);
  v14 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1A1AC1500](self, a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@, %s:%ld"), v15, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 254);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithName:", v16);

  -[HMWidgetManager homeManager](self, "homeManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (objc_msgSend(v9, "count"))
    {
      v78 = self;
      v81 = v17;
      v82 = v10;
      aBlock = v12;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = objc_claimAutoreleasedReturnValue();
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v80 = v9;
      obj = v9;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
      v84 = (void *)v19;
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v90;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v90 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v24;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v27 = v26;
            else
              v27 = 0;
            v28 = v27;

            v29 = v26;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v30 = v29;
            else
              v30 = 0;
            v31 = v30;

            if (v28)
            {
              objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E3B2E800, CFSTR("HMWM.requestType"));
              objc_msgSend(v28, "characteristic");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "uniqueIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, CFSTR("HMWM.characteristicUUID"));

              objc_msgSend(v28, "value");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v34, CFSTR("HMWM.characteristicValue"));
            }
            else
            {
              if (!v31)
              {
                v70 = (void *)MEMORY[0x1A1AC1AAC]();
                v71 = self;
                HMFGetOSLogHandle();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "identifier");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "shortDescription");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v94 = v73;
                  v95 = 2114;
                  v96 = v75;
                  v97 = 2112;
                  v98 = v29;
                  _os_log_impl(&dword_19B1B0000, v72, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Request is not a supported type: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v70);
                v12 = aBlock;
                v76 = (void (**)(void *, void *))_Block_copy(aBlock);
                v10 = v82;
                if (v76)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  v76[2](v76, v77);

                }
                v9 = v80;
                v17 = v81;
                goto LABEL_41;
              }
              v35 = (void *)MEMORY[0x1E0CB37E8];
              if (objc_msgSend(v31, "isMemberOfClass:", objc_opt_class()))
                v36 = 2;
              else
                v36 = 1;
              objc_msgSend(v35, "numberWithInteger:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v37, CFSTR("HMWM.requestType"));

              objc_msgSend(v31, "actionSet");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "uniqueIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v38, CFSTR("HMWM.actionSetUUID"));

            }
            v19 = (uint64_t)v84;
            objc_msgSend(v84, "addObject:", v25);

          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
          if (v21)
            continue;
          break;
        }
      }

      v101[0] = CFSTR("HMWM.requests");
      v101[1] = CFSTR("HMWM.widgetKind");
      v10 = v82;
      v102[0] = v19;
      v102[1] = v82;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0D285F8];
      v41 = objc_alloc(MEMORY[0x1E0D285D8]);
      objc_msgSend(v18, "uuid");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v41, "initWithTarget:", v42);
      objc_msgSend(v40, "messageWithName:destination:payload:", CFSTR("HMWM.performRequests"), v43, v39);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = (void *)MEMORY[0x1A1AC1AAC]();
      v46 = v78;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "shortDescription");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "identifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v94 = v48;
        v95 = 2114;
        v96 = v50;
        v97 = 2112;
        v98 = v51;
        v99 = 2112;
        v100 = v84;
        _os_log_impl(&dword_19B1B0000, v47, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Performing requests: %@", buf, 0x2Au);

        v10 = v82;
      }

      objc_autoreleasePoolPop(v45);
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __54__HMWidgetManager_performRequests_forKind_completion___block_invoke;
      v86[3] = &unk_1E3AB60C8;
      v86[4] = v46;
      v17 = v81;
      v87 = v81;
      v12 = aBlock;
      v88 = aBlock;
      objc_msgSend(v44, "setResponseHandler:", v86);
      -[HMWidgetManager context](v46, "context");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "messageDispatcher");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "sendMessage:", v44);

      v9 = v80;
LABEL_41:
      v60 = (void (**)(void *, void *))v84;
    }
    else
    {
      v62 = (void *)MEMORY[0x1A1AC1AAC]();
      v63 = self;
      HMFGetOSLogHandle();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "shortDescription");
        v85 = v62;
        v67 = v18;
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v94 = v65;
        v95 = 2114;
        v96 = v68;
        _os_log_impl(&dword_19B1B0000, v64, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] No requests to process", buf, 0x16u);

        v18 = v67;
        v62 = v85;

      }
      objc_autoreleasePoolPop(v62);
      v69 = (void (**)(void *, void *))_Block_copy(v12);
      v60 = v69;
      if (v69)
        v69[2](v69, 0);
    }
  }
  else
  {
    v54 = (void *)MEMORY[0x1A1AC1AAC]();
    v55 = self;
    HMFGetOSLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "shortDescription");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v94 = v57;
      v95 = 2114;
      v96 = v59;
      _os_log_impl(&dword_19B1B0000, v56, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

      v18 = 0;
    }

    objc_autoreleasePoolPop(v54);
    v60 = (void (**)(void *, void *))_Block_copy(v12);
    if (v60)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v60[2](v60, v61);

    }
  }

}

- (void)monitorAndFetchStateForActionSets:(id)a3 widgetIdentifier:(id)a4 kind:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  HMWidgetManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMWidgetManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  _QWORD v67[3];
  _QWORD v68[5];

  v68[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v12)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v13)
  {
LABEL_15:
    _HMFPreconditionFailure();
LABEL_16:
    _HMFPreconditionFailure();
  }
  v15 = v14;
  if (!v14)
    goto LABEL_16;
  v16 = objc_alloc(MEMORY[0x1E0D28540]);
  v17 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1A1AC1500](self, a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@, %s:%ld"), v18, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 325);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithName:", v19);

  -[HMWidgetManager homeManager](self, "homeManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v50 = v20;
    objc_msgSend(v11, "na_map:", &__block_literal_global_85);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0D285D8]);
    v51 = v21;
    objc_msgSend(v21, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithTarget:", v24);

    v67[0] = CFSTR("HMWM.widgetIdentifier");
    v67[1] = CFSTR("HMWM.widgetKind");
    v68[0] = v12;
    v68[1] = v13;
    v67[2] = CFSTR("HMWM.actionSets");
    v68[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v25;
    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMWM.monitorActionSets"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = v27;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shortDescription");
      v48 = v15;
      v32 = v13;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v45 = v11;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v56 = v30;
      v57 = 2114;
      v58 = v33;
      v59 = 2112;
      v60 = v34;
      v61 = 2112;
      v62 = v12;
      v63 = 2112;
      v64 = v32;
      v65 = 2112;
      v66 = v22;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Monitoring action sets for widget (%@, %@): %@", buf, 0x3Eu);

      v11 = v45;
      v13 = v32;
      v15 = v48;

      v27 = v44;
    }

    objc_autoreleasePoolPop(v27);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_86;
    v52[3] = &unk_1E3AB60C8;
    v52[4] = v28;
    v20 = v50;
    v53 = v50;
    v54 = v15;
    objc_msgSend(v26, "setResponseHandler:", v52);
    -[HMWidgetManager context](v28, "context");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "messageDispatcher");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sendMessage:", v26);

    v21 = v51;
  }
  else
  {
    v49 = v15;
    v37 = (void *)MEMORY[0x1A1AC1AAC]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "shortDescription");
      v42 = v20;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v40;
      v57 = 2114;
      v58 = v43;
      _os_log_impl(&dword_19B1B0000, v39, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

      v20 = v42;
      v21 = 0;
    }

    objc_autoreleasePoolPop(v37);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v49;
    (*((void (**)(void *, _QWORD, void *))v49 + 2))(v49, 0, v22);
  }

}

- (void)fetchStateForActionSets:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMWidgetManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMWidgetManager *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  void (**v47)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  const __CFString *v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (!v8)
    goto LABEL_12;
  v10 = objc_alloc(MEMORY[0x1E0D28540]);
  v11 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1A1AC1500](self, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@, %s:%ld"), v12, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Widgets/HMWidgetManager.m", 388);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithName:", v13);

  -[HMWidgetManager homeManager](self, "homeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v7, "na_map:", &__block_literal_global_91);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(v15, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

    v56 = CFSTR("HMWM.actionSets");
    v57[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMWM.fetchStateForActionSets"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = v21;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v42 = v14;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "shortDescription");
      v43 = v7;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v41 = v19;
      v27 = v9;
      v28 = v15;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v49 = v24;
      v50 = 2114;
      v51 = v26;
      v52 = 2112;
      v53 = v29;
      v54 = 2112;
      v55 = v16;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] [%@] Fetching action sets: %@", buf, 0x2Au);

      v15 = v28;
      v9 = v27;
      v19 = v41;

      v7 = v43;
      v14 = v42;

      v21 = v40;
    }

    objc_autoreleasePoolPop(v21);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_92;
    v45[3] = &unk_1E3AB60C8;
    v45[4] = v22;
    v46 = v14;
    v47 = v9;
    objc_msgSend(v20, "setResponseHandler:", v45);
    -[HMWidgetManager context](v22, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "messageDispatcher");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendMessage:", v20);

  }
  else
  {
    v32 = v14;
    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "identifier");
      v37 = v7;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "shortDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v36;
      v50 = 2114;
      v51 = v39;
      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] HomeManager has been deallocated", buf, 0x16u);

      v7 = v37;
      v15 = 0;

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v16);
    v14 = v32;
  }

}

- (HMHomeManager)homeManager
{
  return (HMHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

void __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_92(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  HMWidgetManagerFetchStateForActionSetsResponse *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  HMWidgetManagerFetchStateForActionSetsResponse *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  HMWidgetManagerFetchStateForActionSetsResponse *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v11;
      v53 = 2114;
      v54 = v13;
      v55 = 2112;
      v56 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch action sets with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_93;
    v48[3] = &unk_1E3AB60A0;
    v50 = a1[6];
    v49 = v5;
    objc_msgSend(v15, "invokeBlock:", v48);

    v16 = v50;
  }
  else
  {
    objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("HMWM.actionSetsIsOn"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v16 = (void *)v17;
      objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("HMWM.actionSetsDidExecuteFail"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = (void *)MEMORY[0x1E0C9AA70];
      if (v18)
        v20 = (void *)v18;
      v21 = v20;

      v22 = -[HMWidgetManagerFetchStateForActionSetsResponse initWithIsOnByActionSetsUniqueIdentifier:didExecutionFailByActionSetUniqueIdentifier:]([HMWidgetManagerFetchStateForActionSetsResponse alloc], "initWithIsOnByActionSetsUniqueIdentifier:didExecutionFailByActionSetUniqueIdentifier:", v16, v21);
      v23 = (void *)MEMORY[0x1A1AC1AAC]();
      v24 = a1[4];
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = v21;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v41 = v23;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v26;
        v53 = 2114;
        v54 = v28;
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched action sets", buf, 0x16u);

        v23 = v41;
        v21 = v42;
      }

      objc_autoreleasePoolPop(v23);
      objc_msgSend(a1[4], "context");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "delegateCaller");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_96;
      v43[3] = &unk_1E3AB60A0;
      v31 = a1[6];
      v44 = v22;
      v45 = v31;
      v32 = v22;
      objc_msgSend(v30, "invokeBlock:", v43);

    }
    else
    {
      v33 = (void *)MEMORY[0x1A1AC1AAC]();
      v34 = a1[4];
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "shortDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v36;
        v53 = 2114;
        v54 = v38;
        _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Action set isOn statuses are unexpectedly missing in the response", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(a1[4], "context");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "delegateCaller");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_94;
      v46[3] = &unk_1E3AB6078;
      v47 = a1[6];
      objc_msgSend(v40, "invokeBlock:", v46);

      v16 = 0;
    }
  }

}

uint64_t __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_93(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_94(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __54__HMWidgetManager_fetchStateForActionSets_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_86(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  HMWidgetManagerMonitorActionSetsResponse *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  HMWidgetManagerMonitorActionSetsResponse *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  HMWidgetManagerMonitorActionSetsResponse *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v11;
      v53 = 2114;
      v54 = v13;
      v55 = 2112;
      v56 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to monitor action sets with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_87;
    v48[3] = &unk_1E3AB60A0;
    v50 = a1[6];
    v49 = v5;
    objc_msgSend(v15, "invokeBlock:", v48);

    v16 = v50;
  }
  else
  {
    objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("HMWM.actionSetsIsOn"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v16 = (void *)v17;
      objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("HMWM.actionSetsDidExecuteFail"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = (void *)MEMORY[0x1E0C9AA70];
      if (v18)
        v20 = (void *)v18;
      v21 = v20;

      v22 = -[HMWidgetManagerMonitorActionSetsResponse initWithIsOnByActionSetsUniqueIdentifier:didExecutionFailByActionSetUniqueIdentifier:]([HMWidgetManagerMonitorActionSetsResponse alloc], "initWithIsOnByActionSetsUniqueIdentifier:didExecutionFailByActionSetUniqueIdentifier:", v16, v21);
      v23 = (void *)MEMORY[0x1A1AC1AAC]();
      v24 = a1[4];
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = v21;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v41 = v23;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v26;
        v53 = 2114;
        v54 = v28;
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully monitored action sets", buf, 0x16u);

        v23 = v41;
        v21 = v42;
      }

      objc_autoreleasePoolPop(v23);
      objc_msgSend(a1[4], "context");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "delegateCaller");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_90;
      v43[3] = &unk_1E3AB60A0;
      v31 = a1[6];
      v44 = v22;
      v45 = v31;
      v32 = v22;
      objc_msgSend(v30, "invokeBlock:", v43);

    }
    else
    {
      v33 = (void *)MEMORY[0x1A1AC1AAC]();
      v34 = a1[4];
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "shortDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v36;
        v53 = 2114;
        v54 = v38;
        _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Action set isOn statuses are unexpectedly missing in the response", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(a1[4], "context");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "delegateCaller");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_88;
      v46[3] = &unk_1E3AB6078;
      v47 = a1[6];
      objc_msgSend(v40, "invokeBlock:", v46);

      v16 = 0;
    }
  }

}

uint64_t __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_87(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_88(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __86__HMWidgetManager_monitorAndFetchStateForActionSets_widgetIdentifier_kind_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __54__HMWidgetManager_performRequests_forKind_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v11;
      v27 = 2114;
      v28 = v13;
      v29 = 2112;
      v30 = v5;
      v14 = "%{public}@[%{public}@] Failed to perform requests with error: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, buf, v17);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v11;
    v27 = 2114;
    v28 = v13;
    v14 = "%{public}@[%{public}@] Successfully performed requests";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(a1[4], "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__HMWidgetManager_performRequests_forKind_completion___block_invoke_81;
  v22[3] = &unk_1E3AB60A0;
  v20 = a1[6];
  v23 = v5;
  v24 = v20;
  v21 = v5;
  objc_msgSend(v19, "invokeBlock:", v22);

}

void __54__HMWidgetManager_performRequests_forKind_completion___block_invoke_81(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 32));
    v2 = v3;
  }

}

void __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_68(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMWidgetManagerFetchStateResponse *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  HMWidgetManagerFetchStateResponse *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  HMWidgetManagerFetchStateResponse *v38;
  id v39;
  _QWORD v40[4];
  HMWidgetManagerFetchStateResponse *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v11;
      v47 = 2114;
      v48 = v13;
      v49 = 2112;
      v50 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch state with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_69;
    v42[3] = &unk_1E3AB60A0;
    v44 = a1[6];
    v43 = v5;
    objc_msgSend(v15, "invokeBlock:", v42);

    v16 = v44;
  }
  else
  {
    objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("HMWM.characteristics"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = -[HMWidgetManagerFetchStateResponse initWithValueByCharacteristicUniqueIdentifier:]([HMWidgetManagerFetchStateResponse alloc], "initWithValueByCharacteristicUniqueIdentifier:", v16);
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v19 = a1[4];
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shortDescription");
        v36 = v18;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v21;
        v47 = 2114;
        v48 = v23;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched state", buf, 0x16u);

        v18 = v36;
      }

      objc_autoreleasePoolPop(v18);
      objc_msgSend(a1[4], "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "delegateCaller");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_72;
      v37[3] = &unk_1E3AB60A0;
      v26 = a1[6];
      v38 = v17;
      v39 = v26;
      v27 = v17;
      objc_msgSend(v25, "invokeBlock:", v37);

    }
    else
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = a1[4];
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v31;
        v47 = 2114;
        v48 = v33;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Characteristic values are unexpectedly missing", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(a1[4], "context");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "delegateCaller");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_70;
      v40[3] = &unk_1E3AB6078;
      v41 = (HMWidgetManagerFetchStateResponse *)a1[6];
      objc_msgSend(v35, "invokeBlock:", v40);

      v27 = v41;
    }

  }
}

uint64_t __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_70(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __59__HMWidgetManager_fetchStateForCharacteristics_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_59(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMWidgetManagerMonitorCharacteristicsResponse *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  HMWidgetManagerMonitorCharacteristicsResponse *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMWidgetManagerMonitorCharacteristicsResponse *v46;
  void *v47;
  _QWORD v48[4];
  HMWidgetManagerMonitorCharacteristicsResponse *v49;
  id v50;
  _QWORD v51[4];
  HMWidgetManagerMonitorCharacteristicsResponse *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v11;
      v60 = 2114;
      v61 = v13;
      v62 = 2112;
      v63 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to monitor characteristics with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_60;
    v55[3] = &unk_1E3AB60A0;
    v57 = a1[6];
    v56 = v5;
    objc_msgSend(v15, "invokeBlock:", v55);

    v16 = v57;
  }
  else
  {
    objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("HMWM.characteristics"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("HMWM.reachability"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = -[HMWidgetManagerMonitorCharacteristicsResponse initWithValueByCharacteristicUniqueIdentifier:reachabilityByAccessoryUniqueIdentifier:]([HMWidgetManagerMonitorCharacteristicsResponse alloc], "initWithValueByCharacteristicUniqueIdentifier:reachabilityByAccessoryUniqueIdentifier:", v16, v17);
        v19 = (void *)MEMORY[0x1A1AC1AAC]();
        v20 = a1[4];
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = v18;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "shortDescription");
          v45 = v19;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v22;
          v60 = 2114;
          v61 = v24;
          _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully monitored characteristics", buf, 0x16u);

          v19 = v45;
          v18 = v46;
        }

        objc_autoreleasePoolPop(v19);
        objc_msgSend(a1[4], "context");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "delegateCaller");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_65;
        v48[3] = &unk_1E3AB60A0;
        v27 = a1[6];
        v49 = v18;
        v50 = v27;
        v28 = v18;
        objc_msgSend(v26, "invokeBlock:", v48);

      }
      else
      {
        v37 = (void *)MEMORY[0x1A1AC1AAC]();
        v38 = a1[4];
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "shortDescription");
          v47 = v37;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v40;
          v60 = 2114;
          v61 = v42;
          _os_log_impl(&dword_19B1B0000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Accessory reachability is unexpectedly missing", buf, 0x16u);

          v37 = v47;
        }

        objc_autoreleasePoolPop(v37);
        objc_msgSend(a1[4], "context");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "delegateCaller");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_63;
        v51[3] = &unk_1E3AB6078;
        v52 = (HMWidgetManagerMonitorCharacteristicsResponse *)a1[6];
        objc_msgSend(v44, "invokeBlock:", v51);

        v28 = v52;
      }

    }
    else
    {
      v29 = (void *)MEMORY[0x1A1AC1AAC]();
      v30 = a1[4];
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v32;
        v60 = 2114;
        v61 = v34;
        _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Characteristic values are unexpectedly missing", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(a1[4], "context");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "delegateCaller");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_62;
      v53[3] = &unk_1E3AB6078;
      v54 = a1[6];
      objc_msgSend(v36, "invokeBlock:", v53);

      v17 = v54;
    }

  }
}

uint64_t __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_62(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_63(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __118__HMWidgetManager_monitorAndFetchStateForCharacteristics_monitorReachabilityChanges_widgetIdentifier_kind_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33_46691 != -1)
    dispatch_once(&logCategory__hmf_once_t33_46691, &__block_literal_global_97);
  return (id)logCategory__hmf_once_v34_46692;
}

void __30__HMWidgetManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v34_46692;
  logCategory__hmf_once_v34_46692 = v0;

}

@end
