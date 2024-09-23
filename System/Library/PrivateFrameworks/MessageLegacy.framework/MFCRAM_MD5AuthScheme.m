@implementation MFCRAM_MD5AuthScheme

- (id)name
{
  return CFSTR("CRAM-MD5");
}

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)humanReadableName
{
  return (id)MFLookupLocalizedString((uint64_t)CFSTR("MESSAGE_AUTH_CRAM_MD5"), (uint64_t)CFSTR("MD5 Challenge-Response"), CFSTR("Delayed"));
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
  return -[MFAuthScheme canAuthenticateAccountClass:connection:](&v5, sel_canAuthenticateAccountClass_connection_, a3, a4);
}

@end
