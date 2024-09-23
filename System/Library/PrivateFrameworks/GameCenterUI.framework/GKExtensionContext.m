@implementation GKExtensionContext

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void (**v8)(id, uint64_t);

  v5 = (void *)MEMORY[0x1E0D25270];
  v8 = (void (**)(id, uint64_t))a4;
  v6 = a3;
  objc_msgSend(v5, "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openURL:", v6);

  v8[2](v8, 1);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_sandboxToken >= 1)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)GKExtensionContext;
  -[GKExtensionContext dealloc](&v3, sel_dealloc);
}

- (void)messageFromClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__GKExtensionContext_messageFromClient___block_invoke;
  v6[3] = &unk_1E59C4708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __40__GKExtensionContext_messageFromClient___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageFromClient:", *(_QWORD *)(a1 + 40));

}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  id v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[GKExtensionContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!*MEMORY[0x1E0D25460])
      v10 = (id)GKOSLoggers();
    v11 = (void *)*MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKExtensionContext setInitialState:withReply:].cold.1(v11, self);
  }
  -[GKExtensionContext _principalObject](self, "_principalObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInitialState:withReply:", v7, v6);

}

- (void)tearDownExtensionWithReply:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKExtensionContext _principalObject](self, "_principalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "tearDownExtensionWithReply:", v5);

}

- (void)hostApp:(id)a3 grantingAccessExtensionSandbox:(id)a4 replyWithEndpoint:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  v10 = sandbox_extension_consume();
  self->_sandboxToken = v10;
  if (v10 < 0)
  {
    v16 = *__error();
    if (!*MEMORY[0x1E0D25460])
      v17 = (id)GKOSLoggers();
    v18 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKExtensionContext hostApp:grantingAccessExtensionSandbox:replyWithEndpoint:].cold.1(v16, v18);
    v15 = 0;
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25270], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applicationProxyForBundleID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB34E0];
    objc_msgSend(v12, "bundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_extensionEndpointForMainBundleOfHostApplication:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
LABEL_3:
      v9[2](v9, v15);
  }

}

- (int64_t)sandboxToken
{
  return self->_sandboxToken;
}

- (void)setSandboxToken:(int64_t)a3
{
  self->_sandboxToken = a3;
}

- (void)setInitialState:(void *)a1 withReply:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "_principalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_9(&dword_1AB361000, v3, v7, "_principalObject contains instance of Unexpected class: %@", v8);

}

- (void)hostApp:(int)a1 grantingAccessExtensionSandbox:(NSObject *)a2 replyWithEndpoint:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "NSBundleResourceRequest encountered a sandboxing error (sandbox_extension_consume): %d", (uint8_t *)v2, 8u);
}

@end
