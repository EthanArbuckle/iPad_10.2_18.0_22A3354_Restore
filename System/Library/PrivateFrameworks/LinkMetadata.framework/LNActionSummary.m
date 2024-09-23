@implementation LNActionSummary

- (id)localizedFormatStringForLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;
  LNStaticDeferredLocalizedString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LNStaticDeferredLocalizedString *v11;
  void *v12;

  v4 = a3;
  -[LNActionSummary summaryString](self, "summaryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [LNStaticDeferredLocalizedString alloc];
    -[LNActionSummary summaryString](self, "summaryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formatString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionSummary table](self, "table");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionSummary bundleURL](self, "bundleURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[LNStaticDeferredLocalizedString initWithKey:table:bundleURL:](v6, "initWithKey:table:bundleURL:", v8, v9, v10);

    -[LNStaticDeferredLocalizedString localizedStringForLocaleIdentifier:](v11, "localizedStringForLocaleIdentifier:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (LNActionSummaryString)summaryString
{
  return self->_summaryString;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNActionSummary summaryString](self, "summaryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("summaryString"));

  -[LNActionSummary bundleURL](self, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleURL"));

  -[LNActionSummary table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("table"));

  -[LNActionSummary otherParameterIdentifiers](self, "otherParameterIdentifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("otherParameterIdentifiers"));

}

- (NSString)table
{
  return self->_table;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSArray)otherParameterIdentifiers
{
  return self->_otherParameterIdentifiers;
}

- (LNActionSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LNActionSummary *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("otherParameterIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summaryString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("table"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[LNActionSummary initWithSummaryString:bundleURL:table:otherParameterIdentifiers:](self, "initWithSummaryString:bundleURL:table:otherParameterIdentifiers:", v9, v10, v11, v8);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (LNActionSummary)initWithSummaryString:(id)a3 bundleURL:(id)a4 table:(id)a5 otherParameterIdentifiers:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNActionSummary *v15;
  uint64_t v16;
  LNActionSummaryString *summaryString;
  uint64_t v18;
  NSURL *bundleURL;
  uint64_t v20;
  NSString *table;
  uint64_t v22;
  NSArray *otherParameterIdentifiers;
  LNActionSummary *v24;
  void *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionSummary.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherParameterIdentifiers"));

  }
  v27.receiver = self;
  v27.super_class = (Class)LNActionSummary;
  v15 = -[LNActionSummary init](&v27, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    summaryString = v15->_summaryString;
    v15->_summaryString = (LNActionSummaryString *)v16;

    v18 = objc_msgSend(v12, "copy");
    bundleURL = v15->_bundleURL;
    v15->_bundleURL = (NSURL *)v18;

    v20 = objc_msgSend(v13, "copy");
    table = v15->_table;
    v15->_table = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    otherParameterIdentifiers = v15->_otherParameterIdentifiers;
    v15->_otherParameterIdentifiers = (NSArray *)v22;

    v24 = v15;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherParameterIdentifiers, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)actionConfigurationByEvaluatingAction:(id)a3
{
  return -[LNActionSummary actionConfigurationByEvaluatingAction:context:](self, "actionConfigurationByEvaluatingAction:context:", a3, 0);
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
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionSummary summaryString](self, "summaryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionSummary bundleURL](self, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionSummary table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionSummary otherParameterIdentifiers](self, "otherParameterIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:", CFSTR("description"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, summaryString: %@, bundleURL: %@, table: %@, otherParameterIdentifiers: [%@]>"), v5, self, v6, v7, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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

  -[LNActionSummary summaryString](self, "summaryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNActionSummary bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNActionSummary table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNActionSummary otherParameterIdentifiers](self, "otherParameterIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNActionSummary *v4;
  LNActionSummary *v5;
  LNActionSummary *v6;
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

  v4 = (LNActionSummary *)a3;
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
    -[LNActionSummary summaryString](self, "summaryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionSummary summaryString](v6, "summaryString");
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
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[LNActionSummary bundleURL](self, "bundleURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionSummary bundleURL](v6, "bundleURL");
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
    -[LNActionSummary table](self, "table");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionSummary table](v6, "table");
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
          v12 = objc_msgSend(v20, "isEqual:", v24);

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
    -[LNActionSummary otherParameterIdentifiers](self, "otherParameterIdentifiers", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionSummary otherParameterIdentifiers](v6, "otherParameterIdentifiers");
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

@end
