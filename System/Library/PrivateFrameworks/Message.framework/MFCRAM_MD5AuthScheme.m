@implementation MFCRAM_MD5AuthScheme

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return (id)*MEMORY[0x1E0D1E4A0];
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(CFSTR("MESSAGE_AUTH_CRAM_MD5"), CFSTR("MD5 Challenge-Response"), CFSTR("Delayed"));
}

- (BOOL)sendsPlainTextPasswords
{
  return 0;
}

- (BOOL)hasEncryption
{
  return 0;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFCRAM_MD5AuthScheme;
  return -[ECAuthenticationScheme canAuthenticateAccountClass:connection:](&v5, sel_canAuthenticateAccountClass_connection_, a3, a4);
}

@end
