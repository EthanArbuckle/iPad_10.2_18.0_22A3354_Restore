@implementation CMLClientConfig

- (CMLClientConfig)initWithUseCase:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  CMLClientConfig *v9;
  CMLClientConfig *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CMLClientConfig;
  v9 = -[CMLClientConfig init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_useCase, a3);
    objc_storeStrong((id *)&v10->_sourceApplicationBundleIdentifier, a4);
  }

  return v10;
}

- (CMLClientConfig)initWithUseCase:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CMLClientConfig *v8;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CMLClientConfig initWithUseCase:sourceApplicationBundleIdentifier:](self, "initWithUseCase:sourceApplicationBundleIdentifier:", v5, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CMLClientConfig *v4;
  CMLClientConfig *v5;
  BOOL v6;

  v4 = (CMLClientConfig *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CMLClientConfig isEqualToClientConfig:](self, "isEqualToClientConfig:", v5);

  return v6;
}

- (BOOL)isEqualToClientConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  -[CMLClientConfig sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceApplicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[CMLClientConfig sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceApplicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  -[CMLClientConfig useCase](self, "useCase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "useCase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11) & v9;

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CMLClientConfig useCase](self, "useCase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CMLClientConfig sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLClientConfig)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CMLClientConfig *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useCase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApplicationBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CMLClientConfig initWithUseCase:sourceApplicationBundleIdentifier:](self, "initWithUseCase:sourceApplicationBundleIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CMLClientConfig useCase](self, "useCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("useCase"));

  -[CMLClientConfig sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceApplicationBundleIdentifier"));

}

- (NSString)useCase
{
  return self->_useCase;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
}

@end
