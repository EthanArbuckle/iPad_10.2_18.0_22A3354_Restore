@implementation HMMTRSyncClusterFanControl

+ (id)logCategory
{
  if (logCategory__hmf_once_t29 != -1)
    dispatch_once(&logCategory__hmf_once_t29, &__block_literal_global_9486);
  return (id)logCategory__hmf_once_v30;
}

void __41__HMMTRSyncClusterFanControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v30;
  logCategory__hmf_once_v30 = v0;

}

- (id)readAttributePluginRockSettingWithParams:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  uint64_t *v22;
  void *v23;
  HMMTRSyncClusterFanControl *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMMTRSyncClusterFanControl *v29;
  NSObject *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[MTRClusterFanControl readAttributeRockSupportWithParams:](self, "readAttributeRockSupportWithParams:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = *MEMORY[0x24BDDB518];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      -[MTRClusterFanControl readAttributeRockSettingWithParams:](self, "readAttributeRockSettingWithParams:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
      {
        v28 = (void *)MEMORY[0x242656984]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v42 = v31;
          _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read RockSetting attribute", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
        v27 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      if (v16)
      {
        v17 = objc_msgSend(v11, "unsignedIntegerValue");
        v18 = objc_msgSend(v16, "unsignedIntegerValue");
        v19 = *MEMORY[0x24BDDB510];
        if ((v18 & v17) != 0)
        {
          v37 = *MEMORY[0x24BDDB500];
          v38 = v8;
          v39 = v19;
          v40 = &unk_250F40218;
          v20 = (void *)MEMORY[0x24BDBCE70];
          v21 = &v39;
          v22 = &v37;
        }
        else
        {
          v33 = *MEMORY[0x24BDDB500];
          v34 = v8;
          v35 = v19;
          v36 = &unk_250F40230;
          v20 = (void *)MEMORY[0x24BDBCE70];
          v21 = &v35;
          v22 = &v33;
        }
        objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 2, v33, v34, v35, v36, v37, v38, v39, v40);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  v23 = (void *)MEMORY[0x242656984]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v26;
    _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read RockSupport attribute", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  v27 = 0;
LABEL_22:

  return v27;
}

- (void)writeAttributePluginRockSettingWithValue:(id)a3 expectedValueInterval:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMMTRSyncClusterFanControl *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  HMMTRSyncClusterFanControl *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMMTRSyncClusterFanControl *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMMTRSyncClusterFanControl *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *context;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDDB518];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  if (objc_msgSend(v11, "isEqualToNumber:", &unk_250F40230))
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v15;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Write attribute RockSetting 0", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v6);
    objc_msgSend(v16, "setValue:forKey:", &unk_250F40248, v8);
    -[MTRClusterFanControl writeAttributeRockSettingWithValue:expectedValueInterval:](v13, "writeAttributeRockSettingWithValue:expectedValueInterval:", v16, v7);

    goto LABEL_25;
  }
  if (objc_msgSend(v11, "isEqualToNumber:", &unk_250F40218))
  {
    v17 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    -[MTRClusterFanControl readAttributeRockSupportWithParams:](self, "readAttributeRockSupportWithParams:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      v31 = (void *)MEMORY[0x242656984]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v34;
        _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read RockSupport attribute. Cannot write RockSetting attribute.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
      goto LABEL_24;
    }
    objc_msgSend(v18, "objectForKeyedSubscript:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    if (v22)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v6);
      context = (void *)MEMORY[0x242656984]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v35 = v17;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v26;
        v39 = 2112;
        v40 = v22;
        _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Write attribute RockSetting %@", buf, 0x16u);

        v17 = v35;
      }

      objc_autoreleasePoolPop(context);
      objc_msgSend(v23, "setValue:forKey:", v22, v8);
      -[MTRClusterFanControl writeAttributeRockSettingWithValue:expectedValueInterval:](v24, "writeAttributeRockSettingWithValue:expectedValueInterval:", v23, v7);

LABEL_24:
      goto LABEL_25;
    }
LABEL_27:
    _HMFPreconditionFailure();
  }
  v27 = (void *)MEMORY[0x242656984]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v30;
    v39 = 2112;
    v40 = v11;
    _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot write RockSetting attribute. Unexpected swing value %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
LABEL_25:

}

- (void)updatedValuePluginRockSettingForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMMTRSyncClusterFanControl *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  void *v41;
  HMMTRSyncClusterFanControl *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void (**v46)(id, _QWORD, id);
  void (**v47)(id, _QWORD, id);
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB498]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v48 = v12;

  v13 = (void *)MEMORY[0x242656984]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v46 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v45 = v13;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BDDB478];
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v50 = v17;
    v51 = 2112;
    v52 = v18;
    v53 = 2112;
    v54 = v19;
    v55 = 2112;
    v56 = v20;
    v57 = 2112;
    v58 = v22;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v13 = v45;
    v7 = v46;

    v6 = v16;
  }
  else
  {
    v21 = *MEMORY[0x24BDDB478];
  }

  objc_autoreleasePoolPop(v13);
  objc_msgSend(v6, "objectForKeyedSubscript:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    v24 = v6;
  else
    v24 = 0;
  v25 = v24;

  objc_msgSend(v10, "cluster");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isEqualToNumber:", &unk_250F40260) & 1) == 0)
  {

LABEL_19:
    v31 = v48;
    v7[2](v7, 0, v48);
    goto LABEL_20;
  }
  objc_msgSend(v10, "attribute");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToNumber:", &unk_250F40278);

  if (!v28)
    goto LABEL_19;
  +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v25);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (!v29)
    goto LABEL_19;
  v30 = v29;
  if (objc_msgSend(v29, "isEqualToNumber:", &unk_250F40248))
  {
    v31 = v48;
    ((void (**)(id, void *, id))v7)[2](v7, &unk_250F40230, v48);

  }
  else
  {
    v32 = v6;
    v33 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
    -[MTRClusterFanControl readAttributeRockSupportWithParams:](v14, "readAttributeRockSupportWithParams:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v37 = v36;
      else
        v37 = 0;
      v38 = v37;

      if (!v38)
        _HMFPreconditionFailure();
      v39 = objc_msgSend(v38, "unsignedIntValue");
      if ((objc_msgSend(v30, "unsignedIntValue") & v39) != 0)
        v40 = &unk_250F40218;
      else
        v40 = &unk_250F40230;
      v31 = v48;
      ((void (**)(id, void *, id))v7)[2](v7, v40, v48);
    }
    else
    {
      v47 = v7;
      v41 = (void *)MEMORY[0x242656984]();
      v42 = v14;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v44;
        _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read RockSupport attribute. Cannot write RockSetting attribute.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v41);
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 11);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v47;
      v47[2](v47, 0, v38);
      v31 = v48;
    }

    v6 = v32;
  }
LABEL_20:

}

- (id)readAttributePluginFanModeWithParams:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMMTRSyncClusterFanControl *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  HMMTRSyncClusterFanControl *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  HMMTRSyncClusterFanControl *v38;
  NSObject *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[MTRClusterFanControl readAttributeFanModeWithParams:](self, "readAttributeFanModeWithParams:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = *MEMORY[0x24BDDB518];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v15;
        v56 = 2112;
        v57 = v11;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@readAttributePluginFanModeWithParams fanModeValue %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      if (!objc_msgSend(v11, "isEqualToNumber:", &unk_250F40290))
      {
        v31 = objc_msgSend(v11, "unsignedIntValue");
        if ((v31 - 1) >= 3)
        {
          if (v31)
          {
            v30 = 0;
            goto LABEL_31;
          }
          v36 = *MEMORY[0x24BDDB510];
          v46 = *MEMORY[0x24BDDB500];
          v47 = v8;
          v48 = v36;
          v49 = &unk_250F40230;
          v33 = (void *)MEMORY[0x24BDBCE70];
          v34 = &v48;
          v35 = &v46;
        }
        else
        {
          v32 = *MEMORY[0x24BDDB510];
          v42 = *MEMORY[0x24BDDB500];
          v43 = v8;
          v44 = v32;
          v45 = &unk_250F402A8;
          v33 = (void *)MEMORY[0x24BDBCE70];
          v34 = &v44;
          v35 = &v42;
        }
        objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, 2, v42, v43, v44, v45, v46, v47, v48, v49);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

        goto LABEL_32;
      }
      -[MTRClusterFanControl readAttributePercentCurrentWithParams:](v13, "readAttributePercentCurrentWithParams:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v16)
      {
        v37 = (void *)MEMORY[0x242656984]();
        v38 = v13;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v55 = v40;
          _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read PercentCurrent attribute", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v37);
        v30 = 0;
        goto LABEL_30;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      if (v20)
      {
        v21 = objc_msgSend(v20, "unsignedIntValue");
        v22 = *MEMORY[0x24BDDB510];
        if (v21)
        {
          v52[0] = *MEMORY[0x24BDDB500];
          v52[1] = v8;
          v53[0] = v22;
          v53[1] = &unk_250F402A8;
          v23 = (void *)MEMORY[0x24BDBCE70];
          v24 = v53;
          v25 = v52;
        }
        else
        {
          v50[0] = *MEMORY[0x24BDDB500];
          v50[1] = v8;
          v51[0] = v22;
          v51[1] = &unk_250F40218;
          v23 = (void *)MEMORY[0x24BDBCE70];
          v24 = v51;
          v25 = v50;
        }
        objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  v26 = (void *)MEMORY[0x242656984]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v29;
    _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read FanMode attribute", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v26);
  v30 = 0;
LABEL_32:

  return v30;
}

- (void)writeAttributePluginFanModeWithValue:(id)a3 expectedValueInterval:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  HMMTRSyncClusterFanControl *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDDB518];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v11)
    _HMFPreconditionFailure();
  v12 = objc_msgSend(v11, "unsignedIntValue");
  if (v12 > 2)
    v13 = 0;
  else
    v13 = qword_250F23D80[v12];
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v17;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@writeAttributePluginFanModeWithValue currentAirPurifierState %@, fanModeValue %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v6);
  objc_msgSend(v18, "setValue:forKey:", v13, v8);
  -[MTRClusterFanControl writeAttributeFanModeWithValue:expectedValueInterval:](v15, "writeAttributeFanModeWithValue:expectedValueInterval:", v18, v7);

}

- (void)updatedValuePluginFanModeForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMMTRSyncClusterFanControl *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  int v47;
  int v48;
  void (*v49)(id, void *, void *);
  void *v50;
  int v51;
  void (*v52)(id, void *, void *);
  void *v53;
  void *v54;
  HMMTRSyncClusterFanControl *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMMTRSyncClusterFanControl *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void (**v69)(id, _QWORD, void *);
  HMMTRSyncClusterFanControl *v70;
  void *v71;
  void *v72;
  void (**v73)(id, _QWORD, void *);
  void (**v74)(id, _QWORD, void *);
  void (**v75)(id, _QWORD, void *);
  id v76;
  id v77;
  id v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB498]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v76 = v13;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v73 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v70 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BDDB478];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v80 = v17;
    v81 = 2112;
    v82 = v18;
    v83 = 2112;
    v84 = v19;
    v85 = 2112;
    v86 = v20;
    v87 = 2112;
    v88 = v22;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v15 = v70;
    v7 = v73;

    v13 = v76;
  }
  else
  {
    v21 = *MEMORY[0x24BDDB478];
  }

  objc_autoreleasePoolPop(v14);
  objc_msgSend(v6, "objectForKeyedSubscript:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    v24 = v6;
  else
    v24 = 0;
  v25 = v24;

  objc_msgSend(v10, "cluster");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToNumber:", &unk_250F40260);

  if ((v27 & 1) != 0)
  {
    objc_msgSend(v10, "attribute");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToNumber:", &unk_250F402F0);

    if (v29)
    {
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v25);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        if (!objc_msgSend(v30, "isEqualToNumber:", &unk_250F40290))
        {
          v51 = objc_msgSend(v31, "unsignedIntValue");
          if ((v51 - 1) >= 3)
          {
            if (v51)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 12);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v7[2](v7, 0, v67);

              goto LABEL_61;
            }
            v52 = (void (*)(id, void *, void *))v7[2];
            v53 = &unk_250F40230;
          }
          else
          {
            v52 = (void (*)(id, void *, void *))v7[2];
            v53 = &unk_250F402A8;
          }
          v52(v7, v53, 0);
          goto LABEL_61;
        }
        v71 = v10;
        v32 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
        -[MTRClusterFanControl readAttributePercentCurrentWithParams:](v15, "readAttributePercentCurrentWithParams:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (!v33)
        {
          v74 = v7;
          v78 = v13;
          v54 = (void *)MEMORY[0x242656984]();
          v55 = v15;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = v54;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "endpoint");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v80 = v58;
            v81 = 2112;
            v82 = v59;
            _os_log_impl(&dword_23E95B000, v56, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read PercentCurrent attribute on endpoint %@. Cannot update CurrentAirPurifierState.", buf, 0x16u);

            v54 = v57;
          }

          objc_autoreleasePoolPop(v54);
          objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 11);
          v37 = (id)objc_claimAutoreleasedReturnValue();
          v7 = v74;
          v74[2](v74, 0, v37);
          v13 = v78;
          goto LABEL_47;
        }
        objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v36 = v35;
        else
          v36 = 0;
        v37 = v36;

        if (v37)
        {
          if (objc_msgSend(v37, "unsignedIntValue"))
            v38 = &unk_250F402A8;
          else
            v38 = &unk_250F40218;
          ((void (**)(id, void *, void *))v7)[2](v7, v38, 0);
LABEL_47:

          v10 = v71;
          goto LABEL_61;
        }
        _HMFPreconditionFailure();
LABEL_65:
        _HMFPreconditionFailure();
      }
LABEL_37:
      v7[2](v7, 0, v13);
LABEL_61:

      goto LABEL_62;
    }
    objc_msgSend(v10, "attribute");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqualToNumber:", &unk_250F40308);

    if (v40)
    {
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v25);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if (!v31)
        goto LABEL_37;
      v77 = v13;
      v72 = v10;
      v41 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
      -[MTRClusterFanControl readAttributeFanModeWithParams:](v15, "readAttributeFanModeWithParams:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (!v42)
      {
        v75 = v7;
        v60 = (void *)MEMORY[0x242656984]();
        v61 = v15;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "endpoint");
          v64 = v60;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v63;
          v81 = 2112;
          v82 = v65;
          _os_log_impl(&dword_23E95B000, v62, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read FanMode attribute on endpoint %@. Cannot update CurrentAirPurifierState.", buf, 0x16u);

          v60 = v64;
        }

        objc_autoreleasePoolPop(v60);
        objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 11);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v7 = v75;
        v75[2](v75, 0, v46);
        goto LABEL_60;
      }
      objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v45 = v44;
      else
        v45 = 0;
      v46 = v45;

      if (!v46)
        goto LABEL_65;
      v47 = objc_msgSend(v31, "isEqualToNumber:", &unk_250F40248);
      v48 = objc_msgSend(v46, "isEqualToNumber:", &unk_250F40290);
      if (v47)
      {
        if (v48)
        {
          v49 = (void (*)(id, void *, void *))v7[2];
          v50 = &unk_250F40218;
        }
        else
        {
          v68 = objc_msgSend(v46, "isEqualToNumber:", &unk_250F402C0);
          v49 = (void (*)(id, void *, void *))v7[2];
          if (!v68)
          {
            v69 = v7;
            v50 = 0;
            goto LABEL_59;
          }
          v50 = &unk_250F40230;
        }
      }
      else
      {
        if (!v48 && objc_msgSend(v46, "isEqualToNumber:", &unk_250F402C0))
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 12);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, 0, v66);

LABEL_60:
          v10 = v72;
          v13 = v77;
          goto LABEL_61;
        }
        v49 = (void (*)(id, void *, void *))v7[2];
        v50 = &unk_250F402A8;
      }
      v69 = v7;
LABEL_59:
      v49(v69, v50, 0);
      goto LABEL_60;
    }
  }
  v7[2](v7, 0, v13);
LABEL_62:

}

@end
