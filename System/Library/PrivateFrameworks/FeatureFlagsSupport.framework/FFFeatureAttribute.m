@implementation FFFeatureAttribute

- (FFFeatureAttribute)initWithName:(id)a3 value:(id)a4
{
  id v6;
  __CFString *v7;
  FFFeatureAttribute *v8;
  FFFeatureAttribute *v9;
  FFFeatureAttribute *v10;
  const __CFString *v11;
  objc_super v13;

  v6 = a3;
  v7 = (__CFString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)FFFeatureAttribute;
  v8 = -[FFFeatureAttribute init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[FFFeatureAttribute setName:](v8, "setName:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v11 = v7;
LABEL_9:
      -[FFFeatureAttribute setValue:](v10, "setValue:", v11);
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[__CFString BOOLValue](v7, "BOOLValue"))
        v11 = CFSTR("true");
      else
        v11 = CFSTR("false");
      v10 = v9;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[FFFeatureAttribute name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFFeatureAttribute value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Attribute %@=%@"), v4, v5);

  return v6;
}

- (BOOL)matchesAgainst:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFFeatureAttribute value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[FFFeatureAttribute value](self, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (isBooleanYes(v10))
    {
      objc_msgSend(v4, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      objc_msgSend(v4, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((isKindOfClass & 1) == 0)
      {
        LOBYTE(v8) = objc_msgSend(v13, "BOOLValue");
        goto LABEL_15;
      }
      objc_msgSend(v13, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = isBooleanYes(v15);
    }
    else
    {
      if (!isBooleanNo(v10))
      {
        LOBYTE(v8) = 0;
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v4, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = objc_opt_isKindOfClass();

      objc_msgSend(v4, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      if ((v18 & 1) == 0)
      {
        if (v19)
        {
          objc_msgSend(v4, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v20, "BOOLValue") ^ 1;

        }
        else
        {
          LOBYTE(v8) = 0;
        }
        goto LABEL_15;
      }
      objc_msgSend(v19, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = isBooleanNo(v15);
    }
    LOBYTE(v8) = v16;
    v14 = v15;
LABEL_15:

    goto LABEL_16;
  }
  LOBYTE(v8) = 1;
LABEL_17:

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
