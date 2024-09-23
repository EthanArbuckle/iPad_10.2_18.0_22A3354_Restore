@implementation HMMTRSyncClusterColorControl

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1)
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_141);
  return (id)logCategory__hmf_once_v7;
}

void __43__HMMTRSyncClusterColorControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7;
  logCategory__hmf_once_v7 = v0;

}

- (void)moveToPluginColorTemperatureWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completionHandler:(id)a6
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v8 = a6;
  v9 = (objc_class *)MEMORY[0x24BDDB638];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v10, "colorTemperature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColorTemperature:", v12);

  objc_msgSend(v10, "transitionTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setTransitionTime:", v13);
  objc_msgSend(v11, "setOptionsMask:", &unk_250F3F000);
  objc_msgSend(v11, "setOptionsOverride:", &unk_250F3F000);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __126__HMMTRSyncClusterColorControl_moveToPluginColorTemperatureWithParams_expectedValues_expectedValueInterval_completionHandler___block_invoke;
  v16[3] = &unk_250F228C0;
  v16[4] = self;
  v17 = v11;
  v18 = v8;
  v14 = v8;
  v15 = v11;
  -[MTRClusterColorControl moveToColorTemperatureWithParams:expectedValues:expectedValueInterval:completionHandler:](self, "moveToColorTemperatureWithParams:expectedValues:expectedValueInterval:completionHandler:", v15, 0, 0, v16);

}

- (id)readAttributePluginColorTemperatureMiredsWithParams:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  HMMTRSyncClusterColorControl *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMMTRSyncClusterColorControl *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMMTRSyncClusterColorControl *v33;
  NSObject *v34;
  void *v35;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[MTRClusterColorControl readAttributeColorModeWithParams:](self, "readAttributeColorModeWithParams:", v5);
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

    v12 = objc_msgSend(v11, "unsignedIntegerValue");
    if (v12 == 2)
    {
      -[MTRClusterColorControl readAttributeColorTemperatureMiredsWithParams:](self, "readAttributeColorTemperatureMiredsWithParams:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
        v17 = v16;

        v18 = objc_msgSend(v17, "unsignedIntegerValue");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18, *MEMORY[0x24BDDB500], v8, *MEMORY[0x24BDDB510]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v32 = (void *)MEMORY[0x242656984]();
        v33 = self;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v42 = v35;
          _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read color temperature", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v32);
        v20 = 0;
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x242656984]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRSyncClusterColorControl endpointID](v26, "endpointID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = v28;
        v43 = 2112;
        v44 = &unk_250F3F018;
        v45 = 2112;
        v46 = v29;
        v47 = 2112;
        v48 = v30;
        _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_INFO, "%{public}@Returning color temp: %@ because colorMode: %@ on accessory endPoint: %@ is not color temp", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v25);
      v31 = *MEMORY[0x24BDDB510];
      v39[0] = *MEMORY[0x24BDDB500];
      v39[1] = v8;
      v40[0] = v31;
      v40[1] = &unk_250F3F018;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x242656984]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v24;
      _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read colorMode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRSyncClusterColorControl endpointID](self, "endpointID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("endPoint/%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __126__HMMTRSyncClusterColorControl_moveToPluginColorTemperatureWithParams_expectedValues_expectedValueInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "colorTemperature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "optionsMask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544130;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@moveToPluginColorTemperatureWithParams colorTemperature %@, optionsMask %@, error %@", (uint8_t *)&v10, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
