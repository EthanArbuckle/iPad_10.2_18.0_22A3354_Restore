@implementation LNActionConfigurationCondition

- (LNActionConfigurationCondition)initWithParameterIdentifier:(id)a3 comparisonOperator:(int64_t)a4 value:(id)a5
{
  id v9;
  id v10;
  LNActionConfigurationCondition *v11;
  uint64_t v12;
  NSString *parameterIdentifier;
  LNActionConfigurationCondition *v14;
  void *v16;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionConfigurationCondition.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterIdentifier"));

  }
  v17.receiver = self;
  v17.super_class = (Class)LNActionConfigurationCondition;
  v11 = -[LNActionConfigurationCondition init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    parameterIdentifier = v11->_parameterIdentifier;
    v11->_parameterIdentifier = (NSString *)v12;

    v11->_comparisonOperator = a4;
    objc_storeStrong((id *)&v11->_value, a5);
    v14 = v11;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionConfigurationCondition parameterIdentifier](self, "parameterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LNActionConfigurationCondition comparisonOperator](self, "comparisonOperator");
  -[LNActionConfigurationCondition value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, parameterIdentifier: %@, comparisonOperator: %ld, value: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (LNActionConfigurationCondition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  LNActionConfigurationCondition *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("comparisonOperator"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[LNActionConfigurationCondition initWithParameterIdentifier:comparisonOperator:value:](self, "initWithParameterIdentifier:comparisonOperator:value:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNActionConfigurationCondition parameterIdentifier](self, "parameterIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionConfigurationCondition comparisonOperator](self, "comparisonOperator"), CFSTR("comparisonOperator"));
  -[LNActionConfigurationCondition value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("value"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  unint64_t v7;

  -[LNActionConfigurationCondition parameterIdentifier](self, "parameterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[LNActionConfigurationCondition comparisonOperator](self, "comparisonOperator") ^ v4;
  -[LNActionConfigurationCondition value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LNActionConfigurationCondition *v4;
  LNActionConfigurationCondition *v5;
  LNActionConfigurationCondition *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int64_t v15;
  void *v16;
  void *v17;
  id v18;

  v4 = (LNActionConfigurationCondition *)a3;
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
    -[LNActionConfigurationCondition parameterIdentifier](self, "parameterIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionConfigurationCondition parameterIdentifier](v6, "parameterIdentifier");
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
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_21;
    }
    v15 = -[LNActionConfigurationCondition comparisonOperator](self, "comparisonOperator");
    if (v15 != -[LNActionConfigurationCondition comparisonOperator](v6, "comparisonOperator"))
    {
      LOBYTE(v12) = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[LNActionConfigurationCondition value](self, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionConfigurationCondition value](v6, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v18)
        LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v18);
    }

LABEL_20:
    goto LABEL_21;
  }
  LOBYTE(v12) = 1;
LABEL_23:

  return v12;
}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (int64_t)comparisonOperator
{
  return self->_comparisonOperator;
}

- (LNValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNActionConfigurationCondition)initWithComparisonOperator:(int64_t)a3 widgetFamily:(id)a4
{
  id v6;
  LNValue *v7;
  void *v8;
  LNValue *v9;
  LNActionConfigurationCondition *v10;

  v6 = a4;
  v7 = [LNValue alloc];
  +[LNPrimitiveValueType stringValueType](LNPrimitiveValueType, "stringValueType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[LNValue initWithValue:valueType:](v7, "initWithValue:valueType:", v6, v8);

  v10 = -[LNActionConfigurationCondition initWithParameterIdentifier:comparisonOperator:value:](self, "initWithParameterIdentifier:comparisonOperator:value:", CFSTR("system.widgetFamily"), a3, v9);
  return v10;
}

- (LNActionConfigurationCondition)initWithComparisonOperator:(int64_t)a3 widgetFamilies:(id)a4
{
  void *v6;
  LNValue *v7;
  void *v8;
  LNValue *v9;
  LNActionConfigurationCondition *v10;

  objc_msgSend(a4, "if_map:", &__block_literal_global_906);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [LNValue alloc];
  +[LNPrimitiveValueType stringValueType](LNPrimitiveValueType, "stringValueType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[LNValue initWithValues:memberValueType:](v7, "initWithValues:memberValueType:", v6, v8);
  v10 = -[LNActionConfigurationCondition initWithParameterIdentifier:comparisonOperator:value:](self, "initWithParameterIdentifier:comparisonOperator:value:", CFSTR("system.widgetFamily"), a3, v9);

  return v10;
}

LNValue *__95__LNActionConfigurationCondition_WidgetKit_Support__initWithComparisonOperator_widgetFamilies___block_invoke(uint64_t a1, void *a2)
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

@end
