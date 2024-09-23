@implementation ISIconCacheConfiguration

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setSandboxExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sandboxExtension, CFSTR("sandboxExtension"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_salt, CFSTR("salt"));

}

- (ISIconCacheConfiguration)initWithCoder:(id)a3
{
  id v4;
  ISIconCacheConfiguration *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *sandboxExtension;
  uint64_t v10;
  NSString *salt;

  v4 = a3;
  v5 = -[ISIconCacheConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxExtension"));
    v8 = objc_claimAutoreleasedReturnValue();
    sandboxExtension = v5->_sandboxExtension;
    v5->_sandboxExtension = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("salt"));
    v10 = objc_claimAutoreleasedReturnValue();
    salt = v5->_salt;
    v5->_salt = (NSString *)v10;

  }
  return v5;
}

- (NSString)sandboxExtension
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSalt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
