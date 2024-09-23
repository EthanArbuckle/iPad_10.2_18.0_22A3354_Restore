@implementation AssistantVoiceController

+ (id)bundle
{
  if (bundle_onceToken != -1)
    dispatch_once(&bundle_onceToken, &__block_literal_global_5);
  return (id)bundle_sAssistantVoiceBundle;
}

void __34__AssistantVoiceController_bundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bundle_sAssistantVoiceBundle;
  bundle_sAssistantVoiceBundle = v0;

}

- (AssistantVoiceController)init
{
  AssistantVoiceController *v2;
  SiriTTSDaemonSession *v3;
  SiriTTSDaemonSession *session;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AssistantVoiceController;
  v2 = -[AssistantVoiceController init](&v6, sel_init);
  v3 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x24BEA7A10]);
  session = v2->_session;
  v2->_session = v3;

  -[AssistantVoiceController resetMetrics](v2, "resetMetrics");
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AssistantVoiceController;
  -[AssistantVoiceController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)resetMetrics
{
  void *v3;
  uint64_t v4;
  AssistantVoiceMetrics *v5;
  AssistantVoiceMetrics *metrics;
  id v7;

  if (self->_metrics)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BEBE018];
    objc_msgSend(v3, "removeObserver:name:object:", self->_metrics, *MEMORY[0x24BEBE018], 0);

  }
  else
  {
    v4 = *MEMORY[0x24BEBE018];
  }
  v5 = (AssistantVoiceMetrics *)objc_opt_new();
  metrics = self->_metrics;
  self->_metrics = v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self->_metrics, sel_sendAnalyticsEvent, v4, 0);

}

- (void)setParentController:(id)a3
{
  id v4;
  void *v5;
  SUICAssistantVoiceSettingsConnection *v6;
  SUICAssistantVoiceSettingsConnection *settingsConnection;
  objc_super v8;

  v4 = a3;
  -[AssistantVoiceController parentController](self, "parentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)AssistantVoiceController;
  -[AssistantVoiceController setParentController:](&v8, sel_setParentController_, v4);
  if (v4 && !v5)
  {
    objc_msgSend(v4, "settingsConnection");
    v6 = (SUICAssistantVoiceSettingsConnection *)objc_claimAutoreleasedReturnValue();
    settingsConnection = self->_settingsConnection;
    self->_settingsConnection = v6;

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSDate *v5;
  NSDate *startDate;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[3];

  v3 = a3;
  v29[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v5;

  v28.receiver = self;
  v28.super_class = (Class)AssistantVoiceController;
  -[AssistantVoiceController viewDidAppear:](&v28, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_languageCodeDidChange_, *MEMORY[0x24BE08DF0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_outputVoiceDidChange_, *MEMORY[0x24BE08E88], 0);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Siri/VOICE_ID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithKey:table:locale:bundleURL:", CFSTR("Siri Voice"), 0, v10, v12);

  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "deviceSupported");

  if ((_DWORD)v11)
    v15 = CFSTR("Apple Intelligence & Siri");
  else
    v15 = CFSTR("Siri");
  v16 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithKey:table:locale:bundleURL:", v15, 0, v17, v19);

  v21 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bundleURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v21, "initWithKey:table:locale:bundleURL:", CFSTR("Siri Voice"), 0, v22, v24);

  v29[0] = v20;
  v29[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantVoiceController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.siri"), v13, v26, v27);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  NSDate *startDate;
  NSDate *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  startDate = self->_startDate;
  if (!startDate)
    startDate = (NSDate *)v5;
  v8 = startDate;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v9 = (void *)getCKKnowledgeStoreClass_softClass_0;
  v30 = getCKKnowledgeStoreClass_softClass_0;
  if (!getCKKnowledgeStoreClass_softClass_0)
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __getCKKnowledgeStoreClass_block_invoke_0;
    v25 = &unk_24D33CD10;
    v26 = &v27;
    __getCKKnowledgeStoreClass_block_invoke_0((uint64_t)&v22);
    v9 = (void *)v28[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v27, 8);
  objc_msgSend(v10, "defaultSynchedKnowledgeStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v12 = (void *)getCKPermanentEventStoreClass_softClass_0;
  v30 = getCKPermanentEventStoreClass_softClass_0;
  if (!getCKPermanentEventStoreClass_softClass_0)
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __getCKPermanentEventStoreClass_block_invoke_0;
    v25 = &unk_24D33CD10;
    v26 = &v27;
    __getCKPermanentEventStoreClass_block_invoke_0((uint64_t)&v22);
    v12 = (void *)v28[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v27, 8);
  v14 = (void *)objc_msgSend([v13 alloc], "initWithKnowledgeStore:", v11);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v15 = (void *)getCKEventClass_softClass_0;
  v30 = getCKEventClass_softClass_0;
  if (!getCKEventClass_softClass_0)
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __getCKEventClass_block_invoke_0;
    v25 = &unk_24D33CD10;
    v26 = &v27;
    __getCKEventClass_block_invoke_0((uint64_t)&v22);
    v15 = (void *)v28[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v27, 8);
  v17 = (void *)objc_msgSend([v16 alloc], "initWithIdentifier:startDate:endDate:metadata:", CFSTR("SiriVoiceSettingsShown"), v8, v6, 0);
  objc_msgSend(v14, "recordEvent:completionHandler:", v17, &__block_literal_global_160);
  -[AssistantVoiceController metrics](self, "metrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendAnalyticsEvent");

  v21.receiver = self;
  v21.super_class = (Class)AssistantVoiceController;
  -[AssistantVoiceController viewDidDisappear:](&v21, sel_viewDidDisappear_, v3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObserver:name:object:", self, *MEMORY[0x24BE08DF0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObserver:name:object:", self, *MEMORY[0x24BE08E88], 0);

}

void __45__AssistantVoiceController_viewDidDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Unable to record voice settings activity: %@"), a2);
}

- (void)languageCodeDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    -[AssistantVoiceController languageCodeDidChange:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  -[AssistantVoiceController reloadSpecifiers](self, "reloadSpecifiers");
  if (-[NSArray count](self->_voiceVariationSpecifiers, "count") <= 1
    && -[NSArray count](self->_languageSpecifiers, "count") <= 1)
  {
    -[AssistantVoiceController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "popViewControllerAnimated:", 1);

  }
}

- (void)outputVoiceDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (!self->_ignoreNextVoiceChangeNotification)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
      -[AssistantVoiceController outputVoiceDidChange:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    -[AssistantVoiceController reloadSpecifiers](self, "reloadSpecifiers");
  }
  self->_ignoreNextVoiceChangeNotification = 0;

}

- (id)outputVoice
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "voiceNamesForOutputLanguageCode:gender:", v7, objc_msgSend(v3, "gender"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x24BE093A0]);
    objc_msgSend(v3, "languageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v3, "gender");
    v13 = objc_msgSend(v3, "isCustom");
    v14 = objc_msgSend(v3, "footprint");
    objc_msgSend(v3, "contentVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "masteredVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v11, v12, v13, v9, v14, v15, v16);

    v3 = (void *)v17;
  }
  return v3;
}

- (id)inProgressOutputVoice
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inProgressOutputVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (id)specifiers
{
  id *v3;
  id v4;
  _BOOL4 v5;
  void *v6;
  PSSpecifier *v7;
  PSSpecifier *languageGroupSpecifier;
  void *v9;
  void *v10;
  void *v11;
  PSSpecifier *v12;
  PSSpecifier *languageProto;
  PSSpecifier *v14;
  PSSpecifier *voiceVariationProto;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSArray *languageSpecifiers;
  void *v26;
  NSArray *v27;
  NSArray *v28;
  PSSpecifier *v29;
  PSSpecifier *v30;
  PSSpecifier *voiceVariationGroupSpecifier;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSArray *v36;
  NSArray *voiceVariationSpecifiers;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(_QWORD);
  void *v43;
  _BOOL4 v45;
  id *location;
  _QWORD block[4];
  void (**v48)(_QWORD);
  _QWORD aBlock[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id from;

  v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v4 = *v3;
  if (!*v3)
  {
    if (self->_languageSpecifiers)
      v5 = 1;
    else
      v5 = self->_voiceVariationGroupSpecifier != 0;
    v45 = v5;
    location = v3;
    -[AssistantVoiceController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("AssistantVoice"), self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "specifierForID:", CFSTR("VOICE_LANGUAGE_GROUP"));
    v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    languageGroupSpecifier = self->_languageGroupSpecifier;
    self->_languageGroupSpecifier = v7;

    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setName:](self->_languageGroupSpecifier, "setName:", v11);

    objc_msgSend(v6, "specifierForID:", CFSTR("VOICE_PROTO"));
    v12 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    languageProto = self->_languageProto;
    self->_languageProto = v12;

    objc_msgSend(v6, "removeObject:", self->_languageProto);
    objc_msgSend(v6, "specifierForID:", CFSTR("VOICE_VARIATION_PROTO"));
    v14 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    voiceVariationProto = self->_voiceVariationProto;
    self->_voiceVariationProto = v14;

    objc_msgSend(v6, "removeObject:", self->_voiceVariationProto);
    if (+[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision"))
    {
      objc_msgSend(v6, "specifierForID:", CFSTR("VOICE_FOOTER_GROUP"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v16);

    }
    -[AssistantVoiceController inProgressOutputVoice](self, "inProgressOutputVoice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceController outputVoice](self, "outputVoice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceController deriveVoicesWithTargetVoice:currentVoice:](self, "deriveVoicesWithTargetVoice:currentVoice:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "inProgressVoice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentVoice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_currentVoice, v21);
    -[AssistantVoiceController viewModelWithInProgressVoice:currentVoice:](self, "viewModelWithInProgressVoice:currentVoice:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "languageOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    languageSpecifiers = self->_languageSpecifiers;
    if (v24 < 2)
    {
      self->_languageSpecifiers = 0;

      objc_msgSend(v6, "removeObject:", self->_languageGroupSpecifier);
      v29 = self->_languageGroupSpecifier;
      self->_languageGroupSpecifier = 0;

    }
    else
    {
      if (!languageSpecifiers)
      {
        objc_msgSend(v22, "selectedLanguage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AssistantVoiceController _languageSpecifiersForLanguage:](self, "_languageSpecifiersForLanguage:", v26);
        v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v28 = self->_languageSpecifiers;
        self->_languageSpecifiers = v27;

        languageSpecifiers = self->_languageSpecifiers;
      }
      objc_msgSend(v6, "ps_insertObjectsFromArray:afterObject:", languageSpecifiers, self->_languageGroupSpecifier);
    }
    objc_msgSend(v6, "specifierForID:", CFSTR("VOICE_VARIATION_GROUP"));
    v30 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    voiceVariationGroupSpecifier = self->_voiceVariationGroupSpecifier;
    self->_voiceVariationGroupSpecifier = v30;

    -[PSSpecifier setProperty:forKey:](self->_voiceVariationGroupSpecifier, "setProperty:forKey:", CFSTR("\n"), *MEMORY[0x24BE75A68]);
    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", v33, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setName:](self->_voiceVariationGroupSpecifier, "setName:", v34);

    objc_msgSend(v22, "selectedLanguage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceController _voiceVariationSpecifiersForLanguage:](self, "_voiceVariationSpecifiersForLanguage:", v35);
    v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
    voiceVariationSpecifiers = self->_voiceVariationSpecifiers;
    self->_voiceVariationSpecifiers = v36;

    objc_msgSend(v6, "ps_insertObjectsFromArray:afterObject:", self->_voiceVariationSpecifiers, self->_voiceVariationGroupSpecifier);
    objc_storeStrong(location, v6);
    objc_initWeak(&from, self);
    v38 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__AssistantVoiceController_specifiers__block_invoke;
    aBlock[3] = &unk_24D33D020;
    objc_copyWeak(&v53, &from);
    v39 = v22;
    v50 = v39;
    v40 = v20;
    v51 = v40;
    v41 = v19;
    v52 = v41;
    v42 = (void (**)(_QWORD))_Block_copy(aBlock);
    v43 = v42;
    if (v45)
    {
      block[0] = v38;
      block[1] = 3221225472;
      block[2] = __38__AssistantVoiceController_specifiers__block_invoke_2;
      block[3] = &unk_24D33D048;
      v48 = v42;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      v42[2](v42);
    }

    objc_destroyWeak(&v53);
    objc_destroyWeak(&from);

    v4 = *location;
  }
  return v4;
}

void __38__AssistantVoiceController_specifiers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "applyViewModel:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
    if (*(_QWORD *)(a1 + 40))
    {
      if ((objc_msgSend(v3, "isCellularDataPermissionAllowedForVoice:") & 1) == 0
        && +[ASTNetworkReachability hasExpensiveCellOnlyNetworkConnection](ASTNetworkReachability, "hasExpensiveCellOnlyNetworkConnection"))
      {
        objc_msgSend(v3, "presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
LABEL_8:
        WeakRetained = v3;
        goto LABEL_9;
      }
      WeakRetained = v3;
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(v3, "setAssistantInProgressVoice:");
        objc_msgSend(v3, "downloadVoice:", *(_QWORD *)(a1 + 40));
        goto LABEL_8;
      }
    }
  }
LABEL_9:

}

uint64_t __38__AssistantVoiceController_specifiers__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)deriveVoicesWithTargetVoice:(id)a3 currentVoice:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (-[AssistantVoiceController isVoiceInstalled:](self, "isVoiceInstalled:", v6))
    {
      v8 = 0;
LABEL_12:
      v16 = v6;
      goto LABEL_13;
    }
    if (!-[AssistantVoiceController isVoiceInstalled:](self, "isVoiceInstalled:", v7))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getBaseLocale:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getBaseLocale:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isEqualToString:", v14);

    if (!v15)
    {
LABEL_11:
      v8 = v6;
      goto LABEL_12;
    }
    v8 = v6;
  }
  else if (-[AssistantVoiceController isVoiceInstalled:](self, "isVoiceInstalled:", v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }
  v16 = v7;
LABEL_13:
  +[AssistantVoiceControllerVoiceSettings settingsWithInProgressVoice:currentVoice:](AssistantVoiceControllerVoiceSettings, "settingsWithInProgressVoice:currentVoice:", v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)viewModelWithInProgressVoice:(id)a3 currentVoice:(id)a4
{
  id v6;
  id v7;
  AssistantVoiceViewModel *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
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
  uint64_t v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  SUICAssistantVoiceSettingsConnection *settingsConnection;
  void *v31;
  void *v32;
  SUICAssistantVoiceSettingsConnection *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  AssistantVoiceViewModel *v42;
  void *v43;
  void *v45;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AssistantVoiceViewModel);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "multilingualResponseEnabledForLanguage:", v10);

  -[AssistantVoiceViewModel setInProgressVoice:](v8, "setInProgressVoice:", v6);
  -[AssistantVoiceViewModel setCurrentVoice:](v8, "setCurrentVoice:", v7);
  if (!v6)
  {
    objc_msgSend(v7, "languageCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceViewModel setSelectedLanguage:](v8, "setSelectedLanguage:", v13);

    v14 = (void *)MEMORY[0x24BDBCF20];
    if ((v11 & 1) != 0)
    {
      -[AssistantVoiceViewModel selectedLanguage](v8, "selectedLanguage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithObjects:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AssistantVoiceViewModel setLanguageOptions:](v8, "setLanguageOptions:", v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AssistantVoiceViewModel selectedLanguage](v8, "selectedLanguage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allOutputVoiceIdentifiersForSiriLanguage:", v16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AssistantVoiceViewModel setLanguageOptions:](v8, "setLanguageOptions:", v29);

    }
    settingsConnection = self->_settingsConnection;
    -[AssistantVoiceViewModel selectedLanguage](v8, "selectedLanguage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceViewModel setShouldShowVoiceVariationGroup:](v8, "setShouldShowVoiceVariationGroup:", -[SUICAssistantVoiceSettingsConnection languageHasVoiceVariations:](settingsConnection, "languageHasVoiceVariations:", v31));

    -[AssistantVoiceViewModel setVoiceVariationToSpin:](v8, "setVoiceVariationToSpin:", 0);
    v32 = v7;
    goto LABEL_29;
  }
  if (-[AssistantVoiceController isCellularDataPermissionAllowedForVoice:](self, "isCellularDataPermissionAllowedForVoice:", v6))
  {
    v12 = 1;
  }
  else
  {
    v12 = !+[ASTNetworkReachability hasExpensiveCellOnlyNetworkConnection](ASTNetworkReachability, "hasExpensiveCellOnlyNetworkConnection");
  }
  objc_msgSend(v6, "languageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantVoiceViewModel setSelectedLanguage:](v8, "setSelectedLanguage:", v17);

  v18 = (void *)MEMORY[0x24BDBCF20];
  if ((v11 & 1) != 0)
  {
    -[AssistantVoiceViewModel selectedLanguage](v8, "selectedLanguage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithObjects:", v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceViewModel setLanguageOptions:](v8, "setLanguageOptions:", v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceViewModel selectedLanguage](v8, "selectedLanguage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allOutputVoiceIdentifiersForSiriLanguage:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceViewModel setLanguageOptions:](v8, "setLanguageOptions:", v22);

  }
  if (v12)
  {
    -[AssistantVoiceViewModel languageOptions](v8, "languageOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v23, "count") <= 1)
    {
      -[AssistantVoiceViewModel setSpinningOnLanguage:](v8, "setSpinningOnLanguage:", 0);
    }
    else
    {
      objc_msgSend(v6, "languageCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "languageCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqualToString:", v25))
      {
        v26 = objc_msgSend(v6, "gender");
        v27 = v26 == objc_msgSend(v7, "gender");
      }
      else
      {
        v27 = 1;
      }
      -[AssistantVoiceViewModel setSpinningOnLanguage:](v8, "setSpinningOnLanguage:", v27);

    }
  }
  else
  {
    -[AssistantVoiceViewModel setSpinningOnLanguage:](v8, "setSpinningOnLanguage:", 0);
  }
  v33 = self->_settingsConnection;
  -[AssistantVoiceViewModel selectedLanguage](v8, "selectedLanguage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantVoiceViewModel setShouldShowVoiceVariationGroup:](v8, "setShouldShowVoiceVariationGroup:", -[SUICAssistantVoiceSettingsConnection languageHasVoiceVariations:](v33, "languageHasVoiceVariations:", v34));

  if (-[AssistantVoiceViewModel shouldShowVoiceVariationGroup](v8, "shouldShowVoiceVariationGroup"))
  {
    -[AssistantVoiceViewModel setLanguageGroupFooterText:](v8, "setLanguageGroupFooterText:", 0);
    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", v36, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceViewModel setVoiceVariationGroupFooterText:](v8, "setVoiceVariationGroupFooterText:", v37);
  }
  else
  {
    -[AssistantVoiceViewModel setVoiceVariationGroupFooterText:](v8, "setVoiceVariationGroupFooterText:", 0);
    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", v36, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceViewModel setLanguageGroupFooterText:](v8, "setLanguageGroupFooterText:", v37);
  }

  if (!v12)
  {
    -[AssistantVoiceViewModel setVoiceVariationToSpin:](v8, "setVoiceVariationToSpin:", 0);
    v32 = v6;
LABEL_29:
    objc_msgSend(v32, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v8;
    v43 = v39;
LABEL_30:
    -[AssistantVoiceViewModel setVoiceVariationToCheckMark:](v42, "setVoiceVariationToCheckMark:", v43);
    goto LABEL_31;
  }
  objc_msgSend(v6, "name");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantVoiceViewModel setVoiceVariationToSpin:](v8, "setVoiceVariationToSpin:", v38);

  objc_msgSend(v7, "name");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    v42 = v8;
    v43 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v6, "name");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v40, "isEqualToString:", v41) & 1) != 0)
  {
    -[AssistantVoiceViewModel setVoiceVariationToCheckMark:](v8, "setVoiceVariationToCheckMark:", 0);
  }
  else
  {
    objc_msgSend(v7, "name");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceViewModel setVoiceVariationToCheckMark:](v8, "setVoiceVariationToCheckMark:", v45);

  }
LABEL_31:

  return v8;
}

- (void)applyViewModel:(id)a3
{
  AssistantVoiceViewModel *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSArray *languageSpecifiers;
  void *v12;
  void *v13;
  void *v14;
  PSSpecifier *languageGroupSpecifier;
  void *v16;
  AssistantVoiceViewModel *currentViewModel;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (AssistantVoiceViewModel *)a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[AssistantVoiceController specifiers](self, "specifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = MEMORY[0x24BDBD1C0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setProperty:forKey:", v9, CFSTR("IS_VOICE_DOWNLOADING"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  languageSpecifiers = self->_languageSpecifiers;
  -[AssistantVoiceViewModel selectedLanguage](v4, "selectedLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray specifierForID:](languageSpecifiers, "specifierForID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AssistantVoiceViewModel spinningOnLanguage](v4, "spinningOnLanguage"))
  {
    objc_msgSend(v13, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("IS_VOICE_DOWNLOADING"));
    -[PSSpecifier removePropertyForKey:](self->_languageGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75C20]);
  }
  else
  {
    -[PSSpecifier setProperty:forKey:](self->_languageGroupSpecifier, "setProperty:forKey:", v13, *MEMORY[0x24BE75C20]);
  }
  -[AssistantVoiceViewModel languageGroupFooterText](v4, "languageGroupFooterText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  languageGroupSpecifier = self->_languageGroupSpecifier;
  if (v14)
  {
    -[AssistantVoiceViewModel languageGroupFooterText](v4, "languageGroupFooterText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](languageGroupSpecifier, "setProperty:forKey:", v16, *MEMORY[0x24BE75A68]);

  }
  else
  {
    -[PSSpecifier removePropertyForKey:](languageGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
  }
  if (self->_languageGroupSpecifier)
    -[AssistantVoiceController reloadSpecifier:](self, "reloadSpecifier:");
  -[AssistantVoiceController updateVoiceVariationGroupUI:](self, "updateVoiceVariationGroupUI:", v4);
  currentViewModel = self->_currentViewModel;
  self->_currentViewModel = v4;

}

- (void)updateVoiceVariationGroupUI:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSArray *v12;
  NSArray *voiceVariationSpecifiers;
  NSArray *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  void *v20;
  PSSpecifier *voiceVariationGroupSpecifier;
  NSArray *v22;
  void *v23;
  void *v24;
  void *v25;
  PSSpecifier *v26;
  void *v27;
  id v28;

  v28 = a3;
  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantVoiceViewModel selectedLanguage](self->_currentViewModel, "selectedLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getBaseLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "selectedLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getBaseLocale:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    -[AssistantVoiceController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_voiceVariationSpecifiers, 1);
    objc_msgSend(v28, "selectedLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceController _voiceVariationSpecifiersForLanguage:](self, "_voiceVariationSpecifiersForLanguage:", v11);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    voiceVariationSpecifiers = self->_voiceVariationSpecifiers;
    self->_voiceVariationSpecifiers = v12;

    v14 = self->_voiceVariationSpecifiers;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v14, v15, 1);

  }
  objc_msgSend(v28, "voiceVariationToSpin");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = self->_voiceVariationSpecifiers;
    objc_msgSend(v28, "voiceVariationToSpin");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray specifierForID:](v17, "specifierForID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("IS_VOICE_DOWNLOADING"));
  }
  objc_msgSend(v28, "voiceVariationToCheckMark");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  voiceVariationGroupSpecifier = self->_voiceVariationGroupSpecifier;
  if (v20)
  {
    v22 = self->_voiceVariationSpecifiers;
    objc_msgSend(v28, "voiceVariationToCheckMark");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray specifierForID:](v22, "specifierForID:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](voiceVariationGroupSpecifier, "setProperty:forKey:", v24, *MEMORY[0x24BE75C20]);

  }
  else
  {
    -[PSSpecifier removePropertyForKey:](self->_voiceVariationGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75C20]);
  }
  objc_msgSend(v28, "voiceVariationGroupFooterText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = self->_voiceVariationGroupSpecifier;
  if (v25)
  {
    objc_msgSend(v28, "voiceVariationGroupFooterText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v26, "setProperty:forKey:", v27, *MEMORY[0x24BE75A68]);

  }
  else
  {
    -[PSSpecifier setProperty:forKey:](self->_voiceVariationGroupSpecifier, "setProperty:forKey:", CFSTR("\n"), *MEMORY[0x24BE75A68]);
  }
  if (self->_voiceVariationGroupSpecifier)
    -[AssistantVoiceController reloadSpecifier:](self, "reloadSpecifier:");

}

- (void)updateDownloadProgress:(float)a3
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  int *v14;
  void *v15;
  void *v16;
  id v17;

  if (a3 >= 0.0)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD16F0];
    *(float *)&v10 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringFromNumber:numberStyle:", v11, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v12);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[AssistantVoiceViewModel languageGroupFooterText](self->_currentViewModel, "languageGroupFooterText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = &OBJC_IVAR___AssistantVoiceController__languageGroupSpecifier;
LABEL_8:
    -[AssistantVoiceController updateFooterText:forSpecifier:](self, "updateFooterText:forSpecifier:", v17, *(Class *)((char *)&self->super.super.super.super.super.isa + *v14));
    v16 = v17;
    goto LABEL_9;
  }
  -[AssistantVoiceViewModel voiceVariationGroupFooterText](self->_currentViewModel, "voiceVariationGroupFooterText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v17;
  if (v15)
  {
    v14 = &OBJC_IVAR___AssistantVoiceController__voiceVariationGroupSpecifier;
    goto LABEL_8;
  }
LABEL_9:

}

- (id)dialectsForLanguageIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[SUICAssistantVoiceSettingsConnection dialectForLanguageIdentifier:](self->_settingsConnection, "dialectForLanguageIdentifier:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)uniqueLocaleForLanguageWithDialect:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE09200];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseLocaleToDialectMapForLanguage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_languageSpecifiersForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allOutputVoiceIdentifiersForSiriLanguage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceController dialectsForLanguageIdentifiers:](self, "dialectsForLanguageIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __59__AssistantVoiceController__languageSpecifiersForLanguage___block_invoke;
    v26[3] = &unk_24D33D070;
    v11 = v8;
    v27 = v11;
    objc_msgSend(v10, "sortUsingComparator:", v26);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BE75590], "specifierWithSpecifier:", self->_languageProto);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setIdentifier:", v17);
          objc_msgSend(v11, "objectForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setName:", v19);

          objc_msgSend(v12, "addObject:", v18);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v14);
    }

  }
  return v12;
}

uint64_t __59__AssistantVoiceController__languageSpecifiersForLanguage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (id)_voiceVariationSpecifiersForLanguage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  const __CFString *v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getBaseLocale:", v3);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "baseLocaleToDialectMapForLanguage:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v5;
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v3;
  objc_msgSend(MEMORY[0x24BE093A0], "allVoicesForSiriSessionLanguage:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1758];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __65__AssistantVoiceController__voiceVariationSpecifiersForLanguage___block_invoke;
  v42[3] = &unk_24D33D098;
  v33 = v8;
  v43 = v33;
  objc_msgSend(v10, "predicateWithBlock:", v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "outputVoiceComparator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v12;
  objc_msgSend(v12, "sortedArrayUsingComparator:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v16;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v39;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v20);
        objc_msgSend(MEMORY[0x24BE75590], "specifierWithSpecifier:", self->_voiceVariationProto);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "languageCode");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "outputVoiceDescriptorForOutputLanguageCode:voiceName:", v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setIdentifier:", v27);

        objc_msgSend(v26, "localizedDisplay");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setName:", v28);

        v44 = CFSTR("VOICE_LOCALE");
        objc_msgSend(v21, "languageCode");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v29;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTitleDictionary:", v30);

        objc_msgSend(v13, "addObject:", v22);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v18);
  }

  return v13;
}

uint64_t __65__AssistantVoiceController__voiceVariationSpecifiersForLanguage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)setAssistantOutputVoice:(id)a3
{
  AFVoiceInfo *v5;

  v5 = (AFVoiceInfo *)a3;
  if (self->_currentVoice != v5)
  {
    objc_storeStrong((id *)&self->_currentVoice, a3);
    -[AssistantVoiceController setOutputVoicePreference:](self, "setOutputVoicePreference:", v5);
  }

}

- (void)setOutputVoicePreference:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE09270];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOutputVoice:", v4);

}

- (void)setAssistantInProgressVoice:(id)a3
{
  AFVoiceInfo *v5;

  v5 = (AFVoiceInfo *)a3;
  if (self->_inProgressVoice != v5)
  {
    objc_storeStrong((id *)&self->_inProgressVoice, a3);
    -[AssistantVoiceController setInProgressVoicePreference:](self, "setInProgressVoicePreference:", v5);
  }

}

- (void)setInProgressVoicePreference:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE09270];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInProgressOutputVoice:", v4);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  SiriTTSDaemonSession *session;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  objc_super v53;
  _QWORD v54[4];
  id v55;
  objc_super v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ADClientAddValueForScalarKey();
  self->_ignoreNextVoiceChangeNotification = 1;
  v8 = -[AssistantVoiceController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFVoiceInfo languageCode](self->_currentVoice, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFVoiceInfo name](self->_inProgressVoice, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[AFVoiceInfo name](self->_currentVoice, "name");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v51 = v13;

    v49 = v9;
    v50 = v6;
    if (-[NSArray indexOfObject:](self->_voiceVariationSpecifiers, "indexOfObject:", v9) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "identifier");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v14;
      objc_msgSend(v15, "voiceSimilarToVoice:inSiriSessionLanguage:", self->_currentVoice, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "gender");
      v18 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        AFVoiceGenderGetName();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v62 = "-[AssistantVoiceController tableView:didSelectRowAtIndexPath:]";
        v63 = 2112;
        v64 = v52;
        v65 = 2112;
        v66 = (uint64_t)v22;
        v67 = 2112;
        v68 = v20;
        _os_log_impl(&dword_2153F2000, v19, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices selecting language variety: %@ %@ %@", buf, 0x2Au);

      }
    }
    else
    {
      objc_msgSend(v9, "titleDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", CFSTR("VOICE_LOCALE"));
      v52 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v48 = v10;
      objc_msgSend(MEMORY[0x24BE093A0], "allVoicesForSiriSessionLanguage:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v58;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v58 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(v28, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", v22);

            if (v30)
            {
              v17 = objc_msgSend(v28, "gender");
              goto LABEL_20;
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
          if (v25)
            continue;
          break;
        }
        v17 = 0;
LABEL_20:
        v9 = v49;
        v6 = v50;
      }
      else
      {
        v17 = 0;
      }

      v31 = (void *)*MEMORY[0x24BE08FB0];
      v10 = v48;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v32 = v31;
        AFVoiceGenderGetName();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v62 = "-[AssistantVoiceController tableView:didSelectRowAtIndexPath:]";
        v63 = 2112;
        v64 = (uint64_t)v48;
        v65 = 2112;
        v66 = v52;
        v67 = 2112;
        v68 = v22;
        v69 = 2112;
        v70 = v33;
        _os_log_impl(&dword_2153F2000, v32, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices selecting voice variation: %@ --> %@ %@ %@", buf, 0x34u);

      }
    }
    v34 = (void *)v52;
    if (!v52)
      goto LABEL_44;
    objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v10;
    objc_msgSend(v35, "getBaseLocale:", v10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "getBaseLocale:", v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "isEqualToString:", v39))
    {
      if (!v22)
      {

LABEL_38:
        v56.receiver = self;
        v56.super_class = (Class)AssistantVoiceController;
        -[AssistantVoiceController tableView:didSelectRowAtIndexPath:](&v56, sel_tableView_didSelectRowAtIndexPath_, v50, v7);
        v44 = *MEMORY[0x24BE08FB0];
        v10 = v36;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v62 = "-[AssistantVoiceController tableView:didSelectRowAtIndexPath:]";
          _os_log_impl(&dword_2153F2000, v44, OS_LOG_TYPE_DEFAULT, "%s #SiriTTSService same voice selection, replaying preview", buf, 0xCu);
        }
        -[AssistantVoiceController metrics](self, "metrics");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A58]), "initWithLanguage:name:", v36, v51);
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A28]), "initWithVoice:previewType:", v41, 0);
        session = self->_session;
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __62__AssistantVoiceController_tableView_didSelectRowAtIndexPath___block_invoke;
        v54[3] = &unk_24D33D0C0;
        v55 = v45;
        v47 = v45;
        -[SiriTTSDaemonSession speakWithPreviewRequest:didFinish:](session, "speakWithPreviewRequest:didFinish:", v42, v54);
        objc_msgSend(v47, "setVoicePreviewedForLanguageCode:name:", v36, v51);

        v9 = v49;
        v6 = v50;
        goto LABEL_43;
      }
      v40 = objc_msgSend(v51, "isEqualToString:", v22);

      if ((v40 & 1) != 0)
        goto LABEL_38;
    }
    else
    {

    }
    -[AssistantVoiceController voiceSettingsForLanguageCode:name:gender:](self, "voiceSettingsForLanguageCode:name:gender:", v52, v22, v17);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "inProgressVoice");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v36;
    if (v42)
    {
      v9 = v49;
      v6 = v50;
      if (+[ASTNetworkReachability hasNetworkConnection](ASTNetworkReachability, "hasNetworkConnection"))
      {
        if (!-[AssistantVoiceController isCellularDataPermissionAllowedForVoice:](self, "isCellularDataPermissionAllowedForVoice:", v42)&& +[ASTNetworkReachability hasExpensiveCellOnlyNetworkConnection](ASTNetworkReachability, "hasExpensiveCellOnlyNetworkConnection"))
        {
          objc_msgSend(v50, "deselectRowAtIndexPath:animated:", v7, 1);
          -[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:](self, "presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:", v41, v42);
LABEL_43:

          v34 = (void *)v52;
LABEL_44:

          goto LABEL_45;
        }
        v53.receiver = self;
        v53.super_class = (Class)AssistantVoiceController;
        -[AssistantVoiceController tableView:didSelectRowAtIndexPath:](&v53, sel_tableView_didSelectRowAtIndexPath_, v50, v7);
        -[AssistantVoiceController selectVoice:inProgressVoice:](self, "selectVoice:inProgressVoice:", v41, v42);
      }
      else
      {
        objc_msgSend(v50, "deselectRowAtIndexPath:animated:", v7, 1);
        -[AssistantVoiceController presentVoiceDownloadDisabledNoInternetAlert](self, "presentVoiceDownloadDisabledNoInternetAlert");
      }
      -[AssistantVoiceController playVoicePreview:](self, "playVoicePreview:", v42);
      goto LABEL_43;
    }
    v53.receiver = self;
    v53.super_class = (Class)AssistantVoiceController;
    v6 = v50;
    -[AssistantVoiceController tableView:didSelectRowAtIndexPath:](&v53, sel_tableView_didSelectRowAtIndexPath_, v50, v7);
    -[AssistantVoiceController selectVoice:inProgressVoice:](self, "selectVoice:inProgressVoice:", v41, 0);
    objc_msgSend(v41, "currentVoice");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceController playVoicePreview:](self, "playVoicePreview:", v43);

    v9 = v49;
    goto LABEL_43;
  }
LABEL_45:

}

uint64_t __62__AssistantVoiceController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreviewedSuccessfully:", a2 == 0);
}

- (void)selectVoice:(id)a3 inProgressVoice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  AFVoiceInfo *v12;
  AFVoiceInfo *v13;
  AFVoiceInfo *v14;
  AFVoiceInfo *v15;
  _QWORD v16[5];
  AFVoiceInfo *v17;
  AFVoiceInfo *v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[AssistantVoiceController selectVoice:inProgressVoice:]";
    _os_log_impl(&dword_2153F2000, v8, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices applying voice selection", buf, 0xCu);
  }
  objc_msgSend(v6, "currentVoice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantVoiceController viewModelWithInProgressVoice:currentVoice:](self, "viewModelWithInProgressVoice:currentVoice:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantVoiceController applyViewModel:](self, "applyViewModel:", v10);
  if (v7)
  {
    objc_msgSend(v10, "inProgressVoice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantVoiceController downloadVoice:](self, "downloadVoice:", v11);

  }
  else
  {
    -[AssistantVoiceController stopAllDownload](self, "stopAllDownload");
  }
  v12 = self->_currentVoice;
  v13 = self->_inProgressVoice;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __56__AssistantVoiceController_selectVoice_inProgressVoice___block_invoke;
  v16[3] = &unk_24D33D0E8;
  v16[4] = self;
  v17 = v13;
  v18 = v12;
  v14 = v12;
  v15 = v13;
  -[AssistantVoiceController registerUndoActionWithKey:urlString:undoAction:](self, "registerUndoActionWithKey:urlString:undoAction:", CFSTR("VOICE"), CFSTR("prefs:root=SIRI&path=VOICE_LANGUAGE_GROUP"), v16);
  -[AssistantVoiceController setAssistantInProgressVoice:](self, "setAssistantInProgressVoice:", v7);
  -[AssistantVoiceController setAssistantOutputVoice:](self, "setAssistantOutputVoice:", v9);
  -[AssistantVoiceController _signalDidSelectVoice](self, "_signalDidSelectVoice");

}

uint64_t __56__AssistantVoiceController_selectVoice_inProgressVoice___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAssistantInProgressVoice:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setAssistantOutputVoice:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)playVoicePreview:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SiriTTSDaemonSession *session;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    -[AssistantVoiceController metrics](self, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[AssistantVoiceController playVoicePreview:]";
      _os_log_impl(&dword_2153F2000, v6, OS_LOG_TYPE_DEFAULT, "%s #SiriTTSService playing preview", buf, 0xCu);
    }
    v7 = objc_alloc(MEMORY[0x24BEA7A58]);
    objc_msgSend(v4, "languageCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithLanguage:name:", v8, v9);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A28]), "initWithVoice:previewType:", v10, 0);
    session = self->_session;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __45__AssistantVoiceController_playVoicePreview___block_invoke;
    v16[3] = &unk_24D33D0C0;
    v17 = v5;
    v13 = v5;
    -[SiriTTSDaemonSession speakWithPreviewRequest:didFinish:](session, "speakWithPreviewRequest:didFinish:", v11, v16);
    objc_msgSend(v4, "languageCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setVoicePreviewedForLanguageCode:name:", v14, v15);
  }
}

uint64_t __45__AssistantVoiceController_playVoicePreview___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreviewedSuccessfully:", a2 == 0);
}

- (id)voiceSettingsForLanguageCode:(id)a3 name:(id)a4 gender:(int64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (objc_class *)MEMORY[0x24BE093A0];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v10, a5, 1, v9, 0, 0, 0);

  -[AssistantVoiceController deriveVoicesWithTargetVoice:currentVoice:](self, "deriveVoicesWithTargetVoice:currentVoice:", v11, self->_currentVoice);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)presentVoiceDownloadDisabledNoInternetAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[AssistantVoiceController presentVoiceDownloadDisabledNoInternetAlert]";
    _os_log_impl(&dword_2153F2000, v3, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices presenting no internet alert", (uint8_t *)&v16, 0xCu);
  }
  +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v6, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBD3A8];
  +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15);

  -[AssistantVoiceController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)presentVoiceDownloadDisabledNoWifiAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[AssistantVoiceController presentVoiceDownloadDisabledNoWifiAlert]";
    _os_log_impl(&dword_2153F2000, v3, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices presenting no Wi-Fi alert", (uint8_t *)&v16, 0xCu);
  }
  +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v6, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBD3A8];
  +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15);

  -[AssistantVoiceController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)presentVoiceDownloadConfirmationNoWifiAlertForVoice:(id)a3 inProgressVoice:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_log_t *v17;
  NSObject *v18;
  void *v19;
  float v20;
  float v21;
  NSObject *v22;
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
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  AssistantVoiceController *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  id v54;
  _QWORD v55[2];
  void *v56;
  _QWORD v57[3];
  _QWORD v58[5];

  v58[3] = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v6 = a4;
  v57[0] = &unk_24D348540;
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v7;
  v57[1] = &unk_24D348558;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v8;
  v57[2] = &unk_24D348570;
  objc_msgSend(MEMORY[0x24BEA7A78], "turiTrial");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEA7A68];
  objc_msgSend(MEMORY[0x24BEA7A80], "gryphonVoice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v13;
  objc_msgSend(MEMORY[0x24BEA7A80], "vocalizerVoice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v11;
  objc_msgSend(v12, "bestAssetOfTypes:matching:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (!v16)
  {
    v18 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:]";
      v53 = 2112;
      v54 = v6;
      _os_log_impl(&dword_2153F2000, v18, OS_LOG_TYPE_DEFAULT, "%s Unable to find a voice with voice predicate: %@", buf, 0x16u);
    }
  }
  objc_msgSend(v16, "downloadSize");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20;

  v22 = *v17;
  if (v21 <= 0.0)
  {
    v36 = v47;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
      -[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:].cold.1((uint64_t)v6, v22);
    -[AssistantVoiceController presentVoiceDownloadDisabledNoWifiAlert](self, "presentVoiceDownloadDisabledNoWifiAlert");
    -[AssistantVoiceController playVoicePreview:](self, "playVoicePreview:", v6);
  }
  else
  {
    v43 = self;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:]";
      v53 = 2112;
      v54 = v6;
      _os_log_impl(&dword_2153F2000, v22, OS_LOG_TYPE_DEFAULT, "%s #VoiceDownload presenting no Wi-Fi -should confirm cellular- alert for voice: %@", buf, 0x16u);
    }
    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD17C8];
    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", v27, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", (uint64_t)v21, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v28, v29);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v45, v44, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BEBD3A8];
    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", v33, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __96__AssistantVoiceController_presentVoiceDownloadConfirmationNoWifiAlertForVoice_inProgressVoice___block_invoke;
    v48[3] = &unk_24D33D110;
    v48[4] = v43;
    v35 = v6;
    v49 = v35;
    v36 = v47;
    v50 = v47;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v34, 0, v48);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAction:", v37);

    v38 = (void *)MEMORY[0x24BEBD3A8];
    +[AssistantVoiceController bundle](AssistantVoiceController, "bundle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", v40, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "actionWithTitle:style:handler:", v41, 1, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAction:", v42);

    -[AssistantVoiceController presentViewController:animated:completion:](v43, "presentViewController:animated:completion:", v30, 1, 0);
    -[AssistantVoiceController playVoicePreview:](v43, "playVoicePreview:", v35);

  }
}

uint64_t __96__AssistantVoiceController_presentVoiceDownloadConfirmationNoWifiAlertForVoice_inProgressVoice___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "grantCellularDataPermissionForVoice:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "selectVoice:inProgressVoice:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (BOOL)asset:(id)a3 matchesVoice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "primaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)downloadVoice:(id)a3
{
  id v4;
  void *v5;
  TTSAsset **p_downloadingAsset;
  TTSAsset *downloadingAsset;
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
  _BOOL8 v18;
  AssistantVoiceMetrics *metrics;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;
  _QWORD v32[2];
  void *v33;
  _QWORD v34[3];
  _QWORD v35[5];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    p_downloadingAsset = &self->_downloadingAsset;
    downloadingAsset = self->_downloadingAsset;
    if (!downloadingAsset
      || !+[AssistantVoiceController asset:matchesVoice:](AssistantVoiceController, "asset:matchesVoice:", downloadingAsset, v4))
    {
      v34[0] = &unk_24D348540;
      objc_msgSend(v4, "languageCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v8;
      v34[1] = &unk_24D348558;
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v9;
      v34[2] = &unk_24D348570;
      objc_msgSend(MEMORY[0x24BEA7A78], "turiTrial");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BEA7A68];
      objc_msgSend(MEMORY[0x24BEA7A80], "gryphonVoice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v14;
      objc_msgSend(MEMORY[0x24BEA7A80], "vocalizerVoice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bestAssetOfTypes:matching:", v16, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (*p_downloadingAsset)
        -[TTSAsset cancelDownloadingThen:](*p_downloadingAsset, "cancelDownloadingThen:", &__block_literal_global_241);
      objc_storeStrong((id *)&self->_downloadingAsset, v17);
      objc_initWeak(&location, self);
      v18 = -[AssistantVoiceController isCellularDataPermissionAllowedForVoice:](self, "isCellularDataPermissionAllowedForVoice:", v4);
      metrics = self->_metrics;
      objc_msgSend(v17, "primaryLanguage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AssistantVoiceMetrics setVoiceDownloadForLanguageCode:name:](metrics, "setVoiceDownloadForLanguageCode:name:", v20, v21);

      -[AssistantVoiceMetrics setIsCellularAllowed:](self->_metrics, "setIsCellularAllowed:", v18);
      -[AssistantVoiceMetrics beginDownloadObservation](self->_metrics, "beginDownloadObservation");
      v22 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __42__AssistantVoiceController_downloadVoice___block_invoke_2;
      v28[3] = &unk_24D33D1A0;
      objc_copyWeak(&v30, &location);
      v23 = v17;
      v29 = v23;
      v25[0] = v22;
      v25[1] = 3221225472;
      v25[2] = __42__AssistantVoiceController_downloadVoice___block_invoke_4;
      v25[3] = &unk_24D33D1C8;
      objc_copyWeak(&v27, &location);
      v24 = v23;
      v26 = v24;
      objc_msgSend(v24, "downloadWithReservation:useBattery:progress:then:", 0, 1, v28, v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);

    }
  }

}

void __42__AssistantVoiceController_downloadVoice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _QWORD v6[4];
  id v7;
  id v8[3];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__AssistantVoiceController_downloadVoice___block_invoke_3;
  v6[3] = &unk_24D33D178;
  objc_copyWeak(v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v8[1] = a2;
  v8[2] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(v8);
}

void __42__AssistantVoiceController_downloadVoice___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  float v7;
  float v8;
  void *v9;
  double v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "downloadingAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v11;
    if (v3 == v4)
    {
      v6 = *(_QWORD *)(a1 + 56);
      v7 = (float)v6;
      if (!v6)
        v7 = 1.0;
      *(float *)&v5 = (float)*(uint64_t *)(a1 + 48) / v7;
      v8 = *(float *)&v5;
      objc_msgSend(v11, "updateDownloadProgress:", v5);
      objc_msgSend(v11, "metrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v10 = v8;
      objc_msgSend(v9, "setDownloadObservationProgress:", v10);

      WeakRetained = v11;
    }
  }

}

void __42__AssistantVoiceController_downloadVoice___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AssistantVoiceController_downloadVoice___block_invoke_5;
  block[3] = &unk_24D33CC30;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __42__AssistantVoiceController_downloadVoice___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v14 = WeakRetained;
    objc_msgSend(WeakRetained, "downloadingAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v14;
    if (v3 == v4)
    {
      objc_msgSend(v14, "setDownloadingAsset:", 0);
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(v14, "inProgressVoice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAssistantOutputVoice:", v6);

        objc_msgSend(v14, "setAssistantInProgressVoice:", 0);
        objc_msgSend(v14, "metrics");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = 1.0;
        objc_msgSend(v7, "setDownloadObservationProgress:", v8);

        objc_msgSend(v14, "metrics");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sendAnalyticsEvent");

        objc_msgSend(v14, "resetMetrics");
        objc_msgSend(v14, "currentVoice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "viewModelWithInProgressVoice:currentVoice:", 0, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "applyViewModel:", v11);
      }
      else
      {
        LODWORD(v5) = -1.0;
        objc_msgSend(v14, "updateDownloadProgress:", v5);
        objc_msgSend(v14, "metrics");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDownloadError:", 1);

        objc_msgSend(v14, "metrics");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sendAnalyticsEvent");

        objc_msgSend(v14, "resetMetrics");
      }
      WeakRetained = v14;
    }
  }

}

- (void)stopAllDownload
{
  TTSAsset *downloadingAsset;
  TTSAsset *v4;

  downloadingAsset = self->_downloadingAsset;
  if (downloadingAsset)
  {
    -[TTSAsset cancelDownloadingThen:](downloadingAsset, "cancelDownloadingThen:", &__block_literal_global_243);
    v4 = self->_downloadingAsset;
    self->_downloadingAsset = 0;

  }
}

- (void)_signalDidSelectVoice
{
  AssistantSettingsSignalEmitter *signalEmitter;
  AssistantSettingsSignalEmitter *v4;
  AssistantSettingsSignalEmitter *v5;

  signalEmitter = self->_signalEmitter;
  if (!signalEmitter)
  {
    v4 = objc_alloc_init(AssistantSettingsSignalEmitter);
    v5 = self->_signalEmitter;
    self->_signalEmitter = v4;

    signalEmitter = self->_signalEmitter;
  }
  -[AssistantSettingsSignalEmitter emitDidSelectVoiceSignal](signalEmitter, "emitDidSelectVoiceSignal");
}

- (void)updateFooterText:(id)a3 forSpecifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v15 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = *MEMORY[0x24BE75A68];
    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75A68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v15) & 1) == 0)
    {
      objc_msgSend(v7, "setProperty:forKey:", v15, v8);
      -[AssistantVoiceController indexPathForSpecifier:](self, "indexPathForSpecifier:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AssistantVoiceController table](self, "table");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "footerViewForSection:", objc_msgSend(v10, "section"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[AssistantVoiceController table](self, "table");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __58__AssistantVoiceController_updateFooterText_forSpecifier___block_invoke;
      v16[3] = &unk_24D33CDC0;
      v17 = v12;
      v18 = v15;
      v14 = v12;
      objc_msgSend(v13, "performBatchUpdates:completion:", v16, 0);

    }
  }

}

void __58__AssistantVoiceController_updateFooterText_forSpecifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v1);

}

- (BOOL)isVoiceInstalled:(id)a3
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
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, &unk_24D348540);

    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, &unk_24D348558);

    objc_msgSend(MEMORY[0x24BEA7A70], "premium");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, &unk_24D348588);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24D3485A0);
    v9 = (void *)MEMORY[0x24BEA7A68];
    objc_msgSend(MEMORY[0x24BEA7A80], "gryphonVoice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BEA7A80], "vocalizerVoice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "listAssetsOfTypes:matching:", v12, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "count") != 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)grantCellularDataPermissionForVoice:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[AssistantVoiceController grantCellularDataPermissionForVoice:]";
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2153F2000, v5, OS_LOG_TYPE_DEFAULT, "%s #VoiceServices allowing cellular for: %@ %@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(v3, "languageCode");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)allowedCellularLanguage;
  allowedCellularLanguage = v8;

  objc_msgSend(v3, "name");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)allowedCellularVoiceName;
  allowedCellularVoiceName = v10;

}

- (BOOL)isCellularDataPermissionAllowedForVoice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  v4 = (void *)allowedCellularLanguage;
  objc_msgSend(v3, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    if (v3)
    {
      v6 = (void *)allowedCellularVoiceName;
      objc_msgSend(v3, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
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

  -[AssistantVoiceController pe_registerUndoActionName:associatedDeepLink:undoAction:](self, "pe_registerUndoActionName:associatedDeepLink:undoAction:", v17, v16, v9);
}

- (SUICAssistantVoiceSettingsConnection)settingsConnection
{
  return self->_settingsConnection;
}

- (void)setSettingsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_settingsConnection, a3);
}

- (PSSpecifier)languageGroupSpecifier
{
  return self->_languageGroupSpecifier;
}

- (void)setLanguageGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_languageGroupSpecifier, a3);
}

- (PSSpecifier)languageProto
{
  return self->_languageProto;
}

- (void)setLanguageProto:(id)a3
{
  objc_storeStrong((id *)&self->_languageProto, a3);
}

- (NSArray)languageSpecifiers
{
  return self->_languageSpecifiers;
}

- (void)setLanguageSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_languageSpecifiers, a3);
}

- (PSSpecifier)voiceVariationGroupSpecifier
{
  return self->_voiceVariationGroupSpecifier;
}

- (void)setVoiceVariationGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_voiceVariationGroupSpecifier, a3);
}

- (PSSpecifier)voiceVariationProto
{
  return self->_voiceVariationProto;
}

- (void)setVoiceVariationProto:(id)a3
{
  objc_storeStrong((id *)&self->_voiceVariationProto, a3);
}

- (NSArray)cellularUpdatesSpecifiers
{
  return self->_cellularUpdatesSpecifiers;
}

- (void)setCellularUpdatesSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_cellularUpdatesSpecifiers, a3);
}

- (TTSAsset)downloadingAsset
{
  return self->_downloadingAsset;
}

- (void)setDownloadingAsset:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingAsset, a3);
}

- (NSArray)voiceVariationSpecifiers
{
  return self->_voiceVariationSpecifiers;
}

- (void)setVoiceVariationSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_voiceVariationSpecifiers, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (AFVoiceInfo)inProgressVoice
{
  return self->_inProgressVoice;
}

- (void)setInProgressVoice:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressVoice, a3);
}

- (AFVoiceInfo)currentVoice
{
  return self->_currentVoice;
}

- (void)setCurrentVoice:(id)a3
{
  objc_storeStrong((id *)&self->_currentVoice, a3);
}

- (BOOL)ignoreNextVoiceChangeNotification
{
  return self->_ignoreNextVoiceChangeNotification;
}

- (void)setIgnoreNextVoiceChangeNotification:(BOOL)a3
{
  self->_ignoreNextVoiceChangeNotification = a3;
}

- (AssistantVoiceViewModel)currentViewModel
{
  return self->_currentViewModel;
}

- (void)setCurrentViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewModel, a3);
}

- (AssistantVoiceMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (SiriTTSDaemonSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_currentViewModel, 0);
  objc_storeStrong((id *)&self->_currentVoice, 0);
  objc_storeStrong((id *)&self->_inProgressVoice, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_voiceVariationSpecifiers, 0);
  objc_storeStrong((id *)&self->_downloadingAsset, 0);
  objc_storeStrong((id *)&self->_cellularUpdatesSpecifiers, 0);
  objc_storeStrong((id *)&self->_voiceVariationProto, 0);
  objc_storeStrong((id *)&self->_voiceVariationGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_languageSpecifiers, 0);
  objc_storeStrong((id *)&self->_languageProto, 0);
  objc_storeStrong((id *)&self->_languageGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_signalEmitter, 0);
}

- (void)languageCodeDidChange:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2153F2000, a1, a3, "%s #VoiceServices languageCodeDidChange, will reload specifiers", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)outputVoiceDidChange:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2153F2000, a1, a3, "%s #VoiceServices outputVoiceDidChange, will reload specifiers", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)presentVoiceDownloadConfirmationNoWifiAlertForVoice:(uint64_t)a1 inProgressVoice:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[AssistantVoiceController presentVoiceDownloadConfirmationNoWifiAlertForVoice:inProgressVoice:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_2153F2000, a2, OS_LOG_TYPE_DEBUG, "%s #VoiceDownload unknown download size for voice: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
