@implementation AXSpeechSettingsPerVoicePreferencesController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  TTSPerVoiceSettingsViewController *v10;
  TTSPerVoiceSettingsViewController *pvsettingViewController;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v41;
  objc_super v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[6];

  v48[4] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)AXSpeechSettingsPerVoicePreferencesController;
  -[AXSpeechSettingsPerVoicePreferencesController viewDidLoad](&v42, sel_viewDidLoad);
  -[AXSpeechSettingsPerVoicePreferencesController parentController](self, "parentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  AXUILocalizedStringForKey(CFSTR("VOICE_SETTINGS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController setTitle:](self, "setTitle:", v7);

  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v8 = (void *)getTTSPerVoiceSettingsViewControllerClass_softClass;
  v47 = getTTSPerVoiceSettingsViewControllerClass_softClass;
  if (!getTTSPerVoiceSettingsViewControllerClass_softClass)
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __getTTSPerVoiceSettingsViewControllerClass_block_invoke;
    v43[3] = &unk_1E76AB358;
    v43[4] = &v44;
    __getTTSPerVoiceSettingsViewControllerClass_block_invoke((uint64_t)v43);
    v8 = (void *)v45[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v44, 8);
  v10 = (TTSPerVoiceSettingsViewController *)objc_alloc_init(v9);
  pvsettingViewController = self->_pvsettingViewController;
  self->_pvsettingViewController = v10;

  -[AXSpeechSettingsPerVoicePreferencesController speechSourceKey](self, "speechSourceKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSPerVoiceSettingsViewController setSpeechSource:](self->_pvsettingViewController, "setSpeechSource:", v12);

  -[TTSPerVoiceSettingsViewController setDataDelegate:](self->_pvsettingViewController, "setDataDelegate:", self);
  -[TTSPerVoiceSettingsViewController view](self->_pvsettingViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AXSpeechSettingsPerVoicePreferencesController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSPerVoiceSettingsViewController view](self->_pvsettingViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[AXSpeechSettingsPerVoicePreferencesController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSPerVoiceSettingsViewController view](self->_pvsettingViewController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  v27 = (void *)MEMORY[0x1E0CB3718];
  -[TTSPerVoiceSettingsViewController view](self->_pvsettingViewController, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v37;
  -[TTSPerVoiceSettingsViewController view](self->_pvsettingViewController, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v31;
  -[TTSPerVoiceSettingsViewController view](self->_pvsettingViewController, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v20;
  -[TTSPerVoiceSettingsViewController view](self->_pvsettingViewController, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v26);

  -[TTSPerVoiceSettingsViewController didMoveToParentViewController:](self->_pvsettingViewController, "didMoveToParentViewController:", self);
}

- (id)getVoiceSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[AXSpeechSettingsPerVoicePreferencesController parentController](self, "parentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController voiceIdentifier](self, "voiceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getVoiceSettingsForVoice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)voiceSettingsDidChangeForVoice:(id)a3 settings:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[AXSpeechSettingsPerVoicePreferencesController parentController](self, "parentController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController voiceIdentifier](self, "voiceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "voiceSettingsDidChangeForVoice:settings:", v6, v5);

}

- (NSString)voiceIdentifier
{
  return self->_voiceIdentifier;
}

- (void)setVoiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_voiceIdentifier, a3);
}

- (AXSettingsResourceDownloadController)parentController
{
  return (AXSettingsResourceDownloadController *)objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (NSString)speechSourceKey
{
  return self->_speechSourceKey;
}

- (void)setSpeechSourceKey:(id)a3
{
  objc_storeStrong((id *)&self->_speechSourceKey, a3);
}

- (TTSPerVoiceSettingsViewController)pvsettingViewController
{
  return self->_pvsettingViewController;
}

- (void)setPvsettingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pvsettingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pvsettingViewController, 0);
  objc_storeStrong((id *)&self->_speechSourceKey, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_voiceIdentifier, 0);
}

@end
