@implementation CLLocation(HMFObject)

- (id)shortDescription
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("<%@>"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)attributeDescriptions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "coordinate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:options:formatter:", CFSTR("Latitude"), v5, 0, v2);
  v21[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "coordinate");
  objc_msgSend(v8, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:value:options:formatter:", CFSTR("Longitude"), v10, 0, v2);
  v21[1] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "horizontalAccuracy");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithName:value:options:formatter:", CFSTR("Horizontal Accuracy"), v14, 0, v2);
  v21[2] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(a1, "timestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:options:formatter:", CFSTR("Timestamp"), v17, 0, v2);
  v21[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (uint64_t)isSimulated
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  HMDCarPlayDataSource *v19;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("allowLocationSimulation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (!v4)
  {
    objc_msgSend(a1, "sourceInformation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    if (v10)
    {
      if (objc_msgSend(v10, "isSimulatedBySoftware"))
      {
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        v13 = a1;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v15;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@CLLocation is simulated by the software", (uint8_t *)&v25, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
LABEL_10:
        objc_autoreleasePoolPop(v11);
        v9 = 1;
LABEL_18:

        return v9;
      }
      if (objc_msgSend(v10, "isProducedByAccessory"))
      {
        v19 = objc_alloc_init(HMDCarPlayDataSource);
        if (!-[HMDCarPlayDataSource synchronouslyFetchIsCarPlayConnectedStatus](v19, "synchronouslyFetchIsCarPlayConnectedStatus"))
        {
          v21 = (void *)MEMORY[0x1D17BA0A0]();
          v22 = a1;
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138543362;
            v26 = v24;
            _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@CLLocation is simulated by the accessory and CarPlay is not connected.", (uint8_t *)&v25, 0xCu);

          }
          objc_autoreleasePoolPop(v21);

          goto LABEL_10;
        }

      }
    }
    else
    {
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@CLLocation does not contain the location source information", (uint8_t *)&v25, 0xCu);

      }
    }
    objc_autoreleasePoolPop(v11);
    v9 = 0;
    goto LABEL_18;
  }
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Not checking for location simulation due to override", (uint8_t *)&v25, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  return 0;
}

+ (NSString)shortDescription
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end
