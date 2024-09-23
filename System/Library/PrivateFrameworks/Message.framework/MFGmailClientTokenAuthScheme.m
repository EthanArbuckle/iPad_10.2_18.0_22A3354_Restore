@implementation MFGmailClientTokenAuthScheme

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "authenticationMechanisms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("PLAIN-CLIENTTOKEN"));

  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)MFGmailClientTokenAuthScheme;
    -[ECAuthenticationScheme authenticatorForAccount:connection:](&v13, sel_authenticatorForAccount_connection_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", &stru_1E4F1C8F8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "authenticatorForAccount:connection:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  id v6;
  int v7;
  unsigned int v8;
  objc_super v10;

  v6 = a4;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    v7 = 1;
  else
    v7 = -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
  v10.receiver = self;
  v10.super_class = (Class)MFGmailClientTokenAuthScheme;
  v8 = v7 & -[ECAuthenticationScheme canAuthenticateAccountClass:connection:](&v10, sel_canAuthenticateAccountClass_connection_, a3, v6);

  return v8;
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return CFSTR("PLAIN-CLIENTTOKEN");
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(CFSTR("MESSAGE_AUTH_GMAIL_CLIENTTOKEN"), CFSTR("Gmail Client Token"), CFSTR("Delayed"));
}

@end
