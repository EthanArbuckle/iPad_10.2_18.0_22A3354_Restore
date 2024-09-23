@implementation MLKey

- (MLKey)initWithKeyName:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  MLKey *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *scope;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLKey;
  v8 = -[MLKey init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    scope = v8->_scope;
    v8->_scope = (NSString *)v11;

  }
  return v8;
}

- (MLKey)initWithKeyName:(id)a3
{
  id v4;
  MLKey *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLKey;
  v5 = -[MLKey init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithKeyName:scope:", self->_name, self->_scope);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MLKey name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MLKey scope](self, "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MLKey scope](self, "scope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MLKey scope](self, "scope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scope");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      objc_msgSend(v4, "scope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6 == 0;
    }

    -[MLKey name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqual:", v11) & v8;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)scopedTo:(id)a3
{
  id v4;
  MLKey *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MLKey *v10;
  void *v11;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR(".")) & 1) != 0 || (objc_msgSend(v4, "hasSuffix:", CFSTR(".")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[MLKey scope](self, "scope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[MLKey scope](self, "scope");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[MLKey scope](self, "scope");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(".%@"), v4);
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = v8;
      }
      else
      {
        v9 = objc_msgSend(v4, "copy");
      }

      v6 = (void *)v9;
    }
    v10 = [MLKey alloc];
    -[MLKey name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MLKey initWithKeyName:scope:](v10, "initWithKeyName:scope:", v11, v6);

  }
  return v5;
}

- (id)deletingPrefixingScope:(id)a3
{
  id v4;
  MLKey *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MLKey *v14;
  void *v15;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR(".")) & 1) != 0 || (objc_msgSend(v4, "hasSuffix:", CFSTR(".")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[MLKey scope](self, "scope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLKey scope](self, "scope");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[MLKey scope](self, "scope");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasPrefix:", v4);

      if (v10)
      {
        -[MLKey scope](self, "scope");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v4, "length"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "hasPrefix:", CFSTR(".")))
        {
          objc_msgSend(v12, "substringFromIndex:", 1);
          v13 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v13;
        }
        if (objc_msgSend(v12, "length"))
        {
          v6 = v12;
        }
        else
        {

          v6 = 0;
        }
      }
    }
    v14 = [MLKey alloc];
    -[MLKey name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MLKey initWithKeyName:scope:](v14, "initWithKeyName:scope:", v15, v6);

  }
  return v5;
}

- (BOOL)hasGlobalScope
{
  void *v2;
  BOOL v3;

  -[MLKey scope](self, "scope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)hasSameNameAsKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MLKey name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MLKey name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MLKeyName"));

  -[MLKey scope](self, "scope");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MLKeyScope"));

}

- (MLKey)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MLKey *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("MLKeyName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("MLKeyScope"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[MLKey initWithKeyName:scope:](self, "initWithKeyName:scope:", v8, v12);
  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MLKey scope](self, "scope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[MLKey scope](self, "scope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLKey name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MLKey name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
