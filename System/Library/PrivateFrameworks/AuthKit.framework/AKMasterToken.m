@implementation AKMasterToken

+ (id)tokenWithExternalizedVersionString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tokenWithExternalizedVersion:lifetime:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)tokenWithExternalizedVersion:(id)a3 lifetime:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  AKMasterToken *v9;
  uint64_t v10;
  NSMutableDictionary *properties;
  void *v12;
  uint64_t v13;
  NSDate *expirationDate;
  NSObject *v15;
  id v17;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_alloc_init(AKMasterToken);
    v10 = objc_msgSend(v7, "mutableCopy");
    properties = v9->_properties;
    v9->_properties = (NSMutableDictionary *)v10;

    v12 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v12, "dateWithTimeIntervalSinceNow:");
    v13 = objc_claimAutoreleasedReturnValue();
    expirationDate = v9->super._expirationDate;
    v9->super._expirationDate = (NSDate *)v13;
  }
  else
  {
    expirationDate = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 1);
    _AKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[AKMasterToken tokenWithExternalizedVersion:lifetime:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (BOOL)updateWithHTTPURLResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  objc_msgSend(a3, "allHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-Identity-Token"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKToken tokenWithBase64String:](AKToken, "tokenWithBase64String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-Session-Key"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X-Apple-Encrypted-Session-Key"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v6, "stringValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKMasterToken setStringValue:](self, "setStringValue:", v9);

        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
        -[AKMasterToken _setSessionKey:](self, "_setSessionKey:", v10);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
        -[AKMasterToken _setEncryptedSessionKey:](self, "_setEncryptedSessionKey:", v11);

        v12 = 1;
LABEL_14:

        goto LABEL_15;
      }
      _AKLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[AKMasterToken updateWithHTTPURLResponse:].cold.3(v27, v28, v29, v30, v31, v32, v33, v34);

    }
    else
    {
      _AKLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AKMasterToken updateWithHTTPURLResponse:].cold.2(v8, v20, v21, v22, v23, v24, v25, v26);
    }
    v12 = 0;
    goto LABEL_14;
  }
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[AKMasterToken updateWithHTTPURLResponse:].cold.1(v7, v13, v14, v15, v16, v17, v18, v19);
  v12 = 0;
LABEL_15:

  return v12;
}

- (AKMasterToken)init
{
  return -[AKMasterToken initWithAppleID:altDSID:](self, "initWithAppleID:altDSID:", 0, 0);
}

- (AKMasterToken)initWithAppleID:(id)a3 altDSID:(id)a4
{
  id v6;
  id v7;
  AKMasterToken *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *properties;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKMasterToken;
  v8 = -[AKMasterToken init](&v12, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    properties = v8->_properties;
    v8->_properties = v9;

    if (v6)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_properties, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CFCF08]);
    if (v7)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_properties, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CFCEE8]);
  }

  return v8;
}

- (id)stringValue
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF00]);
}

- (void)setStringValue:(id)a3
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CFCF00]);
}

- (NSData)sessionKey
{
  return (NSData *)-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCEF8]);
}

- (void)_setSessionKey:(id)a3
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CFCEF8]);
}

- (NSData)encryptedSessionKey
{
  return (NSData *)-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCEF0]);
}

- (void)_setEncryptedSessionKey:(id)a3
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CFCEF0]);
}

- (NSData)externalizedVersion
{
  NSMutableDictionary *properties;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  properties = self->_properties;
  if (properties)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", properties, 100, 0, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (v4)
    {
      _AKLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[AKMasterToken externalizedVersion].cold.1();

    }
  }
  else
  {
    v3 = 0;
  }
  return (NSData *)v3;
}

- (NSString)externalizedVersionString
{
  void *v2;
  void *v3;

  -[AKMasterToken externalizedVersion](self, "externalizedVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 1);
  else
    v3 = 0;

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

+ (void)tokenWithExternalizedVersion:lifetime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Error: Got malformed GS token data!\n%@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithHTTPURLResponse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a1, a3, "Value for %@ is missing/invalid!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithHTTPURLResponse:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a1, a3, "Nil value for expected header: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithHTTPURLResponse:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a1, a3, "Nil value for expected header: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)externalizedVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Unable to serialized token properties! Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
