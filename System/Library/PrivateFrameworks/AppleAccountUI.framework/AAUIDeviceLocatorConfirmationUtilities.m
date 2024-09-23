@implementation AAUIDeviceLocatorConfirmationUtilities

+ (void)showEnableAlertWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD v9[5];

  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getActivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("02168E84-5DD8-4B19-9204-A79F04B33A32"));
  v8 = objc_msgSend(v6, "supportsCapability:", v7);

  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__AAUIDeviceLocatorConfirmationUtilities_showEnableAlertWithCompletion___block_invoke;
    v9[3] = &__block_descriptor_40_e11_v16__0B8B12l;
    v9[4] = a1;
    +[AAUIDeviceLocatorConfirmationUtilities checkIfWatchHasAppleIDAccount:](AAUIDeviceLocatorConfirmationUtilities, "checkIfWatchHasAppleIDAccount:", v9);
  }
  if (v4)
    v4[2](v4, 0);

}

void __72__AAUIDeviceLocatorConfirmationUtilities_showEnableAlertWithCompletion___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD v3[5];
  char v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__AAUIDeviceLocatorConfirmationUtilities_showEnableAlertWithCompletion___block_invoke_2;
  v3[3] = &__block_descriptor_42_e5_v8__0l;
  v4 = a2;
  v5 = a3;
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __72__AAUIDeviceLocatorConfirmationUtilities_showEnableAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41))
  {
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "userNotifiedOfActivationLockForAllPairedDevices");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DEVICE_LOCATOR_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("ENABLE_DEVICE_LOCATOR_MESSAGE_WATCH"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || (_os_feature_enabled_impl() & 1) == 0)
    {
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ENABLE_DEVICE_LOCATOR_MESSAGE_WATCH"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(CFSTR("ENABLE_DEVICE_LOCATOR_MESSAGE_WATCH"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1EA2E2A18, CFSTR("Localizable"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v6 = (void *)MEMORY[0x1E0CFAD70];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:", v9, v5, 0, v8, 0);

  }
}

+ (void)checkIfWatchHasAppleIDAccount:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke;
  block[3] = &unk_1EA2DB0E8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  uint64_t v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v2 = dispatch_semaphore_create(0);
  v3 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__0;
  v20[4] = __Block_byref_object_dispose__0;
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v4 = (void *)getNSSManagerClass_softClass;
  v26 = getNSSManagerClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getNSSManagerClass_softClass)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __getNSSManagerClass_block_invoke;
    v22[3] = &unk_1EA2DB6E8;
    v22[4] = &v23;
    __getNSSManagerClass_block_invoke((uint64_t)v22);
    v4 = (void *)v24[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v23, 8);
  v7 = (void *)objc_opt_new();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_85;
  v12[3] = &unk_1EA2DB5D0;
  v14 = v20;
  v15 = &v16;
  v8 = v2;
  v13 = v8;
  objc_msgSend(v7, "getiCloudInfo:", v12);
  v9 = dispatch_time(0, 4000000000);
  v10 = dispatch_semaphore_wait(v8, v9);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, _QWORD, BOOL))(v11 + 16))(v11, *((unsigned __int8 *)v17 + 24), v10 > 0);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

void __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  __int128 buf;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v20 = a3;
  if (v20)
  {
    _AAUILogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Error getting Watch Account: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_27;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x2020000000;
  v5 = (_QWORD *)getkNSSiCloudAccountsKeySymbolLoc_ptr;
  v30 = getkNSSiCloudAccountsKeySymbolLoc_ptr;
  if (!getkNSSiCloudAccountsKeySymbolLoc_ptr)
  {
    v6 = (void *)NanoSystemSettingsLibrary();
    v5 = dlsym(v6, "kNSSiCloudAccountsKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v5;
    getkNSSiCloudAccountsKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&buf, 8);
  if (!v5)
  {
    __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_85_cold_1();
    goto LABEL_31;
  }
  objc_msgSend(v21, "objectForKeyedSubscript:", *v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "aa_personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v7;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v9)
    goto LABEL_26;
  v10 = *(_QWORD *)v24;
LABEL_9:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v10)
      objc_enumerationMutation(v4);
    v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x2020000000;
    v13 = (_QWORD *)getkNSSiCloudPersonIDKeySymbolLoc_ptr;
    v30 = getkNSSiCloudPersonIDKeySymbolLoc_ptr;
    if (!getkNSSiCloudPersonIDKeySymbolLoc_ptr)
    {
      v14 = (void *)NanoSystemSettingsLibrary();
      v13 = dlsym(v14, "kNSSiCloudPersonIDKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v13;
      getkNSSiCloudPersonIDKeySymbolLoc_ptr = (uint64_t)v13;
    }
    _Block_object_dispose(&buf, 8);
    if (!v13)
      goto LABEL_30;
    objc_msgSend(v12, "objectForKeyedSubscript:", *v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", v8))
      break;

    if (v9 == ++v11)
    {
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v9)
        goto LABEL_26;
      goto LABEL_9;
    }
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x2020000000;
  v16 = (_QWORD *)getkNSSiCloudIsAuthenticatedKeySymbolLoc_ptr;
  v30 = getkNSSiCloudIsAuthenticatedKeySymbolLoc_ptr;
  if (!getkNSSiCloudIsAuthenticatedKeySymbolLoc_ptr)
  {
    v17 = (void *)NanoSystemSettingsLibrary();
    v16 = dlsym(v17, "kNSSiCloudIsAuthenticatedKey");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v16;
    getkNSSiCloudIsAuthenticatedKeySymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&buf, 8);
  if (!v16)
  {
LABEL_30:
    __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_85_cold_1();
LABEL_31:
    __break(1u);
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", *v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18 || objc_msgSend(v18, "BOOLValue"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

LABEL_26:
LABEL_27:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)showDisableAlertForAccount:(id)a3 withCompletion:(id)a4
{
  objc_msgSend(a1, "showDisableAlertForAccount:presentingViewController:withCompletion:", a3, 0, a4);
}

+ (void)showDisableAlertForAccount:(id)a3 presentingViewController:(id)a4 withCompletion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = (void *)MEMORY[0x1E0CB34D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3708];
  v14 = CFSTR("DISABLE_DEVICE_LOCATOR_MESSAGE");
  if ((objc_msgSend(CFSTR("DISABLE_DEVICE_LOCATOR_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("DISABLE_DEVICE_LOCATOR_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = 1;
  }
  objc_msgSend(v13, "modelSpecificLocalizedStringKeyForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v16, &stru_1EA2E2A18, CFSTR("Localizable"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DISABLE_DEVICE_LOCATOR_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "showDisableAlertForAccount:withMessage:confirmationButtonTitle:presentingViewController:completion:", v11, v19, v18, v10, v9);
}

+ (void)showDisableAlertForAccount:(id)a3 presentingViewController:(id)a4 telemetryFlowID:(id)a5 withCompletion:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v10 = a6;
  v11 = (void *)MEMORY[0x1E0CB34D0];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3708];
  v17 = CFSTR("DISABLE_DEVICE_LOCATOR_MESSAGE");
  if ((objc_msgSend(CFSTR("DISABLE_DEVICE_LOCATOR_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("DISABLE_DEVICE_LOCATOR_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = 1;
  }
  objc_msgSend(v16, "modelSpecificLocalizedStringKeyForKey:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v19, &stru_1EA2E2A18, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DISABLE_DEVICE_LOCATOR_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setAccount:", v14);

  objc_msgSend(v23, "setMessage:", v20);
  objc_msgSend(v23, "setButtonTitle:", v22);
  objc_msgSend(v23, "setPresentingViewController:", v13);

  objc_msgSend(v23, "setTelemetryFlowID:", v12);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __125__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForAccount_presentingViewController_telemetryFlowID_withCompletion___block_invoke;
  v25[3] = &unk_1EA2DB5F8;
  v26 = v10;
  v24 = v10;
  objc_msgSend(a1, "showDisableAlertForContext:withCompletion:", v23, v25);

}

void __125__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForAccount_presentingViewController_telemetryFlowID_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "fmipWipeToken");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

+ (void)showDisableAlertForAccount:(id)a3 withMessage:(id)a4 confirmationButtonTitle:(id)a5 completion:(id)a6
{
  objc_msgSend(a1, "showDisableAlertForAccount:withMessage:confirmationButtonTitle:presentingViewController:completion:", a3, a4, a5, 0, a6);
}

+ (void)showDisableAlertForAccount:(id)a3 withMessage:(id)a4 confirmationButtonTitle:(id)a5 presentingViewController:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setAccount:", v16);

  objc_msgSend(v17, "setMessage:", v15);
  objc_msgSend(v17, "setButtonTitle:", v14);

  objc_msgSend(v17, "setPresentingViewController:", v13);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __141__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForAccount_withMessage_confirmationButtonTitle_presentingViewController_completion___block_invoke;
  v19[3] = &unk_1EA2DB5F8;
  v20 = v12;
  v18 = v12;
  objc_msgSend(a1, "showDisableAlertForContext:withCompletion:", v17, v19);

}

void __141__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForAccount_withMessage_confirmationButtonTitle_presentingViewController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "fmipWipeToken");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

+ (void)showDisableAlertForContext:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t *v35;
  id v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "message");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonTitle");
  v11 = objc_claimAutoreleasedReturnValue();
  v28 = a1;
  if (v8)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D002F8]);
    objc_msgSend(v12, "setPresentingViewController:", v8);
  }
  else
  {
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "AAUIDeviceLocatorConfirmationUtilities: Warning! Caller has not provided a presenting VC.", buf, 2u);
    }

    v12 = objc_alloc_init(MEMORY[0x1E0D00128]);
    objc_msgSend(v12, "_setProxyingForApp:", 1);
  }
  objc_msgSend(v9, "username");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUsername:", v14);

  objc_msgSend(v9, "aa_altDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAltDSID:", v15);

  v27 = (void *)v10;
  objc_msgSend(v12, "setReason:", v10);
  objc_msgSend(v12, "setShouldPromptForPasswordOnly:", 1);
  objc_msgSend(v12, "setAuthenticationType:", 2);
  objc_msgSend(v12, "setIsEphemeral:", 1);
  objc_msgSend(v12, "setIsUsernameEditable:", 0);
  v16 = (void *)v11;
  objc_msgSend(v12, "setDefaultButtonString:", v11);
  objc_msgSend(v12, "setMaximumLoginAttempts:", 2);
  objc_msgSend(v12, "setEnablePasscodeAuth:", 0);
  *(_QWORD *)buf = 0;
  v38 = buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  v42 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v17 = (void *)MEMORY[0x1E0CF0E68];
  objc_msgSend(v9, "aa_altDSID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "telemetryFlowID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "analyticsEventWithName:altDSID:flowID:", *MEMORY[0x1E0CFADC8], v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)*((_QWORD *)v38 + 5);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke;
  v29[3] = &unk_1EA2DB648;
  v35 = buf;
  v22 = v20;
  v30 = v22;
  v23 = v7;
  v34 = v23;
  v36 = v28;
  v24 = v8;
  v31 = v24;
  v25 = v9;
  v32 = v25;
  v26 = v6;
  v33 = v26;
  objc_msgSend(v21, "authenticateWithContext:completion:", v12, v29);

  _Block_object_dispose(buf, 8);
}

void __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = *(void **)(a1 + 32);
  v10 = *MEMORY[0x1E0CF0EE0];
  if (v6)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v10);
    objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v6);
    if (objc_msgSend(v6, "ak_isUserCancelError"))
    {
      objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendEvent:", *(_QWORD *)(a1 + 32));

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_8:
      v12();
      goto LABEL_9;
    }
    v15 = objc_msgSend(v6, "ak_isAuthenticationErrorWithCode:", -7005);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendEvent:", *(_QWORD *)(a1 + 32));

    if (!v15)
    {
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      goto LABEL_8;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke_2;
    block[3] = &unk_1EA2DB620;
    v20 = *(_QWORD *)(a1 + 80);
    v19 = *(id *)(a1 + 64);
    v18 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v10);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "aa_setPassword:", v14);
    objc_msgSend(*(id *)(a1 + 80), "_performFMIPAuthenticationForContext:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
LABEL_9:

}

void __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_FAILED_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("BAD_NETWORK_ALERT_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || (_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BAD_NETWORK_ALERT_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(CFSTR("BAD_NETWORK_ALERT_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke_3;
  v11[3] = &unk_1EA2DB0E8;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v7, "alertWithTitle:message:buttonTitle:actionHandler:", v3, v6, v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v10, 0, 0);
}

uint64_t __84__AAUIDeviceLocatorConfirmationUtilities_showDisableAlertForContext_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_performFMIPAuthenticationForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CFAC50]);
  objc_msgSend(v6, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAccount:", v9);

  objc_msgSend(v6, "customRequestHeaders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomHeaders:", v11);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__AAUIDeviceLocatorConfirmationUtilities__performFMIPAuthenticationForContext_completion___block_invoke;
  v14[3] = &unk_1EA2DB670;
  v16 = v7;
  v17 = a1;
  v15 = v6;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v10, "performRequestWithHandler:", v14);

}

void __90__AAUIDeviceLocatorConfirmationUtilities__performFMIPAuthenticationForContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = (void *)a1[6];
  v9 = v6;
  if (v6)
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_handleFMIPAuthenticationResponse:withError:forContext:completion:", v9, v8, a1[4], a1[5]);

  }
  else
  {
    objc_msgSend(v7, "_handleFMIPAuthenticationResponse:withError:forContext:completion:", 0, a4, a1[4], a1[5]);
  }

}

+ (void)_handleFMIPAuthenticationResponse:(id)a3 withError:(id)a4 forContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10
    || v11
    || (objc_msgSend(v10, "error"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    _AAUILogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "Failed to obtain an FMiP wipe token. Response: %@ and Error: %@", buf, 0x16u);
    }

    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__AAUIDeviceLocatorConfirmationUtilities__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke;
    aBlock[3] = &unk_1EA2DB698;
    v29 = a1;
    v17 = v12;
    v27 = v17;
    v28 = v13;
    v18 = _Block_copy(aBlock);
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __108__AAUIDeviceLocatorConfirmationUtilities__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_2;
    block[3] = &unk_1EA2DB6C0;
    v25 = a1;
    v22 = v11;
    v23 = v17;
    v24 = v18;
    v19 = v18;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    _AAUILogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v20, OS_LOG_TYPE_DEFAULT, "FMIPAuthenticationRequest succeeded!", buf, 2u);
    }

    (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v10);
  }

}

uint64_t __108__AAUIDeviceLocatorConfirmationUtilities__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 48), "showDisableAlertForContext:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __108__AAUIDeviceLocatorConfirmationUtilities__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (void *)MEMORY[0x1E0CFAD70];
  v3 = *(void **)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_titleForError:account:", v4, v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_messageForError:account:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RETRY"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:", v5, v9, v11, v13, *(_QWORD *)(a1 + 48));

}

+ (id)_titleForError:(id)a3 account:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  int v8;
  void *v9;

  v4 = objc_msgSend(a3, "code");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 401)
  {
    v7 = CFSTR("MOBILEME_AUTHENTICATION_FAILED_MESSAGE");
    if ((objc_msgSend(CFSTR("MOBILEME_AUTHENTICATION_FAILED_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("MOBILEME_AUTHENTICATION_FAILED_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1EA2E2A18, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)

  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_FAILED_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_messageForError:(id)a3 account:(id)a4
{
  id v4;
  __CFString *v5;

  v4 = a3;
  if (objc_msgSend(v4, "code") == 401)
  {
    v5 = &stru_1EA2E2A18;
  }
  else
  {
    objc_msgSend(v4, "localizedDescription");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __72__AAUIDeviceLocatorConfirmationUtilities_checkIfWatchHasAppleIDAccount___block_invoke_85_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getNSSManagerClass_block_invoke_cold_1(v0);
}

@end
