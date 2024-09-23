@implementation PARLookupRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARLookupRequest;
  v4 = a3;
  -[PARRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryString, CFSTR("query"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryContext, CFSTR("queryContext"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_domain, CFSTR("lookupDomain"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_lookupSelectionType, CFSTR("lookupSelectionType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appBundleId, CFSTR("appBundleId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredLanguage, CFSTR("preferredLanguage"));

}

- (PARLookupRequest)initWithCoder:(id)a3
{
  id v4;
  PARLookupRequest *v5;
  uint64_t v6;
  NSString *queryString;
  uint64_t v8;
  NSString *queryContext;
  uint64_t v10;
  NSString *domain;
  uint64_t v12;
  NSString *appBundleId;
  uint64_t v14;
  NSString *preferredLanguage;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PARLookupRequest;
  v5 = -[PARRequest initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query"));
    v6 = objc_claimAutoreleasedReturnValue();
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    queryContext = v5->_queryContext;
    v5->_queryContext = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lookupDomain"));
    v10 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v10;

    v5->_lookupSelectionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lookupSelectionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleId"));
    v12 = objc_claimAutoreleasedReturnValue();
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredLanguage"));
    v14 = objc_claimAutoreleasedReturnValue();
    preferredLanguage = v5->_preferredLanguage;
    v5->_preferredLanguage = (NSString *)v14;

  }
  return v5;
}

- (unsigned)nwActivityLabel
{
  return 9;
}

- (Class)responseClass
{
  _os_feature_enabled_impl();
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)queryContext
{
  return self->_queryContext;
}

- (void)setQueryContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)lookupSelectionType
{
  return self->_lookupSelectionType;
}

- (void)setLookupSelectionType:(int64_t)a3
{
  self->_lookupSelectionType = a3;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (void)setPreferredLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLanguage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
