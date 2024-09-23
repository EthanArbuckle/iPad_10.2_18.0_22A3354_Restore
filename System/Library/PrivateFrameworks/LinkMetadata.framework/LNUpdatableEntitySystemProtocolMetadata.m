@implementation LNUpdatableEntitySystemProtocolMetadata

- (LNUpdatableEntitySystemProtocolMetadata)initWithActionIdentifier:(id)a3
{
  id v5;
  LNUpdatableEntitySystemProtocolMetadata *v6;
  LNUpdatableEntitySystemProtocolMetadata *v7;
  LNUpdatableEntitySystemProtocolMetadata *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNUpdatableEntitySystemProtocolMetadata;
  v6 = -[LNUpdatableEntitySystemProtocolMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNUpdatableEntitySystemProtocolMetadata actionIdentifier](self, "actionIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionIdentifier"));

}

- (LNUpdatableEntitySystemProtocolMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNUpdatableEntitySystemProtocolMetadata *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LNUpdatableEntitySystemProtocolMetadata initWithActionIdentifier:](self, "initWithActionIdentifier:", v5);
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
  -[LNUpdatableEntitySystemProtocolMetadata actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, entity: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNUpdatableEntitySystemProtocolMetadata actionIdentifier](self, "actionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNUpdatableEntitySystemProtocolMetadata *v4;
  LNUpdatableEntitySystemProtocolMetadata *v5;
  LNUpdatableEntitySystemProtocolMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNUpdatableEntitySystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNUpdatableEntitySystemProtocolMetadata actionIdentifier](self, "actionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNUpdatableEntitySystemProtocolMetadata actionIdentifier](v6, "actionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
