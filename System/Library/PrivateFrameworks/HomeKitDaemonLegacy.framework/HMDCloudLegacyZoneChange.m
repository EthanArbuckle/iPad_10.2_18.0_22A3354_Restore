@implementation HMDCloudLegacyZoneChange

- (HMDCloudLegacyZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  HMDCloudLegacyZoneChange *v9;
  HMDCloudLegacyZoneChange *v10;
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
    v15.super_class = (Class)HMDCloudLegacyZoneChange;
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
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not a legacy zone %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (BOOL)decryptionFailed
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  HMDCloudLegacyZoneChange *v16;
  NSObject *v17;
  void *v18;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDCloudZoneChange cloudZone](self, "cloudZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeDataObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeWithObjectID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeDataV3ObjectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changeWithObjectID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if ((objc_msgSend(v8, "isDeleted") & 1) == 0)
      {
        objc_msgSend(v8, "cloudRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "decryptionFailed");

        if (v13)
        {
          if (!v11)
          {
            v14 = 1;
LABEL_16:

            goto LABEL_17;
          }
          goto LABEL_14;
        }
      }
    }
    else if (v11)
    {
LABEL_14:
      if ((objc_msgSend(v11, "isDeleted") & 1) == 0)
      {
        objc_msgSend(v11, "cloudRecord");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v20, "decryptionFailed");

        goto LABEL_16;
      }
    }
    v14 = 0;
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine cloud zone", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  v14 = 0;
LABEL_17:

  return v14;
}

- (BOOL)controllerIdentifierChanged
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCloudLegacyZoneChange *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDCloudZoneChange cloudZone](self, "cloudZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeDataObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeWithObjectID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v8, "isDeleted") & 1) == 0
      && (objc_msgSend(v8, "cloudRecord"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "controllerIdentifierChanged"),
          v9,
          (v10 & 1) != 0))
    {
      v11 = 1;
    }
    else
    {
      -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "homeDataV3ObjectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "changeWithObjectID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && (objc_msgSend(v14, "isDeleted") & 1) == 0)
      {
        objc_msgSend(v14, "cloudRecord");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v19, "controllerIdentifierChanged");

      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine cloud zone", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v11 = 0;
  }

  return v11;
}

@end
