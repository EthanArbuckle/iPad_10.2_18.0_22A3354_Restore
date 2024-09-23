@implementation LNParameter

- (LNParameter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LNParameter *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[LNParameter initWithIdentifier:value:configuration:](self, "initWithIdentifier:value:configuration:", v5, v6, v7);
  return v8;
}

- (LNParameter)initWithIdentifier:(id)a3 value:(id)a4 configuration:(id)a5
{
  id v8;
  LNParameter *v9;
  uint64_t v10;
  LNParameterConfiguration *configuration;
  LNParameter *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)LNParameter;
  v9 = -[LNProperty initWithIdentifier:value:](&v14, sel_initWithIdentifier_value_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    configuration = v9->_configuration;
    v9->_configuration = (LNParameterConfiguration *)v10;

    v12 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNProperty identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNProperty value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("value"));

  -[LNParameter configuration](self, "configuration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("configuration"));

}

- (LNParameterConfiguration)configuration
{
  return self->_configuration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNParameter)initWithIdentifier:(id)a3 value:(id)a4
{
  return -[LNParameter initWithIdentifier:value:configuration:](self, "initWithIdentifier:value:configuration:", a3, a4, 0);
}

- (BOOL)isEqual:(id)a3
{
  LNParameter *v4;
  LNParameter *v5;
  LNParameter *v6;
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

  v4 = (LNParameter *)a3;
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
    -[LNProperty identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNProperty identifier](v6, "identifier");
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
    -[LNProperty value](self, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNProperty value](v6, "value");
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
        LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

@end
