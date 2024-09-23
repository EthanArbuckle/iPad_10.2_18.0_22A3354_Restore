@implementation HAPCharacteristicValueTransition(NaturalLighting)

- (HMDNaturalLightingActiveTransitionContext)naturalLightingActiveTransitionContextForCharacteristic:()NaturalLighting
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  HMDNaturalLightingActiveTransitionContext *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "controllerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_msgSend(a1, "endBehavior"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(a1, "linearTransition"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(a1, "linearDerivedTransition");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_20;
  }
  objc_msgSend(a1, "linearDerivedTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }
  objc_msgSend(a1, "controllerContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(MEMORY[0x24BE1BA58], "parsedFromData:error:", v9, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v28;
  if (!v10)
  {
    v20 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v22;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode controller context %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v10, "startTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v23 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Start time missing in the controller context %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    goto LABEL_16;
  }
  if (!objc_msgSend(v10, "isNaturalLightingEnabled"))
  {
LABEL_16:
    v19 = 0;
    goto LABEL_17;
  }
  v14 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v13, "doubleValue");
  objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:", v15 / 1000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitionChecksum");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[HMDNaturalLightingActiveTransitionContext initWithStartDate:millisecondsElapsedSinceStartDate:transitionChecksum:]([HMDNaturalLightingActiveTransitionContext alloc], "initWithStartDate:millisecondsElapsedSinceStartDate:transitionChecksum:", v16, 0, v18);
LABEL_17:

LABEL_18:
LABEL_21:

  return v19;
}

- (id)naturalLightingActiveTransitionContextLightProfile:()NaturalLighting
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDD57F0];
  objc_msgSend(v5, "findCharacteristicWithType:", *MEMORY[0x24BDD57F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "naturalLightingActiveTransitionContextForCharacteristic:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Color Temperature Characteristic %@:%@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

+ (id)naturalLightingValueTransitionWithLightProfile:()NaturalLighting naturalLightingEnabled:startDate:dataSource:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  const char *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "naturalLightingContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v19 = (uint64_t)(v18 * 1000.0);
    if (v19 > 0)
    {
      v20 = objc_msgSend(v12, "millisecondsElapsedSinceStartOfDayWithDate:timeZone:", v11, v16);
      objc_msgSend(v10, "naturalLightingCurve");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v71)
      {
        v47 = (void *)MEMORY[0x227676638]();
        v48 = a1;
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v73 = v50;
          v74 = 2112;
          v75 = 0;
          v76 = 2112;
          v77 = v10;
          _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting curve is not set on light profile %@:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v47);
        v40 = 0;
        v30 = 0;
        goto LABEL_37;
      }
      v69 = v11;
      objc_msgSend(v10, "service");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)*MEMORY[0x24BDD57F0];
      objc_msgSend(v21, "findCharacteristicWithType:", *MEMORY[0x24BDD57F0]);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v70)
      {
        v51 = (void *)MEMORY[0x227676638]();
        v52 = a1;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v73 = v54;
          v74 = 2112;
          v75 = v21;
          v76 = 2112;
          v77 = v22;
          _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Color Temperature Characteristic %@:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v51);
        v40 = 0;
        v30 = v71;
        goto LABEL_36;
      }
      v23 = (void *)*MEMORY[0x24BDD57A0];
      v68 = v21;
      objc_msgSend(v21, "findCharacteristicWithType:", *MEMORY[0x24BDD57A0]);
      v24 = objc_claimAutoreleasedReturnValue();
      v67 = (void *)v24;
      if (!v24)
      {
        v55 = (void *)MEMORY[0x227676638]();
        v56 = a1;
        HMFGetOSLogHandle();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v73 = v58;
          v74 = 2112;
          v75 = v21;
          v76 = 2112;
          v77 = v23;
          _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support brightness Characteristic %@:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v55);
        v40 = 0;
        v30 = v71;
        goto LABEL_35;
      }
      v25 = v24;
      v66 = v12;
      v26 = objc_alloc(MEMORY[0x24BE1BC28]);
      objc_msgSend(v70, "instanceID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithValue:", v27);

      v29 = objc_alloc_init(MEMORY[0x24BE1BA40]);
      objc_msgSend(v29, "setHAPInstanceID:", v28);
      if (a4)
      {
        v65 = v29;
        v30 = v71;
        if ((objc_msgSend((id)objc_opt_class(), "updateTransition:withCurve:brightnessCharacteristic:millisecondsElapsedSinceStartOfDay:transitionStartTimeInMilliseconds:", v29, v71, v25, v20, v19) & 1) == 0)
        {
          v64 = v28;
          v59 = (void *)MEMORY[0x227676638]();
          v60 = a1;
          HMFGetOSLogHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v73 = v62;
            _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to update transition with Natural Lighting Curve", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v59);
          v40 = 0;
          v41 = v65;
          v12 = v66;
          v28 = v64;
          goto LABEL_34;
        }
        if (objc_msgSend(v71, "colorTemperatureNotifyIntervalThresholdInMilliseconds"))
        {
          v31 = objc_alloc(MEMORY[0x24BE1BC28]);
          v32 = v28;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v71, "colorTemperatureNotifyIntervalThresholdInMilliseconds"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v31, "initWithValue:", v33);
          objc_msgSend(v65, "setNotifyTimeIntervalThreshold:", v34);

          v28 = v32;
        }
        if (objc_msgSend(v71, "colorTemperatureUpdateIntervalInMilliseconds"))
        {
          v35 = objc_alloc(MEMORY[0x24BE1BC28]);
          v36 = v28;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v71, "colorTemperatureUpdateIntervalInMilliseconds"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v35, "initWithValue:", v37);
          objc_msgSend(v65, "setValueUpdateTimeInterval:", v38);

          v28 = v36;
        }
        *(_DWORD *)buf = objc_msgSend(v71, "colorTemperatureNotifyValueChangeThreshold");
        if (*(int *)buf >= 1)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setNotifyValueChangeThreshold:", v39);

        }
        v29 = v65;
      }
      v40 = v29;
      v41 = v29;
      v12 = v66;
      v30 = v71;
LABEL_34:

LABEL_35:
      v21 = v68;

LABEL_36:
      v11 = v69;
LABEL_37:

      goto LABEL_38;
    }
    v42 = (void *)MEMORY[0x227676638](v17);
    v43 = a1;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v45;
      v74 = 2112;
      v75 = v11;
      v46 = "%{public}@Date is initialized in the past: %@";
      goto LABEL_20;
    }
  }
  else
  {
    v42 = (void *)MEMORY[0x227676638]();
    v43 = a1;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v45;
      v74 = 2112;
      v75 = v15;
      v46 = "%{public}@Time zone missing in natural lighting context: %@";
LABEL_20:
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, v46, buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v42);
  v40 = 0;
LABEL_38:

  return v40;
}

+ (id)transitionPointsByCoalescingTransitionPoints:()NaturalLighting ofCurve:
{
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  unint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v39 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v10 = 0;
    v8 = 0;
    v11 = 0;
    v12 = 0;
    *(_QWORD *)&v6 = 138544386;
    v36 = v6;
    v37 = v5;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v12, v36);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && objc_msgSend(a1, "canCoalesceTransitionPoint1:transitionPoint2:ofCurve:", v9, v10, v39))
      {
        v38 = v8;
        objc_msgSend(v9, "targetCompletionDuration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedLongLongValue");

        v16 = (void *)MEMORY[0x227676638]();
        v17 = a1;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v36;
          v43 = v19;
          v44 = 2112;
          v45 = v9;
          v46 = 2048;
          v47 = v12 + 1;
          v48 = 2112;
          v49 = v10;
          v50 = 2048;
          v51 = v12;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Coalescing transition point: %@ at index: %lu with transition point: %@ at index: %lu", buf, 0x34u);

          v5 = v37;
        }
        v8 = v15 + v38;

        objc_autoreleasePoolPop(v16);
        v20 = v9;

        v7 = v20;
      }
      else
      {
        v21 = v9;
        v22 = v21;
        if (v11)
        {
          v23 = (void *)objc_msgSend(v21, "copy");

          v24 = objc_alloc(MEMORY[0x24BE1BC28]);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v24, "initWithValue:", v25);
          objc_msgSend(v23, "setStartDelayDuration:", v26);

          v8 = 0;
          v11 = v23;
        }
        else
        {
          v11 = v21;
        }
        objc_msgSend(v40, "addObject:", v11);
        v27 = v22;

        v7 = 0;
      }

      ++v12;
      v10 = v9;
      v11 = v7;
    }
    while (v12 < objc_msgSend(v5, "count") - 1);
  }
  objc_msgSend(v5, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v7)
  {
    v30 = (void *)objc_msgSend(v28, "copy");

    v31 = objc_alloc(MEMORY[0x24BE1BC28]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithValue:", v32);
    objc_msgSend(v30, "setStartDelayDuration:", v33);

    v29 = v30;
  }
  objc_msgSend(v40, "addObject:", v29);
  v34 = (void *)objc_msgSend(v40, "copy");

  return v34;
}

+ (uint64_t)updateTransition:()NaturalLighting withCurve:brightnessCharacteristic:millisecondsElapsedSinceStartOfDay:transitionStartTimeInMilliseconds:
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  int v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  _QWORD v77[4];

  v77[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v66 = a5;
  v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE1BA60]), "initWithValue:", 1);
  v14 = objc_alloc(MEMORY[0x24BE1BC28]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "initWithValue:", v15);

  v77[0] = 0;
  v77[1] = 0;
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("C4F33DA9-63C9-4C0F-8B89-6C36A33EEF9E"));
  objc_msgSend(v64, "getUUIDBytes:", v77);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v77, 16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x24BE1BA58]);
  v19 = objc_alloc(MEMORY[0x24BE1BC28]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "checksum"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithValue:", v20);
  v63 = (void *)v17;
  v65 = (void *)v16;
  v22 = (void *)objc_msgSend(v18, "initWithIdentifier:startTime:transitionChecksum:", v17, v16, v21);

  v68 = 0;
  objc_msgSend(v22, "serializeWithError:", &v68);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v68;
  v25 = v24;
  if (v23)
  {
    v59 = v22;
    v60 = v24;
    objc_msgSend(v11, "setControllerContext:", v23);
    v61 = v11;
    objc_msgSend(v11, "setEndBehavior:", v13);
    objc_msgSend(v12, "transitionPointsWithmillisecondsElapsedSinceStartOfDay:", a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "hmf_isEmpty");
    v28 = (void *)v13;
    if (v27)
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = a1;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = v27;
        v33 = v28;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v34;
        v71 = 2112;
        v72 = (uint64_t)v26;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@No transition points found: %@", buf, 0x16u);

        v28 = v33;
        v27 = v32;
      }

      objc_autoreleasePoolPop(v29);
      v11 = v61;
      v35 = v66;
    }
    else
    {
      v42 = a6;
      v58 = v28;
      objc_msgSend((id)objc_opt_class(), "transitionPointsByCoalescingTransitionPoints:ofCurve:", v26, v12);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = (void *)MEMORY[0x227676638]();
      v45 = a1;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v43, "count");
        objc_msgSend(v43, "firstObject");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v70 = v47;
        v71 = 2048;
        v72 = v48;
        v73 = 2112;
        v74 = v49;
        v75 = 2048;
        v76 = v42;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Sending coalesced transition points to accessory, transition points count: %lu, start transition point: %@, time elapsed since start of the day: %llums", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v44);
      *(_DWORD *)buf = objc_msgSend(v12, "minimumBrightness");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v12, "maximumBrightness");
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v67, 4);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BA38]), "initWithLowerBound:upperBound:", v50, v51);
      v53 = objc_alloc(MEMORY[0x24BE1BC28]);
      v35 = v66;
      objc_msgSend(v66, "instanceID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v53, "initWithValue:", v54);

      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BA28]), "initWithTransitionPoints:sourceHAPInstanceID:sourceValueRange:", v43, v55, v52);
      v11 = v61;
      objc_msgSend(v61, "setLinearDerivedTransition:", v56);

      v26 = v43;
      v28 = v58;
      v27 = 0;
    }
    v22 = v59;
    v41 = v27 ^ 1u;

    v25 = v60;
  }
  else
  {
    v28 = (void *)v13;
    v36 = (void *)MEMORY[0x227676638]();
    v37 = a1;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = v25;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v70 = v40;
      v71 = 2112;
      v72 = (uint64_t)v22;
      v73 = 2112;
      v74 = v39;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize controller context %@:%@", buf, 0x20u);

      v25 = v39;
    }

    objc_autoreleasePoolPop(v36);
    v41 = 0;
    v35 = v66;
  }

  return v41;
}

+ (BOOL)canCoalesceTransitionPoint1:()NaturalLighting transitionPoint2:ofCurve:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "colorTemperatureForBrightness:", objc_msgSend(v9, "minimumBrightness"));
  if (v10 == objc_msgSend(v8, "colorTemperatureForBrightness:", objc_msgSend(v9, "minimumBrightness")))
  {
    v11 = objc_msgSend(v7, "colorTemperatureForBrightness:", objc_msgSend(v9, "maximumBrightness"));
    v12 = v11 == objc_msgSend(v8, "colorTemperatureForBrightness:", objc_msgSend(v9, "maximumBrightness"));
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
