@implementation ISTagIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISTagIcon)initWithTag:(id)a3 tagClass:(id)a4 baseType:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ISTagIcon *v17;
  uint64_t v18;
  NSString *tag;
  uint64_t v20;
  NSString *tagClass;
  uint64_t v22;
  NSString *baseType;
  objc_super v25;

  v8 = a4;
  v9 = a5;
  v10 = &stru_1E5801B98;
  if (a3)
    v10 = (__CFString *)a3;
  v11 = v10;
  v12 = (void *)MEMORY[0x1E0CB3A28];
  -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
  {
    objc_msgSend(v13, "stringByAppendingString:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_IF_UUIDWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "_IF_UUIDWithString:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v25.receiver = self;
  v25.super_class = (Class)ISTagIcon;
  v17 = -[ISConcreteIcon initWithDigest:](&v25, sel_initWithDigest_, v16);
  if (v17)
  {
    v18 = -[__CFString copy](v11, "copy");
    tag = v17->_tag;
    v17->_tag = (NSString *)v18;

    v20 = objc_msgSend(v8, "copy");
    tagClass = v17->_tagClass;
    v17->_tagClass = (NSString *)v20;

    v22 = objc_msgSend(v9, "copy");
    baseType = v17->_baseType;
    v17->_baseType = (NSString *)v22;

  }
  return v17;
}

- (ISTagIcon)initWithFileExtension:(id)a3
{
  return -[ISTagIcon initWithTag:tagClass:baseType:](self, "initWithTag:tagClass:baseType:", a3, *MEMORY[0x1E0CA5A88], *MEMORY[0x1E0CA5BA0]);
}

- (ISTagIcon)initWithFileExtension:(id)a3 baseType:(id)a4
{
  return -[ISTagIcon initWithTag:tagClass:baseType:](self, "initWithTag:tagClass:baseType:", a3, *MEMORY[0x1E0CA5A88], a4);
}

- (ISTagIcon)initWithTypeCode:(unsigned int)a3
{

  return 0;
}

- (ISTagIcon)initWithMIMEType:(id)a3
{
  return -[ISTagIcon initWithTag:tagClass:baseType:](self, "initWithTag:tagClass:baseType:", a3, *MEMORY[0x1E0CA5A90], 0);
}

- (ISTagIcon)initWithModelCode:(id)a3
{
  return -[ISTagIcon initWithTag:tagClass:baseType:](self, "initWithTag:tagClass:baseType:", a3, *MEMORY[0x1E0CA5A80], 0);
}

- (ISTagIcon)initWithCoder:(id)a3
{
  id v4;
  ISTagIcon *v5;
  uint64_t v6;
  NSString *tag;
  uint64_t v8;
  NSString *tagClass;
  uint64_t v10;
  NSString *baseType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ISTagIcon;
  v5 = -[ISConcreteIcon initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v6 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tagClass"));
    v8 = objc_claimAutoreleasedReturnValue();
    tagClass = v5->_tagClass;
    v5->_tagClass = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseType"));
    v10 = objc_claimAutoreleasedReturnValue();
    baseType = v5->_baseType;
    v5->_baseType = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISTagIcon;
  v4 = a3;
  -[ISConcreteIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tag, CFSTR("tag"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tagClass, CFSTR("tagClass"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseType, CFSTR("baseType"));

}

- (id)makeResourceProvider
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithTag:ofClass:conformingToIdentifier:", self->_tag, self->_tagClass, self->_baseType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](self->_tagClass, "isEqualToString:", *MEMORY[0x1E0CA5A80])
    || (objc_msgSend(v3, "conformsToTypeIdentifier:", *MEMORY[0x1E0CA5B58]) & 1) != 0
    || (objc_msgSend(v3, "conformsToTypeIdentifier:", CFSTR("com.apple.sidebar-document-type")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58B0]), "initWithTypeIdentifier:", v4);
    objc_msgSend(v13, "setBundleClassMask:", 2052);
    v22 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithConfiguration:error:", v13, &v22);
    v14 = v22;
    if (!v5)
    {
      _ISDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ISTagIcon makeResourceProvider].cold.1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

    }
  }
  if (-[NSString isEqualToString:](self->_tagClass, "isEqualToString:", *MEMORY[0x1E0CA5A88]))
  {
    v6 = self->_tag;
  }
  else
  {
    objc_msgSend(v3, "_IS_primaryFilenameExtension");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  -[ISBindableIcon resourceProviderWithClaim:typeRecord:fileExtension:](self, "resourceProviderWithClaim:typeRecord:fileExtension:", v5, v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && (objc_msgSend(v8, "isDocumentBadge") & 1) == 0)
  {
    +[ISIcon templateTypeForTag:tagClass:](ISIcon, "templateTypeForTag:tagClass:", self->_tag, self->_tagClass);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ISIcon templateTypeForTag:tagClass:](ISIcon, "templateTypeForTag:tagClass:", self->_tag, self->_tagClass);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v3, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISIcon templateTypeForType:](ISIcon, "templateTypeForType:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v9, "setTemplateType:", v10);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ISTagIcon;
  -[ISTagIcon description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Tag: %@, Class: %@, Base type: %@"), v4, self->_tag, self->_tagClass, self->_baseType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_fallbackKey
{
  void *v3;
  void *v4;
  objc_super v6;

  -[ISTagIcon tag](self, "tag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ISTagIcon tag](self, "tag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ISTagIcon;
    -[ISConcreteIcon _fallbackKey](&v6, sel__fallbackKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)tagClass
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)baseType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseType, 0);
  objc_storeStrong((id *)&self->_tagClass, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

- (void)makeResourceProvider
{
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, a2, a3, "Claim not found with error: %@", a5, a6, a7, a8, 2u);
}

@end
