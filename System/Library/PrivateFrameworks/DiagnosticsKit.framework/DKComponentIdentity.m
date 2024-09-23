@implementation DKComponentIdentity

+ (id)componentIdentityWithDomain:(id)a3 version:(id)a4 resources:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDomain:version:resources:", v10, v9, v8);

  return v11;
}

- (DKComponentIdentity)initWithDomain:(id)a3 version:(id)a4 resources:(id)a5
{
  id v9;
  id v10;
  id v11;
  DKComponentIdentity *v12;
  uint64_t v13;
  DKCanonicalVersion *version;
  void *v15;
  uint64_t v16;
  NSString *type;
  uint64_t v18;
  NSString *identifier;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DKComponentIdentity;
  v12 = -[DKComponentIdentity init](&v21, sel_init);
  if (v12)
  {
    +[DKCanonicalVersion canonicalVersionWithString:](DKCanonicalVersion, "canonicalVersionWithString:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    version = v12->_version;
    v12->_version = (DKCanonicalVersion *)v13;

    objc_storeStrong((id *)&v12->_domain, a3);
    objc_storeStrong((id *)&v12->_resources, a5);
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = objc_claimAutoreleasedReturnValue();
    type = v12->_type;
    v12->_type = (NSString *)v16;

    if ((unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v18 = objc_claimAutoreleasedReturnValue();
      identifier = v12->_identifier;
      v12->_identifier = (NSString *)v18;

    }
  }

  return v12;
}

+ (id)componentIdentityWithType:(id)a3 identifier:(id)a4 version:(id)a5 resources:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:identifier:version:resources:", v13, v12, v11, v10);

  return v14;
}

- (DKComponentIdentity)initWithType:(id)a3 identifier:(id)a4 version:(id)a5 resources:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DKComponentIdentity *v15;
  uint64_t v16;
  DKCanonicalVersion *version;
  id *p_domain;
  void *v19;
  uint64_t v20;
  id v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)DKComponentIdentity;
  v15 = -[DKComponentIdentity init](&v23, sel_init);
  if (v15)
  {
    +[DKCanonicalVersion canonicalVersionWithString:](DKCanonicalVersion, "canonicalVersionWithString:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    version = v15->_version;
    v15->_version = (DKCanonicalVersion *)v16;

    objc_storeStrong((id *)&v15->_type, a3);
    objc_storeStrong((id *)&v15->_identifier, a4);
    objc_storeStrong((id *)&v15->_resources, a6);
    p_domain = (id *)&v15->_domain;
    objc_storeStrong((id *)&v15->_domain, a3);
    if (v12)
    {
      objc_msgSend(*p_domain, "stringByAppendingString:", CFSTR("."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingString:", v12);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *p_domain;
      *p_domain = (id)v20;

    }
  }

  return v15;
}

- (BOOL)isNewerThan:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DKComponentIdentity version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isNewerThan:", v6);
  return (char)v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; domain: %@, version: %@>"),
    v5,
    self,
    self->_domain,
    self->_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKComponentIdentity)initWithCoder:(id)a3
{
  id v4;
  DKComponentIdentity *v5;
  uint64_t v6;
  DKCanonicalVersion *version;
  uint64_t v8;
  NSString *type;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *domain;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSSet *resources;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DKComponentIdentity;
  v5 = -[DKComponentIdentity init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (DKCanonicalVersion *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v12 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("resources"));
    v17 = objc_claimAutoreleasedReturnValue();
    resources = v5->_resources;
    v5->_resources = (NSSet *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[DKComponentIdentity version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("version"));

  -[DKComponentIdentity type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("type"));

  -[DKComponentIdentity identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("identifier"));

  -[DKComponentIdentity domain](self, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("domain"));

  -[DKComponentIdentity resources](self, "resources");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("resources"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DKCanonicalVersion copyWithZone:](self->_version, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSSet copyWithZone:](self->_resources, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DKComponentIdentity domain](self, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToComponentIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DKComponentIdentity domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  DKComponentIdentity *v4;
  BOOL v5;

  v4 = (DKComponentIdentity *)a3;
  v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[DKComponentIdentity isEqualToComponentIdentity:](self, "isEqualToComponentIdentity:", v4);

  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)domain
{
  return self->_domain;
}

- (DKCanonicalVersion)version
{
  return self->_version;
}

- (NSSet)resources
{
  return self->_resources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
