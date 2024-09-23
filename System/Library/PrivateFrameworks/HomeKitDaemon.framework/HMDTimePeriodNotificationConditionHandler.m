@implementation HMDTimePeriodNotificationConditionHandler

- (HMDTimePeriodNotificationConditionHandler)initWithHome:(id)a3
{
  id v4;
  HMDTimePeriodNotificationConditionDefaultTimeProvider *v5;
  HMDTimePeriodNotificationConditionDefaultSunsetSunriseProvider *v6;
  HMDTimePeriodNotificationConditionHandler *v7;

  v4 = a3;
  v5 = objc_alloc_init(HMDTimePeriodNotificationConditionDefaultTimeProvider);
  v6 = objc_alloc_init(HMDTimePeriodNotificationConditionDefaultSunsetSunriseProvider);
  v7 = -[HMDTimePeriodNotificationConditionHandler initWithHome:timeProvider:sunriseSunsetProvider:](self, "initWithHome:timeProvider:sunriseSunsetProvider:", v4, v5, v6);

  return v7;
}

- (HMDTimePeriodNotificationConditionHandler)initWithHome:(id)a3 timeProvider:(id)a4 sunriseSunsetProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDTimePeriodNotificationConditionHandler *v11;
  HMDTimePeriodNotificationConditionHandler *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDTimePeriodNotificationConditionHandler;
  v11 = -[HMDTimePeriodNotificationConditionHandler init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_home, v8);
    objc_storeStrong((id *)&v12->_timeProvider, a4);
    objc_storeStrong((id *)&v12->_sunriseSunsetProvider, a5);
  }

  return v12;
}

- (BOOL)canHandleCondition:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = objc_opt_isKindOfClass() & (v3 != 0);

  return v4;
}

- (BOOL)conditionPasses:(id)a3 registrationUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDTimePeriodNotificationConditionHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  HMDTimePeriodNotificationConditionHandler *v26;
  HMDTimePeriodNotificationConditionHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDTimePeriodNotificationConditionHandler *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v48 = a4;
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "startElement");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endElement");
    v11 = objc_claimAutoreleasedReturnValue();
    -[HMDTimePeriodNotificationConditionHandler home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v10;
    -[HMDTimePeriodNotificationConditionHandler _dateComponentsForTimePeriodElement:home:](self, "_dateComponentsForTimePeriodElement:home:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v11;
    -[HMDTimePeriodNotificationConditionHandler _dateComponentsForTimePeriodElement:home:](self, "_dateComponentsForTimePeriodElement:home:", v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v18;
      v51 = 2112;
      v52 = v13;
      v53 = 2112;
      v54 = v14;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Start: %@ End: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    if (v13 && v14)
    {
      v44 = v12;
      -[HMDTimePeriodNotificationConditionHandler _dateTodayMatchingComponents:](v16, "_dateTodayMatchingComponents:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTimePeriodNotificationConditionHandler _dateTodayMatchingComponents:](v16, "_dateTodayMatchingComponents:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTimePeriodNotificationConditionHandler timeProvider](v16, "timeProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentDate");
      v22 = objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v19, "compare:", v20);
      v24 = objc_alloc(MEMORY[0x24BDD1508]);
      v45 = (void *)v22;
      if (v23 == -1)
      {
        v25 = (void *)objc_msgSend(v24, "initWithStartDate:endDate:", v19, v20);
        LOBYTE(v26) = objc_msgSend(v25, "containsDate:", v22);
      }
      else
      {
        v25 = (void *)objc_msgSend(v24, "initWithStartDate:endDate:", v20, v19);
        LODWORD(v26) = objc_msgSend(v25, "containsDate:", v22) ^ 1;
      }

      v35 = (void *)MEMORY[0x227676638]();
      v36 = v16;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = v14;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v41 = v35;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v38;
        v51 = 2112;
        v52 = v7;
        v53 = 2112;
        v54 = v39;
        v55 = 2112;
        v56 = v19;
        v57 = 2112;
        v58 = v20;
        v59 = 2112;
        v60 = v45;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Condition: %@ passes: %@ for Start: %@ End: %@ Time: %@", buf, 0x3Eu);

        v35 = v41;
        v14 = v43;
      }

      objc_autoreleasePoolPop(v35);
      v32 = v46;
      v12 = v44;
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v26 = v16;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v46;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = v14;
        v33 = v12;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = v34;
        v51 = 2112;
        v52 = v47;
        v53 = 2112;
        v54 = v46;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve date components for startElement: %@ endElement: %@", buf, 0x20u);

        v12 = v33;
        v14 = v42;
      }

      objc_autoreleasePoolPop(v30);
      LOBYTE(v26) = 0;
    }

  }
  else
  {
    v26 = (HMDTimePeriodNotificationConditionHandler *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v29;
      v51 = 2112;
      v52 = v7;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Attempting to evaluate a non-time period condition: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    LOBYTE(v26) = 0;
  }

  return (char)v26;
}

- (id)_dateComponentsForTimePeriodElement:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMDTimePeriodNotificationConditionHandler *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDTimePeriodNotificationConditionHandler *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v15 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    v14 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v14, "setHour:", objc_msgSend(v17, "hour"));
    v18 = objc_msgSend(v17, "minute");

    objc_msgSend(v14, "setMinute:", v18);
    objc_msgSend(v14, "setSecond:", 0);
    goto LABEL_22;
  }
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    v19 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    objc_msgSend(v21, "significantEvent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD6CF8]);

    if (v23)
    {
      -[HMDTimePeriodNotificationConditionHandler sunriseSunsetProvider](self, "sunriseSunsetProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sunriseTimeForHome:", v7);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v21, "significantEvent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BDD6D00]);

      if (!v27)
      {
        v34 = (void *)MEMORY[0x227676638]();
        v35 = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "significantEvent");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 138543618;
          v41 = v37;
          v42 = 2112;
          v43 = v38;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Only sunrise & sunset are supported, not: %@", (uint8_t *)&v40, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
        v14 = 0;
        goto LABEL_21;
      }
      -[HMDTimePeriodNotificationConditionHandler sunriseSunsetProvider](self, "sunriseSunsetProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sunsetTimeForHome:", v7);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v25;

    v29 = objc_alloc(MEMORY[0x24BDBCE48]);
    v30 = (void *)objc_msgSend(v29, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(v21, "offset");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dateByAddingComponents:toDate:options:", v31, v28, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "hmf_dateComponents");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v14, "setHour:", objc_msgSend(v33, "hour"));
    objc_msgSend(v14, "setMinute:", objc_msgSend(v33, "minute"));

LABEL_21:
    goto LABEL_22;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138543618;
    v41 = v13;
    v42 = 2112;
    v43 = v6;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unsupported HMDTimePeriodElement: %@", (uint8_t *)&v40, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v14 = 0;
LABEL_22:

  return v14;
}

- (id)_dateTodayMatchingComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[HMDTimePeriodNotificationConditionHandler timeProvider](self, "timeProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 124, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHour:", objc_msgSend(v4, "hour"));
  v9 = objc_msgSend(v4, "minute");

  objc_msgSend(v8, "setMinute:", v9);
  objc_msgSend(v7, "dateFromComponents:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMDTimePeriodNotificationConditionTimeProvider)timeProvider
{
  return (HMDTimePeriodNotificationConditionTimeProvider *)objc_getProperty(self, a2, 16, 1);
}

- (HMDTimePeriodNotificationConditionSunsetSunriseProvider)sunriseSunsetProvider
{
  return (HMDTimePeriodNotificationConditionSunsetSunriseProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sunriseSunsetProvider, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_33562 != -1)
    dispatch_once(&logCategory__hmf_once_t10_33562, &__block_literal_global_33563);
  return (id)logCategory__hmf_once_v11_33564;
}

void __56__HMDTimePeriodNotificationConditionHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_33564;
  logCategory__hmf_once_v11_33564 = v0;

}

@end
