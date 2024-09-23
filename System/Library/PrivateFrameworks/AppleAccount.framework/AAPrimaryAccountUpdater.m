@implementation AAPrimaryAccountUpdater

- (AAPrimaryAccountUpdater)initWithAccount:(id)a3
{
  id v6;
  void *v7;
  uint64_t v8;
  AAPrimaryAccountUpdater *v9;
  AAPrimaryAccountUpdater *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  if ((objc_msgSend(v6, "aa_isAccountClass:", CFSTR("primary")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAPrimaryAccountUpdater.m"), 28, CFSTR("Account must be primary AppleAccount!"));

  }
  objc_msgSend(v6, "_aa_primaryAccountUpdaterVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v13.receiver = self;
  v13.super_class = (Class)AAPrimaryAccountUpdater;
  v9 = -[AAVersionUpdater initWithStartingVersion:](&v13, sel_initWithStartingVersion_, v8);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_appleAccount, a3);

  return v10;
}

- (BOOL)performVersionUpdate0ToVersion1
{
  uint64_t v3;
  NSObject *v4;
  ACAccount *v5;
  NSObject *v6;
  ACAccount *appleAccount;
  ACAccount *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  ACAccount *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C8EE88];
  if (-[ACAccount isProvisionedForDataclass:](self->_appleAccount, "isProvisionedForDataclass:", *MEMORY[0x1E0C8EE88])&& (-[ACAccount isEnabledForDataclass:](self->_appleAccount, "isEnabledForDataclass:", v3) & 1) == 0)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      appleAccount = self->_appleAccount;
      v11 = 136315394;
      v12 = "-[AAPrimaryAccountUpdater performVersionUpdate0ToVersion1]";
      v13 = 2112;
      v14 = appleAccount;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "%s enabling Freeform for account %@", (uint8_t *)&v11, 0x16u);
    }

    -[ACAccount setEnabled:forDataclass:](self->_appleAccount, "setEnabled:forDataclass:", 1, v3);
  }
  else
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_appleAccount;
      v11 = 136315394;
      v12 = "-[AAPrimaryAccountUpdater performVersionUpdate0ToVersion1]";
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "%s Freeform is not provisioned for accounts %@", (uint8_t *)&v11, 0x16u);
    }

  }
  v8 = self->_appleAccount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount _aa_setPrimaryAccountUpdaterVersion:](v8, "_aa_setPrimaryAccountUpdaterVersion:", v9);

  return 1;
}

- (BOOL)performVersionUpdate1ToVersion2
{
  uint64_t v3;
  NSObject *v4;
  ACAccount *appleAccount;
  ACAccount *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  ACAccount *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (+[AADeviceModelHelper isDeviceiPad](AADeviceModelHelper, "isDeviceiPad"))
  {
    v3 = *MEMORY[0x1E0C8EE90];
    if (-[ACAccount isEnabledForDataclass:](self->_appleAccount, "isEnabledForDataclass:", *MEMORY[0x1E0C8EE90]))
    {
      _AALogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        appleAccount = self->_appleAccount;
        v9 = 136315394;
        v10 = "-[AAPrimaryAccountUpdater performVersionUpdate1ToVersion2]";
        v11 = 2112;
        v12 = appleAccount;
        _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "Device is an iPad: %s disabling Health for account %@", (uint8_t *)&v9, 0x16u);
      }

      -[ACAccount setEnabled:forDataclass:](self->_appleAccount, "setEnabled:forDataclass:", 0, v3);
    }
  }
  v6 = self->_appleAccount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount _aa_setPrimaryAccountUpdaterVersion:](v6, "_aa_setPrimaryAccountUpdaterVersion:", v7);

  return 1;
}

+ (id)orderedVersions
{
  return &unk_1E41A6900;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end
