@implementation CPSTVProviderRequest

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_providerURL, CFSTR("providerURL"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_providerImage, CFSTR("providerImage"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_providerName, CFSTR("providerName"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_providerCode, CFSTR("providerCode"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)authType
{
  return 12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *providerURL;
  id v5;

  providerURL = self->_providerURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", providerURL, CFSTR("providerURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerImage, CFSTR("providerImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerName, CFSTR("providerName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerCode, CFSTR("providerCode"));

}

- (CPSTVProviderRequest)initWithCoder:(id)a3
{
  id v4;
  CPSTVProviderRequest *v5;
  void *v6;
  uint64_t v7;
  NSURL *providerURL;
  void *v9;
  uint64_t v10;
  UIImage *providerImage;
  void *v12;
  uint64_t v13;
  NSString *providerName;
  void *v15;
  uint64_t v16;
  NSString *providerCode;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPSTVProviderRequest;
  v5 = -[CPSTVProviderRequest init](&v19, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("providerURL"));
    v7 = objc_claimAutoreleasedReturnValue();
    providerURL = v5->_providerURL;
    v5->_providerURL = (NSURL *)v7;

    getUIImageClass();
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("providerImage"));
    v10 = objc_claimAutoreleasedReturnValue();
    providerImage = v5->_providerImage;
    v5->_providerImage = (UIImage *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("providerName"));
    v13 = objc_claimAutoreleasedReturnValue();
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v13;

    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("providerCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    providerCode = v5->_providerCode;
    v5->_providerCode = (NSString *)v16;

  }
  return v5;
}

- (NSURL)providerURL
{
  return self->_providerURL;
}

- (void)setProviderURL:(id)a3
{
  objc_storeStrong((id *)&self->_providerURL, a3);
}

- (UIImage)providerImage
{
  return self->_providerImage;
}

- (void)setProviderImage:(id)a3
{
  objc_storeStrong((id *)&self->_providerImage, a3);
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_storeStrong((id *)&self->_providerName, a3);
}

- (NSString)providerCode
{
  return self->_providerCode;
}

- (void)setProviderCode:(id)a3
{
  objc_storeStrong((id *)&self->_providerCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerCode, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_providerImage, 0);
  objc_storeStrong((id *)&self->_providerURL, 0);
}

@end
