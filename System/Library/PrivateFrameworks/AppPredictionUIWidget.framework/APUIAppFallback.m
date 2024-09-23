@implementation APUIAppFallback

- (APUIAppFallback)initWithBundleId:(id)a3
{
  id v4;
  APUIAppFallback *v5;
  uint64_t v6;
  NSString *bundleId;
  APUIAppFallback *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APUIAppFallback;
  v5 = -[APUIAppFallback init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (APUIAppFallback)initWithProactiveSuggestion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  NSString *bundleId;
  APUIAppFallback *v11;
  objc_super v13;

  v5 = a3;
  objc_msgSend(v5, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "executableType");

  if (v7 == 1
    && (v13.receiver = self,
        v13.super_class = (Class)APUIAppFallback,
        (self = -[APUIAppFallback init](&v13, sel_init)) != 0))
  {
    objc_msgSend(v5, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executableObject");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleId = self->_bundleId;
    self->_bundleId = v9;

    objc_storeStrong((id *)&self->_suggestion, a3);
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_bundleId, "hash");
}

- (BOOL)isEqual:(id)a3
{
  APUIAppFallback *v4;
  APUIAppFallback *v5;
  BOOL v6;

  v4 = (APUIAppFallback *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[APUIAppFallback isEqualToAPUIAppFallback:](self, "isEqualToAPUIAppFallback:", v5);

  return v6;
}

- (BOOL)isEqualToAPUIAppFallback:(id)a3
{
  NSString *bundleId;
  void *v4;

  bundleId = self->_bundleId;
  objc_msgSend(a3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(bundleId) = -[NSString isEqualToString:](bundleId, "isEqualToString:", v4);

  return (char)bundleId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
