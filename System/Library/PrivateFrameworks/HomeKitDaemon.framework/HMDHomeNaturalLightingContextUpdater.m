@implementation HMDHomeNaturalLightingContextUpdater

- (HMDHomeNaturalLightingContextUpdater)initWithHome:(id)a3 demoModeEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HMDLightProfileDataSource *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHomeNaturalLightingContextUpdater *v11;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HMDLightProfileDataSource);
  objc_msgSend(v6, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDHomeNaturalLightingContextUpdater initWithHome:workQueue:demoModeEnabled:logIdentifier:notificationCenter:dataSource:](self, "initWithHome:workQueue:demoModeEnabled:logIdentifier:notificationCenter:dataSource:", v6, v8, v4, v9, v10, v7);

  return v11;
}

- (HMDHomeNaturalLightingContextUpdater)initWithHome:(id)a3 workQueue:(id)a4 demoModeEnabled:(BOOL)a5 logIdentifier:(id)a6 notificationCenter:(id)a7 dataSource:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMDHomeNaturalLightingContextUpdater *v19;
  HMDHomeNaturalLightingContextUpdater *v20;
  uint64_t v21;
  NSString *logIdentifier;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDHomeNaturalLightingContextUpdater;
  v19 = -[HMDHomeNaturalLightingContextUpdater init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_home, v14);
    objc_storeStrong((id *)&v20->_workQueue, a4);
    objc_storeStrong((id *)&v20->_dataSource, a8);
    v21 = objc_msgSend(v16, "copy");
    logIdentifier = v20->_logIdentifier;
    v20->_logIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_notificationCenter, a7);
    v20->_demoModeEnabled = a5;
  }

  return v20;
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDHomeNaturalLightingContextUpdater workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomeNaturalLightingContextUpdater notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeNaturalLightingContextUpdater home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentDeviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleResidentDeviceUpdated_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v6);

  -[HMDHomeNaturalLightingContextUpdater notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleResidentDeviceUpdated_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

  -[HMDHomeNaturalLightingContextUpdater initalizeCurve](self, "initalizeCurve");
}

- (void)handleResidentDeviceUpdated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDHomeNaturalLightingContextUpdater workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDHomeNaturalLightingContextUpdater_handleResidentDeviceUpdated___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)initalizeCurve
{
  NSObject *v3;
  void *v4;
  HMDHomeNaturalLightingContextUpdater *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDMutableNaturalLightingCurve *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  HMDHomeNaturalLightingContextUpdater *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  HMDHomeNaturalLightingContextUpdater *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  HMDHomeNaturalLightingContextUpdater *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  HMDHomeNaturalLightingContextUpdater *v56;
  void *v57;
  const char *v58;
  void *v59;
  HMDHomeNaturalLightingContextUpdater *v60;
  NSObject *v61;
  void *v62;
  HMDHomeNaturalLightingContextUpdater *v63;
  HMDHomeNaturalLightingContextUpdater *v64;
  HMDHomeNaturalLightingContextUpdater *v65;
  void *v66;
  HMDHomeNaturalLightingContextUpdater *v67;
  NSObject *v68;
  void *v70;
  void *v71;
  void *v72;
  HMDHomeNaturalLightingContextUpdater *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id obj;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeNaturalLightingContextUpdater workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v87 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Initializing transitions points for the curve", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDHomeNaturalLightingContextUpdater dataSource](v5, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "naturalLightingCurveResourceFileContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hmf_arrayForKey:", CFSTR("NaturalLightingCurve"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_filter:", &__block_literal_global_230885);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v42 = (void *)MEMORY[0x227676638]();
    v43 = v5;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v87 = v45;
      v88 = 2112;
      v89 = (uint64_t)v9;
      v90 = 2112;
      v91 = (uint64_t)CFSTR("NaturalLightingCurve");
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Missing natural lighting curve key in resource file content %@:%@", buf, 0x20u);

    }
    goto LABEL_52;
  }
  v12 = objc_msgSend(v11, "count");
  if (v12 != 2)
  {
    v46 = v12;
    v42 = (void *)MEMORY[0x227676638]();
    v47 = v5;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v87 = v49;
      v88 = 2048;
      v89 = v46;
      v90 = 2048;
      v91 = 2;
      _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Natural Lighting Curve Brightness Level count: %lu is not equal to supported brightness level count: %lu", buf, 0x20u);

    }
LABEL_52:
    objc_autoreleasePoolPop(v42);
    goto LABEL_75;
  }
  -[HMDHomeNaturalLightingContextUpdater colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve:](v5, "colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    -[HMDHomeNaturalLightingContextUpdater colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve:](v5, "colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v15 = objc_msgSend(v14, "count");
      if (v15 == objc_msgSend(v13, "count"))
      {
        v71 = v9;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v72 = v14;
        obj = v14;
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
        v17 = 0;
        v18 = 0;
        if (v74)
        {
          v19 = 0;
          v75 = *(_QWORD *)v82;
          v76 = 0;
          v70 = v11;
          v73 = v5;
          while (2)
          {
            v20 = 0;
            v78 = v19;
            do
            {
              if (*(_QWORD *)v82 != v75)
                objc_enumerationMutation(obj);
              v21 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v20);
              objc_msgSend(v13, "objectAtIndex:", v76 + v20);
              v22 = objc_claimAutoreleasedReturnValue();
              v79 = (void *)v22;
              v80 = -[HMDHomeNaturalLightingContextUpdater timeOfDayForMinimumBrightnessTransitionPoint:maximumBrighnessTransitionPoint:](v5, "timeOfDayForMinimumBrightnessTransitionPoint:maximumBrighnessTransitionPoint:", v21, v22);
              if (v80 < 0)
              {
                v66 = (void *)MEMORY[0x227676638]();
                v56 = v5;
                HMFGetOSLogHandle();
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v87 = v57;
                  v88 = 2048;
                  v89 = v80;
                  v58 = "%{public}@Invalid time of day for transition point: %lld";
                  goto LABEL_69;
                }
                goto LABEL_70;
              }
              v23 = -[HMDHomeNaturalLightingContextUpdater colorTemperatureForTransitionPoint:](v5, "colorTemperatureForTransitionPoint:", v21);
              if (v23 < 0)
              {
                v66 = (void *)MEMORY[0x227676638]();
                v63 = v5;
                HMFGetOSLogHandle();
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v87 = v57;
                  v88 = 2048;
                  v89 = v80;
                  v58 = "%{public}@Invalid minimum brightness color temperature value: %lld";
                  goto LABEL_69;
                }
                goto LABEL_70;
              }
              v24 = v23;
              v25 = -[HMDHomeNaturalLightingContextUpdater colorTemperatureForTransitionPoint:](v5, "colorTemperatureForTransitionPoint:", v22);
              if (v25 < 0)
              {
                v66 = (void *)MEMORY[0x227676638]();
                v64 = v5;
                HMFGetOSLogHandle();
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v87 = v57;
                  v88 = 2048;
                  v89 = v80;
                  v58 = "%{public}@Invalid maximum brightness color temperature value: %lld";
                  goto LABEL_69;
                }
                goto LABEL_70;
              }
              v26 = v25;
              if (v24 >= v25)
                v27 = v25;
              else
                v27 = v24;
              if (v24 <= v25)
                v28 = v25;
              else
                v28 = v24;
              v29 = v18 > v27 || v18 == 0;
              if (v29)
                v18 = v27;
              if (v17 < v28 || v17 == 0)
                v17 = v28;
              if (v80 - v78 < 0)
              {
                v66 = (void *)MEMORY[0x227676638]();
                v65 = v5;
                HMFGetOSLogHandle();
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v87 = v57;
                  v88 = 2048;
                  v89 = v80;
                  v58 = "%{public}@Target completion duration for transition point at %lld is invalid";
                  goto LABEL_69;
                }
LABEL_70:
                v11 = v70;
                v9 = v71;

                objc_autoreleasePoolPop(v66);
                goto LABEL_71;
              }
              if (v80 == v78)
              {
                objc_msgSend(obj, "firstObject");
                v31 = v16;
                v32 = v13;
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                v29 = v21 == v33;
                v13 = v32;
                v16 = v31;
                v5 = v73;
                if (!v29)
                {
                  v66 = (void *)MEMORY[0x227676638]();
                  v67 = v73;
                  HMFGetOSLogHandle();
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v87 = v57;
                    v88 = 2048;
                    v89 = v78;
                    v58 = "%{public}@Target completion duration for non-first transition point at %lld is zero.";
LABEL_69:
                    _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, v58, buf, 0x16u);

                  }
                  goto LABEL_70;
                }
              }
              objc_msgSend(MEMORY[0x24BE1BA30], "transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:", -[HMDHomeNaturalLightingContextUpdater curveMinimumBrightness](v5, "curveMinimumBrightness"), v24, 100, v26, v80 - v78);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v34);

              ++v20;
              v19 = v80;
              v78 = v80;
            }
            while (v74 != v20);
            v76 += v20;
            v11 = v70;
            v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
            if (v74)
              continue;
            break;
          }
        }

        if (objc_msgSend(v16, "count"))
        {
          v35 = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:]([HMDMutableNaturalLightingCurve alloc], "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:", 1, v16, -[HMDHomeNaturalLightingContextUpdater curveMinimumBrightness](v5, "curveMinimumBrightness"), -[HMDHomeNaturalLightingContextUpdater curveMaximumBrightness](v5, "curveMaximumBrightness"), v18, v17);
          v9 = v71;
          objc_msgSend(v71, "hmf_numberForKey:", CFSTR("ColorTemperatureValueUpdateInterval"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "longLongValue");

          if (v37 >= 1)
            -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:](v35, "setColorTemperatureUpdateIntervalInMilliseconds:", v37);
          objc_msgSend(v71, "hmf_numberForKey:", CFSTR("ColorTemperatureNotifyIntervalThreshold"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "longLongValue");

          v14 = v72;
          if (v39 >= 1)
            -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:](v35, "setColorTemperatureNotifyIntervalThresholdInMilliseconds:", v39);
          objc_msgSend(v71, "hmf_numberForKey:", CFSTR("ColorTemperatureNotifyValueChangeThreshold"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "integerValue");

          if (v41 >= 1)
            -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:](v35, "setColorTemperatureNotifyValueChangeThreshold:", v41);
          -[HMDHomeNaturalLightingContextUpdater setCurve:](v5, "setCurve:", v35);
          -[HMDHomeNaturalLightingContextUpdater updateNaturalLightingContext](v5, "updateNaturalLightingContext");

        }
        else
        {
          v59 = (void *)MEMORY[0x227676638]();
          v60 = v5;
          HMFGetOSLogHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          v9 = v71;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v87 = v62;
            _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@No transition points found", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v59);
LABEL_71:
          v14 = v72;
        }

      }
      else
      {
        v50 = (void *)MEMORY[0x227676638]();
        v51 = v5;
        HMFGetOSLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v14, "count");
          v55 = objc_msgSend(v13, "count");
          *(_DWORD *)buf = 138543874;
          v87 = v53;
          v88 = 2048;
          v89 = v54;
          v90 = 2048;
          v91 = v55;
          _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@Minimum Brightness Transition Points: %lu don't match maximum Brightness Transition Points: %lu", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v50);
      }
    }

  }
LABEL_75:

}

- (BOOL)areEncodedBrightnessLevelTransitionPointsValid:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  HMDHomeNaturalLightingContextUpdater *v13;
  NSObject *v14;
  void *v15;
  HMDHomeNaturalLightingContextUpdater *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDHomeNaturalLightingContextUpdater *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *context;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeNaturalLightingContextUpdater workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("TimeOfDay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToNumber:", &unk_24E96D310) & 1) != 0)
  {
    objc_msgSend(v4, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_numberForKey:", CFSTR("TimeOfDay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToNumber:", &unk_24E96D328) & 1) != 0)
    {
      objc_msgSend(v6, "hmf_numberForKey:", CFSTR("ColorTemperature"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmf_numberForKey:", CFSTR("ColorTemperature"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToNumber:", v11);
      if ((v12 & 1) == 0)
      {
        context = (void *)MEMORY[0x227676638]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v27 = v24;
          v28 = 2112;
          v29 = (uint64_t)v10;
          v30 = 2112;
          v31 = v11;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@First transition point color temperature:%@ doesn't match last transition point color temperature: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
      }

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        v28 = 2048;
        v29 = 86400000;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Last transition point time of day doesn't end at %llums", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v12 = 0;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v18;
      v28 = 2048;
      v29 = 0;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@First transition point doesn't begin at %llums", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v12 = 0;
  }

  return v12;
}

- (id)colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDHomeNaturalLightingContextUpdater *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomeNaturalLightingContextUpdater *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDHomeNaturalLightingContextUpdater *v21;
  NSObject *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeNaturalLightingContextUpdater workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke;
  v26[3] = &unk_24E797380;
  v26[4] = self;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_arrayForKey:", CFSTR("ColorTemperatureTransitionPoints"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke_27;
  v25[3] = &unk_24E7979C8;
  v25[4] = self;
  objc_msgSend(v8, "na_filter:", v25);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v9, "count") > 2)
  {
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_30_230873);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Validating maximum brightness transition points dictionary", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    if (-[HMDHomeNaturalLightingContextUpdater areEncodedBrightnessLevelTransitionPointsValid:](v17, "areEncodedBrightnessLevelTransitionPointsValid:", v15))
    {
      v9 = v15;
      v14 = v9;
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v17;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate maximum brightness transitions points dictionary", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      v14 = 0;
      v9 = v15;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v13;
      v29 = 2112;
      v30 = v9;
      v31 = 2048;
      v32 = 3;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Color Temperature Transition Points specified for maximum Brightness: %@ are less than %ld", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 0;
  }

  return v14;
}

- (id)colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDHomeNaturalLightingContextUpdater *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomeNaturalLightingContextUpdater *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDHomeNaturalLightingContextUpdater *v21;
  NSObject *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeNaturalLightingContextUpdater workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke;
  v26[3] = &unk_24E797380;
  v26[4] = self;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_arrayForKey:", CFSTR("ColorTemperatureTransitionPoints"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke_31;
  v25[3] = &unk_24E7979C8;
  v25[4] = self;
  objc_msgSend(v8, "na_filter:", v25);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v9, "count") > 2)
  {
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_33_230866);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Validating minimum brightness transition points dictionary", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    if (-[HMDHomeNaturalLightingContextUpdater areEncodedBrightnessLevelTransitionPointsValid:](v17, "areEncodedBrightnessLevelTransitionPointsValid:", v15))
    {
      v9 = v15;
      v14 = v9;
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v17;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate minimum brightness transitions points dictionary", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      v14 = 0;
      v9 = v15;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v13;
      v29 = 2112;
      v30 = v9;
      v31 = 2048;
      v32 = 3;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Color Temperature Transition Points specified for minimum Brightness: %@ are less than %ld", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 0;
  }

  return v14;
}

- (int64_t)timeOfDayForMinimumBrightnessTransitionPoint:(id)a3 maximumBrighnessTransitionPoint:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  HMDHomeNaturalLightingContextUpdater *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDHomeNaturalLightingContextUpdater *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  -[HMDHomeNaturalLightingContextUpdater workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[__CFString hmf_numberForKey:](v6, "hmf_numberForKey:", CFSTR("TimeOfDay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[__CFString hmf_numberForKey:](v7, "hmf_numberForKey:", CFSTR("TimeOfDay"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if ((objc_msgSend(v9, "isEqualToNumber:", v10) & 1) != 0)
      {
        v11 = objc_msgSend(v9, "longLongValue");
LABEL_14:

        goto LABEL_15;
      }
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138544130;
        v25 = v19;
        v26 = 2112;
        v27 = CFSTR("TimeOfDay");
        v28 = 2112;
        v29 = v7;
        v30 = 2112;
        v31 = v6;
        v20 = "%{public}@Maximum Brightness Transition Point: %@ key value:%@ doesn't match Minimum Brightness Transition Point: %@";
        v21 = v18;
        v22 = 42;
        goto LABEL_12;
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543874;
        v25 = v19;
        v26 = 2112;
        v27 = v7;
        v28 = 2112;
        v29 = CFSTR("TimeOfDay");
        v20 = "%{public}@Maximum Brightness Transition Point: %@ is missing key: %@";
        v21 = v18;
        v22 = 32;
LABEL_12:
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v24, v22);

      }
    }

    objc_autoreleasePoolPop(v16);
    v11 = -1;
    goto LABEL_14;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v15;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = CFSTR("TimeOfDay");
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Minimum Brightness Transition Point: %@ is missing key: %@", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v11 = -1;
LABEL_15:

  return v11;
}

- (int64_t)colorTemperatureForTransitionPoint:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  HMDHomeNaturalLightingContextUpdater *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeNaturalLightingContextUpdater workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("ColorTemperature"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "integerValue") > 0)
  {
    v8 = +[HMDNaturalLightingCurve colorTemperatureMiredsFromKelvins:](HMDNaturalLightingCurve, "colorTemperatureMiredsFromKelvins:", objc_msgSend(v7, "integerValue"));
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = CFSTR("ColorTemperature");
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Minimum Brightness Transition Point: %@ is missing key: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = -1;
  }

  return v8;
}

- (void)updateNaturalLightingContext
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  HMDHomeNaturalLightingContextUpdater *v9;
  NSObject *v10;
  void *v11;
  HMDNaturalLightingContext *v12;
  void *v13;
  void *v14;
  HMDNaturalLightingContext *v15;
  void *v16;
  void *v17;
  HMDNaturalLightingContext *v18;
  HMDNaturalLightingContext *v19;
  _BOOL4 v20;
  void *v21;
  HMDHomeNaturalLightingContextUpdater *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  HMDHomeModel *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDHomeModel *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  HMDNaturalLightingContext *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeNaturalLightingContextUpdater workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomeNaturalLightingContextUpdater home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Skipping updating natural lighting context, home is not set", (uint8_t *)&v35, 0xCu);
      goto LABEL_8;
    }
LABEL_9:

    objc_autoreleasePoolPop(v8);
    goto LABEL_21;
  }
  v6 = objc_msgSend(v4, "isCurrentDeviceConfirmedPrimaryResident");
  v7 = -[HMDHomeNaturalLightingContextUpdater isDemoModeEnabled](self, "isDemoModeEnabled");
  if ((v6 & 1) == 0 && !v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (HMDNaturalLightingContext *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543874;
      v36 = v11;
      v37 = 2112;
      v38 = v12;
      v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping updating natural lighting context, device is primary resident: %@ and demo mode is enabled: %@", (uint8_t *)&v35, 0x20u);

LABEL_8:
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  -[HMDHomeNaturalLightingContextUpdater curve](self, "curve");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = [HMDNaturalLightingContext alloc];
    -[HMDHomeNaturalLightingContextUpdater dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localTimeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDNaturalLightingContext initWithCurve:timeZone:](v15, "initWithCurve:timeZone:", v14, v17);

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v5, "naturalLightingContext");
  v19 = (HMDNaturalLightingContext *)objc_claimAutoreleasedReturnValue();
  v20 = -[HMDNaturalLightingContext isEqual:](v19, "isEqual:", v18);
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v24)
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v25;
      v37 = 2112;
      v38 = v19;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Skipping updating natural lighting context, since it is already set: %@", (uint8_t *)&v35, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
  }
  else
  {
    if (v24)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v26;
      v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting context to %@", (uint8_t *)&v35, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v27 = [HMDHomeModel alloc];
    objc_msgSend(v5, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "uuid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v27, "initWithObjectChangeType:uuid:parentUUID:", 2, v28, v30);

    -[HMDHomeModel setNaturalLightingContext:](v31, "setNaturalLightingContext:", v18);
    objc_msgSend(v5, "backingStore");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "transaction:options:", CFSTR("Updating natural lighting context"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "add:", v31);
    objc_msgSend(v34, "run");

  }
LABEL_21:

}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)curveMinimumBrightness
{
  return self->_curveMinimumBrightness;
}

- (void)setCurveMinimumBrightness:(int64_t)a3
{
  self->_curveMinimumBrightness = a3;
}

- (int64_t)curveMaximumBrightness
{
  return self->_curveMaximumBrightness;
}

- (void)setCurveMaximumBrightness:(int64_t)a3
{
  self->_curveMaximumBrightness = a3;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (HMDNaturalLightingCurve)curve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurve:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (BOOL)isDemoModeEnabled
{
  return self->_demoModeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curve, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("Brightness"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = CFSTR("Brightness");
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Missing %@ key in %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "integerValue");
  if (v6 >= objc_msgSend(*(id *)(a1 + 32), "curveMaximumBrightness") || objc_msgSend(v5, "integerValue") < 1)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurveMinimumBrightness:", objc_msgSend(v5, "integerValue"));
  v7 = 1;
LABEL_9:

  return v7;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 isKindOfClass;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = isKindOfClass & (v3 != 0);
  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v9;
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = CFSTR("ColorTemperatureTransitionPoints");
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Minimum Brightness, Object: %@ for key: %@ is not of type: NSDictionary", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMinimumBrightnessWithEncodeNaturalLightingCurve___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "hmf_numberForKey:", CFSTR("TimeOfDay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("TimeOfDay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("Brightness"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = CFSTR("Brightness");
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Missing %@ key in Natural Lighting Curve entry: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "integerValue") != 100)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurveMaximumBrightness:", objc_msgSend(v5, "integerValue"));
  v6 = 1;
LABEL_8:

  return v6;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 isKindOfClass;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = isKindOfClass & (v3 != 0);
  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v9;
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = CFSTR("ColorTemperatureTransitionPoints");
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Maximum Brightness, Object: %@ for key: %@ is not of type: NSDictionary", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

uint64_t __123__HMDHomeNaturalLightingContextUpdater_colorTemperatureTransitionPointsForMaximumBrightnessWithEncodeNaturalLightingCurve___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "hmf_numberForKey:", CFSTR("TimeOfDay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("TimeOfDay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __54__HMDHomeNaturalLightingContextUpdater_initalizeCurve__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

uint64_t __68__HMDHomeNaturalLightingContextUpdater_handleResidentDeviceUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNaturalLightingContext");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t36_230905 != -1)
    dispatch_once(&logCategory__hmf_once_t36_230905, &__block_literal_global_40_230906);
  return (id)logCategory__hmf_once_v37_230907;
}

void __51__HMDHomeNaturalLightingContextUpdater_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v37_230907;
  logCategory__hmf_once_v37_230907 = v0;

}

@end
