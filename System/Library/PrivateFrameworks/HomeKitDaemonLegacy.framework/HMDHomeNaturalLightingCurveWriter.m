@implementation HMDHomeNaturalLightingCurveWriter

- (HMDHomeNaturalLightingCurveWriter)initWithHome:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  HMDHomeNaturalLightingCurveWriter *v8;
  HMDHomeNaturalLightingCurveWriter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDHomeNaturalLightingCurveWriter;
  v8 = -[HMDHomeNaturalLightingCurveWriter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeStrong((id *)&v9->_dataSource, a4);
  }

  return v9;
}

- (HMDHomeNaturalLightingCurveWriter)initWithHome:(id)a3
{
  id v4;
  HMDLightProfileDataSource *v5;
  HMDHomeNaturalLightingCurveWriter *v6;

  v4 = a3;
  v5 = objc_alloc_init(HMDLightProfileDataSource);
  v6 = -[HMDHomeNaturalLightingCurveWriter initWithHome:dataSource:](self, "initWithHome:dataSource:", v4, v5);

  return v6;
}

- (void)setNaturalLightingEnabled:(BOOL)a3 forLightProfiles:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  HMDHomeNaturalLightingCurveWriter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  HMDHomeNaturalLightingCurveWriter *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  id obj;
  void *v48;
  _BOOL4 v49;
  _QWORD v50[5];
  id v51;
  BOOL v52;
  _QWORD aBlock[5];
  id v54;
  id v55;
  id v56;
  id v57;
  BOOL v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v49 = a3;
  v75 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v45 = a5;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v70 = v11;
    v71 = 2112;
    v72 = v12;
    v73 = 2112;
    v74 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting enabled for light profiles %@:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithWeakToStrongObjects");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithWeakToStrongObjects");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  obj = v13;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v64 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        -[HMDHomeNaturalLightingCurveWriter dataSource](v9, "dataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeNaturalLightingCurveWriter dataSource](v9, "dataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDCharacteristicWriteRequest writeRequestForTransitionStartWithLightProfile:naturalLightingEnabled:startDate:type:dataSource:](HMDCharacteristicWriteRequest, "writeRequestForTransitionStartWithLightProfile:naturalLightingEnabled:startDate:type:dataSource:", v18, v49, v20, 0, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v48, "setObject:forKey:", v22, v18);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKey:", v23, v18);

        }
      }
      v13 = obj;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v15);
  }

  v24 = v48;
  if (objc_msgSend(v48, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v26 = v48;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    v28 = v45;
    v29 = v46;
    if (v27)
    {
      v30 = v27;
      v31 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v60 != v31)
            objc_enumerationMutation(v26);
          objc_msgSend(v26, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v33);

        }
        v30 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v30);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke;
    aBlock[3] = &unk_1E89ACE80;
    aBlock[4] = v9;
    v34 = obj;
    v54 = obj;
    v55 = v46;
    v57 = v45;
    v56 = v26;
    v58 = v49;
    v35 = _Block_copy(aBlock);
    -[HMDHomeNaturalLightingCurveWriter home](v9, "home");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allObjects");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "performWriteRequests:withRetries:timeInterval:loggingObject:", v37, 4, v9, 5.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke_5;
    v50[3] = &unk_1E89ACEA8;
    v52 = v49;
    v50[4] = v9;
    v51 = v35;
    v39 = v35;
    v40 = (id)objc_msgSend(v38, "addCompletionBlock:", v50);

    v24 = v48;
  }
  else
  {
    v41 = (void *)MEMORY[0x1D17BA0A0]();
    v42 = v9;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    v28 = v45;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v70 = v44;
      v71 = 2112;
      v72 = v48;
      v73 = 2112;
      v74 = obj;
      _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@No characteristic write request for light profiles %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v41);
    v29 = v46;
    (*((void (**)(id, void *))v45 + 2))(v45, v46);
    v34 = obj;
  }

}

- (NSString)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeNaturalLightingCurveWriter home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_home);
}

void __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __int128 v26;
  id v27;
  uint64_t v28;
  id obj;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v30 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = *(id *)(a1 + 56);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v33;
      *(_QWORD *)&v7 = 138543874;
      v26 = v7;
      do
      {
        v10 = 0;
        v11 = v5;
        v28 = v8;
        do
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v12, v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(unsigned __int8 *)(a1 + 72);
          v31 = v11;
          v15 = objc_msgSend(v30, "hmd_isValidResponseForWriteRequest:naturalLightingEnabled:error:", v13, v14, &v31);
          v5 = v31;

          if ((v15 & 1) == 0)
          {
            v16 = v9;
            v17 = (void *)MEMORY[0x1D17BA0A0]();
            v18 = a1;
            v19 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v26;
              v41 = v21;
              v42 = 2112;
              v43 = v30;
              v44 = 2112;
              v45 = v27;
              _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate response for write request %@:%@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v17);
            a1 = v18;
            objc_msgSend(*(id *)(v18 + 48), "setObject:forKey:", v5, v12);
            v9 = v16;
            v8 = v28;
          }

          ++v10;
          v11 = v5;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = *(id *)(a1 + 40);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      }
      while (v23);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished setting natural lighting enabled: %@, with error: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_56725 != -1)
    dispatch_once(&logCategory__hmf_once_t4_56725, &__block_literal_global_56726);
  return (id)logCategory__hmf_once_v5_56727;
}

void __48__HMDHomeNaturalLightingCurveWriter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_56727;
  logCategory__hmf_once_v5_56727 = v0;

}

@end
