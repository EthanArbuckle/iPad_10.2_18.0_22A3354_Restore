@implementation _MFLoginAuthenticator

- (id)saslName
{
  return CFSTR("LOGIN");
}

- (id)responseForServerData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  self->_justSentPassword = 0;
  if (!v4)
    goto LABEL_5;
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "bytes");
  if ((unint64_t)objc_msgSend(v6, "length") < 4)
    goto LABEL_5;
  if (!strncasecmp(v7, "user", 4uLL))
  {
    -[ECSASLAuthenticator account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = (void *)v12;

    goto LABEL_6;
  }
  if (!strncasecmp(v7, "pass", 4uLL))
  {
    self->_justSentPassword = 1;
    -[ECSASLAuthenticator account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_5:
  v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)justSentPlainTextPassword
{
  return self->_justSentPassword;
}

@end
