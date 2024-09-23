@implementation HUServiceDetailsCameraNightModeItem

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
  if (-[HUServiceDetailsCameraNightModeItem _canReadWriteNightVisionControl](self, "_canReadWriteNightVisionControl"))
  {
    -[HUServiceDetailsCameraNightModeItem settingsReaderWriter](self, "settingsReaderWriter");
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
  if (-[HUServiceDetailsCameraNightModeItem _canReadWriteNightVisionControl](self, "_canReadWriteNightVisionControl"))
  {
    -[HUServiceDetailsCameraNightModeItem settingsReaderWriter](self, "settingsReaderWriter");
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

- (BOOL)_canReadWriteNightVisionControl
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = ((unint64_t)objc_msgSend(v7, "supportedFeatures") >> 3) & 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)transactionReason
{
  return CFSTR("HUNightMode-Toggle");
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
  return (id)objc_msgSend(a3, "nightVisionModeEnabledCharacteristic");
}

- (id)itemTitleLocalizationKey
{
  return CFSTR("HUCameraNightModeSwitchTitle");
}

- (id)itemTitle
{
  void *v2;
  void *v3;

  -[HUServiceDetailsCameraNightModeItem itemTitleLocalizationKey](self, "itemTitleLocalizationKey");
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

- (void)setSettingsReaderWriter:(id)a3
{
  objc_storeStrong((id *)&self->_settingsReaderWriter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsReaderWriter, 0);
}

@end
