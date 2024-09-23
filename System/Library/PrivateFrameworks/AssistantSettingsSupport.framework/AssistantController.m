@implementation AssistantController

- (id)hardwareButtonTrigger:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AssistantUtilities isHardwareButtonTrigger](AssistantUtilities, "isHardwareButtonTrigger", a3));
}

- (id)voiceTrigger:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AssistantController _isVoiceTriggerEnabled](self, "_isVoiceTriggerEnabled", a3));
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

- (void)_askSiriUseDefaultFooterTextWithGroupSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[AssistantController bundle](AssistantController, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_ABOUT_LINK_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setProperty:forKey:", 0, *MEMORY[0x24BE75A68]);
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[AssistantController _askSiriUseDefaultFooterTextWithGroupSpecifier:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2153F2000, v7, OS_LOG_TYPE_INFO, "%s #settings Changing Siri text to %@", (uint8_t *)&v8, 0x16u);
  }
  -[AssistantController _addHyperlinkStyleToText:inString:action:forGroup:](self, "_addHyperlinkStyleToText:inString:action:forGroup:", v6, v6, sel_showAboutAssistantSheet_, v4);

}

- (void)_addHyperlinkStyleToText:(id)a3 inString:(id)a4 action:(SEL)a5 forGroup:(id)a6
{
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v11, "propertyForKey:", *MEMORY[0x24BE75A30]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x24BDBCE88];
    v17 = *MEMORY[0x24BDBCAB0];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", v17, CFSTR("Group must use %@ as footer cell class"), v19);

  }
  v20 = objc_msgSend(v10, "rangeOfString:", v22);
  if (v21)
    objc_msgSend(v11, "addFooterHyperlinkWithRange:target:action:", v20, v21, self, a5);

}

- (id)_localizedStringWithFormattedIDTemplate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v3 = (void *)MEMORY[0x24BEBD538];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isChinaRegionCellularDevice");

  if (v6)
    v7 = CFSTR("_CHINA");
  else
    v7 = &stru_24D33E0B0;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{CHINA}"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sf_deviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("_%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{DEVICE}"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantController bundle](AssistantController, "bundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v14, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_CHINA_REGULATORY_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" %@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
  }

  return v16;
}

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sAssistantBundle_3;
  if (!bundle_sAssistantBundle_3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sAssistantBundle_3;
    bundle_sAssistantBundle_3 = v3;

    v2 = (void *)bundle_sAssistantBundle_3;
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[AssistantController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("AssistantSettings"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantController configureSettingsForGM:](self, "configureSettingsForGM:", v5);
    -[AssistantController configureSiriRequestsSpecifiersFor:](self, "configureSiriRequestsSpecifiersFor:", v5);
    -[AssistantController configureSuggestionsSpecifiersFor:](self, "configureSuggestionsSpecifiersFor:", v5);
    -[AssistantController configureApplicationListSpecifiersFor:](self, "configureApplicationListSpecifiersFor:", v5);
    v6 = (objc_class *)objc_msgSend(v5, "copy");
    v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)assistantLanguage:(id)a3
{
  return +[AssistantUtilities assistantLanguage](AssistantUtilities, "assistantLanguage", a3);
}

- (id)_localizeTriggerString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE09270];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedTriggerPhraseForLanguageCode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[AssistantController _localizeTriggerString:]";
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_2153F2000, v9, OS_LOG_TYPE_DEFAULT, "%s languageCode: %@, triggerPhrase: %@", buf, 0x20u);
  }
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD17C8];
  +[AssistantController bundle](AssistantController, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v4, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringWithFormat:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (AssistantController)init
{
  AssistantController *v2;
  SUICAssistantVoiceSettingsConnection *v3;
  SUICAssistantVoiceSettingsConnection *settingsConnection;
  AFSettingsConnection *v5;
  AFSettingsConnection *AFSettingsConnection;
  UAFAssetUtilities *v7;
  UAFAssetUtilities *assetUtils;
  GMSpecifierProvider *v9;
  GMSpecifierProvider *gmSpecifierProvider;
  _TtC24AssistantSettingsSupport15GMFooterUtility *v11;
  _TtC24AssistantSettingsSupport15GMFooterUtility *gmFooterUtility;
  void *v13;
  objc_class *v14;
  VTUISiriDataSharingOptInPresenter *v15;
  VTUISiriDataSharingOptInPresenter *siriDataSharingPresenter;
  uint64_t v17;
  CNContactStore *contactStore;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v28.receiver = self;
  v28.super_class = (Class)AssistantController;
  v2 = -[AssistantController init](&v28, sel_init);
  if (v2)
  {
    v3 = (SUICAssistantVoiceSettingsConnection *)objc_alloc_init(MEMORY[0x24BEA85B0]);
    settingsConnection = v2->_settingsConnection;
    v2->_settingsConnection = v3;

    v5 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
    AFSettingsConnection = v2->_AFSettingsConnection;
    v2->_AFSettingsConnection = v5;

    v7 = (UAFAssetUtilities *)objc_alloc_init(MEMORY[0x24BEBEE88]);
    assetUtils = v2->_assetUtils;
    v2->_assetUtils = v7;

    v9 = -[GMSpecifierProvider initWithPresenter:]([GMSpecifierProvider alloc], "initWithPresenter:", v2);
    gmSpecifierProvider = v2->_gmSpecifierProvider;
    v2->_gmSpecifierProvider = v9;

    v11 = objc_alloc_init(_TtC24AssistantSettingsSupport15GMFooterUtility);
    gmFooterUtility = v2->_gmFooterUtility;
    v2->_gmFooterUtility = v11;

    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v13 = (void *)getVTUISiriDataSharingOptInPresenterClass_softClass;
    v33 = getVTUISiriDataSharingOptInPresenterClass_softClass;
    if (!getVTUISiriDataSharingOptInPresenterClass_softClass)
    {
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __getVTUISiriDataSharingOptInPresenterClass_block_invoke;
      v29[3] = &unk_24D33CD10;
      v29[4] = &v30;
      __getVTUISiriDataSharingOptInPresenterClass_block_invoke((uint64_t)v29);
      v13 = (void *)v31[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v30, 8);
    v15 = (VTUISiriDataSharingOptInPresenter *)objc_alloc_init(v14);
    siriDataSharingPresenter = v2->_siriDataSharingPresenter;
    v2->_siriDataSharingPresenter = v15;

    -[VTUISiriDataSharingOptInPresenter setPresentationDelegate:](v2->_siriDataSharingPresenter, "setPresentationDelegate:", v2);
    -[VTUISiriDataSharingOptInPresenter setSourceOfChange:](v2->_siriDataSharingPresenter, "setSourceOfChange:", 7);
    v17 = objc_opt_new();
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v17;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel_contactsDidChange, *MEMORY[0x24BDBA3D0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v2, sel_prepareForSnapshot, *MEMORY[0x24BEBDF98], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v2, sel_outputVoiceDidChange, *MEMORY[0x24BE08E88], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v2, sel_languageCodeDidChange, *MEMORY[0x24BE08DF0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v2, sel_preferencesDidChange, *MEMORY[0x24BE08EB8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v2, sel_didBecomeActive, *MEMORY[0x24BEBDF88], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel_preferencesDidChange, *MEMORY[0x24BED27B8], 0);

    -[AssistantController assistantVoiceLanguage:](v2, "assistantVoiceLanguage:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantController _updateSpecifiersForLanguage:](v2, "_updateSpecifiersForLanguage:", v26);

    -[AssistantController _makeMeDeviceDetermination](v2, "_makeMeDeviceDetermination");
    -[AssistantController _refreshAvailableLanguagesInTheHome](v2, "_refreshAvailableLanguagesInTheHome");
  }
  return v2;
}

- (void)_updateSpecifiersForLanguage:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  AFOutputVoiceLanguageForRecognitionLanguage();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[SUICAssistantVoiceSettingsConnection languageHasVoiceSelection:](self->_settingsConnection, "languageHasVoiceSelection:");
  -[AssistantController specifierForID:](self, "specifierForID:", CFSTR("VOICE_ID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (v5)
    {

    }
    else
    {
      -[AssistantController specifierForID:](self, "specifierForID:", CFSTR("ACTIVATION_COMPACT_ID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        -[AssistantController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", self->_voiceSpecifier, CFSTR("ACTIVATION_COMPACT_ID"), 1);
    }
  }
  else
  {

    if (v6)
      -[AssistantController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_voiceSpecifier, 1);
  }
  -[AssistantController specifierForID:](self, "specifierForID:", CFSTR("ACTIVATION_COMPACT_ID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController _localizeTriggerString:](self, "_localizeTriggerString:", CFSTR("ACTIVATION_COMPACT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v9);

  -[AssistantController specifierForID:](self, "specifierForID:", CFSTR("ACTIVATION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController _localizeTriggerString:](self, "_localizeTriggerString:", CFSTR("ACTIVATION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setName:", v11);

  if (-[AssistantController _isHeySiriAlwaysOn](self, "_isHeySiriAlwaysOn"))
    objc_msgSend(v10, "setProperty:forKey:", &unk_24D3485B8, *MEMORY[0x24BE75A18]);
  -[AssistantController reloadSpecifier:](self, "reloadSpecifier:", v10);

}

- (void)configureApplicationListSpecifiersFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;

  v3 = a3;
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GM_APP_ACCESS_GROUP"), &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = CFSTR("APP_ACCESS_GROUP");
  }
  v5 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v24, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupSpecifierWithName:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v23);
  v8 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("APP_CLIPS"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, 0, 0, 0, 0, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  v13 = *MEMORY[0x24BE75948];
  objc_msgSend(v11, "setProperty:forKey:", v12, *MEMORY[0x24BE75948]);
  objc_msgSend(v11, "setDetailControllerClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageForKey:", *MEMORY[0x24BE757C0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BE75AC8];
  objc_msgSend(v11, "setProperty:forKey:", v15, *MEMORY[0x24BE75AC8]);

  objc_msgSend(v3, "addObject:", v11);
  v17 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("APPS"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, 0, 0, 0, 0, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setProperty:forKey:", objc_opt_class(), v13);
  objc_msgSend(v20, "setDetailControllerClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageForKey:", *MEMORY[0x24BE757E0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setProperty:forKey:", v22, v16);

  objc_msgSend(v3, "addObject:", v20);
}

- (void)lowPowerModeChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__AssistantController_lowPowerModeChangedNotification___block_invoke;
  block[3] = &unk_24D33CBE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __55__AssistantController_lowPowerModeChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AssistantController;
  -[AssistantController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  +[AssistantMetrics didVisit](AssistantMetrics, "didVisit");
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756F0]), "objectForKey:", CFSTR("VOICE_FEEDBACK_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController reloadSpecifier:](self, "reloadSpecifier:", v4);

  if (self->_needsReloadSpecifiersOnViewWillAppear)
  {
    v5 = (int)*MEMORY[0x24BE756E0];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = 0;

    -[AssistantController reloadSpecifiers](self, "reloadSpecifiers");
    self->_needsReloadSpecifiersOnViewWillAppear = 0;
  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AssistantController;
  -[AssistantController viewDidLoad](&v4, sel_viewDidLoad);
  -[UAFAssetUtilities setDelegate:](self->_assetUtils, "setDelegate:", self);
  -[UAFAssetUtilities startObservers](self->_assetUtils, "startObservers");
  -[UAFAssetUtilities downloadSiriAssets](self->_assetUtils, "downloadSiriAssets");
  -[UAFAssetUtilities setAutoRetryEnabled:](self->_assetUtils, "setAutoRetryEnabled:", 1);
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchStatusWithPresenter:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AssistantController;
  -[AssistantController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  -[AssistantController _handleDelayedDeeplink](self, "_handleDelayedDeeplink");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_lowPowerModeChangedNotification_, *MEMORY[0x24BDD1160], 0);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Siri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceSupported");

  if (v7)
    v8 = CFSTR("Apple Intelligence & Siri");
  else
    v8 = CFSTR("Siri");
  v9 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithKey:table:locale:bundleURL:", v8, 0, v10, v12);

  -[AssistantController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.siri"), v13, MEMORY[0x24BDBD1A8], v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AssistantController;
  -[AssistantController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDD1160], 0);

  self->_needsReloadSpecifiersOnViewWillAppear = 1;
}

+ (BOOL)_heySiriSupportedForLanguage:(id)a3
{
  id v3;
  void *v4;
  char v5;

  if (!a3)
    return 0;
  v3 = a3;
  AFPreferencesSupportedLanguages();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AssistantController;
  -[AssistantController dealloc](&v4, sel_dealloc);
}

- (void)contactsDidChange
{
  -[AssistantController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("MY_INFO"), 1);
}

- (void)prepareForSnapshot
{
  -[AssistantController dismissConfirmationViewAnimated:](self, "dismissConfirmationViewAnimated:", 0);
  -[AssistantController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("ASSISTANT"), 0);
}

- (void)outputVoiceDidChange
{
  -[AssistantController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("VOICE_ID"));
}

- (void)preferencesDidChange
{
  -[AssistantController _refreshAvailableLanguagesInTheHome](self, "_refreshAvailableLanguagesInTheHome");
  -[AssistantController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)assistantAboutDonePressed:(id)a3
{
  void *v4;

  -[AssistantController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[AssistantController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)showAboutAssistantSheet:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.siri"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)showAboutImproveDictationSheet:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improvesiridictation"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)openStorageManagement:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=STORAGE_MGMT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v3, MEMORY[0x24BDBD1B8], &v9);
  v6 = v9;

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    v8 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AssistantController openStorageManagement:].cold.1(v8, v6);
  }

}

- (void)showAboutSearchSuggestionsSheet:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.sirisuggestions"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (id)bundle
{
  return +[AssistantController bundle](AssistantController, "bundle");
}

- (void)reloadSpecifiers
{
  NSArray *assistantSettings;
  NSMutableSet *disabledSpotlightDomains;
  NSMutableSet *disabledSpotlightBundles;
  void *v6;
  objc_super v7;

  assistantSettings = self->_assistantSettings;
  self->_assistantSettings = 0;

  disabledSpotlightDomains = self->_disabledSpotlightDomains;
  self->_disabledSpotlightDomains = 0;

  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  self->_disabledSpotlightBundles = 0;

  v7.receiver = self;
  v7.super_class = (Class)AssistantController;
  -[AssistantController reloadSpecifiers](&v7, sel_reloadSpecifiers);
  -[AssistantController assistantVoiceLanguage:](self, "assistantVoiceLanguage:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController _updateSpecifiersForLanguage:](self, "_updateSpecifiersForLanguage:", v6);

}

- (BOOL)_isAssistantLockScreenAccessRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isPasscodeSet"))
    v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE637E0]);
  else
    v3 = 1;

  return v3;
}

- (void)_refreshAvailableLanguagesInTheHome
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke;
  v3[3] = &unk_24D33CBB8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 194);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke_2;
    v5[3] = &unk_24D33D2C8;
    objc_copyWeak(&v6, v1);
    objc_msgSend(v4, "availableLanguagesInTheHome:", v5);
    objc_destroyWeak(&v6);
  }

}

void __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke_2_cold_1();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)WeakRetained[203];
      WeakRetained[203] = v8;

    }
  }

}

- (void)configureSettingsForGM:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceSupported");

  if (v5)
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_AND_GM"), &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantController setTitle:](self, "setTitle:", v7);

    -[GMSpecifierProvider fetchGMRampSpecifierWith:](self->_gmSpecifierProvider, "fetchGMRampSpecifierWith:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v11, "specifierForID:", CFSTR("ASSISTANT_PLACARD"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ps_insertObject:afterObject:", v8, v9);

    }
    objc_msgSend(v11, "specifierForID:", CFSTR("ASSISTANT_PLACARD_GROUP"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GMFooterUtility updateFooterWithSpecifier:](self->_gmFooterUtility, "updateFooterWithSpecifier:", v10);

  }
}

- (void)configureSiriRequestsSpecifiersFor:(id)a3
{
  id v4;
  PSSpecifier *v5;
  PSSpecifier *lockScreenSpecifier;
  PSSpecifier *v7;
  void *v8;
  PSSpecifier *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PSSpecifier *v16;
  PSSpecifier *languageSpecifier;
  PSSpecifier *v18;
  PSSpecifier *voiceSpecifier;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  PSSpecifier *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *v28;
  NSArray *assistantSettings;
  PSSpecifier *currentSiriActivationSpecifier;
  uint64_t v31;
  const __CFString *v32;
  PSSpecifier *v33;
  PSSpecifier *voiceActivationSettingsSpecifier;
  PSSpecifier *v35;
  PSSpecifier *voiceActivationSpecifier;
  objc_class *v37;
  void *v38;
  PSSpecifier *v39;
  id v40;
  uint64_t v41;
  PSSpecifier *v42;
  PSSpecifier *announceMessagesSpecifier;
  PSSpecifier *v44;
  _QWORD *v45;
  _QWORD *v46;
  void *v47;
  PSSpecifier *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  PSSpecifier *v56;
  PSSpecifier *siriInCallSpecifier;
  PSSpecifier *v58;
  void *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  _QWORD block[4];
  id v77;
  id v78;
  id location;

  v4 = a3;
  objc_msgSend(v4, "specifierForID:", CFSTR("ASSISTANT_LOCK_SCREEN_ACCESS"));
  v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  lockScreenSpecifier = self->_lockScreenSpecifier;
  self->_lockScreenSpecifier = v5;

  v7 = self->_lockScreenSpecifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[AssistantController _isAssistantLockScreenAccessRestricted](self, "_isAssistantLockScreenAccessRestricted") ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setProperty:forKey:](v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75A18]);

  v9 = self->_lockScreenSpecifier;
  -[AssistantController _localizeTriggerString:](self, "_localizeTriggerString:", CFSTR("ASSISTANT_LOCK_SCREEN_ACCESS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setName:](v9, "setName:", v10);

  objc_msgSend(v4, "specifierForID:", CFSTR("ACTIVATION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController _localizeTriggerString:](self, "_localizeTriggerString:", CFSTR("ACTIVATION"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v11;
  objc_msgSend(v11, "setName:", v12);

  objc_msgSend(v4, "specifierForID:", CFSTR("ACTIVATION_COMPACT_ID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "activeEnabled");

  if ((_DWORD)v11)
  {
    -[AssistantController _localizeTriggerString:](self, "_localizeTriggerString:", CFSTR("ACTIVATION_COMPACT"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", v15);

  }
  objc_msgSend(v4, "specifierForID:", CFSTR("LANGUAGE_ID"));
  v16 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  languageSpecifier = self->_languageSpecifier;
  self->_languageSpecifier = v16;

  objc_msgSend(v4, "specifierForID:", CFSTR("VOICE_ID"));
  v18 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  voiceSpecifier = self->_voiceSpecifier;
  self->_voiceSpecifier = v18;

  -[AssistantController assistantLanguage:](self, "assistantLanguage:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  AFOutputVoiceLanguageForRecognitionLanguage();
  v21 = objc_claimAutoreleasedReturnValue();

  v71 = (void *)v21;
  if ((-[SUICAssistantVoiceSettingsConnection languageHasVoiceSelection:](self->_settingsConnection, "languageHasVoiceSelection:", v21) & 1) != 0)
  {
    v22 = CFSTR("ASSISTANT_LOCK_SCREEN_ACCESS");
  }
  else
  {
    objc_msgSend(v4, "removeObject:", self->_voiceSpecifier);
    v23 = self->_voiceSpecifier;
    self->_voiceSpecifier = 0;

    v22 = CFSTR("VOICE_FEEDBACK_ID");
  }
  objc_msgSend(v4, "specifierForID:", CFSTR("MY_INFO"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "indexOfObject:", v24);

  objc_msgSend(v4, "specifierForID:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v4, "indexOfObject:", v26);

  objc_msgSend(v4, "subarrayWithRange:", v27, v25 - v27 + 1);
  v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  assistantSettings = self->_assistantSettings;
  self->_assistantSettings = v28;

  currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
  if (currentSiriActivationSpecifier)
  {
    v31 = 1424;
    if (currentSiriActivationSpecifier == self->_voiceActivationSpecifier)
    {
      v32 = CFSTR("ACTIVATION");
    }
    else
    {
      v31 = 1432;
      if (currentSiriActivationSpecifier != self->_voiceActivationSettingsSpecifier)
        goto LABEL_14;
      v32 = CFSTR("ACTIVATION_COMPACT_ID");
    }
    objc_msgSend(v4, "specifierForID:", v32);
    v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v38 = *(Class *)((char *)&self->super.super.super.super.super.isa + v31);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v31) = v37;

    v39 = (PSSpecifier *)*(id *)((char *)&self->super.super.super.super.super.isa + v31);
    voiceActivationSpecifier = self->_currentSiriActivationSpecifier;
    self->_currentSiriActivationSpecifier = v39;
  }
  else
  {
    objc_msgSend(v4, "specifierForID:", CFSTR("ACTIVATION_COMPACT_ID"));
    v33 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    voiceActivationSettingsSpecifier = self->_voiceActivationSettingsSpecifier;
    self->_voiceActivationSettingsSpecifier = v33;

    objc_msgSend(v4, "specifierForID:", CFSTR("ACTIVATION"));
    v35 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    voiceActivationSpecifier = self->_voiceActivationSpecifier;
    self->_voiceActivationSpecifier = v35;
  }

LABEL_14:
  v72 = v13;
  v40 = objc_alloc_init(MEMORY[0x24BE0FE98]);
  v41 = objc_msgSend(v40, "effectiveGlobalAnnounceSetting");

  objc_msgSend(v4, "specifierForID:", CFSTR("ANNOUNCE_MESSAGES"));
  v42 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  announceMessagesSpecifier = self->_announceMessagesSpecifier;
  self->_announceMessagesSpecifier = v42;

  v44 = self->_announceMessagesSpecifier;
  v45 = (_QWORD *)MEMORY[0x24BE75B68];
  v46 = (_QWORD *)MEMORY[0x24BE758E8];
  if (v41 == -1)
  {
    objc_msgSend(v4, "removeObject:", self->_announceMessagesSpecifier);
    v48 = self->_announceMessagesSpecifier;
    self->_announceMessagesSpecifier = 0;

  }
  else
  {
    PSBundlePathForPreferenceBundle();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v44, "setProperty:forKey:", v47, *v45);

    -[PSSpecifier setProperty:forKey:](self->_announceMessagesSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v46);
    -[PSSpecifier setControllerLoadAction:](self->_announceMessagesSpecifier, "setControllerLoadAction:", sel_lazyLoadBundle_);
  }
  objc_msgSend(v4, "specifierForID:", CFSTR("MESSAGE_WITHOUT_CONFIRMATION"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    PSBundlePathForPreferenceBundle();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setProperty:forKey:", v50, *v45);

    v51 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v49, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v46);
    objc_msgSend(v49, "setProperty:forKey:", v51, *MEMORY[0x24BE75868]);
    objc_msgSend(v49, "setControllerLoadAction:", sel_lazyLoadBundle_);
  }
  else
  {
    objc_msgSend(v4, "removeObject:", v49);

    v49 = 0;
  }
  objc_msgSend(v4, "specifierForID:", CFSTR("ACTIVATION"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v52);

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(v4, "specifierForID:", CFSTR("ANNOUNCE_CALLS"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v53);

  }
  -[AssistantController assistantEnabled:](self, "assistantEnabled:", 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "BOOLValue");

  if ((v55 & 1) == 0)
  {
    objc_msgSend(v4, "removeObjectsInArray:", self->_assistantSettings);
    objc_msgSend(v4, "removeObject:", self->_languageSpecifier);
    objc_msgSend(v4, "removeObject:", v49);

    v49 = 0;
  }
  objc_msgSend(v4, "specifierForID:", CFSTR("SIRI_IN_CALL_ID"));
  v56 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  siriInCallSpecifier = self->_siriInCallSpecifier;
  self->_siriInCallSpecifier = v56;

  v58 = self->_siriInCallSpecifier;
  +[AssistantSiriInCallController localizedSettingName](AssistantSiriInCallController, "localizedSettingName");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setName:](v58, "setName:", v59);

  if (!+[AssistantSiriInCallController isSettingSupported](AssistantSiriInCallController, "isSettingSupported"))objc_msgSend(v4, "removeObject:", self->_siriInCallSpecifier);
  objc_msgSend(v4, "specifierForID:", CFSTR("SIRI_REQUESTS_GROUP"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (objc_class *)objc_opt_class();
  NSStringFromClass(v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setProperty:forKey:", v62, *MEMORY[0x24BE75A30]);

  objc_msgSend(v60, "removePropertyForKey:", *MEMORY[0x24BE75A48]);
  -[AssistantController _askSiriUseDefaultFooterTextWithGroupSpecifier:](self, "_askSiriUseDefaultFooterTextWithGroupSpecifier:", v60);
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke;
  block[3] = &unk_24D33D2F0;
  objc_copyWeak(&v78, &location);
  v65 = v60;
  v77 = v65;
  dispatch_async(v63, block);

  objc_msgSend(MEMORY[0x24BEA85B0], "assistantLanguageTitlesDictionary");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "allKeys");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v67, "mutableCopy");

  -[AssistantController detailTextForLanguageSpecifierFromTitles:](self, "detailTextForLanguageSpecifierFromTitles:", v66);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v64;
  v74[1] = 3221225472;
  v74[2] = __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke_3;
  v74[3] = &unk_24D33D070;
  v70 = v66;
  v75 = v70;
  objc_msgSend(v68, "sortUsingComparator:", v74);
  -[PSSpecifier setProperty:forKey:](self->_languageSpecifier, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  -[PSSpecifier setValues:](self->_languageSpecifier, "setValues:", v68);
  -[PSSpecifier setTitleDictionary:](self->_languageSpecifier, "setTitleDictionary:", v70);
  -[PSSpecifier setShowContentString:](self->_languageSpecifier, "setShowContentString:", 1);
  if (v69 && objc_msgSend(v69, "length"))
    -[PSSpecifier setProperty:forKey:](self->_languageSpecifier, "setProperty:forKey:", v69, *MEMORY[0x24BE75D28]);
  else
    -[PSSpecifier removePropertyForKey:](self->_languageSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75D28]);

  objc_destroyWeak(&v78);
  objc_destroyWeak(&location);

}

void __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[201], "currentAssetStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke_2;
    block[3] = &unk_24D33D0E8;
    block[4] = v3;
    v7 = *(id *)(a1 + 32);
    v8 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSiriFooterGroup:withStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (void)_updateSiriFooterGroup:(id)a3 withStatus:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "removePropertyForKey:", *MEMORY[0x24BE75A48]);
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v7, "state"))
    {
      case 2:
      case 4:
        -[AssistantController _askSiriUseDownloadReadyFooterTextWithGroupSpecifier:](self, "_askSiriUseDownloadReadyFooterTextWithGroupSpecifier:", v6);
        break;
      case 3:
        -[AssistantController _askSiriUseDownloadingFooterTextWithGroupSpecifier:withProgress:](self, "_askSiriUseDownloadingFooterTextWithGroupSpecifier:withProgress:", v6, v8);
        break;
      case 5:
        -[AssistantController _askSiriUseDownloadFinishedFooterTextWithGroupSpecifier:](self, "_askSiriUseDownloadFinishedFooterTextWithGroupSpecifier:", v6);
        break;
      case 6:
        -[AssistantController _askSiriUseOutOfSpaceFooterTextWithGroupSpecifier:withSpaceRequired:](self, "_askSiriUseOutOfSpaceFooterTextWithGroupSpecifier:withSpaceRequired:", v6, v8);
        break;
      default:
        -[AssistantController _askSiriUseDefaultFooterTextWithGroupSpecifier:](self, "_askSiriUseDefaultFooterTextWithGroupSpecifier:", v6);
        break;
    }

  }
  else
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AssistantController _updateSiriFooterGroup:withStatus:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)_askSiriUseDownloadReadyFooterTextWithGroupSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AssistantController _localizedStringWithFormattedIDTemplate:](self, "_localizedStringWithFormattedIDTemplate:", CFSTR("SIRI_REQUESTS_ASSET_DOWNLOAD_FOOTER_TEXT{DEVICE}{CHINA}"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AssistantController isFlexibleFollowupsSupported](self, "isFlexibleFollowupsSupported"))
  {
    -[AssistantController _localizedStringWithFormattedIDTemplate:](self, "_localizedStringWithFormattedIDTemplate:", CFSTR("SIRI_REQUESTS_ONDEVICE_ASSET_DOWNLOAD_FOOTER_TEXT{CHINA}"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  +[AssistantController bundle](AssistantController, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_ABOUT_LINK_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" %@"), v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);
  -[AssistantController _addHyperlinkStyleToText:inString:action:forGroup:](self, "_addHyperlinkStyleToText:inString:action:forGroup:", v8, v9, sel_showAboutAssistantSheet_, v4);

}

- (void)_askSiriUseDownloadingFooterTextWithGroupSpecifier:(id)a3 withProgress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a4;
  v7 = a3;
  -[AssistantController _localizedStringWithFormattedIDTemplate:](self, "_localizedStringWithFormattedIDTemplate:", CFSTR("SIRI_REQUESTS_ASSET_DOWNLOADING_FOOTER_TEXT{DEVICE}"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AssistantController isFlexibleFollowupsSupported](self, "isFlexibleFollowupsSupported"))
  {
    -[AssistantController _localizedStringWithFormattedIDTemplate:](self, "_localizedStringWithFormattedIDTemplate:", CFSTR("SIRI_REQUESTS_ONDEVICE_ASSET_DOWNLOADING_FOOTER_TEXT"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  +[AssistantController bundle](AssistantController, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_ABOUT_LINK_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" %@"), v11);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v6, "unsignedIntegerValue");
  if (v12)
  {
    v14 = (void *)MEMORY[0x24BDD16F0];
    *(float *)&v13 = (float)v12 / 100.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringFromNumber:numberStyle:", v15, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD17C8];
    +[AssistantController bundle](AssistantController, "bundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_DOWNLOAD_PERCENT_COMPLETE_FOOTER"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "stringByAppendingString:", CFSTR("\n\n"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "stringByAppendingString:", v20);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "setProperty:forKey:", v22, *MEMORY[0x24BE75A68]);
  -[AssistantController _addHyperlinkStyleToText:inString:action:forGroup:](self, "_addHyperlinkStyleToText:inString:action:forGroup:", v11, v22, sel_showAboutAssistantSheet_, v7);

}

- (void)_askSiriUseDownloadFinishedFooterTextWithGroupSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  AssistantController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[AssistantController _localizedStringWithFormattedIDTemplate:](self, "_localizedStringWithFormattedIDTemplate:", CFSTR("SIRI_REQUESTS_DEVICE_PROCESSING_FOOTER_TEXT{DEVICE}"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantController bundle](AssistantController, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_ABOUT_LINK_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BE75A68];
  objc_msgSend(v21, "setProperty:forKey:", v7, *MEMORY[0x24BE75A68]);
  -[AssistantController _addHyperlinkStyleToText:inString:action:forGroup:](self, "_addHyperlinkStyleToText:inString:action:forGroup:", v6, v7, sel_showAboutAssistantSheet_, v21);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "siriDataSharingOptInStatus");

  if (v10 == 1)
  {
    -[AssistantController _localizedStringWithFormattedIDTemplate:](self, "_localizedStringWithFormattedIDTemplate:", CFSTR("SIRI_REQUESTS_DEVICE_PROCESSING_SHARING_FOOTER_TEXT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AssistantController bundle](AssistantController, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_IMPROVE_DICTATION_LINK_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setProperty:forKey:", v14, v8);
    v15 = sel_showAboutImproveDictationSheet_;
    v16 = self;
    v17 = v13;
    v18 = v14;
  }
  else
  {
    -[AssistantController _localizedStringWithFormattedIDTemplate:](self, "_localizedStringWithFormattedIDTemplate:", CFSTR("SIRI_REQUESTS_DEVICE_PROCESSING_FOOTER_TEXT{DEVICE}"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AssistantController bundle](AssistantController, "bundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_ABOUT_LINK_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(" %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setProperty:forKey:", v14, v8);
    v16 = self;
    v17 = v13;
    v18 = v14;
    v15 = sel_showAboutAssistantSheet_;
  }
  -[AssistantController _addHyperlinkStyleToText:inString:action:forGroup:](v16, "_addHyperlinkStyleToText:inString:action:forGroup:", v17, v18, v15, v21);

}

- (void)_askSiriUseOutOfSpaceFooterTextWithGroupSpecifier:(id)a3 withSpaceRequired:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a4;
  v7 = a3;
  -[AssistantController _localizedStringWithFormattedIDTemplate:](self, "_localizedStringWithFormattedIDTemplate:", CFSTR("SIRI_REQUESTS_OUT_OF_SPACE_FOOTER_TEXT{DEVICE}"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AssistantController isFlexibleFollowupsSupported](self, "isFlexibleFollowupsSupported"))
  {
    -[AssistantController _localizedStringWithFormattedIDTemplate:](self, "_localizedStringWithFormattedIDTemplate:", CFSTR("SIRI_REQUESTS_ONDEVICE_ASSET_OUT_OF_SPACE_FOOTER_TEXT"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  +[AssistantController bundle](AssistantController, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_ABOUT_LINK_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v6, "longLongValue");
  if (v13 >= 1)
    v14 = v13;
  else
    v14 = 996147200;
  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v14, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD17C8];
  +[AssistantController bundle](AssistantController, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_SPACE_REQUIRED_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[AssistantController bundle](AssistantController, "bundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SIRI_REQUESTS_MANAGE_STORAGE_TEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("\n\n%@ %@"), v19, v21);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", v22, *MEMORY[0x24BE75A68]);
  -[AssistantController _addHyperlinkStyleToText:inString:action:forGroup:](self, "_addHyperlinkStyleToText:inString:action:forGroup:", v11, v22, sel_showAboutAssistantSheet_, v7);
  -[AssistantController _addHyperlinkStyleToText:inString:action:forGroup:](self, "_addHyperlinkStyleToText:inString:action:forGroup:", v21, v22, sel_openStorageManagement_, v7);

}

- (void)confirmResetHiddenSuggestions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v14[0] = *MEMORY[0x24BE75990];
  +[AssistantController bundle](AssistantController, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_RESET_HIDDEN_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = *MEMORY[0x24BE75988];
  +[AssistantController bundle](AssistantController, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_RESET_HIDDEN_PROMPT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = *MEMORY[0x24BE75980];
  +[AssistantController bundle](AssistantController, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_RESET_HIDDEN_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  v14[3] = *MEMORY[0x24BE75970];
  +[AssistantController bundle](AssistantController, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_RESET_HIDDEN_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupWithDictionary:", v12);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75978]);
  objc_msgSend(v3, "setTarget:", self);
  objc_msgSend(v3, "setConfirmationAction:", sel_resetZKWHiddenSuggestions_);
  -[AssistantController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v3);

}

- (void)configureSearchAndLoookupSpecifiersFor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  AssistantController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSRange v32;

  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  +[AssistantController bundle](AssistantController, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEARCH_AND_LOOKUP_GROUP"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v7);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  +[AssistantController bundle](AssistantController, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ABOUT_PRIVACY_FOOTER_LINK"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  +[AssistantController bundle](AssistantController, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SEARCH_AND_LOOKUP_FOOTER"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v9;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@"), v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75A30]);

  objc_msgSend(v31, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75A58]);
  v32.location = objc_msgSend(v13, "rangeOfString:", v9);
  NSStringFromRange(v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75A40]);

  v17 = self;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE75A50]);

  objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("showAboutSearchSuggestionsSheet:"), *MEMORY[0x24BE75A38]);
  objc_msgSend(v5, "addObject:", v31);
  v19 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SEARCH_AND_LOOKUP_SHOW_RECENTS"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, v17, sel_setShowZKWRecentsEnabled_forSpecifier_, sel_isShowZKWRecentsEnabled_, 0, 6, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *MEMORY[0x24BE75A18];
  v24 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v22, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  v25 = *MEMORY[0x24BE75868];
  objc_msgSend(v22, "setProperty:forKey:", v24, *MEMORY[0x24BE75868]);
  objc_msgSend(v5, "addObject:", v22);
  v26 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SEARCH_AND_LOOKUP_SHOW_RELATED_CONTENT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, v17, sel_setShowInSpotlightEnabled_, sel_isShowInSpotlightEnabled, 0, 6, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setProperty:forKey:", v24, v23);
  objc_msgSend(v29, "setProperty:forKey:", v24, v25);
  objc_msgSend(v5, "addObject:", v29);

}

- (void)configureSuggestionsSpecifiersFor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  ASTLockScreenSuggestionsGlobalController *v18;
  ASTLockScreenSuggestionsGlobalController *suggestionsFromAppleAllowNotificationsController;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  +[AssistantController bundle](AssistantController, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_GROUP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v7);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  +[AssistantController bundle](AssistantController, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_FOOTER"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "setProperty:forKey:", v37, *MEMORY[0x24BE75A68]);
  objc_msgSend(v5, "addObject:", v38);
  v9 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_SHOW_BEFORE_SEARCHING"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel_setShowZKWSuggestionsEnabled_forSpecifier_, sel_isShowZKWSuggestionsEnabled_, 0, 6, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x24BE75A18];
  v13 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v36, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  v14 = *MEMORY[0x24BE75868];
  objc_msgSend(v36, "setProperty:forKey:", v13, *MEMORY[0x24BE75868]);
  objc_msgSend(v5, "addObject:", v36);
  v15 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_RESET_HIDDEN_NAME"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, 0, 13, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "setButtonAction:", sel_confirmResetHiddenSuggestions_);
  objc_msgSend(v5, "addObject:", v35);
  v18 = (ASTLockScreenSuggestionsGlobalController *)objc_opt_new();
  suggestionsFromAppleAllowNotificationsController = self->_suggestionsFromAppleAllowNotificationsController;
  self->_suggestionsFromAppleAllowNotificationsController = v18;

  -[ASTLockScreenSuggestionsGlobalController specifier](self->_suggestionsFromAppleAllowNotificationsController, "specifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v20);

  v21 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_SHOW_IN_APPLIBRARY"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, sel_setShowInAppLibraryEnabled_forSpecifier_, sel_isShowInAppLibraryEnabled_, 0, 6, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v24, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v12);
  objc_msgSend(v24, "setProperty:forKey:", v25, v14);
  objc_msgSend(v5, "addObject:", v24);
  v26 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_SHOW_WHEN_SHARING"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, self, sel_setShowWhenSharingEnabled_forSpecifier_, sel_isShowWhenSharingEnabled_, 0, 6, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setProperty:forKey:", v25, v12);
  v30 = v25;
  objc_msgSend(v29, "setProperty:forKey:", v25, v14);
  objc_msgSend(v5, "addObject:", v29);
  v31 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("SUGGESTIONS_SHOW_WHEN_LISTENING"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v33, self, sel_setShowWhenListeningEnabled_forSpecifier_, sel_isShowWhenListeningEnabled_, 0, 6, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setProperty:forKey:", v30, v12);
  objc_msgSend(v34, "setProperty:forKey:", v30, v14);
  objc_msgSend(v5, "addObject:", v34);

}

- (void)saveSpotlightSettings
{
  CFPreferencesSetAppValue(CFSTR("SBSearchDisabledDomains"), (CFPropertyListRef)-[NSMutableSet allObjects](self->_disabledSpotlightDomains, "allObjects"), CFSTR("com.apple.spotlightui"));
  CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  notify_post("com.apple.spotlightui.prefschanged");
}

+ (id)shortTitlesForLanguageIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  v4 = a3;
  objc_msgSend(v3, "_deviceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEA85B0], "shortTitlesForLanguageIdentifiers:deviceLanguageLocale:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)assistantVoice:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SUICAssistantVoiceSettingsConnection *settingsConnection;
  void *v17;
  void *v18;
  SUICAssistantVoiceSettingsConnection *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;

  -[AssistantController specifierForID:](self, "specifierForID:", CFSTR("VOICE_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = &stru_24D33E0B0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputVoice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "languageCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "voiceNamesForOutputLanguageCode:gender:", v10, objc_msgSend(v7, "gender"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outputVoiceDescriptorForOutputLanguageCode:voiceName:", v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "localizedDisplayWithRegion");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      settingsConnection = self->_settingsConnection;
      objc_msgSend(v7, "languageCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUICAssistantVoiceSettingsConnection getAvailableDialectsForLanguage:](settingsConnection, "getAvailableDialectsForLanguage:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v18, "count") < 2)
      {
        v21 = 0;
      }
      else
      {
        v19 = self->_settingsConnection;
        objc_msgSend(v7, "languageCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUICAssistantVoiceSettingsConnection dialectForLanguageIdentifier:](v19, "dialectForLanguageIdentifier:", v20);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      if (v21)
        v22 = v21;
      else
        v22 = &stru_24D33E0B0;
      v5 = v22;

    }
  }
  return v5;
}

- (id)voiceActivationSelection:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  id v13;

  -[AssistantController specifierForID:](self, "specifierForID:", CFSTR("ACTIVATION_COMPACT_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!-[AssistantController _isVoiceTriggerEnabled](self, "_isVoiceTriggerEnabled"))
    {
      +[AssistantController bundle](AssistantController, "bundle");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_OFF"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v11 = (void *)v10;

      return v11;
    }
    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v6 = objc_msgSend(v5, "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:", 0, 0, &v13);
    v7 = v13;

    if (v7)
      v8 = 0;
    else
      v8 = v6;
    if (!v8)
    {
      v9 = CFSTR("ACTIVATION_PHRASE_HS");
      goto LABEL_11;
    }
    if (v8 == 1)
    {
      v9 = CFSTR("ACTIVATION_PHRASE_COMPACT");
LABEL_11:
      -[AssistantController _localizeTriggerString:](self, "_localizeTriggerString:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }

  }
  return &stru_24D33E0B0;
}

- (BOOL)watchSupportsSiriLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getActivePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v6 = (_QWORD *)getNRDevicePropertySystemNameSymbolLoc_ptr;
  v15 = getNRDevicePropertySystemNameSymbolLoc_ptr;
  if (!getNRDevicePropertySystemNameSymbolLoc_ptr)
  {
    v7 = (void *)NanoRegistryLibrary();
    v6 = dlsym(v7, "NRDevicePropertySystemName");
    v13[3] = (uint64_t)v6;
    getNRDevicePropertySystemNameSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v12, 8);
  if (!v6)
    -[AssistantController watchSupportsSiriLanguageCode:].cold.1();
  objc_msgSend(v5, "valueForProperty:", *v6, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getNRDevicePropertySystemVersion();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(MEMORY[0x24BE09170], "siriIsSupportedForLanguageCode:productName:productVersion:error:", v3, v8, v10, 0);
  return (char)v9;
}

- (void)setAssistantEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSArray *assistantSettings;
  void *v17;
  void *v18;
  PSSpecifier *languageSpecifier;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v3 = a3;
  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assistantIsEnabled");

  if (v6 != v3)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAssistantIsEnabled:", v3);

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronize");

  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v9 = (void *)getBYFlowSkipControllerClass_softClass;
  v40 = getBYFlowSkipControllerClass_softClass;
  if (!getBYFlowSkipControllerClass_softClass)
  {
    v32 = MEMORY[0x24BDAC760];
    v33 = 3221225472;
    v34 = (uint64_t)__getBYFlowSkipControllerClass_block_invoke;
    v35 = &unk_24D33CD10;
    v36 = &v37;
    __getBYFlowSkipControllerClass_block_invoke((uint64_t)&v32);
    v9 = (void *)v38[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v10, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = (uint64_t)&v32;
  v34 = 0x2020000000;
  v12 = (_QWORD *)getBYFlowSkipIdentifierSiriSymbolLoc_ptr;
  v35 = (void *)getBYFlowSkipIdentifierSiriSymbolLoc_ptr;
  if (!getBYFlowSkipIdentifierSiriSymbolLoc_ptr)
  {
    v13 = (void *)SetupAssistantLibrary();
    v12 = dlsym(v13, "BYFlowSkipIdentifierSiri");
    *(_QWORD *)(v33 + 24) = v12;
    getBYFlowSkipIdentifierSiriSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v32, 8);
  if (!v12)
    -[AssistantController setAssistantEnabled:].cold.1();
  objc_msgSend(v11, "didCompleteFlow:", *v12);

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = self->_assistantSettings;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (-[AssistantController containsSpecifier:](self, "containsSpecifier:", v26, (_QWORD)v28))
            objc_msgSend(v20, "addObject:", v26);
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v23);
    }

    -[AssistantController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v20, 1);
    -[AssistantController removeSpecifier:](self, "removeSpecifier:", self->_languageSpecifier);
    goto LABEL_21;
  }
  -[AssistantController specifierForID:](self, "specifierForID:", CFSTR("LANGUAGE_ID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    assistantSettings = self->_assistantSettings;
    -[AssistantController specifiers](self, "specifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "specifierForID:", CFSTR("ACTIVATION"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", assistantSettings, v18, 1);

    languageSpecifier = self->_languageSpecifier;
    -[AssistantController specifiers](self, "specifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "specifierForID:", CFSTR("SIRI_REQUESTS_GROUP"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantController insertSpecifier:afterSpecifier:](self, "insertSpecifier:afterSpecifier:", languageSpecifier, v21);

LABEL_21:
  }
  -[AssistantController assistantVoiceLanguage:](self, "assistantVoiceLanguage:", 0, (_QWORD)v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController _updateSpecifiersForLanguage:](self, "_updateSpecifiersForLanguage:", v27);

}

+ (void)presentAssistantEnableAlertForState:(BOOL)a3 presentingViewController:(id)a4 actionHandler:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  AssistantController *v11;

  v6 = a3;
  v7 = a5;
  v8 = a4;
  v11 = objc_alloc_init(AssistantController);
  objc_setAssociatedObject(v8, &AssistantControllerIdentifier, v11, (void *)0x301);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController specifierForID:](v11, "specifierForID:", CFSTR("ACTIVATION_LONG_PRESS_ID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController _setAssistantEnabled:forSpecifier:presentingViewController:actionHandler:](v11, "_setAssistantEnabled:forSpecifier:presentingViewController:actionHandler:", v9, v10, v8, v7);

}

- (void)_setAssistantEnabled:(id)a3 forSpecifier:(id)a4 presentingViewController:(id)a5 actionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  AFSettingsConnection *AFSettingsConnection;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
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
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  char v42;
  id location;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isPaired");

  if (objc_msgSend(v10, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "languageCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
    {
      if (!v15)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bestSupportedLanguageCodeForLanguageCode:", 0);
      v20 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v20;
      if (!v15)
        goto LABEL_8;
    }
    if (!-[AssistantController watchSupportsSiriLanguageCode:](self, "watchSupportsSiriLanguageCode:", v17))
    {
      v21 = (void *)MEMORY[0x24BEBD3A8];
      +[AssistantController bundle](AssistantController, "bundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_CONTINUE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke;
      v46[3] = &unk_24D33D320;
      v46[4] = self;
      v24 = v11;
      v47 = v24;
      v36 = v12;
      v48 = v36;
      v49 = v13;
      objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v46);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x24BEBD3A8];
      +[AssistantController bundle](AssistantController, "bundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_2;
      v44[3] = &unk_24D33D348;
      v44[4] = self;
      v45 = v24;
      objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 1, v44);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)MEMORY[0x24BEBD3B0];
      +[AssistantController bundle](AssistantController, "bundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_TITLE_WATCH_UNAVAILABLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[AssistantController bundle](AssistantController, "bundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_WATCH_UNAVAILABLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "alertControllerWithTitle:message:preferredStyle:", v29, v31, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "addAction:", v35);
      objc_msgSend(v32, "addAction:", v34);
      if (v36)
        objc_msgSend(v36, "presentViewController:animated:completion:", v32, 1, 0);

      goto LABEL_12;
    }
LABEL_8:
    -[AssistantController showAssistantConfirmationViewForSpecifier:presentingViewController:actionHandler:](self, "showAssistantConfirmationViewForSpecifier:presentingViewController:actionHandler:", v11, v12, v13);
LABEL_12:

    goto LABEL_13;
  }
  objc_initWeak(&location, self);
  AFSettingsConnection = self->_AFSettingsConnection;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_3;
  v37[3] = &unk_24D33D398;
  objc_copyWeak(&v41, &location);
  v38 = v11;
  v42 = v15;
  v39 = v12;
  v40 = v13;
  -[AFSettingsConnection fetchMultiUserVoiceIdentificationSetting:](AFSettingsConnection, "fetchMultiUserVoiceIdentificationSetting:", v37);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
LABEL_13:

}

uint64_t __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAssistantConfirmationViewForSpecifier:presentingViewController:actionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assistantEnabledCancelled:", *(_QWORD *)(a1 + 40));
}

void __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  char v9;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_4;
  block[3] = &unk_24D33D370;
  v8 = a2;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v7);
}

void __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 64) && !+[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "confirmDisableForMultiUserVoiceIdentificationWithSpecifier:pairedWatch:presentingViewController:actionHandler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "confirmDisableWithSpecifier:pairedWatch:presentingViewController:actionHandler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)confirmDisableForMultiUserVoiceIdentificationWithSpecifier:(id)a3 pairedWatch:(BOOL)a4 presentingViewController:(id)a5 actionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  BOOL v41;
  id location[2];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(location, self);
  v13 = (void *)MEMORY[0x24BEBD3A8];
  +[AssistantController bundle](AssistantController, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_DISABLE_MULTI_USER_ENABLED_OK"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __133__AssistantController_confirmDisableForMultiUserVoiceIdentificationWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke;
  v36[3] = &unk_24D33D3C0;
  objc_copyWeak(&v40, location);
  v17 = v10;
  v37 = v17;
  v41 = a4;
  v18 = v11;
  v38 = v18;
  v19 = v12;
  v39 = v19;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BEBD3A8];
  +[AssistantController bundle](AssistantController, "bundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_DISABLE_MULTI_USER_ENABLED_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  v32[1] = 3221225472;
  v32[2] = __133__AssistantController_confirmDisableForMultiUserVoiceIdentificationWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_2;
  v32[3] = &unk_24D33D3E8;
  objc_copyWeak(&v35, location);
  v24 = v17;
  v33 = v24;
  v25 = v19;
  v34 = v25;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 1, v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = objc_msgSend(v27, "sf_isiPad");

  v28 = (void *)MEMORY[0x24BEBD3B0];
  +[AssistantController bundle](AssistantController, "bundle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_DISABLE_WARNING_MULTI_USER_ENABLED"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "alertControllerWithTitle:message:preferredStyle:", 0, v30, v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "addAction:", v20);
  objc_msgSend(v31, "addAction:", v26);
  objc_msgSend(v18, "presentViewController:animated:completion:", v31, 1, 0);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v40);
  objc_destroyWeak(location);

}

void __133__AssistantController_confirmDisableForMultiUserVoiceIdentificationWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "confirmDisableWithSpecifier:pairedWatch:presentingViewController:actionHandler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __133__AssistantController_confirmDisableForMultiUserVoiceIdentificationWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "assistantDisabledCancelled:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)confirmDisableWithSpecifier:(id)a3 pairedWatch:(BOOL)a4 presentingViewController:(id)a5 actionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id location[2];

  v46 = a4;
  v9 = a3;
  v47 = a5;
  v10 = a6;
  objc_initWeak(location, self);
  v11 = (void *)MEMORY[0x24BEBD3A8];
  +[AssistantController bundle](AssistantController, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_DISABLE_OK"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke;
  v53[3] = &unk_24D33D3E8;
  objc_copyWeak(&v56, location);
  v15 = v9;
  v54 = v15;
  v16 = v10;
  v55 = v16;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v53);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BEBD3A8];
  +[AssistantController bundle](AssistantController, "bundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_DISABLE_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v14;
  v49[1] = 3221225472;
  v49[2] = __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_2;
  v49[3] = &unk_24D33D3E8;
  objc_copyWeak(&v52, location);
  v20 = v15;
  v50 = v20;
  v21 = v16;
  v51 = v21;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, v49);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "dictationIsEnabled");
  v25 = CFSTR("ASSISTANT_DISABLE_WARNING_DICTATION_DISABLED");
  if (v24)
    v25 = CFSTR("ASSISTANT_DISABLE_WARNING_DICTATION_ENABLED");
  v26 = v25;

  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "activeEnabled");

  if (v28)
  {
    -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", CFSTR("_GM"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[AssistantController bundle](AssistantController, "bundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", v29, &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
    v31 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "getPairedDevices");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "filteredArrayUsingPredicate:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v46 && v36)
    {
      v37 = (void *)MEMORY[0x24BEBD538];
      -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", CFSTR("_WATCH"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "modelSpecificLocalizedStringKeyForKey:", v38);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = v26;
    }
    +[AssistantController bundle](AssistantController, "bundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", v29, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v31;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "sf_isiPad"))
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_DISABLE_TITLE_IPAD"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  }
  else
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_DISABLE_TITLE_IPHONE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "sf_isiPad");

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v42, v39, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addAction:", v48);
  objc_msgSend(v45, "addAction:", v22);
  objc_msgSend(v47, "presentViewController:animated:completion:", v45, 1, 0);

  objc_destroyWeak(&v52);
  objc_destroyWeak(&v56);
  objc_destroyWeak(location);

}

uint64_t __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "assistantDisabledConfirmed:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "assistantDisabledCancelled:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

BOOL __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  getNRDevicePropertySystemVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "integerValue") < 6;
  return v5;
}

- (void)showAssistantConfirmationViewForSpecifier:(id)a3 presentingViewController:(id)a4 actionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isPaired");

  objc_initWeak(location, self);
  v13 = (void *)MEMORY[0x24BEBD3A8];
  +[AssistantController bundle](AssistantController, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_OK"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke;
  v48[3] = &unk_24D33D450;
  objc_copyWeak(&v52, location);
  v17 = v8;
  v49 = v17;
  v43 = v9;
  v50 = v43;
  v18 = v10;
  v51 = v18;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v48);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BEBD3A8];
  +[AssistantController bundle](AssistantController, "bundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v16;
  v45[1] = 3221225472;
  v45[2] = __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke_2;
  v45[3] = &unk_24D33D478;
  v45[4] = self;
  v22 = v17;
  v46 = v22;
  v23 = v18;
  v47 = v23;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, v45);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "getPairedDevices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_390);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filteredArrayUsingPredicate:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
    v29 = v12;
  else
    v29 = 0;
  v41 = v23;
  if (v29 == 1)
  {
    v30 = (void *)MEMORY[0x24BEBD538];
    objc_msgSend(CFSTR("ASSISTANT_ENABLE_WARNING"), "stringByAppendingString:", CFSTR("_WATCH"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "modelSpecificLocalizedStringKeyForKey:", v31);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = CFSTR("ASSISTANT_ENABLE_WARNING");
  }
  v33 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "sf_isiPad"))
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_TITLE_IPAD"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  }
  else
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_TITLE_IPHONE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantController bundle](AssistantController, "bundle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", v32, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "alertControllerWithTitle:message:preferredStyle:", v36, v38, objc_msgSend(v39, "sf_isiPad"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "addAction:", v44);
  objc_msgSend(v40, "addAction:", v42);
  objc_msgSend(v43, "presentViewController:animated:completion:", v40, 1, 0);

  objc_destroyWeak(&v52);
  objc_destroyWeak(location);

}

void __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleThemisEnablementConfirmationForSpecifier:presentingViewController:actionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "assistantEnabledCancelled:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

BOOL __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  getNRDevicePropertySystemVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "integerValue") < 6;
  return v5;
}

- (void)_handleEnablementConfirmationForSpecifier:(id)a3 actionHandler:(id)a4
{
  PSSpecifier *currentSiriActivationSpecifier;
  const __CFString *v7;
  void *v8;
  id v9;

  v9 = a4;
  currentSiriActivationSpecifier = (PSSpecifier *)a3;
  -[AssistantController assistantEnabledConfirmed:](self, "assistantEnabledConfirmed:", currentSiriActivationSpecifier);
  if (-[AssistantController _isCurrentSpecifierVoiceActivation](self, "_isCurrentSpecifierVoiceActivation"))
  {
    -[AssistantController setVoiceTrigger:forSpecifier:](self, "setVoiceTrigger:forSpecifier:", MEMORY[0x24BDBD1C8], currentSiriActivationSpecifier);
    v7 = CFSTR("HeySiri");
  }
  else
  {
    -[AssistantController setHardwareButtonTrigger:forSpecifier:](self, "setHardwareButtonTrigger:forSpecifier:", MEMORY[0x24BDBD1C8], currentSiriActivationSpecifier);

    currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
    self->_currentSiriActivationSpecifier = 0;
    v7 = CFSTR("HardwareButton");
  }

  +[AssistantMetrics didEnableSiriConfirmed:source:](AssistantMetrics, "didEnableSiriConfirmed:source:", 1, v7);
  if (-[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView](self->_siriDataSharingPresenter, "shouldShowSiriDataSharingOptInView"))-[AssistantController _presentSiriDataSharingOptInViewController](self, "_presentSiriDataSharingOptInViewController");
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    v8 = v9;
  }

}

- (BOOL)_isCurrentSpecifierVoiceActivation
{
  PSSpecifier *voiceActivationSpecifier;
  PSSpecifier *voiceActivationSettingsSpecifier;
  PSSpecifier *currentSiriActivationSpecifier;
  void *v6;
  char v7;

  voiceActivationSpecifier = self->_voiceActivationSpecifier;
  if (voiceActivationSpecifier && self->_currentSiriActivationSpecifier == voiceActivationSpecifier)
    return 1;
  voiceActivationSettingsSpecifier = self->_voiceActivationSettingsSpecifier;
  currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
  if (voiceActivationSettingsSpecifier && currentSiriActivationSpecifier == voiceActivationSettingsSpecifier)
    return 1;
  -[PSSpecifier name](currentSiriActivationSpecifier, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ACTIVATION_CONFIRMATION"));

  return v7;
}

- (void)_handleThemisEnablementConfirmationForSpecifier:(id)a3 presentingViewController:(id)a4 actionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  AFEnablementFlowConfigurationProvider *v11;
  AFEnablementFlowConfigurationProvider *enablementConfigurationProvider;
  void *v13;
  void *v14;
  NSObject *v15;
  AFEnablementFlowConfigurationProvider *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_enablementConfigurationProvider)
  {
    v11 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(MEMORY[0x24BE091D0]);
    enablementConfigurationProvider = self->_enablementConfigurationProvider;
    self->_enablementConfigurationProvider = v11;

  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bestSupportedLanguageCodeForLanguageCode:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[AssistantController _handleThemisEnablementConfirmationForSpecifier:presentingViewController:actionHandler:]";
    _os_log_impl(&dword_2153F2000, v15, OS_LOG_TYPE_DEFAULT, "%s Fetching Enablement Configuration", buf, 0xCu);
  }
  v16 = self->_enablementConfigurationProvider;
  v27 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __110__AssistantController__handleThemisEnablementConfirmationForSpecifier_presentingViewController_actionHandler___block_invoke;
  v22[3] = &unk_24D33D4E8;
  v22[4] = self;
  v23 = v14;
  v25 = v9;
  v26 = v10;
  v24 = v8;
  v18 = v9;
  v19 = v10;
  v20 = v8;
  v21 = v14;
  -[AFEnablementFlowConfigurationProvider configurationForEnablementFlow:recognitionLanguageCodes:completion:](v16, "configurationForEnablementFlow:recognitionLanguageCodes:completion:", 6, v17, v22);

}

void __110__AssistantController__handleThemisEnablementConfirmationForSpecifier_presentingViewController_actionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __110__AssistantController__handleThemisEnablementConfirmationForSpecifier_presentingViewController_actionHandler___block_invoke_2;
  v7[3] = &unk_24D33D4C0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __110__AssistantController__handleThemisEnablementConfirmationForSpecifier_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v21 = 136315394;
    v22 = "-[AssistantController _handleThemisEnablementConfirmationForSpecifier:presentingViewController:actionHandler:]_block_invoke_2";
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2153F2000, v3, OS_LOG_TYPE_DEFAULT, "%s Enablement Configuration %@", (uint8_t *)&v21, 0x16u);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1576), *(id *)(a1 + 32));
  v5 = objc_msgSend(*(id *)(a1 + 32), "requiresVoiceSelectionForRecognitionLanguage:", *(_QWORD *)(a1 + 48));
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 72);
  if (!v5)
    return objc_msgSend(v6, "_handleEnablementConfirmationForSpecifier:actionHandler:", v7, v8);
  objc_msgSend(v6, "_createVoiceSelectionDismissalHandlerWithSpecifier:actionHandler:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 1600);
  *(_QWORD *)(v10 + 1600) = v9;

  objc_msgSend(*(id *)(a1 + 40), "_createVoiceSelectionCompletionForSpecifier:recognitionLanguageCode:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 1592);
  *(_QWORD *)(v13 + 1592) = v12;

  objc_msgSend(*(id *)(a1 + 40), "_createEnablementFlowControllerForConfiguration:recognitionLanguageCode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(void **)(v16 + 1584);
  *(_QWORD *)(v16 + 1584) = v15;

  v18 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 48);
    v21 = 136315394;
    v22 = "-[AssistantController _handleThemisEnablementConfirmationForSpecifier:presentingViewController:actionHandler:]_block_invoke";
    v23 = 2112;
    v24 = v19;
    _os_log_impl(&dword_2153F2000, v18, OS_LOG_TYPE_DEFAULT, "%s Presenting Voice selection for %@", (uint8_t *)&v21, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 64), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1584), 1, 0);
}

- (id)_createEnablementFlowControllerForConfiguration:(id)a3 recognitionLanguageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  PSVoiceTriggerRootController *v23;
  PSRootController *enablementFlowNavigationController;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PSRootController *v31;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  if (-[AssistantController _isCurrentSpecifierVoiceActivation](self, "_isCurrentSpecifierVoiceActivation"))
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v7);

    v10 = v9 ^ 1;
  }
  else
  {
    v10 = -[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView](self->_siriDataSharingPresenter, "shouldShowSiriDataSharingOptInView");
  }
  +[AssistantController bundle](AssistantController, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_DONE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_NEXT"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v12, 2, 0, 0);
  v16 = objc_alloc(MEMORY[0x24BEBD410]);
  +[AssistantController bundle](AssistantController, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ENABLE_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithTitle:style:target:action:", v18, 2, self, sel__voiceSelectionCancelled);

  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v20 = (void *)getVTUIVoiceSelectionViewControllerClass_softClass;
  v37 = getVTUIVoiceSelectionViewControllerClass_softClass;
  if (!getVTUIVoiceSelectionViewControllerClass_softClass)
  {
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __getVTUIVoiceSelectionViewControllerClass_block_invoke;
    v33[3] = &unk_24D33CD10;
    v33[4] = &v34;
    __getVTUIVoiceSelectionViewControllerClass_block_invoke((uint64_t)v33);
    v20 = (void *)v35[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v34, 8);
  v22 = (void *)objc_msgSend([v21 alloc], "initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:customVoicePreviewer:delegate:", v7, objc_msgSend(v6, "voiceSelectionAllowsRandomSelection"), v15, 0, self);
  v23 = -[PSRootController initWithRootViewController:]([PSVoiceTriggerRootController alloc], "initWithRootViewController:", v22);
  enablementFlowNavigationController = self->_enablementFlowNavigationController;
  self->_enablementFlowNavigationController = &v23->super;

  -[PSRootController setModalPresentationStyle:](self->_enablementFlowNavigationController, "setModalPresentationStyle:", 2);
  -[PSRootController presentationController](self->_enablementFlowNavigationController, "presentationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDelegate:", self);

  objc_msgSend(v22, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setRightBarButtonItem:", v15);

  objc_msgSend(v22, "navigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLeftBarButtonItem:", v19);

  -[PSRootController navigationBar](self->_enablementFlowNavigationController, "navigationBar");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v29);

  objc_msgSend(v28, "_setHidesShadow:", 1);
  v30 = (void *)objc_opt_new();
  objc_msgSend(v28, "setBackgroundImage:forBarMetrics:", v30, 0);

  v31 = self->_enablementFlowNavigationController;
  return v31;
}

- (id)_createVoiceSelectionCompletionForSpecifier:(id)a3 recognitionLanguageCode:(id)a4
{
  PSSpecifier *v6;
  id v7;
  BOOL v8;
  void *v9;
  char v10;
  PSSpecifier *v11;
  id v12;
  void *v13;
  _QWORD aBlock[4];
  id v16;
  PSSpecifier *v17;
  id v18;
  BOOL v19;
  char v20;
  id location;

  v6 = (PSSpecifier *)a3;
  v7 = a4;
  v8 = self->_voiceActivationSpecifier == v6 || self->_voiceActivationSettingsSpecifier == v6;
  -[PSSpecifier identifier](v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("ACTIVATION_LONG_PRESS_ID"));

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke;
  aBlock[3] = &unk_24D33D510;
  objc_copyWeak(&v18, &location);
  v16 = v7;
  v17 = v6;
  v19 = v8;
  v20 = v10;
  v11 = v6;
  v12 = v7;
  v13 = _Block_copy(aBlock);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v13;
}

void __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  os_log_t *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_22;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v38 = "-[AssistantController _createVoiceSelectionCompletionForSpecifier:recognitionLanguageCode:]_block_invoke";
    v39 = 2112;
    v40 = v7;
    v41 = 2112;
    v42 = v3;
    _os_log_impl(&dword_2153F2000, v6, OS_LOG_TYPE_DEFAULT, "%s Setting Language code %@, output voice: %@", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLanguageCode:outputVoice:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(WeakRetained, "assistantEnabledConfirmed:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSpeakerRecognitionAvailable");

  if (*(_BYTE *)(a1 + 56))
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v10)
      objc_msgSend(WeakRetained, "setVoiceTrigger:forSpecifier:transitionWithNavControllerIfNecessary:", MEMORY[0x24BDBD1C8], v11, WeakRetained[198]);
    else
      objc_msgSend(WeakRetained, "setVoiceTrigger:forSpecifier:", MEMORY[0x24BDBD1C8], v11);
    +[AssistantMetrics didEnableSiriConfirmed:source:](AssistantMetrics, "didEnableSiriConfirmed:source:", 1, CFSTR("HeySiri"));
  }
  else if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(WeakRetained, "setHardwareButtonTrigger:forSpecifier:", MEMORY[0x24BDBD1C8], *(_QWORD *)(a1 + 40));
    v12 = WeakRetained[180];
    WeakRetained[180] = 0;

    +[AssistantMetrics didEnableSiriConfirmed:source:](AssistantMetrics, "didEnableSiriConfirmed:source:", 1, CFSTR("HardwareButton"));
  }
  else
  {
    v19 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  if (*(_BYTE *)(a1 + 56))
  {
    if ((v10 & 1) != 0)
      goto LABEL_22;
    goto LABEL_18;
  }
  if (*(_BYTE *)(a1 + 57))
    v13 = 0;
  else
    v13 = v10;
  if ((v13 & 1) == 0)
  {
LABEL_18:
    if (objc_msgSend(WeakRetained[189], "shouldShowSiriDataSharingOptInView"))
    {
      objc_msgSend(WeakRetained[189], "dataSharingOptInTextWelcomeControllerForViewStyle:", 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = WeakRetained[190];
      WeakRetained[190] = (id)v14;

      objc_msgSend(WeakRetained[190], "navigationItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHidesBackButton:", 1);

      v17 = WeakRetained[190];
      if (v17)
      {
        objc_msgSend(WeakRetained[198], "pushViewController:animated:", v17, 1);
      }
      else
      {
        v27 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_cold_1(v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    else
    {
      v18 = WeakRetained[198];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_413;
      v35[3] = &unk_24D33CBB8;
      objc_copyWeak(&v36, (id *)(a1 + 48));
      objc_msgSend(v18, "dismissViewControllerAnimated:completion:", 1, v35);
      objc_destroyWeak(&v36);
    }
  }
LABEL_22:

}

void __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_413(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_runEnablementFlowDismissalHandlersIfApplicable");

}

- (id)_createVoiceSelectionDismissalHandlerWithSpecifier:(id)a3 actionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__AssistantController__createVoiceSelectionDismissalHandlerWithSpecifier_actionHandler___block_invoke;
  v12[3] = &unk_24D33D538;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v10;
}

void __88__AssistantController__createVoiceSelectionDismissalHandlerWithSpecifier_actionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  _QWORD *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[199];
    WeakRetained[199] = 0;
    v13 = WeakRetained;

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "assistantIsEnabled");

    if ((v5 & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 40);
      if (!v6)
      {
LABEL_10:
        v12 = (void *)v13[197];
        v13[197] = 0;

        WeakRetained = v13;
        goto LABEL_11;
      }
      v7 = *(void (**)(void))(v6 + 16);
    }
    else
    {
      v8 = v13;
      v9 = (void *)v13[197];
      if (v9)
      {
        objc_msgSend(v9, "completionLoggingBlock");
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v10[2](v10, 0);

        v8 = v13;
      }
      objc_msgSend(v8, "assistantEnabledCancelled:", *(_QWORD *)(a1 + 32));
      v11 = *(_QWORD *)(a1 + 40);
      if (!v11)
        goto LABEL_10;
      v7 = *(void (**)(void))(v11 + 16);
    }
    v7();
    goto LABEL_10;
  }
LABEL_11:

}

- (id)isShowInSpotlightEnabled
{
  uint64_t v3;

  if ((-[NSMutableSet containsObject:](self->_disabledSpotlightDomains, "containsObject:", CFSTR("DOMAIN_ZKWS")) & 1) != 0)
    v3 = 0;
  else
    v3 = -[NSMutableSet containsObject:](self->_disabledSpotlightDomains, "containsObject:", CFSTR("DOMAIN_PARSEC")) ^ 1;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
}

- (void)setShowInSpotlightEnabled:(id)a3
{
  id v4;
  int v5;
  NSMutableSet *disabledSpotlightDomains;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "intValue");
  disabledSpotlightDomains = self->_disabledSpotlightDomains;
  if (v5)
  {
    -[NSMutableSet removeObject:](disabledSpotlightDomains, "removeObject:", CFSTR("DOMAIN_ZKWS"));
    -[NSMutableSet removeObject:](self->_disabledSpotlightDomains, "removeObject:", CFSTR("DOMAIN_PARSEC"));
  }
  else
  {
    -[NSMutableSet addObject:](disabledSpotlightDomains, "addObject:", CFSTR("DOMAIN_ZKWS"));
    -[NSMutableSet addObject:](self->_disabledSpotlightDomains, "addObject:", CFSTR("DOMAIN_PARSEC"));
  }
  -[AssistantController saveSpotlightSettings](self, "saveSpotlightSettings");
  v7 = objc_msgSend(v4, "BOOLValue");

  +[AssistantMetrics didToggle:on:](AssistantMetrics, "didToggle:on:", CFSTR("Search"), v7);
}

- (id)isShowZKWSuggestionsEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSpotlightZKWEnabled"), CFSTR("com.apple.suggestions"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return (id)objc_msgSend(v3, "numberWithBool:", v6);
}

- (void)setShowZKWSuggestionsEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = objc_msgSend(a3, "BOOLValue");
  CFPreferencesSetAppValue(CFSTR("SuggestionsSpotlightZKWEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4), CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);
}

- (id)isShowZKWRecentsEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSpotlightZKWRecentsEnabled"), CFSTR("com.apple.suggestions"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return (id)objc_msgSend(v3, "numberWithBool:", v6);
}

- (void)setShowZKWRecentsEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = objc_msgSend(a3, "BOOLValue");
  CFPreferencesSetAppValue(CFSTR("SuggestionsSpotlightZKWRecentsEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4), CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);
}

- (id)isShowInAppLibraryEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return (id)objc_msgSend(v3, "numberWithBool:", v6);
}

- (void)setShowInAppLibraryEnabled:(id)a3 forSpecifier:(id)a4
{
  id v4;
  uint64_t v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "BOOLValue");
  CFPreferencesSetAppValue(CFSTR("SuggestionsAppLibraryEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5), CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);
  v7 = objc_msgSend(v4, "BOOLValue");

  +[AssistantMetrics didToggle:on:](AssistantMetrics, "didToggle:on:", CFSTR("HomeScreen"), v7);
}

- (id)isShowWhenSharingEnabled:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.Sharing"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SharingPeopleSuggestionsDisabled")) ^ 1;

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
}

- (void)setShowWhenSharingEnabled:(id)a3 forSpecifier:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BDBCF50];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithSuiteName:", CFSTR("com.apple.Sharing"));
  LODWORD(v4) = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v6, "setBool:forKey:", v4 ^ 1, CFSTR("SharingPeopleSuggestionsDisabled"));
}

- (id)isShowWhenListeningEnabled:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("ShowWhenListeningEnabled"), CFSTR("com.apple.suggestions"));
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1C8];
  v5 = v3;

  return v5;
}

- (void)setShowWhenListeningEnabled:(id)a3 forSpecifier:(id)a4
{
  __CFNotificationCenter *DarwinNotifyCenter;

  CFPreferencesSetAppValue(CFSTR("ShowWhenListeningEnabled"), a3, CFSTR("com.apple.suggestions"));
  CFPreferencesSynchronize(CFSTR("com.apple.suggestions"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);
}

- (void)resetZKWHiddenSuggestions:(id)a3
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "clearHiddenSuggestions");

}

- (id)assistantEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[AssistantUtilities assistantEnabled](AssistantUtilities, "assistantEnabled", a3));
}

- (void)assistantEnabledConfirmed:(id)a3
{
  id v4;
  AFEnablementConfiguration *enablementConfiguration;
  void (**v6)(id, uint64_t);

  v4 = a3;
  objc_msgSend(v4, "setConfirmationAction:", 0);
  objc_msgSend(v4, "setConfirmationCancelAction:", 0);

  -[AssistantController setAssistantEnabled:](self, "setAssistantEnabled:", 1);
  -[AssistantController _runVoiceTriggerEnablementCompletionIfApplicable](self, "_runVoiceTriggerEnablementCompletionIfApplicable");
  enablementConfiguration = self->_enablementConfiguration;
  if (enablementConfiguration)
  {
    -[AFEnablementConfiguration completionLoggingBlock](enablementConfiguration, "completionLoggingBlock");
    v6 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 1);

  }
}

- (void)assistantEnabledCancelled:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE759A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:animated:", 0, 1);
  objc_msgSend(v7, "setConfirmationAction:", 0);
  objc_msgSend(v7, "setConfirmationCancelAction:", 0);
  -[AssistantController setAssistantEnabled:](self, "setAssistantEnabled:", 0);
  -[AssistantController _runVoiceTriggerEnablementCompletionIfApplicable](self, "_runVoiceTriggerEnablementCompletionIfApplicable");
  if (-[AssistantController _isCurrentSpecifierVoiceActivation](self, "_isCurrentSpecifierVoiceActivation"))
  {
    +[AssistantMetrics didEnableSiriConfirmed:source:](AssistantMetrics, "didEnableSiriConfirmed:source:", 0, CFSTR("HeySiri"));
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("ACTIVATION_LONG_PRESS_ID")))
      v6 = CFSTR("HardwareButton");
    else
      v6 = CFSTR("Unknown");
    +[AssistantMetrics didEnableSiriConfirmed:source:](AssistantMetrics, "didEnableSiriConfirmed:source:", 0, v6);

  }
}

- (void)assistantDisabledConfirmed:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  PSSpecifier *currentSiriActivationSpecifier;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setConfirmationAction:", 0);
  objc_msgSend(v9, "setConfirmationCancelAction:", 0);
  -[AssistantController setAssistantEnabled:](self, "setAssistantEnabled:", 0);
  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteAllVoiceProfilesForAppDomain:", *MEMORY[0x24BEAFEC0]);

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVoiceTriggerEnabled:", 0);

  if (+[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier](AssistantUtilities, "shouldShowCompactVoiceTriggerSpecifier"))
  {
    v6 = CFSTR("ACTIVATION_COMPACT_ID");
  }
  else
  {
    v6 = CFSTR("ACTIVATION");
  }
  -[AssistantController reloadSpecifierID:](self, "reloadSpecifierID:", v6);
  if (-[AssistantController _isCurrentSpecifierVoiceActivation](self, "_isCurrentSpecifierVoiceActivation"))
  {
    -[AssistantController setVoiceTrigger:forSpecifier:](self, "setVoiceTrigger:forSpecifier:", MEMORY[0x24BDBD1C0], v9);
    v7 = CFSTR("HeySiri");
  }
  else
  {
    -[AssistantController setHardwareButtonTrigger:forSpecifier:](self, "setHardwareButtonTrigger:forSpecifier:", MEMORY[0x24BDBD1C0], v9);
    currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
    self->_currentSiriActivationSpecifier = 0;

    v7 = CFSTR("HardwareButton");
  }
  +[AssistantMetrics didDisableSiriConfirmed:source:](AssistantMetrics, "didDisableSiriConfirmed:source:", 1, v7);
  -[AssistantController _runVoiceTriggerEnablementCompletionIfApplicable](self, "_runVoiceTriggerEnablementCompletionIfApplicable");
  if (_AXSHomeButtonAssistant() == 2)
    _AXSSetHomeButtonAssistant();

}

- (void)assistantDisabledCancelled:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE759A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:animated:", 1, 1);
  objc_msgSend(v7, "setConfirmationAction:", 0);
  objc_msgSend(v7, "setConfirmationCancelAction:", 0);
  -[AssistantController setAssistantEnabled:](self, "setAssistantEnabled:", 1);
  -[AssistantController _runVoiceTriggerEnablementCompletionIfApplicable](self, "_runVoiceTriggerEnablementCompletionIfApplicable");
  if (-[AssistantController _isCurrentSpecifierVoiceActivation](self, "_isCurrentSpecifierVoiceActivation"))
  {
    +[AssistantMetrics didDisableSiriConfirmed:source:](AssistantMetrics, "didDisableSiriConfirmed:source:", 0, CFSTR("HeySiri"));
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("ACTIVATION_LONG_PRESS_ID")))
      v6 = CFSTR("HardwareButton");
    else
      v6 = CFSTR("Unknown");
    +[AssistantMetrics didDisableSiriConfirmed:source:](AssistantMetrics, "didDisableSiriConfirmed:source:", 0, v6);

  }
}

- (void)setAssistantLanguage:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLanguageCode:", v4);

  if (objc_msgSend((id)objc_opt_class(), "_heySiriSupportedForLanguage:", v4))
    VSPreferencesSetSpokenLanguageIdentifier();

}

- (void)setAssistantLanguage:(id)a3 forSpecifier:(id)a4
{
  NSString *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSString *pendingLanguage;
  NSString *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = (NSString *)a3;
  v7 = a4;
  +[AssistantUtilities assistantLanguage](AssistantUtilities, "assistantLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__AssistantController_setAssistantLanguage_forSpecifier___block_invoke;
  v13[3] = &unk_24D33D0E8;
  v13[4] = self;
  v14 = v8;
  v15 = v7;
  v9 = v7;
  v10 = v8;
  -[AssistantController registerUndoActionWithKey:urlString:undoAction:](self, "registerUndoActionWithKey:urlString:undoAction:", CFSTR("LANGUAGE"), CFSTR("prefs:root=SIRI&path=LANGUAGE_ID"), v13);
  pendingLanguage = self->_pendingLanguage;
  self->_pendingLanguage = v6;
  v12 = v6;

  -[AssistantController _setAssistantLanguage:forSpecifier:](self, "_setAssistantLanguage:forSpecifier:", self->_pendingLanguage, v9);
}

uint64_t __57__AssistantController_setAssistantLanguage_forSpecifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setAssistantLanguage:forSpecifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)_setAssistantLanguage:(id)a3 forSpecifier:(id)a4
{
  if (-[AssistantController _isIncompatibleWithWatchLanguage:](self, "_isIncompatibleWithWatchLanguage:", self->_pendingLanguage, a4))
  {
    -[AssistantController _showIncompatibleWatchLanguageAlert](self, "_showIncompatibleWatchLanguageAlert");
  }
  else
  {
    -[AssistantController _setAssistantLanguageWatchMismatchConfirmed:](self, "_setAssistantLanguageWatchMismatchConfirmed:", 0);
  }
}

- (BOOL)_isIncompatibleWithWatchLanguage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL4 v7;

  v4 = a3;
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPaired");

  if (v6)
    v7 = !-[AssistantController watchSupportsSiriLanguageCode:](self, "watchSupportsSiriLanguageCode:", v4);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)_languageWillDisableHeySiri:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_heySiriSupportedForLanguage:", v4))
  {
    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    -[AssistantController assistantLanguage:](self, "assistantLanguage:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend((id)v5, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v6);

    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v8, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v4);

    v9 = v7 & (v5 ^ 1);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isHeySiriAlwaysOn
{
  return MGGetBoolAnswer();
}

- (void)_showIncompatibleWatchLanguageAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AssistantController *v18;
  id v19;

  objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConfirmationAction:", sel__setAssistantLanguageConfirmed_);
  objc_msgSend(v19, "setConfirmationCancelAction:", sel__setAssistantLanguageCancelled_);
  objc_msgSend(MEMORY[0x24BEA85B0], "assistantLanguageTitlesDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self;
  objc_msgSend(v3, "objectForKeyedSubscript:", self->_pendingLanguage);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    +[AssistantController bundle](AssistantController, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_WATCH_LANGUAGE_WARNING"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_WATCH_GENERIC_LANGUAGE_WARNING"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v9 = (void *)MEMORY[0x24BDBCE70];
  +[AssistantController bundle](AssistantController, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_WATCH_LANGUAGE_OK"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE75990];
  v13 = *MEMORY[0x24BE75988];
  +[AssistantController bundle](AssistantController, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_WATCH_LANGUAGE_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v11, v12, v8, v13, v15, *MEMORY[0x24BE75970], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setupWithDictionary:", v16);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController showConfirmationViewForSpecifier:useAlert:swapAlertButtons:](v18, "showConfirmationViewForSpecifier:useAlert:swapAlertButtons:", v19, objc_msgSend(v17, "sf_isiPad"), 0);

}

- (void)_showWillDisableAlertWillDisableHeySiri:(BOOL)a3 disableMultiUser:(BOOL)a4 disableSpokenFeedbackOnWatch:(BOOL)a5
{
  void *v6;
  id v7;

  -[AssistantController confirmationSpecifierWillDisableHeySiri:disableMultiUser:disableSpokenFeedbackOnWatch:](self, "confirmationSpecifierWillDisableHeySiri:disableMultiUser:disableSpokenFeedbackOnWatch:", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController showConfirmationViewForSpecifier:useAlert:swapAlertButtons:](self, "showConfirmationViewForSpecifier:useAlert:swapAlertButtons:", v7, objc_msgSend(v6, "sf_isiPad"), 0);

}

- (id)confirmationSpecifierWillDisableHeySiri:(BOOL)a3 disableMultiUser:(BOOL)a4 disableSpokenFeedbackOnWatch:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  _QWORD v26[5];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v26[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConfirmationAction:", sel__setAssistantLanguageHeySiriDisableConfirmed_);
  objc_msgSend(v9, "setConfirmationCancelAction:", sel__setAssistantLanguageCancelled_);
  -[AssistantController specifierForID:](self, "specifierForID:", CFSTR("LANGUAGE_ID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", self->_pendingLanguage);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AssistantController confirmationSpecifierWillDisableHeySiri:disableMultiUser:disableSpokenFeedbackOnWatch:].cold.1();
    v12 = &stru_24D33E0B0;
  }
  -[AssistantController _confirmationPromptDisableHeySiri:disableMultiUser:disableSpokenFeedback:](self, "_confirmationPromptDisableHeySiri:disableMultiUser:disableSpokenFeedback:", v7, v6, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[AssistantController bundle](AssistantController, "bundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_WATCH_LANGUAGE_CHANGE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[AssistantController bundle](AssistantController, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_WATCH_LANGUAGE_CHANGE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[AssistantController bundle](AssistantController, "bundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_WATCH_LANGUAGE_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x24BE75988];
  v25[0] = *MEMORY[0x24BE75990];
  v25[1] = v21;
  v26[0] = v16;
  v26[1] = v14;
  v22 = *MEMORY[0x24BE75970];
  v25[2] = *MEMORY[0x24BE75980];
  v25[3] = v22;
  v26[2] = v18;
  v26[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupWithDictionary:", v23);

  return v9;
}

- (BOOL)_pairedWithSiriSpeaksEnabledNanoHardware
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("BFF435BD-ACFF-4AD8-9CC4-4DEA6D51BB3A"));
        LOBYTE(v8) = objc_msgSend(v8, "supportsCapability:", v9);

        if ((v8 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_setAssistantLanguageWatchMismatchConfirmed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  AFSettingsConnection *AFSettingsConnection;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", self->_pendingLanguage);

  if (v7)
  {
    -[AssistantController _setAssistantLanguageConfirmed:](self, "_setAssistantLanguageConfirmed:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    AFSettingsConnection = self->_AFSettingsConnection;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke;
    v9[3] = &unk_24D33D588;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    -[AFSettingsConnection fetchSupportedMultiUserLanguageCodes:](AFSettingsConnection, "fetchSupportedMultiUserLanguageCodes:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2;
  v9[3] = &unk_24D33D560;
  v10 = v6;
  v7 = v6;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

void __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2(uint64_t a1)
{
  os_log_t *v2;
  id *WeakRetained;
  id *v4;
  _BOOL8 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (*(_QWORD *)(a1 + 32) && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2_cold_2();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[174])
    {
      v5 = objc_msgSend(WeakRetained[203], "count")
        && (objc_msgSend(v4[203], "containsObject:", v4[174]) & 1) == 0
        && *((_BYTE *)v4 + 1632) != 0;
      v14 = v5 | objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4[174]) ^ 1;
      v15 = *v2;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)MEMORY[0x24BDD16E0];
        v17 = v15;
        objc_msgSend(v16, "numberWithBool:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 136315650;
        v23 = "-[AssistantController _setAssistantLanguageWatchMismatchConfirmed:]_block_invoke";
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_2153F2000, v17, OS_LOG_TYPE_DEFAULT, "%s #settings Multi user enabled fetch complete. State for current language: %@ (home:%@)", (uint8_t *)&v22, 0x20u);

      }
      v20 = objc_msgSend(v4, "_languageWillDisableHeySiri:", v4[174]);
      if ((AFGryphonAssetsExistForLanguage() & 1) != 0)
        v21 = 0;
      else
        v21 = objc_msgSend(v4, "_pairedWithSiriSpeaksEnabledNanoHardware");
      if (+[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision")
        || (v20 | v14 | v21) != 1)
      {
        objc_msgSend(v4, "_setAssistantLanguageConfirmed:", *(_QWORD *)(a1 + 48));
      }
      else
      {
        objc_msgSend(v4, "_showWillDisableAlertWillDisableHeySiri:disableMultiUser:disableSpokenFeedbackOnWatch:", v20, v14, v21);
      }
    }
    else
    {
      v6 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
        __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

}

- (id)_confirmationPromptDisableHeySiri:(BOOL)a3 disableMultiUser:(BOOL)a4 disableSpokenFeedback:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  int v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v42 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    v10 = v8;
    objc_msgSend(v9, "numberWithBool:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 136315906;
    v35 = "-[AssistantController _confirmationPromptDisableHeySiri:disableMultiUser:disableSpokenFeedback:]";
    v36 = 2112;
    v37 = v11;
    v38 = 2112;
    v39 = v12;
    v40 = 2112;
    v41 = v13;
    _os_log_impl(&dword_2153F2000, v10, OS_LOG_TYPE_DEFAULT, "%s disableHeySiri:%@ disableMultiUser:%@, disableSpokenFeedback:%@", (uint8_t *)&v34, 0x2Au);

  }
  v14 = !v7 || v6;
  if (v14 || v5)
  {
    v18 = !v7 || !v6;
    if (v18 || v5)
    {
      v19 = !v5;
      if (v14 || !v5)
      {
        if (v18 || v19)
        {
          v20 = !v6 || v7;
          if (v20 || v5)
          {
            if (v20 || v19)
            {
              if (v7 || v6 || v19)
              {
                v21 = 0;
                goto LABEL_22;
              }
              +[AssistantController bundle](AssistantController, "bundle");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              v17 = CFSTR("ASSISTANT_SPOKENFEEDBACK_DISABLE_WARNING");
            }
            else
            {
              +[AssistantController bundle](AssistantController, "bundle");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              v17 = CFSTR("ASSISTANT_MULTIUSER_SPOKENFEEDBACK_DISABLE_WARNING");
            }
          }
          else
          {
            +[AssistantController bundle](AssistantController, "bundle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            v17 = CFSTR("ASSISTANT_MULTIUSER_DISABLE_WARNING");
          }
        }
        else
        {
          +[AssistantController bundle](AssistantController, "bundle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("ASSISTANT_HEYSIRI_MULTIUSER_SPOKENFEEDBACK_DISABLE_WARNING");
        }
      }
      else
      {
        +[AssistantController bundle](AssistantController, "bundle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("ASSISTANT_HEYSIRI_SPOKENFEEDBACK_DISABLE_WARNING");
      }
    }
    else
    {
      +[AssistantController bundle](AssistantController, "bundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("ASSISTANT_HEYSIRI_MULTIUSER_DISABLE_WARNING");
    }
  }
  else
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("ASSISTANT_HEYSIRI_DISABLE_WARNING");
  }
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "activeEnabled");

  if (v23)
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_GM_LANGUAGE_WARNING"), &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

    objc_msgSend(v25, "stringByAppendingString:", v21);
    v32 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v32;
    return v21;
  }
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "onWaitlist");

  if (v27)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v24, "sf_isiPad");
    +[AssistantController bundle](AssistantController, "bundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
      v31 = CFSTR("ASSISTANT_GM_LANGUAGE_WARNING_WAITLIST_IPAD");
    else
      v31 = CFSTR("ASSISTANT_GM_LANGUAGE_WARNING_WAITLIST_IPHONE");
    objc_msgSend(v29, "localizedStringForKey:value:table:", v31, &stru_24D33E0B0, CFSTR("AssistantSettings-GM"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  return v21;
}

- (void)_setAssistantLanguageHeySiriDisableConfirmed:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSArray count](self->_languagesInHome, "count")
    && !-[NSArray containsObject:](self->_languagesInHome, "containsObject:", self->_pendingLanguage)
    && self->_thisIsMeDevice)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[AssistantController _setAssistantLanguageHeySiriDisableConfirmed:]";
      _os_log_impl(&dword_2153F2000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings Turning off recognize my voice in the home due to language change", (uint8_t *)&v6, 0xCu);
    }
    -[AFSettingsConnection setRecognizeMyVoiceEnabled:](self->_AFSettingsConnection, "setRecognizeMyVoiceEnabled:", 0);
  }
  -[AssistantController _setAssistantLanguageConfirmed:](self, "_setAssistantLanguageConfirmed:", v4);

}

- (void)_setAssistantLanguageConfirmed:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *pendingLanguage;

  -[AssistantController multilingualResponseLanguageVariants](self, "multilingualResponseLanguageVariants", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", self->_pendingLanguage);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMultilingualResponseEnabled:forLanguage:", -[AssistantController selectedLanguageWantsMultilingualEnabled](self, "selectedLanguageWantsMultilingualEnabled"), self->_pendingLanguage);

  }
  -[AssistantController setAssistantLanguage:](self, "setAssistantLanguage:", self->_pendingLanguage);
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVoiceTriggerEnabled:", objc_msgSend(v8, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, self->_pendingLanguage));

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController reloadSpecifier:](self, "reloadSpecifier:", v9);

  -[AssistantController reloadSpecifiers](self, "reloadSpecifiers");
  -[AssistantController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("ACTIVATION"));
  -[AssistantController _updateSpecifiersForLanguage:](self, "_updateSpecifiersForLanguage:", self->_pendingLanguage);
  pendingLanguage = self->_pendingLanguage;
  self->_pendingLanguage = 0;

}

- (void)_setAssistantLanguageCancelled:(id)a3
{
  void *v4;
  NSString *pendingLanguage;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController reloadSpecifier:](self, "reloadSpecifier:", v4);

  -[AssistantController reloadSpecifiers](self, "reloadSpecifiers");
  pendingLanguage = self->_pendingLanguage;
  self->_pendingLanguage = 0;

}

- (NSArray)multilingualResponseLanguageVariants
{
  return (NSArray *)&unk_24D3485E8;
}

- (id)detailTextForLanguageSpecifierFromTitles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[AssistantController assistantLanguage:](self, "assistantLanguage:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE091E0], "isMultilingualResponseVariantSelectorEnabled"))
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "multilingualResponseEnabledForLanguage:", v5);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MULTILINGUAL_DETAIL_TOP_LEVEL_MIXED_%@"), v5, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[AssistantController bundle](AssistantController, "bundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && (objc_msgSend(v10, "isEqualToString:", v8) & 1) == 0)
      {

        goto LABEL_7;
      }

    }
  }
  objc_msgSend(v4, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

- (id)assistantVoiceLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputVoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isFlexibleFollowupsSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE282E0], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFlexibleFollowupsSupported");

  return v3;
}

- (void)didAcceptEnteredPIN
{
  -[AssistantController _setAccessibleFromLockScreen:](self, "_setAccessibleFromLockScreen:", 1);
}

- (void)didCancelEnteringPIN
{
  id v2;

  -[PSSpecifier propertyForKey:](self->_lockScreenSpecifier, "propertyForKey:", *MEMORY[0x24BE759A0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOn:animated:", 0, 1);

}

- (id)accessibleFromLockScreen:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "disableAssistantWhilePasscodeLocked") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setAccessibleFromLockScreen:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  id v7;
  int v8;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  BOOL v35;
  id location;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE0FE98]);
  v6 = objc_msgSend(v5, "effectiveGlobalSpokenNotificationSetting");
  v7 = objc_alloc_init(MEMORY[0x24BEB4A40]);
  if (!objc_msgSend(v7, "announceCalls"))
  {
    v10 = 0;
    if (v6 != 2)
      goto LABEL_14;
LABEL_11:
    +[AssistantController bundle](AssistantController, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_LOCK_SCREEN_DISABLE_ANNOUNCE_MESSAGES"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_15;
  }
  v8 = _os_feature_enabled_impl();
  if (v6 == 2 && v8 != 0)
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("ASSISTANT_LOCK_SCREEN_DISABLE_ANNOUNCE_CALLS_MESSAGES");
LABEL_12:
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    goto LABEL_13;
  }
  v10 = v8;
  if (v6 == 2)
    goto LABEL_11;
  if (v8)
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("ASSISTANT_LOCK_SCREEN_DISABLE_ANNOUNCE_CALLS");
    goto LABEL_12;
  }
LABEL_14:
  v11 = 0;
LABEL_15:
  if (v6 == 2)
    v15 = 1;
  else
    v15 = v10;
  if (v15 != 1 || v3)
  {
    -[AssistantController setDisabledFromLockScreen:](self, "setDisabledFromLockScreen:", !v3);
  }
  else
  {
    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x24BEBD3A8];
    +[AssistantController bundle](AssistantController, "bundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_LOCK_SCREEN_DISABLE_OK"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __52__AssistantController__setAccessibleFromLockScreen___block_invoke;
    v31[3] = &unk_24D33D5B0;
    objc_copyWeak(&v34, &location);
    v35 = v3;
    v32 = v5;
    v33 = v7;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x24BEBD3A8];
    +[AssistantController bundle](AssistantController, "bundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_LOCK_SCREEN_DISABLE_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v19;
    v29[1] = 3221225472;
    v29[2] = __52__AssistantController__setAccessibleFromLockScreen___block_invoke_2;
    v29[3] = &unk_24D33CB68;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 1, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BEBD3B0];
    +[AssistantController bundle](AssistantController, "bundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_LOCK_SCREEN_DISABLE_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v27, v11, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "addAction:", v20);
    objc_msgSend(v28, "addAction:", v24);
    -[AssistantController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v28, 1, 0);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

  }
}

void __52__AssistantController__setAccessibleFromLockScreen___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setDisabledFromLockScreen:", *(_BYTE *)(a1 + 56) == 0);
  objc_msgSend(*(id *)(a1 + 32), "setEffectiveGlobalSpokenNotificationSetting:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setAnnounceCalls:", 0);

}

void __52__AssistantController__setAccessibleFromLockScreen___block_invoke_2(uint64_t a1)
{
  void *v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[181], "propertyForKey:", *MEMORY[0x24BE759A0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOn:animated:", 1, 1);

}

- (void)setAccessibleFromLockScreen:(id)a3 forSpecifier:(id)a4
{
  objc_class *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v7, *MEMORY[0x24BE75C60]);

    objc_msgSend(v8, "setEditPaneClass:", objc_opt_class());
    objc_msgSend(v8, "setProperty:forKey:", &unk_24D3485D0, *MEMORY[0x24BE75E18]);
    -[AssistantController showPINSheet:allowOptionsButton:](self, "showPINSheet:allowOptionsButton:", v8, 1);
  }
  else
  {
    -[AssistantController _setAccessibleFromLockScreen:](self, "_setAccessibleFromLockScreen:", 0);
  }

}

- (void)setDisabledFromLockScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disableAssistantWhilePasscodeLocked");

  if (v5 != v3)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisableAssistantWhilePasscodeLocked:", v3);

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronize");

  }
  +[AssistantMetrics didToggle:on:](AssistantMetrics, "didToggle:on:", CFSTR("Lockscreen"), v3 ^ 1);
}

- (void)setVoiceTrigger:(id)a3 forSpecifier:(id)a4
{
  -[AssistantController setVoiceTrigger:forSpecifier:transitionWithNavControllerIfNecessary:](self, "setVoiceTrigger:forSpecifier:transitionWithNavControllerIfNecessary:", a3, a4, 0);
}

- (void)setVoiceTrigger:(id)a3 forSpecifier:(id)a4 transitionWithNavControllerIfNecessary:(id)a5
{
  id v9;
  uint64_t v10;
  _BOOL4 v11;
  VTUIEnrollTrainingViewController *v12;
  VTUIEnrollTrainingViewController *enrollmentController;
  uint64_t v14;
  id v15;

  v15 = a4;
  v9 = a5;
  v10 = objc_msgSend(a3, "BOOLValue");
  if (!+[AssistantUtilities assistantEnabled](AssistantUtilities, "assistantEnabled"))
  {
    if (!(_DWORD)v10)
    {
      +[AssistantUtilities disableVoiceTriggerAndSiriEnrollmentForCurrentLanguage](AssistantUtilities, "disableVoiceTriggerAndSiriEnrollmentForCurrentLanguage");
      goto LABEL_13;
    }
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
    v14 = MEMORY[0x24BDBD1C8];
LABEL_15:
    -[AssistantController _setAssistantEnabled:forSpecifier:presentingViewController:actionHandler:](self, "_setAssistantEnabled:forSpecifier:presentingViewController:actionHandler:", v14, v15, self, 0);
    goto LABEL_16;
  }
  v11 = +[AssistantUtilities isHardwareButtonTrigger](AssistantUtilities, "isHardwareButtonTrigger");
  if (!(_DWORD)v10)
  {
    if (v11)
    {
      +[AssistantUtilities disableVoiceTriggerAndSiriEnrollmentForCurrentLanguage](AssistantUtilities, "disableVoiceTriggerAndSiriEnrollmentForCurrentLanguage");
      -[AssistantController _reloadSiriInCallSpecifier](self, "_reloadSiriInCallSpecifier");
LABEL_13:
      -[AssistantController _runVoiceTriggerEnablementCompletionIfApplicable](self, "_runVoiceTriggerEnablementCompletionIfApplicable");
      goto LABEL_16;
    }
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
    v14 = MEMORY[0x24BDBD1C0];
    goto LABEL_15;
  }
  if (!v11)
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
  if (!+[AssistantUtilities needsTrainingData:](AssistantUtilities, "needsTrainingData:", 1))
  {
    +[AssistantUtilities enableVoiceTrigger](AssistantUtilities, "enableVoiceTrigger");
    goto LABEL_13;
  }
  getVTUIEnrollTrainingViewControllerClass();
  v12 = (VTUIEnrollTrainingViewController *)objc_opt_new();
  enrollmentController = self->_enrollmentController;
  self->_enrollmentController = v12;

  -[VTUIEnrollTrainingViewController setDelegate:](self->_enrollmentController, "setDelegate:", self);
  +[AssistantUtilities disableVoiceTrigger](AssistantUtilities, "disableVoiceTrigger");
  -[AssistantController startEnrollment:](self, "startEnrollment:", v9);
LABEL_16:
  +[AssistantMetrics didToggle:on:](AssistantMetrics, "didToggle:on:", CFSTR("HeySiri"), v10);

}

- (void)startEnrollment:(id)a3
{
  void *v4;
  PSVoiceTriggerRootController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  if (a3)
  {
    objc_msgSend(a3, "pushViewController:animated:", self->_enrollmentController, 1);
    -[VTUIEnrollTrainingViewController navigationItem](self->_enrollmentController, "navigationItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelSetup_);
    objc_msgSend(v10, "setLeftBarButtonItem:", v4);

  }
  else
  {
    v5 = -[PSRootController initWithRootViewController:]([PSVoiceTriggerRootController alloc], "initWithRootViewController:", self->_enrollmentController);
    -[PSVoiceTriggerRootController navigationBar](v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setHidesShadow:", 1);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "setBackgroundImage:forBarMetrics:", v7, 0);

    -[VTUIEnrollTrainingViewController navigationItem](self->_enrollmentController, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelSetup_);
    objc_msgSend(v8, "setLeftBarButtonItem:", v9);

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__AssistantController_startEnrollment___block_invoke;
    v11[3] = &unk_24D33CBE0;
    v11[4] = self;
    -[AssistantController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, v11);

  }
}

uint64_t __39__AssistantController_startEnrollment___block_invoke(uint64_t a1)
{
  const __CFString *v2;

  if (+[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier](AssistantUtilities, "shouldShowCompactVoiceTriggerSpecifier"))
  {
    v2 = CFSTR("ACTIVATION_COMPACT_ID");
  }
  else
  {
    v2 = CFSTR("ACTIVATION");
  }
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:", v2);
}

- (void)_handleDelayedDeeplink
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2153F2000, v0, OS_LOG_TYPE_DEBUG, "%s Handling delayed deeplink. %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v16;
  objc_super v17;

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  -[AssistantController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_storeStrong((id *)&self->_delayedDeeplinkResource, a3);
    v12 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      -[AssistantController handleURL:withCompletion:].cold.1(v12);
      if (!v8)
        goto LABEL_20;
    }
    else if (!v8)
    {
      goto LABEL_20;
    }
    v8[2](v8);
    goto LABEL_20;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("shortcutsBundleID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("heysirisetupflow")))
  {
    -[AssistantController setVoiceTrigger:forSpecifier:](self, "setVoiceTrigger:forSpecifier:", MEMORY[0x24BDBD1C8], 0);
    if (v8)
      v8[2](v8);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("buddyFlowSetup")))
  {
    -[AssistantController handleBuddyFlow](self, "handleBuddyFlow");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("gmCFU")))
  {
    -[AssistantController handleGmCFU](self, "handleGmCFU");
  }
  else if (v11)
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isInstalled");

    if (v15)
    {
      v17.receiver = self;
      v17.super_class = (Class)AssistantController;
      -[AssistantController handleURL:withCompletion:](&v17, sel_handleURL_withCompletion_, v7, v8);
    }
    else
    {
      -[AssistantController loadAppStorePageForBundleId:](self, "loadAppStorePageForBundleId:", v11);
      if (v8)
        v8[2](v8);
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)AssistantController;
    -[AssistantController handleURL:withCompletion:](&v16, sel_handleURL_withCompletion_, v7, v8);
  }

LABEL_20:
}

- (void)loadAppStorePageForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BE08060];
  objc_msgSend(MEMORY[0x24BE081E0], "bagKeySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfileVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerBagKeySet:forProfile:profileVersion:", v6, v7, v8);

  v9 = (void *)MEMORY[0x24BE08050];
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfileVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bagForProfile:profileVersion:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x24BE081E0]);
  v14 = (void *)objc_msgSend(v13, "initWithBag:caller:keyProfile:", v12, v4, *MEMORY[0x24BE07E40]);
  v22[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performLookupWithBundleIdentifiers:itemIdentifiers:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__AssistantController_loadAppStorePageForBundleId___block_invoke;
  v18[3] = &unk_24D33D5D8;
  objc_copyWeak(&v20, &location);
  v17 = v4;
  v19 = v17;
  objc_msgSend(v16, "addFinishBlock:", v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __51__AssistantController_loadAppStorePageForBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v5, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_3();
    }
    else
    {
      v18 = *MEMORY[0x24BE08FB0];
      v19 = *MEMORY[0x24BE08FB0];
      if (v9)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = *(_QWORD *)(a1 + 32);
          v30 = 136315394;
          v31 = "-[AssistantController loadAppStorePageForBundleId:]_block_invoke";
          v32 = 2112;
          v33 = v20;
          _os_log_impl(&dword_2153F2000, v18, OS_LOG_TYPE_INFO, "%s Successfully retrieved store info for %@", (uint8_t *)&v30, 0x16u);
        }
        objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "productPageURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "openURL:withCompletionHandler:", v22, 0);

      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_2(v18, v23, v24, v25, v26, v27, v28, v29);
      }
    }

  }
  else
  {
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (void)showAssistantVoiceActivationController:(id)a3
{
  void *v4;
  AssistantActivationController *v5;

  v5 = objc_alloc_init(AssistantActivationController);
  -[AssistantActivationController setDelegate:](v5, "setDelegate:", self);
  -[AssistantController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void)handleBuddyFlow
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = +[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier](AssistantUtilities, "shouldShowCompactVoiceTriggerSpecifier");
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "setUserPreferredVoiceTriggerPhraseType:sender:deviceType:endpointId:", v3, self, 0, 0);

  v7 = objc_alloc_init(MEMORY[0x24BE754D0]);
  objc_msgSend(v7, "setName:", CFSTR("BUDDY_FLOW_CONFIRMATION"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantController setVoiceActivation:forSpecifier:withTrainingCompletionIfNecessary:](self, "setVoiceActivation:forSpecifier:withTrainingCompletionIfNecessary:", v6, v7, 0);

}

- (void)handleGmCFU
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  id v7;
  VTUIEnrollTrainingViewController *v8;
  VTUIEnrollTrainingViewController *enrollmentController;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceSupported");

  if ((v4 & 1) != 0)
  {
    v5 = +[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier](AssistantUtilities, "shouldShowCompactVoiceTriggerSpecifier");
    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "setUserPreferredVoiceTriggerPhraseType:sender:deviceType:endpointId:", v5, self, 0, 0);

    v8 = (VTUIEnrollTrainingViewController *)objc_msgSend(objc_alloc((Class)getVTUIEnrollTrainingViewControllerClass()), "init:", 7);
    enrollmentController = self->_enrollmentController;
    self->_enrollmentController = v8;

    -[VTUIEnrollTrainingViewController setDelegate:](self->_enrollmentController, "setDelegate:", self);
    -[AssistantController startEnrollment:](self, "startEnrollment:", 0);
    objc_msgSend(MEMORY[0x24BE17DD0], "setHasEngagedWithCFU:", 1);
    -[AssistantController clearGMCFU](self, "clearGMCFU");
  }
  else
  {
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[AssistantController handleGmCFU]";
      _os_log_impl(&dword_2153F2000, v10, OS_LOG_TYPE_INFO, "%s GM Deeplink was invoked from ineligible hardware. Bailing!", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)clearGMCFU
{
  -[GMSpecifierProvider clearCFU](self->_gmSpecifierProvider, "clearCFU");
}

- (void)setHardwareButtonTrigger:(id)a3 forSpecifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assistantIsEnabled");

  v9 = objc_msgSend(v11, "BOOLValue");
  if (v8)
  {
    if (v9 || -[AssistantController _isVoiceTriggerEnabled](self, "_isVoiceTriggerEnabled"))
      goto LABEL_7;
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
    v10 = MEMORY[0x24BDBD1C0];
LABEL_9:
    -[AssistantController _setAssistantEnabled:forSpecifier:presentingViewController:actionHandler:](self, "_setAssistantEnabled:forSpecifier:presentingViewController:actionHandler:", v10, v6, self, 0);
    goto LABEL_10;
  }
  if (v9)
  {
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
    v10 = MEMORY[0x24BDBD1C8];
    goto LABEL_9;
  }
LABEL_7:
  _AXSSetHomeButtonAssistant();
LABEL_10:
  +[AssistantMetrics didToggle:on:](AssistantMetrics, "didToggle:on:", CFSTR("HardwareButton"), objc_msgSend(v11, "BOOLValue"));

}

- (void)continueSetup
{
  void *v3;
  PSSpecifier *currentSiriActivationSpecifier;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVoiceTriggerEnabled:", 1);

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __36__AssistantController_continueSetup__block_invoke;
  v8 = &unk_24D33CBB8;
  objc_copyWeak(&v9, &location);
  -[AssistantController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &v5);
  -[AssistantController _runVoiceTriggerEnablementCompletionIfApplicable](self, "_runVoiceTriggerEnablementCompletionIfApplicable", v5, v6, v7, v8);
  if (-[AssistantController _isCurrentSpecifierVoiceActivation](self, "_isCurrentSpecifierVoiceActivation"))
    _AXSSetHomeButtonAssistant();
  currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
  self->_currentSiriActivationSpecifier = 0;

  +[AssistantMetrics didStartEnrollment:](AssistantMetrics, "didStartEnrollment:", 1);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __36__AssistantController_continueSetup__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_runEnablementFlowDismissalHandlersIfApplicable");
    v2 = (void *)v3[188];
    v3[188] = 0;

    WeakRetained = v3;
  }

}

- (void)cancelSetup:(id)a3
{
  id v4;
  PSSpecifier *currentSiriActivationSpecifier;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  -[VTUIEnrollTrainingViewController cancelTraining](self->_enrollmentController, "cancelTraining");
  if (-[AssistantController _isCurrentSpecifierVoiceActivation](self, "_isCurrentSpecifierVoiceActivation"))
  {
    -[AssistantController setAssistantEnabled:](self, "setAssistantEnabled:", 0);
    currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
    self->_currentSiriActivationSpecifier = 0;

  }
  -[AssistantController _runVoiceTriggerEnablementCompletionIfApplicable](self, "_runVoiceTriggerEnablementCompletionIfApplicable");
  +[AssistantMetrics didStartEnrollment:](AssistantMetrics, "didStartEnrollment:", 0);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__AssistantController_cancelSetup___block_invoke;
  v6[3] = &unk_24D33CBB8;
  objc_copyWeak(&v7, &location);
  -[AssistantController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __35__AssistantController_cancelSetup___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_runEnablementFlowDismissalHandlersIfApplicable");
    v2 = (void *)v3[188];
    v3[188] = 0;

    WeakRetained = v3;
  }

}

- (void)skipSetup
{
  OUTLINED_FUNCTION_0_1(&dword_2153F2000, a1, a3, "%s skipSetup not implemented by AssistantController", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)showLearnMore
{
  OUTLINED_FUNCTION_0_1(&dword_2153F2000, a1, a3, "%s showLearnMore not implemented by AssistantController", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_reloadSiriInCallSpecifier
{
  if (+[AssistantSiriInCallController isSettingSupported](AssistantSiriInCallController, "isSettingSupported"))
  {
    -[AssistantController _insertSiriInCallSpecifier](self, "_insertSiriInCallSpecifier");
  }
  else
  {
    -[AssistantController _removeSiriInCallSpecifier](self, "_removeSiriInCallSpecifier");
  }
}

- (void)_removeSiriInCallSpecifier
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (self->_siriInCallSpecifier && -[AssistantController containsSpecifier:](self, "containsSpecifier:"))
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[AssistantController _removeSiriInCallSpecifier]";
      _os_log_impl(&dword_2153F2000, v3, OS_LOG_TYPE_INFO, "%s Removing in-call setting", (uint8_t *)&v4, 0xCu);
    }
    -[AssistantController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_siriInCallSpecifier, 1);
  }
}

- (void)_insertSiriInCallSpecifier
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (self->_siriInCallSpecifier && (-[AssistantController containsSpecifier:](self, "containsSpecifier:") & 1) == 0)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[AssistantController _insertSiriInCallSpecifier]";
      _os_log_impl(&dword_2153F2000, v3, OS_LOG_TYPE_INFO, "%s Inserting in-call setting", (uint8_t *)&v4, 0xCu);
    }
    -[AssistantController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", self->_siriInCallSpecifier, CFSTR("VOICE_FEEDBACK_ID"), 1);
  }
}

- (id)siriInCallEnabled:(id)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = +[AssistantSiriInCallController isSettingEnabled](AssistantSiriInCallController, "isSettingEnabled", a3);
  +[AssistantController bundle](AssistantController, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("ON");
  else
    v6 = CFSTR("OFF");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)showMeCardPicker:(id)a3
{
  CNContactPickerViewController *v4;
  CNContactPickerViewController *peoplePicker;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double MidY;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGRect v25;

  v4 = (CNContactPickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAE78]), "initWithNibName:bundle:", 0, 0);
  peoplePicker = self->_peoplePicker;
  self->_peoplePicker = v4;

  -[CNContactPickerViewController setDelegate:](self->_peoplePicker, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sf_isiPad");

  if (v7)
  {
    -[AssistantController specifierForID:](self, "specifierForID:", CFSTR("MY_INFO"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "detailTextLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;

      v25.origin.x = v13;
      v25.origin.y = v15;
      v25.size.width = v17;
      v25.size.height = v19;
      MidY = CGRectGetMidY(v25);
      -[CNContactPickerViewController setModalPresentationStyle:](self->_peoplePicker, "setModalPresentationStyle:", 7);
      -[CNContactPickerViewController popoverPresentationController](self->_peoplePicker, "popoverPresentationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "detailTextLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSourceView:", v22);

      -[CNContactPickerViewController popoverPresentationController](self->_peoplePicker, "popoverPresentationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSourceRect:", v13, MidY, v17, 1.0);

      -[CNContactPickerViewController popoverPresentationController](self->_peoplePicker, "popoverPresentationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPermittedArrowDirections:", 12);

    }
  }
  -[AssistantController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_peoplePicker, 1, 0);
}

- (id)meCard:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  +[AssistantController bundle](AssistantController, "bundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("None"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v5, "_ios_meContactWithKeysToFetch:error:", v7, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;

    if (v8)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setStyle:", 0);
      objc_msgSend(v10, "stringFromContact:", v8);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }

  }
  return v4;
}

- (void)_makeMeDeviceDetermination
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__AssistantController__makeMeDeviceDetermination__block_invoke;
  v3[3] = &unk_24D33CBB8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__AssistantController__makeMeDeviceDetermination__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __49__AssistantController__makeMeDeviceDetermination__block_invoke_2;
    v4[3] = &unk_24D33D600;
    objc_copyWeak(&v5, v1);
    objc_msgSend(v3, "getActiveLocationSharingDevice:", v4);

    objc_destroyWeak(&v5);
  }

}

void __49__AssistantController__makeMeDeviceDetermination__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BYTE *WeakRetained;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v9 = 136315394;
        v10 = "-[AssistantController _makeMeDeviceDetermination]_block_invoke_2";
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_2153F2000, v8, OS_LOG_TYPE_INFO, "%s #settings Failed to fetch active location sharing device: %@", (uint8_t *)&v9, 0x16u);
      }
      WeakRetained[1632] = 0;
    }
    else
    {
      WeakRetained[1632] = objc_msgSend(v5, "isThisDevice");
    }
  }

}

- (void)handleAssetStatusUpdated
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[UAFAssetUtilities currentAssetStatus](self->_assetUtils, "currentAssetStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__AssistantController_handleAssetStatusUpdated__block_invoke;
  v5[3] = &unk_24D33CDC0;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __47__AssistantController_handleAssetStatusUpdated__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "specifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifierForID:", CFSTR("SIRI_REQUESTS_GROUP"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateSiriFooterGroup:withStatus:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:animated:", v3, 0);

}

- (void)siriUODAvailabilityDidChange:(BOOL)a3
{
  if (a3)
    -[AssistantController handleAssetStatusUpdated](self, "handleAssetStatusUpdated");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  PSSpecifier *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AssistantController;
  v6 = a4;
  -[AssistantController tableView:didSelectRowAtIndexPath:](&v8, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[AssistantController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v8.receiver, v8.super_class);
  v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();

  if (v7 == self->_voiceSpecifier)
    ADClientAddValueForScalarKey();

}

- (void)contactPickerDidCancel:(id)a3
{
  -[AssistantController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  CNContactStore *contactStore;
  uint64_t v6;

  if (a4)
  {
    contactStore = self->_contactStore;
    v6 = 0;
    -[CNContactStore setMeContact:error:](contactStore, "setMeContact:error:", a4, &v6);
    -[AssistantController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("MY_INFO"), 0);
  }
  -[AssistantController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_presentSiriDataSharingOptInViewController
{
  OUTLINED_FUNCTION_0_1(&dword_2153F2000, a1, a3, "%s #siriDataSharingOptIn: Nil VC returned by VTUISiriDataSharingOptInPresenter.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
  id v4;
  UIViewController *siriDataSharingOptInViewController;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  siriDataSharingOptInViewController = self->_siriDataSharingOptInViewController;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__AssistantController_siriDataSharingOptInRequestsDismissalFromPresenter___block_invoke;
  v6[3] = &unk_24D33CBB8;
  objc_copyWeak(&v7, &location);
  -[UIViewController dismissViewControllerAnimated:completion:](siriDataSharingOptInViewController, "dismissViewControllerAnimated:completion:", 1, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __74__AssistantController_siriDataSharingOptInRequestsDismissalFromPresenter___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[190];
    WeakRetained[190] = 0;
    v4 = WeakRetained;

    v3 = (void *)v4[189];
    v4[189] = 0;

    objc_msgSend(v4, "_runEnablementFlowDismissalHandlersIfApplicable");
    WeakRetained = v4;
  }

}

- (void)showAssistantHistoryViewController:(id)a3
{
  void *v4;
  AssistantHistoryViewController *v5;

  v5 = objc_alloc_init(AssistantHistoryViewController);
  -[AssistantHistoryViewController setDelegate:](v5, "setDelegate:", self);
  -[AssistantController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void)deleteHistorySuccessfulFromViewController:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__AssistantController_deleteHistorySuccessfulFromViewController___block_invoke;
  v3[3] = &unk_24D33CBB8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __65__AssistantController_deleteHistorySuccessfulFromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

    if (+[AssistantUtilities isRpiOnDeviceDeletionEnabled](AssistantUtilities, "isRpiOnDeviceDeletionEnabled"))
    {
      v5 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v15 = 136315138;
        v16 = "-[AssistantController deleteHistorySuccessfulFromViewController:]_block_invoke";
        _os_log_impl(&dword_2153F2000, v5, OS_LOG_TYPE_INFO, "%s #RPI on-device Siri History Deletion Request successful. Skipping showing alert.", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      +[AssistantController bundle](AssistantController, "bundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY_ALERT_SUCCESS_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[AssistantController bundle](AssistantController, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY_ALERT_SUCCESS_MESSAGE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BEBD3A8];
      +[AssistantController bundle](AssistantController, "bundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_SIRI_HISTORY_ALERT_DISMISS"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addAction:", v14);
      objc_msgSend(v10, "setPreferredAction:", v14);
      objc_msgSend(v2, "presentViewController:animated:completion:", v10, 1, 0);

    }
  }

}

- (void)setVoiceActivation:(id)a3 forSpecifier:(id)a4 withTrainingCompletionIfNecessary:(id)a5
{
  id v8;
  void *v9;
  id voiceTriggerEnablementCompletion;
  id v11;
  void *v12;
  void *v13;
  int v14;
  PSSpecifier *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = _Block_copy(a5);
  voiceTriggerEnablementCompletion = self->_voiceTriggerEnablementCompletion;
  self->_voiceTriggerEnablementCompletion = v9;

  v11 = v8;
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("ACTIVATION_CONFIRMATION")))
  {

LABEL_4:
    v15 = self->_voiceActivationSettingsSpecifier;

    goto LABEL_5;
  }
  objc_msgSend(v11, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("BUDDY_FLOW_CONFIRMATION"));

  v15 = (PSSpecifier *)v11;
  if (v14)
    goto LABEL_4;
LABEL_5:
  -[AssistantController setVoiceTrigger:forSpecifier:transitionWithNavControllerIfNecessary:](self, "setVoiceTrigger:forSpecifier:transitionWithNavControllerIfNecessary:", v16, v15, 0);

}

- (void)_setAssistantEnabled:(id)a3 forSpecifier:(id)a4
{
  -[AssistantController _setAssistantEnabled:forSpecifier:presentingViewController:actionHandler:](self, "_setAssistantEnabled:forSpecifier:presentingViewController:actionHandler:", a3, a4, self, 0);
}

- (void)_runVoiceTriggerEnablementCompletionIfApplicable
{
  void (**voiceTriggerEnablementCompletion)(id, SEL);
  id v4;

  voiceTriggerEnablementCompletion = (void (**)(id, SEL))self->_voiceTriggerEnablementCompletion;
  if (voiceTriggerEnablementCompletion)
  {
    voiceTriggerEnablementCompletion[2](voiceTriggerEnablementCompletion, a2);
    v4 = self->_voiceTriggerEnablementCompletion;
    self->_voiceTriggerEnablementCompletion = 0;

  }
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  void (**voiceSelectionCompletion)(id, id);

  voiceSelectionCompletion = (void (**)(id, id))self->_voiceSelectionCompletion;
  if (voiceSelectionCompletion)
    voiceSelectionCompletion[2](voiceSelectionCompletion, a4);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  PSRootController *v4;
  PSRootController *enablementFlowNavigationController;

  objc_msgSend(a3, "presentedViewController");
  v4 = (PSRootController *)objc_claimAutoreleasedReturnValue();
  enablementFlowNavigationController = self->_enablementFlowNavigationController;

  if (v4 == enablementFlowNavigationController)
    -[AssistantController _runEnablementFlowDismissalHandlersIfApplicable](self, "_runEnablementFlowDismissalHandlersIfApplicable");
}

- (void)_voiceSelectionCancelled
{
  PSRootController *enablementFlowNavigationController;
  _QWORD v3[5];

  enablementFlowNavigationController = self->_enablementFlowNavigationController;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__AssistantController__voiceSelectionCancelled__block_invoke;
  v3[3] = &unk_24D33CBE0;
  v3[4] = self;
  -[PSRootController dismissViewControllerAnimated:completion:](enablementFlowNavigationController, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __47__AssistantController__voiceSelectionCancelled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runEnablementFlowDismissalHandlersIfApplicable");
}

- (void)_runEnablementFlowDismissalHandlersIfApplicable
{
  void (**voiceSelectionFlowDismissalHandler)(id, SEL);
  id v4;

  voiceSelectionFlowDismissalHandler = (void (**)(id, SEL))self->_voiceSelectionFlowDismissalHandler;
  if (voiceSelectionFlowDismissalHandler)
  {
    voiceSelectionFlowDismissalHandler[2](voiceSelectionFlowDismissalHandler, a2);
    v4 = self->_voiceSelectionFlowDismissalHandler;
    self->_voiceSelectionFlowDismissalHandler = 0;

  }
}

- (void)registerUndoActionWithKey:(id)a3 urlString:(id)a4 undoAction:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = (objc_class *)MEMORY[0x24BDD19B8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v12, "initWithKey:table:locale:bundleURL:", v11, CFSTR("AssistantSettings"), v13, v15);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[AssistantController pe_registerUndoActionName:associatedDeepLink:undoAction:](self, "pe_registerUndoActionName:associatedDeepLink:undoAction:", v17, v16, v9);
}

- (SUICAssistantVoiceSettingsConnection)settingsConnection
{
  return self->_settingsConnection;
}

- (BOOL)selectedLanguageWantsMultilingualEnabled
{
  return self->_selectedLanguageWantsMultilingualEnabled;
}

- (void)setSelectedLanguageWantsMultilingualEnabled:(BOOL)a3
{
  self->_selectedLanguageWantsMultilingualEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedDeeplinkResource, 0);
  objc_storeStrong((id *)&self->_gmSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_gmFooterUtility, 0);
  objc_storeStrong((id *)&self->_languagesInHome, 0);
  objc_storeStrong((id *)&self->_assetUtils, 0);
  objc_storeStrong(&self->_voiceSelectionFlowDismissalHandler, 0);
  objc_storeStrong(&self->_voiceSelectionCompletion, 0);
  objc_storeStrong((id *)&self->_enablementFlowNavigationController, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_enablementConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsFromAppleAllowNotificationsController, 0);
  objc_storeStrong((id *)&self->_AFSettingsConnection, 0);
  objc_storeStrong((id *)&self->_allAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_installedBundleIDs, 0);
  objc_storeStrong(&self->_voiceTriggerEnablementCompletion, 0);
  objc_storeStrong((id *)&self->_siriDataSharingOptInViewController, 0);
  objc_storeStrong((id *)&self->_siriDataSharingPresenter, 0);
  objc_storeStrong((id *)&self->_enrollmentController, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightDomains, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
  objc_storeStrong((id *)&self->_peoplePicker, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_siriInCallSpecifier, 0);
  objc_storeStrong((id *)&self->_lockScreenSpecifier, 0);
  objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationSettingsSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationSpecifier, 0);
  objc_storeStrong((id *)&self->_announceMessagesSpecifier, 0);
  objc_storeStrong((id *)&self->_languageSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceSpecifier, 0);
  objc_storeStrong((id *)&self->_pendingLanguage, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_assistantSettings, 0);
}

- (void)openStorageManagement:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = 136315394;
  v6 = "-[AssistantController openStorageManagement:]";
  v7 = 2080;
  v8 = objc_msgSend(v4, "UTF8String");
  _os_log_error_impl(&dword_2153F2000, v3, OS_LOG_TYPE_ERROR, "%s %s", (uint8_t *)&v5, 0x16u);

}

void __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2153F2000, v0, v1, "%s #settings Error retrieving available languages in the Home: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_updateSiriFooterGroup:(uint64_t)a3 withStatus:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2153F2000, a1, a3, "%s #settings updating nil group", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)watchSupportsSiriLanguageCode:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertySystemName(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AssistantController.m"), 134, CFSTR("%s"), OUTLINED_FUNCTION_4());

  __break(1u);
}

- (void)setAssistantEnabled:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getBYFlowSkipIdentifierSiri(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AssistantController.m"), 143, CFSTR("%s"), OUTLINED_FUNCTION_4());

  __break(1u);
}

void __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2153F2000, a1, a3, "%s #siriDataSharingOptIn: Nil VC returned by VTUISiriDataSharingOptInPresenter.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2153F2000, a1, a3, "%s Unsupported Specifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)confirmationSpecifierWillDisableHeySiri:disableMultiUser:disableSpokenFeedbackOnWatch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2153F2000, v0, v1, "%s Failed to find display string for pending language: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2153F2000, a1, a3, "%s Pending language was unexpectedly nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2153F2000, v0, v1, "%s Error fetching supported multi user language codes. %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)handleURL:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[AssistantController handleURL:withCompletion:]";
  _os_log_debug_impl(&dword_2153F2000, log, OS_LOG_TYPE_DEBUG, "%s Navigation Controller is not present, caching deeplink dict for delayed push.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2153F2000, a1, a3, "%s Discarding AMS Lookup Result due to block deallocation.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2153F2000, a1, a3, "%s Error performing AMS Lookup - item not found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2153F2000, v0, v1, "%s Error performing AMS Lookup: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
