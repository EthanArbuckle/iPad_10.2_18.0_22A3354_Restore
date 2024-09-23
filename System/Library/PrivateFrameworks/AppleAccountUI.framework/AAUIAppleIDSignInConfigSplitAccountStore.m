@implementation AAUIAppleIDSignInConfigSplitAccountStore

- (AAUIAppleIDSignInConfigSplitAccountStore)initWithNavController:(id)a3
{
  AAUIAppleIDSignInConfigSplitAccountStore *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)AAUIAppleIDSignInConfigSplitAccountStore;
  v3 = -[AAUIAppleIDSignInConfiguration initWithNavController:](&v12, sel_initWithNavController_, a3);
  if (v3)
  {
    v13[0] = *MEMORY[0x1E0CFCF38];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAppleIDSignInConfiguration signInConfiguration](v3, "signInConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setServiceTypes:", v4);

    -[AAUIAppleIDSignInConfiguration signInConfiguration](v3, "signInConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSplitSignIn:", 1);

    -[AAUIAppleIDSignInConfiguration signInConfiguration](v3, "signInConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesBackOrCancelButton:", 1);

    -[AAUIAppleIDSignInConfiguration signInConfiguration](v3, "signInConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowSkip:", 1);

    -[AAUIAppleIDSignInConfigSplitAccountStore _serviceContext](v3, "_serviceContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAppleIDSignInConfiguration signInConfiguration](v3, "signInConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setServiceContext:", v9);

  }
  return v3;
}

- (id)_serviceContext
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CFCF58]);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setIgnoreAccountConversion:", 1);
  v7 = *MEMORY[0x1E0CFCF38];
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSignInContexts:", v5);

  if (-[AAUIAppleIDSignInConfigSplitAccountStore _isRunningInSetup](self, "_isRunningInSetup"))
    objc_msgSend(v4, "setDebugReason:", CFSTR("Setup Assistant"));

  return v3;
}

- (BOOL)_isRunningInSetup
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  return v4;
}

@end
