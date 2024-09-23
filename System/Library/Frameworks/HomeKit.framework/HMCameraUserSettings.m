@implementation HMCameraUserSettings

- (void)configureWithAccessory:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_context, a4);
  v7 = a4;
  v8 = a3;
  objc_storeWeak((id *)&self->_accessory, v8);

  -[HMCameraUserSettings createSmartNotificationBulletin](self, "createSmartNotificationBulletin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraUserSettings setSmartNotificationBulletin:](self, "setSmartNotificationBulletin:", v9);

  objc_msgSend(v7, "messageDispatcher");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:selector:", CFSTR("hmcus.du"), self, sel_handleSettingsDidUpdateMessage_);

}

- (void)setSmartNotificationBulletin:(id)a3
{
  HMCameraBulletinBoardSmartNotification *v4;
  HMCameraBulletinBoardSmartNotification *smartNotificationBulletin;

  v4 = (HMCameraBulletinBoardSmartNotification *)a3;
  os_unfair_lock_lock_with_options();
  smartNotificationBulletin = self->_smartNotificationBulletin;
  self->_smartNotificationBulletin = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)isCameraManuallyDisabled
{
  void *v2;
  char v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCameraManuallyDisabled");

  return v3;
}

- (unint64_t)supportedFeatures
{
  void *v2;
  unint64_t v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedFeatures");

  return v3;
}

- (unint64_t)currentAccessMode
{
  void *v2;
  unint64_t v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentAccessMode");

  return v3;
}

- (_HMCameraUserSettings)cameraUserSettings
{
  os_unfair_lock_s *p_lock;
  _HMCameraUserSettings *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cameraUserSettings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)createSmartNotificationBulletin
{
  void *v3;
  HMCameraBulletinBoardSmartNotification *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMCameraBulletinBoardSmartNotification *v12;
  void *v13;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "supportedFeatures") & 2) != 0)
  {
    objc_msgSend(v3, "notificationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSmartBulletinBoardNotificationEnabled");

    objc_msgSend(v3, "notificationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "smartBulletinBoardNotificationCondition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMCameraUserSettings accessory](self, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMPredicateUtilities rewritePredicateForClient:home:](HMPredicateUtilities, "rewritePredicateForClient:home:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    v12 = [HMCameraBulletinBoardSmartNotification alloc];
    -[HMCameraUserSettings context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[HMCameraBulletinBoardSmartNotification initWithEnabled:condition:context:cameraUserSettings:](v12, "initWithEnabled:condition:context:cameraUserSettings:", v6, v11, v13, self);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMCameraUserSettings context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMCameraUserSettings)initWithCameraUserSettings:(id)a3
{
  id v5;
  HMCameraUserSettings *v6;
  HMCameraUserSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCameraUserSettings;
  v6 = -[HMCameraUserSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cameraUserSettings, a3);

  return v7;
}

- (HMCharacteristic)snapshotsAllowedCharacteristic
{
  return (HMCharacteristic *)-[HMCameraUserSettings _characteristicWithType:serviceType:](self, "_characteristicWithType:serviceType:", CFSTR("00000223-0000-1000-8000-0026BB765291"), CFSTR("0000021A-0000-1000-8000-0026BB765291"));
}

- (HMCharacteristic)accessModeIndicatorEnabledCharacteristic
{
  return (HMCharacteristic *)-[HMCameraUserSettings _characteristicWithType:serviceType:](self, "_characteristicWithType:serviceType:", CFSTR("0000021D-0000-1000-8000-0026BB765291"), CFSTR("0000021A-0000-1000-8000-0026BB765291"));
}

- (HMCharacteristic)nightVisionModeEnabledCharacteristic
{
  return (HMCharacteristic *)-[HMCameraUserSettings _characteristicWithType:serviceType:](self, "_characteristicWithType:serviceType:", CFSTR("0000011B-0000-1000-8000-0026BB765291"), CFSTR("0000021A-0000-1000-8000-0026BB765291"));
}

- (HMCharacteristic)recordingAudioEnabledCharacteristic
{
  return (HMCharacteristic *)-[HMCameraUserSettings _characteristicWithType:serviceType:](self, "_characteristicWithType:serviceType:", CFSTR("00000226-0000-1000-8000-0026BB765291"), CFSTR("00000204-0000-1000-8000-0026BB765291"));
}

- (unint64_t)accessModeForPresenceType:(unint64_t)a3
{
  if (a3 == 4)
    return -[HMCameraUserSettings accessModeNotAtHome](self, "accessModeNotAtHome");
  if (a3 == 3)
    return -[HMCameraUserSettings accessModeAtHome](self, "accessModeAtHome");
  return 3;
}

- (void)updateAccessMode:(unint64_t)a3 forPresenceEventType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMCameraUserSettings *v18;
  NSObject *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  HMCameraUserSettings *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMCameraUserSettings *v29;
  NSObject *v30;
  void *v31;
  char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMCameraUserSettings *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[6];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraUserSettings updateAccessMode:forPresenceEventType:completionHandler:]", CFSTR("completion"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1A1AC1AAC]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v39;
      v45 = 2112;
      v46 = (const char *)v35;
      _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v35, 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
  v9 = (void (**)(_QWORD, _QWORD))v8;
  -[HMCameraUserSettings context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (a4 - 3 >= 2)
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        HMPresenceEventTypeAsString(a4);
        v32 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v31;
        v45 = 2112;
        v46 = v32;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Invalid presence event type: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      -[HMCameraUserSettings context](v29, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateCaller");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "callCompletion:error:", v9, v34);

    }
    else
    {
      v11 = (void *)MEMORY[0x1E0D285F8];
      -[HMCameraUserSettings messageDestination](self, "messageDestination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = CFSTR("hmcus.amk");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v13;
      v51[1] = CFSTR("hmcus.ptk");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageWithName:destination:payload:", CFSTR("hmcus.am"), v12, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shortDescription");
        v21 = (char *)objc_claimAutoreleasedReturnValue();
        HMPresenceEventTypeAsString(a4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString(a3);
        v41 = v17;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v44 = v20;
        v45 = 2112;
        v46 = v21;
        v47 = 2112;
        v48 = v22;
        v49 = 2112;
        v50 = v23;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update access mode for %@ to %@", buf, 0x2Au);

        v17 = v41;
      }

      objc_autoreleasePoolPop(v17);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __80__HMCameraUserSettings_updateAccessMode_forPresenceEventType_completionHandler___block_invoke;
      v42[3] = &__block_descriptor_48_e38_v16__0___HMMutableCameraUserSettings_8l;
      v42[4] = a4;
      v42[5] = a3;
      -[HMCameraUserSettings _sendSettingsUpdateMessage:completion:successHandler:](v18, "_sendSettingsUpdateMessage:completion:successHandler:", v16, v9, v42);
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v27;
      v45 = 2080;
      v46 = "-[HMCameraUserSettings updateAccessMode:forPresenceEventType:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v16);
  }

}

- (void)updateRecordingEventTriggers:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  unint64_t v9;
  void *v10;
  HMCameraUserSettings *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMCameraUserSettings *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMCameraUserSettings *v26;
  NSObject *v27;
  void *v28;
  char *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMCameraUserSettings *v33;
  NSObject *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  void *v43;
  const __CFString *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraUserSettings updateRecordingEventTriggers:completionHandler:]", CFSTR("completion"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v35;
      v40 = 2112;
      v41 = (const char *)v31;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v31, 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v36);
  }
  v7 = (void (**)(_QWORD, _QWORD))v6;
  -[HMCameraUserSettings context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = a3 & 0xFFFFFFFFFFFFFFE0;
    if ((a3 & 0xFFFFFFFFFFFFFFE0) != 0)
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v13;
        v40 = 2048;
        v41 = (const char *)v9;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid bit set in trigger: %lX", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMCameraUserSettings context](v11, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v7, v16);

    }
    else
    {
      v21 = (void *)MEMORY[0x1E0D285F8];
      -[HMCameraUserSettings messageDestination](self, "messageDestination");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("hmcus.rtk");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "messageWithName:destination:payload:", CFSTR("hmcus.rt"), v22, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "shortDescription");
        v29 = (char *)objc_claimAutoreleasedReturnValue();
        NSPrintF();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v28;
        v40 = 2112;
        v41 = v29;
        v42 = 2112;
        v43 = v30;
        _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update recordingEventTriggers to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __71__HMCameraUserSettings_updateRecordingEventTriggers_completionHandler___block_invoke;
      v37[3] = &__block_descriptor_40_e38_v16__0___HMMutableCameraUserSettings_8l;
      v37[4] = a3;
      -[HMCameraUserSettings _sendSettingsUpdateMessage:completion:successHandler:](v26, "_sendSettingsUpdateMessage:completion:successHandler:", v14, v7, v37);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v20;
      v40 = 2080;
      v41 = "-[HMCameraUserSettings updateRecordingEventTriggers:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v14);
  }

}

- (void)updateAccessModeIndicatorEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  HMCameraUserSettings *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMCameraUserSettings *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraUserSettings updateAccessModeIndicatorEnabled:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v6 = (void (**)(_QWORD, _QWORD))v5;
  -[HMCameraUserSettings context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2080;
      v25 = "-[HMCameraUserSettings updateAccessModeIndicatorEnabled:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is no longer supported. See header for details", buf, 0x16u);

    }
    v13 = 48;
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      v24 = 2080;
      v25 = "-[HMCameraUserSettings updateAccessModeIndicatorEnabled:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    v13 = 12;
  }

  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v15);

}

- (void)updateSnapshotsAllowed:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  HMCameraUserSettings *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMCameraUserSettings *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraUserSettings updateSnapshotsAllowed:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v6 = (void (**)(_QWORD, _QWORD))v5;
  -[HMCameraUserSettings context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2080;
      v25 = "-[HMCameraUserSettings updateSnapshotsAllowed:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is no longer supported. See header for details", buf, 0x16u);

    }
    v13 = 48;
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      v24 = 2080;
      v25 = "-[HMCameraUserSettings updateSnapshotsAllowed:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    v13 = 12;
  }

  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v15);

}

- (void)updateNightVisionModeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  HMCameraUserSettings *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMCameraUserSettings *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraUserSettings updateNightVisionModeEnabled:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v6 = (void (**)(_QWORD, _QWORD))v5;
  -[HMCameraUserSettings context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2080;
      v25 = "-[HMCameraUserSettings updateNightVisionModeEnabled:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is no longer supported. See header for details", buf, 0x16u);

    }
    v13 = 48;
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      v24 = 2080;
      v25 = "-[HMCameraUserSettings updateNightVisionModeEnabled:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    v13 = 12;
  }

  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v15);

}

- (void)updateRecordingAudioEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  HMCameraUserSettings *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMCameraUserSettings *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraUserSettings updateRecordingAudioEnabled:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v6 = (void (**)(_QWORD, _QWORD))v5;
  -[HMCameraUserSettings context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2080;
      v25 = "-[HMCameraUserSettings updateRecordingAudioEnabled:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is no longer supported. See header for details", buf, 0x16u);

    }
    v13 = 48;
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      v24 = 2080;
      v25 = "-[HMCameraUserSettings updateRecordingAudioEnabled:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    v13 = 12;
  }

  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v15);

}

- (void)updateAccessModeChangeNotificationEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMCameraUserSettings *v15;
  NSObject *v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  HMCameraUserSettings *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMCameraUserSettings *v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  BOOL v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  const __CFString *v38;
  _QWORD v39[2];

  v4 = a3;
  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraUserSettings updateAccessModeChangeNotificationEnabled:completionHandler:]", CFSTR("completion"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      v34 = 2112;
      v35 = (const char *)v24;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v24, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v7 = (void (**)(_QWORD, _QWORD))v6;
  -[HMCameraUserSettings context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D285F8];
    -[HMCameraUserSettings messageDestination](self, "messageDestination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = CFSTR("hmcus.amcnemk");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageWithName:destination:payload:", CFSTR("hmcus.amcnem"), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v17;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update accessModeChangeNotificationEnabled to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __84__HMCameraUserSettings_updateAccessModeChangeNotificationEnabled_completionHandler___block_invoke;
    v30[3] = &__block_descriptor_33_e38_v16__0___HMMutableCameraUserSettings_8l;
    v31 = v4;
    -[HMCameraUserSettings _sendSettingsUpdateMessage:completion:successHandler:](v15, "_sendSettingsUpdateMessage:completion:successHandler:", v13, v7, v30);
  }
  else
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v23;
      v34 = 2080;
      v35 = "-[HMCameraUserSettings updateAccessModeChangeNotificationEnabled:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v13);
  }

}

- (void)updateActivityZones:(id)a3 areActivityZonesIncludedForSignificantEventDetection:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMCameraUserSettings *v20;
  NSObject *v21;
  id v22;
  void *v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  HMCameraUserSettings *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMCameraUserSettings *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMCameraUserSettings *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  char *v43;
  _QWORD v44[4];
  id v45;
  BOOL v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  _QWORD v56[2];
  _QWORD v57[4];

  v6 = a4;
  v57[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraUserSettings updateActivityZones:areActivityZonesIncludedForSignificantEventDetection:completionHandler:]", CFSTR("completion"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1A1AC1AAC]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v39;
      v50 = 2112;
      v51 = (const char *)v35;
      _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v35, 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
  v10 = (void (**)(_QWORD, _QWORD))v9;
  -[HMCameraUserSettings context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v47);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (char *)v47;
    if (v12)
    {
      v56[0] = CFSTR("hmcus.azmk");
      v56[1] = CFSTR("hmcus.azifsedmk");
      v57[0] = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0D285F8];
      -[HMCameraUserSettings messageDestination](self, "messageDestination");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messageWithName:destination:payload:", CFSTR("hmcus.azm"), v17, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = v13;
        v22 = v8;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "shortDescription");
        v42 = v12;
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v41 = v19;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v49 = v23;
        v50 = 2112;
        v51 = v24;
        v52 = 2112;
        v53 = v22;
        v54 = 2112;
        v55 = v25;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update activity zones: %@ includedForSignificantEventDetection: %@", buf, 0x2Au);

        v12 = v42;
        v19 = v41;

        v8 = v22;
        v13 = v43;
      }

      objc_autoreleasePoolPop(v19);
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __115__HMCameraUserSettings_updateActivityZones_areActivityZonesIncludedForSignificantEventDetection_completionHandler___block_invoke;
      v44[3] = &unk_1E3AB3120;
      v45 = v8;
      v46 = v6;
      -[HMCameraUserSettings _sendSettingsUpdateMessage:completion:successHandler:](v20, "_sendSettingsUpdateMessage:completion:successHandler:", v18, v10, v44);
      v26 = v45;
    }
    else
    {
      v31 = (void *)MEMORY[0x1A1AC1AAC]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v34;
        v50 = 2112;
        v51 = v13;
        _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize activity zones: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      -[HMCameraUserSettings context](v32, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegateCaller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callCompletion:error:", v10, v26);
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v30;
      v50 = 2080;
      v51 = "-[HMCameraUserSettings updateActivityZones:areActivityZonesIncludedForSignificantEventDetection:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, char *))v10)[2](v10, v13);
  }

}

- (void)updateReachabilityEventNotificationEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMCameraUserSettings *v15;
  NSObject *v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  HMCameraUserSettings *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMCameraUserSettings *v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  BOOL v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  const __CFString *v38;
  _QWORD v39[2];

  v4 = a3;
  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraUserSettings updateReachabilityEventNotificationEnabled:completionHandler:]", CFSTR("completion"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      v34 = 2112;
      v35 = (const char *)v24;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v24, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v7 = (void (**)(_QWORD, _QWORD))v6;
  -[HMCameraUserSettings context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D285F8];
    -[HMCameraUserSettings messageDestination](self, "messageDestination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = CFSTR("hmcus.renemk");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageWithName:destination:payload:", CFSTR("hmcus.urenem"), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v17;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update reachabilityEventNotificationEnabled to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __85__HMCameraUserSettings_updateReachabilityEventNotificationEnabled_completionHandler___block_invoke;
    v30[3] = &__block_descriptor_33_e38_v16__0___HMMutableCameraUserSettings_8l;
    v31 = v4;
    -[HMCameraUserSettings _sendSettingsUpdateMessage:completion:successHandler:](v15, "_sendSettingsUpdateMessage:completion:successHandler:", v13, v7, v30);
  }
  else
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v23;
      v34 = 2080;
      v35 = "-[HMCameraUserSettings updateReachabilityEventNotificationEnabled:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v13);
  }

}

- (void)updateBulletinNotificationEnabled:(BOOL)a3 condition:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMCameraUserSettings *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[4];

  v6 = a3;
  v36[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v35[0] = CFSTR("HM.BulletinBoardNotificationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v10;
  v35[1] = CFSTR("HM.BulletinBoardNotificationCondition");
  encodeRootObject(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D285F8];
  -[HMCameraUserSettings messageDestination](self, "messageDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("kBulletinBoardNotificationCommitRequestKey"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1A1AC1AAC]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v21;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update bulletin notification enabled to %@ and condition to %@", buf, 0x2Au);

    v9 = v23;
  }

  objc_autoreleasePoolPop(v16);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __86__HMCameraUserSettings_updateBulletinNotificationEnabled_condition_completionHandler___block_invoke;
  v24[3] = &unk_1E3AB3120;
  v26 = v6;
  v25 = v8;
  v22 = v8;
  -[HMCameraUserSettings _sendSettingsUpdateMessage:completion:successHandler:](v17, "_sendSettingsUpdateMessage:completion:successHandler:", v15, v9, v24);

}

- (void)handleSettingsDidUpdateMessage:(id)a3
{
  id v4;
  void *v5;
  HMCameraUserSettings *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMCameraUserSettings *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  HMCameraUserSettings *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMCameraUserSettings *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing updated settings", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v11 = v9;
  objc_msgSend(v11, "hmf_dataForKey:", CFSTR("hmcus.uk"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = v10;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera settings from settings data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = v10;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid payload for updated settings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v13 = 0;
  }

  if (v13)
  {
    -[HMCameraUserSettings _updateSettings:shouldNotifyDelegate:](v10, "_updateSettings:shouldNotifyDelegate:", v13, 1);
    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v24);

  }
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraUserSettings messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (isInternalBuild())
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[HMCameraUserSettings accessory](self, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraUserSettings uniqueIdentifier](self, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMCameraUserSettings uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraUserSettings accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Accessory Name"), v6);
  objc_msgSend(v3, "addObject:", v7);

  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Settings"), v9);
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (void)setCameraUserSettings:(id)a3
{
  _HMCameraUserSettings *v4;
  _HMCameraUserSettings *cameraUserSettings;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (_HMCameraUserSettings *)objc_msgSend(v6, "copy");
  cameraUserSettings = self->_cameraUserSettings;
  self->_cameraUserSettings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMCameraBulletinBoardSmartNotification)smartNotificationBulletin
{
  os_unfair_lock_s *p_lock;
  HMCameraBulletinBoardSmartNotification *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_smartNotificationBulletin;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSUUID)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (unint64_t)accessModeAtHome
{
  void *v2;
  unint64_t v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessModeAtHome");

  return v3;
}

- (unint64_t)accessModeNotAtHome
{
  void *v2;
  unint64_t v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessModeNotAtHome");

  return v3;
}

- (unint64_t)recordingEventTriggers
{
  void *v2;
  unint64_t v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recordingEventTriggers");

  return v3;
}

- (BOOL)isAccessModeChangeNotificationEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessModeChangeNotificationEnabled");

  return v4;
}

- (NSSet)activityZones
{
  void *v2;
  void *v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityZones");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (BOOL)areActivityZonesIncludedForSignificantEventDetection
{
  void *v2;
  char v3;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areActivityZonesIncludedForSignificantEventDetection");

  return v3;
}

- (BOOL)isReachabilityEventNotificationEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReachabilityEventNotificationEnabled");

  return v4;
}

- (void)_updateSettings:(id)a3 shouldNotifyDelegate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  HMCameraUserSettings *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  HMCameraUserSettings *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMCameraUserSettings cameraUserSettings](self, "cameraUserSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating camera user settings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMCameraUserSettings setCameraUserSettings:](v10, "setCameraUserSettings:", v6);
    -[HMCameraUserSettings createSmartNotificationBulletin](v10, "createSmartNotificationBulletin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraUserSettings setSmartNotificationBulletin:](v10, "setSmartNotificationBulletin:", v13);

    if (v4)
    {
      -[HMCameraUserSettings delegate](v10, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMCameraUserSettings context](v10, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "delegateCaller");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __61__HMCameraUserSettings__updateSettings_shouldNotifyDelegate___block_invoke;
        v17[3] = &unk_1E3AB5ED8;
        v18 = v14;
        v19 = v10;
        objc_msgSend(v16, "invokeBlock:", v17);

      }
    }
  }

}

- (void)_mergeNewSettings:(id)a3
{
  id v4;

  objc_msgSend(a3, "cameraUserSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMCameraUserSettings _updateSettings:shouldNotifyDelegate:](self, "_updateSettings:shouldNotifyDelegate:", v4, 1);

}

- (id)_characteristicWithType:(id)a3 serviceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  -[HMCameraUserSettings accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "services");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__HMCameraUserSettings__characteristicWithType_serviceType___block_invoke;
  v19[3] = &unk_1E3AB3168;
  v20 = v7;
  v11 = v7;
  objc_msgSend(v9, "hmf_objectPassingTest:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "characteristics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __60__HMCameraUserSettings__characteristicWithType_serviceType___block_invoke_2;
  v17[3] = &unk_1E3AB3190;
  v18 = v6;
  v14 = v6;
  objc_msgSend(v13, "hmf_objectPassingTest:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_sendSettingsUpdateMessage:(id)a3 completion:(id)a4 successHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  HMCameraUserSettings *v21;
  id v22;
  id v23;
  id v24;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __77__HMCameraUserSettings__sendSettingsUpdateMessage_completion_successHandler___block_invoke;
  v20 = &unk_1E3AB31B8;
  v21 = self;
  v22 = v11;
  v23 = v8;
  v24 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v11;
  objc_msgSend(v10, "setResponseHandler:", &v17);
  -[HMCameraUserSettings context](self, "context", v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendMessage:", v10);

}

- (HMCameraUserSettingsDelegate)delegate
{
  return (HMCameraUserSettingsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)areSnapshotsAllowed
{
  return self->_snapshotsAllowed;
}

- (BOOL)isAccessModeIndicatorEnabled
{
  return self->_accessModeIndicatorEnabled;
}

- (BOOL)isNightVisionModeEnabled
{
  return self->_nightVisionModeEnabled;
}

- (BOOL)isRecordingAudioEnabled
{
  return self->_recordingAudioEnabled;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_smartNotificationBulletin, 0);
  objc_storeStrong((id *)&self->_cameraUserSettings, 0);
}

void __77__HMCameraUserSettings__sendSettingsUpdateMessage_completion_successHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Camera settings request failed for %@: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v18 = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Camera settings request succeeded for %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "mutableCopy");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_updateSettings:shouldNotifyDelegate:", v13, 0);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "callCompletion:error:", *(_QWORD *)(a1 + 48), 0);

  }
}

uint64_t __60__HMCameraUserSettings__characteristicWithType_serviceType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __60__HMCameraUserSettings__characteristicWithType_serviceType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __61__HMCameraUserSettings__updateSettings_shouldNotifyDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cameraUserSettingsDidUpdate:", *(_QWORD *)(a1 + 40));
}

void __86__HMCameraUserSettings_updateBulletinNotificationEnabled_condition_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "notificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setSmartBulletinBoardNotificationEnabled:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v5, "setSmartBulletinBoardNotificationCondition:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setNotificationSettings:", v5);

}

void __85__HMCameraUserSettings_updateReachabilityEventNotificationEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "notificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setReachabilityEventNotificationEnabled:", *(unsigned __int8 *)(a1 + 32));
  objc_msgSend(v3, "setNotificationSettings:", v5);

}

void __115__HMCameraUserSettings_updateActivityZones_areActivityZonesIncludedForSignificantEventDetection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setActivityZones:", v3);
  objc_msgSend(v4, "setActivityZonesIncludedForSignificantEventDetection:", *(unsigned __int8 *)(a1 + 40));

}

void __84__HMCameraUserSettings_updateAccessModeChangeNotificationEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "notificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setAccessModeChangeNotificationEnabled:", *(unsigned __int8 *)(a1 + 32));
  objc_msgSend(v3, "setNotificationSettings:", v5);

}

uint64_t __71__HMCameraUserSettings_updateRecordingEventTriggers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRecordingEventTriggers:", *(_QWORD *)(a1 + 32));
}

uint64_t __80__HMCameraUserSettings_updateAccessMode_forPresenceEventType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == 3)
    return objc_msgSend(a2, "setAccessModeAtHome:", v2);
  else
    return objc_msgSend(a2, "setAccessModeNotAtHome:", v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t35_33660 != -1)
    dispatch_once(&logCategory__hmf_once_t35_33660, &__block_literal_global_33661);
  return (id)logCategory__hmf_once_v36_33662;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __35__HMCameraUserSettings_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v36_33662;
  logCategory__hmf_once_v36_33662 = v0;

}

@end
