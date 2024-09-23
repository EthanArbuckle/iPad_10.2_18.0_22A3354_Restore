@implementation FLHeadlessExtensionLoader

- (FLHeadlessExtensionLoader)initWithFollowUp:(id)a3 andDelegate:(id)a4
{
  id v6;
  void *v7;
  FLHeadlessExtensionLoader *v8;

  v6 = a4;
  objc_msgSend(a3, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FLHeadlessExtensionLoader initWithIdentifier:](self, "initWithIdentifier:", v7);

  if (v8)
    objc_storeWeak((id *)&v8->_delegate, v6);

  return v8;
}

- (FLHeadlessExtensionLoader)initWithIdentifier:(id)a3
{
  id v5;
  FLHeadlessExtensionLoader *v6;
  FLHeadlessExtensionLoader *v7;

  v5 = a3;
  v6 = -[FLHeadlessExtensionLoader init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (NSExtension)extension
{
  NSExtension *extension;
  void *v4;
  NSExtension *v5;
  NSExtension *v6;

  extension = self->_extension;
  if (!extension)
  {
    -[FLHeadlessExtensionLoader identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLHeadlessExtensionLoader _loadExtensionForIdentifier:error:](self, "_loadExtensionForIdentifier:error:", v4, 0);
    v5 = (NSExtension *)objc_claimAutoreleasedReturnValue();
    v6 = self->_extension;
    self->_extension = v5;

    extension = self->_extension;
  }
  return extension;
}

- (void)_terminate
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_extension && self->_sessionID)
  {
    _FLLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B8D53000, v3, OS_LOG_TYPE_DEFAULT, "Terminating extension...", v4, 2u);
    }

    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:", self->_sessionID);
  }
}

- (id)remoteInterface
{
  FLExtensionContext *extensionContext;

  extensionContext = self->_extensionContext;
  if (!extensionContext)
  {
    -[FLHeadlessExtensionLoader _loadExtension:](self, "_loadExtension:", 0);
    extensionContext = self->_extensionContext;
  }
  return extensionContext;
}

- (BOOL)_loadExtension:(id *)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  FLExtensionContext *v9;
  FLExtensionContext *extensionContext;
  FLExtensionContext *v11;
  NSObject *v12;
  NSObject *v13;
  FLExtensionContext *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  id v23;
  uint8_t buf[4];
  FLExtensionContext *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v5 = -[FLHeadlessExtensionLoader _setupSessionIfNeeded:](self, "_setupSessionIfNeeded:", &v23);
  v6 = v23;
  if (v5)
  {
    -[FLHeadlessExtensionLoader extension](self, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLHeadlessExtensionLoader _hostContextForExtension:](self, "_hostContextForExtension:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteContextWithErrorHandler:", &__block_literal_global_10);
    v9 = (FLExtensionContext *)objc_claimAutoreleasedReturnValue();
    extensionContext = self->_extensionContext;
    self->_extensionContext = v9;

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);
  v11 = self->_extensionContext;
  _FLLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_extensionContext;
      *(_DWORD *)buf = 138412290;
      v25 = v14;
      _os_log_impl(&dword_1B8D53000, v13, OS_LOG_TYPE_DEFAULT, "Extension context %@ loaded successfully", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[FLHeadlessExtensionLoader _loadExtension:].cold.1((uint64_t)v6, v13, v15, v16, v17, v18, v19, v20);
  }

  v21 = self->_extensionContext != 0;
  return v21;
}

void __44__FLHeadlessExtensionLoader__loadExtension___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__FLHeadlessExtensionLoader__loadExtension___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (BOOL)_setupSessionIfNeeded:(id *)a3
{
  void *v5;
  void *v6;
  NSUUID *sessionID;
  BOOL v8;
  NSUUID *v9;
  id v10;
  NSUUID *v11;
  BOOL v12;
  id v14;

  -[FLHeadlessExtensionLoader extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  sessionID = self->_sessionID;
  if (sessionID)
    v8 = 1;
  else
    v8 = v5 == 0;
  if (!v8)
  {
    v14 = 0;
    objc_msgSend(v5, "beginExtensionRequestWithInputItems:error:", MEMORY[0x1E0C9AA60], &v14);
    v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v11 = self->_sessionID;
    self->_sessionID = v9;

    if (a3)
      *a3 = objc_retainAutorelease(v10);

    sessionID = self->_sessionID;
  }
  v12 = sessionID != 0;

  return v12;
}

+ (id)sharedExtensionQueue
{
  if (sharedExtensionQueue_onceToken[0] != -1)
    dispatch_once(sharedExtensionQueue_onceToken, &__block_literal_global_3_0);
  return (id)sharedExtensionQueue_sharedExtensionQueue;
}

void __49__FLHeadlessExtensionLoader_sharedExtensionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.followup-extension.queue", 0);
  v1 = (void *)sharedExtensionQueue_sharedExtensionQueue;
  sharedExtensionQueue_sharedExtensionQueue = (uint64_t)v0;

}

- (id)_loadExtensionForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  id location;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    _FLLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1B8D53000, v7, OS_LOG_TYPE_DEFAULT, "Loading extension with identifier: %@", buf, 0xCu);
    }

    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v6, &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__FLHeadlessExtensionLoader__loadExtensionForIdentifier_error___block_invoke;
    v18[3] = &unk_1E6F1E798;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v8, "setRequestInterruptionBlock:", v18);
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    if (v9)
    {
      _FLLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[FLHeadlessExtensionLoader _loadExtensionForIdentifier:error:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      _FLLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v8;
        _os_log_impl(&dword_1B8D53000, v10, OS_LOG_TYPE_DEFAULT, "Loaded extension: %@", buf, 0xCu);
      }
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __63__FLHeadlessExtensionLoader__loadExtensionForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__FLHeadlessExtensionLoader__loadExtensionForIdentifier_error___block_invoke_cold_1(v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "requestInterruptionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "requestInterruptionBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v3);

  }
}

- (id)_hostContextForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v4 = a3;
  -[FLHeadlessExtensionLoader sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_extensionContextForUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "setDelegate:", WeakRetained);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  FLHeadlessExtensionLoader *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B8D53000, v3, OS_LOG_TYPE_DEFAULT, "%@ going away", buf, 0xCu);
  }

  -[FLHeadlessExtensionLoader _terminate](self, "_terminate");
  v4.receiver = self;
  v4.super_class = (Class)FLHeadlessExtensionLoader;
  -[FLHeadlessExtensionLoader dealloc](&v4, sel_dealloc);
}

- (id)requestInterruptionBlock
{
  return self->_requestInterruptionBlock;
}

- (void)setRequestInterruptionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_requestInterruptionBlock, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionContext, 0);
}

- (void)_loadExtension:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, a2, a3, "Failed to load extension context with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __44__FLHeadlessExtensionLoader__loadExtension___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, a2, a3, "Remote context failed with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_loadExtensionForIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, a2, a3, "Failed to load extension with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __63__FLHeadlessExtensionLoader__loadExtensionForIdentifier_error___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8D53000, log, OS_LOG_TYPE_ERROR, "Extension interrupted", v1, 2u);
}

@end
