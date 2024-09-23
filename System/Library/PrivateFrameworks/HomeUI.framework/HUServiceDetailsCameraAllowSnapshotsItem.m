@implementation HUServiceDetailsCameraAllowSnapshotsItem

- (HUServiceDetailsCameraAllowSnapshotsItem)initWithSourceServiceItem:(id)a3 home:(id)a4 shouldBeHidden:(BOOL)a5
{
  HUServiceDetailsCameraAllowSnapshotsItem *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUServiceDetailsCameraAllowSnapshotsItem;
  result = -[HUServiceDetailsAbstractItem initWithSourceServiceItem:home:](&v7, sel_initWithSourceServiceItem_home_, a3, a4);
  if (result)
    result->_shouldBeHidden = a5;
  return result;
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
  if (-[HUServiceDetailsCameraAllowSnapshotsItem _canReadWriteHMCameraSnapshotsControl](self, "_canReadWriteHMCameraSnapshotsControl"))
  {
    -[HUServiceDetailsCameraAllowSnapshotsItem settingsReaderWriter](self, "settingsReaderWriter");
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

- (id)updateUserSettingsWithValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[HUServiceDetailsCameraAllowSnapshotsItem _canReadWriteHMCameraSnapshotsControl](self, "_canReadWriteHMCameraSnapshotsControl"))
  {
    -[HUServiceDetailsCameraAllowSnapshotsItem settingsReaderWriter](self, "settingsReaderWriter");
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

- (BOOL)_canReadWriteHMCameraSnapshotsControl
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = -[HUServiceDetailsCameraAllowSnapshotsItem shouldBeHidden](self, "shouldBeHidden");
  LOBYTE(self) = 0;
  if (!v6 && v5)
  {
    objc_msgSend(v5, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = (HUServiceDetailsCameraAllowSnapshotsItem *)(((unint64_t)objc_msgSend(v8, "supportedFeatures") >> 5) & 1);

  }
  return (char)self;
}

- (id)transactionReason
{
  return CFSTR("HUSnapshotsAllowed-Toggle");
}

- (id)cameraSettings
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)characteristicForSettings:(id)a3
{
  return (id)objc_msgSend(a3, "snapshotsAllowedCharacteristic");
}

- (id)itemTitleLocalizationKey
{
  return CFSTR("HUStatusAndNotificationsAllowSnapshotsInNotifications");
}

- (id)itemTitle
{
  void *v2;
  void *v3;

  -[HUServiceDetailsCameraAllowSnapshotsItem itemTitleLocalizationKey](self, "itemTitleLocalizationKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v2, v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)characteristicValueManager
{
  void *v2;
  void *v3;

  -[HUServiceDetailsAbstractItem home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_characteristicValueManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMCameraUserSettings)cameraUserSettings
{
  return self->_cameraUserSettings;
}

- (void)setCameraUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cameraUserSettings, a3);
}

- (void)setSettingsReaderWriter:(id)a3
{
  objc_storeStrong((id *)&self->_settingsReaderWriter, a3);
}

- (BOOL)shouldBeHidden
{
  return self->_shouldBeHidden;
}

- (void)setShouldBeHidden:(BOOL)a3
{
  self->_shouldBeHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsReaderWriter, 0);
  objc_storeStrong((id *)&self->_cameraUserSettings, 0);
}

@end
