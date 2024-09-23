@implementation HMDUserActionPredictionModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_57492 != -1)
    dispatch_once(&hmbProperties_onceToken_57492, &__block_literal_global_57493);
  return (id)hmbProperties_properties_57494;
}

+ (BOOL)hmbExcludeFromCloudStorage
{
  return 1;
}

void __45__HMDUserActionPredictionModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[7];
  _QWORD v45[9];

  v45[7] = *MEMORY[0x24BDAC8D0];
  v44[0] = CFSTR("predictionTargetUUID");
  v0 = (void *)MEMORY[0x24BE4ECB8];
  v1 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "excludeFromCloudStorage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fieldWithClass:options:", v1, v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v34;
  v44[1] = CFSTR("targetServiceUUID");
  v2 = (void *)MEMORY[0x24BE4ECB8];
  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "excludeFromCloudStorage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v33;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fieldWithClass:options:", v3, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v31;
  v44[2] = CFSTR("targetServiceGroupUUID");
  v4 = (void *)MEMORY[0x24BE4ECB8];
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "excludeFromCloudStorage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fieldWithClass:options:", v5, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v28;
  v44[3] = CFSTR("targetGroupUUID");
  v6 = (void *)MEMORY[0x24BE4ECB8];
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "excludeFromCloudStorage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fieldWithClass:options:", v7, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v25;
  v44[4] = CFSTR("type");
  v8 = (void *)MEMORY[0x24BE4ECB8];
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "excludeFromCloudStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fieldWithClass:options:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v12;
  v44[5] = CFSTR("groupType");
  v13 = (void *)MEMORY[0x24BE4ECB8];
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "excludeFromCloudStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fieldWithClass:options:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v17;
  v44[6] = CFSTR("predictionScore");
  v18 = (void *)MEMORY[0x24BE4ECB8];
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE4ECC0], "excludeFromCloudStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fieldWithClass:options:", v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 7);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)hmbProperties_properties_57494;
  hmbProperties_properties_57494 = v23;

}

- (HMDUserActionPredictionModel)initWithUserActionPrediction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDUserActionPredictionModel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDUserActionPredictionModel *v28;
  void *v29;
  HMDUserActionPredictionModel *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  HMDUserActionPredictionModel *v36;
  NSObject *v37;
  void *v38;
  HMDAssertionLogEvent *v39;
  void *v40;
  int v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  HMDUserActionPredictionModel *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "predictionTargetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetServiceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)MEMORY[0x24BDD1880];
  v8 = v5;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithUUIDString:", CFSTR("D73F97DF-5711-4EAA-9CA4-EB5C028A5EE8"));
  v10 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v8, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_UUIDWithNamespace:data:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v14 = (void *)MEMORY[0x24BDD1880];
    objc_msgSend(v6, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmf_UUIDWithNamespace:data:", v13, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("D73F97DF-5711-4EAA-9CA4-EB5C028A5EE8"));
  v19 = -[HMBModel initWithModelID:parentModelID:](self, "initWithModelID:parentModelID:", v13, v18);
  objc_msgSend(v4, "predictionTargetUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionModel setPredictionTargetUUID:](v19, "setPredictionTargetUUID:", v20);

  objc_msgSend(v4, "targetServiceUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionModel setTargetServiceUUID:](v19, "setTargetServiceUUID:", v21);

  objc_msgSend(v4, "targetGroupUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionModel setTargetGroupUUID:](v19, "setTargetGroupUUID:", v22);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "predictionType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionModel setType:](v19, "setType:", v23);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "targetGroupType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionModel setGroupType:](v19, "setGroupType:", v24);

  v25 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "predictionScore");
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionModel setPredictionScore:](v19, "setPredictionScore:", v26);

  -[HMDUserActionPredictionModel setTargetServiceGroupUUID:](v19, "setTargetServiceGroupUUID:", 0);
  -[HMBModel hmbModelID](v19, "hmbModelID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = v19;
  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = v19;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543874;
      v42 = v32;
      v43 = 2112;
      v44 = v4;
      v45 = 2112;
      v46 = v30;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@User Action Prediction: %@, resulted in nil hmbModelID for prediction model: %@", (uint8_t *)&v41, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    -[HMBModel hmbModelID](v30, "hmbModelID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = v30;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543362;
        v42 = v38;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: User Action Prediction ModelID should not be nil", (uint8_t *)&v41, 0xCu);

      }
      objc_autoreleasePoolPop(v35);
      v39 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("User Action Prediction ModelID should not be nil"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "submitLogEvent:", v39);

    }
    v28 = 0;
  }

  return v28;
}

- (id)userActionPrediction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x24BDD7A78]);
  -[HMDUserActionPredictionModel predictionTargetUUID](self, "predictionTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionModel targetServiceUUID](self, "targetServiceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionModel targetGroupUUID](self, "targetGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActionPredictionModel groupType](self, "groupType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  -[HMDUserActionPredictionModel type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  -[HMDUserActionPredictionModel predictionScore](self, "predictionScore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v12 = (void *)objc_msgSend(v3, "initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:", v4, v5, v6, v8, v10);

  return v12;
}

@end
