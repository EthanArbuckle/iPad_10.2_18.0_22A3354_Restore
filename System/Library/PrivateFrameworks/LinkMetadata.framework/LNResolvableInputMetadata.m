@implementation LNResolvableInputMetadata

- (LNResolvableInputMetadata)initWithValueType:(id)a3
{
  id v5;
  LNResolvableInputMetadata *v6;
  LNResolvableInputMetadata *v7;
  uint64_t v8;
  LNValueType *valueType;
  LNResolvableInputMetadata *v10;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNResolvableInputMetadata.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueType"));

  }
  v13.receiver = self;
  v13.super_class = (Class)LNResolvableInputMetadata;
  v6 = -[LNResolvableInputMetadata init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_kind = 0;
    v8 = objc_msgSend(v5, "copy");
    valueType = v7->_valueType;
    v7->_valueType = (LNValueType *)v8;

    v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_queryType, 0);
}

- (LNResolvableInputMetadata)initWithQueryType:(id)a3
{
  id v5;
  LNResolvableInputMetadata *v6;
  LNResolvableInputMetadata *v7;
  uint64_t v8;
  NSString *queryType;
  LNResolvableInputMetadata *v10;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNResolvableInputMetadata.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryType"));

  }
  v13.receiver = self;
  v13.super_class = (Class)LNResolvableInputMetadata;
  v6 = -[LNResolvableInputMetadata init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_kind = 1;
    v8 = objc_msgSend(v5, "copy");
    queryType = v7->_queryType;
    v7->_queryType = (NSString *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNResolvableInputMetadata kind](self, "kind"), CFSTR("kind"));
  -[LNResolvableInputMetadata queryType](self, "queryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("queryType"));

  -[LNResolvableInputMetadata valueType](self, "valueType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("valueType"));

}

- (LNResolvableInputMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  LNResolvableInputMetadata *v8;
  LNResolvableInputMetadata *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kind"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != 1)
  {
    if (v7)
    {
      v8 = -[LNResolvableInputMetadata initWithValueType:](self, "initWithValueType:", v7);
      goto LABEL_6;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!v6)
    goto LABEL_7;
  v8 = -[LNResolvableInputMetadata initWithQueryType:](self, "initWithQueryType:", v6);
LABEL_6:
  self = v8;
  v9 = self;
LABEL_8:

  return v9;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[LNResolvableInputMetadata kind](self, "kind");
  -[LNResolvableInputMetadata queryType](self, "queryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[LNResolvableInputMetadata valueType](self, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LNResolvableInputMetadata *v4;
  LNResolvableInputMetadata *v5;
  LNResolvableInputMetadata *v6;
  int64_t v7;
  void *v8;
  void *v9;
  LNResolvableInputMetadata *v10;
  LNResolvableInputMetadata *v11;
  LNResolvableInputMetadata *v12;
  int v13;
  LNResolvableInputMetadata *v14;
  LNResolvableInputMetadata *v15;
  void *v16;
  void *v17;
  LNResolvableInputMetadata *v18;

  v4 = (LNResolvableInputMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[LNResolvableInputMetadata kind](self, "kind");
        if (v7 != -[LNResolvableInputMetadata kind](v6, "kind"))
        {
          LOBYTE(v13) = 0;
LABEL_24:

          goto LABEL_25;
        }
        -[LNResolvableInputMetadata queryType](self, "queryType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNResolvableInputMetadata queryType](v6, "queryType");
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
          v13 = -[LNResolvableInputMetadata isEqualToString:](v10, "isEqualToString:", v11);

          if (!v13)
            goto LABEL_22;
        }
        -[LNResolvableInputMetadata valueType](self, "valueType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNResolvableInputMetadata valueType](v6, "valueType");
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
            LOBYTE(v13) = -[LNResolvableInputMetadata isEqual:](v15, "isEqual:", v18);
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

- (id)description
{
  void *v2;
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = -[LNResolvableInputMetadata kind](self, "kind");
  if (!v4)
  {
    -[LNResolvableInputMetadata valueType](self, "valueType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[LNResolvableInputMetadata queryType](self, "queryType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Query:%@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v2 = (void *)v7;

  }
  return v2;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)queryType
{
  return self->_queryType;
}

- (LNValueType)valueType
{
  return self->_valueType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
