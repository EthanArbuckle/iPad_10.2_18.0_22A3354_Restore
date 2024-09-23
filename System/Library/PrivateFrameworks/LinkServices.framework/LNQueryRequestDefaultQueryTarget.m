@implementation LNQueryRequestDefaultQueryTarget

- (LNQueryRequestDefaultQueryTarget)initWithEntityMetadata:(id)a3
{
  id v5;
  id *v6;
  LNQueryRequestDefaultQueryTarget *v7;
  LNQueryRequestDefaultQueryTarget *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNQueryRequestDefaultQueryTarget;
  v6 = -[LNQueryRequestTargetBase _init](&v10, sel__init);
  v7 = (LNQueryRequestDefaultQueryTarget *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[LNEntityMetadata identifier](self->_entityMetadata, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Entity <%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNQueryRequestDefaultQueryTarget entityMetadata](self, "entityMetadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entityMetadata"));

}

- (LNQueryRequestDefaultQueryTarget)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNQueryRequestDefaultQueryTarget *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LNQueryRequestDefaultQueryTarget initWithEntityMetadata:](self, "initWithEntityMetadata:", v5);
  return v6;
}

- (unint64_t)hash
{
  return -[LNEntityMetadata hash](self->_entityMetadata, "hash");
}

- (BOOL)isEqual:(id)a3
{
  LNQueryRequestDefaultQueryTarget *v4;
  LNQueryRequestDefaultQueryTarget *v5;
  LNQueryRequestDefaultQueryTarget *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNQueryRequestDefaultQueryTarget *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNQueryRequestDefaultQueryTarget entityMetadata](self, "entityMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNQueryRequestDefaultQueryTarget entityMetadata](v6, "entityMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (LNEntityMetadata)entityMetadata
{
  return self->_entityMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
