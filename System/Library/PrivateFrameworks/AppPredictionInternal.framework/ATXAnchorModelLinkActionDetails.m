@implementation ATXAnchorModelLinkActionDetails

- (ATXAnchorModelLinkActionDetails)initWithBundleID:(id)a3 actionId:(id)a4 linkAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXAnchorModelLinkActionDetails *v11;
  uint64_t v12;
  NSString *bundleId;
  uint64_t v14;
  NSString *actionId;
  uint64_t v16;
  LNAction *linkAction;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXAnchorModelLinkActionDetails;
  v11 = -[ATXAnchorModelLinkActionDetails init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bundleId = v11->_bundleId;
    v11->_bundleId = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    actionId = v11->_actionId;
    v11->_actionId = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    linkAction = v11->_linkAction;
    v11->_linkAction = (LNAction *)v16;

  }
  return v11;
}

- (ATXAnchorModelLinkActionDetails)initWithBundleID:(id)a3 actionId:(id)a4 linkActionEncodedString:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ATXAnchorModelLinkActionDetails *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "linkActionFromEncodedString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ATXAnchorModelLinkActionDetails initWithBundleID:actionId:linkAction:](self, "initWithBundleID:actionId:linkAction:", v10, v9, v11);
  return v12;
}

+ (id)encodedStringForLinkAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v5;
  objc_autoreleasePoolPop(v4);

  if (v6)
  {
    __atxlog_handle_anchor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ATXAnchorModelLinkActionDetails encodedStringForLinkAction:].cold.1();

    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)linkActionFromEncodedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v11;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1CAA48B6C]();
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    objc_autoreleasePoolPop(v5);
    if (v7)
    {
      __atxlog_handle_anchor();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[ATXAnchorModelLinkActionDetails linkActionFromEncodedString:].cold.2();

      v9 = 0;
    }
    else
    {
      v9 = v6;
    }

  }
  else
  {
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ATXAnchorModelLinkActionDetails linkActionFromEncodedString:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionId
{
  return self->_actionId;
}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkAction, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

+ (void)encodedStringForLinkAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Unable to serialize Link action: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)linkActionFromEncodedString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Unable to convert base64 encoded LNAction string to NSData", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)linkActionFromEncodedString:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Unable to decode data from encoded Link action encoded string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
