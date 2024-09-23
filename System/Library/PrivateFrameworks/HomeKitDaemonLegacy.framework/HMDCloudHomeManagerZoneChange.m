@implementation HMDCloudHomeManagerZoneChange

- (HMDCloudHomeManagerZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  HMDCloudHomeManagerZoneChange *v9;
  HMDCloudHomeManagerZoneChange *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDCloudHomeManagerZoneChange;
    v9 = -[HMDCloudZoneChange initWithZone:temporaryCache:](&v15, sel_initWithZone_temporaryCache_, v8, v4);
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not a home manager zone %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

@end
