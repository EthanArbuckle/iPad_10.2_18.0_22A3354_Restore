@implementation SFAutoFillAuthenticationUtilities

+ (id)passcodePromptForViewingSavedAccounts
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D8A8B8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)passcodePromptForFillingSavedAccount
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D8A8B8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)passcodePromptForFillingCreditCard
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D8A8B8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)passcodePromptForFillingTimeBasedOneTimeCode
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D8A8B8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)customAuthenticationTitleForViewingSavedAccounts
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForFillingSavedPassword
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForFillingSavedPasskey
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForFillingCreditCard
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForFillingTimeBasedOneTimeCode
{
  return (id)_WBSLocalizedString();
}

+ (id)customAuthenticationTitleForLoggingInWithSavedAccountOnWebsite:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)passcodePromptForLoggingInWithSavedAccountOnWebsite:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D8A8B8];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceClass");

  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
