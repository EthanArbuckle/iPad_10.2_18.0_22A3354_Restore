@implementation LNAppShortcutParameterPresentationMetadata

- (LNAppShortcutParameterPresentationMetadata)initWithParameterIdentifier:(id)a3 specificTitle:(id)a4 localizationTable:(id)a5 optionsCollection:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNAppShortcutParameterPresentationMetadata *v15;
  uint64_t v16;
  NSString *parameterIdentifier;
  uint64_t v18;
  LNActionSummaryString *specificTitle;
  uint64_t v20;
  NSString *localizationTable;
  uint64_t v22;
  NSArray *optionsCollection;
  LNAppShortcutParameterPresentationMetadata *v24;
  void *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutParameterPresentationMetadata.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterIdentifier"));

  }
  v27.receiver = self;
  v27.super_class = (Class)LNAppShortcutParameterPresentationMetadata;
  v15 = -[LNAppShortcutParameterPresentationMetadata init](&v27, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    parameterIdentifier = v15->_parameterIdentifier;
    v15->_parameterIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    specificTitle = v15->_specificTitle;
    v15->_specificTitle = (LNActionSummaryString *)v18;

    v20 = objc_msgSend(v13, "copy");
    localizationTable = v15->_localizationTable;
    v15->_localizationTable = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    optionsCollection = v15->_optionsCollection;
    v15->_optionsCollection = (NSArray *)v22;

    v24 = v15;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNAppShortcutParameterPresentationMetadata parameterIdentifier](self, "parameterIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterIdentifier"));

  -[LNAppShortcutParameterPresentationMetadata specificTitle](self, "specificTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("specificTitle"));

  -[LNAppShortcutParameterPresentationMetadata localizationTable](self, "localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("localizationTable"));

  -[LNAppShortcutParameterPresentationMetadata optionsCollection](self, "optionsCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("optionsCollection"));

}

- (LNAppShortcutParameterPresentationMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  LNAppShortcutParameterPresentationMetadata *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specificTitle"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizationTable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("optionsCollection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[LNAppShortcutParameterPresentationMetadata initWithParameterIdentifier:specificTitle:localizationTable:optionsCollection:](self, "initWithParameterIdentifier:specificTitle:localizationTable:optionsCollection:", v5, v7, v9, v13);
    v14 = self;
  }

  return v14;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutParameterPresentationMetadata parameterIdentifier](self, "parameterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutParameterPresentationMetadata specificTitle](self, "specificTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutParameterPresentationMetadata localizationTable](self, "localizationTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutParameterPresentationMetadata optionsCollection](self, "optionsCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, parameterIdentifier: %@, specificTitle: %@, localizationTable: %@, optionsCollection: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[LNAppShortcutParameterPresentationMetadata parameterIdentifier](self, "parameterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNAppShortcutParameterPresentationMetadata specificTitle](self, "specificTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNAppShortcutParameterPresentationMetadata localizationTable](self, "localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNAppShortcutParameterPresentationMetadata optionsCollection](self, "optionsCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNAppShortcutParameterPresentationMetadata *v4;
  LNAppShortcutParameterPresentationMetadata *v5;
  LNAppShortcutParameterPresentationMetadata *v6;
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
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v31;
  void *v32;

  v4 = (LNAppShortcutParameterPresentationMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    -[LNAppShortcutParameterPresentationMetadata parameterIdentifier](self, "parameterIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutParameterPresentationMetadata parameterIdentifier](v6, "parameterIdentifier");
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
        goto LABEL_33;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[LNAppShortcutParameterPresentationMetadata specificTitle](self, "specificTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutParameterPresentationMetadata specificTitle](v6, "specificTitle");
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
        goto LABEL_32;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    -[LNAppShortcutParameterPresentationMetadata localizationTable](self, "localizationTable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutParameterPresentationMetadata localizationTable](v6, "localizationTable");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v31 = v20;
    v32 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          v12 = objc_msgSend(v20, "isEqualToString:", v24);

          if (!v12)
          {
            v19 = v32;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      v20 = v31;
      v19 = v32;
      goto LABEL_32;
    }

LABEL_24:
    -[LNAppShortcutParameterPresentationMetadata optionsCollection](self, "optionsCollection", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutParameterPresentationMetadata optionsCollection](v6, "optionsCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v25 = v29;
    if (v28 == v29)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v29)
        LOBYTE(v12) = objc_msgSend(v28, "isEqualToArray:", v29);
    }

    v20 = v28;
    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (LNActionSummaryString)specificTitle
{
  return self->_specificTitle;
}

- (NSString)localizationTable
{
  return self->_localizationTable;
}

- (NSArray)optionsCollection
{
  return self->_optionsCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsCollection, 0);
  objc_storeStrong((id *)&self->_localizationTable, 0);
  objc_storeStrong((id *)&self->_specificTitle, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)genericTitle
{
  return (NSString *)&stru_1E39A2988;
}

- (LNAppShortcutParameterPresentationMetadata)initWithParameterIdentifier:(id)a3 specificTitle:(id)a4 genericTitle:(id)a5 localizationTable:(id)a6 optionsCollection:(id)a7
{
  return -[LNAppShortcutParameterPresentationMetadata initWithParameterIdentifier:specificTitle:localizationTable:optionsCollection:](self, "initWithParameterIdentifier:specificTitle:localizationTable:optionsCollection:", a3, a4, a6, a7);
}

@end
