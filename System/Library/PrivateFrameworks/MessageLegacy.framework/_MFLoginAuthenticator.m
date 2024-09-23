@implementation _MFLoginAuthenticator

- (id)saslName
{
  return CFSTR("LOGIN");
}

- (id)responseForServerData:(id)a3
{
  const char *v5;
  void *v7;

  *((_BYTE *)&self->super._authenticationState + 4) = 0;
  if (!a3)
    return 0;
  v5 = (const char *)objc_msgSend(a3, "bytes");
  if ((unint64_t)objc_msgSend(a3, "length") < 4)
    return 0;
  if (!strncasecmp(v5, "user", 4uLL))
  {
    v7 = (void *)objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "username");
  }
  else
  {
    if (strncasecmp(v5, "pass", 4uLL))
      return 0;
    *((_BYTE *)&self->super._authenticationState + 4) = 1;
    v7 = (void *)objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "password");
  }
  return (id)objc_msgSend(v7, "dataUsingEncoding:", 4);
}

- (BOOL)justSentPlainTextPassword
{
  return *((_BYTE *)&self->super._authenticationState + 4);
}

@end
