@implementation MFPlainAuthScheme

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "saslProfileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("pop")) & 1) == 0)
  {
    objc_msgSend(v7, "authenticationMechanisms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "indexOfObject:", *MEMORY[0x1E0D1E668]) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (objc_class *)objc_opt_class();
      if (v10)
      {

LABEL_10:
        v11 = (void *)objc_msgSend([v10 alloc], "initWithAuthenticationScheme:account:connection:", self, v6, v7);
        goto LABEL_11;
      }
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("smtp"))
      && objc_msgSend(v9, "indexOfObject:", *MEMORY[0x1E0D1E660]) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (objc_class *)objc_opt_class();

      if (v10)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  id v6;
  int v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MFPlainAuthScheme;
  if (-[ECAuthenticationScheme canAuthenticateAccountClass:connection:](&v9, sel_canAuthenticateAccountClass_connection_, a3, v6))
  {
    v7 = objc_msgSend(v6, "loginDisabled") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)name
{
  return (id)*MEMORY[0x1E0D1E668];
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(CFSTR("MESSAGE_AUTH_PLAIN_TEXT"), CFSTR("Password"), CFSTR("Delayed"));
}

@end
