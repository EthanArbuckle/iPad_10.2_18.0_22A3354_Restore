@implementation HUCameraRecordAudioSettingsItem

- (HUCameraRecordAudioSettingsItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraRecordAudioSettingsItem.m"), 23, CFSTR("Use -initWithSourceServiceItem:"));

  return 0;
}

- (HUCameraRecordAudioSettingsItem)initWithCameraProfile:(id)a3
{
  id v4;
  HUCameraRecordAudioSettingsItem *v5;
  HUCameraRecordAudioSettingsItem *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUCameraRecordAudioSettingsItem;
  v5 = -[HUCameraRecordAudioSettingsItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HUCameraRecordAudioSettingsItem setCameraProfile:](v5, "setCameraProfile:", v4);
    objc_msgSend(v4, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordAudioSettingsItem setHome:](v6, "setHome:", v8);

  }
  return v6;
}

- (HUServiceDetailsCameraSettingsReaderWriter)settingsReaderWriter
{
  HUServiceDetailsCameraSettingsReaderWriter *settingsReaderWriter;
  HUServiceDetailsCameraSettingsReaderWriter *v4;
  HUServiceDetailsCameraSettingsReaderWriter *v5;

  settingsReaderWriter = self->_settingsReaderWriter;
  if (!settingsReaderWriter)
  {
    v4 = -[HUServiceDetailsCameraSettingsReaderWriter initWithConfigurator:]([HUServiceDetailsCameraSettingsReaderWriter alloc], "initWithConfigurator:", self);
    v5 = self->_settingsReaderWriter;
    self->_settingsReaderWriter = v4;

    settingsReaderWriter = self->_settingsReaderWriter;
  }
  return settingsReaderWriter;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HUCameraRecordAudioSettingsItem _canReadWriteCameraRecordingSettings](self, "_canReadWriteCameraRecordingSettings"))
  {
    -[HUCameraRecordAudioSettingsItem settingsReaderWriter](self, "settingsReaderWriter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "readWithOptions:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v8 = (void *)MEMORY[0x1E0D314B8];
    v12 = *MEMORY[0x1E0D30D70];
    v13[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outcomeWithResults:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithResult:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)updateRecordAudioSettingWithValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[HUCameraRecordAudioSettingsItem _canReadWriteCameraRecordingSettings](self, "_canReadWriteCameraRecordingSettings"))
  {
    -[HUCameraRecordAudioSettingsItem settingsReaderWriter](self, "settingsReaderWriter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateUserSettingsWithValue:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)_canReadWriteCameraRecordingSettings
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HUCameraRecordAudioSettingsItem cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ((unint64_t)objc_msgSend(v3, "supportedFeatures") >> 1) & 1;

  return v4;
}

- (id)transactionReason
{
  return CFSTR("HUCameraRecordAudio-Toggle");
}

- (id)cameraSettings
{
  void *v2;
  void *v3;

  -[HUCameraRecordAudioSettingsItem cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)characteristicForSettings:(id)a3
{
  return (id)objc_msgSend(a3, "recordingAudioEnabledCharacteristic");
}

- (id)itemTitleLocalizationKey
{
  return CFSTR("HUCameraRecordAudioTitle");
}

- (id)itemTitle
{
  void *v2;
  void *v3;

  -[HUCameraRecordAudioSettingsItem itemTitleLocalizationKey](self, "itemTitleLocalizationKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v2, v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)characteristicValueManager
{
  void *v2;
  void *v3;

  -[HUCameraRecordAudioSettingsItem home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_characteristicValueManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void)setSettingsReaderWriter:(id)a3
{
  objc_storeStrong((id *)&self->_settingsReaderWriter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsReaderWriter, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end
