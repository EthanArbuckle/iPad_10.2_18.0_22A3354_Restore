@implementation MRBaseBannerRequest

+ (id)requestWithBundleIdentifierAffinity:(id)a3
{
  id v3;
  MRBaseBannerRequest *v4;

  v3 = a3;
  v4 = -[MRBaseBannerRequest initWithBundleIdentifierAffinity:]([MRBaseBannerRequest alloc], "initWithBundleIdentifierAffinity:", v3);

  return v4;
}

- (MRBaseBannerRequest)initWithBundleIdentifierAffinity:(id)a3
{
  id v4;
  MRBaseBannerRequest *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRBaseBannerRequest;
  v5 = -[MRBaseBannerRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseBannerRequest setRequestIdentifier:](v5, "setRequestIdentifier:", v7);

    -[MRBaseBannerRequest setBundleIdentifierAffinity:](v5, "setBundleIdentifierAffinity:", v4);
  }

  return v5;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ (%p): "), v5, self);

  -[MRBaseBannerRequest requestIdentifier](self, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" requestIdentifier: %@"), v7);

  -[MRBaseBannerRequest bundleIdentifierAffinity](self, "bundleIdentifierAffinity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" bundleIdentifierAffinity: %@"), v8);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MRBaseBannerRequest requestIdentifier](self, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rid"));

  -[MRBaseBannerRequest bundleIdentifierAffinity](self, "bundleIdentifierAffinity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bida"));

}

- (MRBaseBannerRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRBaseBannerRequest setRequestIdentifier:](self, "setRequestIdentifier:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bida"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRBaseBannerRequest setBundleIdentifierAffinity:](self, "setBundleIdentifierAffinity:", v6);
  return self;
}

- (BOOL)isEqual:(id)a3
{
  MRBaseBannerRequest *v4;
  MRBaseBannerRequest *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MRBaseBannerRequest *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRBaseBannerRequest requestIdentifier](self, "requestIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRBaseBannerRequest requestIdentifier](v5, "requestIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MRBaseBannerRequest requestIdentifier](self, "requestIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSString)bundleIdentifierAffinity
{
  return self->_bundleIdentifierAffinity;
}

- (void)setBundleIdentifierAffinity:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifierAffinity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierAffinity, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
