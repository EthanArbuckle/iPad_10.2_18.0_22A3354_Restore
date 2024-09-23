@implementation HUHomeAudioAnalysisDetectionSettingsItem

- (HUHomeAudioAnalysisDetectionSettingsItem)initWithDetectionType:(unint64_t)a3 home:(id)a4
{
  id v7;
  HUHomeAudioAnalysisDetectionSettingsItem *v8;
  HUHomeAudioAnalysisDetectionSettingsItem *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeAudioAnalysisDetectionSettingsItem;
  v8 = -[HUHomeAudioAnalysisDetectionSettingsItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_audioDetectionType = a3;
    objc_storeStrong((id *)&v8->_home, a4);
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  -[HUHomeAudioAnalysisDetectionSettingsItem home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioAnalysisClassifierOptions");

  v22[0] = *MEMORY[0x1E0D30D18];
  -[HUHomeAudioAnalysisDetectionSettingsItem _localizedStringFromDetectionType:](self, "_localizedStringFromDetectionType:", -[HUHomeAudioAnalysisDetectionSettingsItem audioDetectionType](self, "audioDetectionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v22[1] = *MEMORY[0x1E0D30E20];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HUHomeAudioAnalysisDetectionSettingsItem audioDetectionType](self, "audioDetectionType");
  objc_msgSend(v6, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30D70];
  v9 = MEMORY[0x1E0C9AAA0];
  v23[1] = v7;
  v23[2] = MEMORY[0x1E0C9AAA0];
  v10 = *MEMORY[0x1E0D30B80];
  v22[2] = v8;
  v22[3] = v10;
  v11 = (void *)MEMORY[0x1E0C99E60];
  -[HUHomeAudioAnalysisDetectionSettingsItem home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v13;
  v22[4] = *MEMORY[0x1E0D30C80];
  -[HUHomeAudioAnalysisDetectionSettingsItem home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hf_currentUserIsAdministrator");
  v16 = MEMORY[0x1E0C9AAB0];
  if (v15)
    v16 = v9;
  v23[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "futureWithResult:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_localizedStringFromDetectionType:(unint64_t)a3
{
  if (a3 != 1)
    return 0;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAudioAnalysisEventSmokeAlarm"), CFSTR("HUAudioAnalysisEventSmokeAlarm"), 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)audioDetectionType
{
  return self->_audioDetectionType;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
