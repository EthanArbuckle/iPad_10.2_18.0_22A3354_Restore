@implementation CTAppDataUsage

- (id)init:(id)a3 withDisplayName:(id)a4 andUsage:(id)a5
{
  id v9;
  id v10;
  id v11;
  CTAppDataUsage *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CTAppDataUsage;
  v12 = -[CTAppDataUsage init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleId, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (id)usage
{
  void *v2;
  void *v3;

  -[CTAppDataUsage used](self, "used");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "native");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CTAppDataUsage bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTAppDataUsage displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTAppDataUsage used](self, "used");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "init:withDisplayName:andUsage:", v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CTAppDataUsage bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdKey"));

  -[CTAppDataUsage displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayNameKey"));

  -[CTAppDataUsage used](self, "used");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("usageKey"));

}

- (CTAppDataUsage)initWithCoder:(id)a3
{
  id v4;
  CTAppDataUsage *v5;
  uint64_t v6;
  NSString *bundleId;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  CTDataUsed *used;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTAppDataUsage;
  v5 = -[CTAppDataUsage init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usageKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    used = v5->_used;
    v5->_used = (CTDataUsed *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (CTDataUsed)used
{
  return self->_used;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_used, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
