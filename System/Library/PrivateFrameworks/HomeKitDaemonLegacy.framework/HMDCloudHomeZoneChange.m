@implementation HMDCloudHomeZoneChange

- (HMDCloudHomeZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  HMDCloudHomeZoneChange *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDCloudHomeZoneChange;
    self = -[HMDCloudZoneChange initWithZone:temporaryCache:](&v14, sel_initWithZone_temporaryCache_, v8, v4);
    v9 = self;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Not a home zone %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

@end
