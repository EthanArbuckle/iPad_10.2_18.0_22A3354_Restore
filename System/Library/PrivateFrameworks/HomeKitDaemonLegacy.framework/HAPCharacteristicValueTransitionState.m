@implementation HAPCharacteristicValueTransitionState

BOOL __114__HAPCharacteristicValueTransitionState_NaturalLighting__naturalLightingActiveTransitionContextForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "controllerContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0D16460], "parsedFromData:error:", v4, &v18);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v18;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(v3, "HAPInstanceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "instanceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToNumber:", v11)
        && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isNaturalLightingEnabled"))
      {
        objc_msgSend(v3, "timeElapsedSinceStart");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 != 0;

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v16;
        v21 = 2112;
        v22 = v4;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode controller context %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

BOOL __100__HAPCharacteristicValueTransitionState_NaturalLighting__isNaturalLightingEnabledForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "controllerContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0D16460], "parsedFromData:error:", v4, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v5)
    {
      objc_msgSend(v3, "HAPInstanceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "instanceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToNumber:", v9)
        && objc_msgSend(v5, "isNaturalLightingEnabled"))
      {
        objc_msgSend(v3, "timeElapsedSinceStart");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 != 0;

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v18 = v14;
        v19 = 2112;
        v20 = v4;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode controller context %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __59__HAPCharacteristicValueTransitionState_Validator__isValid__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValid");
}

@end
