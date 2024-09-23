@implementation LNComparisonPropertyQuery

- (LNComparisonPropertyQuery)initWithPropertyIndex:(id)a3 value:(id)a4 type:(unint64_t)a5
{
  id v10;
  id v11;
  void *v12;
  id *v13;
  LNComparisonPropertyQuery *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNComparisonPropertyQuery.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyIndex"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNComparisonPropertyQuery.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)LNComparisonPropertyQuery;
  v13 = -[LNPropertyQuery _init](&v18, sel__init);
  v14 = (LNComparisonPropertyQuery *)v13;
  if (v13)
  {
    objc_storeStrong(v13 + 1, a3);
    v14->_type = a5;
    objc_storeStrong((id *)&v14->_value, a4);
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[LNComparisonPropertyQuery propertyIndex](self, "propertyIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v5 = -[LNComparisonPropertyQuery type](self, "type");
    if (v5 - 1 > 8)
      v6 = CFSTR("==");
    else
      v6 = off_1E39A12F8[v5 - 1];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  -[LNComparisonPropertyQuery value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@>"), v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  LNComparisonPropertyQuery *v4;
  LNComparisonPropertyQuery *v5;
  LNComparisonPropertyQuery *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v4 = (LNComparisonPropertyQuery *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_17:

      goto LABEL_18;
    }
    -[LNComparisonPropertyQuery propertyIndex](self, "propertyIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNComparisonPropertyQuery propertyIndex](v6, "propertyIndex");
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
        goto LABEL_15;
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_16;
    }
    -[LNComparisonPropertyQuery value](self, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNComparisonPropertyQuery value](v6, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqual:", v13))
    {
      v15 = -[LNComparisonPropertyQuery type](self, "type");
      LOBYTE(v12) = v15 == -[LNComparisonPropertyQuery type](v6, "type");
    }
    else
    {
      LOBYTE(v12) = 0;
    }
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  LOBYTE(v12) = 1;
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[LNComparisonPropertyQuery propertyIndex](self, "propertyIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNComparisonPropertyQuery value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[LNComparisonPropertyQuery type](self, "type");

  return v7;
}

- (LNComparisonPropertyQuery)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  LNComparisonPropertyQuery *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = -[LNComparisonPropertyQuery initWithPropertyIndex:value:type:](self, "initWithPropertyIndex:value:type:", v5, v7, v6);
    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *propertyIndex;
  id v5;

  propertyIndex = self->_propertyIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", propertyIndex, CFSTR("propertyIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (NSNumber)propertyIndex
{
  return self->_propertyIndex;
}

- (LNValue)value
{
  return self->_value;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_propertyIndex, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)propertyIdentifier
{
  return (NSString *)&stru_1E39A2988;
}

- (LNComparisonPropertyQuery)initWithPropertyIdentifier:(id)a3 value:(id)a4 type:(unint64_t)a5
{
  return -[LNComparisonPropertyQuery initWithPropertyIndex:value:type:](self, "initWithPropertyIndex:value:type:", &unk_1E39B4970, a4, a5);
}

@end
