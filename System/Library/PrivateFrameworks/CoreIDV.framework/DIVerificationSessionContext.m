@implementation DIVerificationSessionContext

- (DIVerificationSessionContext)initWithName:(id)a3 tier:(id)a4 serviceUrl:(id)a5 httpHeaders:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DIVerificationSessionContext *v15;
  DIVerificationSessionContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "length"))
  {
    v18.receiver = self;
    v18.super_class = (Class)DIVerificationSessionContext;
    v15 = -[DIVerificationSessionContext init](&v18, sel_init);
    v16 = v15;
    if (v15)
    {
      v15->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v15->_serviceName, a3);
      objc_storeStrong((id *)&v16->_tier, a4);
      objc_storeStrong((id *)&v16->_serviceURL, a5);
      objc_storeStrong((id *)&v16->_httpHeaders, a6);
    }
  }
  else
  {

    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceName, CFSTR("serviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tier, CFSTR("tier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceURL, CFSTR("serviceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_httpHeaders, CFSTR("httpHeaders"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_regionCode, CFSTR("regionCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_invocationReason, CFSTR("invocationReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredLanguages, CFSTR("preferredLanguages"));

  os_unfair_lock_unlock(p_lock);
}

- (DIVerificationSessionContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  DIVerificationSessionContext *v12;
  uint64_t v13;
  NSString *regionCode;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *preferredLanguages;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("httpHeaders"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[DIVerificationSessionContext initWithName:tier:serviceUrl:httpHeaders:](self, "initWithName:tier:serviceUrl:httpHeaders:", v5, v6, v7, v11);
  if (v12)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regionCode"));
    v13 = objc_claimAutoreleasedReturnValue();
    regionCode = v12->_regionCode;
    v12->_regionCode = (NSString *)v13;

    v12->_invocationReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("invocationReason"));
    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("preferredLanguages"));
    v18 = objc_claimAutoreleasedReturnValue();
    preferredLanguages = v12->_preferredLanguages;
    v12->_preferredLanguages = (NSArray *)v18;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setServiceName:(id)a3
{
  NSString *v4;
  NSString *serviceName;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serviceName != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    serviceName = self->_serviceName;
    self->_serviceName = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setTier:(id)a3
{
  NSString *v4;
  NSString *tier;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_tier != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    tier = self->_tier;
    self->_tier = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setServiceURL:(id)a3
{
  NSString *v4;
  NSString *serviceURL;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serviceURL != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    serviceURL = self->_serviceURL;
    self->_serviceURL = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setHttpHeaders:(id)a3
{
  NSDictionary *v4;
  NSDictionary *httpHeaders;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_httpHeaders != v6)
  {
    v4 = (NSDictionary *)-[NSDictionary copyWithZone:](v6, "copyWithZone:", 0);
    httpHeaders = self->_httpHeaders;
    self->_httpHeaders = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setRegionCode:(id)a3
{
  NSString *v4;
  NSString *regionCode;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_regionCode != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    regionCode = self->_regionCode;
    self->_regionCode = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setInvocationReason:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invocationReason = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setPreferredLanguages:(id)a3
{
  NSArray *v4;
  NSArray *preferredLanguages;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_preferredLanguages != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    preferredLanguages = self->_preferredLanguages;
    self->_preferredLanguages = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)serviceName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_serviceName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)tier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_tier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)serviceURL
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_serviceURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)httpHeaders
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_httpHeaders;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)regionCode
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_regionCode;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)invocationReason
{
  os_unfair_lock_s *p_lock;
  unint64_t invocationReason;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  invocationReason = self->_invocationReason;
  os_unfair_lock_unlock(p_lock);
  return invocationReason;
}

- (NSArray)preferredLanguages
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_preferredLanguages;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
  objc_storeStrong((id *)&self->_tier, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
