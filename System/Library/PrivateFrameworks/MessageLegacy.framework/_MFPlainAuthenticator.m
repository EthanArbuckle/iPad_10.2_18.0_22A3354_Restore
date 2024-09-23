@implementation _MFPlainAuthenticator

- (id)saslName
{
  return CFSTR("PLAIN");
}

- (id)responseForServerData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v9;

  v4 = (void *)objc_msgSend((id)objc_msgSend(-[MFSASLAuthenticator account](self, "account", a3), "username"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_msgSend((id)objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "password"), "dataUsingEncoding:", 4);
  if (!v5)
  {
    -[MFSASLAuthenticator setMissingPasswordError](self, "setMissingPasswordError");
    return 0;
  }
  if (!v4)
    return 0;
  v6 = v5;
  v9 = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v4, "length") + objc_msgSend(v5, "length") + 2);
  objc_msgSend(v7, "appendBytes:length:", &v9, 1);
  objc_msgSend(v7, "appendData:", v4);
  objc_msgSend(v7, "appendBytes:length:", &v9, 1);
  objc_msgSend(v7, "appendData:", v6);
  return v7;
}

- (BOOL)justSentPlainTextPassword
{
  return 1;
}

@end
