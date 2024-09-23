@implementation _HMCameraProfile

- (void)_createControlsWithMostRecentSnapshot:(id)a3
{
  id v4;
  _HMCameraStreamControl *v5;
  void *v6;
  _HMCameraStreamControl *v7;
  _HMCameraStreamControl *streamControl;
  _HMCameraSnapshotControl *v9;
  void *v10;
  _HMCameraSnapshotControl *v11;
  _HMCameraSnapshotControl *snapshotControl;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  _HMCameraSettingsControl *v20;
  void *v21;
  _HMCameraSettingsControl *v22;
  _HMCameraSettingsControl *settingsControl;
  void *v24;
  int v25;
  _HMCameraAudioControl *v26;
  void *v27;
  _HMCameraAudioControl *v28;
  _HMCameraAudioControl *microphoneControl;
  void *v30;
  int v31;
  _HMCameraAudioControl *v32;
  void *v33;
  _HMCameraAudioControl *v34;
  _HMCameraAudioControl *speakerControl;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [_HMCameraStreamControl alloc];
  -[_HMAccessoryProfile profileUniqueIdentifier](self, "profileUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_HMCameraStreamControl initWithCameraProfile:profileUniqueIdentifier:](v5, "initWithCameraProfile:profileUniqueIdentifier:", self, v6);
  streamControl = self->_streamControl;
  self->_streamControl = v7;

  v9 = [_HMCameraSnapshotControl alloc];
  -[_HMAccessoryProfile profileUniqueIdentifier](self, "profileUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v4;
  v11 = -[_HMCameraSnapshotControl initWithCameraProfile:profileUniqueIdentifier:mostRecentSnapshot:](v9, "initWithCameraProfile:profileUniqueIdentifier:mostRecentSnapshot:", self, v10, v4);
  snapshotControl = self->_snapshotControl;
  self->_snapshotControl = v11;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[_HMAccessoryProfile services](self, "services");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v17, "serviceType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("00000111-0000-1000-8000-0026BB765291"));

        if (v19)
        {
          v20 = [_HMCameraSettingsControl alloc];
          -[_HMAccessoryProfile profileUniqueIdentifier](self, "profileUniqueIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[_HMCameraSettingsControl initWithCameraProfile:profileUniqueIdentifier:service:](v20, "initWithCameraProfile:profileUniqueIdentifier:service:", self, v21, v17);
          settingsControl = self->_settingsControl;
          self->_settingsControl = v22;

        }
        objc_msgSend(v17, "serviceType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("00000112-0000-1000-8000-0026BB765291"));

        if (v25)
        {
          v26 = [_HMCameraAudioControl alloc];
          -[_HMAccessoryProfile profileUniqueIdentifier](self, "profileUniqueIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[_HMCameraAudioControl initWithCameraProfile:profileUniqueIdentifier:service:](v26, "initWithCameraProfile:profileUniqueIdentifier:service:", self, v27, v17);
          microphoneControl = self->_microphoneControl;
          self->_microphoneControl = v28;

        }
        objc_msgSend(v17, "serviceType");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("00000113-0000-1000-8000-0026BB765291"));

        if (v31)
        {
          v32 = [_HMCameraAudioControl alloc];
          -[_HMAccessoryProfile profileUniqueIdentifier](self, "profileUniqueIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[_HMCameraAudioControl initWithCameraProfile:profileUniqueIdentifier:service:](v32, "initWithCameraProfile:profileUniqueIdentifier:service:", self, v33, v17);
          speakerControl = self->_speakerControl;
          self->_speakerControl = v34;

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v14);
  }

}

- (HMCameraUserSettings)userSettings
{
  return (HMCameraUserSettings *)objc_getProperty(self, a2, 112, 1);
}

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  HMCameraClipManager *v14;
  void *v15;
  HMCameraClipManager *v16;
  void *v17;
  HMCameraRecordingReachabilityEventManager *v18;
  void *v19;
  HMCameraRecordingReachabilityEventManager *v20;
  void *v21;
  HMCameraRecordingEventManager *v22;
  void *v23;
  void *v24;
  HMCameraRecordingEventManager *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)_HMCameraProfile;
  -[_HMAccessoryProfile __configureWithContext:accessory:](&v30, sel___configureWithContext_accessory_, v6, v7);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[_HMCameraProfile controls](self, "controls", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12++), "__configureWithContext:", v6);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  -[_HMCameraProfile userSettings](self, "userSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configureWithAccessory:context:", v7, v6);

  v14 = [HMCameraClipManager alloc];
  -[_HMAccessoryProfile profileUniqueIdentifier](self, "profileUniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMCameraClipManager initWithContext:profileUniqueIdentifier:](v14, "initWithContext:profileUniqueIdentifier:", v6, v15);
  -[_HMCameraProfile setClipManager:](self, "setClipManager:", v16);

  -[_HMCameraProfile clipManager](self, "clipManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configure");

  v18 = [HMCameraRecordingReachabilityEventManager alloc];
  objc_msgSend(v7, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HMCameraRecordingReachabilityEventManager initWithContext:uniqueIdentifier:](v18, "initWithContext:uniqueIdentifier:", v6, v19);
  -[_HMCameraProfile setReachabilityEventManager:](self, "setReachabilityEventManager:", v20);

  -[_HMCameraProfile reachabilityEventManager](self, "reachabilityEventManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "configure");

  v22 = [HMCameraRecordingEventManager alloc];
  -[_HMCameraProfile clipManager](self, "clipManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMCameraProfile reachabilityEventManager](self, "reachabilityEventManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HMCameraRecordingEventManager initWithContext:clipManager:reachabilityEventManager:](v22, "initWithContext:clipManager:reachabilityEventManager:", v6, v23, v24);
  -[_HMCameraProfile setRecordingEventManager:](self, "setRecordingEventManager:", v25);

}

- (HMCameraRecordingReachabilityEventManager)reachabilityEventManager
{
  return (HMCameraRecordingReachabilityEventManager *)objc_getProperty(self, a2, 128, 1);
}

- (HMCameraClipManager)clipManager
{
  return (HMCameraClipManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRecordingEventManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setReachabilityEventManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setClipManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSArray)controls
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMCameraProfile streamControl](self, "streamControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[_HMCameraProfile snapshotControl](self, "snapshotControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[_HMCameraProfile settingsControl](self, "settingsControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_HMCameraProfile settingsControl](self, "settingsControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[_HMCameraProfile microphoneControl](self, "microphoneControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_HMCameraProfile microphoneControl](self, "microphoneControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[_HMCameraProfile speakerControl](self, "speakerControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_HMCameraProfile speakerControl](self, "speakerControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v12;
}

- (_HMCameraAudioControl)speakerControl
{
  return (_HMCameraAudioControl *)objc_getProperty(self, a2, 96, 1);
}

- (_HMCameraAudioControl)microphoneControl
{
  return (_HMCameraAudioControl *)objc_getProperty(self, a2, 104, 1);
}

- (_HMCameraStreamControl)streamControl
{
  return (_HMCameraStreamControl *)objc_getProperty(self, a2, 72, 1);
}

- (_HMCameraSnapshotControl)snapshotControl
{
  return (_HMCameraSnapshotControl *)objc_getProperty(self, a2, 80, 1);
}

- (_HMCameraSettingsControl)settingsControl
{
  return (_HMCameraSettingsControl *)objc_getProperty(self, a2, 88, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HMCameraProfile)initWithCoder:(id)a3
{
  id v4;
  _HMCameraProfile *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMCameraUserSettings *v11;
  HMCameraUserSettings *userSettings;
  objc_super v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HMCameraProfile;
  v5 = -[_HMAccessoryProfile initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HMCP.ck.mostRecentSnapshot"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_HMCameraProfile _createControlsWithMostRecentSnapshot:](v5, "_createControlsWithMostRecentSnapshot:", v9);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCP.ck.userSettings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[HMCameraUserSettings initWithCameraUserSettings:]([HMCameraUserSettings alloc], "initWithCameraUserSettings:", v10);
      userSettings = v5->_userSettings;
      v5->_userSettings = v11;

    }
  }

  return v5;
}

- (_HMCameraProfile)initWithUUID:(id)a3 services:(id)a4
{
  _HMCameraProfile *v4;
  _HMCameraProfile *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HMCameraProfile;
  v4 = -[_HMAccessoryProfile initWithUUID:services:](&v7, sel_initWithUUID_services_, a3, a4);
  v5 = v4;
  if (v4)
    -[_HMCameraProfile _createControlsWithMostRecentSnapshot:](v4, "_createControlsWithMostRecentSnapshot:", 0);
  return v5;
}

- (void)addUserSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_HMCameraProfile setUserSettings:](self, "setUserSettings:", v4);
  -[_HMAccessoryProfile accessory](self, "accessory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_HMAccessoryProfile context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureWithAccessory:context:", v6, v5);

}

- (void)setUserSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (HMCameraRecordingEventManager)recordingEventManager
{
  return (HMCameraRecordingEventManager *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingEventManager, 0);
  objc_storeStrong((id *)&self->_reachabilityEventManager, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
  objc_storeStrong((id *)&self->_userSettings, 0);
  objc_storeStrong((id *)&self->_microphoneControl, 0);
  objc_storeStrong((id *)&self->_speakerControl, 0);
  objc_storeStrong((id *)&self->_settingsControl, 0);
  objc_storeStrong((id *)&self->_snapshotControl, 0);
  objc_storeStrong((id *)&self->_streamControl, 0);
}

@end
