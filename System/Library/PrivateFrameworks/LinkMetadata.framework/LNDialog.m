@implementation LNDialog

- (LNDialog)initWithLocaleIdentifier:(id)a3
{
  id v5;
  LNDialog *v6;
  uint64_t v7;
  NSString *localeIdentifier;
  LNDialog *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDialog.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localeIdentifier"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNDialog;
  v6 = -[LNDialog init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    localeIdentifier = v6->_localeIdentifier;
    v6->_localeIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNDialog localeIdentifier](self, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNDialog *v4;
  LNDialog *v5;
  LNDialog *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNDialog *)a3;
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
      -[LNDialog localeIdentifier](self, "localeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNDialog localeIdentifier](v6, "localeIdentifier");
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
          v12 = objc_msgSend(v9, "isEqualToString:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (LNDialog)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNDialog *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNDialog initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNDialog localeIdentifier](self, "localeIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localeIdentifier"));

}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
