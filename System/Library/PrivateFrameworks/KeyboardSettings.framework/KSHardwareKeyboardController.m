@implementation KSHardwareKeyboardController

+ (id)IOHIDKeyboardLanguageToCapsLockKeyLabel
{
  if (IOHIDKeyboardLanguageToCapsLockKeyLabel___onceToken != -1)
    dispatch_once(&IOHIDKeyboardLanguageToCapsLockKeyLabel___onceToken, &__block_literal_global_1);
  return (id)IOHIDKeyboardLanguageToCapsLockKeyLabel___map;
}

id __71__KSHardwareKeyboardController_IOHIDKeyboardLanguageToCapsLockKeyLabel__block_invoke()
{
  id result;
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("Simplified Chinese Keyboard");
  v1[1] = CFSTR("2SetHangul");
  v2[0] = CFSTR("中 / 英");
  v2[1] = CFSTR("한 / A");
  v1[2] = CFSTR("Zhuyin Bopomofo");
  v1[3] = CFSTR("Thai");
  v2[2] = CFSTR("中 / 英");
  v2[3] = CFSTR("ก / A");
  result = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
  IOHIDKeyboardLanguageToCapsLockKeyLabel___map = (uint64_t)result;
  return result;
}

- (KSHardwareKeyboardController)init
{
  KSHardwareKeyboardController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  KeyboardBrightnessClient *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KSHardwareKeyboardController;
  v2 = -[KSHardwareKeyboardController init](&v10, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged_0, (CFStringRef)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE3D640]), 0, (CFNotificationSuspensionBehavior)0);
    v4 = (KeyboardBrightnessClient *)objc_alloc_init(MEMORY[0x24BE1A2F0]);
    v2->_keyboardBrightnessClient = v4;
    v5 = *MEMORY[0x24BE1A2F8];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __36__KSHardwareKeyboardController_init__block_invoke;
    v9[3] = &unk_2510799D8;
    v9[4] = v2;
    -[KeyboardBrightnessClient registerNotificationForKeys:keyboardID:block:](v4, "registerNotificationForKeys:keyboardID:block:", &unk_2510837B0, v5, v9);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_appWillResignActive_, *MEMORY[0x24BEBE010], 0);
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_appWillEnterForeground_, *MEMORY[0x24BEBE008], 0);
  }
  return v2;
}

void __36__KSHardwareKeyboardController_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__KSHardwareKeyboardController_init__block_invoke_2;
  v4[3] = &unk_2510799B0;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = a3;
  v4[5] = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
}

uint64_t __36__KSHardwareKeyboardController_init__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "isTrackingBrightnessSlider");
    if ((result & 1) == 0)
    {
      v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "specifierForID:", CFSTR("Keyboard Brightness"));
      v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1376), "isBacklightSaturatedOnKeyboard:", *MEMORY[0x24BE1A2F8]) ^ 1);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE75A18]);
      objc_msgSend(*(id *)(a1 + 40), "reloadSpecifier:", v3);
      return objc_msgSend((id)objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE75D18]), "setValue:", *(_QWORD *)(a1 + 32));
    }
  }
  return result;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE3D640]), 0);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBE010], 0);
  -[KeyboardBrightnessClient unregisterKeyboardNotificationBlock](self->_keyboardBrightnessClient, "unregisterKeyboardNotificationBlock");

  v6.receiver = self;
  v6.super_class = (Class)KSHardwareKeyboardController;
  -[KSHardwareKeyboardController dealloc](&v6, sel_dealloc);
}

- (id)specifiers
{
  uint64_t v3;
  id result;
  uint64_t v5;

  v3 = (int)*MEMORY[0x24BE756E0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    v5 = -[KSHardwareKeyboardController title](self, "title");
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)-[KSHardwareKeyboardController newSpecifiers](self, "newSpecifiers");
    -[KSHardwareKeyboardController setTitle:](self, "setTitle:", v5);
    return *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return result;
}

- (id)newSpecifiers
{
  void *v3;
  KSHardwareKeyboardController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t NormalizedIdentifier;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v30;
  uint64_t v31;
  KSHardwareKeyboardController *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers");
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v4 = self;
  v30 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  v33 = v5;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    v31 = *MEMORY[0x24BE75AC0];
    v10 = *MEMORY[0x24BE75948];
    v11 = *MEMORY[0x24BEB5038];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v3);
        if (objc_msgSend(v6, "identifierIsValidSystemInputMode:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i)))
        {
          NormalizedIdentifier = TIInputModeGetNormalizedIdentifier();
          if (!objc_msgSend(v5, "member:", NormalizedIdentifier))
          {
            objc_msgSend(v5, "addObject:", NormalizedIdentifier);
            if (objc_msgSend((id)UIKeyboardGetSupportedHardwareKeyboardsForInputMode(), "count"))
            {
              v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v4, 0, 0, objc_opt_class(), 2, 0);
              objc_msgSend(v14, "setProperty:forKey:", NormalizedIdentifier, v31);
              objc_msgSend(v14, "setProperty:forKey:", objc_opt_class(), v10);
              v15 = v14;
              v5 = v33;
              objc_msgSend(v34, "addObject:", v15);
            }
            if (objc_msgSend((id)objc_msgSend((id)TIGetInputModeProperties(), "objectForKeyedSubscript:", v11), "BOOLValue"))objc_msgSend(v30, "addObject:", NormalizedIdentifier);
          }
        }
      }
      v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v8);
  }
  v16 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("HWKeyboardSettings"));
  objc_msgSend(v16, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PERIOD_SHORTCUT_DESCRIPTION_HWKB"), &stru_25107A038, CFSTR("Keyboard")), *MEMORY[0x24BE75A68]);
  objc_msgSend(v34, "addObject:", v16);
  v32 = v4;
  v17 = -[KSHardwareKeyboardController separateHWKeyboardSpecifiers](v4, "separateHWKeyboardSpecifiers");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "setName:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "name"), &stru_25107A038, CFSTR("Keyboard")));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v19);
  }
  v22 = v34;
  objc_msgSend(v34, "addObjectsFromArray:", v17);
  if (objc_msgSend(v30, "count"))
  {
    v23 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("LIVE_CONVERSION"));
    objc_msgSend(v23, "setName:", +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v30, 0, 0));
    objc_msgSend(v34, "addObject:", v23);
    v24 = (void *)-[KSHardwareKeyboardController loadSpecifiersFromPlistName:target:](v32, "loadSpecifiersFromPlistName:target:", CFSTR("Preferences_HWLiveConversion"), v32);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "setName:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "name"), &stru_25107A038, CFSTR("Keyboard")));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v26);
    }
    v22 = v34;
    objc_msgSend(v34, "addObjectsFromArray:", v24);
  }
  if (-[KSHardwareKeyboardController shouldShowGlobeKeyPreference](v32, "shouldShowGlobeKeyPreference"))
    objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController globeAsEmojiSpecifiers](v32, "globeAsEmojiSpecifiers"));
  objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController capsLockSwitchSpecifiersFromModes:](v32, "capsLockSwitchSpecifiersFromModes:", v33));
  objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController keyboardBrightnessSpecifiers](v32, "keyboardBrightnessSpecifiers"));
  objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController modifierRemapSpecifiers](v32, "modifierRemapSpecifiers"));
  if ((BKSHIDKeyboardWantsStandardTypeOverride() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("KeyboardTypeCustomization"), CFSTR("com.apple.keyboard.preferences"), 0))
  {
    objc_msgSend(v22, "addObjectsFromArray:", -[KSHardwareKeyboardController keyboardTypeRemapSpecifiers](v32, "keyboardTypeRemapSpecifiers"));
  }
  return v22;
}

- (id)capsLockSwitchSpecifiersFromModes:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *HardwareKeyboardLanguage;
  char HasLanguageSwitchLabel;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable())
        {
          ++v9;
          v10 = v13;
        }
        else
        {
          v8 += UIKeyboardLayoutSupportsASCIIToggleKey();
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v7);
    if (v9 && v8)
    {
      HardwareKeyboardLanguage = (void *)BKSHIDServicesGetHardwareKeyboardLanguage();
      HasLanguageSwitchLabel = BKSHIDServicesCapsLockKeyHasLanguageSwitchLabel();
      if (objc_msgSend(HardwareKeyboardLanguage, "length")
        && ((HasLanguageSwitchLabel & 1) != 0
         || objc_msgSend(HardwareKeyboardLanguage, "isEqualToString:", CFSTR("Simplified Chinese Keyboard"))))
      {
        v16 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "IOHIDKeyboardLanguageToCapsLockKeyLabel"), "objectForKey:", HardwareKeyboardLanguage);
      }
      else
      {
        v16 = 0;
      }
      v17 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("HWKeyboardCapsLockSwitch"));
      if (v9 >= 2)
        v18 = 2;
      else
        v18 = v9;
      v19 = objc_msgSend(v16, "length");
      v20 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      if (v19)
      {
        v21 = objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("LANGUAGE_SWITCH_LATIN_TITLE"), &stru_25107A038, CFSTR("Keyboard"));
        v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v21, v16);
        v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LANGUAGE_SWITCH_LATIN_DESCRIPTION_%lu"), v18), &stru_25107A038, CFSTR("Keyboard"));
        if (v18 == 1)
        {
          if (objc_msgSend(0, "hasPrefix:", CFSTR("%2$@")))
            v24 = 4;
          else
            v24 = 5;
          v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v23, v16, TUIKeyboardDisplayNameFromIdentifierForContext(v10, v24));
        }
        else
        {
          v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v23, v16, v34);
        }
        v26 = v25;
      }
      else
      {
        v22 = objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CAPS_LOCK_LATIN_TITLE"), &stru_25107A038, CFSTR("Keyboard"));
        v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CAPS_LOCK_LATIN_DESCRIPTION_%lu"), v18), &stru_25107A038, CFSTR("Keyboard"));
        if (v18 == 1)
        {
          if (objc_msgSend(0, "hasPrefix:", CFSTR("%@")))
            v27 = 4;
          else
            v27 = 5;
          v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v26, TUIKeyboardDisplayNameFromIdentifierForContext(v10, v27));
        }
      }
      objc_msgSend(v17, "setProperty:forKey:", v26, *MEMORY[0x24BE75A68]);
      objc_msgSend(v5, "addObject:", v17);
      v28 = (void *)-[KSHardwareKeyboardController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Preferences_HWCapsLock"), self);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v36 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "setName:", v22);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        }
        while (v30);
      }
      objc_msgSend(v5, "addObjectsFromArray:", v28);
    }
  }
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)KSHardwareKeyboardController;
  -[KSHardwareKeyboardController viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[KSHardwareKeyboardController specifiers](self, "specifiers", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = *MEMORY[0x24BE75D18];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v10, "identifier"), "hasPrefix:", CFSTR("HWKeyboard")) & 1) == 0)
        {
          v11 = (void *)objc_msgSend(v10, "propertyForKey:", v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "updateLabels");
        }
        if (objc_msgSend((id)objc_msgSend(v10, "identifier"), "isEqualToString:", CFSTR("Keyboard Type.0")))-[KSHardwareKeyboardController reloadSpecifier:](self, "reloadSpecifier:", v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }
  -[KSHardwareKeyboardController suspendIdleDimming:](self, "suspendIdleDimming:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSHardwareKeyboardController;
  -[KSHardwareKeyboardController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[KSHardwareKeyboardController suspendIdleDimming:](self, "suspendIdleDimming:", 0);
}

- (void)appWillEnterForeground:(id)a3
{
  -[KSHardwareKeyboardController reloadSpecifiers](self, "reloadSpecifiers", a3);
  -[KSHardwareKeyboardController suspendIdleDimming:](self, "suspendIdleDimming:", 1);
}

- (void)appWillResignActive:(id)a3
{
  -[KSHardwareKeyboardController suspendIdleDimming:](self, "suspendIdleDimming:", 0);
}

- (void)suspendIdleDimming:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[KeyboardBrightnessClient suspendIdleDimming:forKeyboard:](self->_keyboardBrightnessClient, "suspendIdleDimming:forKeyboard:", v3, *MEMORY[0x24BE1A2F8]);
}

- (id)separateHWKeyboardSpecifiers
{
  return (id)-[KSHardwareKeyboardController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Preferences_HWKeyboard"), self);
}

- (id)readPreferenceControllerValue:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]);
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController"), "valueForPreferenceKey:", v3);
}

- (void)setPreferenceControllerValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController"), "setValue:forPreferenceKey:", a3, v5);
}

- (id)readRomanCapsLockPreferenceValue:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("HWKeyboardCapsLockRomanSwitch")) & 1) == 0)-[KSHardwareKeyboardController readRomanCapsLockPreferenceValue:].cold.1();
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6E0], "sharedInstance"), "isCapsLockSwitchEnabled"));
}

- (void)setRomanCapsLockPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  void *v5;

  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("HWKeyboardCapsLockRomanSwitch")) & 1) == 0)-[KSHardwareKeyboardController setRomanCapsLockPreferenceValue:forSpecifier:].cold.1();
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB4F70]);
}

- (id)keyboardBrightnessSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (objc_msgSend((id)-[KeyboardBrightnessClient copyKeyboardBacklightIDs](self->_keyboardBrightnessClient, "copyKeyboardBacklightIDs"), "count"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("Keyboard Brightness Group"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Keyboard Brightness"), &stru_25107A038, CFSTR("Keyboard")));
    objc_msgSend(v4, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARD_BRIGHTNESS_DESCRIPTION"), &stru_25107A038, CFSTR("Keyboard")), *MEMORY[0x24BE75A68]);
    objc_msgSend(v3, "addObject:", v4);
    v5 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Keyboard Brightness"), &stru_25107A038, CFSTR("Keyboard")), self, sel_setBrightness_specifier_, sel_getBrightness_, 0, 5, 0);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Keyboard Brightness"), *MEMORY[0x24BE75AC0]);
    v6 = (void *)objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("light.min"));
    v7 = objc_msgSend(v6, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor"), 1);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75C90]);
    v8 = (void *)objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("light.max"));
    v9 = objc_msgSend(v8, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor"), 1);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75CA0]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_251083CC0, *MEMORY[0x24BE759B0]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_251083CD0, *MEMORY[0x24BE759A8]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75C80]);
    v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[KeyboardBrightnessClient isBacklightSaturatedOnKeyboard:](self->_keyboardBrightnessClient, "isBacklightSaturatedOnKeyboard:", *MEMORY[0x24BE1A2F8]) ^ 1);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75A18]);
    objc_msgSend(v3, "addObject:", v5);
  }
  return v3;
}

- (void)setBrightness:(id)a3 specifier:(id)a4
{
  _BOOL4 v6;
  char v7;
  KeyboardBrightnessClient *keyboardBrightnessClient;

  v6 = -[KSHardwareKeyboardController isTrackingBrightnessSlider](self, "isTrackingBrightnessSlider", a3, a4);
  v7 = objc_opt_respondsToSelector();
  keyboardBrightnessClient = self->_keyboardBrightnessClient;
  objc_msgSend(a3, "floatValue");
  if ((v7 & 1) != 0)
    -[KeyboardBrightnessClient setBrightness:fadeSpeed:commit:forKeyboard:](keyboardBrightnessClient, "setBrightness:fadeSpeed:commit:forKeyboard:", 0, !v6, *MEMORY[0x24BE1A2F8]);
  else
    -[KeyboardBrightnessClient setBrightness:forKeyboard:](keyboardBrightnessClient, "setBrightness:forKeyboard:", *MEMORY[0x24BE1A2F8]);
}

- (id)getBrightness:(id)a3
{
  double v3;

  -[KeyboardBrightnessClient brightnessForKeyboard:](self->_keyboardBrightnessClient, "brightnessForKeyboard:", *MEMORY[0x24BE1A2F8]);
  *(float *)&v3 = fminf(*(float *)&v3, 1.0);
  if (*(float *)&v3 < 0.0)
    *(float *)&v3 = 0.0;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
}

- (BOOL)isTrackingBrightnessSlider
{
  void *v2;
  void *v3;

  v2 = (void *)-[KSHardwareKeyboardController specifierForID:](self, "specifierForID:", CFSTR("Keyboard Brightness"));
  v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "propertyForKey:", *MEMORY[0x24BE75D18]), "control");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v3, "isTracking");
  else
    return 0;
}

- (id)globeAsEmojiSpecifiers
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("Globe as Emoji group"));
  objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("GLOBE_AS_EMOJI_KEY"), &stru_25107A038, CFSTR("Keyboard")), CFSTR("<globe>")), self, sel_toggledGlobeKey_specifier_, sel_globeKeyPreference_, 0, 6, 0);
  objc_msgSend(v5, "setProperty:forKey:", *MEMORY[0x24BEB4F78], *MEMORY[0x24BE75AC0]);
  objc_msgSend(v4, "setProperty:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("GLOBE_AS_EMOJI_KEY_FOOTER"), &stru_25107A038, CFSTR("Keyboard")), CFSTR("<globe>")), *MEMORY[0x24BE75A68]);
  objc_msgSend(v3, "addObject:", v5);
  return v3;
}

- (id)globeKeyPreference:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController", a3);
  v5 = (void *)objc_msgSend(v4, "valueForPreferenceKey:", *MEMORY[0x24BEB4F78]);
  if (v5)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = -[KSHardwareKeyboardController defaultValueForGlobeAsEmojiKey](self, "defaultValueForGlobeAsEmojiKey");
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
}

- (void)toggledGlobeKey:(id)a3 specifier:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController", a3, a4);
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB4F78]);
}

- (BOOL)defaultValueForGlobeAsEmojiKey
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController"), "defaultGlobeAsEmojiKeySetting") != 0;
}

- (BOOL)shouldShowGlobeKeyPreference
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
    && (unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers"), "count") >= 3)
  {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "containsEmojiInputMode");
  }
  else
  {
    return 0;
  }
}

- (id)modifierRemapSpecifiers
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("Modifier Keys")));
  v4 = (void *)MEMORY[0x24BE75590];
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("MODIFIER_KEYS"), &stru_25107A038, CFSTR("Keyboard"));
  objc_msgSend(v3, "addObject:", objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, objc_opt_class(), 2, 0));
  return v3;
}

- (id)keyboardTypeRemapSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("Keyboard Type"));
  objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)MEMORY[0x24BE75590];
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Keyboard Type"), &stru_25107A038, CFSTR("Keyboard"));
  v7 = objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel_getCurrentKeyboardType, objc_opt_class(), 2, 0);
  objc_msgSend(v4, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARD_TYPE_FOOTER_TEXT"), &stru_25107A038, CFSTR("Keyboard")), *MEMORY[0x24BE75A68]);
  objc_msgSend(v3, "addObject:", v7);
  return v3;
}

- (id)getCurrentKeyboardType
{
  void *DeviceProperties;
  id result;

  DeviceProperties = (void *)BKSHIDKeyboardGetDeviceProperties();
  switch(objc_msgSend(DeviceProperties, "standardType"))
  {
    case 0xFFFFFFFF:
      if (objc_msgSend(DeviceProperties, "countryCode") != 15)
        goto LABEL_4;
      goto LABEL_3;
    case 0u:
LABEL_4:
      result = CFSTR("ANSI");
      break;
    case 1u:
      result = CFSTR("ISO");
      break;
    case 2u:
LABEL_3:
      result = CFSTR("JIS");
      break;
    default:
      result = &stru_25107A038;
      break;
  }
  return result;
}

- (void)hardwareKeyboardAvailabilityChanged
{
  if (GSEventIsHardwareKeyboardAttached())
  {
    if (!-[KSHardwareKeyboardController specifierForID:](self, "specifierForID:", CFSTR("Keyboard Brightness Group")))
      -[KSHardwareKeyboardController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", -[KSHardwareKeyboardController keyboardBrightnessSpecifiers](self, "keyboardBrightnessSpecifiers"), 1);
    if (!-[KSHardwareKeyboardController specifierForID:](self, "specifierForID:", CFSTR("Modifier Keys")))
      -[KSHardwareKeyboardController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", -[KSHardwareKeyboardController modifierRemapSpecifiers](self, "modifierRemapSpecifiers"), 1);
    if (!-[KSHardwareKeyboardController specifierForID:](self, "specifierForID:", CFSTR("Keyboard Type"))
      && ((BKSHIDKeyboardWantsStandardTypeOverride() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("KeyboardTypeCustomization"), CFSTR("com.apple.keyboard.preferences"), 0)))
    {
      -[KSHardwareKeyboardController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", -[KSHardwareKeyboardController keyboardTypeRemapSpecifiers](self, "keyboardTypeRemapSpecifiers"), 1);
    }
  }
  else
  {
    -[KSHardwareKeyboardController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("Keyboard Brightness Group"), 1);
    -[KSHardwareKeyboardController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("Modifier Keys"), 1);
    -[KSHardwareKeyboardController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("Keyboard Type"), 1);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)KSHardwareKeyboardController;
  v6 = -[KSHardwareKeyboardController tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, a3);
  v7 = (void *)-[KSHardwareKeyboardController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v8 = (void *)objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB4F78]))
  {
    v9 = (void *)objc_msgSend(v7, "name");
    v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("<globe>"));
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v10;
      v13 = v11;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v9);
      objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", v12, v13, +[KSKeyboardListController attributedStringForSymbolName:](KSKeyboardListController, "attributedStringForSymbolName:", CFSTR("globe")));
      objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setAttributedText:", v14);

    }
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v6 = (void *)objc_msgSend((id)objc_msgSend(a4, "textLabel", a3), "text");
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("<globe>"));
  if (v6)
  {
    v9 = v7;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v8;
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v6);
      objc_msgSend(v11, "replaceCharactersInRange:withAttributedString:", v9, v10, +[KSKeyboardListController attributedStringForSymbolName:](KSKeyboardListController, "attributedStringForSymbolName:", CFSTR("globe")));
      objc_msgSend((id)objc_msgSend(a4, "textLabel"), "setAttributedText:", v11);

    }
  }
}

- (void)readRomanCapsLockPreferenceValue:.cold.1()
{
  __assert_rtn("-[KSHardwareKeyboardController readRomanCapsLockPreferenceValue:]", "KSHardwareKeyboardController.m", 441, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kHWKeyboardCapsLockRomanSwitch]");
}

- (void)setRomanCapsLockPreferenceValue:forSpecifier:.cold.1()
{
  __assert_rtn("-[KSHardwareKeyboardController setRomanCapsLockPreferenceValue:forSpecifier:]", "KSHardwareKeyboardController.m", 447, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kHWKeyboardCapsLockRomanSwitch]");
}

@end
