@implementation HMDAccessorySettingsControllerDependencyFactory

- (id)timerWithReason:(int64_t)a3 interval:(double)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 16, a4);
}

- (id)settingModelForUpdateWithIdentifier:(id)a3 parent:(id)a4 value:(id)a5 configNumber:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HMDAccessorySettingModel *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDAccessorySettingModel alloc], "initWithObjectChangeType:uuid:parentUUID:", 2, v12, v11);

  encodeRootObject();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySettingModel setValue:](v13, "setValue:", v14);
  -[HMDAccessorySettingModel setConfigurationVersion:](v13, "setConfigurationVersion:", v9);

  return v13;
}

- (id)createMessageHandlerWithQueue:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  HMDAccessorySettingsMessageHandlerRoar *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDAccessorySettingsMessageHandler initWithQueue:delegate:]([HMDAccessorySettingsMessageHandlerRoar alloc], "initWithQueue:delegate:", v6, v5);

  return v7;
}

- (void)assertWithCondition:(BOOL)a3 message:(id)a4
{
  id v6;
  void *v7;
  HMDAccessorySettingsControllerDependencyFactory *v8;
  NSObject *v9;
  void *v10;
  HMDAssertionLogEvent *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!a3)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("%@"), v6);
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submitLogEvent:", v11);

  }
}

@end
