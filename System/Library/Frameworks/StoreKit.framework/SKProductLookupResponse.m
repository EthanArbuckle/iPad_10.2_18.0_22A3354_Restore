@implementation SKProductLookupResponse

- (SKProductLookupResponse)initWithResult:(id)a3 extensionID:(id)a4 productURL:(id)a5 isEntitled:(BOOL)a6 parameters:(id)a7 deepLinkURL:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SKProductLookupResponse *v18;
  SKProductLookupResponse *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SKProductLookupResponse;
  v18 = -[SKProductLookupResponse init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_resultDictionary, a3);
    objc_storeStrong((id *)&v19->_extensionBundleID, a4);
    objc_storeStrong((id *)&v19->_productURL, a5);
    v19->_isEntitled = a6;
    objc_storeStrong((id *)&v19->_parameters, a7);
    objc_storeStrong((id *)&v19->_deepLinkURL, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *resultDictionary;
  void *v6;
  id v7;
  NSDictionary *parameters;
  void *v9;
  id v10;
  id v11;
  id v12;

  v4 = a3;
  resultDictionary = self->_resultDictionary;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", resultDictionary, 1, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("resultDictionary"));
  if (v7)
  {
    if (SKLogHandleForCategory_onceToken_1 != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken_1, &__block_literal_global_15);
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9_1, OS_LOG_TYPE_ERROR))
      -[SKProductLookupResponse encodeWithCoder:].cold.2();
  }

  parameters = self->_parameters;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", parameters, 1, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  if (v10)
  {
    if (SKLogHandleForCategory_onceToken_1 != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken_1, &__block_literal_global_15);
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9_1, OS_LOG_TYPE_ERROR))
      -[SKProductLookupResponse encodeWithCoder:].cold.1();
  }
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("parameters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionBundleID, CFSTR("extensionBundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_productURL, CFSTR("productURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deepLinkURL, CFSTR("deepLinkURL"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isEntitled, CFSTR("isEntitled"));

}

- (SKProductLookupResponse)initWithCoder:(id)a3
{
  id v4;
  SKProductLookupResponse *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSDictionary *resultDictionary;
  uint64_t v19;
  NSString *extensionBundleID;
  uint64_t v21;
  NSURL *productURL;
  uint64_t v23;
  NSURL *deepLinkURL;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSDictionary *parameters;
  id v31;
  id v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SKProductLookupResponse;
  v5 = -[SKProductLookupResponse init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resultDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v14, v6, &v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v32;
    if (v16)
    {
      if (SKLogHandleForCategory_onceToken_1 != -1)
        dispatch_once(&SKLogHandleForCategory_onceToken_1, &__block_literal_global_15);
      if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9_1, OS_LOG_TYPE_ERROR))
        -[SKProductLookupResponse initWithCoder:].cold.2();
    }

    v17 = objc_msgSend(v15, "copy");
    resultDictionary = v5->_resultDictionary;
    v5->_resultDictionary = (NSDictionary *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleID"));
    v19 = objc_claimAutoreleasedReturnValue();
    extensionBundleID = v5->_extensionBundleID;
    v5->_extensionBundleID = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deepLinkURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    deepLinkURL = v5->_deepLinkURL;
    v5->_deepLinkURL = (NSURL *)v23;

    v5->_isEntitled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEntitled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameters"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v14, v25, &v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v31;
    if (v27)
    {
      if (SKLogHandleForCategory_onceToken_1 != -1)
        dispatch_once(&SKLogHandleForCategory_onceToken_1, &__block_literal_global_15);
      if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9_1, OS_LOG_TYPE_ERROR))
        -[SKProductLookupResponse initWithCoder:].cold.1();
    }
    v28 = objc_msgSend(v26, "copy");
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v28;

  }
  return v5;
}

- (NSDictionary)resultDictionary
{
  return self->_resultDictionary;
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (BOOL)isEntitled
{
  return self->_isEntitled;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSURL)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);
  objc_storeStrong((id *)&self->_resultDictionary, 0);
}

- (void)encodeWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "Failed to encode parameters: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)encodeWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "Failed to encode lookup result: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "Failed to decode parameters: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "Failed to decode lookup result: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
