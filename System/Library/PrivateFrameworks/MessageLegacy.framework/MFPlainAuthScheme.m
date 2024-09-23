@implementation MFPlainAuthScheme

- (id)name
{
  return &stru_1E81CBE50;
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  void *v7;
  void *v8;
  objc_class *v9;

  v7 = (void *)objc_msgSend((id)objc_opt_class(), "saslProfileName");
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("imap")) & 1) != 0)
    return 0;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("pop")) & 1) != 0)
    return 0;
  v8 = (void *)objc_msgSend(a4, "authenticationMechanisms");
  if (objc_msgSend(v8, "indexOfObject:", CFSTR("PLAIN")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v8, "indexOfObject:", CFSTR("LOGIN")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }
  v9 = (objc_class *)objc_opt_class();
  if (!v9)
    return 0;
  else
    return (id)objc_msgSend([v9 alloc], "initWithAuthScheme:account:connection:", self, a3, a4);
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  unsigned int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPlainAuthScheme;
  v5 = -[MFAuthScheme canAuthenticateAccountClass:connection:](&v7, sel_canAuthenticateAccountClass_connection_, a3);
  if (v5)
    LOBYTE(v5) = objc_msgSend(a4, "loginDisabled") ^ 1;
  return v5;
}

- (id)humanReadableName
{
  return (id)MFLookupLocalizedString((uint64_t)CFSTR("MESSAGE_AUTH_PLAIN_TEXT"), (uint64_t)CFSTR("Password"), CFSTR("Delayed"));
}

@end
