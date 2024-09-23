@implementation HMSiriEndpointApplyOnboardingSelectionsPayload

- (HMSiriEndpointApplyOnboardingSelectionsPayload)initWithAccessoryUUID:(id)a3 onboardingSelections:(id)a4
{
  id v7;
  id v8;
  HMSiriEndpointApplyOnboardingSelectionsPayload *v9;
  HMSiriEndpointApplyOnboardingSelectionsPayload *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMSiriEndpointApplyOnboardingSelectionsPayload;
  v9 = -[HMSiriEndpointApplyOnboardingSelectionsPayload init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryUUID, a3);
    objc_storeStrong((id *)&v10->_onboardingSelections, a4);
  }

  return v10;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("HMAccessoryUUIDPayloadKey");
  -[HMSiriEndpointApplyOnboardingSelectionsPayload accessoryUUID](self, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("HMSiriEndpointOnboardingSelectionsPayloadKey");
  v10[0] = v4;
  -[HMSiriEndpointApplyOnboardingSelectionsPayload onboardingSelections](self, "onboardingSelections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMSiriEndpointApplyOnboardingSelectionsPayload)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMSiriEndpointOnboardingSelections *v7;
  HMSiriEndpointOnboardingSelections *v8;
  HMSiriEndpointApplyOnboardingSelectionsPayload *v9;
  HMSiriEndpointApplyOnboardingSelectionsPayload *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("HMAccessoryUUIDPayloadKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("HMSiriEndpointOnboardingSelectionsPayloadKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMSiriEndpointOnboardingSelections initWithPayload:]([HMSiriEndpointOnboardingSelections alloc], "initWithPayload:", v6);
  v8 = v7;
  if (v5 && v7)
  {
    v9 = -[HMSiriEndpointApplyOnboardingSelectionsPayload initWithAccessoryUUID:onboardingSelections:](self, "initWithAccessoryUUID:onboardingSelections:", v5, v7);
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to decode apply onboarding selections payload: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointApplyOnboardingSelectionsPayload accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryUUID"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointApplyOnboardingSelectionsPayload onboardingSelections](self, "onboardingSelections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("onboardingSelections"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (BOOL)isEqual:(id)a3
{
  HMSiriEndpointApplyOnboardingSelectionsPayload *v4;
  HMSiriEndpointApplyOnboardingSelectionsPayload *v5;
  HMSiriEndpointApplyOnboardingSelectionsPayload *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMSiriEndpointApplyOnboardingSelectionsPayload *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMSiriEndpointApplyOnboardingSelectionsPayload accessoryUUID](self, "accessoryUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSiriEndpointApplyOnboardingSelectionsPayload accessoryUUID](v6, "accessoryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        -[HMSiriEndpointApplyOnboardingSelectionsPayload onboardingSelections](self, "onboardingSelections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMSiriEndpointApplyOnboardingSelectionsPayload onboardingSelections](v6, "onboardingSelections");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMSiriEndpointApplyOnboardingSelectionsPayload accessoryUUID](self, "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMSiriEndpointOnboardingSelections)onboardingSelections
{
  return (HMSiriEndpointOnboardingSelections *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingSelections, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_49783 != -1)
    dispatch_once(&logCategory__hmf_once_t1_49783, &__block_literal_global_49784);
  return (id)logCategory__hmf_once_v2_49785;
}

void __61__HMSiriEndpointApplyOnboardingSelectionsPayload_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_49785;
  logCategory__hmf_once_v2_49785 = v0;

}

@end
