@implementation HMDAccessoryFirmwareUpdateTimeWindowPolicy

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startTimeComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endTimeComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v5;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryFirmwareUpdateTimeWindowPolicy *v4;
  HMDAccessoryFirmwareUpdateTimeWindowPolicy *v5;
  HMDAccessoryFirmwareUpdateTimeWindowPolicy *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (HMDAccessoryFirmwareUpdateTimeWindowPolicy *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startTimeComponents");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](v6, "updateTimeWindow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startTimeComponents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v10))
      {
        -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endTimeComponents");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](v6, "updateTimeWindow");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "endTimeComponents");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v12;
        if (objc_msgSend(v12, "isEqual:", v13))
        {
          -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryFirmwareUpdatePolicy accessory](v6, "accessory");
          v21 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v19, "isEqual:", v15) ^ 1;

          v11 = v21;
        }
        else
        {
          LOBYTE(v16) = 1;
        }

      }
      else
      {
        LOBYTE(v16) = 1;
      }

      v17 = v16 ^ 1;
    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (HMDAccessoryFirmwareUpdateTimeWindowPolicy)initWithAccessory:(id)a3 timeWindow:(id)a4 workQueue:(id)a5
{
  id v9;
  HMDAccessoryFirmwareUpdateTimeWindowPolicy *v10;
  HMDAccessoryFirmwareUpdateTimeWindowPolicy *v11;
  NSDateFormatter *v12;
  NSDateFormatter *dateFormatter;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDAccessoryFirmwareUpdateTimeWindowPolicy;
  v10 = -[HMDAccessoryFirmwareUpdatePolicy initWithAccessory:workQueue:](&v15, sel_initWithAccessory_workQueue_, a3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_updateTimeWindow, a4);
    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v11->_dateFormatter;
    v11->_dateFormatter = v12;

    -[NSDateFormatter setDateFormat:](v11->_dateFormatter, "setDateFormat:", CFSTR("HH:mm"));
  }

  return v11;
}

- (void)configure
{
  -[HMDAccessoryFirmwareUpdatePolicy setStatus:](self, "setStatus:", -[HMDAccessoryFirmwareUpdateTimeWindowPolicy evaluate](self, "evaluate"));
}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  HMDAccessoryFirmwareUpdateTimeWindowPolicy *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  BOOL v38;
  void *v39;
  HMDAccessoryFirmwareUpdateTimeWindowPolicy *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDAccessoryFirmwareUpdateTimeWindowPolicy *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 252, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startTimeComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHour:", objc_msgSend(v7, "hour"));

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startTimeComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinute:", objc_msgSend(v9, "minute"));

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startTimeComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecond:", objc_msgSend(v11, "second"));

  objc_msgSend(v3, "dateFromComponents:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endTimeComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHour:", objc_msgSend(v14, "hour"));

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endTimeComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinute:", objc_msgSend(v16, "minute"));

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy updateTimeWindow](self, "updateTimeWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endTimeComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecond:", objc_msgSend(v18, "second"));

  objc_msgSend(v3, "dateFromComponents:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "compare:", v19) == 1)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "compare:", v19);

    if (v22 == 1)
    {
      objc_msgSend(v20, "setDay:", 1);
      objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v20, v19, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v19;
      v19 = (void *)v23;
    }
    else
    {
      objc_msgSend(v20, "setDay:", -1);
      objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v20, v12, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v24 = v12;
      v12 = (void *)v25;
    }

  }
  v26 = -[HMDAccessoryFirmwareUpdateTimeWindowPolicy _stopReevaluateTimer](self, "_stopReevaluateTimer");
  if (!v12 || !v19)
  {
    v39 = (void *)MEMORY[0x1D17BA0A0](v26);
    v40 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v42;
      _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Invalid time window, policy status evaluated to NO", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v39);
    v27 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v27, "setHour:", 12);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v27, v43, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryFirmwareUpdateTimeWindowPolicy _startReevaluateTimer:](v40, "_startReevaluateTimer:", v44);
    goto LABEL_15;
  }
  v56 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1D17BA0A0]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateTimeWindowPolicy dateFormatter](v29, "dateFormatter");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringFromDate:", v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateTimeWindowPolicy dateFormatter](v29, "dateFormatter");
    v55 = v3;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringFromDate:", v56);
    v32 = objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateTimeWindowPolicy dateFormatter](v29, "dateFormatter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringFromDate:", v19);
    v54 = v28;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v58 = v51;
    v59 = 2112;
    v60 = v31;
    v61 = 2112;
    v62 = v32;
    v35 = (void *)v32;
    v63 = 2112;
    v64 = v34;
    _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Evaluate now=%@ in interval=[%@, %@]", buf, 0x2Au);

    v3 = v55;
    v28 = v54;

  }
  objc_autoreleasePoolPop(v28);
  if (objc_msgSend(v27, "compare:", v19) == 1)
  {
    v36 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v36, "setDay:", 1);
    objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v36, v56, 0);
    v37 = objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryFirmwareUpdateTimeWindowPolicy _startReevaluateTimer:](v29, "_startReevaluateTimer:", v37);
    v38 = 0;
    v12 = (void *)v37;
    goto LABEL_18;
  }
  v12 = v56;
  if (objc_msgSend(v27, "compare:", v56) == -1)
  {
    -[HMDAccessoryFirmwareUpdateTimeWindowPolicy _startReevaluateTimer:](v29, "_startReevaluateTimer:", v56);
LABEL_15:
    v38 = 0;
    goto LABEL_18;
  }
  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy _startReevaluateTimer:](v29, "_startReevaluateTimer:", v19);
  v38 = 1;
LABEL_18:

  v45 = (void *)MEMORY[0x1D17BA0A0]();
  v46 = self;
  HMFGetOSLogHandle();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v48;
    v59 = 2112;
    v60 = v49;
    _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v45);

  return v38;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy reevaluateTimer](self, "reevaluateTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[HMDAccessoryFirmwareUpdatePolicy evaluateAndNotify](self, "evaluateAndNotify");
}

- (void)_startReevaluateTimer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, v8);
  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy setReevaluateTimer:](self, "setReevaluateTimer:", v9);

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy reevaluateTimer](self, "reevaluateTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy reevaluateTimer](self, "reevaluateTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegateQueue:", v11);

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy reevaluateTimer](self, "reevaluateTimer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

}

- (void)_stopReevaluateTimer
{
  void *v3;

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy reevaluateTimer](self, "reevaluateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDAccessoryFirmwareUpdateTimeWindowPolicy setReevaluateTimer:](self, "setReevaluateTimer:", 0);
}

- (HMFTimer)reevaluateTimer
{
  return self->_reevaluateTimer;
}

- (void)setReevaluateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reevaluateTimer, a3);
}

- (HMDAccessoryFirmwareUpdateTimeWindow)updateTimeWindow
{
  return self->_updateTimeWindow;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_updateTimeWindow, 0);
  objc_storeStrong((id *)&self->_reevaluateTimer, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_117370 != -1)
    dispatch_once(&logCategory__hmf_once_t2_117370, &__block_literal_global_64_117371);
  return (id)logCategory__hmf_once_v3_117372;
}

void __57__HMDAccessoryFirmwareUpdateTimeWindowPolicy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_117372;
  logCategory__hmf_once_v3_117372 = v0;

}

@end
