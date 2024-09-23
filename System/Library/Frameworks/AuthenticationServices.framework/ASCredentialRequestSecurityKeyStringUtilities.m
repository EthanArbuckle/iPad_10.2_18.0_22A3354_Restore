@implementation ASCredentialRequestSecurityKeyStringUtilities

+ (id)titleWithPresentationContext:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "overrideTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "overrideTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "isRegistrationRequest");

    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)messageWithPresentationContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "overrideSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "overrideSubtitle");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isRegistrationRequest"))
  {
    objc_msgSend(a1, "_registerSecurityKeyMessageTextWithPresentationContext:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "allowedCredentialsForSecurityKeyAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 < 2)
      objc_msgSend(a1, "_basicAssertionMessageTextWithPresentationContext:", v4);
    else
      objc_msgSend(a1, "_multipleAllowedSecurityKeysMessageTextWithPresentationContext:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

  return v10;
}

+ (NSString)activateSecurityKeyAgainMessageText
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");

  _WBSLocalizedString();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)_registerSecurityKeyMessageTextWithPresentationContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BE82CB8];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceClass");

  v6 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_multipleAllowedSecurityKeysMessageTextWithPresentationContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BE82CB8];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceClass");

  v6 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_basicAssertionMessageTextWithPresentationContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BE82CB8];
  v4 = a3;
  objc_msgSend(v3, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceClass");

  v6 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
