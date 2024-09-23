@implementation HUSoundRecognitionItem

- (HUSoundRecognitionItem)initWithHome:(id)a3
{
  id v6;
  HUSoundRecognitionItem *v7;
  HUSoundRecognitionItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoundRecognitionItem.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HUSoundRecognitionItem;
  v7 = -[HUSoundRecognitionItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_home, a3);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HUSoundRecognitionItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  objc_msgSend(v6, "copyLatestResultsFromItem:", self);
  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (void *)objc_opt_new();
  -[HUSoundRecognitionItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hf_hasAtleastOneAudioAnalysisSupportedAccessory"))
  {
    -[HUSoundRecognitionItem home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator") ^ 1;

  }
  else
  {
    v7 = 1;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D70]);

  -[HUSoundRecognitionItem home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "audioAnalysisClassifierOptions");

  _HULocalizedStringWithDefaultValue(CFSTR("HUListenSettings_Title"), CFSTR("HUListenSettings_Title"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30D18]);

  if (v10)
    v12 = CFSTR("HUSafetyAndSecuritySettingsNotifications_On");
  else
    v12 = CFSTR("HUSafetyAndSecuritySettingsNotifications_Off");
  _HULocalizedStringWithDefaultValue(v12, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30BF8]);

  v14 = (void *)MEMORY[0x1E0C99E60];
  -[HUSoundRecognitionItem home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
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
