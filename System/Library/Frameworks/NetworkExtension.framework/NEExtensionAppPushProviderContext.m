@implementation NEExtensionAppPushProviderContext

- (id)extensionPoint
{
  return CFSTR("com.apple.networkextension.app-push");
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NEExtensionAppPushProviderContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%@: dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NEExtensionAppPushProviderContext;
  -[NEExtensionProviderContext dealloc](&v4, sel_dealloc);
}

- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  _BOOL4 v17;
  _QWORD v18[5];
  void (**v19)(id, _QWORD);
  uint8_t buf[4];
  NEExtensionAppPushProviderContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setProviderConfiguration:", v6);
  v10 = v9;
  v11 = v10;
  if (self && (v12 = objc_msgSend(v10, "superclass")) != 0)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend(v11, "methodForSelector:", sel_start);
    v15 = v14 != objc_msgSend(v13, "instanceMethodForSelector:", sel_start);
  }
  else
  {
    v15 = 0;
  }

  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "%@ the new start method is overridden", buf, 0xCu);
    }

    objc_msgSend(v11, "start");
    v7[2](v7, 0);
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "%@ the new start method is not overridden", buf, 0xCu);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__NEExtensionAppPushProviderContext_startConnectionWithProviderConfig_completionHandler___block_invoke;
    v18[3] = &unk_1E3CC4748;
    v18[4] = self;
    v19 = v7;
    objc_msgSend(v11, "startWithCompletionHandler:", v18);

  }
}

- (void)stopWithReason:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  NEExtensionAppPushProviderContext *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "%@ stopWithReason called", buf, 0xCu);
  }

  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self && (a3 - 1) <= 0x28)
    v9 = qword_19BED5F68[a3 - 1];
  else
    v9 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__NEExtensionAppPushProviderContext_stopWithReason_completionHandler___block_invoke;
  v11[3] = &unk_1E3CC46A8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "stopWithReason:completionHandler:", v9, v11);

}

- (void)setProviderConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProviderConfiguration:", v4);

}

- (void)reportIncomingCall:(id)a3
{
  id v4;
  const char *v5;
  id v6;

  v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportIncomingCall:", v4);

}

- (void)reportPushToTalkMessage:(id)a3
{
  id v4;
  const char *v5;
  id v6;

  v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportPushToTalkMessage:", v4);

}

- (void)sendTimerEvent
{
  NSObject *v3;
  void *v4;
  int v5;
  NEExtensionAppPushProviderContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%@ sendTimerEvent called", (uint8_t *)&v5, 0xCu);
  }

  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleTimerEvent");

}

uint64_t __70__NEExtensionAppPushProviderContext_stopWithReason_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "%@ provider stopped", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __89__NEExtensionAppPushProviderContext_startConnectionWithProviderConfig_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%@ startWithCompletionHandler failed, error: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_22487 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_22487, &__block_literal_global_22488);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_22489;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_22483 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_22483, &__block_literal_global_71_22484);
  return (id)_extensionAuxiliaryHostProtocol_protocol_22485;
}

void __68__NEExtensionAppPushProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41AC70);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_22485;
  _extensionAuxiliaryHostProtocol_protocol_22485 = v0;

}

void __70__NEExtensionAppPushProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41AC10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_22489;
  _extensionAuxiliaryVendorProtocol_protocol_22489 = v0;

}

@end
