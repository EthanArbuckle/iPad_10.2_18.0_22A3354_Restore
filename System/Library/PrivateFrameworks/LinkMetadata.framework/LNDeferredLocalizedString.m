@implementation LNDeferredLocalizedString

- (LNDeferredLocalizedString)initWithLocalizedKey:(id)a3 arguments:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNDeferredLocalizedString *v10;
  uint64_t v11;
  NSString *localizedKey;
  uint64_t v13;
  NSArray *arguments;
  LNDeferredLocalizedString *v15;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDeferredLocalizedString.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedKey"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDeferredLocalizedString.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arguments"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNDeferredLocalizedString;
  v10 = -[LNDeferredLocalizedString init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    localizedKey = v10->_localizedKey;
    v10->_localizedKey = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    arguments = v10->_arguments;
    v10->_arguments = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNDeferredLocalizedString *v4;
  LNDeferredLocalizedString *v5;
  LNDeferredLocalizedString *v6;
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

  v4 = (LNDeferredLocalizedString *)a3;
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
    -[LNDeferredLocalizedString localizedKey](self, "localizedKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDeferredLocalizedString localizedKey](v6, "localizedKey");
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
    -[LNDeferredLocalizedString arguments](self, "arguments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDeferredLocalizedString arguments](v6, "arguments");
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

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNDeferredLocalizedString localizedKey](self, "localizedKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNDeferredLocalizedString arguments](self, "arguments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
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
  -[LNDeferredLocalizedString localizedKey](self, "localizedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDeferredLocalizedString arguments](self, "arguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, localizedKey: %@, arguments: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (LNDeferredLocalizedString)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  LNDeferredLocalizedString *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("arguments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      self = -[LNDeferredLocalizedString initWithLocalizedKey:arguments:](self, "initWithLocalizedKey:arguments:", v5, v9);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNDeferredLocalizedString localizedKey](self, "localizedKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localizedKey"));

  -[LNDeferredLocalizedString arguments](self, "arguments");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("arguments"));

}

- (NSString)localizedKey
{
  return self->_localizedKey;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_localizedKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
