@implementation FAShowSubscriptionsHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("family:showSubscriptionsPage"));

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
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("family:showSubscriptionsPage"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  SKAccountPageViewController *v7;
  SKAccountPageViewController *controller;
  id WeakRetained;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BDEA6F8], a4, a5, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (SKAccountPageViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDEA6A8]), "initWithAccountURL:", v11);
  controller = self->controller;
  self->controller = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "showViewController:sender:", self->controller, 0);
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
  objc_storeStrong((id *)&self->controller, 0);
}

@end
