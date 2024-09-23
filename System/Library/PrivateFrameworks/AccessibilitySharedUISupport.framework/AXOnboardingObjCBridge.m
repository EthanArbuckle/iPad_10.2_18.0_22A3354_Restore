@implementation AXOnboardingObjCBridge

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance___instance;
}

void __40__AXOnboardingObjCBridge_sharedInstance__block_invoke()
{
  AXOnboardingObjCBridge *v0;
  void *v1;

  v0 = objc_alloc_init(AXOnboardingObjCBridge);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (id)_keyboardNotificationsToObserve
{
  return &unk_24E089F60;
}

- (void)_listenForKeyboardNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  -[AXOnboardingObjCBridge _keyboardNotificationsToObserve](self, "_keyboardNotificationsToObserve");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXOnboardingObjCBridge _isListening](self, "_isListening");
  if (v3)
  {
    if (!v7)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__adjustForKeyboard, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), 0);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v10);
      }
LABEL_19:

      -[AXOnboardingObjCBridge set_isListening:](self, "set_isListening:", v3);
    }
  }
  else if (v7)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v6, "removeObserver:name:object:", self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), 0, (_QWORD)v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }
    goto LABEL_19;
  }

}

- (id)_setupKeyboardNotificationsIfNecessary
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__AXOnboardingObjCBridge__setupKeyboardNotificationsIfNecessary__block_invoke;
  block[3] = &unk_24E077190;
  block[4] = self;
  if (_setupKeyboardNotificationsIfNecessary_onceToken != -1)
    dispatch_once(&_setupKeyboardNotificationsIfNecessary_onceToken, block);
  return 0;
}

void __64__AXOnboardingObjCBridge__setupKeyboardNotificationsIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__adjustForKeyboard, *MEMORY[0x24BEBE580], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__adjustForKeyboard, *MEMORY[0x24BEBE448], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__adjustForKeyboard, *MEMORY[0x24BEBE570], 0);

}

- (void)_adjustForKeyboard
{
  -[AXOnboardingObjCBridge _listenForKeyboardNotifications:](self, "_listenForKeyboardNotifications:", 0);
  -[AXOnboardingObjCBridge disableSoftwareKeyboard](self, "disableSoftwareKeyboard");
  -[AXOnboardingObjCBridge _listenForKeyboardNotifications:](self, "_listenForKeyboardNotifications:", 1);
}

- (void)enableSoftwareKeyboard
{
  GSEventSetHardwareKeyboardAttached();
}

- (void)disableSoftwareKeyboard
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  GSEventSetHardwareKeyboardAttached();
  objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutomaticMinimizationEnabled:", 1);

  objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissKeyboard");

  objc_msgSend(MEMORY[0x24BEBD6E0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomaticMinimizationEnabled:", 1);

  objc_msgSend(MEMORY[0x24BEBD6E0], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissKeyboard");

}

- (void)toggleVoiceControl
{
  -[AXOnboardingObjCBridge enableVoiceControl:](self, "enableVoiceControl:", -[AXOnboardingObjCBridge voiceControlEnabled](self, "voiceControlEnabled") ^ 1);
}

- (id)localizedVoiceControlCommand:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  __CFString *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (localizedVoiceControlCommand__onceToken != -1)
    dispatch_once(&localizedVoiceControlCommand__onceToken, &__block_literal_global_184);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)localizedVoiceControlCommand___FlattenedCommandGroupsAndItems;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isGroup") & 1) == 0)
      {
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if (v11)
          break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Text.Unselect")) & 1) != 0)
    {
      objc_msgSend(v9, "locale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("en"));

      if ((v15 & 1) != 0)
      {
        v12 = CFSTR("Unselect that");
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend(v9, "displayString");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_12:

  NSLog(CFSTR("Cannot find name for command: %@"), v3);
  v12 = &stru_24E0835B0;
LABEL_19:

  return v12;
}

void __55__AXOnboardingObjCBridge_localizedVoiceControlCommand___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getCACSpokenCommandPresentationClass_softClass;
  v9 = getCACSpokenCommandPresentationClass_softClass;
  if (!getCACSpokenCommandPresentationClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getCACSpokenCommandPresentationClass_block_invoke;
    v5[3] = &unk_24E0772E0;
    v5[4] = &v6;
    __getCACSpokenCommandPresentationClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "flattenedCommandGroupsAndItems");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)localizedVoiceControlCommand___FlattenedCommandGroupsAndItems;
  localizedVoiceControlCommand___FlattenedCommandGroupsAndItems = v3;

}

- (void)enableVoiceControl:(BOOL)a3
{
  _AXSCommandAndControlSetEnabled();
}

- (BOOL)voiceControlEnabled
{
  return _AXSCommandAndControlEnabled() != 0;
}

- (BOOL)heySiriEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  return v3;
}

- (BOOL)isSameLangaugeFromLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v7 = (void *)getCACLocaleUtilitiesClass_softClass;
  v14 = getCACLocaleUtilitiesClass_softClass;
  if (!getCACLocaleUtilitiesClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getCACLocaleUtilitiesClass_block_invoke;
    v10[3] = &unk_24E0772E0;
    v10[4] = &v11;
    __getCACLocaleUtilitiesClass_block_invoke((uint64_t)v10);
    v7 = (void *)v12[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v11, 8);
  LOBYTE(v8) = objc_msgSend(v8, "isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:", v5, v6);

  return (char)v8;
}

- (BOOL)shouldShowCapitalizationPage
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)getCACPreferencesClass_softClass;
  v13 = getCACPreferencesClass_softClass;
  if (!getCACPreferencesClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getCACPreferencesClass_block_invoke;
    v9[3] = &unk_24E0772E0;
    v9[4] = &v10;
    __getCACPreferencesClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v4, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestLocaleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXOnboardingObjCBridge isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:](self, "isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:", CFSTR("ja_JP"), v6)|| -[AXOnboardingObjCBridge isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:](self, "isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:", CFSTR("zh_HK"), v6))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = !-[AXOnboardingObjCBridge isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:](self, "isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:", CFSTR("zh_CN"), v6);
  }

  return v7;
}

- (id)getVoiceControlEnabledDefaultName
{
  return CFSTR("voiceControlEnabledOnLaunch");
}

- (BOOL)_isListening
{
  return self->__isListening;
}

- (void)set_isListening:(BOOL)a3
{
  self->__isListening = a3;
}

@end
