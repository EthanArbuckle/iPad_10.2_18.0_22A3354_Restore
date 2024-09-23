@implementation ICAuthenticationAlert

- (ICAuthenticationAlert)init
{
  ICAuthenticationAlert *v2;
  ICAuthenticationAlert *v3;
  NSString *title;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAuthenticationAlert;
  v2 = -[ICAuthenticationAlert init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = (NSString *)&stru_1E5C2F8C0;

  }
  return v3;
}

+ (id)aboutLockedNotesInfoAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Locked Notes"), CFSTR("Locked Notes"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Tap the lock icon in the toolbar or lock your device to hide the contents of your locked notes."), CFSTR("Tap the lock icon in the toolbar or lock your device to hide the contents of your locked notes."), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v2, "setMessage:", v4);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v5);

  -[ICAuthenticationAlert setDismissHandler:](v2, "setDismissHandler:", &__block_literal_global_62);
  -[ICAuthenticationAlert setShouldPresentHandler:](v2, "setShouldPresentHandler:", &__block_literal_global_19_1);
  return v2;
}

void __50__ICAuthenticationAlert_aboutLockedNotesInfoAlert__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBool:forKey:", 1, CFSTR("ICNoteAddPasswordFirstTimeMessageCompletedKey"));

}

uint64_t __50__ICAuthenticationAlert_aboutLockedNotesInfoAlert__block_invoke_2()
{
  void *v0;
  uint64_t v1;

  if (!objc_msgSend(MEMORY[0x1E0D641E0], "isRunningInApp"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ICNoteAddPasswordFirstTimeMessageCompletedKey")) ^ 1;

  return v1;
}

+ (id)upgradeToLockNotesInfoAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Upgrade Your Notes"), CFSTR("Upgrade Your Notes"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You’ll need to go to Notes and upgrade your notes to configure locking notes."), CFSTR("You’ll need to go to Notes and upgrade your notes to configure locking notes."), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v2, "setMessage:", v4);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v5);

  return v2;
}

+ (id)messageForPreventLockReason:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  switch(a3)
  {
    case 1uLL:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("This note is too large to lock. You need to remove or reduce attachments and other content, then try again.");
      goto LABEL_10;
    case 2uLL:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Notes with video, audio, tags, PDF, or file attachments or using features from a newer version of Notes can’t be locked.");
      goto LABEL_10;
    case 3uLL:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Notes with tags can’t be locked.");
      goto LABEL_10;
    case 4uLL:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Quick Notes can’t be locked.");
      goto LABEL_10;
    case 5uLL:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Shared notes can’t be locked.");
      goto LABEL_10;
    case 6uLL:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("This account doesn’t support locked notes.");
LABEL_10:
      objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1, v3, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

+ (id)cannotLockInfoAlertWithReason:(unint64_t)a3
{
  ICAuthenticationAlert *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Can’t Lock Note"), CFSTR("Can’t Lock Note"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v5, "setTitle:", v6);

  objc_msgSend(a1, "messageForPreventLockReason:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v5, "setMessage:", v7);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v5, "setDismissTitle:", v8);

  return v5;
}

+ (id)cannotAddAttachmentsInfoAlertWithAttachmentCount:(unint64_t)a3
{
  ICAuthenticationAlert *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(ICAuthenticationAlert);
  if (a3 == 1)
    v5 = CFSTR("Can’t Add Attachment");
  else
    v5 = CFSTR("Can’t Add Attachments");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v4, "setTitle:", v6);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Locked notes can’t contain video, audio, tags, PDF, or file attachments."), CFSTR("Locked notes can’t contain video, audio, tags, PDF, or file attachments."), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v4, "setMessage:", v7);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v4, "setDismissTitle:", v8);

  return v4;
}

+ (id)enableBiometricsActionAlertShownKeyWithAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ICAuthenticationAlertEnableBiometricActionAlertPresented-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)enableBiometricsActionAlertWithAccount:(id)a3
{
  id v4;
  void *v5;
  ICAuthenticationAlert *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v4 = a3;
  objc_msgSend(a1, "enableBiometricsActionAlertShownKeyWithAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(ICAuthenticationAlert);
  -[ICAuthenticationAlert setPrefersSheet:](v6, "setPrefersSheet:", 1);
  if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 4)
  {
    v7 = (void *)MEMORY[0x1E0D64218];
    v8 = CFSTR("Enable Optic ID for this account’s locked notes.");
  }
  else if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 2)
  {
    v7 = (void *)MEMORY[0x1E0D64218];
    v8 = CFSTR("Enable Face ID for this account’s locked notes.");
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType");
    v7 = (void *)MEMORY[0x1E0D64218];
    if (v9 == 1)
      v8 = CFSTR("Enable Touch ID for this account’s locked notes.");
    else
      v8 = CFSTR("Enable biometrics for this account’s locked notes.");
  }
  objc_msgSend(v7, "localizedFrameworkStringForKey:value:table:allowSiri:", v8, v8, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v6, "setTitle:", v10);

  if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 4)
  {
    v11 = (void *)MEMORY[0x1E0D64218];
    v12 = CFSTR("Enable Optic ID");
  }
  else if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 2)
  {
    v11 = (void *)MEMORY[0x1E0D64218];
    v12 = CFSTR("Enable Face ID");
  }
  else
  {
    v13 = objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType");
    v11 = (void *)MEMORY[0x1E0D64218];
    if (v13 == 1)
      v12 = CFSTR("Enable Touch ID");
    else
      v12 = CFSTR("Enable Biometrics");
  }
  objc_msgSend(v11, "localizedFrameworkStringForKey:value:table:allowSiri:", v12, v12, 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v6, "setActionTitle:", v14);

  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke;
  v28[3] = &unk_1E5C226E8;
  v16 = v5;
  v29 = v16;
  v17 = v4;
  v30 = v17;
  -[ICAuthenticationAlert setActionHandler:](v6, "setActionHandler:", v28);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Not Now"), CFSTR("Not Now"), 0, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v6, "setDismissTitle:", v18);

  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke_2;
  v26[3] = &unk_1E5C22710;
  v19 = v16;
  v27 = v19;
  -[ICAuthenticationAlert setDismissHandler:](v6, "setDismissHandler:", v26);
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke_3;
  v23[3] = &unk_1E5C22738;
  v24 = v17;
  v25 = v19;
  v20 = v19;
  v21 = v17;
  -[ICAuthenticationAlert setShouldPresentHandler:](v6, "setShouldPresentHandler:", v23);

  return v6;
}

void __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, *(_QWORD *)(a1 + 32));

  +[ICAuthentication shared](ICAuthentication, "shared");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBiometricsEnabled:account:", 1, *(_QWORD *)(a1 + 40));

}

void __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, *(_QWORD *)(a1 + 32));

}

uint64_t __64__ICAuthenticationAlert_enableBiometricsActionAlertWithAccount___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!objc_msgSend(MEMORY[0x1E0D641E0], "isRunningInApp")
    || !objc_msgSend(MEMORY[0x1E0D63B90], "biometricsEnrolled"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "biometricsEnabledForAccount:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "BOOLForKey:", *(_QWORD *)(a1 + 40)) ^ 1;

  }
  return v3;
}

+ (id)devicePasswordIncompatibleConfirmationAlertWithAccount:(id)a3 incompatibilityMessage:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  ICAuthenticationAlert *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a4;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes locked using your device passcode are only viewable on iOS 16, iPadOS 16, and macOS 13 and later. Your devices that need upgrading:"), CFSTR("Notes locked using your device passcode are only viewable on iOS 16, iPadOS 16, and macOS 13 and later. Your devices that need upgrading:"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Locked Notes Not Viewable on Some Devices"), CFSTR("Locked Notes Not Viewable on Some Devices"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v7, "setTitle:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@\n\n%@"), v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAuthenticationAlert setMessage:](v7, "setMessage:", v9);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Continue"), CFSTR("Continue"), 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v7, "setActionTitle:", v10);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v7, "setDismissTitle:", v11);

  return v7;
}

+ (id)switchedToCustomPasswordModeInfoAlertWithAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICAuthenticationAlert *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Updated to Custom Password"), CFSTR("Updated to Custom Password"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Use the password you created to manage your locked notes."), CFSTR("Use the password you created to manage your locked notes."), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Use the password you created to manage locked notes in your “%@” account."), CFSTR("Use the password you created to manage locked notes in your “%@” account."), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "customAccountNameForAccount:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(ICAuthenticationAlert);
  -[ICAuthenticationAlert setTitle:](v10, "setTitle:", v6);
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationAlert setMessage:](v10, "setMessage:", v11);

  }
  else
  {
    -[ICAuthenticationAlert setMessage:](v10, "setMessage:", v7);
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v10, "setDismissTitle:", v12);

  return v10;
}

+ (id)switchedToDevicePasswordModeInfoAlertWithAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ICAuthenticationAlert *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Use your device passcode to manage your locked notes."), CFSTR("Use your device passcode to manage your locked notes."), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Use your device passcode to manage locked notes in your “%@” account."), CFSTR("Use your device passcode to manage locked notes in your “%@” account."), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "customAccountNameForAccount:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Updated to Device Passcode"), CFSTR("Updated to Device Passcode"), 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v9, "setTitle:", v10);

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationAlert setMessage:](v9, "setMessage:", v11);

  }
  else
  {
    -[ICAuthenticationAlert setMessage:](v9, "setMessage:", v6);
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v9, "setDismissTitle:", v12);

  return v9;
}

+ (id)switchedModeInfoAlertWithAccount:(id)a3
{
  void *v3;
  id v5;
  unsigned int v6;
  uint64_t v7;

  v5 = a3;
  v6 = objc_msgSend(v5, "resolvedLockedNotesMode");
  if (v6 < 2)
  {
    objc_msgSend(a1, "switchedToCustomPasswordModeInfoAlertWithAccount:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v3 = (void *)v7;
    goto LABEL_6;
  }
  if (v6 == 2)
  {
    objc_msgSend(a1, "switchedToDevicePasswordModeInfoAlertWithAccount:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v3;
}

+ (id)switchToDevicePasswordInSettingsInfoAlertWithAccount:(id)a3
{
  id v4;
  ICAuthenticationAlert *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(ICAuthenticationAlert);
  -[ICAuthenticationAlert setPrefersSheet:](v5, "setPrefersSheet:", 1);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Switch at Any Time"), CFSTR("Switch at Any Time"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v5, "setTitle:", v6);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You can switch to using your device passcode at any time in Settings > Apps > Notes > Password."), CFSTR("You can switch to using your device passcode at any time in Settings > Apps > Notes > Password."), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v5, "setMessage:", v7);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v5, "setActionTitle:", v8);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__ICAuthenticationAlert_switchToDevicePasswordInSettingsInfoAlertWithAccount___block_invoke;
  v11[3] = &unk_1E5C22760;
  v12 = v4;
  v13 = a1;
  v9 = v4;
  -[ICAuthenticationAlert setShouldPresentHandler:](v5, "setShouldPresentHandler:", v11);

  return v5;
}

uint64_t __78__ICAuthenticationAlert_switchToDevicePasswordInSettingsInfoAlertWithAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "shouldPresentSwitchToDevicePasswordPromptForAccount:", *(_QWORD *)(a1 + 32)) ^ 1;
}

+ (id)forgotCustomPasswordSwitchAnywayConfirmationAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  -[ICAuthenticationAlert setPrefersSheet:](v2, "setPrefersSheet:", 1);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Forgot Password"), CFSTR("Forgot Password"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("If you forgot the password you created for notes in this account, you can still choose the Device Passcode method for future locked notes. Your currently locked notes won’t be affected and will remain locked using the current password."), CFSTR("If you forgot the password you created for notes in this account, you can still choose the Device Passcode method for future locked notes. Your currently locked notes won’t be affected and will remain locked using the current password."), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v2, "setMessage:", v4);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Switch Anyway"), CFSTR("Switch Anyway"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v2, "setActionTitle:", v5);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Not Now"), CFSTR("Not Now"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v6);

  return v2;
}

+ (id)switchToDevicePasswordPromptPresentedCountKeyForAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ICAuthenticationAlertSwitchToDevicePasswordPromptPresentedCount-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)shouldPresentSwitchToDevicePasswordPromptForAccount:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a1, "switchToDevicePasswordPromptPresentedCountKeyForAccount:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", v3) < 2;

  return v5;
}

+ (void)markSwitchToDevicePasswordPromptPresentedForAccount:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "switchToDevicePasswordPromptPresentedCountKeyForAccount:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", v6) + 1;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", v4, v6);

}

+ (id)customPasswordConfirmationAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  -[ICAuthenticationAlert setPrefersSheet:](v2, "setPrefersSheet:", 1);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("About Creating a Password"), CFSTR("About Creating a Password"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("If you forget your password, Apple can’t reset it and your locked notes can’t be recovered."), CFSTR("If you forget your password, Apple can’t reset it and your locked notes can’t be recovered."), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v2, "setMessage:", v4);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Continue"), CFSTR("Continue"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v2, "setActionTitle:", v5);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v6);

  return v2;
}

+ (id)rememberCustomPasswordInfoAlertPresentedKeyForAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ICAuthenticationAlertSwitchToDevicePasswordPromptPresentedCount-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)rememberCustomPasswordInfoAlertWithAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICAuthenticationAlert *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v4 = (void *)MEMORY[0x1E0D63B90];
  v5 = a3;
  if (objc_msgSend(v4, "biometricsType") == 4)
  {
    v6 = (void *)MEMORY[0x1E0D64218];
    v7 = CFSTR("Forgetting your notes password can cause you to lose access to your locked notes, even if Optic ID is enabled.\n\nIf you have forgotten your notes password, tap Learn More for next steps.");
  }
  else if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 2)
  {
    v6 = (void *)MEMORY[0x1E0D64218];
    v7 = CFSTR("Forgetting your notes password can cause you to lose access to your locked notes, even if Face ID is enabled.\n\nIf you have forgotten your notes password, tap Learn More for next steps.");
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType");
    v6 = (void *)MEMORY[0x1E0D64218];
    if (v8 == 1)
      v7 = CFSTR("Forgetting your notes password can cause you to lose access to your locked notes, even if Touch ID is enabled.\n\nIf you have forgotten your notes password, tap Learn More for next steps.");
    else
      v7 = CFSTR("Forgetting your notes password can cause you to lose access to your locked notes, even if biometrics are enabled.\n\nIf you have forgotten your notes password, tap Learn More for next steps.");
  }
  objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", v7, v7, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 4)
  {
    v10 = (void *)MEMORY[0x1E0D64218];
    v11 = CFSTR("Forgetting the password you created for notes in your “%@” account can cause you to lose access to your locked notes, even if Optic ID is enabled.\n\nIf you have forgotten this password, tap Learn More for next steps.");
  }
  else if (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 2)
  {
    v10 = (void *)MEMORY[0x1E0D64218];
    v11 = CFSTR("Forgetting the password you created for notes in your “%@” account can cause you to lose access to your locked notes, even if Face ID is enabled.\n\nIf you have forgotten this password, tap Learn More for next steps.");
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType");
    v10 = (void *)MEMORY[0x1E0D64218];
    if (v12 == 1)
      v11 = CFSTR("Forgetting the password you created for notes in your “%@” account can cause you to lose access to your locked notes, even if Touch ID is enabled.\n\nIf you have forgotten this password, tap Learn More for next steps.");
    else
      v11 = CFSTR("Forgetting the password you created for notes in your “%@” account can cause you to lose access to your locked notes, even if biometrics are enabled.\n\nIf you have forgotten this password, tap Learn More for next steps.");
  }
  objc_msgSend(v10, "localizedFrameworkStringForKey:value:table:allowSiri:", v11, v11, 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "customAccountNameForAccount:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringWithFormat:", CFSTR("ICPasswordUtilitiesAlertOfDontForgetPasswordHasShownKey_%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Don’t Forget Your Notes Password"), CFSTR("Don’t Forget Your Notes Password"), 0, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v18, "setTitle:", v19);

  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v13, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationAlert setMessage:](v18, "setMessage:", v20);

  }
  else
  {
    -[ICAuthenticationAlert setMessage:](v18, "setMessage:", v9);
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v18, "setActionTitle:", v21);

  v22 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke;
  v32[3] = &unk_1E5C22710;
  v23 = v17;
  v33 = v23;
  -[ICAuthenticationAlert setActionHandler:](v18, "setActionHandler:", v32);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Learn More"), CFSTR("Learn More"), 0, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v18, "setDismissTitle:", v24);

  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke_2;
  v30[3] = &unk_1E5C22710;
  v25 = v23;
  v31 = v25;
  -[ICAuthenticationAlert setDismissHandler:](v18, "setDismissHandler:", v30);
  v28[0] = v22;
  v28[1] = 3221225472;
  v28[2] = __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke_3;
  v28[3] = &unk_1E5C22788;
  v29 = v25;
  v26 = v25;
  -[ICAuthenticationAlert setShouldPresentHandler:](v18, "setShouldPresentHandler:", v28);

  return v18;
}

void __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, *(_QWORD *)(a1 + 32));

}

void __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D64188];
  v4 = a2;
  objc_msgSend(v3, "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", 1, *(_QWORD *)(a1 + 32));

  objc_msgSend(v4, "rootViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[ICHelp presentWithTopic:presentingViewController:](ICHelp, "presentWithTopic:presentingViewController:", CFSTR("apdeefb92e46"), v6);
}

uint64_t __68__ICAuthenticationAlert_rememberCustomPasswordInfoAlertWithAccount___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v3;
}

+ (id)missingCustomPasswordInfoAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Enter a Password"), CFSTR("Enter a Password"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v4);

  return v2;
}

+ (id)mismatchedCustomPasswordInfoAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Passwords Don’t Match"), CFSTR("Passwords Don’t Match"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v4);

  return v2;
}

+ (id)cannotSetCustomPasswordInfoAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Unable to Set Password"), CFSTR("Unable to Set Password"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v4);

  return v2;
}

+ (id)incorrectCustomPasswordInfoAlertWithObject:(id)a3 showHint:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICAuthenticationAlert *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Please try again."), CFSTR("Please try again."), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Hint: %@"), CFSTR("Hint: %@"), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passwordHint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "passwordHint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  v12 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("That’s not the correct password."), CFSTR("That’s not the correct password."), 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v12, "setTitle:", v13);

  if (v4 && v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@\n\n%@"), v6, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationAlert setMessage:](v12, "setMessage:", v14);

  }
  else
  {
    -[ICAuthenticationAlert setMessage:](v12, "setMessage:", v6);
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v12, "setDismissTitle:", v15);

  return v12;
}

+ (id)updateDivergedCustomPasswordNotesActionAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Update Password?"), CFSTR("Update Password?"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This note is using an old password. Would you like to update all notes using this password to use your current password?"), CFSTR("This note is using an old password. Would you like to update all notes using this password to use your current password?"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v2, "setMessage:", v4);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Update Password"), CFSTR("Update Password"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v2, "setActionTitle:", v5);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Not Now"), CFSTR("Not Now"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v6);

  return v2;
}

+ (id)updateDivergedCustomPasswordAttachmentsActionAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Update Password?"), CFSTR("Update Password?"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Would you like to update all attachments using this password to match the note’s password?"), CFSTR("Would you like to update all attachments using this password to match the note’s password?"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v2, "setMessage:", v4);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Update Password"), CFSTR("Update Password"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v2, "setActionTitle:", v5);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Not Now"), CFSTR("Not Now"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v6);

  return v2;
}

+ (id)updateDivergedCustomPasswordModeActionAlertWithAccount:(id)a3 incompatibilityMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  ICAuthenticationAlert *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This note is using an old password. Would you like to update it to use your device passcode?"), CFSTR("This note is using an old password. Would you like to update it to use your device passcode?"), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This note is using an old password. If you update it to use your device passcode, it won’t be viewable on the following devices:"), CFSTR("This note is using an old password. If you update it to use your device passcode, it won’t be viewable on the following devices:"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Update Password?"), CFSTR("Update Password?"), 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v9, "setTitle:", v10);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@\n\n%@"), v8, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationAlert setMessage:](v9, "setMessage:", v11);

  }
  else
  {
    -[ICAuthenticationAlert setMessage:](v9, "setMessage:", v7);
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Update Password"), CFSTR("Update Password"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v9, "setActionTitle:", v12);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__ICAuthenticationAlert_updateDivergedCustomPasswordModeActionAlertWithAccount_incompatibilityMessage___block_invoke;
  v16[3] = &unk_1E5C22710;
  v17 = v5;
  v13 = v5;
  -[ICAuthenticationAlert setActionHandler:](v9, "setActionHandler:", v16);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Not Now"), CFSTR("Not Now"), 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v9, "setDismissTitle:", v14);

  return v9;
}

void __103__ICAuthenticationAlert_updateDivergedCustomPasswordModeActionAlertWithAccount_incompatibilityMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  +[ICAuthenticationPrompt promptForChangingMode:account:](ICAuthenticationPrompt, "promptForChangingMode:account:", 2, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAuthentication shared](ICAuthentication, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__ICAuthenticationAlert_updateDivergedCustomPasswordModeActionAlertWithAccount_incompatibilityMessage___block_invoke_2;
  v7[3] = &unk_1E5C227B0;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "authenticateWithPrompt:displayWindow:completionHandler:", v4, v6, v7);

}

void __103__ICAuthenticationAlert_updateDivergedCustomPasswordModeActionAlertWithAccount_incompatibilityMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2 == 2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      +[ICLockedNotesModeMigrator sharedMigrator](ICLockedNotesModeMigrator, "sharedMigrator");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "migrateLockedNotesInAccount:toMode:window:completionHandler:", *(_QWORD *)(a1 + 32), 2, *(_QWORD *)(a1 + 40), 0);

    }
  }
}

+ (id)resetCustomPasswordInfoAlertWithAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ICAuthenticationAlert *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This allows you to create a new password for notes you lock from now on. Notes that already have a password aren’t affected."), CFSTR("This allows you to create a new password for notes you lock from now on. Notes that already have a password aren’t affected."), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This allows you to create a new password for notes you lock in your “%@” account from now on. Notes that already have a password aren’t affected."), CFSTR("This allows you to create a new password for notes you lock in your “%@” account from now on. Notes that already have a password aren’t affected."), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "customAccountNameForAccount:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(ICAuthenticationAlert);
  -[ICAuthenticationAlert setPrefersSheet:](v9, "setPrefersSheet:", 1);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Reset Notes Password?"), CFSTR("Reset Notes Password?"), 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v9, "setTitle:", v10);

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationAlert setMessage:](v9, "setMessage:", v11);

  }
  else
  {
    -[ICAuthenticationAlert setMessage:](v9, "setMessage:", v6);
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v9, "setActionTitle:", v12);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v9, "setDismissTitle:", v13);

  return v9;
}

+ (id)resetCustomPasswordConfirmationAlertWithAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ICAuthenticationAlert *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0D64218];
  v5 = a3;
  objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This will change the password you use for your notes from now on."), CFSTR("This will change the password you use for your notes from now on."), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This will change the password you use for notes in your “%@” account from now on."), CFSTR("This will change the password you use for notes in your “%@” account from now on."), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "customAccountNameForAccount:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(ICAuthenticationAlert);
  -[ICAuthenticationAlert setPrefersSheet:](v9, "setPrefersSheet:", 1);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Are you sure you want to reset your password?"), CFSTR("Are you sure you want to reset your password?"), 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v9, "setTitle:", v10);

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationAlert setMessage:](v9, "setMessage:", v11);

  }
  else
  {
    -[ICAuthenticationAlert setMessage:](v9, "setMessage:", v6);
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Reset Password"), CFSTR("Reset Password"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v9, "setActionTitle:", v12);

  -[ICAuthenticationAlert setActionIsDestructive:](v9, "setActionIsDestructive:", 1);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v9, "setDismissTitle:", v13);

  return v9;
}

+ (id)setDevicePasswordActionAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("No Passcode Set"), CFSTR("No Passcode Set"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You must set a passcode in Settings to use it to lock notes."), CFSTR("You must set a passcode in Settings to use it to lock notes."), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v2, "setMessage:", v4);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Set Up Passcode"), CFSTR("Set Up Passcode"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v2, "setActionTitle:", v5);

  -[ICAuthenticationAlert setActionHandler:](v2, "setActionHandler:", &__block_literal_global_178);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v6);

  return v2;
}

void __53__ICAuthenticationAlert_setDevicePasswordActionAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSCODE"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

+ (id)setDevicePasswordInfoAlert
{
  void *v2;
  void *v3;
  void *v4;
  ICAuthenticationAlert *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ICAuthenticationSetDevicePasswordInfoPresentedAt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("No Passcode Set"), CFSTR("No Passcode Set"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v5, "setTitle:", v6);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Anyone that can view notes on this device can view its locked notes. Locked notes are still end-to-end encrypted.\n\nSet a passcode to protect locked notes on this device."), CFSTR("Anyone that can view notes on this device can view its locked notes. Locked notes are still end-to-end encrypted.\n\nSet a passcode to protect locked notes on this device."), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v5, "setMessage:", v7);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Set Up Passcode"), CFSTR("Set Up Passcode"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v5, "setActionTitle:", v8);

  -[ICAuthenticationAlert setActionHandler:](v5, "setActionHandler:", &__block_literal_global_188);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Not Now"), CFSTR("Not Now"), 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v5, "setDismissTitle:", v9);

  -[ICAuthenticationAlert setDismissHandler:](v5, "setDismissHandler:", &__block_literal_global_189);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__ICAuthenticationAlert_setDevicePasswordInfoAlert__block_invoke_3;
  v12[3] = &unk_1E5C22788;
  v13 = v4;
  v10 = v4;
  -[ICAuthenticationAlert setShouldPresentHandler:](v5, "setShouldPresentHandler:", v12);

  return v5;
}

void __51__ICAuthenticationAlert_setDevicePasswordInfoAlert__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKey:", v1, CFSTR("ICAuthenticationSetDevicePasswordInfoPresentedAt"));

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSCODE"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

void __51__ICAuthenticationAlert_setDevicePasswordInfoAlert__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", v0, CFSTR("ICAuthenticationSetDevicePasswordInfoPresentedAt"));

}

BOOL __51__ICAuthenticationAlert_setDevicePasswordInfoAlert__block_invoke_3(uint64_t a1)
{
  void *v1;
  double v2;

  v1 = *(void **)(a1 + 32);
  if (!v1)
    return 1;
  objc_msgSend(v1, "timeIntervalSinceNow");
  return v2 <= -2592000.0;
}

+ (id)signIntoCloudAccountActionAlertWithAccount:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICAuthenticationAlert *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  if ((ICInternalSettingsIsAppleAccountBrandingEnabled() & 1) != 0)
    v5 = CFSTR("To use your device’s passcode for locked notes, this device must be signed in to an Apple Account with iCloud Keychain enabled.");
  else
    v5 = CFSTR("To use your device’s passcode for locked notes, this device must be signed in to an iCloud account with iCloud Keychain enabled.");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("To use your device’s passcode for locked notes in your “%@” account, this device must be signed in to an Apple Account with iCloud Keychain enabled."), CFSTR("To use your device’s passcode for locked notes in your “%@” account, this device must be signed in to an Apple Account with iCloud Keychain enabled."), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("To use your device’s passcode for locked notes in your “%@” account, this device must be signed in to an iCloud account with iCloud Keychain enabled."), CFSTR("To use your device’s passcode for locked notes in your “%@” account, this device must be signed in to an iCloud account with iCloud Keychain enabled."), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "customAccountNameForAccount:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(ICAuthenticationAlert);
  if ((ICInternalSettingsIsAppleAccountBrandingEnabled() & 1) != 0)
    v11 = CFSTR("Apple Account Required");
  else
    v11 = CFSTR("iCloud Account Required");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v11, v11, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v10, "setTitle:", v12);

  if (objc_msgSend(v9, "length"))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    if (ICInternalSettingsIsAppleAccountBrandingEnabled())
      v14 = v7;
    else
      v14 = v8;
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationAlert setMessage:](v10, "setMessage:", v15);

  }
  else
  {
    -[ICAuthenticationAlert setMessage:](v10, "setMessage:", v6);
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Go to Settings"), CFSTR("Go to Settings"), 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v10, "setActionTitle:", v16);

  -[ICAuthenticationAlert setActionHandler:](v10, "setActionHandler:", &__block_literal_global_204);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v10, "setDismissTitle:", v17);

  return v10;
}

void __68__ICAuthenticationAlert_signIntoCloudAccountActionAlertWithAccount___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

+ (id)enableKeychainActionAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Turn on iCloud Keychain"), CFSTR("Turn on iCloud Keychain"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("You must turn on iCloud Keychain in Settings to use your device passcode for locked notes."), CFSTR("You must turn on iCloud Keychain in Settings to use your device passcode for locked notes."), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v2, "setMessage:", v4);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Go to Settings"), CFSTR("Go to Settings"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v2, "setActionTitle:", v5);

  -[ICAuthenticationAlert setActionHandler:](v2, "setActionHandler:", &__block_literal_global_211_0);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v6);

  return v2;
}

void __50__ICAuthenticationAlert_enableKeychainActionAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

+ (id)keychainItemMissingInfoAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Can’t View Note"), CFSTR("Can’t View Note"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes can’t decrypt this note because the encryption key wasn’t found. This could be due either to it not having synced down from iCloud yet or because iCloud Keychain data was reset, and thus the key was deleted."), CFSTR("Notes can’t decrypt this note because the encryption key wasn’t found. This could be due either to it not having synced down from iCloud yet or because iCloud Keychain data was reset, and thus the key was deleted."), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v2, "setMessage:", v4);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v5);

  return v2;
}

+ (id)cannotUnlockInfoAlert
{
  ICAuthenticationAlert *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Can’t View Note"), CFSTR("Can’t View Note"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v2, "setDismissTitle:", v4);

  return v2;
}

+ (id)updateDivergedDevicePasswordModeActionAlertWithAccount:(id)a3
{
  id v3;
  ICAuthenticationAlert *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v4 = objc_alloc_init(ICAuthenticationAlert);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Update Password?"), CFSTR("Update Password?"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setTitle:](v4, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("This note is using your device passcode. Would you like to update it to use this account’s custom notes password?"), CFSTR("This note is using your device passcode. Would you like to update it to use this account’s custom notes password?"), 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setMessage:](v4, "setMessage:", v6);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Update Password"), CFSTR("Update Password"), 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setActionTitle:](v4, "setActionTitle:", v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__ICAuthenticationAlert_updateDivergedDevicePasswordModeActionAlertWithAccount___block_invoke;
  v11[3] = &unk_1E5C22710;
  v12 = v3;
  v8 = v3;
  -[ICAuthenticationAlert setActionHandler:](v4, "setActionHandler:", v11);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Not Now"), CFSTR("Not Now"), 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert setDismissTitle:](v4, "setDismissTitle:", v9);

  return v4;
}

void __80__ICAuthenticationAlert_updateDivergedDevicePasswordModeActionAlertWithAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  +[ICAuthenticationPrompt promptForChangingMode:account:](ICAuthenticationPrompt, "promptForChangingMode:account:", 1, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAuthentication shared](ICAuthentication, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__ICAuthenticationAlert_updateDivergedDevicePasswordModeActionAlertWithAccount___block_invoke_2;
  v7[3] = &unk_1E5C227B0;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "authenticateWithPrompt:displayWindow:completionHandler:", v4, v6, v7);

}

void __80__ICAuthenticationAlert_updateDivergedDevicePasswordModeActionAlertWithAccount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2 == 2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      +[ICLockedNotesModeMigrator sharedMigrator](ICLockedNotesModeMigrator, "sharedMigrator");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "migrateLockedNotesInAccount:toMode:window:completionHandler:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40), 0);

    }
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationAlert shouldPresent](self, "shouldPresent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, shouldPresent: %@, title: %@, message: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v31;
  void *v32;
  void *v33;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v4) = objc_msgSend(v5, "prefersSheet");
    if ((_DWORD)v4 != -[ICAuthenticationAlert prefersSheet](self, "prefersSheet"))
    {
      LOBYTE(v6) = 0;
LABEL_50:

      return v6;
    }
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthenticationAlert title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToString:", v8))
    {
      LOBYTE(v6) = 0;
LABEL_49:

      goto LABEL_50;
    }
    -[ICAuthenticationAlert message](self, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "message");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v9)
      v12 = 0;
    else
      v12 = v9;
    v13 = v12;
    v33 = (void *)v10;
    if (v11 == (void *)v10)
      v14 = 0;
    else
      v14 = (void *)v10;
    v15 = v14;
    if (v13 | v15)
    {
      v16 = (void *)v15;
      LOBYTE(v6) = 0;
      if (!v13 || !v15)
        goto LABEL_29;
      v17 = objc_msgSend((id)v13, "isEqual:", v15);

      if (!v17)
      {
        LOBYTE(v6) = 0;
        v24 = v33;
LABEL_48:

        goto LABEL_49;
      }
    }
    v32 = v9;
    -[ICAuthenticationAlert actionTitle](self, "actionTitle");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == (void *)v13)
      v18 = 0;
    else
      v18 = (void *)v13;
    v19 = v18;
    if (v11 == v16)
      v20 = 0;
    else
      v20 = v16;
    v21 = v20;
    if (v19 | v21)
    {
      v22 = (void *)v21;
      LOBYTE(v6) = 0;
      if (!v19 || !v21)
      {
        v24 = v33;
LABEL_46:

        v9 = v32;
        goto LABEL_47;
      }
      LODWORD(v6) = objc_msgSend((id)v19, "isEqual:", v21);

      if (!(_DWORD)v6)
      {
LABEL_28:
        v9 = v32;
LABEL_29:
        v24 = v33;
LABEL_47:

        goto LABEL_48;
      }
    }
    v23 = objc_msgSend(v5, "actionIsDestructive");
    if (v23 != -[ICAuthenticationAlert actionIsDestructive](self, "actionIsDestructive"))
    {
      LOBYTE(v6) = 0;
      goto LABEL_28;
    }
    -[ICAuthenticationAlert dismissTitle](self, "dismissTitle");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == (void *)v19)
      v25 = 0;
    else
      v25 = (void *)v19;
    v6 = v25;
    if (v11 == v22)
      v26 = 0;
    else
      v26 = v22;
    v27 = v26;
    v28 = (void *)v27;
    v31 = (void *)v6;
    if (v6 | v27)
    {
      v29 = v6;
      LOBYTE(v6) = 0;
      if (v29)
      {
        v24 = v33;
        if (v27)
          LOBYTE(v6) = objc_msgSend(v31, "isEqual:", v27);
        goto LABEL_45;
      }
    }
    else
    {
      LOBYTE(v6) = 1;
    }
    v24 = v33;
LABEL_45:

    goto LABEL_46;
  }
  LOBYTE(v6) = 1;
  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationAlert prefersSheet](self, "prefersSheet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "hash");
  -[ICAuthenticationAlert title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[ICAuthenticationAlert message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hash");
  -[ICAuthenticationAlert actionTitle](self, "actionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAuthenticationAlert actionIsDestructive](self, "actionIsDestructive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hash");
  -[ICAuthenticationAlert dismissTitle](self, "dismissTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hash");
  v17 = ICHashWithHashKeys(v19, v10, v11, v12, v13, v14, v15, v16, v5);

  return v17;
}

+ (id)customAccountNameForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D639C8];
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allActiveAccountsInContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_trimmedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)shouldPresent
{
  void *v3;
  uint64_t (**v4)(void);
  char v5;

  -[ICAuthenticationAlert shouldPresentHandler](self, "shouldPresentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICAuthenticationAlert shouldPresentHandler](self, "shouldPresentHandler");
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v5 = v4[2]();

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)presentInWindow:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  ICAuthenticationAlert *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  ICAuthenticationAlert *v39;
  id v40;
  id v41;

  v6 = a3;
  v7 = a4;
  if (-[ICAuthenticationAlert prefersSheet](self, "prefersSheet"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom") != 0;

  }
  else
  {
    v9 = 1;
  }
  -[ICAuthenticationAlert title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthenticationAlert message](self, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAlertController alertControllerWithTitle:message:preferredStyle:](ICAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDismissWithoutActionBlock:", v7);
  -[ICAuthenticationAlert actionTitle](self, "actionTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0x1E0DC3000;
  v15 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    if (-[ICAuthenticationAlert actionIsDestructive](self, "actionIsDestructive"))
      v16 = 2;
    else
      v16 = 0;
    v17 = (void *)MEMORY[0x1E0DC3448];
    -[ICAuthenticationAlert actionTitle](self, "actionTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v15;
    v37[1] = 3221225472;
    v37[2] = __59__ICAuthenticationAlert_presentInWindow_completionHandler___block_invoke;
    v37[3] = &unk_1E5C22878;
    v19 = v12;
    v38 = v19;
    v39 = self;
    v40 = v6;
    v41 = v7;
    v20 = v17;
    v14 = 0x1E0DC3000uLL;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v18, v16, v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addAction:", v21);
  }
  -[ICAuthenticationAlert dismissTitle](self, "dismissTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = *(void **)(v14 + 1096);
    -[ICAuthenticationAlert dismissTitle](self, "dismissTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v15;
    v30 = 3221225472;
    v31 = __59__ICAuthenticationAlert_presentInWindow_completionHandler___block_invoke_2;
    v32 = &unk_1E5C22878;
    v25 = v12;
    v33 = v25;
    v34 = self;
    v35 = v6;
    v36 = v7;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, &v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "addAction:", v26, v29, v30, v31, v32);
  }
  objc_msgSend(v6, "rootViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "ic_topViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "presentViewController:animated:completion:", v12, 1, 0);

}

uint64_t __59__ICAuthenticationAlert_presentInWindow_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setDidPerformAction:", 1);
  objc_msgSend(*(id *)(a1 + 40), "actionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "actionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 48));

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __59__ICAuthenticationAlert_presentInWindow_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setDidPerformAction:", 1);
  objc_msgSend(*(id *)(a1 + 40), "dismissHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "dismissHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 48));

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)presentAlertsIfNeeded:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldPresent");

  if (v12)
  {
    v15 = v8;
    v16 = v9;
    v17 = v10;
    dispatchMainAfterDelay();

  }
  else
  {
    objc_msgSend(v8, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "ic_subarrayFromIndex:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "presentAlertsIfNeeded:window:completionHandler:", v14, v9, v10);

    }
    else if (v10)
    {
      v10[2](v10);
    }
  }

}

void __72__ICAuthenticationAlert_presentAlertsIfNeeded_window_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__ICAuthenticationAlert_presentAlertsIfNeeded_window_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5C228A0;
  v8 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "presentInWindow:completionHandler:", v3, v4);

}

void __72__ICAuthenticationAlert_presentAlertsIfNeeded_window_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "ic_subarrayFromIndex:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentAlertsIfNeeded:window:completionHandler:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

+ (void)resetPresentationsForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D639C8];
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allActiveAccountsInContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0D63A98], "sharedController", (_QWORD)v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "clearCachedDevicesForAccount:", v14);

        objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBiometricsEnabled:forAccount:", 0, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBool:forKey:", 0, CFSTR("ICNoteAddPasswordFirstTimeMessageCompletedKey"));

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enableBiometricsActionAlertShownKeyWithAccount:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBool:forKey:", 0, v19);

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "switchToDevicePasswordPromptPresentedCountKeyForAccount:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInteger:forKey:", 0, v21);

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rememberCustomPasswordInfoAlertPresentedKeyForAccount:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBool:forKey:", 0, v23);

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", 0, CFSTR("ICAuthenticationSetDevicePasswordInfoPresentedAt"));

}

- (BOOL)prefersSheet
{
  return self->_prefersSheet;
}

- (void)setPrefersSheet:(BOOL)a3
{
  self->_prefersSheet = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)actionIsDestructive
{
  return self->_actionIsDestructive;
}

- (void)setActionIsDestructive:(BOOL)a3
{
  self->_actionIsDestructive = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)dismissTitle
{
  return self->_dismissTitle;
}

- (void)setDismissTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)shouldPresentHandler
{
  return self->_shouldPresentHandler;
}

- (void)setShouldPresentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldPresentHandler, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_dismissTitle, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
