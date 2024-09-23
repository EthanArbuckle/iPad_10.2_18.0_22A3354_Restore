@implementation HMMTRSyncClusterThermostat

+ (id)logCategory
{
  if (logCategory__hmf_once_t89 != -1)
    dispatch_once(&logCategory__hmf_once_t89, &__block_literal_global_5254);
  return (id)logCategory__hmf_once_v90;
}

void __41__HMMTRSyncClusterThermostat_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v90;
  logCategory__hmf_once_v90 = v0;

}

- (void)writeAttributeOccupiedHeatingOrCoolingSetpointWithValue:(id)a3 expectedValueInterval:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  HMMTRSyncClusterThermostat *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMMTRSyncClusterThermostat *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  HMMTRSyncClusterThermostat *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  HMMTRSyncClusterThermostat *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  HMMTRSyncClusterThermostat *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  HMMTRSyncClusterThermostat *v65;
  NSObject *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  HMMTRSyncClusterThermostat *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  HMMTRSyncClusterThermostat *v76;
  NSObject *v77;
  void *v78;
  void *context;
  void *contexta;
  void *contextb;
  id v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[MTRClusterThermostat readAttributeSystemModeWithParams:](self, "readAttributeSystemModeWithParams:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = *MEMORY[0x24BDDB518];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    v90 = v14;
    if (v14)
    {
      v15 = objc_msgSend(v14, "integerValue");
      objc_msgSend(v6, "objectForKeyedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      v89 = v18;
      if (v18)
      {
        if (!v7)
          v7 = &unk_250F3F5D0;
        if (v15)
        {
          if (v15 == 3)
          {
            -[MTRClusterThermostat readAttributeAbsMinCoolSetpointLimitWithParams:](self, "readAttributeAbsMinCoolSetpointLimitWithParams:", v8);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[MTRClusterThermostat readAttributeAbsMaxCoolSetpointLimitWithParams:](self, "readAttributeAbsMaxCoolSetpointLimitWithParams:", v8);
            v47 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v47;
            v88 = v46;
            if (v46 && v47)
            {
              objc_msgSend(v46, "objectForKeyedSubscript:", v11);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v49 = v48;
              else
                v49 = 0;
              v50 = v49;

              v51 = v11;
              v26 = v50;
              objc_msgSend(v21, "objectForKeyedSubscript:", v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v53 = v52;
              else
                v53 = 0;
              v29 = v53;

              if (v26)
              {
                v30 = v89;
                if (v29)
                {
                  v54 = objc_msgSend(v89, "integerValue");
                  v83 = v29;
                  if (v54 >= objc_msgSend(v26, "integerValue"))
                  {
                    v85 = v6;
                    v33 = v88;
                  }
                  else
                  {
                    v55 = v26;
                    v33 = v88;
                    v85 = v88;

                    context = (void *)MEMORY[0x242656984]();
                    v56 = self;
                    HMFGetOSLogHandle();
                    v57 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v92 = v58;
                      v93 = 2112;
                      v94 = (uint64_t)v85;
                      _os_log_impl(&dword_23E95B000, v57, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Target cool temperature out of supported min setpoint limit. Setting it to %@", buf, 0x16u);

                      v33 = v88;
                    }

                    objc_autoreleasePoolPop(context);
                    v26 = v55;
                    v29 = v83;
                  }
                  v74 = objc_msgSend(v89, "integerValue", context);
                  if (v74 <= objc_msgSend(v29, "integerValue"))
                  {
                    v6 = v85;
                  }
                  else
                  {
                    v75 = v26;
                    contextb = v21;
                    v6 = v21;

                    v87 = (void *)MEMORY[0x242656984]();
                    v76 = self;
                    HMFGetOSLogHandle();
                    v77 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v92 = v78;
                      v93 = 2112;
                      v94 = (uint64_t)v6;
                      _os_log_impl(&dword_23E95B000, v77, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Target cool temperature out of supported max setpoint limit. Setting it to %@", buf, 0x16u);

                      v33 = v88;
                    }

                    objc_autoreleasePoolPop(v87);
                    v26 = v75;
                    v21 = contextb;
                    v29 = v83;
                  }
                  -[MTRClusterThermostat writeAttributeOccupiedCoolingSetpointWithValue:expectedValueInterval:](self, "writeAttributeOccupiedCoolingSetpointWithValue:expectedValueInterval:", v6, v7, contextb);
                  goto LABEL_73;
                }
LABEL_82:
                _HMFPreconditionFailure();
              }
LABEL_81:
              _HMFPreconditionFailure();
              goto LABEL_82;
            }
            v63 = (void *)v47;
            v64 = (void *)MEMORY[0x242656984]();
            v65 = self;
            HMFGetOSLogHandle();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v92 = v67;
              v68 = "%{public}@Write Occupied Heating/Cooling Setpoint (sync): An error occurred while trying to read the"
                    " min/max cool setpoints";
              goto LABEL_57;
            }
LABEL_58:

            objc_autoreleasePoolPop(v64);
            v33 = v88;
            v30 = v89;
            v21 = v63;
LABEL_74:

            goto LABEL_75;
          }
          if (v15 == 4)
          {
            -[MTRClusterThermostat readAttributeAbsMinHeatSetpointLimitWithParams:](self, "readAttributeAbsMinHeatSetpointLimitWithParams:", v8);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[MTRClusterThermostat readAttributeAbsMaxHeatSetpointLimitWithParams:](self, "readAttributeAbsMaxHeatSetpointLimitWithParams:", v8);
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            v88 = v19;
            if (v19 && v20)
            {
              objc_msgSend(v19, "objectForKeyedSubscript:", v11);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v23 = v22;
              else
                v23 = 0;
              v24 = v23;

              v25 = v11;
              v26 = v24;
              objc_msgSend(v21, "objectForKeyedSubscript:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v28 = v27;
              else
                v28 = 0;
              v29 = v28;

              if (v26)
              {
                v30 = v89;
                if (v29)
                {
                  v31 = objc_msgSend(v89, "integerValue");
                  v82 = v29;
                  if (v31 >= objc_msgSend(v26, "integerValue"))
                  {
                    v84 = v6;
                    v33 = v88;
                  }
                  else
                  {
                    v32 = v26;
                    v33 = v88;
                    v84 = v88;

                    context = (void *)MEMORY[0x242656984]();
                    v34 = self;
                    HMFGetOSLogHandle();
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v92 = v36;
                      v93 = 2112;
                      v94 = (uint64_t)v84;
                      _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Target heat temperature out of supported min setpoint limit. Setting it to %@", buf, 0x16u);

                      v33 = v88;
                    }

                    objc_autoreleasePoolPop(context);
                    v26 = v32;
                    v29 = v82;
                  }
                  v69 = objc_msgSend(v89, "integerValue", context);
                  if (v69 <= objc_msgSend(v29, "integerValue"))
                  {
                    v6 = v84;
                  }
                  else
                  {
                    v70 = v26;
                    contexta = v21;
                    v6 = v21;

                    v86 = (void *)MEMORY[0x242656984]();
                    v71 = self;
                    HMFGetOSLogHandle();
                    v72 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                    {
                      HMFGetLogIdentifier();
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v92 = v73;
                      v93 = 2112;
                      v94 = (uint64_t)v6;
                      _os_log_impl(&dword_23E95B000, v72, OS_LOG_TYPE_DEBUG, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Target heat temperature out of supported max setpoint limit. Setting it to %@", buf, 0x16u);

                      v33 = v88;
                    }

                    objc_autoreleasePoolPop(v86);
                    v26 = v70;
                    v21 = contexta;
                    v29 = v82;
                  }
                  -[MTRClusterThermostat writeAttributeOccupiedHeatingSetpointWithValue:expectedValueInterval:](self, "writeAttributeOccupiedHeatingSetpointWithValue:expectedValueInterval:", v6, v7, contexta);
LABEL_73:

                  goto LABEL_74;
                }
                goto LABEL_80;
              }
LABEL_79:
              _HMFPreconditionFailure();
LABEL_80:
              _HMFPreconditionFailure();
              goto LABEL_81;
            }
            v63 = (void *)v20;
            v64 = (void *)MEMORY[0x242656984]();
            v65 = self;
            HMFGetOSLogHandle();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v92 = v67;
              v68 = "%{public}@Write Occupied Heating/Cooling Setpoint (sync): An error occurred while trying to read the"
                    " min/max heat setpoints";
LABEL_57:
              _os_log_impl(&dword_23E95B000, v66, OS_LOG_TYPE_ERROR, v68, buf, 0xCu);

              goto LABEL_58;
            }
            goto LABEL_58;
          }
          v59 = MEMORY[0x242656984]();
          v60 = self;
          HMFGetOSLogHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = v62;
            v93 = 2048;
            v94 = v15;
            _os_log_impl(&dword_23E95B000, v61, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Thermostat Setpoint cannot be set in unexpected system mode: %ld", buf, 0x16u);

          }
          v45 = (void *)v59;
        }
        else
        {
          v41 = MEMORY[0x242656984]();
          v42 = self;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v92 = v44;
            _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): Thermostat Setpoint cannot be set when system is off", buf, 0xCu);

          }
          v45 = (void *)v41;
        }
        objc_autoreleasePoolPop(v45);
        v30 = v89;
LABEL_75:

        goto LABEL_76;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
    goto LABEL_79;
  }
  v37 = (void *)MEMORY[0x242656984]();
  v38 = self;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v92 = v40;
    _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_ERROR, "%{public}@Write Occupied Heating/Cooling Setpoint (sync): An error occurred while trying to read the current System Mode", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v37);
LABEL_76:

}

- (id)readAttributeOccupiedHeatingOrCoolingSetpointWithParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMMTRSyncClusterThermostat *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  void *v18;
  HMMTRSyncClusterThermostat *v19;
  NSObject *v20;
  void *v21;
  HMMTRSyncClusterThermostat *v22;
  void *v23;
  HMMTRSyncClusterThermostat *v24;
  NSObject *v25;
  void *v26;
  HMMTRSyncClusterThermostat *v27;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTRClusterThermostat readAttributeSystemModeWithParams:](self, "readAttributeSystemModeWithParams:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (!v9)
      _HMFPreconditionFailure();
    v10 = objc_msgSend(v9, "integerValue");
    if (v10 == 3)
    {
      -[MTRClusterThermostat readAttributeOccupiedCoolingSetpointWithParams:](self, "readAttributeOccupiedCoolingSetpointWithParams:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x242656984]();
      v22 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v16;
        v31 = 2112;
        v32 = (uint64_t)v12;
        v17 = "%{public}@Read Occupied Heating/Cooling Setpoint (sync): OccupiedCoolingSetpoint is %@";
        goto LABEL_19;
      }
    }
    else
    {
      v11 = v10;
      if (v10 != 4)
      {
        v23 = (void *)MEMORY[0x242656984]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543618;
          v30 = v26;
          v31 = 2048;
          v32 = v11;
          _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Read Occupied Heating/Cooling Setpoint (sync): Thermostat Setpoint should not be read in unexpected system mode: %ld", (uint8_t *)&v29, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        -[MTRClusterThermostat readAttributeLocalTemperatureWithParams:](v24, "readAttributeLocalTemperatureWithParams:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x242656984]();
        v27 = v24;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          goto LABEL_20;
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v16;
        v31 = 2112;
        v32 = (uint64_t)v12;
        v17 = "%{public}@Read Occupied Heating/Cooling Setpoint (sync): Read local temperature %@";
        goto LABEL_19;
      }
      -[MTRClusterThermostat readAttributeOccupiedHeatingSetpointWithParams:](self, "readAttributeOccupiedHeatingSetpointWithParams:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x242656984]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v16;
        v31 = 2112;
        v32 = (uint64_t)v12;
        v17 = "%{public}@Read Occupied Heating/Cooling Setpoint (sync): OccupiedHeatingSetpoint is %@";
LABEL_19:
        _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v29, 0x16u);

      }
    }
LABEL_20:

    objc_autoreleasePoolPop(v13);
    goto LABEL_21;
  }
  v18 = (void *)MEMORY[0x242656984]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v21;
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Read Occupied Heating/Cooling Setpoint (sync): An error occurred while trying to read the current System Mode", (uint8_t *)&v29, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  v12 = 0;
LABEL_21:

  return v12;
}

- (void)updatedValueForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMMTRSyncClusterThermostat *v13;
  NSObject *v14;
  _BOOL4 v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  HMMTRSyncClusterThermostat *v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  void *v40;
  HMMTRSyncClusterThermostat *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v50 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB498]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v49 = v11;

  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  v16 = (_QWORD *)MEMORY[0x24BDDB478];
  if (v15)
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endpoint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cluster");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribute");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v52 = v17;
    v53 = 2112;
    v54 = v18;
    v55 = 2112;
    v56 = v19;
    v57 = 2112;
    v58 = v20;
    v59 = 2112;
    v60 = v21;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@UpdateValueForAttributeReport (sync): Handling Attribute report endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v16 = (_QWORD *)MEMORY[0x24BDDB478];
  }

  objc_autoreleasePoolPop(v12);
  v22 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[MTRClusterThermostat readAttributeSystemModeWithParams:](v13, "readAttributeSystemModeWithParams:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    if (!v27)
      _HMFPreconditionFailure();
    v28 = objc_msgSend(v27, "integerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", *v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      v30 = v6;
    else
      v30 = 0;
    v31 = v30;

    if (v28 == 3)
    {
      objc_msgSend(v9, "cluster");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "isEqualToNumber:", &unk_250F3F5E8))
      {
        objc_msgSend(v9, "attribute");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isEqualToNumber:", &unk_250F3F618);

        if (v47)
        {
          v35 = (void *)MEMORY[0x242656984]();
          v36 = v13;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v38;
            v53 = 2112;
            v54 = v6;
            v39 = "%{public}@UpdateValueForAttributeReport (sync): Report OccupiedCoolingSetpoint %@";
            goto LABEL_30;
          }
LABEL_31:

          objc_autoreleasePoolPop(v35);
          +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v31);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v49;
          v43 = v50;
          (*((void (**)(id, void *, id))v50 + 2))(v50, v48, v49);

LABEL_34:
          goto LABEL_35;
        }
LABEL_33:
        v45 = v49;
        v43 = v50;
        (*((void (**)(id, _QWORD, id))v50 + 2))(v50, 0, v49);
        goto LABEL_34;
      }
    }
    else
    {
      if (v28 != 4)
        goto LABEL_33;
      objc_msgSend(v9, "cluster");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "isEqualToNumber:", &unk_250F3F5E8))
      {
        objc_msgSend(v9, "attribute");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToNumber:", &unk_250F3F600);

        if (v34)
        {
          v35 = (void *)MEMORY[0x242656984]();
          v36 = v13;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v38;
            v53 = 2112;
            v54 = v6;
            v39 = "%{public}@UpdateValueForAttributeReport (sync): Report OccupiedHeatingSetpoint %@";
LABEL_30:
            _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_DEBUG, v39, buf, 0x16u);

            goto LABEL_31;
          }
          goto LABEL_31;
        }
        goto LABEL_33;
      }
    }

    goto LABEL_33;
  }
  v40 = (void *)MEMORY[0x242656984]();
  v41 = v13;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = v50;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v44;
    _os_log_impl(&dword_23E95B000, v42, OS_LOG_TYPE_ERROR, "%{public}@UpdateValueForAttributeReport (sync): An error occurred while trying to read the current System Mode", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v40);
  v45 = v49;
LABEL_35:

}

- (void)updatedValuePluginCurrentHeatingCoolingStateForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRSyncClusterThermostat *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, void *, _QWORD);
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v24 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v18 = v7;
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to current heating/cooling state (sync) - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v11 = v19;
    v7 = v18;

    v6 = v24;
  }

  objc_autoreleasePoolPop(v11);
  v21 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[HMMTRSyncClusterThermostat readAttributePluginCurrentHeatingCoolingStateWithParams:](v12, "readAttributePluginCurrentHeatingCoolingStateWithParams:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v23, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 15, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v23);
  }

}

- (id)readAttributePluginCurrentHeatingCoolingStateWithParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  HMMTRSyncClusterThermostat *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  HMMTRSyncClusterThermostat *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  HMMTRSyncClusterThermostat *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  HMMTRSyncClusterThermostat *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  HMMTRSyncClusterThermostat *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  HMMTRSyncClusterThermostat *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  _QWORD *v60;
  _QWORD *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  HMMTRSyncClusterThermostat *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  HMMTRSyncClusterThermostat *v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  HMMTRSyncClusterThermostat *v78;
  NSObject *v79;
  void *v80;
  const char *v81;
  void *v82;
  HMMTRSyncClusterThermostat *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  HMMTRSyncClusterThermostat *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  void *v100;
  HMMTRSyncClusterThermostat *v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  HMMTRSyncClusterThermostat *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  HMMTRSyncClusterThermostat *v112;
  NSObject *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  _QWORD *v117;
  _QWORD *v118;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[2];
  _QWORD v139[2];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[2];
  _QWORD v144[2];
  _QWORD v145[2];
  _QWORD v146[2];
  uint8_t buf[4];
  void *v148;
  __int16 v149;
  uint64_t v150;
  uint64_t v151;

  v151 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTRClusterThermostat readAttributeSystemModeWithParams:](self, "readAttributeSystemModeWithParams:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *MEMORY[0x24BDDB518];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = objc_msgSend(v10, "integerValue");
    v12 = (void *)MEMORY[0x242656984]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v148 = v15;
      v149 = 2048;
      v150 = v11;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got systemModeValue value: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (v11)
    {
      -[MTRClusterThermostat readAttributeLocalTemperatureWithParams:](v13, "readAttributeLocalTemperatureWithParams:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v16)
      {
        v45 = (void *)MEMORY[0x242656984]();
        v46 = v13;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v148 = v48;
          _os_log_impl(&dword_23E95B000, v47, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the local temperature", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v45);
        v39 = 0;
        goto LABEL_96;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      v21 = objc_msgSend(v20, "integerValue");
      v22 = (void *)MEMORY[0x242656984]();
      v23 = v13;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v148 = v25;
        v149 = 2048;
        v150 = v21;
        _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got temperatureValue value: %ld", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      switch(v11)
      {
        case 4:
          -[MTRClusterThermostat readAttributeOccupiedHeatingSetpointWithParams:](v23, "readAttributeOccupiedHeatingSetpointWithParams:", v4);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v49;
          if (v49)
          {
            v122 = v21;
            objc_msgSend(v49, "objectForKeyedSubscript:", v7);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v51 = v50;
            else
              v51 = 0;
            v52 = v51;

            v53 = objc_msgSend(v52, "integerValue");
            v54 = (void *)MEMORY[0x242656984]();
            v55 = v23;
            HMFGetOSLogHandle();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v148 = v57;
              v149 = 2048;
              v150 = v53;
              _os_log_impl(&dword_23E95B000, v56, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got heatPointValue value: %ld", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v54);
            v58 = *MEMORY[0x24BDDB510];
            if (v122 >= v53)
            {
              v127[0] = *MEMORY[0x24BDDB500];
              v127[1] = v7;
              v128[0] = v58;
              v128[1] = &unk_250F3F630;
              v59 = (void *)MEMORY[0x24BDBCE70];
              v60 = v128;
              v61 = v127;
            }
            else
            {
              v129[0] = *MEMORY[0x24BDDB500];
              v129[1] = v7;
              v130[0] = v58;
              v130[1] = &unk_250F3F648;
              v59 = (void *)MEMORY[0x24BDBCE70];
              v60 = v130;
              v61 = v129;
            }
            goto LABEL_80;
          }
          v77 = (void *)MEMORY[0x242656984]();
          v78 = v23;
          HMFGetOSLogHandle();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v148 = v80;
            v81 = "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the occupi"
                  "ed heating point";
LABEL_54:
            _os_log_impl(&dword_23E95B000, v79, OS_LOG_TYPE_ERROR, v81, buf, 0xCu);

          }
          break;
        case 3:
          -[MTRClusterThermostat readAttributeOccupiedCoolingSetpointWithParams:](v23, "readAttributeOccupiedCoolingSetpointWithParams:", v4);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v62;
          if (v62)
          {
            objc_msgSend(v62, "objectForKeyedSubscript:", v7);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v64 = v63;
            else
              v64 = 0;
            v65 = v64;

            v66 = objc_msgSend(v65, "integerValue");
            v67 = (void *)MEMORY[0x242656984]();
            v68 = v23;
            HMFGetOSLogHandle();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v123 = v21;
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v148 = v70;
              v149 = 2048;
              v150 = v66;
              _os_log_impl(&dword_23E95B000, v69, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got coolPointValue value: %ld", buf, 0x16u);

              v21 = v123;
            }

            objc_autoreleasePoolPop(v67);
            v71 = *MEMORY[0x24BDDB510];
            if (v21 <= v66)
            {
              v131[0] = *MEMORY[0x24BDDB500];
              v131[1] = v7;
              v132[0] = v71;
              v132[1] = &unk_250F3F630;
              v59 = (void *)MEMORY[0x24BDBCE70];
              v60 = v132;
              v61 = v131;
            }
            else
            {
              v133[0] = *MEMORY[0x24BDDB500];
              v133[1] = v7;
              v134[0] = v71;
              v134[1] = &unk_250F3F660;
              v59 = (void *)MEMORY[0x24BDBCE70];
              v60 = v134;
              v61 = v133;
            }
LABEL_80:
            objc_msgSend(v59, "dictionaryWithObjects:forKeys:count:", v60, v61, 2);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_95;
          }
          v77 = (void *)MEMORY[0x242656984]();
          v78 = v23;
          HMFGetOSLogHandle();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v148 = v80;
            v81 = "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the occupi"
                  "ed cooling point";
            goto LABEL_54;
          }
          break;
        case 1:
          -[MTRClusterThermostat readAttributeThermostatRunningModeWithParams:](v23, "readAttributeThermostatRunningModeWithParams:", v4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "objectForKeyedSubscript:", v7);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v29 = v28;
            else
              v29 = 0;
            v30 = v29;

            v31 = objc_msgSend(v30, "integerValue");
            v32 = (void *)MEMORY[0x242656984]();
            v33 = v23;
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v148 = v35;
              v149 = 2048;
              v150 = v31;
              _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got runningModeValue value: %ld", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v32);
            v36 = *MEMORY[0x24BDDB500];
            v37 = *MEMORY[0x24BDDB510];
            v143[1] = v7;
            v144[0] = v37;
            v143[0] = v36;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v31);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v144[1] = v38;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v144, v143, 2);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v82 = (void *)MEMORY[0x242656984]();
            v83 = v23;
            HMFGetOSLogHandle();
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v148 = v85;
              _os_log_impl(&dword_23E95B000, v84, OS_LOG_TYPE_INFO, "%{public}@Read current heating/cooling state (sync): Couldn't get thermostat running mode from device. Ignoring error", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v82);
            -[MTRClusterThermostat readAttributeOccupiedHeatingSetpointWithParams:](v83, "readAttributeOccupiedHeatingSetpointWithParams:", v4);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            if (v86)
            {
              v38 = v86;
              objc_msgSend(v86, "objectForKeyedSubscript:", v7);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v88 = v87;
              else
                v88 = 0;
              v89 = v88;

              v124 = objc_msgSend(v89, "integerValue");
              v90 = (void *)MEMORY[0x242656984]();
              v91 = v83;
              HMFGetOSLogHandle();
              v92 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v148 = v93;
                v149 = 2048;
                v150 = v124;
                _os_log_impl(&dword_23E95B000, v92, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got heatPointValue value: %ld", buf, 0x16u);

                v27 = 0;
              }

              objc_autoreleasePoolPop(v90);
              -[MTRClusterThermostat readAttributeOccupiedCoolingSetpointWithParams:](v91, "readAttributeOccupiedCoolingSetpointWithParams:", v4);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = v94;
              if (v94)
              {
                v121 = v94;
                objc_msgSend(v94, "objectForKeyedSubscript:", v7);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v97 = v96;
                else
                  v97 = 0;
                v98 = v97;

                v99 = objc_msgSend(v98, "integerValue");
                v100 = (void *)MEMORY[0x242656984]();
                v101 = v91;
                HMFGetOSLogHandle();
                v102 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v120 = v100;
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v148 = v103;
                  v149 = 2048;
                  v150 = v99;
                  _os_log_impl(&dword_23E95B000, v102, OS_LOG_TYPE_DEBUG, "%{public}@Read current heating/cooling state (sync): Got coolPointValue value: %ld", buf, 0x16u);

                  v100 = v120;
                }

                objc_autoreleasePoolPop(v100);
                v104 = v124;
                if (v124 >= v99)
                  v105 = v99;
                else
                  v105 = v124;
                if (v124 <= v99)
                  v104 = v99;
                if (v21 <= v105 || v21 >= v104)
                {
                  v27 = 0;
                  v95 = v121;
                  v115 = *MEMORY[0x24BDDB510];
                  if (v21 >= v124)
                  {
                    if (v21 <= v99)
                    {
                      v135[0] = *MEMORY[0x24BDDB500];
                      v135[1] = v7;
                      v136[0] = v115;
                      v136[1] = &unk_250F3F630;
                      v116 = (void *)MEMORY[0x24BDBCE70];
                      v117 = v136;
                      v118 = v135;
                    }
                    else
                    {
                      v137[0] = *MEMORY[0x24BDDB500];
                      v137[1] = v7;
                      v138[0] = v115;
                      v138[1] = &unk_250F3F660;
                      v116 = (void *)MEMORY[0x24BDBCE70];
                      v117 = v138;
                      v118 = v137;
                    }
                  }
                  else
                  {
                    v139[0] = *MEMORY[0x24BDDB500];
                    v139[1] = v7;
                    v140[0] = v115;
                    v140[1] = &unk_250F3F648;
                    v116 = (void *)MEMORY[0x24BDBCE70];
                    v117 = v140;
                    v118 = v139;
                  }
                  objc_msgSend(v116, "dictionaryWithObjects:forKeys:count:", v117, v118, 2, v120);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v106 = *MEMORY[0x24BDDB510];
                  v141[0] = *MEMORY[0x24BDDB500];
                  v141[1] = v7;
                  v142[0] = v106;
                  v142[1] = &unk_250F3F630;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v142, v141, 2);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = v121;
                  v27 = 0;
                }
              }
              else
              {
                v111 = (void *)MEMORY[0x242656984]();
                v112 = v91;
                HMFGetOSLogHandle();
                v113 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v148 = v114;
                  _os_log_impl(&dword_23E95B000, v113, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the occupied cooling point", buf, 0xCu);

                  v27 = 0;
                }

                objc_autoreleasePoolPop(v111);
                v39 = 0;
              }

            }
            else
            {
              v107 = (void *)MEMORY[0x242656984]();
              v108 = v83;
              HMFGetOSLogHandle();
              v109 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v148 = v110;
                _os_log_impl(&dword_23E95B000, v109, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the occupied heating point", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v107);
              v38 = 0;
              v39 = 0;
            }
          }

LABEL_95:
LABEL_96:

          goto LABEL_97;
        default:
          v72 = (void *)MEMORY[0x242656984]();
          v73 = v23;
          HMFGetOSLogHandle();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v148 = v75;
            v149 = 2048;
            v150 = v11;
            _os_log_impl(&dword_23E95B000, v74, OS_LOG_TYPE_INFO, "%{public}@Read current heating/cooling state (sync): Unsupported system mode: %ld", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v72);
          v76 = *MEMORY[0x24BDDB510];
          v125[0] = *MEMORY[0x24BDDB500];
          v125[1] = v7;
          v126[0] = v76;
          v126[1] = &unk_250F3F630;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v126, v125, 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_96;
      }

      objc_autoreleasePoolPop(v77);
      v39 = 0;
      goto LABEL_95;
    }
    v44 = *MEMORY[0x24BDDB510];
    v145[0] = *MEMORY[0x24BDDB500];
    v145[1] = v7;
    v146[0] = v44;
    v146[1] = &unk_250F3F630;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v146, v145, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = (void *)MEMORY[0x242656984]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v148 = v43;
      _os_log_impl(&dword_23E95B000, v42, OS_LOG_TYPE_ERROR, "%{public}@Read current heating/cooling state (sync): An error occurred while trying to read the system mode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v40);
    v39 = 0;
  }
LABEL_97:

  return v39;
}

- (id)readAttributePluginActiveWithParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  void *v16;
  HMMTRSyncClusterThermostat *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTRClusterThermostat readAttributeSystemModeWithParams:](self, "readAttributeSystemModeWithParams:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *MEMORY[0x24BDDB518];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = objc_msgSend(v10, "integerValue");
    v12 = *MEMORY[0x24BDDB510];
    if (v11)
    {
      v22 = *MEMORY[0x24BDDB500];
      v23 = v7;
      v24 = v12;
      v25 = &unk_250F3F678;
      v13 = (void *)MEMORY[0x24BDBCE70];
      v14 = &v24;
      v15 = &v22;
    }
    else
    {
      v26 = *MEMORY[0x24BDDB500];
      v27 = v7;
      v28 = v12;
      v29 = &unk_250F3F630;
      v13 = (void *)MEMORY[0x24BDBCE70];
      v14 = &v28;
      v15 = &v26;
    }
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 2, v22, v23, v24, v25, v26, v27, v28, v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Read Active Char (sync): An error occurred while trying to read the system mode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v20 = 0;
  }

  return v20;
}

- (void)writeAttributePluginActiveWithValue:(id)a3 expectedValueInterval:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HMMTRSyncClusterThermostat *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  void *v25;
  HMMTRSyncClusterThermostat *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  HMMTRSyncClusterThermostat *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  HMMTRSyncClusterThermostat *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[MTRClusterThermostat readAttributeControlSequenceOfOperationWithParams:](self, "readAttributeControlSequenceOfOperationWithParams:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = *MEMORY[0x24BDDB518];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      v41 = v8;
      v15 = objc_msgSend(v14, "integerValue");
      v16 = v6;
      objc_msgSend(v6, "objectForKeyedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      if (v19)
      {
        if (!v7)
          v7 = &unk_250F3F5D0;
        if (objc_msgSend(v19, "integerValue"))
        {
          v6 = v16;
          if (v15 > 5)
          {
            v20 = (void *)MEMORY[0x242656984]();
            v21 = self;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v43 = v23;
              v44 = 2112;
              v45 = v14;
              v24 = "%{public}@Unsupported control sequence of operation value: %@";
              goto LABEL_32;
            }
LABEL_33:

            objc_autoreleasePoolPop(v20);
            goto LABEL_34;
          }
          if (((1 << v15) & 0x32) != 0)
          {
            v20 = (void *)MEMORY[0x242656984]();
            v21 = self;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v43 = v23;
              v44 = 2112;
              v45 = v14;
              v24 = "%{public}@Setting active mode On not supported for control sequence of operation value: %@";
LABEL_32:
              _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);

              goto LABEL_33;
            }
            goto LABEL_33;
          }
          if (((1 << v15) & 0xC) != 0)
            v35 = &unk_250F3F6C0;
          else
            v35 = &unk_250F3F6A8;
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v16);
          objc_msgSend(v29, "setValue:forKey:", v35, v11);
          v36 = MEMORY[0x242656984](-[MTRClusterThermostat writeAttributeSystemModeWithValue:expectedValueInterval:](self, "writeAttributeSystemModeWithValue:expectedValueInterval:", v29, v7));
          v37 = self;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = v36;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v39;
            v44 = 2112;
            v45 = v19;
            v46 = 2112;
            v47 = v35;
            _os_log_impl(&dword_23E95B000, v38, OS_LOG_TYPE_INFO, "%{public}@Wrote to system mode attribute for Active Characteristic, value:%@ (On), system mode:%@", buf, 0x20u);

            v36 = v40;
          }

          v34 = (void *)v36;
        }
        else
        {
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v16);
          objc_msgSend(v29, "setValue:forKey:", &unk_250F3F690, v11);
          v30 = MEMORY[0x242656984](-[MTRClusterThermostat writeAttributeSystemModeWithValue:expectedValueInterval:](self, "writeAttributeSystemModeWithValue:expectedValueInterval:", v29, v7));
          v31 = self;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v33;
            v44 = 2112;
            v45 = v19;
            v46 = 2112;
            v47 = &unk_250F3F690;
            _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_INFO, "%{public}@Wrote to system mode attribute for Active Characteristic, value:%@ (Off), error:%@", buf, 0x20u);

          }
          v34 = (void *)v30;
        }
        objc_autoreleasePoolPop(v34);

        v6 = v16;
LABEL_34:
        v8 = v41;

        goto LABEL_35;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  v25 = (void *)MEMORY[0x242656984]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v28;
    _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the control sequence of operation", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v25);
LABEL_35:

}

- (void)updatedValuePluginActiveForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRSyncClusterThermostat *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, void *, _QWORD);
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v24 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v18 = v7;
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to Active Char (sync) - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v11 = v19;
    v7 = v18;

    v6 = v24;
  }

  objc_autoreleasePoolPop(v11);
  v21 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[HMMTRSyncClusterThermostat readAttributePluginActiveWithParams:](v12, "readAttributePluginActiveWithParams:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v23, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 15, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v23);
  }

}

- (id)readAttributePluginCurrentHeaterCoolerStateWithParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  HMMTRSyncClusterThermostat *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  HMMTRSyncClusterThermostat *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  HMMTRSyncClusterThermostat *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  _QWORD *v40;
  void *v41;
  HMMTRSyncClusterThermostat *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  HMMTRSyncClusterThermostat *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  HMMTRSyncClusterThermostat *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  HMMTRSyncClusterThermostat *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  HMMTRSyncClusterThermostat *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  HMMTRSyncClusterThermostat *v72;
  NSObject *v73;
  void *v74;
  void *v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTRClusterThermostat readAttributeSystemModeWithParams:](self, "readAttributeSystemModeWithParams:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *MEMORY[0x24BDDB518];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = objc_msgSend(v10, "integerValue");
    v12 = (void *)MEMORY[0x242656984]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v90 = v15;
      v91 = 2048;
      v92 = v11;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state (sync): Got systemModeValue value: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (v11)
    {
      -[MTRClusterThermostat readAttributeLocalTemperatureWithParams:](v13, "readAttributeLocalTemperatureWithParams:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v16)
      {
        v47 = (void *)MEMORY[0x242656984]();
        v48 = v13;
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v90 = v50;
          _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state (sync): An error occurred while trying to read the local temperature", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v47);
        v45 = 0;
        goto LABEL_52;
      }
      v76 = v16;
      objc_msgSend(v16, "objectForKeyedSubscript:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      v21 = objc_msgSend(v20, "integerValue");
      v22 = (void *)MEMORY[0x242656984]();
      v23 = v13;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v90 = v25;
        v91 = 2048;
        v92 = v21;
        _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state (sync): Got temperatureValue value: %ld", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      if (v11 == 4)
      {
        -[MTRClusterThermostat readAttributeOccupiedHeatingSetpointWithParams:](v23, "readAttributeOccupiedHeatingSetpointWithParams:", v4);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v51;
        if (!v51)
        {
          v71 = (void *)MEMORY[0x242656984]();
          v72 = v23;
          HMFGetOSLogHandle();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v90 = v74;
            _os_log_impl(&dword_23E95B000, v73, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state (sync): An error occurred while trying to read the occupied heating point", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v71);
          v45 = 0;
          v17 = v76;
          goto LABEL_51;
        }
        objc_msgSend(v51, "objectForKeyedSubscript:", v7);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v53 = v52;
        else
          v53 = 0;
        v54 = v53;

        v55 = objc_msgSend(v54, "integerValue");
        v56 = (void *)MEMORY[0x242656984]();
        v57 = v23;
        HMFGetOSLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v59 = v27;
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v90 = v60;
          v91 = 2048;
          v92 = v55;
          _os_log_impl(&dword_23E95B000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state (sync): Got heatPointValue value: %ld", buf, 0x16u);

          v27 = v59;
        }

        objc_autoreleasePoolPop(v56);
        v17 = v76;
        v61 = *MEMORY[0x24BDDB510];
        if (v21 >= v55)
        {
          v79[0] = *MEMORY[0x24BDDB500];
          v79[1] = v7;
          v80[0] = v61;
          v80[1] = &unk_250F3F630;
          v38 = (void *)MEMORY[0x24BDBCE70];
          v39 = v80;
          v40 = v79;
        }
        else
        {
          v81[0] = *MEMORY[0x24BDDB500];
          v81[1] = v7;
          v82[0] = v61;
          v82[1] = &unk_250F3F6D8;
          v38 = (void *)MEMORY[0x24BDBCE70];
          v39 = v82;
          v40 = v81;
        }
      }
      else
      {
        if (v11 != 3)
        {
          v62 = (void *)MEMORY[0x242656984]();
          v63 = v23;
          HMFGetOSLogHandle();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v90 = v65;
            v91 = 2048;
            v92 = v11;
            _os_log_impl(&dword_23E95B000, v64, OS_LOG_TYPE_INFO, "%{public}@Read current heater cooler state (sync): Unsupported system mode: %ld", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v62);
          v66 = *MEMORY[0x24BDDB510];
          v77[0] = *MEMORY[0x24BDDB500];
          v77[1] = v7;
          v78[0] = v66;
          v78[1] = &unk_250F3F630;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v76;
          goto LABEL_52;
        }
        -[MTRClusterThermostat readAttributeOccupiedCoolingSetpointWithParams:](v23, "readAttributeOccupiedCoolingSetpointWithParams:", v4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (!v26)
        {
          v67 = (void *)MEMORY[0x242656984]();
          v68 = v23;
          HMFGetOSLogHandle();
          v69 = objc_claimAutoreleasedReturnValue();
          v17 = v76;
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v90 = v70;
            _os_log_impl(&dword_23E95B000, v69, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state (sync): An error occurred while trying to read the occupied cooling point", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v67);
          v45 = 0;
          goto LABEL_51;
        }
        objc_msgSend(v26, "objectForKeyedSubscript:", v7);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
        v30 = v29;

        v31 = objc_msgSend(v30, "integerValue");
        v32 = (void *)MEMORY[0x242656984]();
        v33 = v23;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v35 = v27;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v90 = v36;
          v91 = 2048;
          v92 = v31;
          _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Read current heater cooler state (sync): Got coolPointValue value: %ld", buf, 0x16u);

          v27 = v35;
        }

        objc_autoreleasePoolPop(v32);
        v17 = v76;
        v37 = *MEMORY[0x24BDDB510];
        if (v21 <= v31)
        {
          v83[0] = *MEMORY[0x24BDDB500];
          v83[1] = v7;
          v84[0] = v37;
          v84[1] = &unk_250F3F630;
          v38 = (void *)MEMORY[0x24BDBCE70];
          v39 = v84;
          v40 = v83;
        }
        else
        {
          v85[0] = *MEMORY[0x24BDDB500];
          v85[1] = v7;
          v86[0] = v37;
          v86[1] = &unk_250F3F660;
          v38 = (void *)MEMORY[0x24BDBCE70];
          v39 = v86;
          v40 = v85;
        }
      }
      objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v39, v40, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

LABEL_52:
      goto LABEL_53;
    }
    v46 = *MEMORY[0x24BDDB510];
    v87[0] = *MEMORY[0x24BDDB500];
    v87[1] = v7;
    v88[0] = v46;
    v88[1] = &unk_250F3F630;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = (void *)MEMORY[0x242656984]();
    v42 = self;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v90 = v44;
      _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@Read current heater cooler state (sync): An error occurred while trying to read the system mode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v41);
    v45 = 0;
  }
LABEL_53:

  return v45;
}

- (void)updatedValuePluginCurrentHeaterCoolerStateForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRSyncClusterThermostat *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, void *, _QWORD);
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v24 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v18 = v7;
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to current heater cooler state (sync) - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v11 = v19;
    v7 = v18;

    v6 = v24;
  }

  objc_autoreleasePoolPop(v11);
  v21 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[HMMTRSyncClusterThermostat readAttributePluginCurrentHeaterCoolerStateWithParams:](v12, "readAttributePluginCurrentHeaterCoolerStateWithParams:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v23, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 15, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v23);
  }

}

- (id)readAttributePluginTargetHeaterCoolerStateWithParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  HMMTRSyncClusterThermostat *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  HMMTRSyncClusterThermostat *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMMTRSyncClusterThermostat *v39;
  NSObject *v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTRClusterThermostat readAttributeSystemModeWithParams:](self, "readAttributeSystemModeWithParams:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *MEMORY[0x24BDDB518];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = objc_msgSend(v10, "integerValue");
    if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v12 = *MEMORY[0x24BDDB510];
      v52[0] = *MEMORY[0x24BDDB500];
      v52[1] = v7;
      v53[0] = v12;
      v53[1] = &unk_250F3F678;
      v13 = (void *)MEMORY[0x24BDBCE70];
      v14 = v53;
      v15 = v52;
LABEL_16:
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (v11 == 6 || v11 == 3)
    {
      v22 = *MEMORY[0x24BDDB510];
      v50[0] = *MEMORY[0x24BDDB500];
      v50[1] = v7;
      v51[0] = v22;
      v51[1] = &unk_250F3F6D8;
      v13 = (void *)MEMORY[0x24BDBCE70];
      v14 = v51;
      v15 = v50;
      goto LABEL_16;
    }
    -[MTRClusterThermostat readAttributeControlSequenceOfOperationWithParams:](self, "readAttributeControlSequenceOfOperationWithParams:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
      v28 = v27;

      if (!v28)
        _HMFPreconditionFailure();
      v29 = objc_msgSend(v28, "integerValue");
      if (v29 > 5)
      {
        v38 = (void *)MEMORY[0x242656984]();
        v39 = self;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 138543618;
          v43 = v41;
          v44 = 2112;
          v45 = v28;
          _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state (sync): Unsupported control sequence of operation value: %@", (uint8_t *)&v42, 0x16u);

        }
        objc_autoreleasePoolPop(v38);
        v20 = 0;
      }
      else
      {
        v30 = *MEMORY[0x24BDDB510];
        if (((1 << v29) & 0x33) != 0)
        {
          v48[0] = *MEMORY[0x24BDDB500];
          v48[1] = v7;
          v49[0] = v30;
          v49[1] = &unk_250F3F6D8;
          v31 = (void *)MEMORY[0x24BDBCE70];
          v32 = v49;
          v33 = v48;
        }
        else
        {
          v46[0] = *MEMORY[0x24BDDB500];
          v46[1] = v7;
          v47[0] = v30;
          v47[1] = &unk_250F3F678;
          v31 = (void *)MEMORY[0x24BDBCE70];
          v32 = v47;
          v33 = v46;
        }
        objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v34 = (void *)MEMORY[0x242656984]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138543362;
        v43 = v37;
        _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state (sync): An error occurred while trying to read the control sequence of operation", (uint8_t *)&v42, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      v20 = 0;
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543362;
      v43 = v19;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Read target heater cooler state (sync): An error occurred while trying to read the system mode", (uint8_t *)&v42, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v20 = 0;
  }
LABEL_17:

  return v20;
}

- (void)writeAttributePluginTargetHeaterCoolerStateWithValue:(id)a3 expectedValueInterval:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HMMTRSyncClusterThermostat *v16;
  NSObject *v17;
  void *v18;
  const __CFString *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDDB518];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v11)
    _HMFPreconditionFailure();
  if (!v7)
    v7 = &unk_250F3F5D0;
  v12 = objc_msgSend(v11, "integerValue");
  if (v12 == 1)
    v13 = &unk_250F3F6C0;
  else
    v13 = &unk_250F3F6A8;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v6);
  objc_msgSend(v14, "setValue:forKey:", v13, v8);
  v15 = (void *)MEMORY[0x242656984](-[MTRClusterThermostat writeAttributeSystemModeWithValue:expectedValueInterval:](self, "writeAttributeSystemModeWithValue:expectedValueInterval:", v14, v7));
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("Cool");
    v20 = 138543874;
    v21 = v18;
    v22 = 2112;
    if (v12 == 1)
      v19 = CFSTR("Heat");
    v23 = v13;
    v24 = 2112;
    v25 = v19;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Write due to target heater cooler state (sync): Wrote to system mode attribute, value:%@ (%@)", (uint8_t *)&v20, 0x20u);

  }
  objc_autoreleasePoolPop(v15);

}

- (void)updatedValuePluginTargetHeaterCoolerStateForAttributeReport:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMMTRSyncClusterThermostat *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, void *, _QWORD);
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v24 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cluster");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
    v18 = v7;
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Handling Attribute report linked to target heater cooler state (sync) - endpoint:%@ cluster:%@ attribute:%@ value:%@", buf, 0x34u);

    v11 = v19;
    v7 = v18;

    v6 = v24;
  }

  objc_autoreleasePoolPop(v11);
  v21 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[HMMTRSyncClusterThermostat readAttributePluginTargetHeaterCoolerStateWithParams:](v12, "readAttributePluginTargetHeaterCoolerStateWithParams:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v23, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 15, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v23);
  }

}

@end
