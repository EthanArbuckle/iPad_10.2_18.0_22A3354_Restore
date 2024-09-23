@implementation LNQuerySortingOptionMetadata

- (LNQuerySortingOptionMetadata)initWithPropertyIdentifier:(id)a3 entityType:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNQuerySortingOptionMetadata *v10;
  uint64_t v11;
  NSString *propertyIdentifier;
  uint64_t v13;
  NSString *entityType;
  LNQuerySortingOptionMetadata *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQuerySortingOptionMetadata.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQuerySortingOptionMetadata.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityType"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNQuerySortingOptionMetadata;
  v10 = -[LNQuerySortingOptionMetadata init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    propertyIdentifier = v10->_propertyIdentifier;
    v10->_propertyIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    entityType = v10->_entityType;
    v10->_entityType = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_propertyIdentifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNQuerySortingOptionMetadata propertyIdentifier](self, "propertyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("propertyIdentifier"));

  -[LNQuerySortingOptionMetadata entityType](self, "entityType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("entityType"));

}

- (LNQuerySortingOptionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  LNQuerySortingOptionMetadata *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[LNQuerySortingOptionMetadata initWithPropertyIdentifier:entityType:](self, "initWithPropertyIdentifier:entityType:", v5, v6);
    v8 = self;
  }

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
  -[LNQuerySortingOptionMetadata propertyIdentifier](self, "propertyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQuerySortingOptionMetadata entityType](self, "entityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, propertyIdentifier: %@, entityType: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNQuerySortingOptionMetadata propertyIdentifier](self, "propertyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNQuerySortingOptionMetadata entityType](self, "entityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNQuerySortingOptionMetadata *v4;
  LNQuerySortingOptionMetadata *v5;
  LNQuerySortingOptionMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (LNQuerySortingOptionMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[LNQuerySortingOptionMetadata propertyIdentifier](self, "propertyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQuerySortingOptionMetadata propertyIdentifier](v6, "propertyIdentifier");
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
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNQuerySortingOptionMetadata entityType](self, "entityType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQuerySortingOptionMetadata entityType](v6, "entityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (NSString)propertyIdentifier
{
  return self->_propertyIdentifier;
}

- (NSString)entityType
{
  return self->_entityType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNQuerySortingOptionMetadata)initWithTitle:(id)a3 propertyIdentifier:(id)a4 entityType:(id)a5
{
  return -[LNQuerySortingOptionMetadata initWithPropertyIdentifier:entityType:](self, "initWithPropertyIdentifier:entityType:", a4, a5);
}

- (LNStaticDeferredLocalizedString)title
{
  return -[LNStaticDeferredLocalizedString initWithKey:table:bundleURL:]([LNStaticDeferredLocalizedString alloc], "initWithKey:table:bundleURL:", &stru_1E39A2988, &stru_1E39A2988, 0);
}

@end
