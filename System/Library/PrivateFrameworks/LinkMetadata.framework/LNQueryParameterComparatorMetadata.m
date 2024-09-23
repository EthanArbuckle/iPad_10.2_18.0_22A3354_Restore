@implementation LNQueryParameterComparatorMetadata

- (LNQueryParameterComparatorMetadata)initWithComparatorType:(unint64_t)a3 valueType:(id)a4 resolvableInputTypes:(id)a5
{
  id v8;
  id v9;
  LNQueryParameterComparatorMetadata *v10;
  LNQueryParameterComparatorMetadata *v11;
  uint64_t v12;
  NSArray *resolvableInputTypes;
  uint64_t v14;
  LNValueType *valueType;
  LNQueryParameterComparatorMetadata *v16;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)LNQueryParameterComparatorMetadata;
  v10 = -[LNQueryParameterComparatorMetadata init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_comparatorType = a3;
    v12 = objc_msgSend(v9, "copy");
    resolvableInputTypes = v11->_resolvableInputTypes;
    v11->_resolvableInputTypes = (NSArray *)v12;

    v14 = objc_msgSend(v8, "copy");
    valueType = v11->_valueType;
    v11->_valueType = (LNValueType *)v14;

    v16 = v11;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvableInputTypes, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNQueryParameterComparatorMetadata comparatorType](self, "comparatorType"), CFSTR("comparatorType"));
  -[LNQueryParameterComparatorMetadata resolvableInputTypes](self, "resolvableInputTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("resolvableInputTypes"));

  -[LNQueryParameterComparatorMetadata valueType](self, "valueType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("valueType"));

}

- (LNQueryParameterComparatorMetadata)initWithCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  LNQueryParameterComparatorMetadata *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("comparatorType"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("resolvableInputTypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = -[LNQueryParameterComparatorMetadata initWithComparatorType:valueType:resolvableInputTypes:](self, "initWithComparatorType:valueType:resolvableInputTypes:", v5, v10, v9);
    v12 = self;
  }

  return v12;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[LNQueryParameterComparatorMetadata comparatorType](self, "comparatorType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryParameterComparatorMetadata valueType](self, "valueType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryParameterComparatorMetadata resolvableInputTypes](self, "resolvableInputTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, comparatorType: %@, valueType: %@, resolvableInputTypes: [%@]>"), v5, self, v6, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[LNQueryParameterComparatorMetadata comparatorType](self, "comparatorType");
  -[LNQueryParameterComparatorMetadata valueType](self, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  LNQueryParameterComparatorMetadata *v4;
  LNQueryParameterComparatorMetadata *v5;
  LNQueryParameterComparatorMetadata *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  LNQueryParameterComparatorMetadata *v10;
  LNQueryParameterComparatorMetadata *v11;
  LNQueryParameterComparatorMetadata *v12;
  _BOOL4 v13;
  LNQueryParameterComparatorMetadata *v14;
  LNQueryParameterComparatorMetadata *v15;
  void *v16;
  void *v17;
  LNQueryParameterComparatorMetadata *v18;

  v4 = (LNQueryParameterComparatorMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[LNQueryParameterComparatorMetadata comparatorType](self, "comparatorType");
        if (v7 != -[LNQueryParameterComparatorMetadata comparatorType](v6, "comparatorType"))
        {
          LOBYTE(v13) = 0;
LABEL_24:

          goto LABEL_25;
        }
        -[LNQueryParameterComparatorMetadata valueType](self, "valueType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNQueryParameterComparatorMetadata valueType](v6, "valueType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {

        }
        else
        {
          LOBYTE(v13) = 0;
          v14 = v11;
          v15 = v10;
          if (!v10 || !v11)
          {
LABEL_21:

LABEL_22:
            goto LABEL_23;
          }
          v13 = -[LNQueryParameterComparatorMetadata isEqual:](v10, "isEqual:", v11);

          if (!v13)
            goto LABEL_22;
        }
        -[LNQueryParameterComparatorMetadata resolvableInputTypes](self, "resolvableInputTypes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNQueryParameterComparatorMetadata resolvableInputTypes](v6, "resolvableInputTypes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v16;
        v18 = v17;
        v14 = v18;
        if (v15 == v18)
        {
          LOBYTE(v13) = 1;
        }
        else
        {
          LOBYTE(v13) = 0;
          if (v15 && v18)
            LOBYTE(v13) = -[LNQueryParameterComparatorMetadata isEqual:](v15, "isEqual:", v18);
        }

        goto LABEL_21;
      }
      LOBYTE(v13) = 0;
      v10 = v6;
      v6 = 0;
    }
    else
    {
      v10 = 0;
      LOBYTE(v13) = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  LOBYTE(v13) = 1;
LABEL_25:

  return v13;
}

- (unint64_t)comparatorType
{
  return self->_comparatorType;
}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (NSArray)resolvableInputTypes
{
  return self->_resolvableInputTypes;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
