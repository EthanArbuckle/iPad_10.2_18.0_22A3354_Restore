@implementation FLExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_8);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __57__FLExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1E32A8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_extensionDidFinishWithUserInfo_completionHandler_, 0, 0);

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_50);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

void __59__FLExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1E5F80);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_processFollowUpItem_selectedAction_completion_, 0, 0);

  v4 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_processFollowUpItem_selectedAction_completion_, 1, 0);

}

- (id)remoteContextWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FLExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)extensionDidFinish
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[FLExtensionHostContext extensionDidFinish]";
    _os_log_impl(&dword_1B8D53000, v3, OS_LOG_TYPE_DEFAULT, "-- %s --", (uint8_t *)&v5, 0xCu);
  }

  -[FLExtensionHostContext extensionDidFinishWithUserInfo:completionHandler:](self, "extensionDidFinishWithUserInfo:completionHandler:", 0, 0);
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[FLExtensionHostContext extensionDidFinish]";
    _os_log_impl(&dword_1B8D53000, v4, OS_LOG_TYPE_DEFAULT, "-- %s -- DONE.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)extensionDidFinishWithUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _FLLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[FLExtensionHostContext extensionDidFinishWithUserInfo:completionHandler:]";
    _os_log_impl(&dword_1B8D53000, v8, OS_LOG_TYPE_DEFAULT, "-- %s --", (uint8_t *)&v12, 0xCu);
  }

  -[FLExtensionHostContext delegate](self, "delegate");
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  _FLLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1B8D53000, v10, OS_LOG_TYPE_DEFAULT, "Extension responded to tear down: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v9, "extensionDidFinishWithUserInfo:completionHandler:", v7, v6);
  _FLLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[FLExtensionHostContext extensionDidFinishWithUserInfo:completionHandler:]";
    _os_log_impl(&dword_1B8D53000, v11, OS_LOG_TYPE_DEFAULT, "-- %s -- DONE.", (uint8_t *)&v12, 0xCu);
  }

}

- (FLExtensionHostContextInterface)delegate
{
  return (FLExtensionHostContextInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
