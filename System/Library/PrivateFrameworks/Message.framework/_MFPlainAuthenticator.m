@implementation _MFPlainAuthenticator

- (id)saslName
{
  return (id)*MEMORY[0x1E0D1E668];
}

- (id)responseForServerData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v12;

  -[ECSASLAuthenticator account](self, "account", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ECSASLAuthenticator account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[ECSASLAuthenticator setMissingPasswordError](self, "setMissingPasswordError");
    goto LABEL_5;
  }
  if (!v6)
  {
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v6, "length") + objc_msgSend(v9, "length") + 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendBytes:length:", &v12, 1);
  objc_msgSend(v10, "appendData:", v6);
  objc_msgSend(v10, "appendBytes:length:", &v12, 1);
  objc_msgSend(v10, "appendData:", v9);
LABEL_6:

  return v10;
}

- (BOOL)justSentPlainTextPassword
{
  return 1;
}

@end
