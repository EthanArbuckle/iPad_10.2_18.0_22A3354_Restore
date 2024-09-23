@implementation EMAccountAuthentication

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__EMAccountAuthentication_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

void __30__EMAccountAuthentication_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

- (EMAccountAuthentication)initWithAccountFactory:(id)a3
{
  id v5;
  EMAccountAuthentication *v6;
  EMAccountAuthentication *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMAccountAuthentication;
  v6 = -[EMAccountAuthentication init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountFactory, a3);

  return v7;
}

- (BOOL)updateDeliveryAccountCredentialIfNecessaryForAccountWithSystemAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMAccountAuthentication accountFactory](self, "accountFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithSystemAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[EMAccountAuthentication _updateDeliveryAccountCredentialIfNecessaryForAccountWithAccount:](self, "_updateDeliveryAccountCredentialIfNecessaryForAccountWithAccount:", v6);

  return (char)self;
}

- (BOOL)updateDeliveryAccountCredentialIfNecessaryForAccountWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EMAccountAuthentication accountFactory](self, "accountFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[EMAccountAuthentication _updateDeliveryAccountCredentialIfNecessaryForAccountWithAccount:](self, "_updateDeliveryAccountCredentialIfNecessaryForAccountWithAccount:", v6);

  return (char)self;
}

- (BOOL)_updateDeliveryAccountCredentialIfNecessaryForAccountWithAccount:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "conformsToProtocol:", &unk_1EF25F868))
  {
    v6 = -[EMAccountAuthentication _updateDeliveryAccountCredentialIfNecessaryForReceivingAccount:](self, "_updateDeliveryAccountCredentialIfNecessaryForReceivingAccount:", v5);
  }
  else
  {
    +[EMAccountAuthentication log](EMAccountAuthentication, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "Account is not a receiving account. No delivery account to update: %@", (uint8_t *)&v10, 0xCu);

    }
    v6 = 1;
  }

  return v6;
}

- (BOOL)_updateDeliveryAccountCredentialIfNecessaryForReceivingAccount:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  const char *v11;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "deliveryAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMAccountAuthentication log](EMAccountAuthentication, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "Receiving account password changed: %@", (uint8_t *)&v19, 0xCu);

  }
  +[EMAccountAuthentication log](EMAccountAuthentication, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v5;
    _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "Attempt to update password if needed for delivery account %@", (uint8_t *)&v19, 0xCu);
  }

  if (!v5)
  {
    +[EMAccountAuthentication log](EMAccountAuthentication, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v11 = "No delivery account password found. Nothing to do";
LABEL_13:
      _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, 2u);
    }
LABEL_14:
    v9 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (!-[EMAccountAuthentication _shouldAutoUpdateDeliveryAccount:forChangedReceivingAccount:](self, "_shouldAutoUpdateDeliveryAccount:forChangedReceivingAccount:", v5, v4))
  {
    +[EMAccountAuthentication log](EMAccountAuthentication, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v11 = "Should not try to update delivery account password";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(v5, "canAuthenticateWithCurrentCredentials") & 1) == 0)
  {
    objc_msgSend(v5, "password");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "password");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B0]), "initWithPassword:", v13);
    objc_msgSend(v14, "setCredential:", v15);
    v9 = objc_msgSend(v5, "canAuthenticateWithCurrentCredentials");
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v5, "savePersistentAccount");
      +[EMAccountAuthentication log](EMAccountAuthentication, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v5;
        _os_log_impl(&dword_1B99BB000, v16, OS_LOG_TYPE_DEFAULT, "Updating password worked for delivery account: %@", (uint8_t *)&v19, 0xCu);
      }

    }
    else
    {
      +[EMAccountAuthentication log](EMAccountAuthentication, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v5;
        _os_log_impl(&dword_1B99BB000, v17, OS_LOG_TYPE_DEFAULT, "Updating password for %@ did not work. Reverting password", (uint8_t *)&v19, 0xCu);
      }

      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B0]), "initWithPassword:", v10);
      v15 = (void *)v18;
      objc_msgSend(v14, "setCredential:", v18);
    }

    goto LABEL_15;
  }
  v9 = 1;
LABEL_16:

  return v9;
}

- (BOOL)_shouldAutoUpdateDeliveryAccount:(id)a3 forChangedReceivingAccount:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "hasPasswordCredential")
    && objc_msgSend(v6, "hasPasswordCredential")
    && -[EMAccountAuthentication _hostnamesHaveSameTopLevelDomain:deliveryAccount:](self, "_hostnamesHaveSameTopLevelDomain:deliveryAccount:", v7, v6);

  return v8;
}

- (BOOL)_hostnamesHaveSameTopLevelDomain:(id)a3 deliveryAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  objc_msgSend(a3, "hostname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "count");
    v12 = objc_msgSend(v10, "count");
    v8 = 0;
    if (v11 >= 3)
    {
      v13 = v12;
      if (v12 >= 3)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11 - 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v13 - 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v15))
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v11 - 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", v13 - 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v16, "isEqualToString:", v17);

        }
        else
        {
          v8 = 0;
        }

      }
    }

  }
  return v8;
}

- (EDAccountFactory)accountFactory
{
  return self->_accountFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountFactory, 0);
}

@end
