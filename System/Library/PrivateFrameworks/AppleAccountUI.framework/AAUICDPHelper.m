@implementation AAUICDPHelper

+ (AAUICDPHelper)helperWithPresenter:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeWeak(v4 + 1, v3);

  return (AAUICDPHelper *)v4;
}

+ (id)cdpContextForPrimaryAccount
{
  return (id)objc_msgSend(MEMORY[0x1E0D15768], "contextForPrimaryAccount");
}

+ (id)cdpContextForPrimaryAccountWithAuthenticationResults:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D15768]), "initWithAuthenticationResults:", v4);
  }
  else
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "No authentication results pased in, fetching CDPContext for primary account.", v9, 2u);
    }

    objc_msgSend(a1, "cdpContextForPrimaryAccount");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;

  return v7;
}

- (id)cdpStateControllerForPrimaryAccount
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "cdpContextForPrimaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICDPHelper cdpStateControllerWithContext:](self, "cdpStateControllerWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cdpStateControllerWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0D15780];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContext:", v5);

  v7 = objc_alloc(MEMORY[0x1E0D157C8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v9 = (void *)objc_msgSend(v7, "initWithPresentingViewController:", WeakRetained);

  objc_msgSend(v9, "setForceInlinePresentation:", -[AAUICDPHelper forceInline](self, "forceInline"));
  objc_msgSend(v6, "setUiProvider:", v9);

  return v6;
}

+ (BOOL)isWalrusEnabled
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0D15788]);
  v9 = 0;
  v4 = objc_msgSend(v3, "walrusStatus:", &v9);
  v5 = v9;
  if (v5)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[AAUICDPHelper isWalrusEnabled].cold.1((objc_class *)a1, (uint64_t)v5, v6);

    v7 = 0;
  }
  else
  {
    v7 = v4 == 1;
  }

  return v7;
}

- (BOOL)forceInline
{
  return self->_forceInline;
}

- (void)setForceInline:(BOOL)a3
{
  self->_forceInline = a3;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
}

+ (void)isWalrusEnabled
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1DB4ED000, a3, OS_LOG_TYPE_ERROR, "%@: Error while fetching walrus status: %@", (uint8_t *)&v6, 0x16u);

}

@end
