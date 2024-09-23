@implementation DOCRemoteContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[DOCExtensionInterface hostProtocol](DOCExtensionInterface, "hostProtocol");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[DOCExtensionInterface vendorProtocol](DOCExtensionInterface, "vendorProtocol");
}

- (id)serviceProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DOCRemoteContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[DOCRemoteContext serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", &__block_literal_global_2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateAppearance:shouldFlushCA:completionBlock:", v9, v5, v8);

}

void __67__DOCRemoteContext_updateAppearance_shouldFlushCA_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject **v3;
  NSObject *v4;

  v2 = a2;
  v3 = (NSObject **)MEMORY[0x24BE2DF90];
  v4 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __67__DOCRemoteContext_updateAppearance_shouldFlushCA_completionBlock___block_invoke_cold_1();

}

- (void)updateAppearance:(id)a3 completionBlock:(id)a4
{
  -[DOCRemoteContext updateAppearance:shouldFlushCA:completionBlock:](self, "updateAppearance:shouldFlushCA:completionBlock:", a3, 0, a4);
}

- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[DOCRemoteContext serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", &__block_literal_global_18);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateEditingTo:animated:", v5, v4);

}

void __45__DOCRemoteContext_updateEditingTo_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject **v3;
  NSObject *v4;

  v2 = a2;
  v3 = (NSObject **)MEMORY[0x24BE2DF90];
  v4 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __67__DOCRemoteContext_updateAppearance_shouldFlushCA_completionBlock___block_invoke_cold_1();

}

void __67__DOCRemoteContext_updateAppearance_shouldFlushCA_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_209052000, v0, v1, "Failed to get the service proxy object with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
