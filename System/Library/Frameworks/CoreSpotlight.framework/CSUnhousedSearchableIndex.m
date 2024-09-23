@implementation CSUnhousedSearchableIndex

- (CSUnhousedSearchableIndex)initWithName:(id)a3 protectionClass:(id)a4 path:(id)a5
{
  id v8;
  CSUnhousedSearchableIndex *v9;
  CSUnhousedSearchableIndex *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CSUnhousedSearchableIndex;
  v9 = -[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:](&v12, sel__initWithName_protectionClass_bundleIdentifier_options_, a3, a4, 0, 0);
  v10 = v9;
  if (v9)
  {
    -[CSUnhousedSearchableIndex setIndexPath:](v9, "setIndexPath:", v8);
    -[CSUnhousedSearchableIndex setAttemptedIndexPathResolution:](v10, "setAttemptedIndexPathResolution:", 0);
  }

  return v10;
}

- (CSUnhousedSearchableIndex)initWithPath:(id)a3
{
  return -[CSUnhousedSearchableIndex initWithName:protectionClass:path:](self, "initWithName:protectionClass:path:", a3, 0, a3);
}

- (void)dealloc
{
  objc_super v3;

  +[CSUnhousedIndexConnection removeUnhousedIndexConnectionForToken:](CSUnhousedIndexConnection, "removeUnhousedIndexConnectionForToken:", self->_resolvedIndexPath);
  -[CSUnhousedSearchableIndex setSavedConnection:](self, "setSavedConnection:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CSUnhousedSearchableIndex;
  -[CSSearchableIndex dealloc](&v3, sel_dealloc);
}

- (NSString)resolvedIndexPath
{
  void *v3;
  NSString *v4;
  NSString *resolvedIndexPath;
  unsigned int v7;

  if (!-[CSUnhousedSearchableIndex attemptedIndexPathResolution](self, "attemptedIndexPathResolution"))
  {
    v7 = -[CSUnhousedSearchableIndex resolvedIndexPathErrorCode](self, "resolvedIndexPathErrorCode");
    -[CSUnhousedSearchableIndex indexPath](self, "indexPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CSResolveUnhousedIndexPath(v3, (int *)&v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    resolvedIndexPath = self->_resolvedIndexPath;
    self->_resolvedIndexPath = v4;

    -[CSUnhousedSearchableIndex setResolvedIndexPathErrorCode:](self, "setResolvedIndexPathErrorCode:", v7);
    -[CSUnhousedSearchableIndex setAttemptedIndexPathResolution:](self, "setAttemptedIndexPathResolution:", 1);
  }
  return self->_resolvedIndexPath;
}

- (id)initialConnection
{
  return 0;
}

- (id)connection
{
  CSIndexConnection *savedConnection;
  CSIndexConnection *v4;
  CSIndexConnection *v5;

  savedConnection = self->_savedConnection;
  if (!savedConnection)
  {
    -[CSUnhousedSearchableIndex initialConnection](self, "initialConnection");
    v4 = (CSIndexConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_savedConnection;
    self->_savedConnection = v4;

    savedConnection = self->_savedConnection;
  }
  return savedConnection;
}

- (const)defaultIndexPath
{
  return 0;
}

- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5
{
  return a3;
}

- (id)xpc_dictionary_for_command:(const char *)a3 requiresInitialization:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  CSUnhousedSearchableIndex *v25;
  id v26;
  objc_super v27;

  v4 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CSUnhousedSearchableIndex;
  -[CSSearchableIndex xpc_dictionary_for_command:requiresInitialization:](&v27, sel_xpc_dictionary_for_command_requiresInitialization_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __79__CSUnhousedSearchableIndex_xpc_dictionary_for_command_requiresInitialization___block_invoke;
  v24 = &unk_1E24013B8;
  v25 = self;
  v7 = v6;
  v26 = v7;
  if (xpc_dictionary_for_command_requiresInitialization__onceToken != -1)
    dispatch_once(&xpc_dictionary_for_command_requiresInitialization__onceToken, &v21);
  -[CSUnhousedSearchableIndex indexPath](self, "indexPath", v21, v22, v23, v24, v25);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[CSUnhousedSearchableIndex resolvedIndexPath](self, "resolvedIndexPath"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CSUnhousedSearchableIndex xpc_dictionary_for_command:requiresInitialization:].cold.1(self, v14);

    xpc_dictionary_set_int64(v7, "re", -[CSUnhousedSearchableIndex resolvedIndexPathErrorCode](self, "resolvedIndexPathErrorCode"));
  }
  else if (v4)
  {
    -[CSUnhousedSearchableIndex resolvedIndexPath](self, "resolvedIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[CSUnhousedSearchableIndex resolvedIndexPath](self, "resolvedIndexPath");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = (const char *)objc_msgSend(v12, "UTF8String");

    }
    else
    {
      v13 = -[CSUnhousedSearchableIndex defaultIndexPath](self, "defaultIndexPath");
    }

    if (v13)
    {
      -[CSUnhousedSearchableIndex connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "connection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSUnhousedSearchableIndex addExtensionToken:indexPath:connection:](self, "addExtensionToken:indexPath:connection:", v7, v13, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v17;
    }
  }
  v18 = v26;
  v19 = v7;

  return v19;
}

void __79__CSUnhousedSearchableIndex_xpc_dictionary_for_command_requiresInitialization___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;

  if (hasInternalCSEntitlement())
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      logForCSLogCategoryDefault();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __79__CSUnhousedSearchableIndex_xpc_dictionary_for_command_requiresInitialization___block_invoke_cold_1();

      v4 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v4, "private-bundle-override", (const char *)objc_msgSend(v5, "UTF8String"));

    }
  }
}

- (BOOL)attemptedIndexPathResolution
{
  return self->_attemptedIndexPathResolution;
}

- (void)setAttemptedIndexPathResolution:(BOOL)a3
{
  self->_attemptedIndexPathResolution = a3;
}

- (int)resolvedIndexPathErrorCode
{
  return self->_resolvedIndexPathErrorCode;
}

- (void)setResolvedIndexPathErrorCode:(int)a3
{
  self->_resolvedIndexPathErrorCode = a3;
}

- (NSString)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (CSIndexConnection)savedConnection
{
  return self->_savedConnection;
}

- (void)setSavedConnection:(id)a3
{
  objc_storeStrong((id *)&self->_savedConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_savedConnection, 0);
  objc_storeStrong((id *)&self->_resolvedIndexPath, 0);
}

- (void)xpc_dictionary_for_command:(void *)a1 requiresInitialization:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, a2, v4, "~~~ setting cs_unhoused_index_resolve_path_error, couldn't resolve %@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __79__CSUnhousedSearchableIndex_xpc_dictionary_for_command_requiresInitialization___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_18C42F000, v0, v1, "~~~ setting cs_command_unhoused_index_bundle_override.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
