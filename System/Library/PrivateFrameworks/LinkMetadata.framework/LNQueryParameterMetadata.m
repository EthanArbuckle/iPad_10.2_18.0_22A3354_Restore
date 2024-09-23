@implementation LNQueryParameterMetadata

- (LNQueryParameterMetadata)initWithPropertyIdentifier:(id)a3 localizedTitle:(id)a4 comparators:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  LNQueryParameterMetadata *v13;
  uint64_t v14;
  NSString *propertyIdentifier;
  uint64_t v16;
  LNStaticDeferredLocalizedString *localizedTitle;
  uint64_t v18;
  NSArray *comparators;
  LNQueryParameterMetadata *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryParameterMetadata.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNQueryParameterMetadata.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("comparators"));

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)LNQueryParameterMetadata;
  v13 = -[LNQueryParameterMetadata init](&v24, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v9, "copy");
    propertyIdentifier = v13->_propertyIdentifier;
    v13->_propertyIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    localizedTitle = v13->_localizedTitle;
    v13->_localizedTitle = (LNStaticDeferredLocalizedString *)v16;

    v18 = objc_msgSend(v12, "copy");
    comparators = v13->_comparators;
    v13->_comparators = (NSArray *)v18;

    v20 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparators, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_propertyIdentifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNQueryParameterMetadata propertyIdentifier](self, "propertyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("propertyIdentifier"));

  -[LNQueryParameterMetadata localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localizedTitle"));

  -[LNQueryParameterMetadata comparators](self, "comparators");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("comparators"));

}

- (LNQueryParameterMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LNQueryParameterMetadata *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("comparators"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v6 && v10)
  {
    self = -[LNQueryParameterMetadata initWithPropertyIdentifier:localizedTitle:comparators:](self, "initWithPropertyIdentifier:localizedTitle:comparators:", v5, v6, v10);
    v11 = self;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryParameterMetadata propertyIdentifier](self, "propertyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryParameterMetadata localizedTitle](self, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryParameterMetadata comparators](self, "comparators");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, propertyIdentifier: %@, localizedTitle: %@, comparators: [%@]>"), v5, self, v6, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[LNQueryParameterMetadata propertyIdentifier](self, "propertyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNQueryParameterMetadata title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNQueryParameterMetadata comparators](self, "comparators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  LNQueryParameterMetadata *v4;
  LNQueryParameterMetadata *v5;
  LNQueryParameterMetadata *v6;
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
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (LNQueryParameterMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[LNQueryParameterMetadata propertyIdentifier](self, "propertyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryParameterMetadata propertyIdentifier](v6, "propertyIdentifier");
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
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[LNQueryParameterMetadata localizedTitle](self, "localizedTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryParameterMetadata localizedTitle](v6, "localizedTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqual:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[LNQueryParameterMetadata comparators](self, "comparators");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryParameterMetadata comparators](v6, "comparators");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqualToArray:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (NSString)propertyIdentifier
{
  return self->_propertyIdentifier;
}

- (LNStaticDeferredLocalizedString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSArray)comparators
{
  return self->_comparators;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[LNQueryParameterMetadata localizedTitle](self, "localizedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (LNQueryParameterMetadata)initWithPropertyIdentifier:(id)a3 title:(id)a4 comparators:(id)a5
{
  id v8;
  id v9;
  id v10;
  LNStaticDeferredLocalizedString *v11;
  LNQueryParameterMetadata *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[LNStaticDeferredLocalizedString initWithLocalizedKey:bundleIdentifier:bundleURL:table:]([LNStaticDeferredLocalizedString alloc], "initWithLocalizedKey:bundleIdentifier:bundleURL:table:", v9, 0, 0, 0);

  v12 = -[LNQueryParameterMetadata initWithPropertyIdentifier:localizedTitle:comparators:](self, "initWithPropertyIdentifier:localizedTitle:comparators:", v10, v11, v8);
  return v12;
}

@end
