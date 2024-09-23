@implementation HMDCameraRecordingReachabilityEventModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_97492 != -1)
    dispatch_once(&hmbProperties_onceToken_97492, &__block_literal_global_97493);
  return (id)hmbProperties__properties_97494;
}

+ (id)hmbExternalRecordType
{
  return CFSTR("CameraClip");
}

void __57__HMDCameraRecordingReachabilityEventModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("dateOfOccurrence");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("reachableField");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hmbProperties__properties_97494;
  hmbProperties__properties_97494 = v2;

}

- (void)setReachable:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventModel setReachableField:](self, "setReachableField:", v4);

}

- (BOOL)reachable
{
  void *v2;
  char v3;

  -[HMDCameraRecordingReachabilityEventModel reachableField](self, "reachableField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)createEvent
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCameraRecordingReachabilityEventModel *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDCameraRecordingReachabilityEventModel dateOfOccurrence](self, "dateOfOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CBA410]);
    -[HMBModel hmbModelID](self, "hmbModelID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingReachabilityEventModel dateOfOccurrence](self, "dateOfOccurrence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithUniqueIdentifier:dateOfOccurrence:reachable:", v5, v6, -[HMDCameraRecordingReachabilityEventModel reachable](self, "reachable"));

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel debugDescription](v9, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot create reachability event from model: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

@end
