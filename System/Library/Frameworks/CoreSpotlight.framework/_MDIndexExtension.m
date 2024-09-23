@implementation _MDIndexExtension

- (_MDIndexExtension)initWithExtension:(id)a3 queue:(id)a4 containerPath:(id)a5 containerID:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _MDIndexExtension *v16;

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "numberWithBool:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_MDIndexExtension initWithExtension:queue:containerPath:containerID:supportedFileTypes:extensionLabel:isAppleCodeSigned:](self, "initWithExtension:queue:containerPath:containerID:supportedFileTypes:extensionLabel:isAppleCodeSigned:", v14, v13, v12, v11, 0, 0, v15);

  return v16;
}

- (_MDIndexExtension)initWithExtension:(id)a3 queue:(id)a4 containerPath:(id)a5 containerID:(id)a6 supportedFileTypes:(id)a7 extensionLabel:(id)a8 isAppleCodeSigned:(id)a9
{
  id v16;
  id v17;
  _MDIndexExtension *v18;
  _MDIndexExtension *v19;
  uint64_t v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v16 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v17 = a9;
  v32.receiver = self;
  v32.super_class = (Class)_MDIndexExtension;
  v18 = -[_MDIndexExtension init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_extension, a3);
    objc_storeStrong((id *)&v19->_queue, a4);
    objc_storeStrong((id *)&v19->_containerPath, a5);
    objc_storeStrong((id *)&v19->_containerID, a6);
    objc_storeStrong((id *)&v19->_supportedFileTypes, a7);
    objc_storeStrong((id *)&v19->_extensionLabel, a8);
    objc_storeStrong((id *)&v19->_isAppleCodeSigned, a9);
    location = 0;
    objc_initWeak(&location, v19);
    v20 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke;
    v29[3] = &unk_1E24014F8;
    objc_copyWeak(&v30, &location);
    -[NSExtension setRequestInterruptionBlock:](v19->_extension, "setRequestInterruptionBlock:", v29);
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_1;
    v27[3] = &unk_1E2401520;
    objc_copyWeak(&v28, &location);
    -[NSExtension setRequestCompletionBlock:](v19->_extension, "setRequestCompletionBlock:", v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v19;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_MDIndexExtension extensionID](self, "extensionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("id=%@"), v5);
  objc_msgSend(v3, "addObject:", v6);

  -[_MDIndexExtension identifiers](self, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("identifiers=(%@)"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_MDIndexExtension containerID](self, "containerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("containerId=%@"), v13);
  objc_msgSend(v3, "addObject:", v14);

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_MDIndexExtension containerPath](self, "containerPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("containerPath=%@"), v16);
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  if (-[_MDIndexExtension isInternal](self, "isInternal"))
    objc_msgSend(v18, "addObject:", CFSTR("internal"));
  if (!-[_MDIndexExtension dontRunDuringMigration](self, "dontRunDuringMigration"))
    objc_msgSend(v18, "addObject:", CFSTR("run-on-migration"));
  if (objc_msgSend(v18, "count"))
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR("|"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("flags=%@"), v20);
    objc_msgSend(v3, "addObject:", v21);

  }
  -[_MDIndexExtension supportedFileTypes](self, "supportedFileTypes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count"))
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("supportedFileTypes=(%@)"), v25);
    objc_msgSend(v3, "addObject:", v26);

  }
  v27 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_MDIndexExtension extensionLabel](self, "extensionLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("extensionLabel=%@"), v28);
  objc_msgSend(v3, "addObject:", v29);

  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  v31 = objc_opt_class();
  -[_MDIndexExtension extension](self, "extension");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("<%@:%p; %@, %@>"), v31, self, v32, v33);

  return v34;
}

- (NSString)extensionID
{
  void *v2;
  void *v3;

  -[_MDIndexExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[_MDIndexExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "optedIn");

  return v3;
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)-[NSExtension infoDictionary](self->_extension, "infoDictionary");
}

- (BOOL)isInternal
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[_MDIndexExtension extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CoreSpotlightDontRunDuringMigration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)dontRunDuringMigration
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[_MDIndexExtension isInternal](self, "isInternal");
  if (v3)
  {
    -[_MDIndexExtension extension](self, "extension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CoreSpotlightDontRunDuringMigration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)_verifyIntegrityWithHostContext:(id)a3
{
  id v4;
  _MDIndexExtension *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[_MDIndexExtension isInternal](v5, "isInternal")
    && !-[_MDIndexExtension entitlementVerified](v5, "entitlementVerified"))
  {
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[_MDIndexExtension _verifyIntegrityWithHostContext:].cold.3();

    objc_msgSend(v4, "_auxiliaryConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.private.corespotlight.internal"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "BOOLValue");

    if ((v6 & 1) != 0)
    {
      logForCSLogCategoryIndex();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_MDIndexExtension _verifyIntegrityWithHostContext:].cold.1();

      -[_MDIndexExtension setEntitlementVerified:](v5, "setEntitlementVerified:", 1);
    }
    else
    {
      logForCSLogCategoryIndex();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_MDIndexExtension _verifyIntegrityWithHostContext:].cold.2((uint64_t)v5, v11);

    }
  }
  else
  {
    v6 = 1;
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)_performJob:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  _MDIndexExtension *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_MDIndexExtension _performJob:completionBlock:].cold.1();

  -[_MDIndexExtension queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  logForCSLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = self;
    _os_log_impl(&dword_18C42F000, v10, OS_LOG_TYPE_DEFAULT, "### [SpotlightClient] _performJob Setting up a new request for extension:%@ ", buf, 0xCu);
  }

  -[_MDIndexExtension extension](self, "extension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49___MDIndexExtension__performJob_completionBlock___block_invoke;
  v15[3] = &unk_1E2401610;
  v15[4] = self;
  v16 = v11;
  v17 = v6;
  v18 = v7;
  v12 = v6;
  v13 = v11;
  v14 = v7;
  objc_msgSend(v13, "beginExtensionRequestWithOptions:inputItems:completion:", 0, 0, v15);

}

- (void)performJob:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[_MDIndexExtension queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___MDIndexExtension_performJob_completionBlock___block_invoke;
  block[3] = &unk_1E2401660;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
  objc_storeStrong((id *)&self->_containerPath, a3);
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_storeStrong((id *)&self->_containerID, a3);
}

- (void)setExtensionID:(id)a3
{
  objc_storeStrong((id *)&self->_extensionID, a3);
}

- (NSNumber)isAppleCodeSigned
{
  return self->_isAppleCodeSigned;
}

- (NSSet)identifiers
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSSet)supportedFileTypes
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSupportedFileTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)extensionLabel
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (BOOL)entitlementVerified
{
  return self->_entitlementVerified;
}

- (void)setEntitlementVerified:(BOOL)a3
{
  self->_entitlementVerified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_extensionLabel, 0);
  objc_storeStrong((id *)&self->_supportedFileTypes, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_isAppleCodeSigned, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_verifyIntegrityWithHostContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_18C42F000, v0, v1, "Verified internal indexing extesion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_verifyIntegrityWithHostContext:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18C42F000, a2, OS_LOG_TYPE_ERROR, "Indexing extenions %@ reported as internal but the xpc connection says otherwise!", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_verifyIntegrityWithHostContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_18C42F000, v0, v1, "Verifying that the internal indexing extension is actually internal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_performJob:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_18C42F000, v0, v1, "~~~ In extension's _performJob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
