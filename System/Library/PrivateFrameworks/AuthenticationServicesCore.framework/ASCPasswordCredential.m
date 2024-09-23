@implementation ASCPasswordCredential

- (ASCPasswordCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 externalProviderBundleIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ASCPasswordCredential *v17;
  uint64_t v18;
  NSString *user;
  uint64_t v20;
  NSString *password;
  uint64_t v22;
  NSString *site;
  uint64_t v24;
  NSString *externalProviderBundleIdentifier;
  ASCPasswordCredential *v26;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ASCPasswordCredential;
  v17 = -[ASCPasswordCredential init](&v28, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    user = v17->_user;
    v17->_user = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    password = v17->_password;
    v17->_password = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    site = v17->_site;
    v17->_site = (NSString *)v22;

    objc_storeStrong((id *)&v17->_creationDate, a6);
    v24 = objc_msgSend(v16, "copy");
    externalProviderBundleIdentifier = v17->_externalProviderBundleIdentifier;
    v17->_externalProviderBundleIdentifier = (NSString *)v24;

    v26 = v17;
  }

  return v17;
}

- (BOOL)isExternal
{
  return self->_externalProviderBundleIdentifier != 0;
}

- (BOOL)isEqual:(id)a3
{
  ASCPasswordCredential *v4;
  ASCPasswordCredential *v5;
  ASCPasswordCredential *v6;
  NSString *user;
  void *v8;
  NSString *password;
  void *v10;
  NSString *site;
  void *v12;
  NSDate *creationDate;
  void *v14;
  void *v15;
  char v16;

  v4 = (ASCPasswordCredential *)a3;
  v5 = v4;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      user = self->_user;
      -[ASCPasswordCredential user](v6, "user");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](user, "isEqual:", v8))
      {
        password = self->_password;
        -[ASCPasswordCredential password](v6, "password");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqual:](password, "isEqual:", v10))
        {
          site = self->_site;
          -[ASCPasswordCredential site](v6, "site");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqual:](site, "isEqual:", v12))
          {
            creationDate = self->_creationDate;
            -[ASCPasswordCredential creationDate](v6, "creationDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSDate isEqual:](creationDate, "isEqual:", v14))
            {
              -[ASCPasswordCredential externalProviderBundleIdentifier](v6, "externalProviderBundleIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = WBSIsEqual();

            }
            else
            {
              v16 = 0;
            }

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_user, "hash");
  v4 = -[NSString hash](self->_password, "hash") ^ v3;
  v5 = -[NSString hash](self->_site, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_creationDate, "hash");
  return v6 ^ -[NSString hash](self->_externalProviderBundleIdentifier, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCPasswordCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ASCPasswordCredential *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("site"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalProviderBundleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASCPasswordCredential initWithUser:password:site:creationDate:externalProviderBundleIdentifier:](self, "initWithUser:password:site:creationDate:externalProviderBundleIdentifier:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *user;
  id v5;

  user = self->_user;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", user, CFSTR("user"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_password, CFSTR("password"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_site, CFSTR("site"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalProviderBundleIdentifier, CFSTR("externalProviderBundleIdentifier"));

}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)site
{
  return self->_site;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)externalProviderBundleIdentifier
{
  return self->_externalProviderBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
