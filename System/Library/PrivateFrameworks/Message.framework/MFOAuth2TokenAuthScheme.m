@implementation MFOAuth2TokenAuthScheme

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "authenticationMechanisms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", CFSTR("XOAUTH2")) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v6, "oauth2Token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", CFSTR("PLAIN-CLIENTTOKEN"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "authenticatorForAccount:connection:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v14.receiver = self;
  v14.super_class = (Class)MFOAuth2TokenAuthScheme;
  -[ECAuthenticationScheme authenticatorForAccount:connection:](&v14, sel_authenticatorForAccount_connection_, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v11;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  id v6;
  int v7;
  objc_super v9;

  v6 = a4;
  v7 = -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE7FEB50);
  v9.receiver = self;
  v9.super_class = (Class)MFOAuth2TokenAuthScheme;
  LODWORD(a3) = v7 & -[ECAuthenticationScheme canAuthenticateAccountClass:connection:](&v9, sel_canAuthenticateAccountClass_connection_, a3, v6);

  return (char)a3;
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return CFSTR("XOAUTH2");
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(CFSTR("MESSAGE_AUTH_OAUTH2TOKEN"), CFSTR("OAuth 2.0 Token"), CFSTR("Delayed"));
}

@end
