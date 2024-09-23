@implementation AssistantActivationController

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sAssistantBundle_0;
  if (!bundle_sAssistantBundle_0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sAssistantBundle_0;
    bundle_sAssistantBundle_0 = v3;

    v2 = (void *)bundle_sAssistantBundle_0;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[AssistantActivationController _updateSelectedPhrase](self, "_updateSelectedPhrase");
  v5.receiver = self;
  v5.super_class = (Class)AssistantActivationController;
  -[AssistantActivationController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[3];

  v3 = a3;
  v26[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_preferencesDidChange_, *MEMORY[0x24BE08EB8], 0);

  v25.receiver = self;
  v25.super_class = (Class)AssistantActivationController;
  -[AssistantActivationController viewDidAppear:](&v25, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Siri/ACTIVATION_COMPACT_ID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithKey:table:locale:bundleURL:", CFSTR("Listen for"), 0, v7, v9);

  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "deviceSupported");

  if ((_DWORD)v8)
    v12 = CFSTR("Apple Intelligence & Siri");
  else
    v12 = CFSTR("Siri");
  v13 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithKey:table:locale:bundleURL:", v12, 0, v14, v16);

  v18 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bundleURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithKey:table:locale:bundleURL:", CFSTR("Listen For"), 0, v19, v21);

  v26[0] = v17;
  v26[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantActivationController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.siri"), v10, v23, v24);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AssistantActivationController;
  -[AssistantActivationController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE08EB8], 0);

}

- (void)preferencesDidChange:(id)a3
{
  -[AssistantActivationController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("ACTIVATION_COMPACT_ID"));
  -[AssistantActivationController reloadSpecifier:](self, "reloadSpecifier:", self->_groupSpecifier);
  -[AssistantActivationController reloadSpecifier:](self, "reloadSpecifier:", self->_voiceActivationHSAndCompactSpecifier);
  -[AssistantActivationController reloadSpecifier:](self, "reloadSpecifier:", self->_voiceActivationHSSpecifier);
  -[AssistantActivationController reloadSpecifier:](self, "reloadSpecifier:", self->_voiceActivationOffSpecifier);
  -[AssistantActivationController reloadSpecifier:](self, "reloadSpecifier:", self->_talkToSiriGroup);
  -[AssistantActivationController reloadSpecifier:](self, "reloadSpecifier:", self->_typeToSiriGroup);
  -[AssistantActivationController _updateSpecifiersFromPreferences](self, "_updateSpecifiersFromPreferences");
  -[AssistantActivationController _refreshFootersForSpecifiers](self, "_refreshFootersForSpecifiers");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *groupSpecifier;
  PSSpecifier *v8;
  PSSpecifier *voiceActivationHSSpecifier;
  PSSpecifier *v10;
  void *v11;
  PSSpecifier *v12;
  PSSpecifier *voiceActivationHSAndCompactSpecifier;
  PSSpecifier *v14;
  void *v15;
  PSSpecifier *v16;
  PSSpecifier *voiceActivationOffSpecifier;
  PSSpecifier *v18;
  void *v19;
  PSConfirmationSpecifier *v20;
  PSConfirmationSpecifier *confirmationSpecifier;
  PSSpecifier *v22;
  PSSpecifier *talkToSiriGroup;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  PSSpecifier *v32;
  PSSpecifier *typeToSiriGroup;
  PSSpecifier *v34;
  PSSpecifier *typeToSiriSpecifier;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[AssistantActivationController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("AssistantActivation"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("ACTIVATION_PHRASE_GROUP_ID"));
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v6;

    objc_msgSend(v5, "specifierForID:", CFSTR("ACTIVATION_PHRASE_HS_ID"));
    v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    voiceActivationHSSpecifier = self->_voiceActivationHSSpecifier;
    self->_voiceActivationHSSpecifier = v8;

    v10 = self->_voiceActivationHSSpecifier;
    -[AssistantActivationController _localizeTriggerString:](self, "_localizeTriggerString:", CFSTR("ACTIVATION_PHRASE_HS_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setName:](v10, "setName:", v11);

    objc_msgSend(v5, "specifierForID:", CFSTR("ACTIVATION_PHRASE_COMPACT_ID"));
    v12 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    voiceActivationHSAndCompactSpecifier = self->_voiceActivationHSAndCompactSpecifier;
    self->_voiceActivationHSAndCompactSpecifier = v12;

    v14 = self->_voiceActivationHSAndCompactSpecifier;
    -[AssistantActivationController _localizeTriggerString:](self, "_localizeTriggerString:", CFSTR("ACTIVATION_PHRASE_COMPACT_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setName:](v14, "setName:", v15);

    objc_msgSend(v5, "specifierForID:", CFSTR("ACTIVATION_PHRASE_OFF_ID"));
    v16 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    voiceActivationOffSpecifier = self->_voiceActivationOffSpecifier;
    self->_voiceActivationOffSpecifier = v16;

    v18 = self->_voiceActivationOffSpecifier;
    -[AssistantActivationController _localizeTriggerString:](self, "_localizeTriggerString:", CFSTR("ACTIVATION_PHRASE_OFF_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setName:](v18, "setName:", v19);

    v20 = (PSConfirmationSpecifier *)objc_alloc_init(MEMORY[0x24BE754D0]);
    confirmationSpecifier = self->_confirmationSpecifier;
    self->_confirmationSpecifier = v20;

    -[PSConfirmationSpecifier setName:](self->_confirmationSpecifier, "setName:", CFSTR("ACTIVATION_CONFIRMATION"));
    -[PSConfirmationSpecifier setupWithDictionary:](self->_confirmationSpecifier, "setupWithDictionary:", &unk_24D3484F0);
    objc_msgSend(v5, "specifierForID:", CFSTR("ACTIVATION_LONG_PRESS_GROUP_ID"));
    v22 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    talkToSiriGroup = self->_talkToSiriGroup;
    self->_talkToSiriGroup = v22;

    objc_msgSend(v5, "specifierForID:", CFSTR("ACTIVATION_LONG_PRESS_ID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    if (MGGetSInt32Answer() == 2)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "sf_isiPad");

      +[AssistantController bundle](AssistantController, "bundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = CFSTR("ASSISTANT_HARDWARE_BUTTON_SLEEPWAKE");
      if (v26)
        v30 = CFSTR("AssistantSettings-j3xx");
      else
        v30 = CFSTR("AssistantSettings-D22");
    }
    else
    {
      +[AssistantController bundle](AssistantController, "bundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = CFSTR("ASSISTANT_HARDWARE_BUTTON");
      v30 = CFSTR("AssistantSettings");
    }
    objc_msgSend(v27, "localizedStringForKey:value:table:", v29, &stru_24D33E0B0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setName:", v31);

    objc_msgSend(v5, "specifierForID:", CFSTR("ACTIVATION_DOUBLE_TAP_GROUP_ID"));
    v32 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    typeToSiriGroup = self->_typeToSiriGroup;
    self->_typeToSiriGroup = v32;

    objc_msgSend(v5, "specifierForID:", CFSTR("ACTIVATION_DOUBLE_TAP_ID"));
    v34 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    typeToSiriSpecifier = self->_typeToSiriSpecifier;
    self->_typeToSiriSpecifier = v34;

    +[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision");
    +[AssistantActivationController bundle](AssistantActivationController, "bundle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_COMPACT_TITLE_ALT"), &stru_24D33E0B0, CFSTR("AssistantActivation"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantActivationController setTitle:](self, "setTitle:", v37);

    objc_msgSend(v5, "removeObject:", self->_typeToSiriGroup);
    objc_msgSend(v5, "removeObject:", self->_typeToSiriSpecifier);
    if (+[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision"))
    {
      +[AssistantActivationController bundle](AssistantActivationController, "bundle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_PHRASE_GROUP_TITLE"), &stru_24D33E0B0, CFSTR("AssistantActivation"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[AssistantActivationController setTitle:](self, "setTitle:", v39);

      objc_msgSend(v5, "specifierForID:", CFSTR("ACTIVATION_LONG_PRESS_ID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v40);

    }
    if (!+[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier](AssistantUtilities, "shouldShowCompactVoiceTriggerSpecifier"))objc_msgSend(v5, "removeObject:", self->_voiceActivationHSAndCompactSpecifier);
    v41 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    -[AssistantActivationController _updateSpecifiersFromPreferences](self, "_updateSpecifiersFromPreferences");
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_updateSelectedPhrase
{
  OUTLINED_FUNCTION_0(&dword_2153F2000, a2, a3, "%s Error updating preferred voice trigger phrase: %@", a5, a6, a7, a8, 2u);
}

- (id)_updateAndGetCheckedSpecifier
{
  unint64_t selectedPhrase;
  int *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[AssistantActivationController _updateSelectedPhrase](self, "_updateSelectedPhrase");
  selectedPhrase = self->_selectedPhrase;
  if (selectedPhrase == 10)
  {
LABEL_8:
    v4 = &OBJC_IVAR___AssistantActivationController__voiceActivationOffSpecifier;
    return *(id *)((char *)&self->super.super.super.super.super.isa + *v4);
  }
  if (selectedPhrase == 1)
  {
    v4 = &OBJC_IVAR___AssistantActivationController__voiceActivationHSAndCompactSpecifier;
    return *(id *)((char *)&self->super.super.super.super.super.isa + *v4);
  }
  if (selectedPhrase)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AssistantActivationController _updateAndGetCheckedSpecifier].cold.1((uint64_t)&self->_selectedPhrase, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_8;
  }
  v4 = &OBJC_IVAR___AssistantActivationController__voiceActivationHSSpecifier;
  return *(id *)((char *)&self->super.super.super.super.super.isa + *v4);
}

- (void)_updateSpecifiersFromPreferences
{
  id v3;

  -[AssistantActivationController _updateAndGetCheckedSpecifier](self, "_updateAndGetCheckedSpecifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](self->_groupSpecifier, "setProperty:forKey:", v3, *MEMORY[0x24BE75C20]);
  -[AssistantActivationController _refreshFootersForSpecifiers](self, "_refreshFootersForSpecifiers");

}

- (id)footerVariant
{
  if (+[AssistantUtilities deviceIsiPhone](AssistantUtilities, "deviceIsiPhone"))
    return CFSTR("IPHONE");
  if (+[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision"))
    return CFSTR("VISION");
  return CFSTR("IPAD");
}

- (void)_refreshFootersForSpecifiers
{
  void *v3;
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PSSpecifier *v21;

  -[AssistantActivationController _updateAndGetCheckedSpecifier](self, "_updateAndGetCheckedSpecifier");
  v21 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  if (!-[AssistantActivationController _isVoiceTriggerEnabled](self, "_isVoiceTriggerEnabled"))
  {
    -[AssistantActivationController footerVariant](self, "footerVariant");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("ACTIVATION_PHRASE_COMPACT_OFF_FOOTER_TEXT_");
LABEL_6:
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantActivationController _localizeTriggerString:](self, "_localizeTriggerString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v21 != self->_voiceActivationHSAndCompactSpecifier)
  {
    if (v21 != self->_voiceActivationHSSpecifier)
    {
      v3 = 0;
      goto LABEL_9;
    }
    -[AssistantActivationController footerVariant](self, "footerVariant");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("ACTIVATION_PHRASE_HS_FOOTER_TEXT_");
    goto LABEL_6;
  }
  -[AssistantActivationController footerVariant](self, "footerVariant");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("ACTIVATION_PHRASE_COMPACT_FOOTER_TEXT_"), "stringByAppendingString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantActivationController _localizeTriggerString:](self, "_localizeTriggerString:", v20);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (+[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision"))
  {
    v4 = v4;
    v3 = v4;
    goto LABEL_8;
  }
  -[AssistantActivationController _localizeTriggerString:](self, "_localizeTriggerString:", CFSTR("ACTIVATION_PHRASE_COMPACT_FOOTER_TEXT_HEADPHONES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v3 = (void *)v7;

LABEL_8:
LABEL_9:
  v8 = *MEMORY[0x24BE75A68];
  -[PSSpecifier setProperty:forKey:](self->_groupSpecifier, "setProperty:forKey:", v3, *MEMORY[0x24BE75A68]);
  -[AssistantActivationController reloadSpecifier:](self, "reloadSpecifier:", self->_groupSpecifier);
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "activeEnabled");

  if (v10)
  {
    +[AssistantActivationController bundle](AssistantActivationController, "bundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantActivationController footerVariant](self, "footerVariant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("ACTIVATION_LONG_PRESS_FOOTER_"), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24D33E0B0, CFSTR("AssistantActivation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSSpecifier setProperty:forKey:](self->_talkToSiriGroup, "setProperty:forKey:", v14, v8);
    -[AssistantActivationController reloadSpecifier:](self, "reloadSpecifier:", self->_talkToSiriGroup);
    +[AssistantActivationController bundle](AssistantActivationController, "bundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantActivationController footerVariant](self, "footerVariant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("ACTIVATION_DOUBLE_TAP_FOOTER_"), "stringByAppendingString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24D33E0B0, CFSTR("AssistantActivation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSSpecifier setProperty:forKey:](self->_typeToSiriGroup, "setProperty:forKey:", v18, v8);
    -[AssistantActivationController reloadSpecifier:](self, "reloadSpecifier:", self->_typeToSiriGroup);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  PSSpecifier *v8;
  PSSpecifier *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)AssistantActivationController;
  v6 = a4;
  -[AssistantActivationController tableView:didSelectRowAtIndexPath:](&v16, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = -[AssistantActivationController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);

  -[AssistantActivationController specifierAtIndex:](self, "specifierAtIndex:", v7);
  v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == self->_voiceActivationHSAndCompactSpecifier)
  {
    v11 = 1;
  }
  else
  {
    if (v8 != self->_voiceActivationHSSpecifier)
    {
      v10 = 0;
      goto LABEL_9;
    }
    v11 = 0;
  }
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[AssistantActivationController tableView:didSelectRowAtIndexPath:]";
    v19 = 2048;
    v20 = v11;
    _os_log_impl(&dword_2153F2000, v12, OS_LOG_TYPE_DEFAULT, "%s Setting preferred voice trigger phrase: %lu", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "setUserPreferredVoiceTriggerPhraseType:sender:deviceType:endpointId:", v11, self, 0, 0);

  v10 = 1;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantActivationController setVoiceActivation:forSpecifier:](self, "setVoiceActivation:forSpecifier:", v15, self->_confirmationSpecifier);

  -[AssistantActivationController _updateSpecifiersFromPreferences](self, "_updateSpecifiersFromPreferences");
  -[AssistantActivationController preferencesDidChange:](self, "preferencesDidChange:", 0);

}

- (id)_localizeTriggerString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BEC1DE8];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTriggerPhraseForLanguageCode:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  +[AssistantActivationController bundle](AssistantActivationController, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v4, &stru_24D33E0B0, CFSTR("AssistantActivation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)voiceActivation:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AssistantActivationController _isVoiceTriggerEnabled](self, "_isVoiceTriggerEnabled", a3));
}

- (void)setVoiceActivation:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[AssistantActivationController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__AssistantActivationController_setVoiceActivation_forSpecifier___block_invoke;
  v9[3] = &unk_24D33CBB8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "setVoiceActivation:forSpecifier:withTrainingCompletionIfNecessary:", v6, v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __65__AssistantActivationController_setVoiceActivation_forSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "preferencesDidChange:", 0);
    WeakRetained = v2;
  }

}

- (BOOL)_isHeySiriAlwaysOn
{
  return MGGetBoolAnswer();
}

- (BOOL)_isVoiceTriggerEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  return v3;
}

- (id)hardwareButtonTrigger:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AssistantUtilities isHardwareButtonTrigger](AssistantUtilities, "isHardwareButtonTrigger", a3));
}

- (void)setHardwareButtonTrigger:(id)a3 forSpecifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assistantIsEnabled");

  v9 = objc_msgSend(v13, "BOOLValue");
  if (v8)
  {
    if (v9 || -[AssistantActivationController _isVoiceTriggerEnabled](self, "_isVoiceTriggerEnabled"))
      goto LABEL_7;
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
    -[AssistantActivationController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = MEMORY[0x24BDBD1C0];
LABEL_9:
    objc_msgSend(v10, "_setAssistantEnabled:forSpecifier:", v12, v6);

    goto LABEL_10;
  }
  if (v9)
  {
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
    -[AssistantActivationController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = MEMORY[0x24BDBD1C8];
    goto LABEL_9;
  }
LABEL_7:
  _AXSSetHomeButtonAssistant();
LABEL_10:
  +[AssistantMetrics didToggle:on:](AssistantMetrics, "didToggle:on:", CFSTR("HardwareButton"), objc_msgSend(v13, "BOOLValue"));

}

- (id)typeToSiriTrigger:(id)a3
{
  return (id)MEMORY[0x24BDBD1C8];
}

- (AssistantActivationDelegate)delegate
{
  return (AssistantActivationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_confirmationSpecifier, 0);
  objc_storeStrong((id *)&self->_typeToSiriSpecifier, 0);
  objc_storeStrong((id *)&self->_typeToSiriGroup, 0);
  objc_storeStrong((id *)&self->_talkToSiriGroup, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationHSAndCompactSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationHSSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationOffSpecifier, 0);
  objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, 0);
}

- (void)_updateAndGetCheckedSpecifier
{
  OUTLINED_FUNCTION_0(&dword_2153F2000, a2, a3, "%s Error updating preferred voice trigger phrase specifier, unknown phrase type: %lu", a5, a6, a7, a8, 2u);
}

@end
