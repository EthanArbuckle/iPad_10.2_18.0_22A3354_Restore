@implementation HMDPresenceNotificationConditionHandler

- (HMDPresenceNotificationConditionHandler)initWithHome:(id)a3
{
  id v4;
  HMDPresenceNotificationConditionDefaultPresenceProvider *v5;
  HMDFeaturesDataSource *v6;
  HMDPresenceNotificationConditionHandler *v7;

  v4 = a3;
  v5 = objc_alloc_init(HMDPresenceNotificationConditionDefaultPresenceProvider);
  v6 = objc_alloc_init(HMDFeaturesDataSource);
  v7 = -[HMDPresenceNotificationConditionHandler initWithHome:presenceProvider:featuresDataSource:](self, "initWithHome:presenceProvider:featuresDataSource:", v4, v5, v6);

  return v7;
}

- (HMDPresenceNotificationConditionHandler)initWithHome:(id)a3 presenceProvider:(id)a4 featuresDataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDPresenceNotificationConditionHandler *v11;
  HMDPresenceNotificationConditionHandler *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDPresenceNotificationConditionHandler;
  v11 = -[HMDPresenceNotificationConditionHandler init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_home, v8);
    objc_storeStrong((id *)&v12->_presenceProvider, a4);
    objc_storeStrong((id *)&v12->_featuresDataSource, a5);
  }

  return v12;
}

- (BOOL)canHandleCondition:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = objc_opt_isKindOfClass() & (v3 != 0);

  return v4;
}

- (BOOL)conditionPasses:(id)a3 registrationUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDPresenceNotificationConditionHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  HMDPresenceEvent *v29;
  void *v30;
  HMDPresenceEvent *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  HMDPresenceNotificationConditionHandler *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  HMDPresenceNotificationConditionHandler *v42;
  NSObject *v43;
  void *v44;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  HMDPresenceEvent *v60;
  __int16 v61;
  void *v62;
  _QWORD v63[5];
  _QWORD v64[7];

  v64[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v52 = a4;
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "presenceEventType");
    v10 = objc_msgSend(v9, "presenceEventUserType");
    objc_msgSend(v9, "userUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_map:", &__block_literal_global_233465);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == 1)
    {
      objc_msgSend(v52, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = v12;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v18;
        v55 = 2112;
        v56 = v13;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Replacing HMPresenceEventUserTypeCurrentUser with HMPresenceEventUserTypeCustomUsers and userUUID: %@", buf, 0x16u);

        v12 = v17;
      }

      objc_autoreleasePoolPop(v14);
      v19 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v13, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithObject:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v21;
    }
    presenceTypeForEventTypeAndGranularity();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD78E8], "activationGranularityWithValue:", granularityForEventType());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = CFSTR("kEventTriggerEndEvent");
    v63[1] = CFSTR("kEventTriggerTypeKey");
    v64[0] = &unk_24E96D370;
    v64[1] = CFSTR("kEventTriggerTypePresenceEventKey");
    v64[2] = v22;
    v63[2] = CFSTR("kPresenceEventPresence");
    v63[3] = CFSTR("kPresenceEventActivationGranularity");
    v50 = v23;
    objc_msgSend(v23, "number");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v24;
    v63[4] = CFSTR("kPresenceEventUsers");
    v51 = v12;
    objc_msgSend(v12, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v64[4] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 5);
    v26 = objc_claimAutoreleasedReturnValue();

    -[HMDPresenceNotificationConditionHandler home](self, "home");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)v26;
    +[HMDPresenceEventModel eventModelWithDictionary:home:eventTriggerUUID:message:](HMDPresenceEventModel, "eventModelWithDictionary:home:eventTriggerUUID:message:", v26, v27, 0, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = [HMDPresenceEvent alloc];
    -[HMDPresenceNotificationConditionHandler featuresDataSource](self, "featuresDataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)v28;
    v31 = -[HMDPresenceEvent initWithModel:home:featuresDataSource:](v29, "initWithModel:home:featuresDataSource:", v28, v27, v30);

    -[HMDPresenceNotificationConditionHandler presenceProvider](self, "presenceProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "presenceForHome:", v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = -[HMDPresenceEvent evaluateWithHomePresence:](v31, "evaluateWithHomePresence:", v33);
    v35 = (void *)MEMORY[0x227676638]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = v22;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v47 = v9;
      v39 = v7;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v54 = v38;
      v55 = 2112;
      v56 = v40;
      v57 = 2112;
      v58 = v39;
      v59 = 2112;
      v60 = v31;
      v61 = 2112;
      v62 = v33;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Condition passes: %@ condition: %@ Presence Event: %@ Home Presence: %@", buf, 0x34u);

      v7 = v39;
      v9 = v47;

      v22 = v46;
    }

    objc_autoreleasePoolPop(v35);
  }
  else
  {
    v41 = (void *)MEMORY[0x227676638]();
    v42 = self;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v44;
      v55 = 2112;
      v56 = v7;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Attempting to evaluate a non-presence condition: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v41);
    v34 = 0;
  }

  return v34;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMDPresenceNotificationConditionPresenceProvider)presenceProvider
{
  return (HMDPresenceNotificationConditionPresenceProvider *)objc_getProperty(self, a2, 16, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_presenceProvider, 0);
  objc_destroyWeak((id *)&self->_home);
}

uint64_t __76__HMDPresenceNotificationConditionHandler_conditionPasses_registrationUser___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_233481 != -1)
    dispatch_once(&logCategory__hmf_once_t5_233481, &__block_literal_global_14_233482);
  return (id)logCategory__hmf_once_v6_233483;
}

void __54__HMDPresenceNotificationConditionHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_233483;
  logCategory__hmf_once_v6_233483 = v0;

}

@end
