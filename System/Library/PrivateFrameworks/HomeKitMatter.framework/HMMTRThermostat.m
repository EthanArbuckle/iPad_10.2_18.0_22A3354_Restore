@implementation HMMTRThermostat

+ (id)logCategory
{
  if (logCategory__hmf_once_t68 != -1)
    dispatch_once(&logCategory__hmf_once_t68, &__block_literal_global_7304);
  return (id)logCategory__hmf_once_v69;
}

void __30__HMMTRThermostat_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v69;
  logCategory__hmf_once_v69 = v0;

}

- (void)writeAttributeOccupiedHeatingOrCoolingSetpointWithValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke;
  v10[3] = &unk_250F24150;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[MTRBaseClusterThermostat readAttributeSystemModeWithCompletionHandler:](self, "readAttributeSystemModeWithCompletionHandler:", v10);

}

- (void)readAttributeOccupiedHeatingOrCoolingSetpointWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__HMMTRThermostat_readAttributeOccupiedHeatingOrCoolingSetpointWithCompletionHandler___block_invoke;
  v6[3] = &unk_250F24178;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTRBaseClusterThermostat readAttributeSystemModeWithCompletionHandler:](self, "readAttributeSystemModeWithCompletionHandler:", v6);

}

- (void)updatedValueForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMMTRThermostat *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
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
    v27 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v26 = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v34 = v17;
    v35 = 2112;
    v36 = v18;
    v37 = 2112;
    v38 = v19;
    v39 = 2112;
    v40 = v20;
    v41 = 2112;
    v42 = v21;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@UpdateValueForAttributeReport: Handling Attribute report endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v14 = v26;
    v7 = v27;
  }

  objc_autoreleasePoolPop(v14);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __66__HMMTRThermostat_updatedValueForAttributeReport_responseHandler___block_invoke;
  v28[3] = &unk_250F22208;
  v28[4] = v15;
  v29 = v6;
  v31 = v13;
  v32 = v7;
  v30 = v10;
  v22 = v13;
  v23 = v7;
  v24 = v10;
  v25 = v6;
  -[MTRBaseClusterThermostat readAttributeSystemModeWithCompletionHandler:](v15, "readAttributeSystemModeWithCompletionHandler:", v28);

}

- (void)updatedValuePluginCurrentHeatingCoolingStateForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRThermostat *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v20 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to current heating/cooling state - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v7 = v20;
  }

  objc_autoreleasePoolPop(v11);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __98__HMMTRThermostat_updatedValuePluginCurrentHeatingCoolingStateForAttributeReport_responseHandler___block_invoke;
  v21[3] = &unk_250F22FD0;
  v22 = v7;
  v19 = v7;
  -[HMMTRThermostat readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler:](v12, "readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler:", v21);

}

- (void)readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke;
  v6[3] = &unk_250F24178;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTRBaseClusterThermostat readAttributeSystemModeWithCompletionHandler:](self, "readAttributeSystemModeWithCompletionHandler:", v6);

}

- (void)readAttributePluginActiveWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__HMMTRThermostat_readAttributePluginActiveWithCompletionHandler___block_invoke;
  v6[3] = &unk_250F24178;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTRBaseClusterThermostat readAttributeSystemModeWithCompletion:](self, "readAttributeSystemModeWithCompletion:", v6);

}

- (void)writeAttributePluginActiveWithValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__HMMTRThermostat_writeAttributePluginActiveWithValue_completionHandler___block_invoke;
  v10[3] = &unk_250F24150;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[MTRBaseClusterThermostat readAttributeControlSequenceOfOperationWithCompletion:](self, "readAttributeControlSequenceOfOperationWithCompletion:", v10);

}

- (void)updatedValuePluginActiveForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRThermostat *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v20 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to Active Char - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v7 = v20;
  }

  objc_autoreleasePoolPop(v11);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __78__HMMTRThermostat_updatedValuePluginActiveForAttributeReport_responseHandler___block_invoke;
  v21[3] = &unk_250F22FD0;
  v22 = v7;
  v19 = v7;
  -[HMMTRThermostat readAttributePluginActiveWithCompletionHandler:](v12, "readAttributePluginActiveWithCompletionHandler:", v21);

}

- (void)readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __84__HMMTRThermostat_readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler___block_invoke;
  v6[3] = &unk_250F24178;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTRBaseClusterThermostat readAttributeSystemModeWithCompletionHandler:](self, "readAttributeSystemModeWithCompletionHandler:", v6);

}

- (void)updatedValuePluginCurrentHeaterCoolerStateForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRThermostat *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v20 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to current heater cooler state - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v7 = v20;
  }

  objc_autoreleasePoolPop(v11);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __96__HMMTRThermostat_updatedValuePluginCurrentHeaterCoolerStateForAttributeReport_responseHandler___block_invoke;
  v21[3] = &unk_250F22FD0;
  v22 = v7;
  v19 = v7;
  -[HMMTRThermostat readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler:](v12, "readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler:", v21);

}

- (void)readAttributePluginTargetHeaterCoolerStateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__HMMTRThermostat_readAttributePluginTargetHeaterCoolerStateWithCompletionHandler___block_invoke;
  v6[3] = &unk_250F24178;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTRBaseClusterThermostat readAttributeSystemModeWithCompletion:](self, "readAttributeSystemModeWithCompletion:", v6);

}

- (void)writeAttributePluginTargetHeaterCoolerStateWithValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  __CFString *v13;
  id v14;

  v6 = a4;
  v7 = objc_msgSend(a3, "integerValue");
  if (v7 == 1)
    v8 = &unk_250F3FA50;
  else
    v8 = &unk_250F3FA38;
  v11[0] = MEMORY[0x24BDAC760];
  v11[2] = __90__HMMTRThermostat_writeAttributePluginTargetHeaterCoolerStateWithValue_completionHandler___block_invoke;
  v11[3] = &unk_250F229B0;
  v9 = CFSTR("Heat");
  v11[1] = 3221225472;
  v11[4] = self;
  v12 = v8;
  if (v7 != 1)
    v9 = CFSTR("Cool");
  v13 = (__CFString *)v9;
  v14 = v6;
  v10 = v6;
  -[MTRBaseClusterThermostat writeAttributeSystemModeWithValue:completion:](self, "writeAttributeSystemModeWithValue:completion:", v8, v11);

}

- (void)updatedValuePluginTargetHeaterCoolerStateForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRThermostat *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v20 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to target heater cooler state - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v7 = v20;
  }

  objc_autoreleasePoolPop(v11);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __95__HMMTRThermostat_updatedValuePluginTargetHeaterCoolerStateForAttributeReport_responseHandler___block_invoke;
  v21[3] = &unk_250F22FD0;
  v22 = v7;
  v19 = v7;
  -[HMMTRThermostat readAttributePluginTargetHeaterCoolerStateWithCompletionHandler:](v12, "readAttributePluginTargetHeaterCoolerStateWithCompletionHandler:", v21);

}

uint64_t __95__HMMTRThermostat_updatedValuePluginTargetHeaterCoolerStateForAttributeReport_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__HMMTRThermostat_writeAttributePluginTargetHeaterCoolerStateWithValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138544130;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Wrote to system mode attribute for Target Heater Cooler State Characteristic, value:%@ (%@), error:%@", (uint8_t *)&v10, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __83__HMMTRThermostat_readAttributePluginTargetHeaterCoolerStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void (*v11)(void);
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state: An error occurred while trying to read the system mode: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else if (objc_msgSend(v5, "integerValue") == 4 || objc_msgSend(v5, "integerValue") == 5)
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (objc_msgSend(v5, "integerValue") != 3 && objc_msgSend(v5, "integerValue") != 6)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __83__HMMTRThermostat_readAttributePluginTargetHeaterCoolerStateWithCompletionHandler___block_invoke_38;
      v13[3] = &unk_250F24178;
      v12 = *(void **)(a1 + 40);
      v14 = *(id *)(a1 + 32);
      v15 = v12;
      objc_msgSend(v14, "readAttributeControlSequenceOfOperationWithCompletion:", v13);

      goto LABEL_12;
    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v11();
LABEL_12:

}

void __83__HMMTRThermostat_readAttributePluginTargetHeaterCoolerStateWithCompletionHandler___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void (*v11)(void);
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v10;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state: An error occurred while trying to read the control sequence of operation: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend(v5, "integerValue") <= 5)
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_7:
    v11();
    goto LABEL_8;
  }
  v12 = (void *)MEMORY[0x242656984]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v15;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state: Unsupported control sequence of operation value: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 5, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

LABEL_8:
}

uint64_t __96__HMMTRThermostat_updatedValuePluginCurrentHeaterCoolerStateForAttributeReport_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__HMMTRThermostat_readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state: An error occurred while trying to read the system mode: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state: Got systemModeValue value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(v5, "integerValue"))
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __84__HMMTRThermostat_readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler___block_invoke_34;
      v15[3] = &unk_250F24240;
      v14 = *(void **)(a1 + 40);
      v16 = *(id *)(a1 + 32);
      v19 = v14;
      v17 = v5;
      v18 = 0;
      objc_msgSend(v16, "readAttributeLocalTemperatureWithCompletionHandler:", v15);

      goto LABEL_10;
    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v12();
LABEL_10:

}

void __84__HMMTRThermostat_readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler___block_invoke_34(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state: Got temperatureValue value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(a1[5], "integerValue") == 3)
    {
      v13 = a1[4];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __84__HMMTRThermostat_readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler___block_invoke_35;
      v21[3] = &unk_250F24150;
      v21[4] = v13;
      v23 = a1[7];
      v22 = v5;
      objc_msgSend(v13, "readAttributeOccupiedCoolingSetpointWithCompletionHandler:", v21);

      v14 = v23;
    }
    else
    {
      if (objc_msgSend(a1[5], "integerValue") != 4)
      {
        v7 = (void *)MEMORY[0x242656984]();
        v8 = a1[4];
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = a1[5];
          *(_DWORD *)buf = 138543618;
          v25 = v16;
          v26 = 2112;
          v27 = v17;
          _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Read current heater cooler state: Unsupported system mode: %@", buf, 0x16u);

        }
        goto LABEL_4;
      }
      v15 = a1[4];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __84__HMMTRThermostat_readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler___block_invoke_36;
      v18[3] = &unk_250F24150;
      v18[4] = v15;
      v20 = a1[7];
      v19 = v5;
      objc_msgSend(v15, "readAttributeOccupiedHeatingSetpointWithCompletionHandler:", v18);

      v14 = v20;
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state: An error occurred while trying to read the local temperature: %@", buf, 0x16u);

  }
LABEL_4:

  objc_autoreleasePoolPop(v7);
  (*((void (**)(void))a1[7] + 2))();
LABEL_12:

}

void __84__HMMTRThermostat_readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state: An error occurred while trying to read the occupied cooling point: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state: Got coolPointValue value: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
    if (v13 <= objc_msgSend(v5, "integerValue"))
      v14 = &unk_250F3F9C0;
    else
      v14 = &unk_250F3F9F0;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 0);
  }

}

void __84__HMMTRThermostat_readAttributePluginCurrentHeaterCoolerStateWithCompletionHandler___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state: An error occurred while trying to read the occupied heating point: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state: Got heatPointValue value: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
    if (v13 >= objc_msgSend(v5, "integerValue"))
      v14 = &unk_250F3F9C0;
    else
      v14 = &unk_250F3FA68;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 0);
  }

}

uint64_t __78__HMMTRThermostat_updatedValuePluginActiveForAttributeReport_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__HMMTRThermostat_writeAttributePluginActiveWithValue_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void (**v21)(id, void *);
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (objc_msgSend(a1[5], "integerValue"))
    {
      v11 = objc_msgSend(v5, "integerValue");
      if (v11 > 5)
      {
        v12 = (void *)MEMORY[0x242656984]();
        v13 = a1[4];
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v15;
          v33 = 2112;
          v34 = v5;
          v16 = "%{public}@Unsupported control sequence of operation value: %@";
          goto LABEL_18;
        }
LABEL_19:

        objc_autoreleasePoolPop(v12);
        v21 = (void (**)(id, void *))a1[6];
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 5, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2](v21, v22);

        goto LABEL_20;
      }
      if (((1 << v11) & 0x32) != 0)
      {
        v12 = (void *)MEMORY[0x242656984]();
        v13 = a1[4];
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v15;
          v33 = 2112;
          v34 = v5;
          v16 = "%{public}@Setting active mode On not supported for control sequence of operation value: %@";
LABEL_18:
          _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);

          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (((1 << v11) & 0xC) != 0)
        v19 = &unk_250F3FA50;
      else
        v19 = &unk_250F3FA38;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __73__HMMTRThermostat_writeAttributePluginActiveWithValue_completionHandler___block_invoke_33;
      v23[3] = &unk_250F229B0;
      v20 = a1[5];
      v24 = a1[4];
      v25 = v20;
      v26 = v19;
      v27 = a1[6];
      objc_msgSend(v24, "writeAttributeSystemModeWithValue:completion:", v19, v23);

      v18 = v25;
    }
    else
    {
      v17 = a1[4];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __73__HMMTRThermostat_writeAttributePluginActiveWithValue_completionHandler___block_invoke_30;
      v28[3] = &unk_250F228C0;
      v28[4] = v17;
      v29 = &unk_250F3FA20;
      v30 = a1[6];
      objc_msgSend(v17, "writeAttributeSystemModeWithValue:completion:", &unk_250F3FA20, v28);

      v18 = v29;
    }

    goto LABEL_20;
  }
  v7 = (void *)MEMORY[0x242656984]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v10;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the control sequence of operation: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  (*((void (**)(void))a1[6] + 2))();
LABEL_20:

}

void __73__HMMTRThermostat_writeAttributePluginActiveWithValue_completionHandler___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Wrote to system mode attribute for Active Characteristic, value:%@ (Off), error:%@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __73__HMMTRThermostat_writeAttributePluginActiveWithValue_completionHandler___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138544130;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Wrote to system mode attribute for Active Characteristic, value:%@ (On), system mode:%@, error:%@", (uint8_t *)&v10, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __66__HMMTRThermostat_readAttributePluginActiveWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Read Active Characteristic: An error occurred while trying to read the system mode: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (objc_msgSend(v5, "integerValue"))
      v11 = &unk_250F3FA08;
    else
      v11 = &unk_250F3F9C0;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, 0);
  }

}

void __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state: An error occurred while trying to read the system mode: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state: Got systemModeValue value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(v5, "integerValue"))
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_19;
      v15[3] = &unk_250F24240;
      v14 = *(void **)(a1 + 40);
      v16 = *(id *)(a1 + 32);
      v19 = v14;
      v17 = v5;
      v18 = 0;
      objc_msgSend(v16, "readAttributeLocalTemperatureWithCompletionHandler:", v15);

      goto LABEL_10;
    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v12();
LABEL_10:

}

void __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_19(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v12;
      v30 = 2112;
      v31 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state: Got temperatureValue value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (objc_msgSend(a1[5], "integerValue") == 1)
    {
      v13 = a1[4];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_20;
      v25[3] = &unk_250F24150;
      v25[4] = v13;
      v27 = a1[7];
      v26 = v5;
      objc_msgSend(v13, "readAttributeThermostatRunningModeWithCompletionHandler:", v25);

      v14 = v27;
    }
    else if (objc_msgSend(a1[5], "integerValue") == 3)
    {
      v15 = a1[4];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_25;
      v22[3] = &unk_250F24150;
      v22[4] = v15;
      v24 = a1[7];
      v23 = v5;
      objc_msgSend(v15, "readAttributeOccupiedCoolingSetpointWithCompletionHandler:", v22);

      v14 = v24;
    }
    else
    {
      if (objc_msgSend(a1[5], "integerValue") != 4)
      {
        v7 = (void *)MEMORY[0x242656984]();
        v8 = a1[4];
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = a1[5];
          *(_DWORD *)buf = 138543618;
          v29 = v17;
          v30 = 2112;
          v31 = v18;
          _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Read current heating/cooling state: Unsupported system mode: %@", buf, 0x16u);

        }
        goto LABEL_4;
      }
      v16 = a1[4];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_26;
      v19[3] = &unk_250F24150;
      v19[4] = v16;
      v21 = a1[7];
      v20 = v5;
      objc_msgSend(v16, "readAttributeOccupiedHeatingSetpointWithCompletionHandler:", v19);

      v14 = v21;
    }

    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state: An error occurred while trying to read the local temperature: %@", buf, 0x16u);

  }
LABEL_4:

  objc_autoreleasePoolPop(v7);
  (*((void (**)(void))a1[7] + 2))();
LABEL_14:

}

void __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_20(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Read current heating/cooling state: Couldn't get thermostat running mode from device. Ignoring error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = a1[4];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_21;
    v14[3] = &unk_250F24150;
    v14[4] = v12;
    v16 = a1[6];
    v15 = a1[5];
    objc_msgSend(v12, "readAttributeOccupiedHeatingSetpointWithCompletionHandler:", v14);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state: Got runningModeValue value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state: An error occurred while trying to read the occupied cooling point: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state: Got coolPointValue value: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
    if (v13 <= objc_msgSend(v5, "integerValue"))
      v14 = &unk_250F3F9C0;
    else
      v14 = &unk_250F3F9F0;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 0);
  }

}

void __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state: An error occurred while trying to read the occupied heating point: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state: Got heatPointValue value: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
    if (v13 >= objc_msgSend(v5, "integerValue"))
      v14 = &unk_250F3F9C0;
    else
      v14 = &unk_250F3F9D8;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 0);
  }

}

void __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_21(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state: An error occurred while trying to read the occupied heating point: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state: Got heatPointValue value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = a1[4];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_22;
    v14[3] = &unk_250F24240;
    v14[4] = v13;
    v17 = a1[6];
    v15 = a1[5];
    v16 = v5;
    objc_msgSend(v13, "readAttributeOccupiedCoolingSetpointWithCompletionHandler:", v14);

  }
}

void __86__HMMTRThermostat_readAttributePluginCurrentHeatingCoolingStateWithCompletionHandler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v11;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state: An error occurred while trying to read the occupied cooling point: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_18;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v13;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state: Got coolPointValue value: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v14 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  v15 = objc_msgSend(*(id *)(a1 + 48), "integerValue");
  v16 = objc_msgSend(v5, "integerValue");
  if (v15 >= v16)
    v17 = v16;
  else
    v17 = v15;
  if (v14 > v17)
  {
    v18 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
    v19 = objc_msgSend(*(id *)(a1 + 48), "integerValue");
    v20 = objc_msgSend(v5, "integerValue");
    v21 = v19 <= v20 ? v20 : v19;
    if (v18 < v21)
    {
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_18:
      v12();
      goto LABEL_19;
    }
  }
  v22 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  if (v22 < objc_msgSend(*(id *)(a1 + 48), "integerValue"))
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_18;
  }
  v23 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  if (v23 <= objc_msgSend(v5, "integerValue"))
    v24 = &unk_250F3F9C0;
  else
    v24 = &unk_250F3F9F0;
  (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v24, 0);
LABEL_19:

}

uint64_t __98__HMMTRThermostat_updatedValuePluginCurrentHeatingCoolingStateForAttributeReport_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__HMMTRThermostat_updatedValueForAttributeReport_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v11 = objc_msgSend(v5, "integerValue");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = *(void **)(a1 + 40);
    else
      v13 = 0;
    v14 = v13;

    if (v11 == 3)
    {
      objc_msgSend(*(id *)(a1 + 48), "cluster");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToNumber:", &unk_250F3F978))
      {
        objc_msgSend(*(id *)(a1 + 48), "attribute");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToNumber:", &unk_250F3F9A8);

        if (v25)
        {
          v18 = (void *)MEMORY[0x242656984]();
          v19 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = *(void **)(a1 + 40);
            v29 = 138543618;
            v30 = v21;
            v31 = 2112;
            v32 = v26;
            v23 = "%{public}@UpdateValueForAttributeReport: Report OccupiedCoolingSetpoint %@";
            goto LABEL_18;
          }
LABEL_19:

          objc_autoreleasePoolPop(v18);
          v27 = *(_QWORD *)(a1 + 64);
          +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v14);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD))(v27 + 16))(v27, v28, *(_QWORD *)(a1 + 56));

LABEL_22:
          goto LABEL_23;
        }
LABEL_21:
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        goto LABEL_22;
      }
    }
    else
    {
      if (v11 != 4)
        goto LABEL_21;
      objc_msgSend(*(id *)(a1 + 48), "cluster");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToNumber:", &unk_250F3F978))
      {
        objc_msgSend(*(id *)(a1 + 48), "attribute");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_250F3F990);

        if (v17)
        {
          v18 = (void *)MEMORY[0x242656984]();
          v19 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = *(void **)(a1 + 40);
            v29 = 138543618;
            v30 = v21;
            v31 = 2112;
            v32 = v22;
            v23 = "%{public}@UpdateValueForAttributeReport: Report OccupiedHeatingSetpoint %@";
LABEL_18:
            _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v29, 0x16u);

            goto LABEL_19;
          }
          goto LABEL_19;
        }
        goto LABEL_21;
      }
    }

    goto LABEL_21;
  }
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v10;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@UpdateValueForAttributeReport: An error occurred while trying to read the current System Mode: %@", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
LABEL_23:

}

void __86__HMMTRThermostat_readAttributeOccupiedHeatingOrCoolingSetpointWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = (uint64_t)v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Read Occupied Heating/Cooling Setpoint: An error occurred while trying to read the System Mode: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v11 = objc_msgSend(v5, "integerValue");
    if (v11 == 3)
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __86__HMMTRThermostat_readAttributeOccupiedHeatingOrCoolingSetpointWithCompletionHandler___block_invoke_10;
      v25[3] = &unk_250F24178;
      v15 = *(void **)(a1 + 40);
      v26 = *(id *)(a1 + 32);
      v27 = v15;
      objc_msgSend(v26, "readAttributeOccupiedCoolingSetpointWithCompletionHandler:", v25);
      v14 = v27;
    }
    else
    {
      v12 = v11;
      if (v11 == 4)
      {
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __86__HMMTRThermostat_readAttributeOccupiedHeatingOrCoolingSetpointWithCompletionHandler___block_invoke_9;
        v28[3] = &unk_250F24178;
        v13 = *(void **)(a1 + 40);
        v29 = *(id *)(a1 + 32);
        v30 = v13;
        objc_msgSend(v29, "readAttributeOccupiedHeatingSetpointWithCompletionHandler:", v28);
        v14 = v30;
      }
      else
      {
        v16 = (void *)MEMORY[0x242656984]();
        v17 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v19;
          v33 = 2048;
          v34 = v12;
          _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Read Occupied Heating/Cooling Setpoint: Thermostat Setpoint should not be read in unexpected system mode: %ld", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __86__HMMTRThermostat_readAttributeOccupiedHeatingOrCoolingSetpointWithCompletionHandler___block_invoke_11;
        v21[3] = &unk_250F24150;
        v20 = *(void **)(a1 + 40);
        v22 = *(id *)(a1 + 32);
        v23 = 0;
        v24 = v20;
        objc_msgSend(v22, "readAttributeLocalTemperatureWithCompletionHandler:", v21);

        v14 = v23;
      }
    }

  }
}

void __86__HMMTRThermostat_readAttributeOccupiedHeatingOrCoolingSetpointWithCompletionHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read Occupied Heating/Cooling Setpoint: OccupiedHeatingSetpoint is %@, error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86__HMMTRThermostat_readAttributeOccupiedHeatingOrCoolingSetpointWithCompletionHandler___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read Occupied Heating/Cooling Setpoint: OccupiedCoolingSetpoint is %@, error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86__HMMTRThermostat_readAttributeOccupiedHeatingOrCoolingSetpointWithCompletionHandler___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138543874;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read Occupied Heating/Cooling Setpoint: Read local temperature %@, error: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void (**v22)(id, void *);
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v11 = objc_msgSend(v5, "integerValue");
    if (v11)
    {
      v12 = v11;
      if (v11 == 3)
      {
        v19 = a1[4];
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_6;
        v24[3] = &unk_250F24150;
        v24[4] = v19;
        v26 = a1[6];
        v25 = a1[5];
        objc_msgSend(v19, "readAttributeAbsMinCoolSetpointLimitWithCompletionHandler:", v24);

        v14 = v26;
        goto LABEL_13;
      }
      if (v11 == 4)
      {
        v13 = a1[4];
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_1;
        v27[3] = &unk_250F24150;
        v27[4] = v13;
        v29 = a1[6];
        v28 = a1[5];
        objc_msgSend(v13, "readAttributeAbsMinHeatSetpointLimitWithCompletionHandler:", v27);

        v14 = v29;
LABEL_13:

        goto LABEL_18;
      }
      v15 = (void *)MEMORY[0x242656984]();
      v16 = a1[4];
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2048;
        v33 = v12;
        _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint: Thermostat Setpoint cannot be set in unexpected system mode: %ld", buf, 0x16u);

      }
    }
    else
    {
      v15 = (void *)MEMORY[0x242656984]();
      v16 = a1[4];
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v18;
        _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint: Thermostat Setpoint cannot be set when system is off", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v15);
    v22 = (void (**)(id, void *))a1[6];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 5, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2](v22, v23);

    goto LABEL_18;
  }
  v7 = (void *)MEMORY[0x242656984]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v10;
    v32 = 2112;
    v33 = (uint64_t)v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint: An error occurred while trying to read the System Mode: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  (*((void (**)(void))a1[6] + 2))();
LABEL_18:

}

void __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_1(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint: An error occurred while trying to read the min heat setpoint: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v11 = a1[4];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_2;
    v12[3] = &unk_250F24240;
    v12[4] = v11;
    v15 = a1[6];
    v13 = a1[5];
    v14 = v5;
    objc_msgSend(v11, "readAttributeAbsMaxHeatSetpointLimitWithCompletionHandler:", v12);

  }
}

void __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_6(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint: An error occurred while trying to read the min cool setpoint: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v11 = a1[4];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_7;
    v12[3] = &unk_250F24240;
    v12[4] = v11;
    v15 = a1[6];
    v13 = a1[5];
    v14 = v5;
    objc_msgSend(v11, "readAttributeAbsMaxCoolSetpointLimitWithCompletionHandler:", v12);

  }
}

void __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_7(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v10;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint: An error occurred while trying to read the max cool setpoint: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v11 = a1[5];
    v12 = objc_msgSend(v11, "integerValue");
    if (v12 >= objc_msgSend(a1[6], "integerValue"))
    {
      v13 = v11;
    }
    else
    {
      v13 = a1[6];

      v14 = (void *)MEMORY[0x242656984]();
      v15 = a1[4];
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint: Target cool temperature out of supported min setpoint limit. Setting it to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    v18 = objc_msgSend(v13, "integerValue");
    if (v18 <= objc_msgSend(v5, "integerValue"))
    {
      v19 = v13;
    }
    else
    {
      v19 = v5;

      v20 = (void *)MEMORY[0x242656984]();
      v21 = a1[4];
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2112;
        v32 = v19;
        _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint: Target cool temperature out of supported max setpoint limit. Setting it to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_8;
    v25[3] = &unk_250F228C0;
    v24 = a1[5];
    v26 = a1[4];
    v27 = v24;
    v28 = a1[7];
    objc_msgSend(v26, "writeAttributeOccupiedCoolingSetpointWithValue:completionHandler:", v19, v25);

  }
}

void __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint: Wrote to OccupiedCoolingSetpoint cluster value %@, error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v10;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint: An error occurred while trying to read the max heat setpoint: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v11 = a1[5];
    v12 = objc_msgSend(v11, "integerValue");
    if (v12 >= objc_msgSend(a1[6], "integerValue"))
    {
      v13 = v11;
    }
    else
    {
      v13 = a1[6];

      v14 = (void *)MEMORY[0x242656984]();
      v15 = a1[4];
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint: Target heat temperature out of supported min setpoint limit. Setting it to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    v18 = objc_msgSend(v13, "integerValue");
    if (v18 <= objc_msgSend(v5, "integerValue"))
    {
      v19 = v13;
    }
    else
    {
      v19 = v5;

      v20 = (void *)MEMORY[0x242656984]();
      v21 = a1[4];
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2112;
        v32 = v19;
        _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint: Target heat temperature out of supported max setpoint limit. Setting it to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }
    v24 = a1[4];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_3;
    v26[3] = &unk_250F228C0;
    v26[4] = v24;
    v27 = v19;
    v28 = a1[7];
    v25 = v19;
    objc_msgSend(v24, "writeAttributeOccupiedHeatingSetpointWithValue:completionHandler:", v25, v26);

  }
}

void __93__HMMTRThermostat_writeAttributeOccupiedHeatingOrCoolingSetpointWithValue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint: Wrote to OccupiedHeatingSetpoint cluster value %@, error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
