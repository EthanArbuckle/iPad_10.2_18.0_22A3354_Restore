@implementation LNDynamicOptionsProviderReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
}

- (LNDynamicOptionsProviderReference)initWithParameterIdentifier:(id)a3
{
  id v5;
  LNDynamicOptionsProviderReference *v6;
  uint64_t v7;
  NSString *parameterIdentifier;
  LNDynamicOptionsProviderReference *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDynamicOptionsProviderReference.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterIdentifier"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNDynamicOptionsProviderReference;
  v6 = -[LNDynamicOptionsProviderReference init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    parameterIdentifier = v6->_parameterIdentifier;
    v6->_parameterIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDynamicOptionsProviderReference parameterIdentifier](self, "parameterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, parameterIdentifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNDynamicOptionsProviderReference parameterIdentifier](self, "parameterIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterIdentifier"));

}

- (LNDynamicOptionsProviderReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNDynamicOptionsProviderReference *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNDynamicOptionsProviderReference initWithParameterIdentifier:](self, "initWithParameterIdentifier:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNDynamicOptionsProviderReference parameterIdentifier](self, "parameterIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNDynamicOptionsProviderReference *v4;
  LNDynamicOptionsProviderReference *v5;
  LNDynamicOptionsProviderReference *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNDynamicOptionsProviderReference *)a3;
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
      -[LNDynamicOptionsProviderReference parameterIdentifier](self, "parameterIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNDynamicOptionsProviderReference parameterIdentifier](v6, "parameterIdentifier");
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

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
