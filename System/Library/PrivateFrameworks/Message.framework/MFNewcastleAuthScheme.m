@implementation MFNewcastleAuthScheme

+ (void)initialize
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", CFSTR("ATOKEN"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0D1E688], "registerSchemeClass:", a1);
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  id v6;
  int v7;
  int v8;
  objc_super v10;

  v6 = a4;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    v7 = 1;
  else
    v7 = -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
  v10.receiver = self;
  v10.super_class = (Class)MFNewcastleAuthScheme;
  if ((v7 & -[ECAuthenticationScheme canAuthenticateAccountClass:connection:](&v10, sel_canAuthenticateAccountClass_connection_, a3, v6)) == 1)v8 = objc_msgSend(v6, "loginDisabled") ^ 1;
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (id)name
{
  return CFSTR("ATOKEN");
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(CFSTR("MESSAGE_AUTH_ATOKEN"), CFSTR("Apple Token"), CFSTR("Delayed"));
}

- (BOOL)requiresPassword
{
  return 0;
}

@end
