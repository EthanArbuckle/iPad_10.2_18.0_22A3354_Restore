@implementation LNActionConfigurationSwitchCase

- (BOOL)isDefaultCase
{
  return self->_defaultCase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (LNValue)value
{
  return self->_value;
}

- (LNActionConfiguration)configuration
{
  return self->_configuration;
}

- (LNActionConfigurationSwitchCase)initWithDefaultConfiguration:(id)a3
{
  id v5;
  LNActionConfigurationSwitchCase *v6;
  LNActionConfigurationSwitchCase *v7;
  LNValue *value;
  uint64_t v9;
  LNActionConfiguration *configuration;
  LNActionConfigurationSwitchCase *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionConfigurationSwitchCase.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v14.receiver = self;
  v14.super_class = (Class)LNActionConfigurationSwitchCase;
  v6 = -[LNActionConfigurationSwitchCase init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    value = v6->_value;
    v6->_value = 0;

    v7->_defaultCase = 1;
    v9 = objc_msgSend(v5, "copy");
    configuration = v7->_configuration;
    v7->_configuration = (LNActionConfiguration *)v9;

    v11 = v7;
  }

  return v7;
}

- (LNActionConfigurationSwitchCase)initWithValue:(id)a3 configuration:(id)a4
{
  id v8;
  id v9;
  LNActionConfigurationSwitchCase *v10;
  LNActionConfigurationSwitchCase *v11;
  uint64_t v12;
  LNActionConfiguration *configuration;
  LNActionConfigurationSwitchCase *v14;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionConfigurationSwitchCase.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v17.receiver = self;
  v17.super_class = (Class)LNActionConfigurationSwitchCase;
  v10 = -[LNActionConfigurationSwitchCase init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_value, a3);
    v11->_defaultCase = 0;
    v12 = objc_msgSend(v9, "copy");
    configuration = v11->_configuration;
    v11->_configuration = (LNActionConfiguration *)v12;

    v14 = v11;
  }

  return v11;
}

- (LNActionConfigurationSwitchCase)initWithWidgetFamily:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  LNValue *v8;
  void *v9;
  LNValue *v10;
  LNActionConfigurationSwitchCase *v11;

  v6 = a4;
  v7 = a3;
  v8 = [LNValue alloc];
  +[LNPrimitiveValueType stringValueType](LNPrimitiveValueType, "stringValueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LNValue initWithValue:valueType:](v8, "initWithValue:valueType:", v7, v9);

  v11 = -[LNActionConfigurationSwitchCase initWithValue:configuration:](self, "initWithValue:configuration:", v10, v6);
  return v11;
}

- (LNActionConfigurationSwitchCase)initWithWidgetFamilies:(id)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  LNValue *v8;
  void *v9;
  LNValue *v10;
  LNActionConfigurationSwitchCase *v11;

  v6 = a4;
  objc_msgSend(a3, "if_map:", &__block_literal_global_4377);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [LNValue alloc];
  +[LNPrimitiveValueType stringValueType](LNPrimitiveValueType, "stringValueType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LNValue initWithValues:memberValueType:](v8, "initWithValues:memberValueType:", v7, v9);
  v11 = -[LNActionConfigurationSwitchCase initWithValue:configuration:](self, "initWithValue:configuration:", v10, v6);

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionConfigurationSwitchCase value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionConfigurationSwitchCase configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LNActionConfigurationSwitchCase isDefaultCase](self, "isDefaultCase");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, value: %@, configuration: %@, default: %@>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (LNActionConfigurationSwitchCase)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNActionConfigurationSwitchCase *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("defaultCase")))
    {
      self = -[LNActionConfigurationSwitchCase initWithDefaultConfiguration:](self, "initWithDefaultConfiguration:", v5);
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[LNActionConfigurationSwitchCase initWithValue:configuration:](self, "initWithValue:configuration:", v7, v5);

    }
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LNActionConfigurationSwitchCase value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("value"));

  -[LNActionConfigurationSwitchCase configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("configuration"));

  objc_msgSend(v6, "encodeBool:forKey:", -[LNActionConfigurationSwitchCase isDefaultCase](self, "isDefaultCase"), CFSTR("defaultCase"));
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNActionConfigurationSwitchCase value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNActionConfigurationSwitchCase configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNActionConfigurationSwitchCase *v4;
  LNActionConfigurationSwitchCase *v5;
  LNActionConfigurationSwitchCase *v6;
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
  _BOOL4 v19;

  v4 = (LNActionConfigurationSwitchCase *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[LNActionConfigurationSwitchCase value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionConfigurationSwitchCase value](v6, "value");
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
        goto LABEL_20;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    -[LNActionConfigurationSwitchCase configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionConfigurationSwitchCase configuration](v6, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      if (!v14 || !v18)
      {

        LOBYTE(v12) = 0;
        goto LABEL_20;
      }
      v12 = objc_msgSend(v14, "isEqual:", v18);

      if (!v12)
        goto LABEL_20;
    }
    v19 = -[LNActionConfigurationSwitchCase isDefaultCase](self, "isDefaultCase");
    v12 = v19 ^ -[LNActionConfigurationSwitchCase isDefaultCase](v6, "isDefaultCase") ^ 1;
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v12) = 1;
LABEL_23:

  return v12;
}

LNValue *__72__LNActionConfigurationSwitchCase_initWithWidgetFamilies_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  LNValue *v3;
  void *v4;
  LNValue *v5;

  v2 = a2;
  v3 = [LNValue alloc];
  +[LNPrimitiveValueType stringValueType](LNPrimitiveValueType, "stringValueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNValue initWithValue:valueType:](v3, "initWithValue:valueType:", v2, v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
