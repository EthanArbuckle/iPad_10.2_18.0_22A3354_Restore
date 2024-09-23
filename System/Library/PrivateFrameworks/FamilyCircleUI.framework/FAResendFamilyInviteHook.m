@implementation FAResendFamilyInviteHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("family:resendInvite"));

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
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("family:resendInvite"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a6;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "process element attributes %@", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(v8, "attributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAResendFamilyInviteHook loadResendRequestWithAttributes:completion:](self, "loadResendRequestWithAttributes:completion:", v12, v9);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FAResendFamilyInviteHook loadResendRequestWithAttributes:completion:](self, "loadResendRequestWithAttributes:completion:", v7, v6);

}

- (void)loadResendRequestWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  FACircleContext *v10;
  void *v11;
  FACircleStateController *v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("resendInviteUrl"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", CFSTR("FACircleEventTypeInviteViaMessages"));
  if (v7)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
    -[FACircleContext setUrlForContext:](v10, "setUrlForContext:", v11);
    v12 = -[FACircleStateController initWithPresenter:]([FACircleStateController alloc], "initWithPresenter:", v9);
    -[FACircleStateController setPresentationType:](v12, "setPresentationType:", 2);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__FAResendFamilyInviteHook_loadResendRequestWithAttributes_completion___block_invoke;
    v13[3] = &unk_24C88BD68;
    v14 = v6;
    -[FACircleStateController performWithContext:completion:](v12, "performWithContext:completion:", v10, v13);

  }
}

void __71__FAResendFamilyInviteHook_loadResendRequestWithAttributes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _FALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "Error from state controller for resend family invite %@", (uint8_t *)&v10, 0xCu);

    }
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, 1, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

@end
