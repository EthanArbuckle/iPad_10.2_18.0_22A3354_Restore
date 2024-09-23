@implementation MRGroupSessionBannerRequest

+ (id)requestWithBundleIdentifierAffinity:(id)a3 hostDisplayName:(id)a4 routeType:(unsigned __int8)a5
{
  uint64_t v5;
  id v7;
  id v8;
  MRGroupSessionBannerRequest *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[MRGroupSessionBannerRequest initWithBundleIdentifierAffinity:hostDisplayName:routeType:]([MRGroupSessionBannerRequest alloc], "initWithBundleIdentifierAffinity:hostDisplayName:routeType:", v8, v7, v5);

  return v9;
}

- (MRGroupSessionBannerRequest)initWithBundleIdentifierAffinity:(id)a3 hostDisplayName:(id)a4 routeType:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  MRGroupSessionBannerRequest *v9;
  MRGroupSessionBannerRequest *v10;
  objc_super v12;

  v5 = a5;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRGroupSessionBannerRequest;
  v9 = -[MRBaseBannerRequest initWithBundleIdentifierAffinity:](&v12, sel_initWithBundleIdentifierAffinity_, a3);
  v10 = v9;
  if (v9)
  {
    -[MRGroupSessionBannerRequest setHostDisplayName:](v9, "setHostDisplayName:", v8);
    -[MRGroupSessionBannerRequest setRouteType:](v10, "setRouteType:", v5);
  }

  return v10;
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

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ (%p): "), v5, self);

  -[MRBaseBannerRequest requestIdentifier](self, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" requestIdentifier: %@"), v7);

  -[MRGroupSessionBannerRequest hostDisplayName](self, "hostDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" hostDisplayName: %@"), v8);

  MRGroupSessionRouteTypeDescription(self->_routeType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" routeType: %@"), v9);

  -[MRBaseBannerRequest bundleIdentifierAffinity](self, "bundleIdentifierAffinity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" bundleIdentifierAffinity: %@"), v10);

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
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRGroupSessionBannerRequest;
  v4 = a3;
  -[MRBaseBannerRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[MRGroupSessionBannerRequest hostDisplayName](self, "hostDisplayName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("hdn"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MRGroupSessionBannerRequest routeType](self, "routeType"), CFSTR("rt"));
}

- (MRGroupSessionBannerRequest)initWithCoder:(id)a3
{
  id v3;
  MRGroupSessionBannerRequest *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRGroupSessionBannerRequest;
  v3 = a3;
  v4 = -[MRBaseBannerRequest initWithCoder:](&v7, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hdn"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRGroupSessionBannerRequest setHostDisplayName:](v4, "setHostDisplayName:", v5);

  LOBYTE(v5) = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("rt"));
  -[MRGroupSessionBannerRequest setRouteType:](v4, "setRouteType:", v5);
  return v4;
}

- (NSString)hostDisplayName
{
  return self->_hostDisplayName;
}

- (void)setHostDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_hostDisplayName, a3);
}

- (unsigned)routeType
{
  return self->_routeType;
}

- (void)setRouteType:(unsigned __int8)a3
{
  self->_routeType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostDisplayName, 0);
}

@end
