@implementation LNFullyQualifiedActionIdentifier

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (LNFullyQualifiedActionIdentifier)initWithActionIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNFullyQualifiedActionIdentifier *v10;
  uint64_t v11;
  NSString *actionIdentifier;
  uint64_t v13;
  NSString *bundleIdentifier;
  LNFullyQualifiedActionIdentifier *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFullyQualifiedActionIdentifier.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFullyQualifiedActionIdentifier.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNFullyQualifiedActionIdentifier;
  v10 = -[LNFullyQualifiedActionIdentifier init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    actionIdentifier = v10->_actionIdentifier;
    v10->_actionIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNFullyQualifiedActionIdentifier actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionIdentifier"));

  -[LNFullyQualifiedActionIdentifier bundleIdentifier](self, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

}

- (LNFullyQualifiedActionIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  LNFullyQualifiedActionIdentifier *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[LNFullyQualifiedActionIdentifier initWithActionIdentifier:bundleIdentifier:](self, "initWithActionIdentifier:bundleIdentifier:", v5, v6);
    v8 = self;
  }

  return v8;
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
  -[LNFullyQualifiedActionIdentifier bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFullyQualifiedActionIdentifier actionIdentifier](self, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, bundleIdentifier: %@, actionIdentifier: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNFullyQualifiedActionIdentifier actionIdentifier](self, "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNFullyQualifiedActionIdentifier bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNFullyQualifiedActionIdentifier *v4;
  LNFullyQualifiedActionIdentifier *v5;
  LNFullyQualifiedActionIdentifier *v6;
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

  v4 = (LNFullyQualifiedActionIdentifier *)a3;
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
    -[LNFullyQualifiedActionIdentifier actionIdentifier](self, "actionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNFullyQualifiedActionIdentifier actionIdentifier](v6, "actionIdentifier");
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
    -[LNFullyQualifiedActionIdentifier bundleIdentifier](self, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNFullyQualifiedActionIdentifier bundleIdentifier](v6, "bundleIdentifier");
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

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[LNFullyQualifiedActionIdentifier actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFullyQualifiedActionIdentifier bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithActionIdentifier:bundleIdentifier:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
