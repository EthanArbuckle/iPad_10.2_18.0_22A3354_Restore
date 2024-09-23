@implementation HMCameraProfile

- (HMCameraUserSettings)userSettings
{
  void *v2;
  void *v3;

  -[HMCameraProfile cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCameraUserSettings *)v3;
}

- (HMCameraSnapshotControl)snapshotControl
{
  return self->_snapshotControl;
}

- (HMCameraStreamControl)streamControl
{
  return self->_streamControl;
}

- (HMCameraProfile)initWithCameraProfile:(id)a3
{
  id v4;
  HMCameraProfile *v5;
  HMCameraStreamControl *v6;
  void *v7;
  uint64_t v8;
  HMCameraStreamControl *streamControl;
  HMCameraSnapshotControl *v10;
  void *v11;
  uint64_t v12;
  HMCameraSnapshotControl *snapshotControl;
  void *v14;
  HMCameraSettingsControl *v15;
  void *v16;
  uint64_t v17;
  HMCameraSettingsControl *settingsControl;
  void *v19;
  HMCameraAudioControl *v20;
  void *v21;
  uint64_t v22;
  HMCameraAudioControl *microphoneControl;
  void *v24;
  HMCameraAudioControl *v25;
  void *v26;
  uint64_t v27;
  HMCameraAudioControl *speakerControl;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMCameraProfile;
  v5 = -[HMAccessoryProfile initWithAccessoryProfile:](&v30, sel_initWithAccessoryProfile_, v4);
  if (v5)
  {
    v6 = [HMCameraStreamControl alloc];
    objc_msgSend(v4, "streamControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMCameraStreamControl initWithStreamControl:](v6, "initWithStreamControl:", v7);
    streamControl = v5->_streamControl;
    v5->_streamControl = (HMCameraStreamControl *)v8;

    v10 = [HMCameraSnapshotControl alloc];
    objc_msgSend(v4, "snapshotControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMCameraSnapshotControl initWithSnapshotControl:](v10, "initWithSnapshotControl:", v11);
    snapshotControl = v5->_snapshotControl;
    v5->_snapshotControl = (HMCameraSnapshotControl *)v12;

    objc_msgSend(v4, "settingsControl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [HMCameraSettingsControl alloc];
      objc_msgSend(v4, "settingsControl");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMCameraSettingsControl initWithSettingsControl:](v15, "initWithSettingsControl:", v16);
      settingsControl = v5->_settingsControl;
      v5->_settingsControl = (HMCameraSettingsControl *)v17;

    }
    objc_msgSend(v4, "microphoneControl");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = [HMCameraAudioControl alloc];
      objc_msgSend(v4, "microphoneControl");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMCameraAudioControl initWithAudioControl:](v20, "initWithAudioControl:", v21);
      microphoneControl = v5->_microphoneControl;
      v5->_microphoneControl = (HMCameraAudioControl *)v22;

    }
    objc_msgSend(v4, "speakerControl");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [HMCameraAudioControl alloc];
      objc_msgSend(v4, "speakerControl");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[HMCameraAudioControl initWithAudioControl:](v25, "initWithAudioControl:", v26);
      speakerControl = v5->_speakerControl;
      v5->_speakerControl = (HMCameraAudioControl *)v27;

    }
  }

  return v5;
}

- (HMCameraClipManager)clipManager
{
  void *v2;
  void *v3;

  -[HMCameraProfile cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clipManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCameraClipManager *)v3;
}

- (HMCameraRecordingReachabilityEventManager)reachabilityEventManager
{
  void *v2;
  void *v3;

  -[HMCameraProfile cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reachabilityEventManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCameraRecordingReachabilityEventManager *)v3;
}

- (HMCameraRecordingEventManager)recordingEventManager
{
  void *v2;
  void *v3;

  -[HMCameraProfile cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordingEventManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCameraRecordingEventManager *)v3;
}

- (id)services
{
  void *v2;
  void *v3;

  -[HMCameraProfile cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMCameraProfile *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  HMCameraProfile *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMCameraProfile snapshotControl](self, "snapshotControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshotControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "snapshotControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mergeNewSnapshotControl:", v10);

    objc_msgSend(v6, "userSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraProfile userSettings](self, "userSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HMCameraProfile userSettings](self, "userSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_mergeNewSettings:", v11);

    }
    else
    {
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@No existing camera settings to merge; adding new settings: %@",
          buf,
          0x16u);

      }
      objc_autoreleasePoolPop(v14);
      -[HMCameraProfile cameraProfile](v15, "cameraProfile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addUserSettings:", v11);

      -[HMCameraProfile userSettingsDelegate](v15, "userSettingsDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMCameraProfile cameraProfile](v15, "cameraProfile");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "delegateCaller");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __38__HMCameraProfile_mergeFromNewObject___block_invoke;
        v24[3] = &unk_1E3AB5ED8;
        v25 = v19;
        v26 = v15;
        objc_msgSend(v22, "invokeBlock:", v24);

      }
    }

  }
  return 0;
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
    -[HMAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessoryProfile accessory](self, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)setStreamControl:(id)a3
{
  objc_storeStrong((id *)&self->_streamControl, a3);
}

- (void)setSnapshotControl:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotControl, a3);
}

- (HMCameraSettingsControl)settingsControl
{
  return self->_settingsControl;
}

- (void)setSettingsControl:(id)a3
{
  objc_storeStrong((id *)&self->_settingsControl, a3);
}

- (HMCameraAudioControl)speakerControl
{
  return self->_speakerControl;
}

- (void)setSpeakerControl:(id)a3
{
  objc_storeStrong((id *)&self->_speakerControl, a3);
}

- (HMCameraAudioControl)microphoneControl
{
  return self->_microphoneControl;
}

- (void)setMicrophoneControl:(id)a3
{
  objc_storeStrong((id *)&self->_microphoneControl, a3);
}

- (HMCameraProfileUserSettingsDelegate)userSettingsDelegate
{
  return (HMCameraProfileUserSettingsDelegate *)objc_loadWeakRetained((id *)&self->_userSettingsDelegate);
}

- (void)setUserSettingsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_userSettingsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userSettingsDelegate);
  objc_storeStrong((id *)&self->_microphoneControl, 0);
  objc_storeStrong((id *)&self->_speakerControl, 0);
  objc_storeStrong((id *)&self->_settingsControl, 0);
  objc_storeStrong((id *)&self->_snapshotControl, 0);
  objc_storeStrong((id *)&self->_streamControl, 0);
}

void __38__HMCameraProfile_mergeFromNewObject___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "userSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cameraProfile:didAddUserSettings:", v2, v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_25587 != -1)
    dispatch_once(&logCategory__hmf_once_t2_25587, &__block_literal_global_25588);
  return (id)logCategory__hmf_once_v3_25589;
}

void __30__HMCameraProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_25589;
  logCategory__hmf_once_v3_25589 = v0;

}

@end
