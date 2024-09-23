@implementation LNQueryRequestParameterTarget

- (LNQueryRequestParameterTarget)initWithActionMetadata:(id)a3 parameterIndex:(int64_t)a4
{
  LNActionMetadata *actionMetadata;
  void *v7;
  void *v8;
  void *v9;
  LNQueryRequestParameterTarget *v10;

  actionMetadata = self->_actionMetadata;
  objc_msgSend(a3, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LNQueryRequestParameterTarget initWithActionMetadata:parameterIdentifier:](self, "initWithActionMetadata:parameterIdentifier:", actionMetadata, v9);

  return v10;
}

- (LNQueryRequestParameterTarget)initWithActionMetadata:(id)a3 parameterIdentifier:(id)a4
{
  id v7;
  id v8;
  id *v9;
  LNQueryRequestParameterTarget *v10;
  LNQueryRequestParameterTarget *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNQueryRequestParameterTarget;
  v9 = -[LNQueryRequestTargetBase _init](&v13, sel__init);
  v10 = (LNQueryRequestParameterTarget *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_parameterIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[LNQueryRequestParameterTarget actionMetadata](self, "actionMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNQueryRequestParameterTarget parameterIdentifier](self, "parameterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Parameter <%@:%@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNQueryRequestParameterTarget actionMetadata](self, "actionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionMetadata"));

  -[LNQueryRequestParameterTarget parameterIdentifier](self, "parameterIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterIdentifier"));

}

- (LNQueryRequestParameterTarget)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNQueryRequestParameterTarget *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[LNQueryRequestParameterTarget initWithActionMetadata:parameterIdentifier:](self, "initWithActionMetadata:parameterIdentifier:", v5, v6);
  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[LNActionMetadata hash](self->_actionMetadata, "hash");
  return -[NSString hash](self->_parameterIdentifier, "hash") & v3;
}

- (BOOL)isEqual:(id)a3
{
  LNQueryRequestParameterTarget *v4;
  LNQueryRequestParameterTarget *v5;
  LNQueryRequestParameterTarget *v6;
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

  v4 = (LNQueryRequestParameterTarget *)a3;
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
    -[LNQueryRequestParameterTarget actionMetadata](self, "actionMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryRequestParameterTarget actionMetadata](v6, "actionMetadata");
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
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNQueryRequestParameterTarget parameterIdentifier](self, "parameterIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNQueryRequestParameterTarget parameterIdentifier](v6, "parameterIdentifier");
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
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
