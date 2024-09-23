@implementation LNBundleConnectionPolicy

- (id)connectionWithError:(id *)a3
{
  return -[LNBundleConnectionPolicy connectionWithUserIdentity:error:](self, "connectionWithUserIdentity:error:", 0, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (LNBundleConnectionPolicy)initWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  LNBundleConnectionPolicy *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  uint64_t v12;
  NSString *appBundleIdentifier;
  LNBundleConnectionPolicy *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNBundleConnectionPolicy.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v17.receiver = self;
  v17.super_class = (Class)LNBundleConnectionPolicy;
  v9 = -[LNBundleConnectionPolicy init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    appBundleIdentifier = v9->_appBundleIdentifier;
    v9->_appBundleIdentifier = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

- (id)connectionWithUserIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  +[LNConnectionManager sharedInstance](LNConnectionManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleConnectionPolicy bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectionForBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:mangledTypeName:userIdentity:error:", v8, 0, 0, v9, 0, v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  -[LNBundleConnectionPolicy bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, bundleIdentifier: %@, appBundleIdentifier: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNBundleConnectionPolicy bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNBundleConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNBundleConnectionPolicy *v4;
  LNBundleConnectionPolicy *v5;
  LNBundleConnectionPolicy *v6;
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

  v4 = (LNBundleConnectionPolicy *)a3;
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
    -[LNBundleConnectionPolicy bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleConnectionPolicy bundleIdentifier](v6, "bundleIdentifier");
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
    -[LNBundleConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleConnectionPolicy appBundleIdentifier](v6, "appBundleIdentifier");
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

@end
