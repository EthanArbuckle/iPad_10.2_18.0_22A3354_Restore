@implementation AssistantDetailController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AssistantDetailController;
  -[AssistantDetailController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (-[AssistantDetailController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    -[AssistantDetailController _bundleId](self, "_bundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AssistantMetrics didDetailVisit:](AssistantMetrics, "didDetailVisit:", v4);

  }
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  NSMutableSet *disabledSpotlightBundles;
  NSMutableSet *v9;
  NSMutableSet *disabledLockScreenBundles;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  NSMutableSet *disabledSpotlightApps;
  NSMutableSet *v15;
  NSMutableSet *disabledSpotlightShortcuts;
  NSMutableSet *v17;
  NSMutableSet *disabledSuggestApps;
  void *v19;
  objc_class *v20;
  void *v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (!self->_disabledSpotlightBundles)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v5 = getSPGetDisabledBundleSetSymbolLoc_ptr_0;
      v26 = getSPGetDisabledBundleSetSymbolLoc_ptr_0;
      if (!getSPGetDisabledBundleSetSymbolLoc_ptr_0)
      {
        v6 = (void *)SearchLibrary_0();
        v5 = dlsym(v6, "SPGetDisabledBundleSet");
        v24[3] = (uint64_t)v5;
        getSPGetDisabledBundleSetSymbolLoc_ptr_0 = v5;
      }
      _Block_object_dispose(&v23, 8);
      if (!v5)
        -[AssistantDetailController specifiers].cold.1();
      ((void (*)(uint64_t))v5)(1);
      v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      disabledSpotlightBundles = self->_disabledSpotlightBundles;
      self->_disabledSpotlightBundles = v7;

    }
    if (!self->_disabledLockScreenBundles)
    {
      ASTDisabledLockScreenBundles();
      v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      disabledLockScreenBundles = self->_disabledLockScreenBundles;
      self->_disabledLockScreenBundles = v9;

    }
    if (!self->_disabledSpotlightApps)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v11 = getSPGetDisabledAppSetSymbolLoc_ptr_0;
      v26 = getSPGetDisabledAppSetSymbolLoc_ptr_0;
      if (!getSPGetDisabledAppSetSymbolLoc_ptr_0)
      {
        v12 = (void *)SearchLibrary_0();
        v11 = dlsym(v12, "SPGetDisabledAppSet");
        v24[3] = (uint64_t)v11;
        getSPGetDisabledAppSetSymbolLoc_ptr_0 = v11;
      }
      _Block_object_dispose(&v23, 8);
      if (!v11)
        -[AssistantDetailController specifiers].cold.2();
      ((void (*)(uint64_t))v11)(1);
      v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      disabledSpotlightApps = self->_disabledSpotlightApps;
      self->_disabledSpotlightApps = v13;

    }
    if (!self->_disabledSpotlightShortcuts)
    {
      -[AssistantDetailController _loadDisabledShortcutsSet](self, "_loadDisabledShortcutsSet");
      v15 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      disabledSpotlightShortcuts = self->_disabledSpotlightShortcuts;
      self->_disabledSpotlightShortcuts = v15;

    }
    if (!self->_disabledSuggestApps)
    {
      -[AssistantDetailController _loadDisabledSuggestAppsSet](self, "_loadDisabledSuggestAppsSet");
      v17 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      disabledSuggestApps = self->_disabledSuggestApps;
      self->_disabledSuggestApps = v17;

    }
    -[AssistantDetailController _bundleId](self, "_bundleId", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isApplicationHidden = -[AssistantDetailController _isApplicationHiddenCheck:](self, "_isApplicationHiddenCheck:", v19);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
    -[AssistantDetailController _addInAppSpecifiersToSpecifiers:](self, "_addInAppSpecifiersToSpecifiers:", v20);
    -[AssistantDetailController _addSuggestionsSpecifiersToSpecifiers:](self, "_addSuggestionsSpecifiersToSpecifiers:", v20);
    -[AssistantDetailController _asyncAddAskSiriSettingsIfNecessary](self, "_asyncAddAskSiriSettingsIfNecessary");
    v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v20;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)_isApplicationHiddenCheck:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE042F8], "hiddenApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)_addInAppSpecifiersToSpecifiers:(id)a3
{
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
  void *v16;
  uint64_t v17;
  _QWORD *v18;
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
  id v35;

  v35 = a3;
  v4 = (void *)MEMORY[0x24BE75590];
  v5 = (void *)MEMORY[0x24BDD17C8];
  +[AssistantController bundle](AssistantController, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SIRIANDSEARCH_PERAPP_INAPP_HEADER"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantDetailController _appName](self, "_appName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  +[AssistantController bundle](AssistantController, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SIRIANDSEARCH_PERAPP_INAPP_FOOTER"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantDetailController _appName](self, "_appName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantDetailController _appName](self, "_appName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BE75A68];
  objc_msgSend(v10, "setProperty:forKey:", v16, *MEMORY[0x24BE75A68]);

  v18 = (_QWORD *)MEMORY[0x24BE75A18];
  if (self->_isApplicationHidden)
  {
    v19 = (void *)MEMORY[0x24BE75590];
    v20 = (void *)MEMORY[0x24BDD17C8];
    +[AssistantController bundle](AssistantController, "bundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", &stru_24D33E0B0, &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "groupSpecifierWithName:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD17C8];
    +[AssistantController bundle](AssistantController, "bundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SIRIANDSEARCH_PERAPP_INAPP_HEADER_DETAIL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantDetailController _appName](self, "_appName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AssistantDetailController _appName](self, "_appName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProperty:forKey:", v30, v17);

    v18 = (_QWORD *)MEMORY[0x24BE75A18];
    objc_msgSend(v35, "addObject:", v24);
    objc_msgSend(v10, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *v18);

  }
  objc_msgSend(v35, "addObject:", v10);
  v31 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("SIRIANDSEARCH_PERAPP_INAPP_LEARNFROMAPP_TOGGLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v33, self, sel_setInAppLearnFromAppEnabled_specifier_, sel_inAppLearnFromAppEnabled_, 0, 6, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  if (self->_isApplicationHidden)
    objc_msgSend(v34, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *v18);
  objc_msgSend(v35, "addObject:", v34);

}

- (void)setNanoInAppShowSiriSuggestionsEnabled:(BOOL)a3 bundleId:(id)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v10;

  v4 = a3;
  v10 = a4;
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("NanoAppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v6 = v5;
  if (v5)
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
  else
    v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "removeObject:", v10);
  }
  else if ((objc_msgSend(v7, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(v8, "addObject:", v10);
  }
  CFPreferencesSetAppValue(CFSTR("NanoAppCanShowSiriSuggestionsBlacklist"), v8, CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);

}

- (id)inAppLearnFromAppEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[AssistantDetailController _bundleId](self, "_bundleId", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
  v6 = objc_msgSend(v5, "containsObject:", v4) ^ 1;

  objc_msgSend(v3, "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setInAppLearnFromAppEnabled:(id)a3 specifier:(id)a4
{
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v13;
  id v14;

  v14 = a3;
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v14, "BOOLValue");
  v7 = v5;
  v8 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
  v9 = v8;
  if (v8)
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
  else
    v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v6)
  {
    objc_msgSend(v10, "removeObject:", v7);
  }
  else if ((objc_msgSend(v10, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(v11, "addObject:", v7);
  }
  CFPreferencesSetAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), v11, CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);

  -[AssistantDetailController _bundleId](self, "_bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", CFSTR("inAppLearn"), v13, objc_msgSend(v14, "BOOLValue"));

}

- (void)_addSuggestionsSpecifiersToSpecifiers:(id)a3
{
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
  _QWORD *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  v4 = (void *)MEMORY[0x24BE75590];
  v5 = (void *)MEMORY[0x24BDD17C8];
  +[AssistantController bundle](AssistantController, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_HEADER"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantDetailController _appName](self, "_appName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  -[AssistantDetailController _suggestionsFooterString](self, "_suggestionsFooterString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantDetailController _appName](self, "_appName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantDetailController _appName](self, "_appName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v15, *MEMORY[0x24BE75A68]);

  v16 = (_QWORD *)MEMORY[0x24BE75A18];
  if (self->_isApplicationHidden)
    objc_msgSend(v10, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(v39, "addObject:", v10);
  -[AssistantDetailController _siriSuggestionsClients](self, "_siriSuggestionsClients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "containsObject:", v18);

  if ((v19 & 1) != 0)
  {
    v20 = (void *)MEMORY[0x24BE75590];
    -[AssistantDetailController _suggestionsShowToggleLableString](self, "_suggestionsShowToggleLableString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, sel_setSuggestionsShowInAppEnabled_specifier_, sel_suggestionsShowInAppEnabled_, 0, 6, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = *MEMORY[0x24BE75868];
    objc_msgSend(v22, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    if (self->_isApplicationHidden)
      objc_msgSend(v22, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *v16);
    objc_msgSend(v39, "addObject:", v22);

  }
  else
  {
    v23 = *MEMORY[0x24BE75868];
  }
  v24 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_SHOWONHOMESCREEN_TOGGLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, self, sel_setSuggestionsShowOnHomeScreenEnabled_specifier_, sel_suggestionsShowOnHomeScreenEnabled_, 0, 6, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v23);
  if (self->_isApplicationHidden)
    objc_msgSend(v27, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *v16);
  objc_msgSend(v39, "addObject:", v27);
  v28 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_SUGGESTAPP_TOGGLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v30, self, sel_setSuggestionsSuggestAppEnabled_specifier_, sel_suggestionsSuggestAppEnabled_, 0, 6, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v23);
  if (self->_isApplicationHidden)
    objc_msgSend(v31, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(v39, "addObject:", v31);
  v32 = (void *)CFPreferencesCopyAppValue(CFSTR("LockScreenSuggestionsDisabled"), CFSTR("com.apple.lockscreen.shared"));
  if (!v32 || (v33 = v32, v34 = objc_msgSend(v32, "BOOLValue"), v33, (v34 & 1) == 0))
  {
    if (!+[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision"))
    {
      v35 = (void *)MEMORY[0x24BE75590];
      +[AssistantController bundle](AssistantController, "bundle");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_SUGGESTION_NOTIFICATIONS_TOGGLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v37, self, sel_setSuggestionsSuggestionNotificationsEnabled_specifier_, sel_suggestionsSuggestionNotificationEnabled_, 0, 6, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v23);
      if (self->_isApplicationHidden)
        objc_msgSend(v38, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
      objc_msgSend(v39, "addObject:", v38);

    }
  }

}

- (id)_suggestionsShowToggleLableString
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  int v6;
  void *v7;

  -[AssistantDetailController _bundleId](self, "_bundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
  {
    +[AssistantController bundle](AssistantController, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_SHOWINAPP_TOGGLE_CONTACTSAPP");
  }
  else
  {
    v6 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilephone"));
    +[AssistantController bundle](AssistantController, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v6)
      v5 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_SHOWINAPP_TOGGLE_PHONEAPP");
    else
      v5 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_SHOWINAPP_TOGGLE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_suggestionsFooterString
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;

  -[AssistantDetailController _bundleId](self, "_bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
  {
    v4 = (void *)CFPreferencesCopyAppValue(CFSTR("LockScreenSuggestionsDisabled"), CFSTR("com.apple.lockscreen.shared"));
    if (v4 && (v5 = v4, v6 = objc_msgSend(v4, "BOOLValue"), v5, (v6 & 1) != 0))
    {
      +[AssistantController bundle](AssistantController, "bundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_CONTACTSAPP_NONOTIFICATIONS");
    }
    else
    {
      +[AssistantController bundle](AssistantController, "bundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_CONTACTSAPP_WITHNOTIFICATIONS");
    }
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilephone")))
  {
    v10 = (void *)CFPreferencesCopyAppValue(CFSTR("LockScreenSuggestionsDisabled"), CFSTR("com.apple.lockscreen.shared"));
    if (v10 && (v11 = v10, v12 = objc_msgSend(v10, "BOOLValue"), v11, (v12 & 1) != 0))
    {
      +[AssistantController bundle](AssistantController, "bundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_PHONEAPP_NONOTIFICATIONS");
    }
    else
    {
      +[AssistantController bundle](AssistantController, "bundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_PHONEAPP_WITHNOTIFICATIONS");
    }
  }
  else
  {
    -[AssistantDetailController _siriSuggestionsClients](self, "_siriSuggestionsClients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v3);

    v15 = +[AssistantUtilities deviceIsVision](AssistantUtilities, "deviceIsVision");
    if (v14)
    {
      if (v15)
      {
        +[AssistantController bundle](AssistantController, "bundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_WITHSHOW_VISION");
      }
      else
      {
        v16 = (void *)CFPreferencesCopyAppValue(CFSTR("LockScreenSuggestionsDisabled"), CFSTR("com.apple.lockscreen.shared"));
        if (v16 && (v17 = v16, v18 = objc_msgSend(v16, "BOOLValue"), v17, (v18 & 1) != 0))
        {
          +[AssistantController bundle](AssistantController, "bundle");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_WITHSHOW_NONOTIFICATIONS");
        }
        else
        {
          +[AssistantController bundle](AssistantController, "bundle");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_WITHSHOW_WITHNOTIFICATIONS");
        }
      }
    }
    else if (v15)
    {
      +[AssistantController bundle](AssistantController, "bundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_NOSHOW_VISION");
    }
    else
    {
      v19 = (void *)CFPreferencesCopyAppValue(CFSTR("LockScreenSuggestionsDisabled"), CFSTR("com.apple.lockscreen.shared"));
      if (v19 && (v20 = v19, v21 = objc_msgSend(v19, "BOOLValue"), v20, (v21 & 1) != 0))
      {
        +[AssistantController bundle](AssistantController, "bundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_NOSHOW_WITHNOTIFICATIONS");
      }
      else
      {
        +[AssistantController bundle](AssistantController, "bundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_NOSHOW_NONOTIFICATIONS");
      }
    }
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)suggestionsShowInAppEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[AssistantDetailController _bundleId](self, "_bundleId", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v6 = objc_msgSend(v5, "containsObject:", v4) ^ 1;

  objc_msgSend(v3, "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setSuggestionsShowInAppEnabled:(id)a3 specifier:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AssistantDetailController _watchBundleToMirrorWithBundleId:](self, "_watchBundleToMirrorWithBundleId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[AssistantDetailController setNanoInAppShowSiriSuggestionsEnabled:bundleId:](self, "setNanoInAppShowSiriSuggestionsEnabled:bundleId:", objc_msgSend(v18, "BOOLValue"), v6);
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v18, "BOOLValue");
  v9 = v7;
  v10 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v11 = v10;
  if (v10)
    v12 = (void *)objc_msgSend(v10, "mutableCopy");
  else
    v12 = (void *)objc_opt_new();
  v13 = v12;
  if (v8)
  {
    objc_msgSend(v12, "removeObject:", v9);
  }
  else if ((objc_msgSend(v12, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(v13, "addObject:", v9);
  }
  CFPreferencesSetAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), v13, CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("NanoAppCanShowSiriSuggestionsBlacklist"), CFSTR("AppCanShowSiriSuggestionsBlacklist"), 0);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.suggestions"), v15);

  -[AssistantDetailController _bundleId](self, "_bundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", CFSTR("inAppShow"), v17, objc_msgSend(v18, "BOOLValue"));

}

- (id)suggestionsShowOnHomeScreenEnabled:(id)a3
{
  void *v3;
  NSMutableSet *disabledSpotlightShortcuts;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  disabledSpotlightShortcuts = self->_disabledSpotlightShortcuts;
  -[AssistantDetailController _bundleId](self, "_bundleId", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", -[NSMutableSet containsObject:](disabledSpotlightShortcuts, "containsObject:", v5) ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSuggestionsShowOnHomeScreenEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[AssistantDetailController _saveSuggestionsShowOnHomeScreenEnabled:](self, "_saveSuggestionsShowOnHomeScreenEnabled:", v5);
  notify_post("com.apple.spotlightui.prefschanged");
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", CFSTR("shortcutssearch"), v6, v5);

}

- (void)_saveSuggestionsShowOnHomeScreenEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSMutableSet *disabledSpotlightShortcuts;
  id v7;

  v3 = a3;
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  disabledSpotlightShortcuts = self->_disabledSpotlightShortcuts;
  v7 = (id)v5;
  if (v3)
    -[NSMutableSet removeObject:](disabledSpotlightShortcuts, "removeObject:", v5);
  else
    -[NSMutableSet addObject:](disabledSpotlightShortcuts, "addObject:", v5);
  CFPreferencesSetAppValue(CFSTR("SBSearchDisabledShortcuts"), (CFPropertyListRef)-[NSMutableSet allObjects](self->_disabledSpotlightShortcuts, "allObjects"), CFSTR("com.apple.spotlightui"));
  CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);

}

- (id)suggestionsSuggestAppEnabled:(id)a3
{
  void *v3;
  NSMutableSet *disabledSuggestApps;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  disabledSuggestApps = self->_disabledSuggestApps;
  -[AssistantDetailController _bundleId](self, "_bundleId", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", -[NSMutableSet containsObject:](disabledSuggestApps, "containsObject:", v5) ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSuggestionsSuggestAppEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[AssistantDetailController _saveSuggestionsSuggestAppEnabled:](self, "_saveSuggestionsSuggestAppEnabled:", v5);
  notify_post("com.apple.spotlightui.prefschanged");
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", CFSTR("suggestapp"), v6, v5);

}

- (void)_saveSuggestionsSuggestAppEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSMutableSet *disabledSuggestApps;
  id v7;

  v3 = a3;
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  disabledSuggestApps = self->_disabledSuggestApps;
  v7 = (id)v5;
  if (v3)
    -[NSMutableSet removeObject:](disabledSuggestApps, "removeObject:", v5);
  else
    -[NSMutableSet addObject:](disabledSuggestApps, "addObject:", v5);
  CFPreferencesSetAppValue(CFSTR("SBSearchSuggestAppDisabled"), (CFPropertyListRef)-[NSMutableSet allObjects](self->_disabledSuggestApps, "allObjects"), CFSTR("com.apple.spotlightui"));
  CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);

}

- (id)suggestionsSuggestionNotificationEnabled:(id)a3
{
  void *v3;
  NSMutableSet *disabledLockScreenBundles;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  disabledLockScreenBundles = self->_disabledLockScreenBundles;
  -[AssistantDetailController _bundleId](self, "_bundleId", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", -[NSMutableSet containsObject:](disabledLockScreenBundles, "containsObject:", v5) ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSuggestionsSuggestionNotificationsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[AssistantDetailController _saveSuggestionsSuggestionNotificationsEnabled:](self, "_saveSuggestionsSuggestionNotificationsEnabled:", v5);
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", CFSTR("appinlockscreen"), v6, v5);

}

- (void)_saveSuggestionsSuggestionNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *disabledLockScreenBundles;

  v3 = a3;
  -[AssistantDetailController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ASTSetLockScreenEnabled(v3, v5);

  ASTDisabledLockScreenBundles();
  v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  disabledLockScreenBundles = self->_disabledLockScreenBundles;
  self->_disabledLockScreenBundles = v6;

}

- (id)_loadDisabledShortcutsSet
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
  if (v2)
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v2);
  else
    v3 = objc_opt_new();
  v4 = (void *)v3;

  return v4;
}

- (id)_loadDisabledSuggestAppsSet
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"));
  if (v2)
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v2);
  else
    v3 = objc_opt_new();
  v4 = (void *)v3;

  return v4;
}

- (void)_asyncAddAskSiriSettingsIfNecessary
{
  _QWORD v3[4];
  id v4;
  id location;

  if (+[AssistantUtilities assistantEnabled](AssistantUtilities, "assistantEnabled"))
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __64__AssistantDetailController__asyncAddAskSiriSettingsIfNecessary__block_invoke;
    v3[3] = &unk_24D33D718;
    objc_copyWeak(&v4, &location);
    -[AssistantDetailController _fetchIntentsSpecifiersWithCompletion:](self, "_fetchIntentsSpecifiersWithCompletion:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __64__AssistantDetailController__asyncAddAskSiriSettingsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __64__AssistantDetailController__asyncAddAskSiriSettingsIfNecessary__block_invoke_2;
    v4[3] = &unk_24D33D2F0;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    v5 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v6);
  }

}

void __64__AssistantDetailController__asyncAddAskSiriSettingsIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "insertContiguousSpecifiers:afterSpecifier:animated:", *(_QWORD *)(a1 + 32), 0, 0);
    WeakRetained = v3;
  }

}

- (void)_fetchIntentsSpecifiersWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__AssistantDetailController__fetchIntentsSpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_24D33CC80;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[IntentsUtilities intentsAppsWithCompletion:](IntentsUtilities, "intentsAppsWithCompletion:", v6);

}

void __67__AssistantDetailController__fetchIntentsSpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v16 = v3;
      v7 = *(_QWORD *)v18;
      v8 = (void *)MEMORY[0x24BDBD1A8];
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "appID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_bundleId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (v13)
          {
            v14 = *(void **)(a1 + 32);
            objc_msgSend(v10, "appID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "_enableSiriAppSpecifiersWithAppId:accessGranted:", v15, objc_msgSend(v10, "accessGranted"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
LABEL_12:
      v3 = v16;
    }
    else
    {
      v8 = (void *)MEMORY[0x24BDBD1A8];
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)_enableSiriAppSpecifiersWithAppId:(id)a3 accessGranted:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x24BDBCEB8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SIRI_KIT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantController bundle](AssistantController, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SIRI_PERAPP_SIRIREQUESTS_FOOTER"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v11, *MEMORY[0x24BE75A68]);

  if (self->_isApplicationHidden)
    objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(v8, "addObject:", v9);
  v12 = (void *)MEMORY[0x24BE75590];
  +[AssistantController bundle](AssistantController, "bundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SIRI_PERAPP_SIRIREQUESTS_USEWITHSIRI_TOGGLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setAskSiriUseWithAskSiriEnabled_specifier_, sel_askSiriUseWithAskSiriEnabled_, 0, 6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v16, *MEMORY[0x24BE75DA0]);

  objc_msgSend(v15, "setProperty:forKey:", v7, CFSTR("intentsAppID"));
  if (self->_isApplicationHidden)
    objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(v8, "addObject:", v15);

  return v8;
}

- (id)askSiriUseWithAskSiriEnabled:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75DA0]);
}

- (void)setAskSiriUseWithAskSiriEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE75DA0];
  objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75DA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v7, "propertyForKey:", CFSTR("intentsAppID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BE0FE98]);
    objc_msgSend(v12, "sectionInfoForSectionID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "spokenNotificationSetting") == 2 && (objc_msgSend(v6, "BOOLValue") & 1) == 0)
    {
      v14 = (void *)MEMORY[0x24BEBD3A8];
      +[AssistantController bundle](AssistantController, "bundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_USE_WITH_SIRI_DISABLE_OK"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v30 = v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __71__AssistantDetailController_setAskSiriUseWithAskSiriEnabled_specifier___block_invoke;
      v33[3] = &unk_24D33D740;
      v34 = v6;
      v35 = v11;
      v17 = v7;
      v36 = v17;
      v37 = v13;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v33);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x24BEBD3A8];
      +[AssistantController bundle](AssistantController, "bundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_USE_WITH_SIRI_DISABLE_CANCEL"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __71__AssistantDetailController_setAskSiriUseWithAskSiriEnabled_specifier___block_invoke_2;
      v31[3] = &unk_24D33D768;
      v32 = v17;
      objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v31);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x24BEBD3B0];
      +[AssistantController bundle](AssistantController, "bundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_USE_WITH_SIRI_DISABLE_TITLE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[AssistantController bundle](AssistantController, "bundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_USE_WITH_SIRI_DISABLE_MESSAGE"), &stru_24D33E0B0, CFSTR("AssistantSettings"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v22, v24, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "addAction:", v29);
      objc_msgSend(v25, "addAction:", v28);
      -[AssistantDetailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);

      v12 = v30;
    }
    else
    {
      +[IntentsUtilities setAccess:appID:](IntentsUtilities, "setAccess:appID:", objc_msgSend(v6, "BOOLValue"), v11);
      objc_msgSend(v7, "setProperty:forKey:", v6, v8);
      PSResetCachedSiriKitTCCEnabledAppIds();
    }

  }
  -[AssistantDetailController _bundleId](self, "_bundleId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", CFSTR("sirikit"), v26, objc_msgSend(v6, "BOOLValue"));

}

uint64_t __71__AssistantDetailController_setAskSiriUseWithAskSiriEnabled_specifier___block_invoke(uint64_t a1)
{
  +[IntentsUtilities setAccess:appID:](IntentsUtilities, "setAccess:appID:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setProperty:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BE75DA0]);
  PSResetCachedSiriKitTCCEnabledAppIds();
  return objc_msgSend(*(id *)(a1 + 56), "setSpokenNotificationSetting:", 1);
}

void __71__AssistantDetailController_setAskSiriUseWithAskSiriEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", *MEMORY[0x24BE759A0]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOn:animated:", 1, 1);

}

- (id)_siriSuggestionsClients
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("com.apple.store.Jolly"), CFSTR("com.apple.mobilecal"), CFSTR("com.apple.MobileAddressBook"), CFSTR("com.apple.Home"), CFSTR("com.apple.mobilemail"), CFSTR("com.apple.Maps"), CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.news"), CFSTR("com.apple.mobilephone"), CFSTR("com.apple.podcasts"), CFSTR("com.apple.reminders"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.tips"), CFSTR("com.apple.iBooks"), 0);
}

- (id)_watchBundleToMirrorWithBundleId:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(&unk_24D348518, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("AppHasCustomBridgeSettings"), CFSTR("com.apple.suggestions"));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = v3;

  return v6;
}

- (id)_bundleId
{
  void *v2;
  void *v3;

  -[AssistantDetailController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("BUNDLE_ID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_appName
{
  void *v2;
  void *v3;

  -[AssistantDetailController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("APP_NAME"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whileSearchingShowContentSpecifier, 0);
  objc_storeStrong((id *)&self->_whileSearchingShowAppSpecifier, 0);
  objc_storeStrong((id *)&self->_whileSearchingGroup, 0);
  objc_storeStrong((id *)&self->_disabledSuggestApps, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightShortcuts, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightApps, 0);
  objc_storeStrong((id *)&self->_disabledLockScreenBundles, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
}

- (void)specifiers
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSMutableSet *PSSPGetDisabledAppSet(BOOL)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantDetailController.m"), 35, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
