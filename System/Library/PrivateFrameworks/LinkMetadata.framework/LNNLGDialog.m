@implementation LNNLGDialog

- (LNNLGDialog)initWithNLGParams:(id)a3 options:(id)a4 fallbackDialog:(id)a5 localeIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNNLGDialog *v15;
  uint64_t v16;
  NSArray *nlgParams;
  uint64_t v18;
  NSString *options;
  uint64_t v20;
  LNDialog *fallbackDialog;
  LNNLGDialog *v22;
  void *v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNNLGDialog.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nlgParams"));

  }
  v25.receiver = self;
  v25.super_class = (Class)LNNLGDialog;
  v15 = -[LNDialog initWithLocaleIdentifier:](&v25, sel_initWithLocaleIdentifier_, v14);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    nlgParams = v15->_nlgParams;
    v15->_nlgParams = (NSArray *)v16;

    v18 = objc_msgSend(v12, "copy");
    options = v15->_options;
    v15->_options = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    fallbackDialog = v15->_fallbackDialog;
    v15->_fallbackDialog = (LNDialog *)v20;

    v22 = v15;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  LNNLGDialog *v4;
  LNNLGDialog *v5;
  LNNLGDialog *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (LNNLGDialog *)a3;
  v5 = v4;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNNLGDialog nlgParams](self, "nlgParams");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNNLGDialog nlgParams](v6, "nlgParams");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[LNNLGDialog options](self, "options");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNNLGDialog options](v6, "options");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[LNNLGDialog fallbackDialog](self, "fallbackDialog");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNNLGDialog fallbackDialog](v6, "fallbackDialog");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[LNNLGDialog nlgParams](self, "nlgParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNNLGDialog fallbackDialog](self, "fallbackDialog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNNLGDialog options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

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
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNNLGDialog nlgParams](self, "nlgParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNNLGDialog options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNNLGDialog fallbackDialog](self, "fallbackDialog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, nlgParams: %@, options: %@, fallbackDialog: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (LNNLGDialog)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LNNLGDialog *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("nlgParams"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackDialog"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[LNNLGDialog initWithNLGParams:options:fallbackDialog:localeIdentifier:](self, "initWithNLGParams:options:fallbackDialog:localeIdentifier:", v8, v10, v11, v9);

      v12 = self;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNNLGDialog nlgParams](self, "nlgParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("nlgParams"));

  -[LNNLGDialog options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("options"));

  -[LNNLGDialog fallbackDialog](self, "fallbackDialog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("fallbackDialog"));

  -[LNDialog localeIdentifier](self, "localeIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("localeIdentifier"));

}

- (NSArray)nlgParams
{
  return self->_nlgParams;
}

- (NSString)options
{
  return self->_options;
}

- (LNDialog)fallbackDialog
{
  return self->_fallbackDialog;
}

- (NSData)securityScopeData
{
  return self->_securityScopeData;
}

- (void)setSecurityScopeData:(id)a3
{
  objc_storeStrong((id *)&self->_securityScopeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopeData, 0);
  objc_storeStrong((id *)&self->_fallbackDialog, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_nlgParams, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
