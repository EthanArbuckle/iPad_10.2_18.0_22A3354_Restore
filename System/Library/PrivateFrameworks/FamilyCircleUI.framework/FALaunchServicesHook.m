@implementation FALaunchServicesHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("remoteAction:launchApp"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("remoteAction:launchApp"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  id v9;

  v8 = a6;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("remoteLaunchUrl"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[FALaunchServicesHook _launchWithURLString:completion:](self, "_launchWithURLString:completion:", v9, v8);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("remoteLaunchUrl"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FALaunchServicesHook _launchWithURLString:completion:](self, "_launchWithURLString:completion:", v7, v6);

}

- (void)_launchWithURLString:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Recieved URL to launch: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openSensitiveURL:withOptions:", v8, 0);

  v6[2](v6, 1, 0);
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
