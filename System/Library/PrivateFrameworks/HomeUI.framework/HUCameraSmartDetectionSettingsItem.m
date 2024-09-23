@implementation HUCameraSmartDetectionSettingsItem

- (HUCameraSmartDetectionSettingsItem)initWithSignificantEventConfiguration:(id)a3 cameraProfiles:(id)a4 settingsContext:(unint64_t)a5
{
  id v8;
  id v9;
  HUCameraSmartDetectionSettingsItem *v10;
  uint64_t v11;
  HFCameraSignificantEventConfiguration *significantEventConfiguration;
  uint64_t v13;
  NSSet *cameraProfiles;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUCameraSmartDetectionSettingsItem;
  v10 = -[HUCameraSmartDetectionSettingsItem init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    significantEventConfiguration = v10->_significantEventConfiguration;
    v10->_significantEventConfiguration = (HFCameraSignificantEventConfiguration *)v11;

    v13 = objc_msgSend(v9, "copy");
    cameraProfiles = v10->_cameraProfiles;
    v10->_cameraProfiles = (NSSet *)v13;

    v10->_settingsContext = a5;
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[10];
  _QWORD v42[12];

  v42[10] = *MEMORY[0x1E0C80C00];
  if (!-[HUCameraSmartDetectionSettingsItem settingsContext](self, "settingsContext", a3))
  {
    v7 = (void *)MEMORY[0x1E0D31268];
    -[HUCameraSmartDetectionSettingsItem cameraProfiles](self, "cameraProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationForCameraProfilesRecordingSettings:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[HUCameraSmartDetectionSettingsItem settingsContext](self, "settingsContext") == 1)
  {
    v4 = (void *)MEMORY[0x1E0D31268];
    -[HUCameraSmartDetectionSettingsItem cameraProfiles](self, "cameraProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationForCameraProfilesNotificationSettings:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v6;

    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  v9 = -[HUCameraSmartDetectionSettingsItem _isHiddenForCurrentsignificantEventConfiguration:](self, "_isHiddenForCurrentsignificantEventConfiguration:", v8);
  v41[0] = *MEMORY[0x1E0D30D18];
  -[HUCameraSmartDetectionSettingsItem significantEventConfiguration](self, "significantEventConfiguration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedDescription");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v38;
  v41[1] = *MEMORY[0x1E0D30D20];
  -[HUCameraSmartDetectionSettingsItem significantEventConfiguration](self, "significantEventConfiguration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizationKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v36;
  v41[2] = *MEMORY[0x1E0D30E20];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HUCameraSmartDetectionSettingsItem significantEventConfiguration](self, "significantEventConfiguration");
  v40 = v8;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containsConfiguration:");
  objc_msgSend(v10, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v34;
  v41[3] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v33;
  v41[4] = *MEMORY[0x1E0D30B78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v32;
  v41[5] = *MEMORY[0x1E0D30B80];
  -[HUCameraSmartDetectionSettingsItem cameraProfiles](self, "cameraProfiles");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v31;
  v41[6] = CFSTR("HUCameraSettingResultKey");
  -[HUCameraSmartDetectionSettingsItem significantEventConfiguration](self, "significantEventConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v11;
  v41[7] = *MEMORY[0x1E0D30DA8];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[HUCameraSmartDetectionSettingsItem significantEventConfiguration](self, "significantEventConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v14;
  v41[8] = *MEMORY[0x1E0D30C80];
  v15 = -[HUCameraSmartDetectionSettingsItem settingsContext](self, "settingsContext");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HUCameraSmartDetectionSettingsItem cameraProfiles](self, "cameraProfiles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anyObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v15 == 1)
    v22 = objc_msgSend(v20, "areBulletinNotificationsSupported");
  else
    v22 = objc_msgSend(v20, "hf_currentUserIsAdministrator");
  objc_msgSend(v16, "numberWithInt:", v22 ^ 1u);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v23;
  v41[9] = *MEMORY[0x1E0D30CE8];
  v24 = -[HUCameraSmartDetectionSettingsItem settingsContext](self, "settingsContext");
  v25 = MEMORY[0x1E0C9AAB0];
  if (v24 == 1)
    v25 = MEMORY[0x1E0C9AAA0];
  v42[9] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "futureWithResult:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)_isHiddenForCurrentsignificantEventConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  -[HUCameraSmartDetectionSettingsItem cameraProfiles](self, "cameraProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personManagerSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isFaceClassificationEnabled");
  if ((objc_msgSend(v4, "eventTypes") & 1) != 0)
    goto LABEL_9;
  if (!objc_msgSend(v4, "eventTypes"))
    goto LABEL_9;
  if (-[HUCameraSmartDetectionSettingsItem settingsContext](self, "settingsContext") != 1)
    goto LABEL_10;
  if (!_os_feature_enabled_impl())
    goto LABEL_10;
  if (-[HUCameraSmartDetectionSettingsItem settingsContext](self, "settingsContext") != 1)
    goto LABEL_10;
  -[HUCameraSmartDetectionSettingsItem significantEventConfiguration](self, "significantEventConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "eventTypes");

  if (v12 != 2)
    goto LABEL_10;
  -[HUCameraSmartDetectionSettingsItem significantEventConfiguration](self, "significantEventConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isFaceDetectionConfiguration");

  if ((v14 ^ 1 | v10) != 1
    || (-[HUCameraSmartDetectionSettingsItem significantEventConfiguration](self, "significantEventConfiguration"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = v10 & ~objc_msgSend(v15, "isFaceDetectionConfiguration"),
        v15,
        (v16 & 1) != 0))
  {
LABEL_9:
    v17 = 1;
  }
  else
  {
LABEL_10:
    v17 = 0;
  }

  return v17;
}

- (HFCameraSignificantEventConfiguration)significantEventConfiguration
{
  return self->_significantEventConfiguration;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_significantEventConfiguration, 0);
}

@end
