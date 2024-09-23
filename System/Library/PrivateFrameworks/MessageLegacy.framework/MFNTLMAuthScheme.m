@implementation MFNTLMAuthScheme

- (Class)authenticatorClass
{
  return (Class)objc_opt_class();
}

- (id)name
{
  return CFSTR("NTLM");
}

- (id)humanReadableName
{
  return (id)MFLookupLocalizedString((uint64_t)CFSTR("MESSAGE_AUTH_NTLM"), (uint64_t)CFSTR("NTLM"), CFSTR("Delayed"));
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
