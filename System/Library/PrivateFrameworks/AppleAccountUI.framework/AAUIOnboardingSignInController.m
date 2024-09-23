@implementation AAUIOnboardingSignInController

- (AAUIOnboardingSignInController)initWithSetupSignInConfig:(id)a3
{
  id v4;
  AAUIOnboardingSignInController *v5;
  uint64_t v6;
  AAUIServiceSignInConfiguration *signInConfiguration;
  AAUIServiceSignInController *v8;
  AAUIServiceSignInController *serviceController;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUIOnboardingSignInController;
  v5 = -[AAUIOnboardingSignInController init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "signInConfiguration");
    v6 = objc_claimAutoreleasedReturnValue();
    signInConfiguration = v5->_signInConfiguration;
    v5->_signInConfiguration = (AAUIServiceSignInConfiguration *)v6;

    v8 = -[AAUIServiceSignInController initWithSignInConfiguration:]([AAUIServiceSignInController alloc], "initWithSignInConfiguration:", v5->_signInConfiguration);
    serviceController = v5->_serviceController;
    v5->_serviceController = v8;

  }
  return v5;
}

- (void)start
{
  -[AAUIServiceSignInConfiguration setServiceDelegate:](self->_signInConfiguration, "setServiceDelegate:", self);
  -[AAUIServiceSignInController loadViewControllerForPresentation](self->_serviceController, "loadViewControllerForPresentation");
}

- (void)serviceSignInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIOnboardingSignInController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "AAUIOnboardingSignInController completing with results: %@", (uint8_t *)&v10, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "onboardingSignInController:didCompleteWithOperationsResults:", v6, v7);

}

- (void)serviceSignInControllerDidCancel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIOnboardingSignInController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "AAUIOnboardingSignInController did cancel", v7, 2u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "onboardingSignInControllerDidCancel:", v4);

}

- (void)serviceSignInController:(id)a3 didSkipWithReason:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIOnboardingSignInController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a4;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "AAUIOnboardingSignInController did skip with reason %ld", (uint8_t *)&v9, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "onboardingSignInController:didSkipWithReason:", v6, a4);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "AAUIOnboardingSignInController dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AAUIOnboardingSignInController;
  -[AAUIOnboardingSignInController dealloc](&v4, sel_dealloc);
}

- (AAUIOnboardingSignInControllerDelegate)delegate
{
  return (AAUIOnboardingSignInControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AAUIServiceSignInConfiguration)signInConfiguration
{
  return self->_signInConfiguration;
}

- (void)setSignInConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_signInConfiguration, a3);
}

- (AAUIServiceSignInController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
  objc_storeStrong((id *)&self->_serviceController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_signInConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
