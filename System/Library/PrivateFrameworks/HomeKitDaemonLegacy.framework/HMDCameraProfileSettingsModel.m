@implementation HMDCameraProfileSettingsModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_71528 != -1)
    dispatch_once(&hmbProperties_onceToken_71528, &__block_literal_global_71529);
  return (id)hmbProperties__properties_71530;
}

- (unint64_t)recordingEventTriggers
{
  void *v2;
  unint64_t v3;

  -[HMDCameraProfileSettingsModel recordingEventTriggersField](self, "recordingEventTriggersField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)currentAccessMode
{
  return self->_currentAccessMode;
}

- (BOOL)cameraManuallyDisabled
{
  return self->_cameraManuallyDisabled;
}

- (NSSet)activityZones
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v13;
  HMDCameraProfileSettingsModel *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  -[HMDCameraProfileSettingsModel activityZonesField](self, "activityZonesField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraProfileSettingsModel activityZonesField](self, "activityZonesField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v8, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;

    if (v9)
    {
      v11 = v9;
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
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode activity zones: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v11;

    return (NSSet *)v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)activityZonesIncludedForSignificantEventDetection
{
  void *v2;
  char v3;

  -[HMDCameraProfileSettingsModel activityZonesIncludedForSignificantEventDetectionField](self, "activityZonesIncludedForSignificantEventDetectionField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)accessModeNotAtHome
{
  void *v2;
  unint64_t v3;

  -[HMDCameraProfileSettingsModel accessModeNotAtHomeField](self, "accessModeNotAtHomeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)accessModeAtHome
{
  void *v2;
  unint64_t v3;

  -[HMDCameraProfileSettingsModel accessModeAtHomeField](self, "accessModeAtHomeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setVersion:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setVersionField:](self, "setVersionField:", v4);

}

- (void)setRecordingEventTriggers:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setRecordingEventTriggersField:](self, "setRecordingEventTriggersField:", v4);

}

- (void)setAccessModeNotAtHome:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setAccessModeNotAtHomeField:](self, "setAccessModeNotAtHomeField:", v4);

}

- (void)setAccessModeAtHome:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setAccessModeAtHomeField:](self, "setAccessModeAtHomeField:", v4);

}

- (void)setCurrentAccessMode:(unint64_t)a3
{
  self->_currentAccessMode = a3;
}

- (void)setCameraManuallyDisabled:(BOOL)a3
{
  self->_cameraManuallyDisabled = a3;
}

void __46__HMDCameraProfileSettingsModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
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
  _QWORD v32[15];
  _QWORD v33[17];

  v33[15] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("versionField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v28;
  v32[1] = CFSTR("accessModeAtHomeField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v27;
  v32[2] = CFSTR("accessModeNotAtHomeField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v26;
  v32[3] = CFSTR("recordingStorageDurationField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v25;
  v32[4] = CFSTR("recordingEventTriggersField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v24;
  v32[5] = CFSTR("accessModeIndicatorEnabledField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v23;
  v32[6] = CFSTR("nightVisionModeEnabledField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v22;
  v32[7] = CFSTR("snapshotsAllowedField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v21;
  v32[8] = CFSTR("periodicSnapshotsAllowedField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v20;
  v32[9] = CFSTR("recordingAudioEnabledField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v19;
  v32[10] = CFSTR("smartBulletinBoardNotificationDataField");
  v0 = (void *)MEMORY[0x1E0D32C80];
  v1 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "excludeFromCloudStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fieldWithClass:options:", v1, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v16;
  v32[11] = CFSTR("accessModeChangeNotificationEnabledField");
  v2 = (void *)MEMORY[0x1E0D32C80];
  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "excludeFromCloudStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fieldWithClass:options:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v6;
  v32[12] = CFSTR("reachabilityEventNotificationEnabledField");
  v7 = (void *)MEMORY[0x1E0D32C80];
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D32C88], "excludeFromCloudStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fieldWithClass:options:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[12] = v11;
  v32[13] = CFSTR("activityZonesField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[13] = v12;
  v32[14] = CFSTR("activityZonesIncludedForSignificantEventDetectionField");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[14] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 15);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)hmbProperties__properties_71530;
  hmbProperties__properties_71530 = v14;

}

- (BOOL)hasAnyNotificationFieldsSet
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[HMDCameraProfileSettingsModel reachabilityEventNotificationEnabledField](self, "reachabilityEventNotificationEnabledField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[HMDCameraProfileSettingsModel accessModeChangeNotificationEnabledField](self, "accessModeChangeNotificationEnabledField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[HMDCameraProfileSettingsModel smartBulletinBoardNotificationDataField](self, "smartBulletinBoardNotificationDataField");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (unint64_t)mostPrivateAccessMode
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCameraProfileSettingsModel accessModeAtHome](self, "accessModeAtHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E8B31F20, "indexOfObject:", v3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCameraProfileSettingsModel accessModeNotAtHome](self, "accessModeNotAtHome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(&unk_1E8B31F20, "indexOfObject:", v5);

  if (v4 >= v6)
    v7 = v6;
  else
    v7 = v4;
  objc_msgSend(&unk_1E8B31F20, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return v9;
}

- (int64_t)version
{
  void *v2;
  int64_t v3;

  -[HMDCameraProfileSettingsModel versionField](self, "versionField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)accessModeIndicatorEnabled
{
  void *v2;
  char v3;

  -[HMDCameraProfileSettingsModel accessModeIndicatorEnabledField](self, "accessModeIndicatorEnabledField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAccessModeIndicatorEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setAccessModeIndicatorEnabledField:](self, "setAccessModeIndicatorEnabledField:", v4);

}

- (BOOL)nightVisionModeEnabled
{
  void *v2;
  char v3;

  -[HMDCameraProfileSettingsModel nightVisionModeEnabledField](self, "nightVisionModeEnabledField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setNightVisionModeEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setNightVisionModeEnabledField:](self, "setNightVisionModeEnabledField:", v4);

}

- (BOOL)snapshotsAllowed
{
  void *v2;
  char v3;

  -[HMDCameraProfileSettingsModel snapshotsAllowedField](self, "snapshotsAllowedField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSnapshotsAllowed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setSnapshotsAllowedField:](self, "setSnapshotsAllowedField:", v4);

}

- (BOOL)periodicSnapshotsAllowed
{
  void *v2;
  char v3;

  -[HMDCameraProfileSettingsModel periodicSnapshotsAllowedField](self, "periodicSnapshotsAllowedField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setPeriodicSnapshotsAllowed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setPeriodicSnapshotsAllowedField:](self, "setPeriodicSnapshotsAllowedField:", v4);

}

- (BOOL)recordingAudioEnabled
{
  void *v2;
  char v3;

  -[HMDCameraProfileSettingsModel recordingAudioEnabledField](self, "recordingAudioEnabledField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setRecordingAudioEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setRecordingAudioEnabledField:](self, "setRecordingAudioEnabledField:", v4);

}

- (BOOL)accessModeChangeNotificationEnabled
{
  void *v2;
  char v3;

  -[HMDCameraProfileSettingsModel accessModeChangeNotificationEnabledField](self, "accessModeChangeNotificationEnabledField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)reachabilityEventNotificationEnabled
{
  void *v2;
  char v3;

  -[HMDCameraProfileSettingsModel reachabilityEventNotificationEnabledField](self, "reachabilityEventNotificationEnabledField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (HMDBulletinBoardNotification)smartBulletinBoardNotification
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDCameraProfileSettingsModel *v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDCameraProfileSettingsModel smartBulletinBoardNotificationDataField](self, "smartBulletinBoardNotificationDataField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    -[HMDCameraProfileSettingsModel smartBulletinBoardNotificationDataField](self, "smartBulletinBoardNotificationDataField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v6, &v14);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;

    if (v3)
    {
      v8 = v3;
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v12;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode HMDBulletinBoardNotification: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
  return (HMDBulletinBoardNotification *)v3;
}

- (void)setActivityZones:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDCameraProfileSettingsModel *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    -[HMDCameraProfileSettingsModel setActivityZonesField:](self, "setActivityZonesField:", v5);
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
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to encode activity zones: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)setActivityZonesIncludedForSignificantEventDetection:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsModel setActivityZonesIncludedForSignificantEventDetectionField:](self, "setActivityZonesIncludedForSignificantEventDetectionField:", v4);

}

@end
