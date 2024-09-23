@implementation LNPlayVideoSystemProtocolMetadata

- (LNPlayVideoSystemProtocolMetadata)initWithSupportedCategories:(id)a3
{
  id v5;
  LNPlayVideoSystemProtocolMetadata *v6;
  LNPlayVideoSystemProtocolMetadata *v7;
  LNPlayVideoSystemProtocolMetadata *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNPlayVideoSystemProtocolMetadata;
  v6 = -[LNPlayVideoSystemProtocolMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_supportedCategories, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNPlayVideoSystemProtocolMetadata supportedCategories](self, "supportedCategories");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("supportedCategories"));

}

- (LNPlayVideoSystemProtocolMetadata)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  LNPlayVideoSystemProtocolMetadata *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("supportedCategories"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[LNPlayVideoSystemProtocolMetadata initWithSupportedCategories:](self, "initWithSupportedCategories:", v8);
  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPlayVideoSystemProtocolMetadata supportedCategories](self, "supportedCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, supportedCategories: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNPlayVideoSystemProtocolMetadata supportedCategories](self, "supportedCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNPlayVideoSystemProtocolMetadata *v4;
  LNPlayVideoSystemProtocolMetadata *v5;
  LNPlayVideoSystemProtocolMetadata *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (LNPlayVideoSystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNPlayVideoSystemProtocolMetadata supportedCategories](self, "supportedCategories");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNPlayVideoSystemProtocolMetadata supportedCategories](v6, "supportedCategories");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToArray:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSArray)supportedCategories
{
  return self->_supportedCategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCategories, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
