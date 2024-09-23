@implementation AKAccountStore

- (id)accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKAccountStore;
  -[AKAccountStore accountsWithAccountType:options:error:](&v6, sel_accountsWithAccountType_options_error_, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accountTypeWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  objc_super v12;
  uint8_t buf[16];
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKAccountStore;
  -[AKAccountStore accountTypeWithAccountTypeIdentifier:error:](&v14, sel_accountTypeWithAccountTypeIdentifier_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 && -[AKAccountStore isAccountDaemonConnectionError:](self, "isAccountDaemonConnectionError:", *a4))
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Retrying fetching account type operation...", buf, 2u);
    }

    v12.receiver = self;
    v12.super_class = (Class)AKAccountStore;
    -[AKAccountStore accountTypeWithAccountTypeIdentifier:error:](&v12, sel_accountTypeWithAccountTypeIdentifier_error_, v6, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (id)credentialForAccount:(id)a3 serviceID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  objc_super v15;
  uint8_t buf[16];
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AKAccountStore;
  -[AKAccountStore credentialForAccount:serviceID:error:](&v17, sel_credentialForAccount_serviceID_error_, v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 && -[AKAccountStore isAccountDaemonConnectionError:](self, "isAccountDaemonConnectionError:", *a5))
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Retrying credential fetch with service id...", buf, 2u);
    }

    v15.receiver = self;
    v15.super_class = (Class)AKAccountStore;
    -[AKAccountStore credentialForAccount:serviceID:error:](&v15, sel_credentialForAccount_serviceID_error_, v8, v9, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v10;
  }
  v13 = v12;

  return v13;
}

- (id)credentialForAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  objc_super v12;
  uint8_t buf[16];
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKAccountStore;
  -[AKAccountStore credentialForAccount:error:](&v14, sel_credentialForAccount_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 && -[AKAccountStore isAccountDaemonConnectionError:](self, "isAccountDaemonConnectionError:", *a4))
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Retrying credential fetch operation...", buf, 2u);
    }

    v12.receiver = self;
    v12.super_class = (Class)AKAccountStore;
    -[AKAccountStore credentialForAccount:error:](&v12, sel_credentialForAccount_error_, v6, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (BOOL)saveVerifiedAccount:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAccountStore;
  return -[AKAccountStore saveVerifiedAccount:error:](&v5, sel_saveVerifiedAccount_error_, a3, a4);
}

- (BOOL)isAccountDaemonConnectionError:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "code") == 10002)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F1D8]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
