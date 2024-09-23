@implementation HMMTRFanControl

+ (id)logCategory
{
  if (logCategory__hmf_once_t14 != -1)
    dispatch_once(&logCategory__hmf_once_t14, &__block_literal_global_7470);
  return (id)logCategory__hmf_once_v15;
}

void __30__HMMTRFanControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15;
  logCategory__hmf_once_v15 = v0;

}

- (void)readAttributePluginRockSettingWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__7515;
  v9[4] = __Block_byref_object_dispose__7516;
  v10 = &unk_250F3FA80;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__HMMTRFanControl_readAttributePluginRockSettingWithCompletionHandler___block_invoke;
  v6[3] = &unk_250F22250;
  v6[4] = self;
  v8 = v9;
  v5 = v4;
  v7 = v5;
  -[MTRBaseClusterFanControl readAttributeRockSupportWithCompletion:](self, "readAttributeRockSupportWithCompletion:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)writeAttributePluginRockSettingWithValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRFanControl *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToNumber:", &unk_250F3FAB0))
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Write attribute RockSetting 0", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[MTRBaseClusterFanControl writeAttributeRockSettingWithValue:completionHandler:](v9, "writeAttributeRockSettingWithValue:completionHandler:", &unk_250F3FA80, v7);
  }
  else if (objc_msgSend(v6, "isEqualToNumber:", &unk_250F3FA98))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __78__HMMTRFanControl_writeAttributePluginRockSettingWithValue_completionHandler___block_invoke;
    v12[3] = &unk_250F24178;
    v12[4] = self;
    v13 = v7;
    -[MTRBaseClusterFanControl readAttributeRockSupportWithCompletion:](self, "readAttributeRockSupportWithCompletion:", v12);

  }
}

- (void)updatedValuePluginRockSettingForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRFanControl *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  void *v28;
  void (**v29)(id, _QWORD, id);
  _QWORD v30[5];
  id v31;
  void (**v32)(id, _QWORD, id);
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
  v7 = (void (**)(id, _QWORD, id))a4;
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
    v29 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v28 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDDB478];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v34 = v14;
    v35 = 2112;
    v36 = v15;
    v37 = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v17;
    v41 = 2112;
    v42 = v19;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v11 = v28;
    v7 = v29;
  }
  else
  {
    v18 = *MEMORY[0x24BDDB478];
  }

  objc_autoreleasePoolPop(v11);
  objc_msgSend(v6, "objectForKeyedSubscript:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v21 = v6;
  else
    v21 = 0;
  v22 = v21;

  objc_msgSend(v10, "cluster");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEqualToNumber:", &unk_250F3FAC8) & 1) == 0)
  {

LABEL_16:
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 9);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v27);
    goto LABEL_17;
  }
  objc_msgSend(v10, "attribute");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToNumber:", &unk_250F3FAE0);

  if (!v25)
    goto LABEL_16;
  +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v22);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (!v26)
    goto LABEL_16;
  v27 = v26;
  if (objc_msgSend(v26, "isEqualToNumber:", &unk_250F3FA80))
  {
    ((void (**)(id, void *, id))v7)[2](v7, &unk_250F3FAB0, 0);
  }
  else
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __83__HMMTRFanControl_updatedValuePluginRockSettingForAttributeReport_responseHandler___block_invoke;
    v30[3] = &unk_250F24150;
    v30[4] = v12;
    v31 = v27;
    v32 = v7;
    v27 = v27;
    -[MTRBaseClusterFanControl readAttributeRockSupportWithCompletion:](v12, "readAttributeRockSupportWithCompletion:", v30);

  }
LABEL_17:

}

- (void)readAttributePluginFanModeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__HMMTRFanControl_readAttributePluginFanModeWithCompletionHandler___block_invoke;
  v6[3] = &unk_250F24178;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MTRBaseClusterFanControl readAttributeFanModeWithCompletion:](self, "readAttributeFanModeWithCompletion:", v6);

}

- (void)writeAttributePluginFanModeWithValue:(id)a3 completionHandler:(id)a4
{
  unsigned int v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  v6 = objc_msgSend(a3, "intValue");
  if (v6 > 2)
    v7 = 0;
  else
    v7 = qword_250F22290[v6];
  -[MTRBaseClusterFanControl writeAttributeFanModeWithValue:completionHandler:](self, "writeAttributeFanModeWithValue:completionHandler:", v7, v8);

}

- (void)updatedValuePluginFanModeForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRFanControl *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  HMMTRFanControl *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
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
    v36 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v35 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDDB478];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v45 = v14;
    v46 = 2112;
    v47 = v15;
    v48 = 2112;
    v49 = v16;
    v50 = 2112;
    v51 = v17;
    v52 = 2112;
    v53 = v20;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v11 = v19;
    v12 = v35;

    v7 = v36;
  }
  else
  {
    v18 = *MEMORY[0x24BDDB478];
  }

  objc_autoreleasePoolPop(v11);
  objc_msgSend(v6, "objectForKeyedSubscript:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    v22 = v6;
  else
    v22 = 0;
  v23 = v22;

  objc_msgSend(v10, "cluster");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToNumber:", &unk_250F3FAC8);

  if ((v25 & 1) != 0)
  {
    objc_msgSend(v10, "attribute");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToNumber:", &unk_250F3FB58);

    if (v27)
    {
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v23);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        if (objc_msgSend(v28, "isEqualToNumber:", &unk_250F3FAF8))
        {
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __79__HMMTRFanControl_updatedValuePluginFanModeForAttributeReport_responseHandler___block_invoke;
          v41[3] = &unk_250F24150;
          v41[4] = v12;
          v42 = v10;
          v43 = v7;
          -[MTRBaseClusterFanControl readAttributePercentCurrentWithCompletion:](v12, "readAttributePercentCurrentWithCompletion:", v41);

          v30 = v42;
LABEL_18:

LABEL_26:
          goto LABEL_27;
        }
        v33 = objc_msgSend(v29, "unsignedIntValue");
        if ((v33 - 1) < 3)
        {
          (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &unk_250F3FB10, 0);
          goto LABEL_26;
        }
        if (!v33)
        {
          (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &unk_250F3FAB0, 0);
          goto LABEL_26;
        }
      }
      goto LABEL_25;
    }
    objc_msgSend(v10, "attribute");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToNumber:", &unk_250F3FB70);

    if (v32)
    {
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v23);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __79__HMMTRFanControl_updatedValuePluginFanModeForAttributeReport_responseHandler___block_invoke_20;
        v37[3] = &unk_250F24240;
        v37[4] = v12;
        v38 = v10;
        v40 = v7;
        v39 = v29;
        -[MTRBaseClusterFanControl readAttributeFanModeWithCompletion:](v12, "readAttributeFanModeWithCompletion:", v37);

        v30 = v38;
        goto LABEL_18;
      }
LABEL_25:
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 12);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v34);

      goto LABEL_26;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v29);
LABEL_27:

}

void __79__HMMTRFanControl_updatedValuePluginFanModeForAttributeReport_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(*(id *)(a1 + 40), "endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read attribute PercentCurrent on endpoint %@ completed with value %@, error %@", (uint8_t *)&v15, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  else
  {
    if (objc_msgSend(v5, "unsignedIntValue"))
      v14 = &unk_250F3FB10;
    else
      v14 = &unk_250F3FA98;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 0);
  }

}

void __79__HMMTRFanControl_updatedValuePluginFanModeForAttributeReport_responseHandler___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(*(id *)(a1 + 40), "endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read attribute FanMode on endpoint %@ completed with value %@, error %@", (uint8_t *)&v20, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    v12 = *(_QWORD *)(a1 + 56);
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = 14;
LABEL_5:
    objc_msgSend(v13, "hapErrorWithCode:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v15);

    goto LABEL_18;
  }
  v16 = objc_msgSend(*(id *)(a1 + 48), "isEqualToNumber:", &unk_250F3FA80);
  v17 = objc_msgSend(v5, "isEqualToNumber:", &unk_250F3FAF8);
  if (!v16)
  {
    if (v17)
    {
      (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), &unk_250F3FB10, 0);
      goto LABEL_18;
    }
    v19 = objc_msgSend(v5, "isEqualToNumber:", &unk_250F3FB28);
    v12 = *(_QWORD *)(a1 + 56);
    if (!v19)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, &unk_250F3FB10, 0);
      goto LABEL_18;
    }
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = 12;
    goto LABEL_5;
  }
  if (v17)
  {
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), &unk_250F3FA98, 0);
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToNumber:", &unk_250F3FB28))
      v18 = &unk_250F3FAB0;
    else
      v18 = 0;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v18, 0);
  }
LABEL_18:

}

void __67__HMMTRFanControl_readAttributePluginFanModeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void (*v11)(void);
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543874;
    v20 = v10;
    v21 = 2112;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read attribute FanMode completed with value %@, error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToNumber:", &unk_250F3FAF8))
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __67__HMMTRFanControl_readAttributePluginFanModeWithCompletionHandler___block_invoke_14;
      v16[3] = &unk_250F24178;
      v12 = *(void **)(a1 + 40);
      v17 = *(id *)(a1 + 32);
      v18 = v12;
      objc_msgSend(v17, "readAttributePercentCurrentWithCompletion:", v16);

      goto LABEL_6;
    }
    v13 = objc_msgSend(v5, "unsignedIntValue");
    if ((v13 - 1) >= 3)
    {
      if (v13)
      {
        v14 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

        goto LABEL_6;
      }
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
  }
  v11();
LABEL_6:

}

void __67__HMMTRFanControl_readAttributePluginFanModeWithCompletionHandler___block_invoke_14(uint64_t a1, void *a2, void *a3)
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
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
    v14 = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read attribute PercentCurrent completed with value %@, error %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

  }
  else
  {
    if (objc_msgSend(v5, "unsignedIntValue"))
      v13 = &unk_250F3FB10;
    else
      v13 = &unk_250F3FA98;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v13, 0);
  }

}

void __83__HMMTRFanControl_updatedValuePluginRockSettingForAttributeReport_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
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
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read attribute RockSupport completed with value %@, error %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v11 = objc_msgSend(v5, "unsignedIntValue");
    if ((objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue") & v11) != 0)
      v12 = &unk_250F3FA98;
    else
      v12 = &unk_250F3FAB0;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v12, 0);
  }

}

void __78__HMMTRFanControl_writeAttributePluginRockSettingWithValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
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
    v19 = 138543874;
    v20 = v10;
    v21 = 2112;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read attribute RockSupport completed with value %@, error %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v5, "unsignedIntValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Write attribute RockSetting %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v5, "unsignedIntValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "writeAttributeRockSettingWithValue:completionHandler:", v12, *(_QWORD *)(a1 + 40));
  }

}

void __71__HMMTRFanControl_readAttributePluginRockSettingWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Read attribute RockSupport completed with value %@, error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  if (!v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__HMMTRFanControl_readAttributePluginRockSettingWithCompletionHandler___block_invoke_1;
  v15[3] = &unk_250F22250;
  v12 = *(void **)(a1 + 40);
  v16 = *(id *)(a1 + 32);
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 48);
  v17 = v13;
  v18 = v14;
  objc_msgSend(v16, "readAttributeRockSettingWithCompletion:", v15);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__HMMTRFanControl_readAttributePluginRockSettingWithCompletionHandler___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
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
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Read attribute RockSetting completed with value %@, error %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "unsignedIntValue");
    if ((objc_msgSend(v5, "unsignedIntValue") & v11) != 0)
      v12 = &unk_250F3FA98;
    else
      v12 = &unk_250F3FAB0;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v12, 0);
  }

}

@end
