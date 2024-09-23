@implementation DSRemoteUILoader

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSRemoteUILoader");
    v3 = (void *)DSLog_0;
    DSLog_0 = (uint64_t)v2;

  }
}

- (DSRemoteUILoader)initWithPresenter:(id)a3 delegate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  DSRemoteUILoader *v11;

  v6 = (void *)MEMORY[0x24BDB4398];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE060C8]), "initWithAccountStore:", v9);
  objc_msgSend(v10, "setDelegate:", self);
  v11 = -[DSRemoteUILoader initWithAccountManager:presenter:delegate:](self, "initWithAccountManager:presenter:delegate:", v10, v8, v7);

  return v11;
}

- (DSRemoteUILoader)initWithPresenter:(id)a3 delegate:(id)a4 URL:(id)a5
{
  id v8;
  DSRemoteUILoader *v9;
  DSRemoteUILoader *v10;
  uint64_t v11;
  NSURL *dynamicURL;

  v8 = a5;
  v9 = -[DSRemoteUILoader initWithPresenter:delegate:](self, "initWithPresenter:delegate:", a3, a4);
  v10 = v9;
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    dynamicURL = v10->_dynamicURL;
    v10->_dynamicURL = (NSURL *)v11;

  }
  return v10;
}

- (DSRemoteUILoader)initWithAccountManager:(id)a3 presenter:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  DSRemoteUILoader *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  ACAccount *currentAccount;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  AAUIGrandSlamRemoteUIPresenter *privacyRepairPresenter;
  uint8_t v26[16];
  objc_super v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)DSRemoteUILoader;
  v12 = -[DSRemoteUILoader init](&v27, sel_init);
  if (v12)
  {
    v13 = DSLog_0;
    if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_2278DF000, v13, OS_LOG_TYPE_INFO, "Initializing DSRemoteUILoader", v26, 2u);
    }
    objc_storeStrong((id *)&v12->_accountManager, a3);
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_msgSend(v9, "accountStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "aa_primaryAppleAccount");
    v15 = objc_claimAutoreleasedReturnValue();
    currentAccount = v12->_currentAccount;
    v12->_currentAccount = (ACAccount *)v15;

    v17 = objc_alloc(MEMORY[0x24BE04CC8]);
    -[ACAccount aa_altDSID](v12->_currentAccount, "aa_altDSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithAltDSID:", v18);

    v28[0] = v19;
    v20 = (void *)objc_opt_new();
    v28[1] = v20;
    v21 = (void *)objc_opt_new();
    v28[2] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE04D18]), "initWithAccountManager:presenter:hooks:", v12->_accountManager, v10, v22);
    privacyRepairPresenter = v12->_privacyRepairPresenter;
    v12->_privacyRepairPresenter = (AAUIGrandSlamRemoteUIPresenter *)v23;

    -[AAUIGrandSlamRemoteUIPresenter setDelegate:](v12->_privacyRepairPresenter, "setDelegate:", v12);
  }

  return v12;
}

- (void)loadRemoteUI
{
  NSURL *dynamicURL;
  NSURL *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  dynamicURL = self->_dynamicURL;
  if (dynamicURL)
  {
    v4 = dynamicURL;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0ADF0], "bagForAltDSID:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "privacyRepairURL");
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_alloc_init(MEMORY[0x24BDD16B0]);
  objc_msgSend(v6, "setURL:", v4);
  objc_msgSend(v6, "setHTTPMethod:", CFSTR("GET"));
  v7 = DSLog_0;
  if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2278DF000, v7, OS_LOG_TYPE_INFO, "Loading Remote UI request, %@", (uint8_t *)&v8, 0xCu);
  }
  -[AAUIGrandSlamRemoteUIPresenter loadRequest:](self->_privacyRepairPresenter, "loadRequest:", v6);

}

- (void)remoteUIWillLoadRequest:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  -[DSRemoteUILoader delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isNetworkReachable") & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__DSRemoteUILoader_remoteUIWillLoadRequest___block_invoke;
    block[3] = &unk_24EFF33A0;
    v7 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("digitalseparation"), CFSTR("X-Apple-I-App-Provided-Context"));

}

uint64_t __44__DSRemoteUILoader_remoteUIWillLoadRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayNetworkError");
}

- (void)remoteUIDidReceiveHTTPResponse:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = DSLog_0;
  if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_ERROR))
    -[DSRemoteUILoader remoteUIDidReceiveHTTPResponse:].cold.1((uint64_t)v4, v5);
  if (objc_msgSend(v4, "statusCode") != 401 && objc_msgSend(v4, "statusCode") != 302)
  {
    v6 = objc_msgSend(v4, "statusCode");
    if (v4)
    {
      if (v6 != 200)
      {
        v7 = (void *)MEMORY[0x24BEBD3B0];
        DSUILocStringForKey(CFSTR("REMOTEUI_ERROR_TITLE"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        DSUILocStringForKey(CFSTR("REMOTEUI_ERROR_DETAIL"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = (void *)MEMORY[0x24BEBD3A8];
        DSUILocStringForKey(CFSTR("REMOTEUI_ERROR_CONFIRMATION"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, &__block_literal_global_3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v13);

        -[DSRemoteUILoader delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v14, "presentViewController:animated:completion:", v10, 1, 0);

      }
    }
  }

}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = DSLog_0;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_ERROR))
      -[DSRemoteUILoader remoteUIRequestComplete:error:].cold.1((uint64_t)v5, (uint64_t)v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_2278DF000, v7, OS_LOG_TYPE_INFO, "Loading Remote UI request, %@,  success", (uint8_t *)&v8, 0xCu);
  }

}

- (void)remoteUIDidEndFlow:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)DSLog_0;
  if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_2278DF000, v6, OS_LOG_TYPE_INFO, "%@, Ending the Remote UI flow and moving on", (uint8_t *)&v9, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pushNextPane");

}

- (id)accountsForAccountManager:(id)a3
{
  ACAccount *currentAccount;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  currentAccount = self->_currentAccount;
  v5 = *MEMORY[0x24BE06080];
  v6[0] = currentAccount;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)remoteUIWillPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a3, "allPages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v9, "rightNavigationBarButtonItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            v11 = objc_alloc(MEMORY[0x24BE7EDB0]);
            v26[0] = CFSTR("label");
            DSUILocStringForKey(CFSTR("QUICK_EXIT"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = v12;
            v27[1] = CFSTR("navigationBar");
            v26[1] = CFSTR("parentBar");
            v26[2] = CFSTR("position");
            v26[3] = CFSTR("type");
            v27[2] = CFSTR("right");
            v27[3] = CFSTR("linkBarItem");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "pageElement");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v11, "initWithAttributes:parent:", v13, v14);
            objc_msgSend(v9, "setRightNavigationBarButtonItem:", v15);

            objc_msgSend(v9, "rightNavigationBarButtonItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "barButtonItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAction:", sel_quickExit);

            -[DSRemoteUILoader delegate](self, "delegate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "rightNavigationBarButtonItem");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "barButtonItem");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setTarget:", v18);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v6);
    }

  }
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dynamicURL, 0);
  objc_storeStrong((id *)&self->_privacyRepairPresenter, 0);
  objc_storeStrong((id *)&self->_currentAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)remoteUIDidReceiveHTTPResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2278DF000, a2, OS_LOG_TYPE_ERROR, "Loading Remote UI request with response: %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteUIRequestComplete:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2278DF000, log, OS_LOG_TYPE_ERROR, "Loading Remote UI request, %@, with error, %@", (uint8_t *)&v3, 0x16u);
}

@end
