@implementation AASetupAssistantConfigResponse

- (AASetupAssistantConfigResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AASetupAssistantConfigResponse *v4;
  AASetupAssistantConfigResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *urls;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v15[16];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AASetupAssistantConfigResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v16, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAResponse responseDictionary](v4, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AAResponse responseDictionary](v5, "responseDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("urls"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      urls = v5->_urls;
      v5->_urls = (NSDictionary *)v9;

    }
    else
    {
      _AALogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Empty response for configuration plist", v15, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("COMMUNICATIONS_ERROR"), &stru_1E41752F8, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v13, *MEMORY[0x1E0CB2D50]);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), 0, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAResponse setError:](v5, "setError:", v8);
    }

  }
  return v5;
}

- (NSString)signingSessionCertURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", CFSTR("qualifyCert"));
}

- (NSString)signingSessionURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", CFSTR("qualifySession"));
}

- (NSString)xmlUI
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantXMLUIKey);
}

- (NSString)aboutURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantAboutURLKey);
}

- (NSString)authenticateURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantAuthenticateURLKey);
}

- (NSString)createAppleIDURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantCreateAppleIDURLKey);
}

- (NSString)updateAppleIDURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantUpdateAppleIDURLKey);
}

- (NSString)createDelegateAccountsURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantCreateDelegateAccountsURLKey);
}

- (NSString)checkValidityURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantCheckValidityURLKey);
}

- (NSString)iForgotURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantIForgotURLKey);
}

- (NSString)existingAppleIDTermsUIURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantExistingAppleIDTermsUIURLKey);
}

- (NSString)loginDelegatesURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantLoginDelegatesURLKey);
}

- (NSString)upgradeIOSTermsUI
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantUpgradeiOSTermsUIURLKey);
}

- (NSString)genericTermsURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", CFSTR("genericTermsUI"));
}

- (NSString)upgradeStatusURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantUpgradeStatusURLKey);
}

- (BOOL)setupAssistantServerEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", AASetupAssistantServerEnabledKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)activeEmailDomain
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", AASetupAssistantActiveEmailDomainKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)iForgotUIURL
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", AASetupAssistantiForgotUIURLKey);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
}

@end
