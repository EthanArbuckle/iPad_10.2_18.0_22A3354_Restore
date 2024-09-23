@implementation HMDNaturalLightingCurve

- (HMDNaturalLightingCurve)initWithVersion:(unint64_t)a3 transitionPoints:(id)a4 minimumBrightness:(int64_t)a5 maximumBrightness:(int64_t)a6 minimumColorTemperature:(int64_t)a7 maximumColorTemperature:(int64_t)a8
{
  id v14;
  HMDNaturalLightingCurve *v15;
  HMDNaturalLightingCurve *v16;
  uint64_t v17;
  NSArray *transitionPoints;
  objc_super v20;

  v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDNaturalLightingCurve;
  v15 = -[HMDNaturalLightingCurve init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_version = a3;
    v17 = objc_msgSend(v14, "copy");
    transitionPoints = v16->_transitionPoints;
    v16->_transitionPoints = (NSArray *)v17;

    v16->_minimumBrightness = a5;
    v16->_maximumBrightness = a6;
    v16->_minimumColorTemperature = a7;
    v16->_maximumColorTemperature = a8;
  }

  return v16;
}

- (HMDNaturalLightingCurve)initWithCurve:(id)a3 minimumColorTemperature:(int64_t)a4 maximumColorTemperature:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  HMDNaturalLightingCurve *v31;
  id v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v6, "transitionPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v6, "transitionPoints");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  v9 = 0;
  v10 = 0;
  if (v41)
  {
    v38 = *(_QWORD *)v43;
    v34 = v6;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v43 != v38)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "colorTemperatureForBrightness:", objc_msgSend(v6, "minimumBrightness"));
        v14 = v13;
        if (v13 <= a4)
          v15 = a4;
        else
          v15 = v13;
        if (v13 <= a5)
          v16 = v15;
        else
          v16 = a5;
        v17 = objc_msgSend(v12, "colorTemperatureForBrightness:", objc_msgSend(v6, "maximumBrightness"));
        if (v17 <= a4)
          v18 = a4;
        else
          v18 = v17;
        if (v17 <= a5)
          v19 = v18;
        else
          v19 = a5;
        if (v17 > a5 || v17 < a4 || v14 > a5 || v14 < a4)
        {
          v37 = (void *)MEMORY[0x24BE1BA30];
          v36 = objc_msgSend(v6, "minimumBrightness");
          v23 = objc_msgSend(v6, "maximumBrightness");
          objc_msgSend(v12, "targetCompletionDuration");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:", v36, v16, v23, v19, objc_msgSend(v25, "unsignedLongLongValue"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v34;
        }
        else
        {
          v26 = (void *)objc_msgSend(v12, "copy");
        }
        objc_msgSend(v40, "addObject:", v26);
        if (v16 >= v19)
          v27 = v19;
        else
          v27 = v16;
        if (v10 >= v27)
          v28 = v27;
        else
          v28 = v10;
        if (v10 <= 0)
          v10 = v27;
        else
          v10 = v28;
        if (v19 <= v16)
          v29 = v16;
        else
          v29 = v19;
        if (v9 <= v29)
          v30 = v29;
        else
          v30 = v9;
        if (v9 <= 0)
          v9 = v29;
        else
          v9 = v30;

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v41);
  }

  v31 = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:](self, "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:", objc_msgSend(v6, "version"), v40, objc_msgSend(v6, "minimumBrightness"), objc_msgSend(v6, "maximumBrightness"), v10, v9);
  -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:](v31, "setColorTemperatureNotifyIntervalThresholdInMilliseconds:", objc_msgSend(v6, "colorTemperatureNotifyIntervalThresholdInMilliseconds"));
  -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:](v31, "setColorTemperatureNotifyValueChangeThreshold:", objc_msgSend(v6, "colorTemperatureNotifyValueChangeThreshold"));
  -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:](v31, "setColorTemperatureUpdateIntervalInMilliseconds:", objc_msgSend(v6, "colorTemperatureUpdateIntervalInMilliseconds"));

  return v31;
}

- (HMDNaturalLightingCurve)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  HMDNaturalLightingCurve *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id obj;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[2];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HNLCurve.vk"));
  if (v5 != 1)
  {
    v18 = v5;
    v12 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v58 = v19;
    v59 = 2048;
    v60 = v18;
    v61 = 2048;
    v62 = 1;
    v20 = "%{public}@Curve version is not equal to (%ld != %ld)";
    v21 = v13;
    v22 = 32;
LABEL_14:
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);

    goto LABEL_25;
  }
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HNLCurve.mabk"));
  if (v6 <= 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v19;
    v59 = 2048;
    v60 = v6;
    v20 = "%{public}@Maximum brightness is less than or equal to 0: %ld";
    v21 = v13;
    v22 = 22;
    goto LABEL_14;
  }
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HNLCurve.mibk"));
  v8 = v7;
  if (v7 <= 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v14;
    v59 = 2048;
    v60 = v8;
    v15 = "%{public}@Minimum brightness is less than or equal to 0: %ld";
LABEL_23:
    v16 = v13;
    v17 = 22;
    goto LABEL_24;
  }
  if (v7 >= (unint64_t)v6)
  {
    v12 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v23;
      v59 = 2048;
      v60 = v8;
      v61 = 2048;
      v62 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Minimum brightness is greater than equal to maximum brightness (%ld:%ld)", buf, 0x20u);

    }
    goto LABEL_25;
  }
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HNLCurve.mictk"));
  if (v9 <= 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v14;
    v59 = 2048;
    v60 = v9;
    v15 = "%{public}@Minimum color temperature is less than or equal to 0: %ld";
    goto LABEL_23;
  }
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HNLCurve.mactk"));
  if (!v10)
  {
    v12 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v14;
    v59 = 2048;
    v60 = 0;
    v15 = "%{public}@Maximum color temperature is less than or equal to 0: %ld";
    goto LABEL_23;
  }
  v11 = v10;
  if (v9 > v10)
  {
    v12 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v14;
      v59 = 2048;
      v60 = v9;
      v61 = 2048;
      v62 = v11;
      v15 = "%{public}@Minimum color temperature is greater than maximum color temperature (%ld:%ld)";
      v16 = v13;
      v17 = 32;
LABEL_24:
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);

    }
LABEL_25:

    objc_autoreleasePoolPop(v12);
    v24 = 0;
    goto LABEL_26;
  }
  v45 = v10;
  v26 = (void *)MEMORY[0x24BDBCF20];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("HNLCurve.tpk"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v44 = v9;
    v47 = v28;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v46 = v29;
    obj = v29;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v52 != v32)
            objc_enumerationMutation(obj);
          v34 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v50 = 0;
          objc_msgSend(MEMORY[0x24BE1BA30], "parsedFromData:error:", v34, &v50);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v50;
          if (!v35)
          {
            v38 = (void *)MEMORY[0x227676638]();
            self = self;
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v58 = v40;
              v59 = 2112;
              v60 = v34;
              v61 = 2112;
              v62 = (uint64_t)v36;
              _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse encoded transition point %@:%@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v38);

            v24 = 0;
            v29 = v46;
            v28 = v47;
            v37 = v49;
            goto LABEL_46;
          }
          objc_msgSend(v49, "addObject:", v35);

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v31)
          continue;
        break;
      }
    }

    v37 = v49;
    if (objc_msgSend(v49, "count"))
    {
      self = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:](self, "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:", 1, v49, v8, v6, v44, v45);
      -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:](self, "setColorTemperatureNotifyValueChangeThreshold:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HNLCurve.ctnvctk")));
      -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:](self, "setColorTemperatureNotifyIntervalThresholdInMilliseconds:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("HNLCurve.ctnitk")));
      -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:](self, "setColorTemperatureUpdateIntervalInMilliseconds:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("HNLCurve.ctuik")));
      v24 = self;
    }
    else
    {
      v24 = 0;
    }
    v29 = v46;
    v28 = v47;
LABEL_46:

  }
  else
  {
    v41 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v43;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode transition points", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v41);
    v24 = 0;
  }

LABEL_26:
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDNaturalLightingCurve *v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve version](self, "version"), CFSTR("HNLCurve.vk"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"), CFSTR("HNLCurve.mibk"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"), CFSTR("HNLCurve.mabk"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"), CFSTR("HNLCurve.mictk"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"), CFSTR("HNLCurve.mactk"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold"), CFSTR("HNLCurve.ctnvctk"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"), CFSTR("HNLCurve.ctnitk"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds"), CFSTR("HNLCurve.ctuik"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v18 = 0;
        objc_msgSend(v11, "serializeWithError:", &v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;
        if (!v12)
        {
          v14 = (void *)MEMORY[0x227676638]();
          v15 = self;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v24 = v17;
            v25 = 2112;
            v26 = v11;
            v27 = 2112;
            v28 = v13;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize transition point %@:%@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v14);

          goto LABEL_13;
        }
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      if (v8)
        continue;
      break;
    }
  }

  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HNLCurve.tpk"));
LABEL_13:

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6
    && (v8 = objc_msgSend(v6, "version"), v8 == -[HMDNaturalLightingCurve version](self, "version"))
    && (v9 = objc_msgSend(v7, "minimumBrightness"),
        v9 == -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"))
    && (v10 = objc_msgSend(v7, "maximumBrightness"),
        v10 == -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness")))
  {
    objc_msgSend(v7, "transitionPoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12)
      && (v13 = objc_msgSend(v7, "minimumColorTemperature"),
          v13 == -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"))
      && (v14 = objc_msgSend(v7, "maximumColorTemperature"),
          v14 == -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"))
      && (v15 = objc_msgSend(v7, "colorTemperatureNotifyIntervalThresholdInMilliseconds"),
          v15 == -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"))&& (v16 = objc_msgSend(v7, "colorTemperatureNotifyValueChangeThreshold"), v16 == -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold")))
    {
      v17 = objc_msgSend(v7, "colorTemperatureUpdateIntervalInMilliseconds");
      v18 = v17 == -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds");
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = -[HMDNaturalLightingCurve version](self, "version");
  v4 = -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness") ^ v3;
  v5 = v4 ^ -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness");
  -[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = v5 ^ v7 ^ -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature");
  v9 = -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature");
  v10 = v9 ^ -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds");
  v11 = v10 ^ -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds");
  return v8 ^ v11 ^ -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableNaturalLightingCurve *v4;
  unint64_t v5;
  void *v6;
  HMDMutableNaturalLightingCurve *v7;

  v4 = +[HMDMutableNaturalLightingCurve allocWithZone:](HMDMutableNaturalLightingCurve, "allocWithZone:", a3);
  v5 = -[HMDNaturalLightingCurve version](self, "version");
  -[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:](v4, "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:", v5, v6, -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"), -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"), -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"), -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"));

  -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:](v7, "setColorTemperatureNotifyIntervalThresholdInMilliseconds:", -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"));
  -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:](v7, "setColorTemperatureNotifyValueChangeThreshold:", -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold"));
  -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:](v7, "setColorTemperatureUpdateIntervalInMilliseconds:", -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds"));
  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[13];

  v41[11] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDNaturalLightingCurve version](self, "version"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Version"), v40);
  v41[0] = v39;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Minimum Brightness"), v38);
  v41[1] = v37;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Maximum Brightness"), v36);
  v41[2] = v35;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Transition Points Count"), v33);
  v41[3] = v32;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Transition Start Point"), v30);
  v41[4] = v29;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Minimum Color Temperature"), v28);
  v41[5] = v27;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Maximum Color Temperature"), v26);
  v41[6] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Color Temperature Notify Interval Threshold In Milliseconds"), v13);
  v41[7] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Color Temperature Notify Value Change Threshold"), v16);
  v41[8] = v17;
  v18 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Color Temperature Update Interval In Milliseconds"), v19);
  v41[9] = v20;
  v21 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDNaturalLightingCurve checksum](self, "checksum"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Transition Checksum"), v22);
  v41[10] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (unint64_t)checksum
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v10;
  unint64_t v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CC_SHA256_CTX c;
  unsigned __int8 data[32];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        *(_DWORD *)data = 0;
        *(_DWORD *)data = objc_msgSend(v8, "colorTemperatureForBrightness:", -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"));
        CC_SHA256_Update(&c, data, 4u);
        LODWORD(v11) = 0;
        LODWORD(v11) = objc_msgSend(v8, "colorTemperatureForBrightness:", -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"));
        CC_SHA256_Update(&c, &v11, 4u);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

  v12 = -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold");
  CC_SHA256_Update(&c, &v12, 4u);
  v11 = -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds");
  CC_SHA256_Update(&c, &v11, 8u);
  v10 = -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds");
  CC_SHA256_Update(&c, &v10, 8u);
  CC_SHA256_Final(data, &c);
  return *(_QWORD *)data;
}

- (id)colorTemperatureForBrightness:(int64_t)a3 millisecondsElapsedSinceStartOfDay:(unint64_t)a4
{
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  HMDNaturalLightingCurve *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDNaturalLightingCurve transitionPointsWithmillisecondsElapsedSinceStartOfDay:](self, "transitionPointsWithmillisecondsElapsedSinceStartOfDay:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v10 = 0;
    goto LABEL_11;
  }
  if (-[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness") > a3)
  {
    v9 = -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness");
LABEL_7:
    a3 = v9;
    goto LABEL_8;
  }
  if (-[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness") < a3)
  {
    v9 = -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness");
    goto LABEL_7;
  }
LABEL_8:
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v14;
    v18 = 2048;
    v19 = a4;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Transition point for milliseconds elapsed since start of day %llums is %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "colorTemperatureForBrightness:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v10;
}

- (id)transitionPointsWithmillisecondsElapsedSinceStartOfDay:(unint64_t)a3
{
  HMDNaturalLightingCurve *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t i;
  void *v32;
  void *v33;
  HMDNaturalLightingCurve *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDNaturalLightingCurve *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  unint64_t k;
  void *v55;
  unint64_t j;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  HMDNaturalLightingCurve *v69;
  NSObject *v70;
  void *v71;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  unint64_t v77;
  HMDNaturalLightingCurve *v78;
  void *v79;
  uint64_t v80;
  id obj;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  unint64_t v89;
  _BYTE v90[128];
  uint64_t v91;

  v4 = self;
  v91 = *MEMORY[0x24BDAC8D0];
  -[HMDNaturalLightingCurve transitionPoints](self, "transitionPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDNaturalLightingCurve minimumBrightness](v4, "minimumBrightness");
  v7 = -[HMDNaturalLightingCurve maximumBrightness](v4, "maximumBrightness");
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  if (v8)
  {
    v9 = v8;
    v73 = v7;
    v74 = v6;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v83;
    v78 = v4;
LABEL_3:
    v14 = 0;
    v80 = v10;
    v76 = v10 + v9;
    v15 = v11;
    v16 = v12;
    while (1)
    {
      if (*(_QWORD *)v83 != v13)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v14);
      objc_msgSend(v17, "targetCompletionDuration", v73);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v19, "unsignedLongLongValue") + v15;

      if (v11 == a3)
      {
        v20 = v80 + v14;
        v11 = a3;
        goto LABEL_16;
      }
      if (v15 <= a3 && v11 > a3)
        break;
      v12 = v17;

      ++v14;
      v15 = v11;
      v16 = v12;
      if (v9 == v14)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        v10 = v76;
        v4 = v78;
        if (v9)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    v20 = v80 + v14;
LABEL_16:
    v21 = v17;

    if (!v21)
    {
      v4 = v78;
      goto LABEL_23;
    }
    v22 = v11 - a3;
    if ((uint64_t)(v11 - a3) >= 0)
    {
      v23 = obj;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(obj, "count") + 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == a3)
      {
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BC28]), "initWithValue:", &unk_24E96B270);
        v26 = v21;
        v27 = objc_alloc(MEMORY[0x24BE1BA30]);
        objc_msgSend(v26, "scale");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "offset");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v27, "initWithScale:offset:targetCompletionDuration:startDelayDuration:", v28, v29, v25, 0);

        objc_msgSend(v24, "addObject:", v30);
        for (i = v20 + 1; i < objc_msgSend(obj, "count"); ++i)
        {
          objc_msgSend(obj, "objectAtIndex:", i);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v32);

        }
        if (v20)
        {
          for (j = 1; j <= v20; ++j)
          {
            objc_msgSend(obj, "objectAtIndex:", j);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v57);

          }
        }

        v21 = v26;
      }
      else if (v16)
      {
        objc_msgSend(v21, "targetCompletionDuration");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "value");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "unsignedLongLongValue") - v22;

        v46 = objc_alloc(MEMORY[0x24BE1BC28]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v22);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v46, "initWithValue:", v47);

        v77 = v45;
        objc_msgSend(MEMORY[0x24BE1BA30], "transitionPointWithPreviousTransitionPoint:nextTransitionPoint:timeElapsedSincePreviousTransitionPoint:minimumBrightness:maximumBrightness:", v16, v21, v45, v74, v73);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:");
        v50 = objc_alloc(MEMORY[0x24BE1BA30]);
        objc_msgSend(v21, "scale");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "offset");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = (void *)v48;
        v53 = objc_msgSend(v50, "initWithScale:offset:targetCompletionDuration:startDelayDuration:", v51, v52, v48, 0);

        v75 = (void *)v53;
        objc_msgSend(v24, "addObject:", v53);
        for (k = v20 + 1; k < objc_msgSend(obj, "count"); ++k)
        {
          objc_msgSend(obj, "objectAtIndex:", k);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v55);

        }
        if (v20 >= 2)
        {
          v58 = 1;
          do
          {
            objc_msgSend(obj, "objectAtIndex:", v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v59);

            ++v58;
          }
          while (v80 + v14 != v58);
        }
        v60 = objc_alloc(MEMORY[0x24BE1BA30]);
        v61 = v49;
        objc_msgSend(v49, "scale");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "offset");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_alloc(MEMORY[0x24BE1BC28]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v77);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)objc_msgSend(v64, "initWithValue:", v65);
        v67 = (void *)objc_msgSend(v60, "initWithScale:offset:targetCompletionDuration:startDelayDuration:", v62, v63, v66, 0);

        objc_msgSend(v24, "addObject:", v67);
        v23 = obj;
      }
      else
      {
        v68 = (void *)MEMORY[0x227676638]();
        v69 = v78;
        HMFGetOSLogHandle();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v87 = v71;
          v88 = 2048;
          v89 = a3;
          _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_ERROR, "%{public}@Next transition point for current time: %llums not found", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v68);
        v23 = obj;
      }
      v37 = (void *)objc_msgSend(v24, "copy");

      goto LABEL_46;
    }
    v38 = v21;
    v39 = (void *)MEMORY[0x227676638]();
    v40 = v78;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v42;
      v88 = 2048;
      v89 = v22;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Time to reach next transiton point is negative: %lldms", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);

  }
  else
  {
    v12 = 0;
LABEL_13:

    v16 = v12;
LABEL_23:
    v33 = (void *)MEMORY[0x227676638]();
    v34 = v4;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v36;
      v88 = 2048;
      v89 = a3;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Next transition point for current time: %llums not found", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
  }
  v37 = (void *)MEMORY[0x24BDBD1A8];
  v23 = obj;
LABEL_46:

  return v37;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSArray)transitionPoints
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)minimumBrightness
{
  return self->_minimumBrightness;
}

- (int64_t)maximumBrightness
{
  return self->_maximumBrightness;
}

- (int64_t)minimumColorTemperature
{
  return self->_minimumColorTemperature;
}

- (int64_t)maximumColorTemperature
{
  return self->_maximumColorTemperature;
}

- (unint64_t)colorTemperatureNotifyValueChangeThreshold
{
  return self->_colorTemperatureNotifyValueChangeThreshold;
}

- (void)setColorTemperatureNotifyValueChangeThreshold:(unint64_t)a3
{
  self->_colorTemperatureNotifyValueChangeThreshold = a3;
}

- (unint64_t)colorTemperatureNotifyIntervalThresholdInMilliseconds
{
  return self->_colorTemperatureNotifyIntervalThresholdInMilliseconds;
}

- (void)setColorTemperatureNotifyIntervalThresholdInMilliseconds:(unint64_t)a3
{
  self->_colorTemperatureNotifyIntervalThresholdInMilliseconds = a3;
}

- (unint64_t)colorTemperatureUpdateIntervalInMilliseconds
{
  return self->_colorTemperatureUpdateIntervalInMilliseconds;
}

- (void)setColorTemperatureUpdateIntervalInMilliseconds:(unint64_t)a3
{
  self->_colorTemperatureUpdateIntervalInMilliseconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionPoints, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)colorTemperatureMiredsFromKelvins:(int64_t)a3
{
  void *v4;
  SEL v5;

  if (a3)
    return 1000000 / a3;
  v4 = (void *)_HMFPreconditionFailure();
  return (int64_t)+[HMDNaturalLightingCurve logCategory](v4, v5);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_94259 != -1)
    dispatch_once(&logCategory__hmf_once_t19_94259, &__block_literal_global_94260);
  return (id)logCategory__hmf_once_v20_94261;
}

void __38__HMDNaturalLightingCurve_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_94261;
  logCategory__hmf_once_v20_94261 = v0;

}

@end
