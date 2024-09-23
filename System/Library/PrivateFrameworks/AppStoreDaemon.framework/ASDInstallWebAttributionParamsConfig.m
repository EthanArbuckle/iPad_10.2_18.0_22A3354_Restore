@implementation ASDInstallWebAttributionParamsConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *appAdamId;
  id v5;

  appAdamId = self->_appAdamId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appAdamId, CFSTR("1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adNetworkRegistrableDomain, CFSTR("2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_impressionId, CFSTR("3"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceWebRegistrableDomain, CFSTR("4"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("5"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_attributionContext, CFSTR("6"));

}

- (ASDInstallWebAttributionParamsConfig)initWithCoder:(id)a3
{
  id v4;
  ASDInstallWebAttributionParamsConfig *v5;
  uint64_t v6;
  NSNumber *appAdamId;
  uint64_t v8;
  NSString *adNetworkRegistrableDomain;
  uint64_t v10;
  NSString *impressionId;
  uint64_t v12;
  NSString *sourceWebRegistrableDomain;
  uint64_t v14;
  NSString *version;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDInstallWebAttributionParamsConfig;
  v5 = -[ASDInstallWebAttributionParamsConfig init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("1"));
    v6 = objc_claimAutoreleasedReturnValue();
    appAdamId = v5->_appAdamId;
    v5->_appAdamId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("2"));
    v8 = objc_claimAutoreleasedReturnValue();
    adNetworkRegistrableDomain = v5->_adNetworkRegistrableDomain;
    v5->_adNetworkRegistrableDomain = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("3"));
    v10 = objc_claimAutoreleasedReturnValue();
    impressionId = v5->_impressionId;
    v5->_impressionId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("4"));
    v12 = objc_claimAutoreleasedReturnValue();
    sourceWebRegistrableDomain = v5->_sourceWebRegistrableDomain;
    v5->_sourceWebRegistrableDomain = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("5"));
    v14 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v14;

    v5->_attributionContext = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("5"));
  }

  return v5;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_appAdamId, a3);
}

- (NSString)adNetworkRegistrableDomain
{
  return self->_adNetworkRegistrableDomain;
}

- (void)setAdNetworkRegistrableDomain:(id)a3
{
  objc_storeStrong((id *)&self->_adNetworkRegistrableDomain, a3);
}

- (NSString)impressionId
{
  return self->_impressionId;
}

- (void)setImpressionId:(id)a3
{
  objc_storeStrong((id *)&self->_impressionId, a3);
}

- (NSString)sourceWebRegistrableDomain
{
  return self->_sourceWebRegistrableDomain;
}

- (void)setSourceWebRegistrableDomain:(id)a3
{
  objc_storeStrong((id *)&self->_sourceWebRegistrableDomain, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (int64_t)attributionContext
{
  return self->_attributionContext;
}

- (void)setAttributionContext:(int64_t)a3
{
  self->_attributionContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_sourceWebRegistrableDomain, 0);
  objc_storeStrong((id *)&self->_impressionId, 0);
  objc_storeStrong((id *)&self->_adNetworkRegistrableDomain, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end
