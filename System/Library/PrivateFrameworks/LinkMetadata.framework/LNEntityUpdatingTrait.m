@implementation LNEntityUpdatingTrait

- (LNEntityUpdatingTrait)initWithEntityIdentifier:(id)a3
{
  id v4;
  LNEntityUpdatingTrait *v5;
  uint64_t v6;
  NSString *entityIdentifier;
  LNEntityUpdatingTrait *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNEntityUpdatingTrait;
  v5 = -[LNEntityUpdatingTrait init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    entityIdentifier = v5->_entityIdentifier;
    v5->_entityIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNEntityUpdatingTrait entityIdentifier](self, "entityIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entityIdentifier"));

}

- (LNEntityUpdatingTrait)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNEntityUpdatingTrait *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LNEntityUpdatingTrait initWithEntityIdentifier:](self, "initWithEntityIdentifier:", v5);
  return v6;
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
  -[LNEntityUpdatingTrait entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, entity: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNEntityUpdatingTrait entityIdentifier](self, "entityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNEntityUpdatingTrait *v4;
  LNEntityUpdatingTrait *v5;
  LNEntityUpdatingTrait *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (LNEntityUpdatingTrait *)a3;
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
      -[LNEntityUpdatingTrait entityIdentifier](self, "entityIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNEntityUpdatingTrait entityIdentifier](v6, "entityIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
