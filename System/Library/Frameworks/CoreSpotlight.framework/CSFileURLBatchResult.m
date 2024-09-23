@implementation CSFileURLBatchResult

- (CSFileURLBatchResult)initWithFileURL:(id)a3 andError:(id)a4
{
  NSURL *v6;
  NSError *v7;
  NSURL *url;
  NSURL *v9;
  NSError *error;

  v6 = (NSURL *)a3;
  v7 = (NSError *)a4;
  url = self->_url;
  self->_url = v6;
  v9 = v6;

  error = self->_error;
  self->_error = v7;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  void *v5;
  id v6;

  url = self->_url;
  v6 = a3;
  +[CSCoder encodeURLPreservingSecurityScope:](CSCoder, "encodeURLPreservingSecurityScope:", url);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("urlDataKey"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_error, CFSTR("errorKey"));
}

- (CSFileURLBatchResult)initWithCoder:(id)a3
{
  id v4;
  CSFileURLBatchResult *v5;
  void *v6;
  uint64_t v7;
  NSURL *url;
  uint64_t v9;
  NSError *error;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSFileURLBatchResult;
  v5 = -[CSFileURLBatchResult init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("urlDataKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSDecoder decodeURLPreservingSecurityScope:](CSDecoder, "decodeURLPreservingSecurityScope:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("errorKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CSFileURLBatchResult initWithFileURL:andError:]([CSFileURLBatchResult alloc], "initWithFileURL:andError:", self->_url, self->_error);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSURL *url;
  void *v7;
  NSError *error;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    url = self->_url;
    objc_msgSend(v5, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSURL isEqual:](url, "isEqual:", v7))
    {
      error = self->_error;
      objc_msgSend(v5, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSError isEqual:](error, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
