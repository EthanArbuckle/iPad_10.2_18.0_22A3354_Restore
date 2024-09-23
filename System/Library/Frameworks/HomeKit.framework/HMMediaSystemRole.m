@implementation HMMediaSystemRole

- (HMMediaSystemRole)initWithDictionary:(id)a3
{
  void *v4;
  HMMediaSystemRole *v5;

  objc_msgSend(a3, "hmf_numberForKey:", kMediaSystemRoleTypeCodingKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMMediaSystemRole initWithRole:](self, "initWithRole:", objc_msgSend(v4, "unsignedIntegerValue"));

  return v5;
}

- (HMMediaSystemRole)initWithRole:(unint64_t)a3
{
  HMMediaSystemRole *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMMediaSystemRole;
  result = -[HMMediaSystemRole init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;
  uint64_t v7;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = objc_msgSend(v4, "type");
    v6 = v7 == -[HMMediaSystemRole type](self, "type");
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  HMMediaSystemRoleTypeAsString(-[HMMediaSystemRole type](self, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  HMMediaSystemRoleTypeAsString(-[HMMediaSystemRole type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMMediaSystemRole type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, kMediaSystemRoleTypeCodingKey);

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (HMMediaSystemRole)initWithCoder:(id)a3
{
  id v4;
  HMMediaSystemRole *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMMediaSystemRole;
  v5 = -[HMMediaSystemRole init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kMediaSystemRoleTypeCodingKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[HMMediaSystemRole type](self, "type"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, kMediaSystemRoleTypeCodingKey);

}

- (unint64_t)type
{
  return self->_type;
}

+ (id)leftRole
{
  return -[HMMediaSystemRole initWithRole:]([HMMediaSystemRole alloc], "initWithRole:", 1);
}

+ (id)rightRole
{
  return -[HMMediaSystemRole initWithRole:]([HMMediaSystemRole alloc], "initWithRole:", 2);
}

+ (BOOL)roleFromDictionary:(id)a3 roleOutput:(unint64_t *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "hmf_numberForKey:", kMediaSystemRoleTypeCodingKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    *a4 = objc_msgSend(v5, "integerValue");

  return v6 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
