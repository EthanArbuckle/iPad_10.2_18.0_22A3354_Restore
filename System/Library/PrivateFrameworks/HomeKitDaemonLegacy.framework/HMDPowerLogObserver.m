@implementation HMDPowerLogObserver

- (HMDPowerLogObserver)initWithLogEventDispatcher:(id)a3
{
  id v4;
  HMDPowerLogObserverContext *v5;
  void *v6;
  HMDPowerLogObserverContext *v7;
  HMDPowerLogObserver *v8;

  v4 = a3;
  v5 = [HMDPowerLogObserverContext alloc];
  objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDPowerLogObserverContext initWithLogEventDispatcher:powerLogger:](v5, "initWithLogEventDispatcher:powerLogger:", v4, v6);

  v8 = -[HMDPowerLogObserver initWithContext:](self, "initWithContext:", v7);
  return v8;
}

- (HMDPowerLogObserver)initWithContext:(id)a3
{
  id v5;
  HMDPowerLogObserver *v6;
  HMDPowerLogObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDPowerLogObserver;
  v6 = -[HMDPowerLogObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v9;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDPowerLogObserver _reportConfiguration:](self, "_reportConfiguration:", v5);
LABEL_11:

    goto LABEL_12;
  }
  v6 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMDPowerLogObserver _reportCameraSettingsConfiguration:](self, "_reportCameraSettingsConfiguration:", v8);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_reportConfiguration:(id)a3
{
  void *v4;
  id v5;
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
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("HomeKit Home Configuration"), *MEMORY[0x1E0D28038]);
  -[HMDPowerLogObserver context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeConfigurationEventHistogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intervalIndexForValue:", objc_msgSend(v5, "totalHomes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v8, CFSTR("numHomes"));

  -[HMDPowerLogObserver context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeConfigurationEventHistogram");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intervalIndexForValue:", objc_msgSend(v5, "totalNonEmptyHomes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v11, CFSTR("numNonEmptyHomes"));

  -[HMDPowerLogObserver context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeConfigurationEventHistogram");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "intervalIndexForValue:", objc_msgSend(v5, "totalUsers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v14, CFSTR("numUsers"));

  -[HMDPowerLogObserver context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "homeConfigurationEventHistogram");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "intervalIndexForValue:", objc_msgSend(v5, "totalHAPAccessories"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v17, CFSTR("numHAPAccessories"));

  -[HMDPowerLogObserver context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "homeConfigurationEventHistogram");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "intervalIndexForValue:", objc_msgSend(v5, "totalEnabledResidents"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v20, CFSTR("numEnabledResidents"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isResidentEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v21, CFSTR("isCurrentDeviceResidentEnabled"));

  v22 = (void *)MEMORY[0x1E0CB37E8];
  v23 = objc_msgSend(v5, "isPrimaryResidentForSomeHome");

  objc_msgSend(v22, "numberWithBool:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v24, CFSTR("isCurrentDevicePrimaryResident"));

  objc_msgSend(v29, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("isCurrentDeviceHH2Enabled"));
  -[HMDPowerLogObserver context](self, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "powerLogger");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0D28048];
  v28 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v26, "reportToPowerLogDestinationTable:withEventDictionary:", v27, v28);

}

- (void)_reportCameraSettingsConfiguration:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  uint64_t v37;
  void *v38;
  HMDPowerLogObserver *v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v39 = self;
  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v3;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v3, "homeSettingsConfigurations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  if (v44)
  {
    v46 = 0;
    v43 = *(_QWORD *)v52;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v52 != v43)
          objc_enumerationMutation(obj);
        v45 = v9;
        v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v9);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v10, "cameraSettings", v39);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v48 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              v8 += objc_msgSend(v16, "isRecordingEnabled");
              v4 += objc_msgSend(v16, "smartBulletinBoardNotificationEnabled");
              v5 += objc_msgSend(v16, "reachabilityNotificationEnabled");
              v6 += objc_msgSend(v16, "recordingEventTriggers") & 1;
              if ((unint64_t)objc_msgSend(v16, "recordingEventTriggers") > 1)
                ++v7;
            }
            v46 += v13;
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          }
          while (v13);
        }

        v9 = v45 + 1;
      }
      while (v45 + 1 != v44);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v44);
  }
  else
  {
    v46 = 0;
  }

  objc_msgSend(v40, "setObject:forKeyedSubscript:", CFSTR("HomeKit Camera Configuration"), *MEMORY[0x1E0D28038]);
  -[HMDPowerLogObserver context](v39, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cameraConfigurationEventHistogram");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "intervalIndexForValue:", v46);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v19, CFSTR("numCameras"));

  -[HMDPowerLogObserver context](v39, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cameraConfigurationEventHistogram");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "intervalIndexForValue:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v22, CFSTR("numCamerasRecordingEnabled"));

  -[HMDPowerLogObserver context](v39, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cameraConfigurationEventHistogram");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "intervalIndexForValue:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v25, CFSTR("numCamerasSmartBulletinNotificationEnabled"));

  -[HMDPowerLogObserver context](v39, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "cameraConfigurationEventHistogram");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "intervalIndexForValue:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v28, CFSTR("numCamerasReachabilityNotificationEnabled"));

  -[HMDPowerLogObserver context](v39, "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "cameraConfigurationEventHistogram");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "intervalIndexForValue:", v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v31, CFSTR("numCamerasAnyMotionEventEnabled"));

  -[HMDPowerLogObserver context](v39, "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "cameraConfigurationEventHistogram");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "intervalIndexForValue:", v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v34, CFSTR("numCamerasHSVMotionEventEnabled"));

  -[HMDPowerLogObserver context](v39, "context");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "powerLogger");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x1E0D28040];
  v38 = (void *)objc_msgSend(v40, "copy");
  objc_msgSend(v36, "reportToPowerLogDestinationTable:withEventDictionary:", v37, v38);

}

- (void)start
{
  void *v3;
  HMDPowerLogObserver *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDPowerLogObserver context](v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedEventClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forEventClasses:", v4, v9);

}

- (void)stop
{
  void *v3;
  HMDPowerLogObserver *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDPowerLogObserver context](v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", v4);

}

- (HMDPowerLogObserverContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

+ (id)supportedEventClasses
{
  if (supportedEventClasses_onceToken != -1)
    dispatch_once(&supportedEventClasses_onceToken, &__block_literal_global_29047);
  return (id)supportedEventClasses_supportedEventClasses;
}

void __44__HMDPowerLogObserver_supportedEventClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedEventClasses_supportedEventClasses;
  supportedEventClasses_supportedEventClasses = v0;

}

@end
