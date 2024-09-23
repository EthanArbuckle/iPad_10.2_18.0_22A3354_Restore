@implementation AAUIAppleIDSignInConfigForSplitAccounts

- (AAUIAppleIDSignInConfigForSplitAccounts)initWithNavController:(id)a3
{
  AAUIAppleIDSignInConfigForSplitAccounts *v3;
  AAUIAppleIDSignInConfigForSplitAccounts *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAUIAppleIDSignInConfigForSplitAccounts;
  v3 = -[AAUIAppleIDSignInConfiguration initWithNavController:](&v8, sel_initWithNavController_, a3);
  v4 = v3;
  if (v3)
  {
    -[AAUIAppleIDSignInConfiguration signInConfiguration](v3, "signInConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowSkip:", 1);

    -[AAUIAppleIDSignInConfiguration signInConfiguration](v4, "signInConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOfferiCloudAMSSplitSignIn:", 1);

  }
  return v4;
}

@end
