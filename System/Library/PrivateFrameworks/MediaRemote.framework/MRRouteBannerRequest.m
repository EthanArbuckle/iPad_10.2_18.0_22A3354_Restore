@implementation MRRouteBannerRequest

+ (id)requestWithStaticRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "routeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRouteIdentifier:staticRequest:", v6, v4);

  return v7;
}

- (MRRouteBannerRequest)initWithRouteIdentifier:(id)a3 staticRequest:(id)a4
{
  id v6;
  id v7;
  MRRouteBannerRequest *v8;
  MRRouteBannerRequest *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRRouteBannerRequest;
  v8 = -[MRBaseBannerRequest initWithBundleIdentifierAffinity:](&v11, sel_initWithBundleIdentifierAffinity_, 0);
  v9 = v8;
  if (v8)
  {
    -[MRRouteBannerRequest setRouteIdentifier:](v8, "setRouteIdentifier:", v6);
    -[MRRouteBannerRequest setStaticRequest:](v9, "setStaticRequest:", v7);
  }

  return v9;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ (%p): "), v5, self);

  -[MRBaseBannerRequest requestIdentifier](self, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" requestIdentifier: %@"), v7);

  -[MRRouteBannerRequest routeIdentifier](self, "routeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" routeIdentifier: %@"), v8);

  -[MRBaseBannerRequest bundleIdentifierAffinity](self, "bundleIdentifierAffinity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" bundleIdentifierAffinity: %@"), v9);

  objc_msgSend(v6, "appendFormat:", CFSTR(" bannerType: %lu"), -[MRRouteBannerRequest bannerType](self, "bannerType"));
  -[MRRouteBannerRequest staticRequest](self, "staticRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("<none>");
  if (v11)
    v13 = (const __CFString *)v11;
  objc_msgSend(v6, "appendFormat:", CFSTR(" staticRequest: %@"), v13);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRRouteBannerRequest;
  v4 = a3;
  -[MRBaseBannerRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[MRRouteBannerRequest routeIdentifier](self, "routeIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("odid"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[MRRouteBannerRequest bannerType](self, "bannerType"), CFSTR("rbt"));
  -[MRRouteBannerRequest staticRequest](self, "staticRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sr"));

}

- (MRRouteBannerRequest)initWithCoder:(id)a3
{
  id v3;
  MRRouteBannerRequest *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRRouteBannerRequest;
  v3 = a3;
  v4 = -[MRBaseBannerRequest initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odid"), v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRRouteBannerRequest setRouteIdentifier:](v4, "setRouteIdentifier:", v5);

  -[MRRouteBannerRequest setBannerType:](v4, "setBannerType:", objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("rbt")));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sr"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRRouteBannerRequest setStaticRequest:](v4, "setStaticRequest:", v6);
  return v4;
}

- (NSString)routeIdentifier
{
  return self->_routeIdentifier;
}

- (void)setRouteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_routeIdentifier, a3);
}

- (unint64_t)bannerType
{
  return self->_bannerType;
}

- (void)setBannerType:(unint64_t)a3
{
  self->_bannerType = a3;
}

- (MRStaticRouteBannerRequest)staticRequest
{
  return self->_staticRequest;
}

- (void)setStaticRequest:(id)a3
{
  objc_storeStrong((id *)&self->_staticRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticRequest, 0);
  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

@end
