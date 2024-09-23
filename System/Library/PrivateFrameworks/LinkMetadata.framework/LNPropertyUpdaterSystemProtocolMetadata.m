@implementation LNPropertyUpdaterSystemProtocolMetadata

- (LNPropertyUpdaterSystemProtocolMetadata)initWithEntityIdentifier:(id)a3 entityProperty:(id)a4
{
  id v7;
  id v8;
  LNPropertyUpdaterSystemProtocolMetadata *v9;
  LNPropertyUpdaterSystemProtocolMetadata *v10;
  LNPropertyUpdaterSystemProtocolMetadata *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNPropertyUpdaterSystemProtocolMetadata;
  v9 = -[LNPropertyUpdaterSystemProtocolMetadata init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityIdentifier, a3);
    objc_storeStrong((id *)&v10->_entityProperty, a4);
    v11 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNPropertyUpdaterSystemProtocolMetadata entityIdentifier](self, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entityIdentifier"));

  -[LNPropertyUpdaterSystemProtocolMetadata entityProperty](self, "entityProperty");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("entityProperty"));

}

- (LNPropertyUpdaterSystemProtocolMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNPropertyUpdaterSystemProtocolMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityProperty"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[LNPropertyUpdaterSystemProtocolMetadata initWithEntityIdentifier:entityProperty:](self, "initWithEntityIdentifier:entityProperty:", v5, v6);
  return v7;
}

- (NSString)description
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
  -[LNPropertyUpdaterSystemProtocolMetadata entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPropertyUpdaterSystemProtocolMetadata entityProperty](self, "entityProperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, entity: %@, property: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNPropertyUpdaterSystemProtocolMetadata entityIdentifier](self, "entityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNPropertyUpdaterSystemProtocolMetadata entityProperty](self, "entityProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNPropertyUpdaterSystemProtocolMetadata *v4;
  LNPropertyUpdaterSystemProtocolMetadata *v5;
  LNPropertyUpdaterSystemProtocolMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (LNPropertyUpdaterSystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNPropertyUpdaterSystemProtocolMetadata entityIdentifier](self, "entityIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNPropertyUpdaterSystemProtocolMetadata entityIdentifier](v6, "entityIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[LNPropertyUpdaterSystemProtocolMetadata entityProperty](self, "entityProperty");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNPropertyUpdaterSystemProtocolMetadata entityProperty](v6, "entityProperty");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)entityProperty
{
  return self->_entityProperty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityProperty, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
