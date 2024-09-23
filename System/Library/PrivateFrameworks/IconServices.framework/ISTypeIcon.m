@implementation ISTypeIcon

- (ISTypeIcon)initWithType:(id)a3
{
  id v5;
  void *v6;
  ISTypeIcon *v7;
  ISTypeIcon *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)ISTypeIcon;
  v7 = -[ISConcreteIcon initWithDigest:](&v10, sel_initWithDigest_, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_type, a3);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ISTypeIcon;
  -[ISTypeIcon description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@,Type: %@"), v4, self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISTypeIcon)initWithCoder:(id)a3
{
  id v4;
  ISTypeIcon *v5;
  uint64_t v6;
  NSString *type;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISTypeIcon;
  v5 = -[ISConcreteIcon initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISTypeIcon;
  v4 = a3;
  -[ISConcreteIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);

}

- (id)makeResourceProvider
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  if (!self->_type
    || (objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", *MEMORY[0x1E0CA5BA0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v3, "conformsToTypeIdentifier:", *MEMORY[0x1E0CA5B58]) & 1) != 0
    || (objc_msgSend(v3, "conformsToTypeIdentifier:", CFSTR("com.apple.sidebar-document-type")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58B0]), "initWithTypeIdentifier:", self->_type);
    objc_msgSend(v5, "setBundleClassMask:", 2052);
    v18 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithConfiguration:error:", v5, &v18);
    v6 = v18;
    if (!v4)
    {
      _ISDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[ISTagIcon makeResourceProvider].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  objc_msgSend(v3, "_IS_primaryFilenameExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBindableIcon resourceProviderWithClaim:typeRecord:fileExtension:](self, "resourceProviderWithClaim:typeRecord:fileExtension:", v4, v3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISIcon templateTypeForType:](ISIcon, "templateTypeForType:", self->_type);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTemplateType:", v16);

  return v15;
}

- (id)symbol
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ISTypeIcon type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISSymbol symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:](ISSymbol, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v3, 0, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _ISDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[ISTypeIcon type](self, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v6;

    }
    v8.receiver = self;
    v8.super_class = (Class)ISTypeIcon;
    -[ISConcreteIcon symbol](&v8, sel_symbol);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_fallbackKey
{
  void *v3;
  void *v4;
  objc_super v6;

  -[ISTypeIcon type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ISTypeIcon type](self, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ISTypeIcon;
    -[ISConcreteIcon _fallbackKey](&v6, sel__fallbackKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

@end
