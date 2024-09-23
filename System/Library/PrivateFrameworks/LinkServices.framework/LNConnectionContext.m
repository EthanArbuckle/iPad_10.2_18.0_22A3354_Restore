@implementation LNConnectionContext

- (LNConnectionContext)initWithUserIdentity:(id)a3 requiredBundleURLs:(id)a4
{
  id v6;
  id v7;
  LNConnectionContext *v8;
  uint64_t v9;
  LNUserIdentity *userIdentity;
  uint64_t v11;
  NSArray *requiredBundleURLs;
  LNConnectionContext *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LNConnectionContext;
  v8 = -[LNConnectionContext init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    userIdentity = v8->_userIdentity;
    v8->_userIdentity = (LNUserIdentity *)v9;

    v11 = objc_msgSend(v7, "copy");
    requiredBundleURLs = v8->_requiredBundleURLs;
    v8->_requiredBundleURLs = (NSArray *)v11;

    v13 = v8;
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
  -[LNConnectionContext userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnectionContext requiredBundleURLs](self, "requiredBundleURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, userIdentity: %@, requiredBundleURLs: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNConnectionContext userIdentity](self, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("userIdentity"));

  -[LNConnectionContext requiredBundleURLs](self, "requiredBundleURLs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("requiredBundleURLs"));

}

- (LNConnectionContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  LNConnectionContext *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("requiredBundleURLs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[LNConnectionContext initWithUserIdentity:requiredBundleURLs:](self, "initWithUserIdentity:requiredBundleURLs:", v5, v9);
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNConnectionContext userIdentity](self, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNConnectionContext requiredBundleURLs](self, "requiredBundleURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNConnectionContext *v4;
  LNConnectionContext *v5;
  LNConnectionContext *v6;
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

  v4 = (LNConnectionContext *)a3;
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
    -[LNConnectionContext userIdentity](self, "userIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionContext userIdentity](v6, "userIdentity");
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
    -[LNConnectionContext requiredBundleURLs](self, "requiredBundleURLs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionContext requiredBundleURLs](v6, "requiredBundleURLs");
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
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToArray:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (NSArray)requiredBundleURLs
{
  return self->_requiredBundleURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredBundleURLs, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
