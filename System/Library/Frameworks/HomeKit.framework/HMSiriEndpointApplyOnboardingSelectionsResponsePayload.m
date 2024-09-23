@implementation HMSiriEndpointApplyOnboardingSelectionsResponsePayload

- (HMSiriEndpointApplyOnboardingSelectionsResponsePayload)initWithOnboardingResult:(int64_t)a3
{
  HMSiriEndpointApplyOnboardingSelectionsResponsePayload *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMSiriEndpointApplyOnboardingSelectionsResponsePayload;
  result = -[HMSiriEndpointApplyOnboardingSelectionsResponsePayload init](&v5, sel_init);
  if (result)
    result->_onboardingResult = a3;
  return result;
}

- (id)payloadCopy
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("HMSiriEndpointOnboardingResultPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMSiriEndpointApplyOnboardingSelectionsResponsePayload onboardingResult](self, "onboardingResult"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMSiriEndpointApplyOnboardingSelectionsResponsePayload)initWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  HMSiriEndpointApplyOnboardingSelectionsResponsePayload *v8;
  NSObject *v9;
  void *v10;
  HMSiriEndpointApplyOnboardingSelectionsResponsePayload *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v5 = objc_msgSend(v4, "hmf_integerForKey:error:", CFSTR("HMSiriEndpointOnboardingResultPayloadKey"), &v13);
  v6 = v13;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to decode apply onboarding selections payload: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = 0;
  }
  else
  {
    v8 = -[HMSiriEndpointApplyOnboardingSelectionsResponsePayload initWithOnboardingResult:](self, "initWithOnboardingResult:", v5);
    v11 = v8;
  }

  return v11;
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
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  HMSiriEndpointOnboardingResultAsString(-[HMSiriEndpointApplyOnboardingSelectionsResponsePayload onboardingResult](self, "onboardingResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("onboardingResult"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (BOOL)isEqual:(id)a3
{
  HMSiriEndpointApplyOnboardingSelectionsResponsePayload *v4;
  HMSiriEndpointApplyOnboardingSelectionsResponsePayload *v5;
  HMSiriEndpointApplyOnboardingSelectionsResponsePayload *v6;
  int64_t v7;
  BOOL v8;

  v4 = (HMSiriEndpointApplyOnboardingSelectionsResponsePayload *)a3;
  if (v4 == self)
  {
    v8 = 1;
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
      v7 = -[HMSiriEndpointApplyOnboardingSelectionsResponsePayload onboardingResult](self, "onboardingResult");
      v8 = v7 == -[HMSiriEndpointApplyOnboardingSelectionsResponsePayload onboardingResult](v6, "onboardingResult");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (int64_t)onboardingResult
{
  return self->_onboardingResult;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_45275 != -1)
    dispatch_once(&logCategory__hmf_once_t1_45275, &__block_literal_global_45276);
  return (id)logCategory__hmf_once_v2_45277;
}

void __69__HMSiriEndpointApplyOnboardingSelectionsResponsePayload_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_45277;
  logCategory__hmf_once_v2_45277 = v0;

}

@end
