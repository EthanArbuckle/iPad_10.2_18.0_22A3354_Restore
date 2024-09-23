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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDHomeNaturalLightingCurveWriter *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDHomeNaturalLightingCurveWriter *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id obj;
  void *v49;
  _BOOL4 v50;
  _QWORD aBlock[5];
  id v52;
  id v53;
  id v54;
  id v55;
  BOOL v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE buf[38];
  __int16 v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v50 = a3;
  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v46 = a5;
  v8 = (void *)MEMORY[0x227676638]();
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
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting natural lighting enabled for light profiles %@:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithWeakToStrongObjects");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithWeakToStrongObjects");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v7;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v62 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
        -[HMDHomeNaturalLightingCurveWriter dataSource](v9, "dataSource");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeNaturalLightingCurveWriter dataSource](v9, "dataSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDCharacteristicWriteRequest writeRequestForTransitionStartWithLightProfile:naturalLightingEnabled:startDate:type:dataSource:](HMDCharacteristicWriteRequest, "writeRequestForTransitionStartWithLightProfile:naturalLightingEnabled:startDate:type:dataSource:", v17, v50, v19, 0, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v49, "setObject:forKey:", v21, v17);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKey:", v22, v17);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v14);
  }

  v23 = v49;
  if (objc_msgSend(v49, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v25 = v49;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v58 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(v25, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      }
      while (v27);
    }

    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__HMDHomeNaturalLightingCurveWriter_setNaturalLightingEnabled_forLightProfiles_completion___block_invoke;
    aBlock[3] = &unk_24E781290;
    aBlock[4] = v9;
    v52 = obj;
    v31 = v47;
    v53 = v47;
    v32 = v46;
    v55 = v46;
    v54 = v25;
    v56 = v50;
    v33 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v9;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      if (v34)
        objc_msgSend(v34, "getUUIDBytes:", buf);
      else
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      v65 = *(_OWORD *)buf;
      v43 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(_QWORD *)&buf[20] = &v65;
      *(_WORD *)&buf[28] = 2114;
      *(_QWORD *)&buf[30] = v36;
      v67 = 2048;
      v68 = v43;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Executing write requests for request identifier: %{public,uuid_t}.16P from natural lighting curve writer: %{public}@ count: %lu", buf, 0x30u);

    }
    objc_autoreleasePoolPop(v35);
    -[HMDHomeNaturalLightingCurveWriter home](v36, "home");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allObjects");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "writeCharacteristicValues:source:identifier:transport:qualityOfService:withCompletionHandler:", v45, 7, v34, 0, -1, v33);

    v23 = v49;
  }
  else
  {
    v39 = (void *)MEMORY[0x227676638]();
    v40 = v9;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v49;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = obj;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@No characteristic write request for light profiles %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v39);
    v32 = v46;
    v31 = v47;
    (*((void (**)(id, void *))v46 + 2))(v46, v47);
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

  v48 = *MEMORY[0x24BDAC8D0];
  v27 = a2;
  v30 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
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
            v17 = (void *)MEMORY[0x227676638]();
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
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate response for write request %@:%@", buf, 0x20u);

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
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
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

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_83231 != -1)
    dispatch_once(&logCategory__hmf_once_t4_83231, &__block_literal_global_83232);
  return (id)logCategory__hmf_once_v5_83233;
}

void __48__HMDHomeNaturalLightingCurveWriter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_83233;
  logCategory__hmf_once_v5_83233 = v0;

}

@end
