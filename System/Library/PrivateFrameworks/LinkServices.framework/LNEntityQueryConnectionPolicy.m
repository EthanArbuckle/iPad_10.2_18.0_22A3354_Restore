@implementation LNEntityQueryConnectionPolicy

- (LNEntityQueryConnectionPolicy)initWithEntityQueryIdentifier:(id)a3 entityQueryMangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 appBundleIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNEntityQueryConnectionPolicy *v15;
  uint64_t v16;
  NSString *entityQueryIdentifier;
  uint64_t v18;
  NSString *entityQueryMangledTypeName;
  uint64_t v20;
  LNEffectiveBundleIdentifier *effectiveBundleIdentifier;
  uint64_t v22;
  NSString *appBundleIdentifier;
  LNEntityQueryConnectionPolicy *v24;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityQueryConnectionPolicy.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityQueryMangledTypeName"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityQueryConnectionPolicy.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityQueryIdentifier"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEntityQueryConnectionPolicy.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("effectiveBundleIdentifier"));

LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)LNEntityQueryConnectionPolicy;
  v15 = -[LNEntityQueryConnectionPolicy init](&v29, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    entityQueryIdentifier = v15->_entityQueryIdentifier;
    v15->_entityQueryIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    entityQueryMangledTypeName = v15->_entityQueryMangledTypeName;
    v15->_entityQueryMangledTypeName = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    effectiveBundleIdentifier = v15->_effectiveBundleIdentifier;
    v15->_effectiveBundleIdentifier = (LNEffectiveBundleIdentifier *)v20;

    v22 = objc_msgSend(v14, "copy");
    appBundleIdentifier = v15->_appBundleIdentifier;
    v15->_appBundleIdentifier = (NSString *)v22;

    v24 = v15;
  }

  return v15;
}

- (id)connectionWithError:(id *)a3
{
  return -[LNEntityQueryConnectionPolicy connectionWithUserIdentity:error:](self, "connectionWithUserIdentity:error:", 0, a3);
}

- (id)connectionWithUserIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v19;
  void *v20;

  v6 = a3;
  +[LNConnectionManager sharedInstance](LNConnectionManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityQueryConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityQueryConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[LNEntityQueryConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityQueryConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityQueryConnectionPolicy entityQueryMangledTypeName](self, "entityQueryMangledTypeName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = a4;
  v16 = v7;
  objc_msgSend(v7, "connectionForBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:mangledTypeName:userIdentity:error:", v8, v10, v13, v14, v15, v6, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (LNEntityQueryConnectionPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  LNEntityQueryConnectionPolicy *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityQueryIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityQueryMangledTypeName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectiveBundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = -[LNEntityQueryConnectionPolicy initWithEntityQueryIdentifier:entityQueryMangledTypeName:effectiveBundleIdentifier:appBundleIdentifier:](self, "initWithEntityQueryIdentifier:entityQueryMangledTypeName:effectiveBundleIdentifier:appBundleIdentifier:", v5, v6, v7, v8);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNEntityQueryConnectionPolicy entityQueryIdentifier](self, "entityQueryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entityQueryIdentifier"));

  -[LNEntityQueryConnectionPolicy entityQueryMangledTypeName](self, "entityQueryMangledTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("entityQueryMangledTypeName"));

  -[LNEntityQueryConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("effectiveBundleIdentifier"));

  -[LNEntityQueryConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("appBundleIdentifier"));

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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityQueryConnectionPolicy entityQueryIdentifier](self, "entityQueryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityQueryConnectionPolicy entityQueryMangledTypeName](self, "entityQueryMangledTypeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityQueryConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEntityQueryConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, entityQueryIdentifier: %@, entityQueryMangledTypeName: %@, effectiveBundleIdentifier: %@, appBundleIdentifier: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[LNEntityQueryConnectionPolicy entityQueryIdentifier](self, "entityQueryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNEntityQueryConnectionPolicy entityQueryMangledTypeName](self, "entityQueryMangledTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNEntityQueryConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNEntityQueryConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNEntityQueryConnectionPolicy *v4;
  LNEntityQueryConnectionPolicy *v5;
  LNEntityQueryConnectionPolicy *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v31;
  void *v32;

  v4 = (LNEntityQueryConnectionPolicy *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    -[LNEntityQueryConnectionPolicy entityQueryIdentifier](self, "entityQueryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityQueryConnectionPolicy entityQueryIdentifier](v6, "entityQueryIdentifier");
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
        goto LABEL_33;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[LNEntityQueryConnectionPolicy entityQueryMangledTypeName](self, "entityQueryMangledTypeName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityQueryConnectionPolicy entityQueryMangledTypeName](v6, "entityQueryMangledTypeName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_32;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    -[LNEntityQueryConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityQueryConnectionPolicy effectiveBundleIdentifier](v6, "effectiveBundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v31 = v20;
    v32 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          v12 = objc_msgSend(v20, "isEqual:", v24);

          if (!v12)
          {
            v19 = v32;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      v20 = v31;
      v19 = v32;
      goto LABEL_32;
    }

LABEL_24:
    -[LNEntityQueryConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEntityQueryConnectionPolicy appBundleIdentifier](v6, "appBundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v25 = v29;
    if (v28 == v29)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v29)
        LOBYTE(v12) = objc_msgSend(v28, "isEqualToString:", v29);
    }

    v20 = v28;
    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (NSString)entityQueryIdentifier
{
  return self->_entityQueryIdentifier;
}

- (NSString)entityQueryMangledTypeName
{
  return self->_entityQueryMangledTypeName;
}

- (LNEffectiveBundleIdentifier)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_entityQueryMangledTypeName, 0);
  objc_storeStrong((id *)&self->_entityQueryIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
