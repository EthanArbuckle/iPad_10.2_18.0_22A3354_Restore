@implementation CKFilteringListController

- (id)_syncManager
{
  objc_class *v2;

  v2 = (objc_class *)CUTWeakLinkClass();
  if (v2)
    v2 = (objc_class *)objc_alloc_init(v2);
  return v2;
}

- (CKFilteringListController)init
{
  CKFilteringListController *v2;
  CKFilteringListController *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  CKFilteringListController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKFilteringListController;
  v2 = -[CKFilteringListController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_spamFilterState = -1;
    -[CKFilteringListController setIsSpamFilteringDefaultEnabled](v2, "setIsSpamFilteringDefaultEnabled");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v5 = v3;
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_handleSIMSubscriptionsUpdateNotification, (CFStringRef)*MEMORY[0x24BE50FD8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFilteringListController;
  -[CKFilteringListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CKFilteringListController setIsSpamFilteringDefaultEnabled](self, "setIsSpamFilteringDefaultEnabled");
  -[CKFilteringListController findSpamExtensions](self, "findSpamExtensions");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFilteringListController;
  -[CKFilteringListController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CKFilteringListController findSpamExtensions](self, "findSpamExtensions");
  self->_showingParentViewController = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFilteringListController;
  -[CKFilteringListController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CKFilteringListController endMatchingExtensions](self, "endMatchingExtensions");
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[CKFilteringListController endMatchingExtensions](self, "endMatchingExtensions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE50FD8], 0);
  v4.receiver = self;
  v4.super_class = (Class)CKFilteringListController;
  -[CKFilteringListController dealloc](&v4, sel_dealloc);
}

- (void)applicationWillSuspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFilteringListController;
  -[CKFilteringListController applicationWillSuspend](&v3, sel_applicationWillSuspend);
  -[CKFilteringListController endMatchingExtensions](self, "endMatchingExtensions");
}

- (void)applicationDidResume
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFilteringListController;
  -[CKFilteringListController applicationDidResume](&v3, sel_applicationDidResume);
  if (!self->_showingParentViewController)
    -[CKFilteringListController findSpamExtensions](self, "findSpamExtensions");
}

- (void)endMatchingExtensions
{
  CKNSExtension *ckExtension;

  if (-[CKFilteringListController deviceSupportsSMSFilteringExtensions](self, "deviceSupportsSMSFilteringExtensions"))
  {
    -[CKNSExtension endMatchingExtensions](self->_ckExtension, "endMatchingExtensions");
    ckExtension = self->_ckExtension;
    self->_ckExtension = 0;

  }
}

- (id)isConversationListFilteringEnabled:(id)a3
{
  int AppBooleanValue;
  BOOL v4;
  uint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("IncomingMessageAlertFiltration"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 1;
  v5 = !v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setConversationListFilteringEnabled:(id)a3 specifier:(id)a4
{
  const void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void (*v7)(void);
  void *v8;
  id v9;

  CFPreferencesSetAppValue(CFSTR("IncomingMessageAlertFiltration"), a3, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("IncomingMessageAlertFiltrationForcedOn"), (CFPropertyListRef)*MEMORY[0x24BDBD268], CFSTR("com.apple.MobileSMS"));
  v5 = (const void *)*MEMORY[0x24BDBD270];
  CFPreferencesSetAppValue(CFSTR("MessageFilteringSettingsConfirmed"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.MobileSMS"));
  if (self->_spamFilterState == 1)
    CFPreferencesSetAppValue(CFSTR("MessageSpamFilteringSettingsConfirmed"), v5, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltration.changed"), 0, 0, 1u);
  v7 = (void (*)(void))CUTWeakLinkSymbol();
  if (v7)
    v7();
  -[CKFilteringListController reloadSpecifiers](self, "reloadSpecifiers");
  -[CKFilteringListController _syncManager](self, "_syncManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("IncomingMessageAlertFiltration"), CFSTR("IncomingMessageAlertFiltrationForcedOn"), CFSTR("MessageFilteringSettingsConfirmed"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.MobileSMS"), v8);

}

- (void)enableSpamFiltering:(id)a3
{
  id v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  int64_t v6;

  v4 = a3;
  CFPreferencesSetAppValue(CFSTR("IncomingMessageAlertSpamFiltration"), v4, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.IncomingMessageAlertSpamFiltration.changed"), 0, 0, 1u);
  v6 = objc_msgSend(v4, "integerValue");

  self->_spamFilterState = v6;
}

- (void)shouldShowPrivacyAccessWarning:(id)a3
{
  id v4;
  void *v5;
  PSSpecifier *selectedSpecifier;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.smsFilter.extension")))
  {
    self->_addCheckmark = 1;
    selectedSpecifier = self->_selectedSpecifier;
    self->_selectedSpecifier = (PSSpecifier *)v4;
    v7 = v4;

    -[CKFilteringListController userChangedSpamFilteringSettings](self, "userChangedSpamFilteringSettings");
    -[CKFilteringListController reloadSpecifier:](self, "reloadSpecifier:", v7);
  }
  else
  {
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75B50]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    MessagesSettingsLocalizedString(CFSTR("PRIVACY_WARNING_APP_NAME_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    MessagesSettingsLocalizedString(CFSTR("PRIVACY_WARNING_TEXT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    MessagesSettingsLocalizedString(CFSTR("PRIVACY_WARNING_CANCEL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("PRIVACY_WARNING_ACTION"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v23, v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BEBD3A8];
    v16 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __60__CKFilteringListController_shouldShowPrivacyAccessWarning___block_invoke;
    v26[3] = &unk_24D075BA0;
    v26[4] = self;
    v27 = v4;
    v17 = v4;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v13, 0, v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BEBD3A8];
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __60__CKFilteringListController_shouldShowPrivacyAccessWarning___block_invoke_2;
    v24[3] = &unk_24D075A28;
    v25 = v14;
    v20 = v14;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v12, 1, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v21);
    objc_msgSend(v20, "addAction:", v18);
    -[CKFilteringListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);

  }
}

uint64_t __60__CKFilteringListController_shouldShowPrivacyAccessWarning___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1377) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1432), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "userChangedSpamFilteringSettings");
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__CKFilteringListController_shouldShowPrivacyAccessWarning___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (unsigned)enableSpamForExtensionID:(id)a3 withName:(id)a4
{
  id v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  int64_t spamFilterState;

  v7 = a3;
  v8 = a4;
  if (v7 && objc_msgSend(v7, "length"))
  {
    -[PSSpecifier identifier](self->_selectedSpecifier, "identifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v7)
    {
      spamFilterState = self->_spamFilterState;

      if (spamFilterState == 1)
      {
LABEL_8:
        v10 = 1;
        goto LABEL_9;
      }
    }
    else
    {

    }
    CFPreferencesSetAppValue(CFSTR("spamFiltrationExtensionID"), v7, CFSTR("com.apple.MobileSMS"));
    CFPreferencesSetAppValue(CFSTR("spamFiltrationExtensionName"), v8, CFSTR("com.apple.MobileSMS"));
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    -[CKFilteringListController enableSpamFiltering:](self, "enableSpamFiltering:", &unk_24D094190);
    objc_storeStrong((id *)&self->_currentExtensionID, a3);
    -[CKFilteringListController _updateSMSFilteringParams](self, "_updateSMSFilteringParams");
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (void)disableSpamFiltering
{
  PSSpecifier *selectedSpecifier;
  void *v4;
  int v5;

  selectedSpecifier = self->_selectedSpecifier;
  self->_selectedSpecifier = 0;

  CFPreferencesSetAppValue(CFSTR("spamFiltrationExtensionID"), 0, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("spamFiltrationExtensionName"), 0, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  self->_spamFilterState = 0;
  -[CKFilteringListController enableSpamFiltering:](self, "enableSpamFiltering:", &unk_24D0941A8);
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSMSFilterSyncEnabled");

  if (v5)
    -[CKFilteringListController _updateSMSFilteringParams](self, "_updateSMSFilteringParams");
}

- (id)getDefaultExtension
{
  void *v3;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("spamFiltrationExtensionID"), CFSTR("com.apple.MobileSMS"));
  objc_storeStrong((id *)&self->_currentExtensionID, v3);
  if (v3)
    self->_spamFilterState = 1;
  return v3;
}

- (void)setIsSpamFilteringDefaultEnabled
{
  int AppBooleanValue;
  BOOL v4;
  int64_t v5;
  Boolean keyExistsAndHasValidFormat;

  if (self->_spamFilterState == -1)
  {
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("IncomingMessageAlertSpamFiltration"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v4 = AppBooleanValue == 0;
    else
      v4 = 1;
    v5 = !v4;
    self->_spamFilterState = v5;
  }
}

- (id)isSpamFilteringEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (self->_spamFilterState == 1)
  {
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AC0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", self->_currentExtensionID) & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDBD1C8];
    }
    else
    {
      -[CKFilteringListController disableSpamFiltering](self, "disableSpamFiltering");
      v7 = (void *)MEMORY[0x24BDBD1C0];
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PSSpecifier *v10;
  void *v11;
  void *v12;
  PSSpecifier **p_selectedSpecifier;
  PSSpecifier *selectedSpecifier;
  uint64_t v15;
  NSMutableArray *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)CKFilteringListController;
  -[CKFilteringListController tableView:cellForRowAtIndexPath:](&v33, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v5;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = self->_specifierListArray;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (!v28)
      goto LABEL_30;
    v7 = *(_QWORD *)v30;
    v8 = *MEMORY[0x24BE75AC0];
    v26 = *MEMORY[0x24BE75AC0];
    v27 = *MEMORY[0x24BE75D18];
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v6);
        v10 = *(PSSpecifier **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        -[PSSpecifier propertyForKey:](v10, "propertyForKey:", v8, v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier propertyForKey:](v10, "propertyForKey:", v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        p_selectedSpecifier = &self->_selectedSpecifier;
        selectedSpecifier = self->_selectedSpecifier;
        if (!selectedSpecifier)
        {
          if (self->_spamFilterState == 1)
          {
            if ((objc_msgSend(v11, "isEqualToString:", self->_currentExtensionID) & 1) != 0)
            {
              objc_storeStrong((id *)&self->_selectedSpecifier, v10);
              self->_addCheckmark = 1;
              goto LABEL_22;
            }
            selectedSpecifier = *p_selectedSpecifier;
          }
          else
          {
            selectedSpecifier = 0;
          }
        }
        if (selectedSpecifier == v10)
        {
          selectedSpecifier = v10;
          if (!self->_addCheckmark)
            goto LABEL_19;
          v15 = v7;
          v16 = v6;
          -[PSSpecifier name](v10, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[CKFilteringListController enableSpamForExtensionID:withName:](self, "enableSpamForExtensionID:withName:", v11, v17);

          if (v18)
          {
            objc_msgSend(v12, "setChecked:", 1);
            v6 = v16;
            v7 = v15;
            v8 = v26;
            goto LABEL_25;
          }
          selectedSpecifier = *p_selectedSpecifier;
          v6 = v16;
          v7 = v15;
          v8 = v26;
        }
        if (selectedSpecifier != v10)
          goto LABEL_20;
LABEL_19:
        if (self->_addCheckmark)
        {
LABEL_20:
          if (selectedSpecifier
            || (-[PSSpecifier identifier](v10, "identifier"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("noFilter")),
                v19,
                !v20))
          {
            v21 = v12;
            v22 = 0;
          }
          else
          {
LABEL_22:
            v21 = v12;
            v22 = 1;
          }
          objc_msgSend(v21, "setChecked:", v22);
          goto LABEL_25;
        }
        objc_msgSend(v12, "setChecked:", 0);
        -[CKFilteringListController disableSpamFiltering](self, "disableSpamFiltering");
LABEL_25:

        ++v9;
      }
      while (v28 != v9);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v28 = v23;
      if (!v23)
      {
LABEL_30:

        v5 = v25;
        return v5;
      }
    }
  }
  return v5;
}

- (void)tappedSpamAppCell:(id)a3
{
  if (self->_selectedSpecifier != a3)
  {
    self->_spamFilterState = -1;
    -[CKFilteringListController shouldShowPrivacyAccessWarning:](self, "shouldShowPrivacyAccessWarning:");
    -[CKFilteringListController _checkAndUpdateExtensionIDArray](self, "_checkAndUpdateExtensionIDArray");
  }
}

- (void)tappedNoFilterCell:(id)a3
{
  id v5;

  v5 = a3;
  if (self->_selectedSpecifier)
  {
    self->_addCheckmark = 1;
    objc_storeStrong((id *)&self->_selectedSpecifier, a3);
    -[CKFilteringListController disableSpamFiltering](self, "disableSpamFiltering");
    -[CKFilteringListController reloadSpecifier:](self, "reloadSpecifier:", v5);
    -[CKFilteringListController userChangedSpamFilteringSettings](self, "userChangedSpamFilteringSettings");
    -[CKFilteringListController _checkAndUpdateExtensionIDArray](self, "_checkAndUpdateExtensionIDArray");
  }

}

- (void)userChangedSpamFilteringSettings
{
  CFPreferencesSetAppValue(CFSTR("MessageSpamFilteringSettingsConfirmed"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

- (id)getExtensionNameAndWarning:(id)a3
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  id v7;

  objc_msgSend(a3, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedContainingName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = v4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("displayName"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("warningName"));

  return v7;
}

- (void)findSpamExtensions
{
  CKNSExtension *v3;
  CKNSExtension *ckExtension;
  void *v5;
  _QWORD v6[5];

  if (-[CKFilteringListController deviceSupportsSMSFilteringExtensions](self, "deviceSupportsSMSFilteringExtensions"))
  {
    if (!self->_ckExtension)
    {
      v3 = objc_alloc_init(CKNSExtension);
      ckExtension = self->_ckExtension;
      self->_ckExtension = v3;

      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __47__CKFilteringListController_findSpamExtensions__block_invoke;
      v6[3] = &unk_24D075ED8;
      v6[4] = self;
      v5 = (void *)MEMORY[0x2199B8E98](v6);
      -[CKNSExtension beginMatchingExtensions:](self->_ckExtension, "beginMatchingExtensions:", v5);

    }
  }
}

void __47__CKFilteringListController_findSpamExtensions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  CFPropertyListRef *v12;
  id v13;

  v5 = a3;
  +[CKSettingsMessagesController removeFirstPartyExtensionFromArrayIfNecessary:](CKSettingsMessagesController, "removeFirstPartyExtensionFromArrayIfNecessary:", a2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1384));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToSet:", v7);
  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setExtensionIDArray:", v13);
    objc_msgSend(*(id *)(a1 + 32), "setExtensionNameMapping:", v5);
  }
  v9 = objc_msgSend(v13, "count");
  v10 = *(_QWORD **)(a1 + 32);
  if (v9 || v10[175] != 1)
  {
    if ((objc_msgSend(v10, "verifyCurrentExtensionIDValidity") | v8 ^ 1) != 1)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(v10, "disableSpamFiltering");
    objc_msgSend(*(id *)(a1 + 32), "verifyCurrentExtensionIDValidity");
  }
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
LABEL_8:
  v11 = objc_msgSend(v13, "count");
  v12 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!v11)
    v12 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("MessageSpamFilteringExtensionInstalled"), *v12, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);

}

- (void)_checkAndUpdateExtensionIDArray
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Checking if we need to remove firstPartyExtension and reload specifiers.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  v4 = (void *)-[NSArray copy](self->_extensionIDArray, "copy");
  +[CKSettingsMessagesController removeFirstPartyExtensionFromArrayIfNecessary:](CKSettingsMessagesController, "removeFirstPartyExtensionFromArrayIfNecessary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "currentExtensionIDArray:%@, newExtensionIDArray:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v10 = v4;
    v11 = v5;
    IMLogString();
  }
  if ((objc_msgSend(v6, "isEqualToSet:", v7, v10, v11) & 1) == 0)
  {
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Extensions changed. Resetting extensionIDArray and reloading", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[CKFilteringListController setExtensionIDArray:](self, "setExtensionIDArray:", v5);
    -[CKFilteringListController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

- (BOOL)verifyCurrentExtensionIDValidity
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_spamFilterState != 1)
    return 1;
  v3 = -[CKFilteringListController getDefaultExtension](self, "getDefaultExtension");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_extensionIDArray;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "identifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", self->_currentExtensionID);

        if ((v10 & 1) != 0)
        {

          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[CKFilteringListController disableSpamFiltering](self, "disableSpamFiltering");
  -[CKFilteringListController reloadSpecifiers](self, "reloadSpecifiers");
  return 0;
}

- (void)appendAboutWiFiCallingFooterToGroupSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSRange v15;

  if (a3)
  {
    v4 = a3;
    MessagesSettingsLocalizedString(CFSTR("SPAM_EXTENSION_DESCRIPTION"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BE6E428];
    objc_msgSend(MEMORY[0x24BE6E3F8], "bundleWithIdentifier:", *MEMORY[0x24BE6E470]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flowWithBundle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedButtonTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v14, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v11, *MEMORY[0x24BE75A30]);

    objc_msgSend(v4, "setProperty:forKey:", v9, *MEMORY[0x24BE75A58]);
    v15.location = objc_msgSend(v9, "rangeOfString:", v8);
    NSStringFromRange(v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v12, *MEMORY[0x24BE75A40]);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v13, *MEMORY[0x24BE75A50]);

    objc_msgSend(v4, "setProperty:forKey:", CFSTR("showPrivacyLegalVC"), *MEMORY[0x24BE75A38]);
  }
}

- (void)showPrivacyLegalVC
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x24BE6E470]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (id)getSpamSpecifiers
{
  id v3;
  PSSpecifier *selectedSpecifier;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  NSMutableArray *specifierListArray;
  NSArray *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v37;
  uint64_t v38;
  NSArray *v39;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  CGSize v43;

  if (-[CKFilteringListController deviceSupportsSMSFilteringExtensions](self, "deviceSupportsSMSFilteringExtensions"))
  {
    v3 = -[CKFilteringListController getDefaultExtension](self, "getDefaultExtension");
    selectedSpecifier = self->_selectedSpecifier;
    self->_selectedSpecifier = 0;

    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    MessagesSettingsLocalizedString(CFSTR("SPAM_FILTERING_GROUP_LABEL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("SPAM_FILTERING_GROUP"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFilteringListController appendAboutWiFiCallingFooterToGroupSpecifier:](self, "appendAboutWiFiCallingFooterToGroupSpecifier:", v7);
    objc_msgSend(v5, "addObject:", v7);
    if (v7)
    {
      v8 = objc_msgSend(v5, "indexOfObject:", v7);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = v8;
        v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        specifierListArray = self->_specifierListArray;
        self->_specifierListArray = v10;

        v12 = self->_extensionIDArray;
        if (-[NSArray count](v12, "count"))
        {
          v38 = v9 + 1;
          v40[0] = MEMORY[0x24BDAC760];
          v40[1] = 3221225472;
          v40[2] = __46__CKFilteringListController_getSpamSpecifiers__block_invoke;
          v40[3] = &unk_24D075B10;
          v40[4] = self;
          v5 = v5;
          v41 = v5;
          v42 = v9 + 1;
          -[NSArray enumerateObjectsWithOptions:usingBlock:](v12, "enumerateObjectsWithOptions:usingBlock:", 2, v40);
          v13 = (char *)objc_alloc_init(MEMORY[0x24BE75590]);
          *(_QWORD *)&v13[*MEMORY[0x24BE75738]] = 2;
          v14 = objc_opt_class();
          objc_storeWeak((id *)&v13[*MEMORY[0x24BE75768]], self);
          objc_msgSend(v13, "setProperty:forKey:", CFSTR("noFilter"), *MEMORY[0x24BE75D50]);
          objc_msgSend(v13, "setProperty:forKey:", CFSTR("noFilter"), *MEMORY[0x24BE75B50]);
          MessagesSettingsLocalizedString(CFSTR("SPAM_EXTENSION_NO_FILTER"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setName:", v15);

          *(_QWORD *)&v13[*MEMORY[0x24BE75750]] = 0;
          objc_msgSend(v13, "setButtonAction:", sel_tappedNoFilterCell_);
          NSStringFromSelector(sel_tappedNoFilterCell_);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setProperty:forKey:", v16, *MEMORY[0x24BE75900]);

          objc_msgSend(v13, "setProperty:forKey:", v14, *MEMORY[0x24BE75948]);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setProperty:forKey:", v17, *MEMORY[0x24BE75A18]);

          v39 = v12;
          -[NSArray firstObject](v12, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x24BEBD640];
          v20 = (void *)MEMORY[0x24BDC1588];
          v37 = v18;
          objc_msgSend(v18, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "pluginKitProxyForIdentifier:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_iconForResourceProxy:format:", v22, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "size");
          v25 = v24;
          v27 = v26;
          objc_msgSend(v23, "scale");
          v29 = v28;
          v43.width = v25;
          v43.height = v27;
          UIGraphicsBeginImageContextWithOptions(v43, 0, v29);
          UIGraphicsGetImageFromCurrentImageContext();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          UIGraphicsEndImageContext();
          objc_msgSend(v13, "setProperty:forKey:", v30, *MEMORY[0x24BE75AC8]);
          objc_msgSend(v13, "propertyForKey:", *MEMORY[0x24BE75D18]);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setCellEnabled:", 1);
          objc_msgSend(v31, "setNeedsDisplay");
          objc_msgSend(v5, "insertObject:atIndex:", v13, v38);
          -[CKFilteringListController grayOutSMSFilteringIfNecessary:](self, "grayOutSMSFilteringIfNecessary:", v13);
          -[NSMutableArray addObject:](self->_specifierListArray, "addObject:", v13);
          objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isSMSFilterSyncEnabled");

          if (v33)
          {
            -[CKFilteringListController isConversationListFilteringEnabled:](self, "isConversationListFilteringEnabled:", 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqual:", MEMORY[0x24BDBD1C0]);

            if (v35)
              -[CKFilteringListController disableSpamFiltering](self, "disableSpamFiltering");
          }

          v12 = v39;
        }
        else
        {

          v5 = 0;
        }

      }
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __46__CKFilteringListController_getSpamSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "getExtensionNameAndWarning:", v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("warningName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (char *)objc_alloc_init(MEMORY[0x24BE75590]);
  *(_QWORD *)&v7[*MEMORY[0x24BE75738]] = 2;
  v8 = objc_opt_class();
  *(_QWORD *)&v7[*MEMORY[0x24BE75740]] = 0;
  objc_msgSend(v7, "setDetailControllerClass:", 0);
  objc_storeWeak((id *)&v7[*MEMORY[0x24BE75768]], *(id *)(a1 + 32));
  objc_msgSend(v7, "setProperty:forKey:", v5, *MEMORY[0x24BE75D50]);
  objc_msgSend(v7, "setProperty:forKey:", v6, *MEMORY[0x24BE75B50]);
  objc_msgSend(v7, "setName:", v5);
  *(_QWORD *)&v7[*MEMORY[0x24BE75750]] = 0;
  objc_msgSend(v7, "setButtonAction:", sel_tappedSpamAppCell_);
  NSStringFromSelector(sel_tappedSpamAppCell_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75900]);

  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75AC0]);
  objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x24BE75A18]);
  v12 = (void *)MEMORY[0x24BEBD640];
  v13 = (void *)MEMORY[0x24BDC1588];
  objc_msgSend(v4, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pluginKitProxyForIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_iconForResourceProxy:format:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", v16, *MEMORY[0x24BE75AC8]);
  objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCellEnabled:", 1);
  objc_msgSend(v17, "setNeedsDisplay");
  objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v7, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "grayOutSMSFilteringIfNecessary:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "addObject:", v7);

}

- (void)grayOutSMSFilteringIfNecessary:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  -[CKFilteringListController isConversationListFilteringEnabled:](self, "isConversationListFilteringEnabled:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", MEMORY[0x24BDBD1C0]);

  v6 = *MEMORY[0x24BE75A18];
  if (v5)
  {
    objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v6);

    objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSMSFilterSyncEnabled");

    if ((v8 & 1) == 0)
      -[CKFilteringListController disableSpamFiltering](self, "disableSpamFiltering");
  }
  else
  {
    objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v6);

  }
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    MessagesSettingsLocalizedString(CFSTR("MESSAGES_FILTERING_LABEL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("IMESSAGE_FILTERING_GROUP"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("MADRID_FILTER"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);

    objc_msgSend(v5, "addObject:", v7);
    v9 = (void *)MEMORY[0x24BE75590];
    MessagesSettingsLocalizedString(CFSTR("MADRID_FILTER_LABEL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, sel_setConversationListFilteringEnabled_specifier_, sel_isConversationListFilteringEnabled_, 0, 6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(v5, "addObject:", v11);
    -[CKFilteringListController getSpamSpecifiers](self, "getSpamSpecifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v5, "addObjectsFromArray:", v12);
    v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)deviceSupportsSMSFilteringExtensions
{
  void *v2;
  int v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSMSFilterSyncEnabled");

  if (!v3)
    return 1;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") == 0;

  return v5;
}

- (void)_updateSMSFilteringParams
{
  void (*v2)(void);

  v2 = (void (*)(void))CUTWeakLinkSymbol();
  if (v2)
    v2();
}

- (NSArray)extensionIDArray
{
  return self->_extensionIDArray;
}

- (void)setExtensionIDArray:(id)a3
{
  objc_storeStrong((id *)&self->_extensionIDArray, a3);
}

- (NSDictionary)extensionNameMapping
{
  return self->_extensionNameMapping;
}

- (void)setExtensionNameMapping:(id)a3
{
  objc_storeStrong((id *)&self->_extensionNameMapping, a3);
}

- (BOOL)showingParentViewController
{
  return self->_showingParentViewController;
}

- (void)setShowingParentViewController:(BOOL)a3
{
  self->_showingParentViewController = a3;
}

- (int64_t)spamFilterState
{
  return self->_spamFilterState;
}

- (void)setSpamFilterState:(int64_t)a3
{
  self->_spamFilterState = a3;
}

- (BOOL)addCheckmark
{
  return self->_addCheckmark;
}

- (void)setAddCheckmark:(BOOL)a3
{
  self->_addCheckmark = a3;
}

- (id)beginMappingID
{
  return self->_beginMappingID;
}

- (void)setBeginMappingID:(id)a3
{
  objc_storeStrong(&self->_beginMappingID, a3);
}

- (CKNSExtension)ckExtension
{
  return self->_ckExtension;
}

- (void)setCkExtension:(id)a3
{
  objc_storeStrong((id *)&self->_ckExtension, a3);
}

- (NSString)currentExtensionID
{
  return self->_currentExtensionID;
}

- (void)setCurrentExtensionID:(id)a3
{
  objc_storeStrong((id *)&self->_currentExtensionID, a3);
}

- (PSSpecifier)selectedSpecifier
{
  return self->_selectedSpecifier;
}

- (void)setSelectedSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSpecifier, a3);
}

- (NSMutableArray)specifierListArray
{
  return self->_specifierListArray;
}

- (void)setSpecifierListArray:(id)a3
{
  objc_storeStrong((id *)&self->_specifierListArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierListArray, 0);
  objc_storeStrong((id *)&self->_selectedSpecifier, 0);
  objc_storeStrong((id *)&self->_currentExtensionID, 0);
  objc_storeStrong((id *)&self->_ckExtension, 0);
  objc_storeStrong(&self->_beginMappingID, 0);
  objc_storeStrong((id *)&self->_extensionNameMapping, 0);
  objc_storeStrong((id *)&self->_extensionIDArray, 0);
}

@end
