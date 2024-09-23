@implementation ISApplicationIdentityIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISApplicationIdentityIcon)initWithApplicationIdentity:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ISApplicationIdentityIcon *v27;
  uint64_t v28;
  NSString *identityString;
  objc_super v31;
  id v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  objc_msgSend(v4, "findApplicationRecordWithError:", &v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v32;
  if (!v9)
  {
    _ISDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    objc_msgSend(v4, "identityString");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v19;
    v35 = 2112;
    v36 = v20;
    _os_log_impl(&dword_1AA928000, v18, OS_LOG_TYPE_DEFAULT, "No record for identity: %@. Error: %@", buf, 0x16u);

    goto LABEL_15;
  }
  if (objc_msgSend(v9, "isPlaceholder"))
  {
    objc_msgSend(v9, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__is__contentModifiedDate");
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3940];
    -[NSObject timeIntervalSinceReferenceDate](v12, "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%f"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _ISDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ISApplicationIdentityIcon initWithApplicationIdentity:].cold.2();

LABEL_11:
    goto LABEL_12;
  }
  objc_msgSend(v9, "persistentIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v9, "persistentIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_IF_UUIDWithData:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _ISDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ISApplicationIdentityIcon initWithApplicationIdentity:].cold.3();
    goto LABEL_11;
  }
  v16 = v8;
LABEL_12:
  objc_msgSend(v9, "alternateIconName");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v16, "stringByAppendingPathComponent:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _ISDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ISApplicationIdentityIcon initWithApplicationIdentity:].cold.1();
LABEL_15:

    goto LABEL_17;
  }
  v8 = v16;
LABEL_17:

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)ISApplicationIdentityIcon;
  v27 = -[ISConcreteIcon initWithDigest:](&v31, sel_initWithDigest_, v26);
  if (v27)
  {
    objc_msgSend(v4, "identityString");
    v28 = objc_claimAutoreleasedReturnValue();
    identityString = v27->_identityString;
    v27->_identityString = (NSString *)v28;

  }
  return v27;
}

- (ISApplicationIdentityIcon)initWithCoder:(id)a3
{
  id v4;
  ISApplicationIdentityIcon *v5;
  uint64_t v6;
  NSString *identityString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISApplicationIdentityIcon;
  v5 = -[ISConcreteIcon initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identityString"));
    v6 = objc_claimAutoreleasedReturnValue();
    identityString = v5->_identityString;
    v5->_identityString = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISApplicationIdentityIcon;
  v4 = a3;
  -[ISConcreteIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identityString, CFSTR("identityString"), v5.receiver, v5.super_class);

}

- (id)_resourceForPersona:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithSystemColor:", 10);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSymbolColors:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithSystemColor:", 4);
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnclosureColors:", v7);

  objc_msgSend(v3, "setRenderingMode:", 3);
  +[ISGraphicSymbolResource graphicSymbolResourceWithConfiguration:symbolName:url:](ISGraphicSymbolResource, "graphicSymbolResourceWithConfiguration:symbolName:url:", v3, CFSTR("frying.pan"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)_personaType
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc(MEMORY[0x1E0CA5850]);
  -[ISApplicationIdentityIcon identityString](self, "identityString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentityString:", v4);

  v6 = objc_msgSend(v5, "personaType");
  return v6;
}

- (id)_makeResourceProviderAllowIconResourceFallback:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  ISRecordResourceProvider *v17;
  ISRecordResourceProvider *v18;
  void *v19;
  NSObject *v20;
  ISRecordResourceProvider *v21;
  id v23;
  uint8_t buf[4];
  ISApplicationIdentityIcon *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CA5850]);
  -[ISApplicationIdentityIcon identityString](self, "identityString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentityString:", v6);

  -[ISApplicationIdentityIcon _personaType](self, "_personaType");
  v23 = 0;
  objc_msgSend(v7, "findApplicationRecordWithError:", &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  if (v8)
  {
    v10 = v8;
    v11 = 1;
  }
  else
  {
    _ISDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = self;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1AA928000, v12, OS_LOG_TYPE_DEFAULT, "Unable to create resource provider for %@ - unable to find record. Error: %@", buf, 0x16u);

    }
    v14 = (void *)MEMORY[0x1E0CA5928];
    objc_msgSend((id)*MEMORY[0x1E0CEC440], "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "typeRecordWithIdentifier:", v15);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
      v16 = v10;

    v11 = 0;
  }
  v17 = -[ISRecordResourceProvider initWithRecord:options:]([ISRecordResourceProvider alloc], "initWithRecord:options:", v10, 0);
  v18 = v17;
  if (v3)
  {
    -[ISRecordResourceProvider iconResource](v17, "iconResource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      _ISDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ISApplicationIdentityIcon _makeResourceProviderAllowIconResourceFallback:].cold.1();

      +[ISResourceProvider defaultAppIconResourceProvider](ISResourceProvider, "defaultAppIconResourceProvider");
      v21 = (ISRecordResourceProvider *)objc_claimAutoreleasedReturnValue();

      -[ISResourceProvider setPlaceholder:](v21, "setPlaceholder:", 1);
      v18 = v21;
    }
  }
  -[ISResourceProvider setResourceType:](v18, "setResourceType:", v11);

  return v18;
}

- (id)makeResourceProvider
{
  return -[ISApplicationIdentityIcon _makeResourceProviderAllowIconResourceFallback:](self, "_makeResourceProviderAllowIconResourceFallback:", 1);
}

- (id)makeSymbolResourceProvider
{
  return -[ISApplicationIdentityIcon _makeResourceProviderAllowIconResourceFallback:](self, "_makeResourceProviderAllowIconResourceFallback:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ISApplicationIdentityIcon;
  -[ISApplicationIdentityIcon description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISApplicationIdentityIcon identityString](self, "identityString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISConcreteIcon digest](self, "digest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ identity: %@ digest: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identityString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityString, 0);
}

- (void)initWithApplicationIdentity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Custom icon suffixed identity bundle ID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithApplicationIdentity:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Placeholder identity bundle suffixed bundle ID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithApplicationIdentity:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, v0, v1, "Suffixed identity bundle ID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_makeResourceProviderAllowIconResourceFallback:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1AA928000, v1, OS_LOG_TYPE_ERROR, "Failed to find icon resources for application identity %@ - %@. Creating placeholder provider", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
