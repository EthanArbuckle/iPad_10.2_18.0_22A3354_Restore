@implementation CTRoadsideProviders

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTRoadsideProviders providers](self, "providers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", providers=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTRoadsideProviders providers](self, "providers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTRoadsideProviders *v4;
  BOOL v5;

  v4 = (CTRoadsideProviders *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTRoadsideProviders isEqualToProviders:](self, "isEqualToProviders:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTRoadsideProviders providers](self, "providers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setProviders:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTRoadsideProviders providers](self, "providers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("providers"));

}

- (CTRoadsideProviders)initWithCoder:(id)a3
{
  id v4;
  CTRoadsideProviders *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *providers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTRoadsideProviders;
  v5 = -[CTRoadsideProviders init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("providers"));
    v10 = objc_claimAutoreleasedReturnValue();
    providers = v5->_providers;
    v5->_providers = (NSDictionary *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
  objc_storeStrong((id *)&self->_providers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
}

@end
