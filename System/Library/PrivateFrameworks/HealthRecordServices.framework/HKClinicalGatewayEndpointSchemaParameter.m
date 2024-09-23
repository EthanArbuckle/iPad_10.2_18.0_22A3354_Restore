@implementation HKClinicalGatewayEndpointSchemaParameter

- (HKClinicalGatewayEndpointSchemaParameter)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalGatewayEndpointSchemaParameter)initWithParam:(id)a3 literal:(id)a4 variable:(id)a5 mode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKClinicalGatewayEndpointSchemaParameter *v14;
  uint64_t v15;
  NSString *param;
  uint64_t v17;
  NSString *literal;
  uint64_t v19;
  NSString *variable;
  uint64_t v21;
  NSArray *mode;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKClinicalGatewayEndpointSchemaParameter;
  v14 = -[HKClinicalGatewayEndpointSchemaParameter init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    param = v14->_param;
    v14->_param = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    literal = v14->_literal;
    v14->_literal = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    variable = v14->_variable;
    v14->_variable = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    mode = v14->_mode;
    v14->_mode = (NSArray *)v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalGatewayEndpointSchemaParameter *v6;
  HKClinicalGatewayEndpointSchemaParameter *v7;
  HKClinicalGatewayEndpointSchemaParameter *v8;
  NSString *param;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  char v14;
  NSString *literal;
  NSString *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  NSString *variable;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  NSString *v25;
  void *v26;
  NSArray *mode;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSArray *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *v40;
  void *v41;
  NSString *v42;
  void *v43;

  v6 = (HKClinicalGatewayEndpointSchemaParameter *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    param = self->_param;
    -[HKClinicalGatewayEndpointSchemaParameter param](v8, "param");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (param != v10)
    {
      -[HKClinicalGatewayEndpointSchemaParameter param](v8, "param");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      v12 = self->_param;
      -[HKClinicalGatewayEndpointSchemaParameter param](v8, "param");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v12, "isEqualToString:", v13))
      {
        v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    literal = self->_literal;
    -[HKClinicalGatewayEndpointSchemaParameter literal](v8, "literal");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (literal == v16)
    {
      v42 = literal;
    }
    else
    {
      -[HKClinicalGatewayEndpointSchemaParameter literal](v8, "literal");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = literal;
      v19 = self->_literal;
      -[HKClinicalGatewayEndpointSchemaParameter literal](v8, "literal");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v19, "isEqualToString:", v4))
      {

        v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    variable = self->_variable;
    -[HKClinicalGatewayEndpointSchemaParameter variable](v8, "variable");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    v41 = v4;
    if (variable == v21)
    {
      v39 = v3;
      v40 = variable;
    }
    else
    {
      -[HKClinicalGatewayEndpointSchemaParameter variable](v8, "variable");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:

        }
LABEL_36:

LABEL_37:
        v13 = v43;
        if (param != v10)
          goto LABEL_38;
LABEL_39:

        goto LABEL_40;
      }
      v40 = variable;
      v37 = (void *)v22;
      v23 = self->_variable;
      -[HKClinicalGatewayEndpointSchemaParameter variable](v8, "variable");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = (void *)v24;
      if (!-[NSString isEqualToString:](v25, "isEqualToString:", v24))
      {

        v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    mode = self->_mode;
    -[HKClinicalGatewayEndpointSchemaParameter mode](v8, "mode", v35);
    v28 = objc_claimAutoreleasedReturnValue();
    v14 = mode == (NSArray *)v28;
    if (mode == (NSArray *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[HKClinicalGatewayEndpointSchemaParameter mode](v8, "mode");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_mode;
        -[HKClinicalGatewayEndpointSchemaParameter mode](v8, "mode");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSArray isEqualToArray:](v32, "isEqualToArray:", v33);

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16)
            goto LABEL_36;
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }

    }
    if (v40 == v21)
      goto LABEL_42;

    v3 = v39;
    goto LABEL_33;
  }
  v14 = 1;
LABEL_41:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_param, "hash");
  v4 = -[NSString hash](self->_literal, "hash") ^ v3;
  v5 = -[NSString hash](self->_variable, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_mode, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *param;
  id v5;

  param = self->_param;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", param, CFSTR("param"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_literal, CFSTR("literal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_variable, CFSTR("variable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mode, CFSTR("mode"));

}

- (HKClinicalGatewayEndpointSchemaParameter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKClinicalGatewayEndpointSchemaParameter *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("param"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("literal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKClinicalGatewayEndpointSchemaParameter initWithParam:literal:variable:mode:](self, "initWithParam:literal:variable:mode:", v5, v6, v7, v8);

    v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (NSString)param
{
  return self->_param;
}

- (NSString)literal
{
  return self->_literal;
}

- (NSString)variable
{
  return self->_variable;
}

- (NSArray)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_literal, 0);
  objc_storeStrong((id *)&self->_param, 0);
}

@end
