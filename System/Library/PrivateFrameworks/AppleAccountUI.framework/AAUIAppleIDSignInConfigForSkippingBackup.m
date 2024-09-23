@implementation AAUIAppleIDSignInConfigForSkippingBackup

- (AAUIAppleIDSignInConfigForSkippingBackup)initWithNavController:(id)a3
{
  id v4;
  AAUIAppleIDSignInConfigForSkippingBackup *v5;
  AAUIAppleIDSignInConfigForSkippingBackup *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAUIAppleIDSignInConfigForSkippingBackup;
  v5 = -[AAUIAppleIDSignInConfiguration initWithNavController:](&v12, sel_initWithNavController_, v4);
  v6 = v5;
  if (v5)
  {
    -[AAUIAppleIDSignInConfiguration signInConfiguration](v5, "signInConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowSkip:", 1);

    -[AAUIAppleIDSignInConfiguration signInConfiguration](v6, "signInConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNewSignInReauth:", 1);

    -[AAUIAppleIDSignInConfigForSkippingBackup _serviceContextWithNavController:](v6, "_serviceContextWithNavController:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAppleIDSignInConfiguration signInConfiguration](v6, "signInConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setServiceContext:", v9);

  }
  return v6;
}

- (id)_serviceContextWithNavController:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  AAUISignInFlowControllerDelegate *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CFCF58];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = -[AAUISignInFlowControllerDelegate initWithPresentingViewController:]([AAUISignInFlowControllerDelegate alloc], "initWithPresentingViewController:", v4);

  -[AAUISignInFlowControllerDelegate setNewSignInReauth:](v6, "setNewSignInReauth:", 1);
  v9 = *MEMORY[0x1E0CFCF18];
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSignInContexts:", v7);

  return v5;
}

- (void)setUsername:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AAUIAppleIDSignInConfiguration signInConfiguration](self, "signInConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", v4);

  -[AAUIAppleIDSignInConfiguration signInConfiguration](self, "signInConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCanEditUsername:", 0);

}

@end
