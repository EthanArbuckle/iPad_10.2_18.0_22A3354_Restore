@implementation HMDNaturalLightingCurveWriter

- (HMDNaturalLightingCurveWriter)initWithUUID:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDLightProfileDataSource *v11;
  void *v12;
  HMDNaturalLightingCurveWriter *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HMDLightProfileDataSource);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDNaturalLightingCurveWriter initWithUUID:workQueue:logIdentifier:dataSource:notificationCenter:timerFactory:](self, "initWithUUID:workQueue:logIdentifier:dataSource:notificationCenter:timerFactory:", v10, v9, v8, v11, v12, &__block_literal_global_181967);

  return v13;
}

- (HMDNaturalLightingCurveWriter)initWithUUID:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5 dataSource:(id)a6 notificationCenter:(id)a7 timerFactory:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMDNaturalLightingCurveWriter *v19;
  void *v20;
  id timerFactory;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMDNaturalLightingCurveWriter;
  v19 = -[HMDNaturalLightingCurveWriter init](&v25, sel_init);
  if (v19)
  {
    v20 = _Block_copy(v18);
    timerFactory = v19->_timerFactory;
    v19->_timerFactory = v20;

    objc_storeStrong((id *)&v19->_UUID, a3);
    objc_storeStrong((id *)&v19->_workQueue, a4);
    objc_storeStrong((id *)&v19->_logIdentifier, a5);
    objc_storeStrong((id *)&v19->_dataSource, a6);
    objc_storeStrong((id *)&v19->_notificationCenter, a7);
  }

  return v19;
}

- (void)configureWithLightProfile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDNaturalLightingCurveWriter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDNaturalLightingCurveWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1D17BA0A0](-[HMDNaturalLightingCurveWriter setLightProfile:](self, "setLightProfile:", v4));
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "residentDeviceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addDataSource:", v9);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__HMDNaturalLightingCurveWriter_configureWithLightProfile___block_invoke;
  v16[3] = &unk_1E89C2350;
  v16[4] = v9;
  objc_msgSend(v12, "confirmWithCompletionHandler:", v16);
  -[HMDNaturalLightingCurveWriter notificationCenter](v9, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "residentDeviceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v14);

  -[HMDNaturalLightingCurveWriter notificationCenter](v9, "notificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

  -[HMDNaturalLightingCurveWriter setCurrentDevicePrimaryResident:](v9, "setCurrentDevicePrimaryResident:", objc_msgSend(v7, "isCurrentDeviceConfirmedPrimaryResident"));
  -[HMDNaturalLightingCurveWriter handleCurrentDevicePrimaryResidentChangedWithReason:](v9, "handleCurrentDevicePrimaryResidentChangedWithReason:", CFSTR("Configure"));

}

- (void)handleActiveTransitionContextUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  HMDNaturalLightingCurveWriter *v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  HMDNaturalLightingCurveWriter *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDNaturalLightingCurveWriter *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD, double);
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  int v51;
  void *v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDNaturalLightingCurveWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDNaturalLightingCurveWriter isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
  {
    if (v4)
    {
      -[HMDNaturalLightingCurveWriter dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNaturalLightingCurveWriter dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", v8);
      v12 = v11;

      if (v12 >= 0.0)
      {
        -[HMDNaturalLightingCurveWriter dataSource](self, "dataSource");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "naturalLightingCurveUpdateInterval");
        v28 = v27;

        v29 = v28 - v12;
        if (v28 - v12 <= 0.0)
        {
          v45 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = self;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 138543874;
            v52 = v47;
            v53 = 2048;
            v54 = v12;
            v55 = 2048;
            v56 = v28;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Updating curve since time elapsed since transition start is greater than curve update interval %f:%f", (uint8_t *)&v51, 0x20u);

          }
          objc_autoreleasePoolPop(v45);
          v17 = CFSTR("transition start is greater than curve update interval");
        }
        else
        {
          v30 = (double)(unint64_t)objc_msgSend(v4, "millisecondsElapsedSinceStartDate") / 1000.0;
          v31 = vabdd_f64(v30, v12);
          -[HMDNaturalLightingCurveWriter dataSource](self, "dataSource");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold");
          v34 = v33;

          v35 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
          if (v31 < v34)
          {
            if (v37)
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = 138543618;
              v52 = v38;
              v53 = 2048;
              v54 = v29;
              _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Starting timer for natural lighting curve update: %fs", (uint8_t *)&v51, 0x16u);

            }
            objc_autoreleasePoolPop(v35);
            -[HMDNaturalLightingCurveWriter timerFactory](v14, "timerFactory");
            v39 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
            v39[2](v39, 0, v29);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDNaturalLightingCurveWriter setPeriodicCharacteristicWriteTimer:](v14, "setPeriodicCharacteristicWriteTimer:", v40);

            -[HMDNaturalLightingCurveWriter periodicCharacteristicWriteTimer](v14, "periodicCharacteristicWriteTimer");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setDelegate:", v14);

            -[HMDNaturalLightingCurveWriter workQueue](v14, "workQueue");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDNaturalLightingCurveWriter periodicCharacteristicWriteTimer](v14, "periodicCharacteristicWriteTimer");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setDelegateQueue:", v42);

            -[HMDNaturalLightingCurveWriter periodicCharacteristicWriteTimer](v14, "periodicCharacteristicWriteTimer");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "resume");

            goto LABEL_25;
          }
          if (v37)
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDNaturalLightingCurveWriter dataSource](v14, "dataSource");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold");
            v51 = 138544386;
            v52 = v48;
            v53 = 2048;
            v54 = v30;
            v55 = 2048;
            v56 = v12;
            v57 = 2048;
            v58 = v31;
            v59 = 2048;
            v60 = v50;
            _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Updating curve because accessory time (%fs) and controller time (%fs) difference (%fs) is greater than threshold (%fs)", (uint8_t *)&v51, 0x34u);

          }
          objc_autoreleasePoolPop(v35);
          v17 = CFSTR("accessory and controller time difference");
        }
      }
      else
      {
        v13 = (void *)MEMORY[0x1D17BA0A0]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 138543874;
          v52 = v16;
          v53 = 2112;
          v54 = *(double *)&v7;
          v55 = 2112;
          v56 = *(double *)&v8;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating curve because transition start date is ahead of the current date %@:%@", (uint8_t *)&v51, 0x20u);

        }
        objc_autoreleasePoolPop(v13);
        v17 = CFSTR("start date is ahead of the current date");
      }
      -[HMDNaturalLightingCurveWriter writeForNaturalLightingEnabledWithReason:](v14, "writeForNaturalLightingEnabledWithReason:", v17);
LABEL_25:

      goto LABEL_26;
    }
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543618;
      v52 = v25;
      v53 = 2112;
      v54 = 0.0;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Stopping characteristic write timer because active transition context is not set: %@", (uint8_t *)&v51, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDNaturalLightingCurveWriter setPeriodicCharacteristicWriteTimer:](v23, "setPeriodicCharacteristicWriteTimer:", 0);
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543362;
      v52 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Skipping active transition context update because current device is not primary resident", (uint8_t *)&v51, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
  }
LABEL_26:

}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNaturalLightingCurveWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HMDNaturalLightingCurveWriter_handlePrimaryResidentUpdateNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleCurrentDevicePrimaryResidentChangedWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDNaturalLightingCurveWriter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDNaturalLightingCurveWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNaturalLightingCurveWriter isCurrentDevicePrimaryResident](v7, "isCurrentDevicePrimaryResident");
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling current device primary resident changed: %@ with reason: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDNaturalLightingCurveWriter lightProfile](v7, "lightProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDNaturalLightingCurveWriter isCurrentDevicePrimaryResident](v7, "isCurrentDevicePrimaryResident"))
  {
    objc_msgSend(v11, "setNaturalLightingCharacteristicsNotificationEnabled:forObserver:", 1, v7);
  }
  else
  {
    objc_msgSend(v11, "setNaturalLightingCharacteristicsNotificationEnabled:forObserver:", 0, v7);
    -[HMDNaturalLightingCurveWriter setPeriodicCharacteristicWriteTimer:](v7, "setPeriodicCharacteristicWriteTimer:", 0);
  }

}

- (void)writeWithNaturalLightingEnabled:(BOOL)a3 reason:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDNaturalLightingCurveWriter *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[HMDNaturalLightingCurveWriter workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (-[HMDNaturalLightingCurveWriter isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
  {
    -[HMDNaturalLightingCurveWriter lightProfile](self, "lightProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setNaturalLightingEnabled:completion:", v6, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v18);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping curve write with reason because current device is not a primary resident: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v17);

  }
}

- (void)synchronizeCurveWithActiveTransitionContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDNaturalLightingCurveWriter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDNaturalLightingCurveWriter *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDNaturalLightingCurveWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Synchronizing curve...", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDNaturalLightingCurveWriter lightProfile](v7, "lightProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v22;
      v23 = "%{public}@Sychronizing curve failed, home is not configured";
      v24 = v20;
      v25 = OS_LOG_TYPE_ERROR;
LABEL_14:
      _os_log_impl(&dword_1CD062000, v24, v25, v23, (uint8_t *)&v27, 0xCu);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (!-[HMDNaturalLightingCurveWriter isCurrentDevicePrimaryResident](v7, "isCurrentDevicePrimaryResident"))
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v22;
      v23 = "%{public}@Skipping synchronizing curve, device is not a primary resident";
      goto LABEL_13;
    }
LABEL_15:

    objc_autoreleasePoolPop(v18);
    goto LABEL_16;
  }
  objc_msgSend(v10, "naturalLightingCurve");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "checksum");

  objc_msgSend(v4, "transitionChecksum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedLongLongValue");

  objc_msgSend(v4, "transitionChecksum");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = v7;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v17 && v14 == v16)
  {
    if (v21)
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v22;
      v23 = "%{public}@Skipping synchronizing curve, transition checksum has not changed";
LABEL_13:
      v24 = v20;
      v25 = OS_LOG_TYPE_INFO;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (v21)
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v26;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Start sychronizing curve", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  -[HMDNaturalLightingCurveWriter writeForNaturalLightingEnabledWithReason:](v19, "writeForNaturalLightingEnabledWithReason:", CFSTR("curve updated"));
LABEL_16:

}

- (void)writeForNaturalLightingEnabledWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNaturalLightingCurveWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDNaturalLightingCurveWriter setPeriodicCharacteristicWriteTimer:](self, "setPeriodicCharacteristicWriteTimer:", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HMDNaturalLightingCurveWriter_writeForNaturalLightingEnabledWithReason___block_invoke;
  v7[3] = &unk_1E89C21C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HMDNaturalLightingCurveWriter writeWithNaturalLightingEnabled:reason:completion:](self, "writeWithNaturalLightingEnabled:reason:completion:", 1, v6, v7);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDNaturalLightingCurveWriter *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDNaturalLightingCurveWriter *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDNaturalLightingCurveWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDNaturalLightingCurveWriter periodicCharacteristicWriteTimer](self, "periodicCharacteristicWriteTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDNaturalLightingCurveWriter lightProfile](self, "lightProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isNaturalLightingEnabled");

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v19;
        v24 = 2112;
        v25 = v4;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Rewriting the characteristic because timer: %@ fired", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timer expired: %@"), v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNaturalLightingCurveWriter writeForNaturalLightingEnabledWithReason:](v16, "writeForNaturalLightingEnabledWithReason:", v20);

    }
    else
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v21;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Canceling periodic characteristic writer timer because natural lighting is no longer enabled", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDNaturalLightingCurveWriter setPeriodicCharacteristicWriteTimer:](v16, "setPeriodicCharacteristicWriteTimer:", 0);
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNaturalLightingCurveWriter periodicCharacteristicWriteTimer](v8, "periodicCharacteristicWriteTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Received timer did fire callback for unknown timer. Expected: %@ received: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  return objc_msgSend(a3, "supportsNaturalLighting");
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (HMDLightProfile)lightProfile
{
  return (HMDLightProfile *)objc_loadWeakRetained((id *)&self->_lightProfile);
}

- (void)setLightProfile:(id)a3
{
  objc_storeWeak((id *)&self->_lightProfile, a3);
}

- (HMFTimer)periodicCharacteristicWriteTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeriodicCharacteristicWriteTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (double)naturalLightingCurveUpdateInterval
{
  return self->_naturalLightingCurveUpdateInterval;
}

- (double)naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold
{
  return self->_naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold;
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 80, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_currentDevicePrimaryResident;
}

- (void)setCurrentDevicePrimaryResident:(BOOL)a3
{
  self->_currentDevicePrimaryResident = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_periodicCharacteristicWriteTimer, 0);
  objc_destroyWeak((id *)&self->_lightProfile);
  objc_storeStrong(&self->_timerFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

void __74__HMDNaturalLightingCurveWriter_writeForNaturalLightingEnabledWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      v10 = "%{public}@Failed to update the curve with reason %@:%@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v10 = "%{public}@Successfully updated curve with reason %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __73__HMDNaturalLightingCurveWriter_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lightProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentDeviceConfirmedPrimaryResident");

  if ((_DWORD)v5 != objc_msgSend(*(id *)(a1 + 32), "isCurrentDevicePrimaryResident"))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "isCurrentDevicePrimaryResident");
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device primary changed from: (%@->%@)", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDevicePrimaryResident:", v5);
    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleCurrentDevicePrimaryResidentChangedWithReason:", v13);

  }
}

void __59__HMDNaturalLightingCurveWriter_configureWithLightProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Failed to confirm primary resident with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Successfully confirmed primary resident";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

id __70__HMDNaturalLightingCurveWriter_initWithUUID_workQueue_logIdentifier___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_181970 != -1)
    dispatch_once(&logCategory__hmf_once_t19_181970, &__block_literal_global_17_181971);
  return (id)logCategory__hmf_once_v20_181972;
}

void __44__HMDNaturalLightingCurveWriter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_181972;
  logCategory__hmf_once_v20_181972 = v0;

}

@end
