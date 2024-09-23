@implementation AAQuotaDepletionAlert

- (AAQuotaDepletionAlert)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAQuotaDepletionAlert;
  return -[AAQuotaDepletionAlert init](&v3, sel_init);
}

- (id)initForDataclass:(id)a3
{
  id v5;
  AAQuotaDepletionAlert *v6;
  AAQuotaDepletionAlert *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAQuotaDepletionAlert;
  v6 = -[AAQuotaDepletionAlert init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataclass, a3);

  return v7;
}

+ (BOOL)_isDisabledDataclass:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C8F3D0];
  v9[0] = *MEMORY[0x1E0C8F430];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = objc_msgSend(v5, "containsObject:", v3);
  else
    v7 = 0;

  return v7;
}

- (id)_primaryAccount
{
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  ACAccountStore *v5;
  ACAccount *v6;
  ACAccount *primaryAccount;

  if (!self->_primaryAccount)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v3 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    accountStore = self->_accountStore;
    self->_accountStore = v3;

    v5 = self->_accountStore;
    if (v5)
    {
      -[ACAccountStore aa_primaryAppleAccount](v5, "aa_primaryAppleAccount");
      v6 = (ACAccount *)objc_claimAutoreleasedReturnValue();
      primaryAccount = self->_primaryAccount;
      self->_primaryAccount = v6;

    }
  }
  return self->_primaryAccount;
}

- (void)showWithHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  NSString *dataclass;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _BOOL4 v16;
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
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t);
  void *v29;
  void (**v30)(id, uint64_t);
  char v31;
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  if (+[AAQuotaDepletionAlert _isDisabledDataclass:](AAQuotaDepletionAlert, "_isDisabledDataclass:", self->_dataclass))
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dataclass = self->_dataclass;
      *(_DWORD *)buf = 138412290;
      v33 = dataclass;
      _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Quota ran out for dataclass: %@. Skipping notifying user.", buf, 0xCu);
    }

    if (v4)
      v4[2](v4, 3);
  }
  else
  {
    -[AAQuotaDepletionAlert _primaryAccount](self, "_primaryAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[AAQuotaDepletionAlert _primaryAccount](self, "_primaryAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "aa_isManagedAppleID") ^ 1;

    }
    else
    {
      v9 = 0;
    }

    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_dataclass;
      *(_DWORD *)buf = 138412546;
      v33 = v11;
      v34 = 1024;
      v35 = v9;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Quota ran out for dataclass: %@. Notify user. Upgrade Available: %d", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
      v14 = CFSTR("QUOTA_ALERT_UPGRADE_BUTTON");
    else
      v14 = CFSTR("QUOTA_ALERT_MANAGE_BUTTON");
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E41752F8, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x1E0C8F360]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("QUOTA_ALERT_BACKUP_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAQuotaDepletionAlert _deviceSpecificLocalizedString:](self, "_deviceSpecificLocalizedString:", CFSTR("QUOTA_ALERT_BACKUP_MESSAGE"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_1E41752F8, CFSTR("Localizable"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("QUOTA_ALERT_TITLE"), &stru_1E41752F8, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("QUOTA_ALERT_MESSAGE"), &stru_1E41752F8, CFSTR("Localizable"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __41__AAQuotaDepletionAlert_showWithHandler___block_invoke;
    v29 = &unk_1E4170BA8;
    v31 = v9;
    v30 = v4;
    v23 = (void *)MEMORY[0x1A1AED7A0](&v26);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class(), v26, v27, v28, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("ALERT_CLOSE"), &stru_1E41752F8, CFSTR("Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[AAUserNotification showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:](AAUserNotification, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:", v19, v22, v25, v15, v23);

  }
}

uint64_t __41__AAQuotaDepletionAlert_showWithHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t result;
  _QWORD block[4];
  id v11;

  if (!a3)
  {
    if (*(_BYTE *)(a1 + 40))
      v5 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/CHANGE_STORAGE_PLAN");
    else
      v5 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP");
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__AAQuotaDepletionAlert_showWithHandler___block_invoke_2;
    block[3] = &unk_1E416E3A8;
    v11 = v6;
    v8 = v6;
    dispatch_async(v7, block);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

void __41__AAQuotaDepletionAlert_showWithHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)showIfNecessaryWithHandler:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  NSString *dataclass;
  NSString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  int v16;
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = +[AAQuotaDepletionAlert _isDisabledDataclass:](AAQuotaDepletionAlert, "_isDisabledDataclass:", self->_dataclass);
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      dataclass = self->_dataclass;
      v16 = 138412290;
      v17 = dataclass;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Quota ran out for dataclass: %@. Skipping notifying user.", (uint8_t *)&v16, 0xCu);
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  if (v7)
  {
    v9 = self->_dataclass;
    v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Quota ran out for dataclass: %@. Notify user.", (uint8_t *)&v16, 0xCu);
  }

  v6 = CFPreferencesCopyAppValue(CFSTR("AANextCastleQuotaAlert"), CFSTR("com.apple.appleaccount"));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "compare:", v6);

    if (v11 != 1)
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", 86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(CFSTR("AANextCastleQuotaAlert"), v13, CFSTR("com.apple.appleaccount"));
  CFPreferencesSynchronize(CFSTR("com.apple.appleaccount"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  -[AAQuotaDepletionAlert showWithHandler:](self, "showWithHandler:", v4);

  v14 = 1;
LABEL_10:

  return v14;
}

- (id)_deviceSpecificLocalizedString:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = MGCopyAnswer();
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("iPhone");
  -[__CFString uppercaseString](v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_1E41752F8, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_dataclass, 0);
}

@end
