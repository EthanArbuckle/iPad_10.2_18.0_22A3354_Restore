@implementation AAUIDeviceToDeviceEncryptionHook

- (AAUIDeviceToDeviceEncryptionHook)initWithAltDSID:(id)a3 upgradeContext:(id)a4
{
  id v7;
  id v8;
  AAUIDeviceToDeviceEncryptionHook *v9;
  AAUIDeviceToDeviceEncryptionHook *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIDeviceToDeviceEncryptionHook;
  v9 = -[AAUIDeviceToDeviceEncryptionHook init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_altDSID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUIDeviceToDeviceEncryptionHook _performHSAUpgradeWithAttributes:completion:](self, "_performHSAUpgradeWithAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIDeviceToDeviceEncryptionHook _performHSAUpgradeWithAttributes:completion:](self, "_performHSAUpgradeWithAttributes:completion:", v7, v6);

}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("cdp:upgrade"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("cdp:upgrade"));
  return v7;
}

- (void)_performHSAUpgradeWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Starting HSA2 upgrade with attributes %@", (uint8_t *)&v19, 0xCu);
  }

  v9 = objc_alloc(MEMORY[0x1E0D157D0]);
  -[AAUIDeviceToDeviceEncryptionHook altDSID](self, "altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithAltDSID:", v10);

  objc_msgSend(v11, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 0);
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureName"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;

  if (v13)
    objc_msgSend(v11, "setFeatureName:", v13);
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("upgradeType"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  objc_msgSend(v11, "setDeviceToDeviceEncryptionUpgradeType:", objc_msgSend(v15, "isEqualToString:", CFSTR("2FA")));
  -[AAUIDeviceToDeviceEncryptionHook delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentationContextForHook:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPresentingViewController:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D157D8]), "initWithContext:", v11);
  objc_msgSend(v18, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v7);

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
