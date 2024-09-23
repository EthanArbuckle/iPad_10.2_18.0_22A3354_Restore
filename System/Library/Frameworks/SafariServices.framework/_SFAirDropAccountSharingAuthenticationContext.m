@implementation _SFAirDropAccountSharingAuthenticationContext

- (_SFAirDropAccountSharingAuthenticationContext)initWithSavedAccount:(id)a3
{
  id v5;
  _SFAirDropAccountSharingAuthenticationContext *v6;
  _SFAirDropAccountSharingAuthenticationContext *v7;
  _SFAirDropAccountSharingAuthenticationContext *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFAirDropAccountSharingAuthenticationContext;
  v6 = -[_SFAirDropAccountSharingAuthenticationContext init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_savedAccount, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_localAuthenticationOptionsForSharingPasskeyWithAirDrop
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = &unk_1E4B25BB8;
  -[_SFAirDropAccountSharingAuthenticationContext _passcodeTitleForSharingPasskeyWithAirDrop](self, "_passcodeTitleForSharingPasskeyWithAirDrop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = &unk_1E4B25BD0;
  v7[0] = v2;
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_localAuthenticationOptionsForSharingPasswordWithAirDrop
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = &unk_1E4B25BB8;
  -[_SFAirDropAccountSharingAuthenticationContext _passcodeTitleForSharingPasswordWithAirDrop](self, "_passcodeTitleForSharingPasswordWithAirDrop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = &unk_1E4B25BD0;
  v7[0] = v2;
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_passcodeTitleForSharingPasskeyWithAirDrop
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D8A8B8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_passcodeTitleForSharingPasswordWithAirDrop
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D8A8B8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)customLocalAuthenticationOptions
{
  if ((-[WBSSavedAccount credentialTypes](self->_savedAccount, "credentialTypes") & 2) != 0)
    -[_SFAirDropAccountSharingAuthenticationContext _localAuthenticationOptionsForSharingPasskeyWithAirDrop](self, "_localAuthenticationOptionsForSharingPasskeyWithAirDrop");
  else
    -[_SFAirDropAccountSharingAuthenticationContext _localAuthenticationOptionsForSharingPasswordWithAirDrop](self, "_localAuthenticationOptionsForSharingPasswordWithAirDrop");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)showsAuthenticationPromptAsTitle
{
  return 0;
}

- (NSString)authenticationPrompt
{
  return (NSString *)&stru_1E4AC8470;
}

- (BOOL)hasBeenAuthenticated
{
  return self->_hasBeenAuthenticated;
}

- (void)setHasBeenAuthenticated:(BOOL)a3
{
  self->_hasBeenAuthenticated = a3;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAccount, 0);
}

@end
