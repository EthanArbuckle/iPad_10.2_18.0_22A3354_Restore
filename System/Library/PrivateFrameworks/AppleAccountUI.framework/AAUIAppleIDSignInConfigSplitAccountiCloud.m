@implementation AAUIAppleIDSignInConfigSplitAccountiCloud

- (AAUIAppleIDSignInConfigSplitAccountiCloud)initWithNavController:(id)a3
{
  AAUIAppleIDSignInConfigSplitAccountiCloud *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)AAUIAppleIDSignInConfigSplitAccountiCloud;
  v3 = -[AAUIAppleIDSignInConfiguration initWithNavController:](&v11, sel_initWithNavController_, a3);
  if (v3)
  {
    v4 = *MEMORY[0x1E0CFCF30];
    v12[0] = *MEMORY[0x1E0CFCF18];
    v12[1] = v4;
    v5 = *MEMORY[0x1E0CFCF28];
    v12[2] = *MEMORY[0x1E0CFCF20];
    v12[3] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAppleIDSignInConfiguration signInConfiguration](v3, "signInConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setServiceTypes:", v6);

    -[AAUIAppleIDSignInConfiguration signInConfiguration](v3, "signInConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSplitSignIn:", 1);

    -[AAUIAppleIDSignInConfiguration signInConfiguration](v3, "signInConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldShowSystemBackButton:", 1);

  }
  return v3;
}

@end
