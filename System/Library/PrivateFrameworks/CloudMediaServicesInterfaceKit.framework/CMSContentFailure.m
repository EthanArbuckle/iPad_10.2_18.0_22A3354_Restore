@implementation CMSContentFailure

- (CMSContentFailure)initWithError:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  CMSContentFailure *v8;
  CMSContentFailure *v9;
  uint64_t v10;
  NSError *error;
  CMSContentFailure *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMSContentFailure;
  v8 = -[CMSContentFailure init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_URL, a4);
    +[CMSServiceError serviceErrorFromCause:](CMSServiceError, "serviceErrorFromCause:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v12 = 0;
      goto LABEL_6;
    }
    error = v9->_error;
    v9->_error = (NSError *)v10;

  }
  v12 = v9;
LABEL_6:

  return v12;
}

- (CMSContentFailure)initWithError:(id)a3
{
  return -[CMSContentFailure initWithError:url:](self, "initWithError:url:", a3, 0);
}

- (CMSContentFailure)initWithServiceError:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  CMSContentFailure *v9;
  void *v10;
  int v11;
  CMSContentFailure *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMSContentFailure;
  v9 = -[CMSContentFailure init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.sirikitcloudmedia.errorDomain"));

    if (!v11)
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_error, a3);
    objc_storeStrong((id *)&v9->_URL, a4);
  }
  v12 = v9;
LABEL_6:

  return v12;
}

- (id)cmsCoded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL absoluteString](self->_URL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", v4, CFSTR("url"));

  -[NSError domain](self->_error, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", v5, CFSTR("errorDomain"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSError code](self->_error, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cmsSetOptionalObject:forKey:", v6, CFSTR("errorCode"));

  -[NSError underlyingErrors](self->_error, "underlyingErrors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[NSError underlyingErrors](self->_error, "underlyingErrors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = CFSTR("errorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("errorDomain");
    v16[0] = v11;
    objc_msgSend(v10, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("underlyingError"));
  }
  return v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
