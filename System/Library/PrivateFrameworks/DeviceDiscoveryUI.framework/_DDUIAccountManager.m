@implementation _DDUIAccountManager

- (_DDUIAccountManager)init
{
  _DDUIAccountManager *v2;
  uint64_t v3;
  NSMutableDictionary *iCloudToAltDSIDDictionary;
  uint64_t v5;
  NSMutableDictionary *iCloudToNameComponentsDictionary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DDUIAccountManager;
  v2 = -[_DDUIAccountManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    iCloudToAltDSIDDictionary = v2->_iCloudToAltDSIDDictionary;
    v2->_iCloudToAltDSIDDictionary = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    iCloudToNameComponentsDictionary = v2->_iCloudToNameComponentsDictionary;
    v2->_iCloudToNameComponentsDictionary = (NSMutableDictionary *)v5;

    v2->_enabled = 1;
  }
  return v2;
}

- (void)altDsidForiCloudAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t);
  const char *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, void *, uint64_t);
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  v8 = (const char *)*MEMORY[0x24BE2BF68];
  v9 = os_log_create((const char *)*MEMORY[0x24BE2BF68], "core");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_23A3B5000, v9, OS_LOG_TYPE_DEFAULT, "Fetching altDSID for account %@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "length"))
  {
    -[_DDUIAccountManager iCloudToAltDSIDDictionary](self, "iCloudToAltDSIDDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = os_log_create(v8, "core");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_23A3B5000, v12, OS_LOG_TYPE_DEFAULT, "Found cached altDSID %@", buf, 0xCu);
      }

      v7[2](v7, v11, 1);
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __58___DDUIAccountManager_altDsidForiCloudAccount_completion___block_invoke;
      v13[3] = &unk_250B56B50;
      v13[4] = self;
      v14 = v6;
      v15 = v7;
      -[_DDUIAccountManager _updateMemberDataForiCloudAccount:completion:](self, "_updateMemberDataForiCloudAccount:completion:", v14, v13);

    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

- (void)nameComponentsForiCloudAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t);
  const char *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, void *, uint64_t);
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  v8 = (const char *)*MEMORY[0x24BE2BF68];
  v9 = os_log_create((const char *)*MEMORY[0x24BE2BF68], "core");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_23A3B5000, v9, OS_LOG_TYPE_DEFAULT, "Fetching name components for account %@", buf, 0xCu);
  }

  if (v6)
  {
    -[_DDUIAccountManager iCloudToNameComponentsDictionary](self, "iCloudToNameComponentsDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = os_log_create(v8, "core");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_23A3B5000, v12, OS_LOG_TYPE_DEFAULT, "Found cached components %@", buf, 0xCu);
      }

      v7[2](v7, v11, 1);
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __65___DDUIAccountManager_nameComponentsForiCloudAccount_completion___block_invoke;
      v13[3] = &unk_250B56B50;
      v13[4] = self;
      v14 = v6;
      v15 = v7;
      -[_DDUIAccountManager _updateMemberDataForiCloudAccount:completion:](self, "_updateMemberDataForiCloudAccount:completion:", v14, v13);

    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

- (void)_updateMemberDataForiCloudAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _BYTE buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (const char *)*MEMORY[0x24BE2BF68];
  v9 = os_log_create((const char *)*MEMORY[0x24BE2BF68], "core");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_23A3B5000, v9, OS_LOG_TYPE_DEFAULT, "Fetching account details for %@", buf, 0xCu);
  }

  if (-[_DDUIAccountManager enabled](self, "enabled"))
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68___DDUIAccountManager__updateMemberDataForiCloudAccount_completion___block_invoke;
    v11[3] = &unk_250B56B78;
    objc_copyWeak(&v14, (id *)buf);
    v12 = v6;
    v13 = v7;
    -[_DDUIAccountManager _findMemberForiCloudAccount:completionHandler:](self, "_findMemberForiCloudAccount:completionHandler:", v12, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v10 = os_log_create(v8, "core");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23A3B5000, v10, OS_LOG_TYPE_DEFAULT, "_NWUIAccountManager is disabled, early returning...", buf, 2u);
    }

  }
}

- (void)_findMemberForiCloudAccount:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE30A88]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69___DDUIAccountManager__findMemberForiCloudAccount_completionHandler___block_invoke;
  v11[3] = &unk_250B56BA0;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "startRequestWithCompletionHandler:", v11);

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMutableDictionary)iCloudToAltDSIDDictionary
{
  return self->_iCloudToAltDSIDDictionary;
}

- (void)setICloudToAltDSIDDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudToAltDSIDDictionary, a3);
}

- (NSMutableDictionary)iCloudToNameComponentsDictionary
{
  return self->_iCloudToNameComponentsDictionary;
}

- (void)setICloudToNameComponentsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudToNameComponentsDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudToNameComponentsDictionary, 0);
  objc_storeStrong((id *)&self->_iCloudToAltDSIDDictionary, 0);
}

@end
