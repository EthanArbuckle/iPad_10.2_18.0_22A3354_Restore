@implementation AssistantAudioFeedbackController

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sAssistantBundle_4;
  if (!bundle_sAssistantBundle_4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sAssistantBundle_4;
    bundle_sAssistantBundle_4 = v3;

    v2 = (void *)bundle_sAssistantBundle_4;
  }
  return v2;
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
  v25.super_class = (Class)AssistantAudioFeedbackController;
  -[AssistantAudioFeedbackController viewDidAppear:](&v25, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Siri/VOICE_FEEDBACK_ID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithKey:table:locale:bundleURL:", CFSTR("Siri Responses"), 0, v7, v9);

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
  v22 = (void *)objc_msgSend(v18, "initWithKey:table:locale:bundleURL:", CFSTR("Siri Responses"), 0, v19, v21);

  v26[0] = v17;
  v26[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantAudioFeedbackController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.siri"), v10, v23, v24);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AssistantAudioFeedbackController;
  -[AssistantAudioFeedbackController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE08EB8], 0);

}

- (void)preferencesDidChange:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useDeviceSpeakerForTTS");

  if (v5 != self->_useDeviceSpeakerForTTSPreference)
    self->_useDeviceSpeakerForTTSPreference = v5;
  -[AssistantAudioFeedbackController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *groupSpecifier;
  PSSpecifier *v8;
  PSSpecifier *preferSilentResponsesSpecifier;
  PSSpecifier *v10;
  PSSpecifier *automaticSpecifier;
  PSSpecifier *v12;
  PSSpecifier *preferSpokenResponsesSpecifier;
  PSSpecifier *v14;
  PSSpecifier *preferredAudioRouteGroupSpecifier;
  PSSpecifier *v16;
  PSSpecifier *preferredAudioRouteBluetoothSpecifier;
  PSSpecifier *v18;
  PSSpecifier *preferredAudioRouteCarRadioSpecifier;
  PSSpecifier *v20;
  PSSpecifier *preferredAudioRoutePhoneSpeakerSpecifier;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[AssistantAudioFeedbackController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("AssistantAudioFeedback"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("VOICE_FEEDBACK_GROUP_ID"));
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v6;

    objc_msgSend(v5, "specifierForID:", CFSTR("VOICE_FEEDBACK_PREFER_SILENT_RESPONSES_ID"));
    v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    preferSilentResponsesSpecifier = self->_preferSilentResponsesSpecifier;
    self->_preferSilentResponsesSpecifier = v8;

    objc_msgSend(v5, "specifierForID:", CFSTR("VOICE_FEEDBACK_AUTOMATIC_ID"));
    v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    automaticSpecifier = self->_automaticSpecifier;
    self->_automaticSpecifier = v10;

    objc_msgSend(v5, "specifierForID:", CFSTR("VOICE_FEEDBACK_PREFER_SPOKEN_RESPONSES_ID"));
    v12 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    preferSpokenResponsesSpecifier = self->_preferSpokenResponsesSpecifier;
    self->_preferSpokenResponsesSpecifier = v12;

    objc_msgSend(v5, "specifierForID:", CFSTR("PREFERRED_AUDIO_GROUP_ID"));
    v14 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    preferredAudioRouteGroupSpecifier = self->_preferredAudioRouteGroupSpecifier;
    self->_preferredAudioRouteGroupSpecifier = v14;

    objc_msgSend(v5, "specifierForID:", CFSTR("PREFFERED_AUDIO_ROUTE_BLUETOOTH_AUDIO_ID"));
    v16 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    preferredAudioRouteBluetoothSpecifier = self->_preferredAudioRouteBluetoothSpecifier;
    self->_preferredAudioRouteBluetoothSpecifier = v16;

    objc_msgSend(v5, "specifierForID:", CFSTR("PREFERRED_AUDIO_ROUTE_CAR_RADIO_ID"));
    v18 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    preferredAudioRouteCarRadioSpecifier = self->_preferredAudioRouteCarRadioSpecifier;
    self->_preferredAudioRouteCarRadioSpecifier = v18;

    objc_msgSend(v5, "specifierForID:", CFSTR("PREFERRED_AUDIO_ROUTE_PHONE_SPEAKER_ID"));
    v20 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    preferredAudioRoutePhoneSpeakerSpecifier = self->_preferredAudioRoutePhoneSpeakerSpecifier;
    self->_preferredAudioRoutePhoneSpeakerSpecifier = v20;

    -[AssistantAudioFeedbackController _hideSiriBluetoothVehicleAudioRouteSettingsIfNeeded:](self, "_hideSiriBluetoothVehicleAudioRouteSettingsIfNeeded:", v5);
    if (!-[AssistantAudioFeedbackController _isDeviceSpeakerSupportedForBluetoothAudioRoute](self, "_isDeviceSpeakerSupportedForBluetoothAudioRoute"))
    {
      v22 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v29 = 136315138;
        v30 = "-[AssistantAudioFeedbackController specifiers]";
        _os_log_impl(&dword_2153F2000, v22, OS_LOG_TYPE_DEFAULT, "%s The current device doesn't support device speaker option. Removing option.", (uint8_t *)&v29, 0xCu);
      }
      objc_msgSend(v5, "removeObject:", self->_preferredAudioRoutePhoneSpeakerSpecifier);
    }
    +[GMEligibilityProvider shared](_TtC24AssistantSettingsSupport21GMEligibilityProvider, "shared");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "activeEnabled");

    if (v24)
    {
      objc_msgSend(v5, "specifierForID:", CFSTR("ALWAYS_PRINT_RESPONSE_GROUP_ID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v25);
      objc_msgSend(v5, "specifierForID:", CFSTR("ALWAYS_PRINT_RESPONSE_ID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v26);

    }
    v27 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    -[AssistantAudioFeedbackController _updateSpecifiersFromPreferences](self, "_updateSpecifiersFromPreferences");
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_hideSiriBluetoothVehicleAudioRouteSettingsIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("showBTAudioRouteSetting"), CFSTR("com.apple.siri.CarBluetooth"), 0))
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[AssistantAudioFeedbackController _hideSiriBluetoothVehicleAudioRouteSettingsIfNeeded:]";
      _os_log_impl(&dword_2153F2000, v5, OS_LOG_TYPE_DEFAULT, "%s Hiding the BT Car Audio Route Settings.", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend(v4, "removeObject:", self->_preferredAudioRouteGroupSpecifier);
    objc_msgSend(v4, "removeObject:", self->_preferredAudioRoutePhoneSpeakerSpecifier);
    objc_msgSend(v4, "removeObject:", self->_preferredAudioRouteBluetoothSpecifier);
    objc_msgSend(v4, "removeObject:", self->_preferredAudioRouteCarRadioSpecifier);
  }

}

- (void)_updateSpecifiersFromPreferences
{
  -[AssistantAudioFeedbackController _updateDeviceSpeakerForTTSSpecifiersFromPreferences](self, "_updateDeviceSpeakerForTTSSpecifiersFromPreferences");
  -[AssistantAudioFeedbackController _updatePreferedAudioRouteFromPreferences](self, "_updatePreferedAudioRouteFromPreferences");
}

- (void)_updateDeviceSpeakerForTTSSpecifiersFromPreferences
{
  void *v3;
  unint64_t v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_useDeviceSpeakerForTTSPreference = objc_msgSend(v3, "useDeviceSpeakerForTTS");

  v4 = self->_useDeviceSpeakerForTTSPreference - 1;
  if (v4 > 2)
    v5 = 0;
  else
    v5 = *(id *)((char *)&self->super.super.super.super.super.isa + *off_24D33D690[v4]);
  v6 = v5;
  -[PSSpecifier setProperty:forKey:](self->_groupSpecifier, "setProperty:forKey:", v5, *MEMORY[0x24BE75C20]);
  -[AssistantAudioFeedbackController _refreshFooterForSpecifier:](self, "_refreshFooterForSpecifier:", v6);

}

- (void)_updatePreferedAudioRouteFromPreferences
{
  void *v3;
  NSString *v4;
  NSString *preferredCarAudioRoute;
  int *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bluetoothPreferredCarAudioRoute");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredCarAudioRoute = self->_preferredCarAudioRoute;
  self->_preferredCarAudioRoute = v4;

  if ((-[NSString isEqual:](self->_preferredCarAudioRoute, "isEqual:", CFSTR("A2DP")) & 1) != 0)
  {
    v6 = &OBJC_IVAR___AssistantAudioFeedbackController__preferredAudioRouteBluetoothSpecifier;
  }
  else if (-[AssistantAudioFeedbackController _isDeviceSpeakerSupportedForBluetoothAudioRoute](self, "_isDeviceSpeakerSupportedForBluetoothAudioRoute")&& (-[NSString isEqual:](self->_preferredCarAudioRoute, "isEqual:", CFSTR("DeviceSpeaker")) & 1) != 0)
  {
    v6 = &OBJC_IVAR___AssistantAudioFeedbackController__preferredAudioRoutePhoneSpeakerSpecifier;
  }
  else
  {
    v6 = &OBJC_IVAR___AssistantAudioFeedbackController__preferredAudioRouteCarRadioSpecifier;
  }
  v7 = *(id *)((char *)&self->super.super.super.super.super.isa + *v6);
  -[PSSpecifier setProperty:forKey:](self->_preferredAudioRouteGroupSpecifier, "setProperty:forKey:", v7, *MEMORY[0x24BE75C20]);
  -[AssistantAudioFeedbackController _refreshFooterForSpecifier:](self, "_refreshFooterForSpecifier:", v7);

}

- (id)footerVariant
{
  if (+[AssistantUtilities deviceIsiPhone](AssistantUtilities, "deviceIsiPhone"))
    return CFSTR("IPHONE");
  else
    return CFSTR("IPAD");
}

- (void)_refreshFooterForSpecifier:(id)a3
{
  id v4;

  v4 = a3;
  -[AssistantAudioFeedbackController _refreshFooterForUpdateDeviceSpeakerForTTSSpecifiers:](self, "_refreshFooterForUpdateDeviceSpeakerForTTSSpecifiers:", v4);
  -[AssistantAudioFeedbackController _refreshFooterForPreferredAudioRouteSpecifier:](self, "_refreshFooterForPreferredAudioRouteSpecifier:", v4);

}

- (void)_refreshFooterForUpdateDeviceSpeakerForTTSSpecifiers:(id)a3
{
  PSSpecifier *v4;
  __CFString *v5;
  PSSpecifier *groupSpecifier;
  void *v7;
  void *v8;
  void *v9;
  PSSpecifier *v10;

  v4 = (PSSpecifier *)a3;
  v10 = v4;
  if (self->_preferSilentResponsesSpecifier == v4)
  {
    v5 = CFSTR("VOICE_FEEDBACK_FOOTER_PREFER_SILENT_RESPONSES_");
  }
  else if (self->_automaticSpecifier == v4)
  {
    v5 = CFSTR("VOICE_FEEDBACK_FOOTER_AUTOMATIC_");
  }
  else
  {
    if (self->_preferSpokenResponsesSpecifier != v4)
      goto LABEL_9;
    v5 = CFSTR("VOICE_FEEDBACK_FOOTER_PREFER_SPOKEN_RESPONSES_");
  }
  if (-[__CFString length](v5, "length"))
  {
    groupSpecifier = self->_groupSpecifier;
    -[AssistantAudioFeedbackController footerVariant](self, "footerVariant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantAudioFeedbackController _localizeTriggerString:](self, "_localizeTriggerString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](groupSpecifier, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);

  }
LABEL_9:

}

- (void)_refreshFooterForPreferredAudioRouteSpecifier:(id)a3
{
  __CFString *v4;
  PSSpecifier *preferredAudioRouteGroupSpecifier;
  void *v6;
  PSSpecifier *v7;

  v7 = (PSSpecifier *)a3;
  if (self->_preferredAudioRouteCarRadioSpecifier == v7)
  {
    v4 = CFSTR("PREFERRED_AUDIO_ROUTE_CAR_RADIO_FOOTER_TEXT");
  }
  else if (-[AssistantAudioFeedbackController _isDeviceSpeakerSupportedForBluetoothAudioRoute](self, "_isDeviceSpeakerSupportedForBluetoothAudioRoute")&& self->_preferredAudioRoutePhoneSpeakerSpecifier == v7)
  {
    v4 = CFSTR("PREFERRED_AUDIO_ROUTE_PHONE_SPEAKER_FOOTER_TEXT");
  }
  else if (self->_preferredAudioRouteBluetoothSpecifier == v7)
  {
    v4 = CFSTR("PREFFERED_AUDIO_ROUTE_BLUETOOTH_AUDIO_FOOTER_TEXT");
  }
  else
  {
    v4 = 0;
  }
  if (AFIsInternalInstall())
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("_INTERNAL"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v4 && -[__CFString length](v4, "length"))
  {
    preferredAudioRouteGroupSpecifier = self->_preferredAudioRouteGroupSpecifier;
    -[AssistantAudioFeedbackController _localizeTriggerString:](self, "_localizeTriggerString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](preferredAudioRouteGroupSpecifier, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AssistantAudioFeedbackController;
  v6 = a4;
  -[AssistantAudioFeedbackController tableView:didSelectRowAtIndexPath:](&v10, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = -[AssistantAudioFeedbackController indexForIndexPath:](self, "indexForIndexPath:", v6, v10.receiver, v10.super_class);

  -[AssistantAudioFeedbackController specifierAtIndex:](self, "specifierAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantAudioFeedbackController _refreshFooterForSpecifier:](self, "_refreshFooterForSpecifier:", v8);
  -[AssistantAudioFeedbackController _updatePreferencesIfNeeded:](self, "_updatePreferencesIfNeeded:", v8);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronize");

}

- (void)_updatePreferencesIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  -[AssistantAudioFeedbackController _updateDeviceSpeakerForTTSPreferenceIfNeeded:](self, "_updateDeviceSpeakerForTTSPreferenceIfNeeded:", v4);
  -[AssistantAudioFeedbackController _updatePreferredAudioRouteIfNeeded:](self, "_updatePreferredAudioRouteIfNeeded:", v4);

}

- (void)_updateDeviceSpeakerForTTSPreferenceIfNeeded:(id)a3
{
  PSSpecifier *v4;
  PSSpecifier *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v4 = (PSSpecifier *)a3;
  v5 = v4;
  if (self->_preferSilentResponsesSpecifier == v4)
  {
    v6 = 3;
  }
  else if (self->_automaticSpecifier == v4)
  {
    v6 = 1;
  }
  else
  {
    if (self->_preferSpokenResponsesSpecifier != v4)
      goto LABEL_8;
    v6 = 2;
  }
  self->_useDeviceSpeakerForTTSPreference = v6;
LABEL_8:
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "useDeviceSpeakerForTTS");

  if (v8 != self->_useDeviceSpeakerForTTSPreference)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __81__AssistantAudioFeedbackController__updateDeviceSpeakerForTTSPreferenceIfNeeded___block_invoke;
    v10[3] = &unk_24D33D670;
    v10[4] = self;
    v10[5] = v8;
    -[AssistantAudioFeedbackController registerUndoActionWithKey:urlString:undoAction:](self, "registerUndoActionWithKey:urlString:undoAction:", CFSTR("VOICE_FEEDBACK"), CFSTR("prefs:root=SIRI&path=VOICE_FEEDBACK_ID"), v10);
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUseDeviceSpeakerForTTS:", self->_useDeviceSpeakerForTTSPreference);

  }
}

uint64_t __81__AssistantAudioFeedbackController__updateDeviceSpeakerForTTSPreferenceIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUseDeviceSpeakerForTTS:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)_updatePreferredAudioRouteIfNeeded:(id)a3
{
  PSSpecifier *v4;
  NSString *preferredCarAudioRoute;
  __CFString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  NSString *v14;
  AssistantAudioFeedbackController *v15;

  v4 = (PSSpecifier *)a3;
  if (self->_preferredAudioRouteBluetoothSpecifier == v4)
  {
    preferredCarAudioRoute = self->_preferredCarAudioRoute;
    v6 = CFSTR("A2DP");
  }
  else if (-[AssistantAudioFeedbackController _isDeviceSpeakerSupportedForBluetoothAudioRoute](self, "_isDeviceSpeakerSupportedForBluetoothAudioRoute")&& self->_preferredAudioRoutePhoneSpeakerSpecifier == v4)
  {
    preferredCarAudioRoute = self->_preferredCarAudioRoute;
    v6 = CFSTR("DeviceSpeaker");
  }
  else
  {
    preferredCarAudioRoute = self->_preferredCarAudioRoute;
    v6 = CFSTR("HFP");
  }
  self->_preferredCarAudioRoute = &v6->isa;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bluetoothPreferredCarAudioRoute");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (self->_preferredCarAudioRoute != v8)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __71__AssistantAudioFeedbackController__updatePreferredAudioRouteIfNeeded___block_invoke;
    v13 = &unk_24D33CDC0;
    v14 = v8;
    v15 = self;
    -[AssistantAudioFeedbackController registerUndoActionWithKey:urlString:undoAction:](self, "registerUndoActionWithKey:urlString:undoAction:", CFSTR("PREFERRED_AUDIO_ROUTE_TITLE"), CFSTR("prefs:root=SIRI&path=PREFERRED_AUDIO_GROUP_ID"), &v10);
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBluetoothPreferredCarAudioRoute:", self->_preferredCarAudioRoute);

  }
}

uint64_t __71__AssistantAudioFeedbackController__updatePreferredAudioRouteIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBluetoothPreferredCarAudioRoute:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "reloadSpecifiers");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AssistantAudioFeedbackController;
  -[AssistantAudioFeedbackController tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  return v4;
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
  +[AssistantAudioFeedbackController bundle](AssistantAudioFeedbackController, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v4, &stru_24D33E0B0, CFSTR("AssistantAudioFeedback"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)isAlwaysPrintSiriResponseEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "siriResponseShouldAlwaysPrint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAlwaysPrintSiriResponseEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  AssistantAudioFeedbackController *v13;

  v5 = a3;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __83__AssistantAudioFeedbackController_setAlwaysPrintSiriResponseEnabled_forSpecifier___block_invoke;
  v11 = &unk_24D33CDC0;
  v12 = v5;
  v13 = self;
  v6 = v5;
  -[AssistantAudioFeedbackController registerUndoActionWithKey:urlString:undoAction:](self, "registerUndoActionWithKey:urlString:undoAction:", CFSTR("ALWAYS_PRINT_RESPONSE"), CFSTR("prefs:root=SIRI&path=VOICE_FEEDBACK_ID/ALWAYS_PRINT_RESPONSE_GROUP_ID"), &v8);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSiriResponseShouldAlwaysPrint:", objc_msgSend(v6, "BOOLValue"));

}

uint64_t __83__AssistantAudioFeedbackController_setAlwaysPrintSiriResponseEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSiriResponseShouldAlwaysPrint:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1);

  return objc_msgSend(*(id *)(a1 + 40), "reloadSpecifiers");
}

- (BOOL)_isDeviceSpeakerSupportedForBluetoothAudioRoute
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickableRoutesForCategory:andMode:", *MEMORY[0x24BE094C8], CFSTR("Default"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    v7 = (_QWORD *)MEMORY[0x24BE64900];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", *v7, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        if ((v10 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)alwaysShowRecognizedSpeech
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "alwaysShowRecognizedSpeech"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAlwaysShowRecognizedSpeech:(id)a3 forSpecifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  AssistantAudioFeedbackController *v13;

  v5 = a3;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __79__AssistantAudioFeedbackController_setAlwaysShowRecognizedSpeech_forSpecifier___block_invoke;
  v11 = &unk_24D33CDC0;
  v12 = v5;
  v13 = self;
  v6 = v5;
  -[AssistantAudioFeedbackController registerUndoActionWithKey:urlString:undoAction:](self, "registerUndoActionWithKey:urlString:undoAction:", CFSTR("ALWAYS_SHOW_RECOGNIZED_SPEECH"), CFSTR("prefs:root=SIRI&path=VOICE_FEEDBACK_ID/ALWAYS_SHOW_RECOGNIZED_SPEECH_GROUP_ID"), &v8);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlwaysShowRecognizedSpeech:", objc_msgSend(v6, "BOOLValue"));

}

uint64_t __79__AssistantAudioFeedbackController_setAlwaysShowRecognizedSpeech_forSpecifier___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlwaysShowRecognizedSpeech:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1);

  return objc_msgSend(*(id *)(a1 + 40), "reloadSpecifiers");
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
  v17 = (id)objc_msgSend(v12, "initWithKey:table:locale:bundleURL:", v11, CFSTR("AssistantAudioFeedback"), v13, v15);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[AssistantAudioFeedbackController pe_registerUndoActionName:associatedDeepLink:undoAction:](self, "pe_registerUndoActionName:associatedDeepLink:undoAction:", v17, v16, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredCarAudioRoute, 0);
  objc_storeStrong((id *)&self->_preferredAudioRouteGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_preferredAudioRoutePhoneSpeakerSpecifier, 0);
  objc_storeStrong((id *)&self->_preferredAudioRouteCarRadioSpecifier, 0);
  objc_storeStrong((id *)&self->_preferredAudioRouteBluetoothSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_preferSpokenResponsesSpecifier, 0);
  objc_storeStrong((id *)&self->_automaticSpecifier, 0);
  objc_storeStrong((id *)&self->_preferSilentResponsesSpecifier, 0);
}

@end
