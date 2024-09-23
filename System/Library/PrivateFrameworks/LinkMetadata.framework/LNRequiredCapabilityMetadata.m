@implementation LNRequiredCapabilityMetadata

- (LNRequiredCapabilityMetadata)initWithDomain:(id)a3 key:(id)a4 value:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  LNRequiredCapabilityMetadata *v12;
  uint64_t v13;
  NSString *domain;
  uint64_t v15;
  NSString *key;
  LNRequiredCapabilityMetadata *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNRequiredCapabilityMetadata.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domain"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNRequiredCapabilityMetadata.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)LNRequiredCapabilityMetadata;
  v12 = -[LNRequiredCapabilityMetadata init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    domain = v12->_domain;
    v12->_domain = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    key = v12->_key;
    v12->_key = (NSString *)v15;

    v12->_value = a5;
    v17 = v12;
  }

  return v12;
}

- (BOOL)value
{
  return self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (BOOL)isMobileGestaltCapability
{
  void *v2;
  char v3;

  -[LNRequiredCapabilityMetadata domain](self, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("MobileGestalt"));

  return v3;
}

- (BOOL)isFeatureFlagCapability
{
  void *v2;
  char v3;

  -[LNRequiredCapabilityMetadata domain](self, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("FeatureFlag"));

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[LNRequiredCapabilityMetadata domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNRequiredCapabilityMetadata key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDomain:key:value:", v5, v6, -[LNRequiredCapabilityMetadata value](self, "value"));

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LNRequiredCapabilityMetadata domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("domain"));

  -[LNRequiredCapabilityMetadata key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("key"));

  objc_msgSend(v6, "encodeBool:forKey:", -[LNRequiredCapabilityMetadata value](self, "value"), CFSTR("value"));
}

- (LNRequiredCapabilityMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  LNRequiredCapabilityMetadata *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("value"));

  v8 = -[LNRequiredCapabilityMetadata initWithDomain:key:value:](self, "initWithDomain:key:value:", v5, v6, v7);
  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNRequiredCapabilityMetadata domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNRequiredCapabilityMetadata key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, domain: %@, key: %@, value: %i>"), v5, self, v6, v7, -[LNRequiredCapabilityMetadata value](self, "value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[LNRequiredCapabilityMetadata domain](self, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNRequiredCapabilityMetadata key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[LNRequiredCapabilityMetadata value](self, "value");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LNRequiredCapabilityMetadata *v4;
  LNRequiredCapabilityMetadata *v5;
  LNRequiredCapabilityMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  _BOOL4 v19;

  v4 = (LNRequiredCapabilityMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[LNRequiredCapabilityMetadata domain](self, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNRequiredCapabilityMetadata domain](v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_20;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    -[LNRequiredCapabilityMetadata key](self, "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNRequiredCapabilityMetadata key](v6, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      if (!v14 || !v18)
      {

        LOBYTE(v12) = 0;
        goto LABEL_20;
      }
      v12 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v12)
        goto LABEL_20;
    }
    v19 = -[LNRequiredCapabilityMetadata value](self, "value");
    v12 = v19 ^ -[LNRequiredCapabilityMetadata value](v6, "value") ^ 1;
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v12) = 1;
LABEL_23:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
