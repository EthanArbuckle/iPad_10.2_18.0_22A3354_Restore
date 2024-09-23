@implementation HMDAccessoryFirmwareUpdateTimedAutomationPolicy

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v4;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v5;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)a3;
  if (self == v4)
  {
    v9 = 1;
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
      -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdatePolicy accessory](v6, "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v6;
  NSObject *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy _getMaxUpdateApplyEndTime](self, "_getMaxUpdateApplyEndTime");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy _getTriggerFireDateBeforeEndTime:](self, "_getTriggerFireDateBeforeEndTime:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {

        goto LABEL_2;
      }
      v13 = (void *)v12;
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to NO", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v18);
      -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy _startReevaluateTimer:](v15, "_startReevaluateTimer:");

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Invalid max update apply end time, policy status evaluated to NO", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
    }
    return 0;
  }
LABEL_2:
  v5 = (void *)MEMORY[0x227676638](-[HMDAccessoryFirmwareUpdateTimedAutomationPolicy _stopReevaluateTimer](self, "_stopReevaluateTimer"));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to YES", (uint8_t *)&v23, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  return 1;
}

- (id)_getMaxUpdateApplyEndTime
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firmwareUpdateProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v14;
      v15 = "%{public}@Invalid update profile";
LABEL_8:
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);

    }
LABEL_9:

    objc_autoreleasePoolPop(v11);
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "firmwareUpdateProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "updateDuration");

  if (!v6)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v14;
      v15 = "%{public}@Invalid update duration";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v7 = applyGuardTime() + v6;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 128, v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

- (id)_getTriggerFireDateBeforeEndTime:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v46;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v58;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v4, "triggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v6)
  {
    v7 = v6;
    v56 = *(_QWORD *)v66;
    v55 = v5;
    v52 = v4;
    v53 = v3;
    while (2)
    {
      v8 = 0;
      v9 = v56;
      v57 = v7;
      do
      {
        if (*(_QWORD *)v66 != v9)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v8);
        if (objc_msgSend(v10, "isAssociatedWithAccessory:", v3))
        {
          v11 = v10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          v14 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
          v16 = v15;

          if (v13)
          {
            v17 = (void *)MEMORY[0x227676638]();
            v18 = self;
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v20 = v16;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v71 = v21;
              _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Evaluating timer trigger...", buf, 0xCu);

              v16 = v20;
              v5 = v55;
              v9 = v56;
            }

            objc_autoreleasePoolPop(v17);
            objc_msgSend(v13, "currentFireDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v60, "compare:", v22);

            v24 = v23 == 1;
            v7 = v57;
            if (v24)
            {
              v46 = (void *)MEMORY[0x227676638]();
              v47 = v18;
              HMFGetOSLogHandle();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "name");
                v50 = v16;
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v71 = v49;
                v72 = 2112;
                v73 = v51;
                _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@Update could be interrupted by trigger:%@", buf, 0x16u);

                v16 = v50;
                v5 = v55;

              }
              objc_autoreleasePoolPop(v46);
              objc_msgSend(v13, "currentFireDate");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

              v4 = v52;
              goto LABEL_42;
            }
          }
          else
          {
            v25 = (void *)MEMORY[0x227676638]();
            v58 = self;
            HMFGetOSLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
            if (v16)
            {
              if (v27)
              {
                HMFGetLogIdentifier();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v71 = v28;
                _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Evaluating event trigger...", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v25);
              v63 = 0u;
              v64 = 0u;
              v61 = 0u;
              v62 = 0u;
              v54 = v16;
              objc_msgSend(v16, "timeEvents");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v62;
                while (2)
                {
                  for (i = 0; i != v31; ++i)
                  {
                    if (*(_QWORD *)v62 != v32)
                      objc_enumerationMutation(v29);
                    v34 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                    objc_msgSend(v34, "_nextTimerDate");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = objc_msgSend(v60, "compare:", v35);

                    if (v36 == 1)
                    {
                      v40 = (void *)MEMORY[0x227676638]();
                      v41 = v58;
                      HMFGetOSLogHandle();
                      v42 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v14, "name");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        v71 = v43;
                        v72 = 2112;
                        v73 = v44;
                        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Update could be interrupted by trigger:%@", buf, 0x16u);

                      }
                      objc_autoreleasePoolPop(v40);
                      objc_msgSend(v34, "_nextTimerDate");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();

                      v14 = 0;
                      v3 = v53;
                      v16 = v54;
                      v5 = v55;
                      goto LABEL_40;
                    }
                  }
                  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                  if (v31)
                    continue;
                  break;
                }
              }

              v3 = v53;
              v16 = v54;
              v5 = v55;
              v9 = v56;
              v7 = v57;
            }
            else
            {
              if (v27)
              {
                HMFGetLogIdentifier();
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v71 = v37;
                _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Unknown trigger type", buf, 0xCu);

                v9 = v56;
              }

              objc_autoreleasePoolPop(v25);
            }
          }

        }
        ++v8;
      }
      while (v8 != v7);
      v38 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      v7 = v38;
      v39 = 0;
      v4 = v52;
      if (v38)
        continue;
      break;
    }
  }
  else
  {
    v39 = 0;
  }
LABEL_42:

  return v39;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy reevaluateTimer](self, "reevaluateTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (-[HMDAccessoryFirmwareUpdateTimedAutomationPolicy status](self, "status"))
      -[HMDAccessoryFirmwareUpdatePolicy notify:](self, "notify:", 1);
  }
}

- (void)_startReevaluateTimer:(double)a3
{
  double v3;
  void *v5;
  HMDAccessoryFirmwareUpdateTimedAutomationPolicy *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0.0)
  {
    v5 = (void *)MEMORY[0x227676638](self, a2);
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Invalid time interval", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v3 = 0.0;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 1, v3 + (double)(unint64_t)applyGuardTime());
  -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy setReevaluateTimer:](self, "setReevaluateTimer:", v9);

  -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy reevaluateTimer](self, "reevaluateTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy reevaluateTimer](self, "reevaluateTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegateQueue:", v11);

  -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy reevaluateTimer](self, "reevaluateTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

}

- (void)_stopReevaluateTimer
{
  void *v3;

  -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy reevaluateTimer](self, "reevaluateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy setReevaluateTimer:](self, "setReevaluateTimer:", 0);
}

- (HMFTimer)reevaluateTimer
{
  return self->_reevaluateTimer;
}

- (void)setReevaluateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reevaluateTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reevaluateTimer, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_177731 != -1)
    dispatch_once(&logCategory__hmf_once_t0_177731, &__block_literal_global_177732);
  return (id)logCategory__hmf_once_v1_177733;
}

void __62__HMDAccessoryFirmwareUpdateTimedAutomationPolicy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_177733;
  logCategory__hmf_once_v1_177733 = v0;

}

@end
