@implementation BSServiceFeatureFlag

- (BSServiceFeatureFlag)initWithDomain:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  BSServiceFeatureFlag *v8;
  uint64_t v9;
  NSString *domain;
  uint64_t v11;
  NSString *featureName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BSServiceFeatureFlag;
  v8 = -[BSServiceFeatureFlag init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEnabled
{
  if (__explicitResolver)
    return (*(uint64_t (**)(void))(__explicitResolver + 16))();
  -[NSString UTF8String](self->_domain, "UTF8String");
  -[NSString UTF8String](self->_featureName, "UTF8String");
  return _os_feature_enabled_impl();
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_domain, CFSTR("domain"));
  objc_msgSend(v3, "appendString:withName:", self->_featureName, CFSTR("featureName"));
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
