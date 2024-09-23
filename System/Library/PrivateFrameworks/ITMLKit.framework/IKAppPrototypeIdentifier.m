@implementation IKAppPrototypeIdentifier

- (IKAppPrototypeIdentifier)initWithIdentifier:(id)a3 selector:(id)a4 groupingValues:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKAppPrototypeIdentifier *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *selector;
  uint64_t v16;
  NSDictionary *groupingValues;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IKAppPrototypeIdentifier;
  v11 = -[IKAppPrototypeIdentifier init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    selector = v11->_selector;
    v11->_selector = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    groupingValues = v11->_groupingValues;
    v11->_groupingValues = (NSDictionary *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IKAppPrototypeIdentifier identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IKAppPrototypeIdentifier identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v7))
    {
      v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    -[IKAppPrototypeIdentifier selector](self, "selector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[IKAppPrototypeIdentifier selector](self, "selector");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "selector");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqualToString:", v11))
      {
        v12 = 0;
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
      v20 = v11;
      v21 = v10;
    }
    -[IKAppPrototypeIdentifier groupingValues](self, "groupingValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupingValues");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

      v12 = 1;
    }
    else
    {
      v15 = (void *)v14;
      -[IKAppPrototypeIdentifier groupingValues](self, "groupingValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupingValues");
      v19 = v8;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v16, "isEqualToDictionary:", v17);

      v8 = v19;
    }
    v11 = v20;
    v10 = v21;
    if (v8 == v9)
      goto LABEL_14;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)selector
{
  return self->_selector;
}

- (NSDictionary)groupingValues
{
  return self->_groupingValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingValues, 0);
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
