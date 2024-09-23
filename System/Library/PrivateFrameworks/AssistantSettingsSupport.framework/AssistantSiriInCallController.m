@implementation AssistantSiriInCallController

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sAssistantBundle;
  if (!bundle_sAssistantBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sAssistantBundle;
    bundle_sAssistantBundle = v3;

    v2 = (void *)bundle_sAssistantBundle;
  }
  return v2;
}

+ (BOOL)isSettingSupported
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(a1, "_config"), "supported");
}

+ (BOOL)isSettingEnabled
{
  return objc_msgSend((id)objc_msgSend(a1, "_config"), "enabled");
}

+ (id)localizedSettingName
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(a1, "_config"), "localizationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AssistantSiriInCallController;
  -[AssistantSiriInCallController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SIRI_IN_CALL_GROUP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantSiriInCallController _localizedFooterText](self, "_localizedFooterText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);

    v7 = (void *)MEMORY[0x24BE75590];
    +[AssistantSiriInCallController localizedSettingName](AssistantSiriInCallController, "localizedSettingName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, sel_setEnabled_specifier_, sel_enabled_, 0, 6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v5;
    v13[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v10;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)AssistantSiriInCallController;
  -[AssistantSiriInCallController viewDidAppear:](&v23, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Siri/SIRI_IN_CALL_ID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithKey:table:locale:bundleURL:", CFSTR("Call Hang Up"), 0, v5, v7);

  +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "deviceSupported");

  if ((_DWORD)v6)
    v10 = CFSTR("Apple Intelligence & Siri");
  else
    v10 = CFSTR("Siri");
  v11 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithKey:table:locale:bundleURL:", v10, 0, v12, v14);

  v16 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithKey:table:locale:bundleURL:", CFSTR("Call Hang Up"), 0, v17, v19);

  v24[0] = v15;
  v24[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantSiriInCallController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.siri"), v8, v21, v22);

}

+ (Class)_config
{
  void *v2;

  v2 = (void *)objc_opt_class();
  if (AFSupportsSiriInCall())
    v2 = (void *)objc_opt_class();
  return (Class)v2;
}

- (id)enabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[objc_class enabled](+[AssistantSiriInCallController _config](AssistantSiriInCallController, "_config", a3), "enabled"));
}

- (void)setEnabled:(id)a3 specifier:(id)a4
{
  id v4;
  objc_class *v5;
  uint64_t v6;

  v4 = a3;
  v5 = +[AssistantSiriInCallController _config](AssistantSiriInCallController, "_config");
  v6 = objc_msgSend(v4, "BOOLValue");

  -[objc_class setEnabled:](v5, "setEnabled:", v6);
}

- (id)_localizedFooterText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;

  -[objc_class localizationFooterKey](+[AssistantSiriInCallController _config](AssistantSiriInCallController, "_config"), "localizationFooterKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("_EXPLANATION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((MEMORY[0x2199E0EEC]() & 1) == 0)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("_HEADPHONES_ONLY"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  -[AssistantSiriInCallController bundle](self, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v4, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = +[AssistantSiriInCallController _config](AssistantSiriInCallController, "_config");
  if (v8 == (objc_class *)objc_opt_class())
  {
    -[AssistantSiriInCallController _localizedHangUpTriggerPhrase](self, "_localizedHangUpTriggerPhrase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }

  return v7;
}

- (id)_localizedHangUpTriggerPhrase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTriggerPhraseForLanguageCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantSiriInCallController bundle](self, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:table:bundle:languageCode:", CFSTR("CALL_HANG_UP_TRIGGER_PHRASE"), CFSTR("AssistantSettings"), v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length") && objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[AssistantSiriInCallController _localizedHangUpTriggerPhrase]";
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_2153F2000, v12, OS_LOG_TYPE_DEFAULT, "%s languageCode: %@, triggerPhrase: %@", buf, 0x20u);
    }

  }
  else
  {
    v13 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AssistantSiriInCallController _localizedHangUpTriggerPhrase].cold.1((uint64_t)v4, v13);
    v11 = &stru_24D33E0B0;
  }

  return v11;
}

- (void)_localizedHangUpTriggerPhrase
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[AssistantSiriInCallController _localizedHangUpTriggerPhrase]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_2153F2000, a2, OS_LOG_TYPE_ERROR, "%s Missing localization for trigger phrase, languageCode: %@", (uint8_t *)&v2, 0x16u);
}

@end
