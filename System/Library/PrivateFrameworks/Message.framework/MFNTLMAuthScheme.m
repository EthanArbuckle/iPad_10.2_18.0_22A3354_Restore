@implementation MFNTLMAuthScheme

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return (id)*MEMORY[0x1E0D1E4B0];
}

- (id)humanReadableName
{
  return MFLookupLocalizedString(CFSTR("MESSAGE_AUTH_NTLM"), CFSTR("NTLM"), CFSTR("Delayed"));
}

- (BOOL)sendsPlainTextPasswords
{
  return 0;
}

- (BOOL)hasEncryption
{
  return 1;
}

@end
