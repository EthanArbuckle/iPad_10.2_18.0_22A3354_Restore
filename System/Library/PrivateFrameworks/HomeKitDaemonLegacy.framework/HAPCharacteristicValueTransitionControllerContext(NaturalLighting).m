@implementation HAPCharacteristicValueTransitionControllerContext(NaturalLighting)

- (BOOL)isNaturalLightingEnabled
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "activeTransitionContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (HMDNaturalLightingActiveTransitionContext)activeTransitionContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  HMDNaturalLightingActiveTransitionContext *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_UUIDWithBytesAsData:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3
      && (objc_msgSend(v3, "UUIDString"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("C4F33DA9-63C9-4C0F-8B89-6C36A33EEF9E")),
          v5,
          v6))
    {
      objc_msgSend(a1, "startTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v8, "doubleValue");
        objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:", v10 / 1000.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "transitionChecksum");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = -[HMDNaturalLightingActiveTransitionContext initWithStartDate:millisecondsElapsedSinceStartDate:transitionChecksum:]([HMDNaturalLightingActiveTransitionContext alloc], "initWithStartDate:millisecondsElapsedSinceStartDate:transitionChecksum:", v11, 0, v13);
      }
      else
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543618;
          v20 = v17;
          v21 = 2112;
          v22 = a1;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Start time missing in the controller context %@", (uint8_t *)&v19, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
