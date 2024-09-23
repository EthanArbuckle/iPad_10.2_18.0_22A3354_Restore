@implementation HMAccessorySettingConstraint(HMDBackingStoreModelObject)

- (char)initWithModel:()HMDBackingStoreModelObject
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char *v18;
  NSObject *v19;
  void *v20;
  char *v21;
  void *v22;
  char *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  void *v29;
  char *v30;
  NSObject *v31;
  void *v32;
  HMDAssertionLogEvent *v33;
  void *v34;
  void *v35;
  char *v36;
  NSObject *v37;
  void *v38;
  HMDAssertionLogEvent *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_19;
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = a1;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v32;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Model missing 'type'", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    v33 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Model missing 'type'"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "submitLogEvent:", v33);

  }
  objc_msgSend(v5, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    a1 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v26;
      v27 = "%{public}@Model missing 'type'";
LABEL_17:
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);

    }
LABEL_18:

    objc_autoreleasePoolPop(v24);
LABEL_19:
    v23 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v5, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v5, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v35 = (void *)MEMORY[0x1D17BA0A0]();
    v36 = a1;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v38;
      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Model missing 'value'", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v35);
    v39 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Model missing 'value'"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "submitLogEvent:", v39);

  }
  objc_msgSend(v5, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    a1 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v26;
      v27 = "%{public}@Model missing 'value'";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v12 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend((id)objc_opt_class(), "supportedValueClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v13, v14, &v41);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v41;

  if (!v15)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v20;
      v44 = 2112;
      v45 = v16;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting constraint model supported value from the model's value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

  v21 = (char *)objc_msgSend(a1, "initWithType:value:", v9, v15);
  if (v21)
  {
    objc_msgSend(v5, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "getUUIDBytes:", &v21[*MEMORY[0x1E0CBA9A0]]);

  }
  a1 = v21;

  v23 = a1;
LABEL_20:

  return v23;
}

- (HMDAccessorySettingConstraintModel)modelWithParentIdentifier:()HMDBackingStoreModelObject
{
  id v4;
  HMDAccessorySettingConstraintModel *v5;
  void *v6;
  HMDAccessorySettingConstraintModel *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = [HMDAccessorySettingConstraintModel alloc];
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 0, v6, v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingConstraintModel setType:](v7, "setType:", v8);

  objc_msgSend(a1, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingConstraintModel setValue:](v7, "setValue:", v10);

  return v7;
}

@end
