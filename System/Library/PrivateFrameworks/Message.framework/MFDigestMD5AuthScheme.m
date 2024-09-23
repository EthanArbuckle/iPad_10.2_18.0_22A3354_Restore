@implementation MFDigestMD5AuthScheme

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return (id)*MEMORY[0x1E0D1E4A8];
}

- (id)humanReadableName
{
  return CFSTR("HTTP MD5 Digest");
}

- (BOOL)hasEncryption
{
  return 0;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFDigestMD5AuthScheme;
  return -[ECAuthenticationScheme canAuthenticateAccountClass:connection:](&v5, sel_canAuthenticateAccountClass_connection_, a3, a4);
}

@end
