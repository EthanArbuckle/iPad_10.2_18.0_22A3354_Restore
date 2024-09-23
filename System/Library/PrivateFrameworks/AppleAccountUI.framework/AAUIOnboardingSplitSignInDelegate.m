@implementation AAUIOnboardingSplitSignInDelegate

- (AAUIOnboardingSplitSignInDelegate)initWithServiceSignInController:(id)a3
{
  id v5;
  AAUIOnboardingSplitSignInDelegate *v6;
  AAUIOnboardingSplitSignInDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIOnboardingSplitSignInDelegate;
  v6 = -[AAUIOnboardingSplitSignInDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_originatingServiceSignInController, a3);

  return v7;
}

- (void)onboardingSignInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  AAUIAppleIDSignInConfigSplitAccountStore *v14;
  AAUIOnboardingSignInController *v15;
  AAUIOnboardingSignInController *storeSignInController;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  AAUIServiceSignInController *originatingServiceSignInController;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CFCF18];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CFCF18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412290;
      v32 = v11;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Split onboarding sign in for service cloud returned %@", (uint8_t *)&v31, 0xCu);

    }
    objc_msgSend(v7, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_storeStrong((id *)&self->_semiFinalResults, a4);
      v14 = -[AAUIAppleIDSignInConfigSplitAccountStore initWithNavController:]([AAUIAppleIDSignInConfigSplitAccountStore alloc], "initWithNavController:", v6);
      v15 = -[AAUIOnboardingSignInController initWithSetupSignInConfig:]([AAUIOnboardingSignInController alloc], "initWithSetupSignInConfig:", v14);
      storeSignInController = self->_storeSignInController;
      self->_storeSignInController = v15;

      -[AAUIOnboardingSignInController setDelegate:](self->_storeSignInController, "setDelegate:", self);
      -[AAUIServiceSignInController authenticationController](self->_originatingServiceSignInController, "authenticationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIOnboardingSignInController serviceController](self->_storeSignInController, "serviceController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "signInViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAuthenticationController:", v17);

      -[AAUIServiceSignInController serviceOwnersManager](self->_originatingServiceSignInController, "serviceOwnersManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIOnboardingSignInController serviceController](self->_storeSignInController, "serviceController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setServiceOwnersManager:", v20);

      -[AAUIOnboardingSignInController start](self->_storeSignInController, "start");
LABEL_12:

      goto LABEL_13;
    }
LABEL_8:
    -[AAUIOnboardingSplitSignInDelegate _handleAIDAResultErrorInSignInController:](self, "_handleAIDAResultErrorInSignInController:", v6);
    goto LABEL_13;
  }
  v22 = *MEMORY[0x1E0CFCF38];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CFCF38]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v7, "objectForKey:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      _AAUILogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "objectForKey:", v8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412290;
        v32 = v27;
        _os_log_impl(&dword_1DB4ED000, v26, OS_LOG_TYPE_DEFAULT, "Split onboarding sign in for service store returned %@", (uint8_t *)&v31, 0xCu);

      }
      v14 = (AAUIAppleIDSignInConfigSplitAccountStore *)-[NSDictionary mutableCopy](self->_semiFinalResults, "mutableCopy");
      objc_msgSend(v7, "objectForKey:", v22);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIAppleIDSignInConfigSplitAccountStore setObject:forKey:](v14, "setObject:forKey:", v28, v22);

      originatingServiceSignInController = self->_originatingServiceSignInController;
      v30 = (void *)-[AAUIAppleIDSignInConfigSplitAccountStore copy](v14, "copy");
      -[AAUIServiceSignInController controllerFinishedWithAIDAResults:](originatingServiceSignInController, "controllerFinishedWithAIDAResults:", v30);

      goto LABEL_12;
    }
    goto LABEL_8;
  }
LABEL_13:

}

- (void)_handleAIDAResultErrorInSignInController:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)onboardingSignInControllerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AAUIServiceSignInController signInViewController](self->_originatingServiceSignInController, "signInViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AAUIServiceSignInController signInViewController](self->_originatingServiceSignInController, "signInViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signInViewControllerDidCancel:", v5);

  }
}

- (void)onboardingSignInController:(id)a3 didSkipWithReason:(int64_t)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  AAUIServiceSignInController *originatingServiceSignInController;
  void *v13;
  int v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = a4;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Split onboarding sign in skipped with reason reason %ld", (uint8_t *)&v14, 0xCu);
  }

  if (self->_storeSignInController)
  {
    v7 = objc_alloc(MEMORY[0x1E0CFCF60]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB90], -8014, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CFCF38];
    v10 = (void *)objc_msgSend(v7, "initWithSuccess:error:type:", 0, v8, *MEMORY[0x1E0CFCF38]);

    v11 = (void *)-[NSDictionary mutableCopy](self->_semiFinalResults, "mutableCopy");
    objc_msgSend(v11, "setObject:forKey:", v10, v9);
    originatingServiceSignInController = self->_originatingServiceSignInController;
    v13 = (void *)objc_msgSend(v11, "copy");
    -[AAUIServiceSignInController controllerFinishedWithAIDAResults:](originatingServiceSignInController, "controllerFinishedWithAIDAResults:", v13);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeSignInController, 0);
  objc_storeStrong((id *)&self->_semiFinalResults, 0);
  objc_storeStrong((id *)&self->_originatingServiceSignInController, 0);
}

@end
