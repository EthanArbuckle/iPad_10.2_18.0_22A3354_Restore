@implementation HUAudioAnalysisDetectionSettingsItem

- (HUAudioAnalysisDetectionSettingsItem)initWithDetectionType:(unint64_t)a3 accessory:(id)a4
{
  id v7;
  HUAudioAnalysisDetectionSettingsItem *v8;
  HUAudioAnalysisDetectionSettingsItem *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUAudioAnalysisDetectionSettingsItem;
  v8 = -[HUAudioAnalysisDetectionSettingsItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_audioDetectionType = a3;
    objc_storeStrong((id *)&v8->_accessory, a4);
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  -[HUAudioAnalysisDetectionSettingsItem accessory](self, "accessory", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioAnalysisEventBulletinBoardNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");

  v24[0] = *MEMORY[0x1E0D30D18];
  -[HUAudioAnalysisDetectionSettingsItem _localizedStringFromDetectionType:](self, "_localizedStringFromDetectionType:", -[HUAudioAnalysisDetectionSettingsItem audioDetectionType](self, "audioDetectionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v24[1] = *MEMORY[0x1E0D30E20];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HUAudioAnalysisDetectionSettingsItem audioDetectionType](self, "audioDetectionType");
  objc_msgSend(v7, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D30D70];
  v10 = MEMORY[0x1E0C9AAA0];
  v25[1] = v8;
  v25[2] = MEMORY[0x1E0C9AAA0];
  v11 = *MEMORY[0x1E0D30B80];
  v24[2] = v9;
  v24[3] = v11;
  v12 = (void *)MEMORY[0x1E0C99E60];
  -[HUAudioAnalysisDetectionSettingsItem accessory](self, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v14;
  v24[4] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hf_currentUserIsAdministrator");
  v18 = MEMORY[0x1E0C9AAB0];
  if (v17)
    v18 = v10;
  v25[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "futureWithResult:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_localizedStringFromDetectionType:(unint64_t)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;

  if (a3 == 2)
  {
    v3 = CFSTR("HUAudioAnalysisEventCarbonMonoxideAlarm");
    v4 = CFSTR("HUAudioAnalysisEventCarbonMonoxideAlarm");
    LODWORD(a3) = 1;
  }
  else
  {
    if (a3 != 1)
    {
      v5 = 0;
      return v5;
    }
    v3 = CFSTR("HUAudioAnalysisEventSmokeAlarm");
    v4 = CFSTR("HUAudioAnalysisEventSmokeAlarm");
  }
  _HULocalizedStringWithDefaultValue(v3, v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (unint64_t)audioDetectionType
{
  return self->_audioDetectionType;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
