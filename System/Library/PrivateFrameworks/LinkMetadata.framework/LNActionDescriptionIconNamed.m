@implementation LNActionDescriptionIconNamed

- (LNActionDescriptionIconNamed)initWithName:(id)a3
{
  return -[LNActionDescriptionIconNamed initWithName:bundleURL:](self, "initWithName:bundleURL:", a3, 0);
}

- (LNActionDescriptionIconNamed)initWithName:(id)a3 bundleURL:(id)a4
{
  id v7;
  id v8;
  LNActionDescriptionIconNamed *v9;
  uint64_t v10;
  NSString *name;
  LNActionDescriptionIconNamed *v12;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionDescriptionIcon.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v15.receiver = self;
  v15.super_class = (Class)LNActionDescriptionIconNamed;
  v9 = -[LNActionDescriptionIconNamed init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    objc_storeStrong((id *)&v9->_bundleURL, a4);
    v12 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNActionDescriptionIconNamed name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[LNActionDescriptionIconNamed bundleURL](self, "bundleURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleURL"));

}

- (LNActionDescriptionIconNamed)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNActionDescriptionIconNamed *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNActionDescriptionIconNamed initWithName:bundleURL:](self, "initWithName:bundleURL:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionDescriptionIconNamed name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionDescriptionIconNamed bundleURL](self, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, name: %@, bundleURL: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNActionDescriptionIconNamed name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNActionDescriptionIconNamed bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNActionDescriptionIconNamed *v4;
  LNActionDescriptionIconNamed *v5;
  LNActionDescriptionIconNamed *v6;
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

  v4 = (LNActionDescriptionIconNamed *)a3;
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
    -[LNActionDescriptionIconNamed name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionDescriptionIconNamed name](v6, "name");
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
    -[LNActionDescriptionIconNamed bundleURL](self, "bundleURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionDescriptionIconNamed bundleURL](v6, "bundleURL");
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

- (NSString)name
{
  return self->_name;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
