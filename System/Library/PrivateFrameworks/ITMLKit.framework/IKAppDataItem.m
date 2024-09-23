@implementation IKAppDataItem

- (IKAppDataItem)initWithType:(id)a3 identifier:(id)a4 prototypeIdentifier:(id)a5 dataDictionary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IKAppDataItem *v14;
  uint64_t v15;
  NSString *type;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSDictionary *dataDictionary;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)IKAppDataItem;
  v14 = -[IKAppDataItem init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    type = v14->_type;
    v14->_type = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_prototypeIdentifier, a5);
    v19 = objc_msgSend(v13, "copy");
    dataDictionary = v14->_dataDictionary;
    v14->_dataDictionary = (NSDictionary *)v19;

  }
  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IKAppDataItem identifier](self, "identifier");
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
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IKAppDataItem identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[IKAppDataItem type](self, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[IKAppDataItem prototypeIdentifier](self, "prototypeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "prototypeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          -[IKAppDataItem dataDictionary](self, "dataDictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "dataDictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 == v13)
          {
            v15 = 1;
          }
          else
          {
            v18 = v13;
            -[IKAppDataItem dataDictionary](self, "dataDictionary");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "dataDictionary");
            v19 = v12;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v17, "isEqualToDictionary:", v14);

            v12 = v19;
            v13 = v18;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)valueForPropertyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IKAppDataItem dataDictionary](self, "dataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (IKAppPrototypeIdentifier)prototypeIdentifier
{
  return self->_prototypeIdentifier;
}

- (NSDictionary)dataDictionary
{
  return self->_dataDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDictionary, 0);
  objc_storeStrong((id *)&self->_prototypeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
