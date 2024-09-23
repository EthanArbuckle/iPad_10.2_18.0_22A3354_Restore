@implementation FACreateChildAccountHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("family:createChildAccount"));

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
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("family:createChildAccount"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[FACreateChildAccountHook _handleCreateChildAccountWithCompletion:](self, "_handleCreateChildAccountWithCompletion:", a6, a4, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  -[FACreateChildAccountHook _handleCreateChildAccountWithCompletion:](self, "_handleCreateChildAccountWithCompletion:", a4);
}

- (void)_handleCreateChildAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  FACreateChildController *v8;
  id WeakRetained;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "handling child account creation (via rui hook)", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[FACreateChildController initWithAppleAccount:]([FACreateChildController alloc], "initWithAppleAccount:", v7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "presentationContextForHook:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FACreateChildController setPresentingViewController:](v8, "setPresentingViewController:", v10);

    -[RUIObjectModel startActivityIndicator](self->_objectModel, "startActivityIndicator");
    -[FACreateChildController setDelegate:](v8, "setDelegate:", self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__FACreateChildAccountHook__handleCreateChildAccountWithCompletion___block_invoke;
    v11[3] = &unk_24C88BF40;
    v12 = v4;
    -[FACreateChildController createChildAccountWithCompletion:](v8, "createChildAccountWithCompletion:", v11);

LABEL_7:
    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fa_familyErrorWithCode:", -1004);
    v8 = (FACreateChildController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, FACreateChildController *))v4 + 2))(v4, 0, v8);
    goto LABEL_7;
  }
LABEL_8:

}

void __68__FACreateChildAccountHook__handleCreateChildAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "child account creation(via rui hook) completed with success: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)createChildControllerDidPresentInitialViewController:(id)a3
{
  id v3;

  -[FACreateChildAccountHook objectModel](self, "objectModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopActivityIndicator");

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_objectModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
