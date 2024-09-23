@implementation HAPCharacteristicValueTransitionState(NaturalLighting)

- (uint64_t)isNaturalLightingEnabledForCharacteristic:()NaturalLighting
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "activeTransitionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __100__HAPCharacteristicValueTransitionState_NaturalLighting__isNaturalLightingEnabledForCharacteristic___block_invoke;
  v9[3] = &unk_24E778A18;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (HMDNaturalLightingActiveTransitionContext)naturalLightingActiveTransitionContextForCharacteristic:()NaturalLighting
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  HMDNaturalLightingActiveTransitionContext *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  BOOL (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__25553;
  v36 = __Block_byref_object_dispose__25554;
  v37 = 0;
  objc_msgSend(a1, "activeTransitionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __114__HAPCharacteristicValueTransitionState_NaturalLighting__naturalLightingActiveTransitionContextForCharacteristic___block_invoke;
  v29 = &unk_24E778A40;
  v31 = &v32;
  v6 = v4;
  v30 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "timeElapsedSinceStart", v26, v27, v28, v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend((id)v33[5], "startTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:", v13 / 1000.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v33[5], "transitionChecksum");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = -[HMDNaturalLightingActiveTransitionContext initWithStartDate:millisecondsElapsedSinceStartDate:transitionChecksum:]([HMDNaturalLightingActiveTransitionContext alloc], "initWithStartDate:millisecondsElapsedSinceStartDate:transitionChecksum:", v14, objc_msgSend(v9, "unsignedLongLongValue"), v16);
      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)v33[5];
          *(_DWORD *)buf = 138543618;
          v39 = v23;
          v40 = 2112;
          v41 = v24;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Start time missing in the controller context %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        v17 = 0;
      }

    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v20;
        v40 = 2112;
        v41 = v7;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Time elapsed since start is missing in the active transition context %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v17;
}

@end
