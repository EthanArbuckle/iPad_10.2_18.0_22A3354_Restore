@implementation _HMCameraUserSettings

- (_HMCameraUserSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _HMCameraUserSettings *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _HMCameraUserSettings *v12;
  _HMCameraUserSettings *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[2];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hmcus.id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[_HMCameraUserSettings initWithUUID:](self, "initWithUUID:", v5);
    -[_HMCameraUserSettings setSupportedFeatures:](v6, "setSupportedFeatures:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hmcus.sf")));
    -[_HMCameraUserSettings setAccessModeAtHome:](v6, "setAccessModeAtHome:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hmcus.ah")));
    -[_HMCameraUserSettings setAccessModeNotAtHome:](v6, "setAccessModeNotAtHome:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hmcus.nah")));
    -[_HMCameraUserSettings setCurrentAccessMode:](v6, "setCurrentAccessMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hmcus.cam")));
    -[_HMCameraUserSettings setRecordingEventTriggers:](v6, "setRecordingEventTriggers:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hmcus.rtc")));
    -[_HMCameraUserSettings setCameraManuallyDisabled:](v6, "setCameraManuallyDisabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hmcus.cmd")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hmcus.ns"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMCameraUserSettings setNotificationSettings:](v6, "setNotificationSettings:", v7);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9, v18[0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("hmcus.az"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMCameraUserSettings setActivityZones:](v6, "setActivityZones:", v11);

    -[_HMCameraUserSettings setActivityZonesIncludedForSignificantEventDetection:](v6, "setActivityZonesIncludedForSignificantEventDetection:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hmcus.azifsed")));
    v12 = v6;
    v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = 0;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (BOOL)isCameraManuallyDisabled
{
  return self->_cameraManuallyDisabled;
}

- (unint64_t)currentAccessMode
{
  return self->_currentAccessMode;
}

- (unint64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)setSupportedFeatures:(unint64_t)a3
{
  self->_supportedFeatures = a3;
}

- (void)setRecordingEventTriggers:(unint64_t)a3
{
  self->_recordingEventTriggers = a3;
}

- (void)setNotificationSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void)setCurrentAccessMode:(unint64_t)a3
{
  self->_currentAccessMode = a3;
}

- (void)setCameraManuallyDisabled:(BOOL)a3
{
  self->_cameraManuallyDisabled = a3;
}

- (void)setActivityZonesIncludedForSignificantEventDetection:(BOOL)a3
{
  self->_activityZonesIncludedForSignificantEventDetection = a3;
}

- (void)setActivityZones:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void)setAccessModeNotAtHome:(unint64_t)a3
{
  self->_accessModeNotAtHome = a3;
}

- (void)setAccessModeAtHome:(unint64_t)a3
{
  self->_accessModeAtHome = a3;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)recordingEventTriggers
{
  return self->_recordingEventTriggers;
}

- (BOOL)areActivityZonesIncludedForSignificantEventDetection
{
  return self->_activityZonesIncludedForSignificantEventDetection;
}

- (NSSet)activityZones
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)accessModeNotAtHome
{
  return self->_accessModeNotAtHome;
}

- (unint64_t)accessModeAtHome
{
  return self->_accessModeAtHome;
}

- (HMCameraUserNotificationSettings)notificationSettings
{
  return (HMCameraUserNotificationSettings *)objc_getProperty(self, a2, 64, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityZones, 0);
  objc_storeStrong((id *)&self->_notificationSettings, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (_HMCameraUserSettings)initWithUUID:(id)a3
{
  id v5;
  _HMCameraUserSettings *v6;
  _HMCameraUserSettings *v7;
  HMCameraUserNotificationSettings *v8;
  HMCameraUserNotificationSettings *notificationSettings;
  uint64_t v10;
  NSSet *activityZones;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HMCameraUserSettings;
  v6 = -[_HMCameraUserSettings init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    v7->_accessModeAtHome = 0;
    v7->_accessModeNotAtHome = 0;
    v7->_currentAccessMode = 0;
    v8 = objc_alloc_init(HMCameraUserNotificationSettings);
    notificationSettings = v7->_notificationSettings;
    v7->_notificationSettings = v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    activityZones = v7->_activityZones;
    v7->_activityZones = (NSSet *)v10;

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[_HMCameraUserSettings supportedFeatures](self, "supportedFeatures"),
        v7 == objc_msgSend(v6, "supportedFeatures"))
    && (v8 = -[_HMCameraUserSettings accessModeAtHome](self, "accessModeAtHome"),
        v8 == objc_msgSend(v6, "accessModeAtHome"))
    && (v9 = -[_HMCameraUserSettings accessModeNotAtHome](self, "accessModeNotAtHome"),
        v9 == objc_msgSend(v6, "accessModeNotAtHome"))
    && (v10 = -[_HMCameraUserSettings currentAccessMode](self, "currentAccessMode"),
        v10 == objc_msgSend(v6, "currentAccessMode"))
    && (v11 = -[_HMCameraUserSettings recordingEventTriggers](self, "recordingEventTriggers"),
        v11 == objc_msgSend(v6, "recordingEventTriggers"))
    && (v12 = -[_HMCameraUserSettings isCameraManuallyDisabled](self, "isCameraManuallyDisabled"),
        v12 == objc_msgSend(v6, "isCameraManuallyDisabled")))
  {
    -[_HMCameraUserSettings notificationSettings](self, "notificationSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqual:", v16))
    {
      -[_HMCameraUserSettings activityZones](self, "activityZones");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activityZones");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToSet:", v18))
      {
        v19 = -[_HMCameraUserSettings areActivityZonesIncludedForSignificantEventDetection](self, "areActivityZonesIncludedForSignificantEventDetection");
        v13 = v19 ^ objc_msgSend(v6, "areActivityZonesIncludedForSignificantEventDetection") ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HMCameraUserSettings UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _HMMutableCameraUserSettings *v4;
  void *v5;
  _HMMutableCameraUserSettings *v6;
  void *v7;
  void *v8;

  v4 = [_HMMutableCameraUserSettings alloc];
  -[_HMCameraUserSettings UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_HMCameraUserSettings initWithUUID:](v4, "initWithUUID:", v5);

  -[_HMCameraUserSettings setSupportedFeatures:](v6, "setSupportedFeatures:", -[_HMCameraUserSettings supportedFeatures](self, "supportedFeatures"));
  -[_HMCameraUserSettings setAccessModeAtHome:](v6, "setAccessModeAtHome:", -[_HMCameraUserSettings accessModeAtHome](self, "accessModeAtHome"));
  -[_HMCameraUserSettings setAccessModeNotAtHome:](v6, "setAccessModeNotAtHome:", -[_HMCameraUserSettings accessModeNotAtHome](self, "accessModeNotAtHome"));
  -[_HMCameraUserSettings setCurrentAccessMode:](v6, "setCurrentAccessMode:", -[_HMCameraUserSettings currentAccessMode](self, "currentAccessMode"));
  -[_HMCameraUserSettings setRecordingEventTriggers:](v6, "setRecordingEventTriggers:", -[_HMCameraUserSettings recordingEventTriggers](self, "recordingEventTriggers"));
  -[_HMCameraUserSettings setCameraManuallyDisabled:](v6, "setCameraManuallyDisabled:", -[_HMCameraUserSettings isCameraManuallyDisabled](self, "isCameraManuallyDisabled"));
  -[_HMCameraUserSettings notificationSettings](self, "notificationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMCameraUserSettings setNotificationSettings:](v6, "setNotificationSettings:", v7);

  -[_HMCameraUserSettings activityZones](self, "activityZones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMCameraUserSettings setActivityZones:](v6, "setActivityZones:", v8);

  -[_HMCameraUserSettings setActivityZonesIncludedForSignificantEventDetection:](v6, "setActivityZonesIncludedForSignificantEventDetection:", -[_HMCameraUserSettings areActivityZonesIncludedForSignificantEventDetection](self, "areActivityZonesIncludedForSignificantEventDetection"));
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_HMCameraUserSettings UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("hmcus.id"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings supportedFeatures](self, "supportedFeatures"), CFSTR("hmcus.sf"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings accessModeAtHome](self, "accessModeAtHome"), CFSTR("hmcus.ah"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings accessModeNotAtHome](self, "accessModeNotAtHome"), CFSTR("hmcus.nah"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings currentAccessMode](self, "currentAccessMode"), CFSTR("hmcus.cam"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[_HMCameraUserSettings recordingEventTriggers](self, "recordingEventTriggers"), CFSTR("hmcus.rtc"));
  objc_msgSend(v7, "encodeBool:forKey:", -[_HMCameraUserSettings isCameraManuallyDisabled](self, "isCameraManuallyDisabled"), CFSTR("hmcus.cmd"));
  -[_HMCameraUserSettings notificationSettings](self, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("hmcus.ns"));

  -[_HMCameraUserSettings activityZones](self, "activityZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("hmcus.az"));

  objc_msgSend(v7, "encodeBool:forKey:", -[_HMCameraUserSettings areActivityZonesIncludedForSignificantEventDetection](self, "areActivityZonesIncludedForSignificantEventDetection"), CFSTR("hmcus.azifsed"));
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
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v35;
  unint64_t v36;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  v35 = -[_HMCameraUserSettings supportedFeatures](self, "supportedFeatures");
  NSPrintF();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Features"), v5, v35, &unk_19B44CE92);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[_HMCameraUserSettings isCameraManuallyDisabled](self, "isCameraManuallyDisabled");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Manually Disabled"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[_HMCameraUserSettings notificationSettings](self, "notificationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Notification Settings"), v11);
  objc_msgSend(v3, "addObject:", v12);

  if ((-[_HMCameraUserSettings supportedFeatures](self, "supportedFeatures") & 2) != 0)
  {
    v13 = objc_alloc(MEMORY[0x1E0D28548]);
    v14 = (void *)MEMORY[0x1E0CB3940];
    HMCameraAccessModeAsString(-[_HMCameraUserSettings currentAccessMode](self, "currentAccessMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMCameraAccessModeAsString(-[_HMCameraUserSettings accessModeAtHome](self, "accessModeAtHome"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMCameraAccessModeAsString(-[_HMCameraUserSettings accessModeNotAtHome](self, "accessModeNotAtHome"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("<Current: %@> <Home: %@> <Away: %@>"), v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Access Modes"), v18);
    objc_msgSend(v3, "addObject:", v19);

    v20 = objc_alloc(MEMORY[0x1E0D28548]);
    v36 = -[_HMCameraUserSettings recordingEventTriggers](self, "recordingEventTriggers");
    NSPrintF();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("Recording Triggers"), v21, v36, &unk_19B44CE60);
    objc_msgSend(v3, "addObject:", v22);

    -[_HMCameraUserSettings activityZones](self, "activityZones");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = objc_alloc(MEMORY[0x1E0D28548]);
      -[_HMCameraUserSettings activityZones](self, "activityZones");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "allObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR(","));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v25, "initWithName:value:", CFSTR("Activity Zones"), v28);
      objc_msgSend(v3, "addObject:", v29);

      v30 = objc_alloc(MEMORY[0x1E0D28548]);
      -[_HMCameraUserSettings areActivityZonesIncludedForSignificantEventDetection](self, "areActivityZonesIncludedForSignificantEventDetection");
      HMFBooleanToString();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithName:value:", CFSTR("Activity Zones Included"), v31);
      objc_msgSend(v3, "addObject:", v32);

    }
  }
  v33 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v33;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
