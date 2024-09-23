@implementation NSBundle

void __66__NSBundle_GKAdditions___gkBundleIdentifierIsRelatedToContactsUI___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.iosframeworksqa.GKContactsUITester");
  v4[1] = CFSTR("com.apple.mobilephone");
  v4[2] = CFSTR("com.apple.MobileSMS");
  v4[3] = CFSTR("com.apple.MobileAddressBook");
  v4[4] = CFSTR("com.apple.ContactsUI.ContactViewViewService");
  v4[5] = CFSTR("com.apple.ContactsUI.ContactsViewService");
  v4[6] = CFSTR("com.apple.ContactsUI");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_gkBundleIdentifierIsRelatedToContactsUI__contactsUIBundleIdentifiers;
  _gkBundleIdentifierIsRelatedToContactsUI__contactsUIBundleIdentifiers = v2;

}

void __63__NSBundle_GKAdditions___gkMainBundleIsGameCenterSystemProcess__block_invoke()
{
  char v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "_gkIsGameCenter") & 1) != 0
    || (objc_msgSend(v1, "_gkIsGameCenterExtension") & 1) != 0
    || (objc_msgSend(v1, "_gkIsPreferences") & 1) != 0
    || (objc_msgSend(v1, "_gkIsDaemon") & 1) != 0)
  {
    v0 = 1;
  }
  else
  {
    v0 = objc_msgSend(v1, "_gkIsFirstParty");
  }
  _gkMainBundleIsGameCenterSystemProcess_isGameCenterSystemProcess = v0;

}

void __40__NSBundle_GKAdditions___gkIsFirstParty__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = CFSTR("com.apple.AppStore");
  v10[1] = CFSTR("com.apple.Arcade");
  v10[2] = CFSTR("com.apple.GameOverlayUI");
  v10[3] = CFSTR("com.apple.Messages");
  v10[4] = CFSTR("com.apple.TVAppStore");
  v10[5] = CFSTR("com.apple.AppStore.ProductPageExtension");
  v10[6] = CFSTR("com.apple.AppStore.SubscribePageExtension");
  v10[7] = CFSTR("com.apple.TVAppStore.AppStoreTopShelfExtension");
  v10[8] = CFSTR("com.apple.AppStore.Widgets");
  v10[9] = CFSTR("com.apple.Arcade.Widgets");
  v10[10] = CFSTR("com.apple.CopresenceCore");
  v10[11] = CFSTR("com.apple.RealityHUD");
  v10[12] = CFSTR("com.apple.GameCenterOverlay");
  v10[13] = CFSTR("com.apple.GameCenterRemoteAlert");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "_gkIsContacts") & 1) != 0)
  {
    _gkIsFirstParty_isFirstParty = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkSHA256Hash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("t/IRG+OATWH+smiJ2A4GRp6fHjSftOF5bYwT7kv+1Mk=")) & 1) != 0)
    {
      _gkIsFirstParty_isFirstParty = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_gkSHA256Hash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _gkIsFirstParty_isFirstParty = objc_msgSend(v9, "isEqualToString:", CFSTR("BKN3YPrkowJshOfzYN9kxtu/zEFYrAWOeXV3rzu9h1k="));

    }
  }

}

id __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  const __CFURL *v16;
  CFBundleRef v17;
  void *v18;

  v10 = (void *)MEMORY[0x1E0C99E98];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(a2, "bundlePath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:", v15);
  v16 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v17 = CFBundleCreate(0, v16);

  v18 = (void *)CFBundleCopyLocalizedStringForLocalization();
  CFRelease(v17);
  return v18;
}

void __53__NSBundle_GKAdditions___gkIsEligibleForOnboardingUI__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = CFSTR("com.apple.AppStore");
  v8[1] = CFSTR("com.apple.TVAppStore");
  v8[2] = CFSTR("com.apple.GameCenterRemoteAlert");
  v8[3] = CFSTR("com.apple.RealityHUD");
  v8[4] = CFSTR("com.apple.GameOverlayUI");
  v8[5] = CFSTR("com.apple.MuseBuddy");
  v8[6] = CFSTR("com.apple.internal.appleAccountSetupTool");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (_GKIsRemoteUI
    || (objc_msgSend(v5, "_gkIsGameCenter") & 1) != 0
    || (objc_msgSend(v6, "_gkIsPreferences") & 1) != 0
    || (objc_msgSend(v6, "_gkIsContacts") & 1) != 0
    || (objc_msgSend(v6, "_gkIsGameCenterExtension") & 1) != 0
    || objc_msgSend(v6, "_gkIsPurpleBuddy"))
  {
    _gkIsEligibleForOnboardingUI_isEligible = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _gkIsEligibleForOnboardingUI_isEligible = objc_msgSend(v4, "containsObject:", v7) ^ 1;

  }
}

@end
