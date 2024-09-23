@implementation SKCloudServiceSetupReloadContext

- (NSDictionary)userInfo
{
  NSDictionary *userInfo;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    -[NSString dataUsingEncoding:](self->_serializedUserInfo, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, 0);
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v6 = self->_userInfo;
      self->_userInfo = v5;

    }
    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (void)setUserInfo:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *serializedUserInfo;
  NSString *v8;
  NSString *v9;
  NSDictionary *v10;
  NSDictionary *userInfo;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  serializedUserInfo = self->_serializedUserInfo;
  if (serializedUserInfo != v6 && !-[NSString isEqualToString:](serializedUserInfo, "isEqualToString:", v6))
  {
    v8 = (NSString *)-[NSString copy](v6, "copy");
    v9 = self->_serializedUserInfo;
    self->_serializedUserInfo = v8;

    v10 = (NSDictionary *)objc_msgSend(v12, "copy");
    userInfo = self->_userInfo;
    self->_userInfo = v10;

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_cloudServiceSetupURL)
    objc_msgSend(v6, "appendFormat:", CFSTR("; cloudServiceSetupURL = %@"), self->_cloudServiceSetupURL);
  if (self->_action)
    objc_msgSend(v6, "appendFormat:", CFSTR("; action = %@"), self->_action);
  if (-[NSArray count](self->_queryItems, "count"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; has queryItems"));
  if (self->_sourceApplicationBundleIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; sourceApplicationBundleIdentifier = \"%@\"),
      self->_sourceApplicationBundleIdentifier);
  if (self->_referrerURL)
    objc_msgSend(v6, "appendFormat:", CFSTR("; referrerURL = %@"), self->_referrerURL);
  if (self->_serializedUserInfo)
    objc_msgSend(v6, "appendFormat:", CFSTR("; has userInfo"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSURL hash](self->_cloudServiceSetupURL, "hash");
  v4 = -[NSString hash](self->_action, "hash") ^ v3;
  v5 = -[NSArray hash](self->_queryItems, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_sourceApplicationBundleIdentifier, "hash");
  v7 = -[NSURL hash](self->_referrerURL, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_serializedUserInfo, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SKCloudServiceSetupReloadContext *v4;
  SKCloudServiceSetupReloadContext *v5;
  NSURL *cloudServiceSetupURL;
  NSString *action;
  NSArray *queryItems;
  NSString *sourceApplicationBundleIdentifier;
  NSURL *referrerURL;
  NSString *serializedUserInfo;
  char v12;

  v4 = (SKCloudServiceSetupReloadContext *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      cloudServiceSetupURL = self->_cloudServiceSetupURL;
      if ((cloudServiceSetupURL == v5->_cloudServiceSetupURL
         || -[NSURL isEqual:](cloudServiceSetupURL, "isEqual:"))
        && ((action = self->_action, action == v5->_action) || -[NSString isEqualToString:](action, "isEqualToString:"))
        && ((queryItems = self->_queryItems, queryItems == v5->_queryItems)
         || -[NSArray isEqualToArray:](queryItems, "isEqualToArray:"))
        && ((sourceApplicationBundleIdentifier = self->_sourceApplicationBundleIdentifier,
             sourceApplicationBundleIdentifier == v5->_sourceApplicationBundleIdentifier)
         || -[NSString isEqualToString:](sourceApplicationBundleIdentifier, "isEqualToString:"))
        && ((referrerURL = self->_referrerURL, referrerURL == v5->_referrerURL)
         || -[NSURL isEqual:](referrerURL, "isEqual:")))
      {
        serializedUserInfo = self->_serializedUserInfo;
        if (serializedUserInfo == v5->_serializedUserInfo)
          v12 = 1;
        else
          v12 = -[NSString isEqualToString:](serializedUserInfo, "isEqualToString:");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 2, self->_cloudServiceSetupURL);
  objc_storeStrong(v4 + 3, self->_action);
  v5 = -[NSArray copy](self->_queryItems, "copy");
  v6 = v4[4];
  v4[4] = (id)v5;

  v7 = -[NSString copy](self->_sourceApplicationBundleIdentifier, "copy");
  v8 = v4[5];
  v4[5] = (id)v7;

  objc_storeStrong(v4 + 6, self->_referrerURL);
  v9 = -[NSString copy](self->_serializedUserInfo, "copy");
  v10 = v4[7];
  v4[7] = (id)v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKCloudServiceSetupReloadContext)initWithCoder:(id)a3
{
  id v4;
  SKCloudServiceSetupReloadContext *v5;
  uint64_t v6;
  NSURL *cloudServiceSetupURL;
  void *v8;
  uint64_t v9;
  NSString *action;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *queryItems;
  void *v17;
  uint64_t v18;
  NSString *sourceApplicationBundleIdentifier;
  uint64_t v20;
  NSURL *referrerURL;
  void *v22;
  uint64_t v23;
  NSString *serializedUserInfo;

  v4 = a3;
  v5 = -[SKCloudServiceSetupReloadContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudServiceSetupURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    cloudServiceSetupURL = v5->_cloudServiceSetupURL;
    v5->_cloudServiceSetupURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    action = v5->_action;
    v5->_action = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("queryItems"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    queryItems = v5->_queryItems;
    v5->_queryItems = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApplicationBundleIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    sourceApplicationBundleIdentifier = v5->_sourceApplicationBundleIdentifier;
    v5->_sourceApplicationBundleIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSURL *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedUserInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    serializedUserInfo = v5->_serializedUserInfo;
    v5->_serializedUserInfo = (NSString *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *cloudServiceSetupURL;
  id v5;

  cloudServiceSetupURL = self->_cloudServiceSetupURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cloudServiceSetupURL, CFSTR("cloudServiceSetupURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_queryItems, CFSTR("queryItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceApplicationBundleIdentifier, CFSTR("sourceApplicationBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referrerURL, CFSTR("referrerURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serializedUserInfo, CFSTR("serializedUserInfo"));

}

- (NSURL)cloudServiceSetupURL
{
  return self->_cloudServiceSetupURL;
}

- (void)setCloudServiceSetupURL:(id)a3
{
  objc_storeStrong((id *)&self->_cloudServiceSetupURL, a3);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)queryItems
{
  return self->_queryItems;
}

- (void)setQueryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
  objc_storeStrong((id *)&self->_referrerURL, a3);
}

- (NSString)serializedUserInfo
{
  return self->_serializedUserInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedUserInfo, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queryItems, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_cloudServiceSetupURL, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
