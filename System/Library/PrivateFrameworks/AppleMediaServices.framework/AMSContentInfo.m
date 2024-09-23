@implementation AMSContentInfo

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AMSContentInfo cacheKey](self, "cacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cacheKey"));

  -[AMSContentInfo created](self, "created");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("created"));

  -[AMSContentInfo expires](self, "expires");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("expires"));

  -[AMSContentInfo path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("path"));

  -[AMSContentInfo version](self, "version");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("version"));

}

- (AMSContentInfo)initWithCoder:(id)a3
{
  id v4;
  AMSContentInfo *v5;
  uint64_t v6;
  NSString *cacheKey;
  uint64_t v8;
  NSDate *created;
  uint64_t v10;
  NSDate *expires;
  uint64_t v12;
  NSString *path;
  uint64_t v14;
  NSString *version;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSContentInfo;
  v5 = -[AMSContentInfo init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    cacheKey = v5->_cacheKey;
    v5->_cacheKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("created"));
    v8 = objc_claimAutoreleasedReturnValue();
    created = v5->_created;
    v5->_created = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expires"));
    v10 = objc_claimAutoreleasedReturnValue();
    expires = v5->_expires;
    v5->_expires = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v12 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v14 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (NSDate)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
  objc_storeStrong((id *)&self->_created, a3);
}

- (NSDate)expires
{
  return self->_expires;
}

- (void)setExpires:(id)a3
{
  objc_storeStrong((id *)&self->_expires, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
}

@end
