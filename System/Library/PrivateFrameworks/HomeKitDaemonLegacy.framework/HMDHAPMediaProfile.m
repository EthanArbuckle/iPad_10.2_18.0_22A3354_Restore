@implementation HMDHAPMediaProfile

- (HMDHAPMediaProfile)initWithMediaServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDHAPMediaProfile *v8;
  HMDHAPMediaProfile *v9;
  uint64_t v10;
  NSString *clientIdentifier;
  HMDHAPMediaProfile *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "uniqueIdentifierFromAccessory:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)HMDHAPMediaProfile;
    v8 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:](&v17, sel_initWithAccessory_uniqueIdentifier_services_, v6, v7, v4);
    v9 = v8;
    if (v8)
    {
      v8->_airPlayEnable = -1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.HMDHAPMediaProfile.%@"), CFSTR("com.apple.HomeKitDaemon.Local"), v7);
      v10 = objc_claimAutoreleasedReturnValue();
      clientIdentifier = v9->_clientIdentifier;
      v9->_clientIdentifier = (NSString *)v10;

    }
    self = v9;

    v12 = self;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot create media profile, cannot determine accessory from services %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (void)registerForNotifications
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
  HMDHAPMediaProfile *v14;
  NSObject *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)HMDHAPMediaProfile;
  -[HMDMediaProfile registerForNotifications](&v17, sel_registerForNotifications);
  -[HMDAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleHomeCharacteristicValuesChanged_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleHomeCharacteristicValuesChanged_, CFSTR("HMDAccessoryCharacteristicsResponseReceivedNotification"), v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleAccessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleCharacteristicsUpdated_, CFSTR("kHMDNotificationCharacteristicsUpdated"), v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleResidentAdded_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "residentDeviceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChanged_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), v12);

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Not registering for notifications as accessory is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (unint64_t)capability
{
  return 1;
}

- (id)_smartSpeakerService
{
  return -[HMDAccessoryProfile findServiceWithType:](self, "findServiceWithType:", CFSTR("00000228-0000-1000-8000-0026BB765291"));
}

- (id)_smartSpeakerTargetMediaStateCharacteristic
{
  void *v2;
  void *v3;

  -[HMDHAPMediaProfile _smartSpeakerService](self, "_smartSpeakerService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x1E0CB8AE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)playStateWriteRequestWithPlaybackState:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMediaProfile _smartSpeakerTargetMediaStateWriteRequestWithPlaybackState:](self, "_smartSpeakerTargetMediaStateWriteRequestWithPlaybackState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_smartSpeakerTargetMediaStateWriteRequestWithPlaybackState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HMDHAPMediaProfile _smartSpeakerTargetMediaStateCharacteristic](self, "_smartSpeakerTargetMediaStateCharacteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = objc_msgSend(v4, "integerValue");
    if (v7 > 6)
      v8 = 0;
    else
      v8 = qword_1CDB8F930[v7];
    objc_msgSend(v6, "numberWithInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authorizationData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v5, v10, v11, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HMDCharacteristic)smartSpeakerCurrentMediaStateCharacteristic
{
  void *v2;
  void *v3;

  -[HMDHAPMediaProfile _smartSpeakerService](self, "_smartSpeakerService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x1E0CB8870]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCharacteristic *)v3;
}

- (id)_smartSpeakerCurrentMediaStateReadRequest
{
  void *v2;
  void *v3;

  -[HMDHAPMediaProfile smartSpeakerCurrentMediaStateCharacteristic](self, "smartSpeakerCurrentMediaStateCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (HMDCharacteristic)smartSpeakerVolumeCharacteristic
{
  void *v2;
  void *v3;

  -[HMDHAPMediaProfile _smartSpeakerService](self, "_smartSpeakerService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x1E0CB8B38]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCharacteristic *)v3;
}

- (id)_smartSpeakerVolumeReadRequest
{
  void *v2;
  void *v3;

  -[HMDHAPMediaProfile smartSpeakerVolumeCharacteristic](self, "smartSpeakerVolumeCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_smartSpeakerVolumeWriteRequestWithVolumePercentage:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;

  v4 = (unint64_t)a3;
  -[HMDHAPMediaProfile smartSpeakerVolumeCharacteristic](self, "smartSpeakerVolumeCharacteristic");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 | v5)
  {
    v7 = 0;
    if (v4 && v5)
    {
      objc_msgSend((id)v4, "floatValue");
      v9 = v8;
      objc_msgSend(v6, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "minimumValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "minimumValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        v14 = v13;

      }
      else
      {
        v14 = 0.0;
      }

      objc_msgSend(v10, "maximumValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v10, "maximumValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        v19 = v18;

      }
      else
      {
        v19 = 100.0;
      }

      v20 = v14 + (float)(v9 * (float)(v19 - v14));
      objc_msgSend(v10, "stepValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      if (v21)
      {
        objc_msgSend(v21, "floatValue");
        v20 = *(float *)&v22 * roundf(v20 / *(float *)&v22);
      }
      *(float *)&v22 = v20;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "authorizationData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v6, v7, v24, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_smartSpeakerMutedCharacteristic
{
  void *v2;
  void *v3;

  -[HMDHAPMediaProfile _smartSpeakerService](self, "_smartSpeakerService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x1E0CB8960]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_smartSpeakerMutedReadRequest
{
  void *v2;
  void *v3;

  -[HMDHAPMediaProfile _smartSpeakerMutedCharacteristic](self, "_smartSpeakerMutedCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_smartSpeakerMutedWriteRequestWithMuted:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (unint64_t)a3;
  -[HMDHAPMediaProfile _smartSpeakerMutedCharacteristic](self, "_smartSpeakerMutedCharacteristic");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 | v5)
  {
    objc_msgSend((id)v5, "authorizationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v6, v4, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_smartSpeakerAirPlayEnableCharacteristic
{
  void *v2;
  void *v3;

  -[HMDHAPMediaProfile _smartSpeakerService](self, "_smartSpeakerService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", CFSTR("0000025B-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_smartSpeakerAirPlayEnableReadRequest
{
  void *v2;
  void *v3;

  -[HMDHAPMediaProfile _smartSpeakerAirPlayEnableCharacteristic](self, "_smartSpeakerAirPlayEnableCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setAirPlayEnable:(int64_t)a3
{
  hmf_unfair_data_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_airPlayEnable = a3;
  os_unfair_lock_unlock(&p_lock->lock);
}

- (int64_t)airPlayEnable
{
  hmf_unfair_data_lock_s *p_lock;
  int64_t airPlayEnable;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  airPlayEnable = self->_airPlayEnable;
  os_unfair_lock_unlock(&p_lock->lock);
  return airPlayEnable;
}

- (BOOL)_updatePlayback:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  HMDHAPMediaProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHAPMediaProfile *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDHAPMediaProfile *v22;
  NSObject *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  objc_super v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMDHAPMediaProfile;
  if (-[HMDMediaProfile _updatePlayback:](&v30, sel__updatePlayback_, v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@No local media session for hapMediaProfile", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9580]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HMDAccessoryProfile accessory](v7, "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v12;

      if (v13)
      {
        -[HMDHAPMediaProfile _smartSpeakerTargetMediaStateWriteRequestWithPlaybackState:](v7, "_smartSpeakerTargetMediaStateWriteRequestWithPlaybackState:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v14 != 0;
        if (v14)
        {
          objc_initWeak((id *)buf, v7);
          v31 = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryProfile workQueue](v7, "workQueue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __38__HMDHAPMediaProfile__updatePlayback___block_invoke;
          v26[3] = &unk_1E89C1880;
          objc_copyWeak(&v29, (id *)buf);
          v27 = v14;
          v28 = v4;
          objc_msgSend(v13, "writeCharacteristicValues:source:message:queue:completionHandler:", v15, 7, v28, v16, v26);

          objc_destroyWeak(&v29);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          v21 = (void *)MEMORY[0x1D17BA0A0]();
          v22 = v7;
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v33 = v24;
            _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Update Playback] failed to create target media state write request", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v21);
        }

      }
      else
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = v7;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v20;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Update Playback] accessory not part of profile", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
        v13 = 0;
        v5 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v13);
      v5 = 1;
    }

  }
  return v5;
}

- (BOOL)_updateRefreshPlayback:(id)a3
{
  void *v4;
  HMDHAPMediaProfile *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHAPMediaProfile *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDHAPMediaProfile *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  HMDHAPMediaProfile *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v34;
  void *v35;
  id v36;
  BOOL v37;
  id v38;
  uint64_t v39;
  id obj;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  HMDHAPMediaProfile *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)HMDHAPMediaProfile;
  v38 = a3;
  if (!-[HMDMediaProfile _updateRefreshPlayback:](&v50, sel__updateRefreshPlayback_))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@No local media session for hapMediaProfile", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDAccessoryProfile accessory](v5, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v36 = v9;

    v37 = v36 != 0;
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHAPMediaProfile _smartSpeakerAirPlayEnableReadRequest](v5, "_smartSpeakerAirPlayEnableReadRequest");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        objc_msgSend(v41, "addObject:", v34);
      }
      else
      {
        v14 = (void *)MEMORY[0x1D17BA0A0](0);
        v15 = v5;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v53 = v17;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] smart speaker airplay enable state is not available", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
      }
      objc_msgSend(v38, "arrayForKey:", *MEMORY[0x1E0CB9590], v34);
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v47;
        v20 = *MEMORY[0x1E0CB9580];
        v21 = *MEMORY[0x1E0CB95E8];
        v39 = *MEMORY[0x1E0CB9570];
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v47 != v19)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            if (objc_msgSend(v23, "isEqual:", v20))
            {
              -[HMDHAPMediaProfile _smartSpeakerCurrentMediaStateReadRequest](v5, "_smartSpeakerCurrentMediaStateReadRequest");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v24)
              {
                v25 = (void *)MEMORY[0x1D17BA0A0]();
                v26 = v5;
                HMFGetOSLogHandle();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v53 = v28;
                  _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] smart speaker current media state is not available", buf, 0xCu);

                }
LABEL_39:

                objc_autoreleasePoolPop(v25);
                v24 = 0;
                goto LABEL_40;
              }
            }
            else if (objc_msgSend(v23, "isEqual:", v21))
            {
              -[HMDHAPMediaProfile _smartSpeakerVolumeReadRequest](v5, "_smartSpeakerVolumeReadRequest");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v24)
              {
                v25 = (void *)MEMORY[0x1D17BA0A0]();
                v26 = v5;
                HMFGetOSLogHandle();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v53 = v29;
                  _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] smart speaker volume is not available", buf, 0xCu);

                }
                goto LABEL_39;
              }
            }
            else
            {
              if (!objc_msgSend(v23, "isEqual:", v39))
                continue;
              -[HMDHAPMediaProfile _smartSpeakerMutedReadRequest](v5, "_smartSpeakerMutedReadRequest");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v24)
              {
                v25 = (void *)MEMORY[0x1D17BA0A0]();
                v26 = v5;
                HMFGetOSLogHandle();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v53 = v30;
                  _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] smart speaker muted is not available", buf, 0xCu);

                }
                goto LABEL_39;
              }
            }
            objc_msgSend(v41, "addObject:", v24);
LABEL_40:

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v18);
      }

      objc_initWeak((id *)buf, v5);
      -[HMDAccessoryProfile workQueue](v5, "workQueue");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __45__HMDHAPMediaProfile__updateRefreshPlayback___block_invoke;
      v42[3] = &unk_1E89C1880;
      objc_copyWeak(&v45, (id *)buf);
      v32 = v41;
      v43 = v32;
      v44 = v38;
      objc_msgSend(v36, "readCharacteristicValues:source:queue:completionHandler:", v32, 7, v31, v42);

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = v5;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v13;
        v54 = 2112;
        v55 = v11;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Refreshing Playback] accessory not part of profile (%@)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }

    goto LABEL_45;
  }
  v37 = 1;
LABEL_45:

  return v37;
}

- (id)mediaSessionFromProfile
{
  void *v3;
  HMDMediaSession *v4;
  void *v5;
  HMDMediaSession *v6;
  void *v7;
  HMDHAPMediaProfile *v8;
  NSObject *v9;
  void *v10;
  HMDHAPMediaProfile *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMDHAPMediaProfile _mediaSessionStateFromProfile](self, "_mediaSessionStateFromProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [HMDMediaSession alloc];
    v12 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HMDMediaSession initWithEndpoint:mediaProfiles:state:](v4, "initWithEndpoint:mediaProfiles:state:", 0, v5, v3);

  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive media session from profile due to no media session state from profile", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return v6;
}

- (id)_mediaSessionStateFromProfile
{
  void *v3;
  HMDMediaSessionState *v4;
  void *v5;
  HMDMediaSessionState *v6;
  void *v7;
  void *v8;
  HMDHAPMediaProfile *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [HMDMediaSessionState alloc];
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HMDMediaSessionState initWithSessionIdentifier:](v4, "initWithSessionIdentifier:", v5);

    if (objc_msgSend(v3, "isReachable"))
    {
      -[HMDAccessoryProfile services](self, "services");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHAPMediaProfile updateMediaSessionState:usingServices:](self, "updateMediaSessionState:usingServices:", v6, v7);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive media session state from profile due to no accessory", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v6 = 0;
  }

  return v6;
}

- (void)updateMediaSessionState:(id)a3 usingServices:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a4, "na_filter:", &__block_literal_global_160457);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characteristics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPMediaProfile updateMediaSessionState:usingCharacteristics:](self, "updateMediaSessionState:usingCharacteristics:", v9, v8);

  }
}

- (void)updateMediaSessionState:(id)a3 usingCharacteristics:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    v10 = *MEMORY[0x1E0CB8870];
    v11 = *MEMORY[0x1E0CB8B38];
    v33 = *MEMORY[0x1E0CB8960];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
        objc_msgSend(v13, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v10);

        if (v15)
        {
          objc_msgSend(v13, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = v16;
          else
            v17 = 0;
          v18 = v17;

          v19 = objc_msgSend(v18, "integerValue");
          if ((unint64_t)(v19 - 1) > 4)
            v20 = 1;
          else
            v20 = qword_1CDB8F968[v19 - 1];
          objc_msgSend(v5, "setPlaybackState:", v20);
        }
        else
        {
          objc_msgSend(v13, "type");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v11);

          if (v22)
          {
            objc_msgSend(v13, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v24 = v23;
            else
              v24 = 0;
            v25 = v24;

            __percentageForCharacteristicValue(0, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "setVolume:", v26);
          }
          else
          {
            objc_msgSend(v13, "type");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", v33);

            if (v28)
            {
              objc_msgSend(v13, "value");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v30 = v29;
              else
                v30 = 0;
              v31 = v30;

              objc_msgSend(v5, "setMuted:", v31);
            }
          }
        }
        ++v12;
      }
      while (v8 != v12);
      v32 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v8 = v32;
    }
    while (v32);
  }

}

- (void)_handleCharacteristicChanges:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  HMDHAPMediaProfile *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v31 = self;
  v42 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v3)
  {
    v32 = 0;
    v34 = 0;
    v35 = 0;
    v5 = 0;
    goto LABEL_35;
  }
  v4 = v3;
  v32 = 0;
  v34 = 0;
  v35 = 0;
  v5 = 0;
  v6 = *(_QWORD *)v38;
  v7 = *MEMORY[0x1E0CB8870];
  v8 = *MEMORY[0x1E0CB8B38];
  v33 = *MEMORY[0x1E0CB8960];
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v38 != v6)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v9);
      objc_msgSend(v10, "type", v31);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v7);

      if (v12)
      {
        objc_msgSend(v10, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        v16 = (void *)MEMORY[0x1E0CB37E8];
        v17 = objc_msgSend(v15, "integerValue") - 1;
        if (v17 > 4)
          v18 = 1;
        else
          v18 = qword_1CDB8F968[v17];
        objc_msgSend(v16, "numberWithInteger:", v18);
        v23 = v5;
        v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(v10, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v8);

      if (v20)
      {
        objc_msgSend(v10, "value");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
        v15 = v22;

        __percentageForCharacteristicValue(0, v15);
        v23 = v35;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      objc_msgSend(v10, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", v33);

      if (v25)
      {
        objc_msgSend(v10, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v23;
        else
          v26 = 0;
        v15 = v34;
        v34 = v26;
        goto LABEL_19;
      }
      objc_msgSend(v10, "type");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("0000025B-0000-1000-8000-0026BB765291"));

      if (v28)
      {
        objc_msgSend(v10, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v23;
        else
          v29 = 0;
        v15 = v32;
        v32 = v29;
        goto LABEL_19;
      }
LABEL_20:
      ++v9;
    }
    while (v4 != v9);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    v4 = v30;
  }
  while (v30);
LABEL_35:
  -[HMDHAPMediaProfile _updateCurrentMediaState:volumePercentage:muted:enable:message:](v31, "_updateCurrentMediaState:volumePercentage:muted:enable:message:", v5, v35, v34, v32, 0, v31);

}

- (void)_updateCharacteristicChanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDAccessoryProfile services](self, "services", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "characteristics");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[HMDHAPMediaProfile _handleCharacteristicChanges:](self, "_handleCharacteristicChanges:", v3);
}

- (void)handleHomeCharacteristicValuesChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD block[4];
  id v18;
  HMDHAPMediaProfile *v19;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    -[HMDAccessoryProfile workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__HMDHAPMediaProfile_handleHomeCharacteristicValuesChanged___block_invoke;
    block[3] = &unk_1E89C2328;
    v18 = v6;
    v19 = self;
    dispatch_async(v7, block);

    v8 = v18;
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmf_dictionaryForKey:", CFSTR("kModifiedCharacteristicsForAccessoryKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryProfile accessory](self, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_dictionaryForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HMDAccessoryProfile workQueue](self, "workQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__HMDHAPMediaProfile_handleHomeCharacteristicValuesChanged___block_invoke_2;
      v15[3] = &unk_1E89C2328;
      v15[4] = self;
      v16 = v13;
      dispatch_async(v14, v15);

    }
  }

}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HMDHAPMediaProfile_handleAccessoryConfigured___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleCharacteristicsUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HMDHAPMediaProfile_handleCharacteristicsUpdated___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_allCharacteristicsToMonitor
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  -[HMDHAPMediaProfile _smartSpeakerAirPlayEnableCharacteristic](self, "_smartSpeakerAirPlayEnableCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (void)_setCharacteristicNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDHAPMediaProfile *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentDeviceSupportsSidekickSettings");

  if (v7)
  {
    -[HMDHAPMediaProfile _allCharacteristicsToMonitor](self, "_allCharacteristicsToMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      -[HMDAccessoryProfile accessory](self, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("Disable");
        v18 = 138543874;
        v19 = v15;
        v20 = 2112;
        if (v3)
          v16 = CFSTR("Enable");
        v21 = v16;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@%@ notifications for characteristics: %@", (uint8_t *)&v18, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDHAPMediaProfile clientIdentifier](v13, "clientIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "enableNotification:forCharacteristics:message:clientIdentifier:", v3, v8, 0, v17);

    }
  }
}

- (void)_disableCharacteristicNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDHAPMediaProfile *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDHAPMediaProfile _allCharacteristicsToMonitor](self, "_allCharacteristicsToMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[HMDAccessoryProfile accessory](self, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Disabling notifications for characteristics :%@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDHAPMediaProfile clientIdentifier](v8, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enableNotification:forCharacteristics:message:clientIdentifier:", 0, v3, 0, v11);

  }
}

- (void)handleResidentAdded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDHAPMediaProfile *v9;

  v4 = a3;
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HMDHAPMediaProfile_handleResidentAdded___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handlePrimaryResidentChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HMDHAPMediaProfile_handlePrimaryResidentChanged___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)_updateAudioControl:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  HMDHAPMediaProfile *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHAPMediaProfile *v18;
  NSObject *v19;
  void *v20;
  HMDHAPMediaProfile *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDHAPMediaProfile *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *context;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  HMDHAPMediaProfile *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)HMDHAPMediaProfile;
  if (!-[HMDMediaProfile _updateAudioControl:](&v36, sel__updateAudioControl_, v4))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@No local media session for hapMediaProfile", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9550]);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9538]);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 | v11)
    {
      -[HMDAccessoryProfile accessory](v7, "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      if (!v14)
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = v7;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v20;
          v39 = 2112;
          v40 = v18;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Updating Audio Control] accessory not part of profile (%@)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        v14 = 0;
        v5 = 0;
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[HMDHAPMediaProfile _smartSpeakerVolumeWriteRequestWithVolumePercentage:](v7, "_smartSpeakerVolumeWriteRequestWithVolumePercentage:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v15, "addObject:", v16);
        }
        else
        {
          context = (void *)MEMORY[0x1D17BA0A0]();
          v21 = v7;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v38 = v23;
            _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Updating Audio Control] smart speaker volume is not available", buf, 0xCu);

          }
          objc_autoreleasePoolPop(context);
        }

      }
      if (v11)
      {
        -[HMDHAPMediaProfile _smartSpeakerMutedWriteRequestWithMuted:](v7, "_smartSpeakerMutedWriteRequestWithMuted:", v11);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v15, "addObject:", v24);
        }
        else
        {
          context = (void *)MEMORY[0x1D17BA0A0]();
          v25 = v7;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v38 = v27;
            _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Updating Audio Control] smart speaker muted is not available", buf, 0xCu);

          }
          objc_autoreleasePoolPop(context);
        }

      }
      if (objc_msgSend(v15, "count", context))
      {
        objc_initWeak((id *)buf, v7);
        -[HMDAccessoryProfile workQueue](v7, "workQueue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __42__HMDHAPMediaProfile__updateAudioControl___block_invoke;
        v32[3] = &unk_1E89C1880;
        objc_copyWeak(&v35, (id *)buf);
        v33 = v15;
        v34 = v4;
        objc_msgSend(v14, "writeCharacteristicValues:source:message:queue:completionHandler:", v33, 7, v34, v28, v32);

        objc_destroyWeak(&v35);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v29);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v14);
    }
    v5 = 1;
LABEL_33:

    goto LABEL_34;
  }
  v5 = 1;
LABEL_34:

  return v5;
}

- (void)_updateCurrentMediaState:(id)a3 volumePercentage:(id)a4 muted:(id)a5 enable:(id)a6 message:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  HMDHAPMediaProfile *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12 || v13 || v14 || v15)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v18 = v17;
    if (v12)
      objc_msgSend(v17, "setValue:forKey:", v12, *MEMORY[0x1E0CB9580]);
    if (v13)
      objc_msgSend(v18, "setValue:forKey:", v13, *MEMORY[0x1E0CB95E8]);
    if (v14)
      objc_msgSend(v18, "setValue:forKey:", v14, *MEMORY[0x1E0CB9570]);
    v41 = v18;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    if (v15)
    {
      v20 = objc_msgSend(v15, "integerValue");
      v21 = v20 == 1 ? 1 : -1;
      v22 = v20 ? v21 : 0;
      if (-[HMDHAPMediaProfile airPlayEnable](self, "airPlayEnable") != v22)
      {
        -[HMDHAPMediaProfile setAirPlayEnable:](self, "setAirPlayEnable:", v22);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHAPMediaProfile airPlayEnable](self, "airPlayEnable"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setValue:forKey:", v23, CFSTR("settings-airplay"));

      }
    }
    v39 = v19;
    v40 = v15;
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v43 = v27;
      v44 = 2112;
      v45 = v12;
      v46 = 2112;
      v47 = v13;
      v48 = 2112;
      v49 = v14;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Notifying XPC clients of updated current media state %@, volume %@, muted %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v24);
    v28 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMDAccessoryProfile uniqueIdentifier](v25, "uniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithTarget:", v29);

    v31 = (void *)MEMORY[0x1E0D285F8];
    v32 = *MEMORY[0x1E0CB9588];
    v33 = (void *)objc_msgSend(v41, "copy");
    objc_msgSend(v31, "messageWithName:destination:payload:", v32, v30, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v16;
    objc_msgSend(v16, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      objc_msgSend(v34, "setIdentifier:", v36);
    objc_msgSend(v34, "setRequiresSPIEntitlement");
    -[HMDAccessoryProfile msgDispatcher](v25, "msgDispatcher");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v37, "sendMessage:completionHandler:", v38, 0);

    -[HMDHAPMediaProfile _notifyProfileSettingsUpdated:](v25, "_notifyProfileSettingsUpdated:", v39);
    v16 = v35;
    v15 = v40;
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDHAPMediaProfile;
  -[HMDMediaProfile encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMDMediaProfile mediaSession](self, "mediaSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HMDHAPMediaProfile mediaSessionFromProfile](self, "mediaSessionFromProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x1E0CB9520]);

  }
}

- (void)_notifyProfileSettingsUpdated:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("HMDHAPMediaProfileUpdatedNotification"), self, v5);

  }
}

- (void)setEnable:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMDHAPMediaProfile *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDHAPMediaProfile *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29[2];
  void *v30;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)a3 < 2)
  {
    -[HMDAccessoryProfile accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      -[HMDHAPMediaProfile _smartSpeakerAirPlayEnableCharacteristic](self, "_smartSpeakerAirPlayEnableCharacteristic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 == 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "authorizationData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v11, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_initWeak(location, self);
        v30 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryProfile workQueue](self, "workQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __50__HMDHAPMediaProfile_setEnable_completionHandler___block_invoke;
        v26[3] = &unk_1E89BBFB0;
        objc_copyWeak(v29, location);
        v17 = v14;
        v27 = v17;
        v28 = v6;
        v29[1] = (id)a3;
        objc_msgSend(v10, "writeCharacteristicValues:source:queue:completionHandler:", v15, 7, v16, v26);

        objc_destroyWeak(v29);
        objc_destroyWeak(location);
      }
      else
      {
LABEL_12:
        v18 = (void *)MEMORY[0x1D17BA0A0]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = v21;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Set AirPlay Enable] failed to create AirPlay enable write request", (uint8_t *)location, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v6)
          (*((void (**)(id, id))v6 + 2))(v6, v17);
      }

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Set AirPlay Enable] accessory not part of profile", (uint8_t *)location, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        (*((void (**)(id, void *))v6 + 2))(v6, v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      (*((void (**)(id, void *))v6 + 2))(v6, v7);

  }
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

void __50__HMDHAPMediaProfile_setEnable_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v35 = (_QWORD *)a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v3, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v39;
      do
      {
        v9 = 0;
        v36 = v6;
        do
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
          objc_msgSend(v10, "error", v34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "error");
            v12 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)MEMORY[0x1D17BA0A0]();
            v14 = WeakRetained;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v16 = v8;
              v17 = WeakRetained;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "request");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "error");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v45 = v18;
              v46 = 2112;
              v47 = v19;
              v48 = 2112;
              v49 = v20;
              _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              WeakRetained = v17;
              v8 = v16;
              v6 = v36;
            }

            objc_autoreleasePoolPop(v13);
            v7 = (void *)v12;
          }
          else
          {
            objc_msgSend(v10, "request");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "characteristic");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "type");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqual:", CFSTR("0000025B-0000-1000-8000-0026BB765291"));

            if (v24)
            {
              objc_msgSend(WeakRetained, "setAirPlayEnable:", v35[7]);
              v42 = CFSTR("settings-airplay");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "airPlayEnable"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v25;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(WeakRetained, "_notifyProfileSettingsUpdated:", v26);
            }
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v33 = v35[5];
    if (v33)
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
    v3 = v34;
  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = WeakRetained;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v35[4];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v35[5];
    if (v32)
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v7);
  }

}

void __42__HMDHAPMediaProfile__updateAudioControl___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  uint64_t v30;
  id v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v3, "count"))
  {
    v30 = a1;
    v31 = v3;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v35;
      do
      {
        v9 = 0;
        v32 = v6;
        do
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
          objc_msgSend(v10, "error", v30);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "error");
            v12 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)MEMORY[0x1D17BA0A0]();
            v14 = WeakRetained;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v16 = v8;
              v17 = WeakRetained;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "value");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "error");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v39 = v18;
              v40 = 2112;
              v41 = v19;
              v42 = 2112;
              v43 = v20;
              _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write value %@ failed with error %@", buf, 0x20u);

              WeakRetained = v17;
              v8 = v16;
              v6 = v32;
            }

            objc_autoreleasePoolPop(v13);
            v7 = (void *)v12;
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(*(id *)(v30 + 40), "responseHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(*(id *)(v30 + 40), "responseHandler");
      v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v29)[2](v29, v7, 0);

    }
    v3 = v31;
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = WeakRetained;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = a1;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(v24 + 32);
      *(_DWORD *)buf = 138543618;
      v39 = v25;
      v40 = 2112;
      v41 = v26;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid response with write values %@", buf, 0x16u);

      a1 = v24;
    }

    objc_autoreleasePoolPop(v21);
    v27 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "respondWithError:", v7);
  }

}

void __51__HMDHAPMediaProfile_handlePrimaryResidentChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v1 = a1;
  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v4;
  objc_msgSend(v4, "residentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v23 = v1;
    v24 = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "device");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isCurrentDevice"))
        {
          objc_msgSend(v10, "capabilities");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "supportsSiriEndpointSetup");

          if (v13)
          {
            v14 = objc_msgSend(v10, "isConfirmed");
            v15 = (void *)MEMORY[0x1D17BA0A0]();
            v16 = *(id *)(v1 + 32);
            HMFGetOSLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v19 = v8;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v30 = v18;
              v31 = 2112;
              v32 = v20;
              _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Current device is primary:%@ and does not support home hub", buf, 0x16u);

              v8 = v19;
              v1 = v23;
              v5 = v24;
            }

            objc_autoreleasePoolPop(v15);
            v21 = *(void **)(v1 + 32);
            if (v14)
              objc_msgSend(v21, "_setCharacteristicNotifications:", 1);
            else
              objc_msgSend(v21, "_disableCharacteristicNotifications");
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v7);
  }

}

void __42__HMDHAPMediaProfile_handleResidentAdded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
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
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "isCurrentDevice"))
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        v18 = 2112;
        v19 = v13;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Current device was added as a resident device (%@ / %@) notification.", (uint8_t *)&v14, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(*(id *)(a1 + 40), "_setCharacteristicNotifications:", 1);
    }
  }
  else
  {
    v6 = 0;
  }

}

uint64_t __51__HMDHAPMediaProfile_handleCharacteristicsUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_updateCharacteristicChanges");
}

uint64_t __48__HMDHAPMediaProfile_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_updateCharacteristicChanges");
  return objc_msgSend(*(id *)(a1 + 32), "_setCharacteristicNotifications:", 1);
}

void __60__HMDHAPMediaProfile_handleHomeCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v1 = a1;
  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(v1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v29;
    v20 = *(_QWORD *)v29;
    v21 = v1;
    do
    {
      v5 = 0;
      v22 = v3;
      do
      {
        if (*(_QWORD *)v29 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        objc_msgSend(*(id *)(v1 + 40), "accessory");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accessory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = HMFEqualObjects();

        if (v9)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(*(id *)(v1 + 40), "services");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            while (2)
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "instanceID");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "service");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "instanceID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = HMFEqualObjects();

                if (v18)
                {
                  objc_msgSend(v19, "addObject:", v6);
                  goto LABEL_17;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_17:

          v4 = v20;
          v1 = v21;
          v3 = v22;
        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(v1 + 40), "_handleCharacteristicChanges:", v19);
}

void __60__HMDHAPMediaProfile_handleHomeCharacteristicValuesChanged___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v30 = a1;
  obj = *(id *)(a1 + 40);
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v44;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(obj);
        v27 = v6;
        v29 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v6);
        objc_msgSend(v5, "numberFromString:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(*(id *)(v30 + 32), "services");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v40;
          v28 = *(_QWORD *)v40;
          do
          {
            v11 = 0;
            v31 = v9;
            do
            {
              if (*(_QWORD *)v40 != v10)
                objc_enumerationMutation(v32);
              objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v11), "instanceID");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = HMFEqualObjects();

              if (v13)
              {
                v33 = v11;
                objc_msgSend(*(id *)(v30 + 40), "hmf_dictionaryForKey:", v29);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = 0u;
                v36 = 0u;
                v37 = 0u;
                v38 = 0u;
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
                if (v15)
                {
                  v16 = v15;
                  v17 = *(_QWORD *)v36;
                  do
                  {
                    for (i = 0; i != v16; ++i)
                    {
                      if (*(_QWORD *)v36 != v17)
                        objc_enumerationMutation(v14);
                      v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
                      objc_msgSend(v5, "numberFromString:", v19);
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "findCharacteristic:forService:", v20, v7);
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v21)
                      {
                        objc_msgSend(v14, "hmf_dictionaryForKey:", v19);
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v22, "hmf_dataForKey:", CFSTR("kCharacteristicErrorDataKey"));
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v23)

                        else
                          objc_msgSend(v34, "addObject:", v21);

                      }
                    }
                    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
                  }
                  while (v16);
                }

                v10 = v28;
                v9 = v31;
                v11 = v33;
              }
              ++v11;
            }
            while (v11 != v9);
            v9 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          }
          while (v9);
        }

        v6 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v26);
  }

  if (objc_msgSend(v34, "count"))
    objc_msgSend(*(id *)(v30 + 32), "_handleCharacteristicChanges:", v34);

}

uint64_t __60__HMDHAPMediaProfile_updateMediaSessionState_usingServices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("00000228-0000-1000-8000-0026BB765291"));

  return v3;
}

void __45__HMDHAPMediaProfile__updateRefreshPlayback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void (**v48)(_QWORD, _QWORD, _QWORD);
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v56 = WeakRetained;
  if (objc_msgSend(v3, "count"))
  {
    v49 = a1;
    v50 = v3;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (!v6)
    {
      v8 = 0;
      v51 = 0;
      v53 = 0;
      v55 = 0;
      v58 = 0;
      goto LABEL_43;
    }
    v7 = v6;
    v8 = 0;
    v51 = 0;
    v53 = 0;
    v55 = 0;
    v58 = 0;
    v9 = *(_QWORD *)v60;
    v57 = *MEMORY[0x1E0CB8870];
    v54 = *MEMORY[0x1E0CB8B38];
    v52 = *MEMORY[0x1E0CB8960];
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v11, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(v11, "request");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "characteristic");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "type");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqual:", v57);

          if (v22)
          {
            objc_msgSend(v11, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v24 = v23;
            else
              v24 = 0;
            v25 = v24;

            v26 = (void *)MEMORY[0x1E0CB37E8];
            v27 = objc_msgSend(v25, "integerValue") - 1;
            if (v27 > 4)
              v28 = 1;
            else
              v28 = qword_1CDB8F968[v27];
            objc_msgSend(v26, "numberWithInteger:", v28);
            v33 = (void *)v58;
            v58 = objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
          }
          objc_msgSend(v20, "type");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqual:", v54);

          if (v30)
          {
            objc_msgSend(v11, "value");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v32 = v31;
            else
              v32 = 0;
            v25 = v32;

            __percentageForCharacteristicValue(v20, v25);
            v33 = v55;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
          }
          objc_msgSend(v20, "type");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isEqual:", v52);

          if (v35)
          {
            objc_msgSend(v11, "value");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v36 = v33;
            else
              v36 = 0;
            v25 = v53;
            v53 = v36;
            goto LABEL_34;
          }
          objc_msgSend(v20, "type");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("0000025B-0000-1000-8000-0026BB765291"));

          if (v38)
          {
            objc_msgSend(v11, "value");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v39 = v33;
            else
              v39 = 0;
            v25 = v51;
            v51 = v39;
LABEL_34:

          }
          continue;
        }
        objc_msgSend(v11, "error");
        v13 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = WeakRetained;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "error");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v65 = v17;
          v66 = 2112;
          v67 = v18;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Read failed with error %@", buf, 0x16u);

          WeakRetained = v56;
        }

        objc_autoreleasePoolPop(v14);
        v8 = (void *)v13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (!v7)
      {
LABEL_43:

        v46 = (void *)v58;
        objc_msgSend(WeakRetained, "_updateCurrentMediaState:volumePercentage:muted:enable:message:", v58, v55, v53, v51, *(_QWORD *)(v49 + 40));
        objc_msgSend(*(id *)(v49 + 40), "responseHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(*(id *)(v49 + 40), "responseHandler");
          v48 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v48)[2](v48, v8, 0);

        }
        v3 = v50;
        goto LABEL_46;
      }
    }
  }
  v40 = (void *)MEMORY[0x1D17BA0A0]();
  v41 = WeakRetained;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v65 = v43;
    v66 = 2112;
    v67 = v44;
    _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    WeakRetained = v56;
  }

  objc_autoreleasePoolPop(v40);
  v45 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "respondWithError:", v46);
LABEL_46:

}

void __38__HMDHAPMediaProfile__updatePlayback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v3, "count"))
  {
    v27 = a1;
    v28 = v3;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v32;
      do
      {
        v9 = 0;
        v29 = v6;
        do
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
          objc_msgSend(v10, "error", v27);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "error");
            v12 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)MEMORY[0x1D17BA0A0]();
            v14 = WeakRetained;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v16 = v8;
              v17 = WeakRetained;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "request");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "error");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v36 = v18;
              v37 = 2112;
              v38 = v19;
              v39 = 2112;
              v40 = v20;
              _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Write request %@ failed with error %@", buf, 0x20u);

              WeakRetained = v17;
              v8 = v16;
              v6 = v29;
            }

            objc_autoreleasePoolPop(v13);
            v7 = (void *)v12;
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(*(id *)(v27 + 40), "respondWithPayload:error:", 0, v7);
    v3 = v28;
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = WeakRetained;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v36 = v24;
      v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid response for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v26 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "respondWithError:", v7);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
