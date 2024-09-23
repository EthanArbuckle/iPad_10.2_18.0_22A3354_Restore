@implementation MSSetupSession

- (MSSetupSession)initWithServiceAccount:(id)a3 test:(unint64_t)a4
{
  id v7;
  MSSetupSession *v8;
  objc_super v10;

  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSSetupSession;
  -[MSSetupSession self](&v10, sel_self);
  v8 = (MSSetupSession *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a3);
    v8->_testFlags = a4;
  }

  return v8;
}

- (MSSetupSession)initWithServiceAccount:(MSServiceAccount *)serviceAccount
{
  return -[MSSetupSession initWithServiceAccount:test:](self, "initWithServiceAccount:test:", serviceAccount, 0);
}

- (BOOL)startWithError:(NSError *)error
{
  MSSetupViewController *v5;
  MSSetupViewController *viewController;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = -[MSSetupViewController initWithServiceAccount:testFlags:]([MSSetupViewController alloc], "initWithServiceAccount:testFlags:", self->_account, self->_testFlags);
  viewController = self->_viewController;
  self->_viewController = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContext);
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_presentationContext);
    objc_msgSend(v8, "presentationAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connectedScenes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windows");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "rootViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "presentViewController:animated:completion:", self->_viewController, 1, 0);
  }
  else
  {
    NSLog(CFSTR("  ###  No view controller to present from"));
    if (error)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.serviceonboarding.errorDomain"), 6, 0);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v14 != 0;
}

BOOL __33__MSSetupSession_startWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activationState") == 0;
}

- (id)presentationContext
{
  return objc_loadWeakRetained((id *)&self->_presentationContext);
}

- (void)setPresentationContext:(id)presentationContext
{
  objc_storeWeak((id *)&self->_presentationContext, presentationContext);
}

- (MSServiceAccount)account
{
  return self->_account;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (MSSetupViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_presentationContext);
}

@end
