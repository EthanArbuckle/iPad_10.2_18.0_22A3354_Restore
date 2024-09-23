@implementation NEExtensionProviderHostContext

- (NSString)description
{
  return self->_description;
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  NEExtensionProviderHostContext *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[Host %@]"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self)
    objc_storeStrong((id *)&self->_description, v9);

  ne_log_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%@: Set Configuration", buf, 0xCu);
  }

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConfiguration:extensionIdentifier:", v8, v7);

}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NEExtensionProviderHostContext *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@: Sleeping", (uint8_t *)&v7, 0xCu);
  }

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepWithCompletionHandler:", v4);

}

- (void)wake
{
  NSObject *v3;
  void *v4;
  int v5;
  NEExtensionProviderHostContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%@: Waking", (uint8_t *)&v5, 0xCu);
  }

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wake");

}

- (void)createWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createWithCompletionHandler:", v4);

}

- (void)dispose
{
  NSObject *v3;
  void *v4;
  int v5;
  NEExtensionProviderHostContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%@: disposing", (uint8_t *)&v5, 0xCu);
  }

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispose");

}

- (void)startedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NEExtensionProviderHostContext *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@: started with error %@", (uint8_t *)&v7, 0x16u);
  }

  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extension:didStartWithError:", self, v4);

}

- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NEUserNotification *v11;
  id v12;
  NEUserNotification *v13;
  NEUserNotification *notification;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [NEUserNotification alloc];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__NEExtensionProviderHostContext_displayMessage_message_completionHandler___block_invoke;
  v15[3] = &unk_1E3CBFFB8;
  v16 = v8;
  v12 = v8;
  v13 = -[NEUserNotification initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:](v11, "initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:", v10, v9, 0, 0, 0, 0, 0, MEMORY[0x1E0C80D38], v15);

  notification = self->_notification;
  self->_notification = v13;

}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  NEExtensionProviderHostContext *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2048;
    v13 = v6;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting with options %p", (uint8_t *)&v10, 0x16u);
  }

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startWithOptions:completionHandler:", v6, v7);

}

- (void)stopWithReason:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  int v7;
  NEExtensionProviderHostContext *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_stopped)
  {
    v3 = *(_QWORD *)&a3;
    self->_stopped = 1;
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412546;
      v8 = self;
      v9 = 2048;
      v10 = (int)v3;
      _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@: Stopping with reason %ld", (uint8_t *)&v7, 0x16u);
    }

    -[NEUserNotification cancel](self->_notification, "cancel");
    -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopWithReason:", v3);

  }
}

- (void)validateWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  __CFString *v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  int v11;
  void *v12;
  NSObject *v13;
  int v14;
  int v15;
  NEExtensionProviderHostContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412290;
    v16 = self;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@: Validating", (uint8_t *)&v15, 0xCu);
  }

  v6 = CFSTR("com.apple.developer.networking.networkextension");
  if (self)
  {
    v7 = self->_vendorConnection;
    if (v7
      || (-[NEExtensionProviderHostContext _auxiliaryConnection](self, "_auxiliaryConnection"),
          (v7 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[NSXPCConnection _xpcConnection](v7, "_xpcConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[NSXPCConnection _xpcConnection](v7, "_xpcConnection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_retainAutorelease(CFSTR("com.apple.developer.networking.networkextension"));
        objc_msgSend(CFSTR("com.apple.developer.networking.networkextension"), "UTF8String");
        v8 = (void *)xpc_connection_copy_entitlement_value();

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  v11 = NEGetEntitlement(v8);
  if ((-[NEExtensionProviderHostContext requiredEntitlement](self, "requiredEntitlement") & v11) != 0)
  {
    -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "validateWithCompletionHandler:", v4);
  }
  else
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = -[NEExtensionProviderHostContext requiredEntitlement](self, "requiredEntitlement");
      v15 = 67109120;
      LODWORD(v16) = v14;
      _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "Provider is missing the required NetworkExtension entitlement (%x)", (uint8_t *)&v15, 8u);
    }

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), 1, 0);
    v4[2](v4, v12);
  }

}

- (int)requiredEntitlement
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorConnection, 0);
  objc_storeStrong((id *)&self->_extensionProcessIdentity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_vendorContext, 0);
}

- (id)vendorContext
{
  id *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __int16 v8[8];
  _QWORD v9[4];
  id v10;
  id location;

  if (val)
  {
    v1 = val;
    v2 = val[3];
    if (!v2)
    {
      objc_initWeak(&location, val);
      v3 = v1[9];
      if (!v3)
      {
        objc_msgSend(v1, "_auxiliaryConnection");
        v3 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__NEExtensionProviderHostContext_vendorContext__block_invoke;
      v9[3] = &unk_1E3CC3148;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v1[3];
      v1[3] = (id)v4;

      if (!v1[3])
      {
        ne_log_obj();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v8[0] = 0;
          _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Vendor context object is nil, cannot talk to extension", (uint8_t *)v8, 2u);
        }

      }
      objc_destroyWeak(&v10);

      objc_destroyWeak(&location);
      v2 = v1[3];
    }
    val = (id *)v2;
  }
  return val;
}

void __47__NEExtensionProviderHostContext_vendorContext__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "Error while calling extension: %@", (uint8_t *)&v9, 0xCu);
  }

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 7);
    if (v6)
    {
      v7 = v6;
      -[NSObject extension:didFailWithError:](v6, "extension:didFailWithError:", WeakRetained, v3);
    }
    else
    {
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Host context delegate is nil, cannot notify of extension failure", (uint8_t *)&v9, 2u);
      }

      v7 = 0;
    }
  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Host context is nil, cannot notify of extension failure", (uint8_t *)&v9, 2u);
    }
  }

}

uint64_t __75__NEExtensionProviderHostContext_displayMessage_message_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
  return WeakRetained;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2793 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2793, &__block_literal_global_2794);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2795;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2790 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2790, &__block_literal_global_61);
  return (id)_extensionAuxiliaryHostProtocol_protocol_2791;
}

void __65__NEExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE418950);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2791;
  _extensionAuxiliaryHostProtocol_protocol_2791 = v0;

}

void __67__NEExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4188A8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2795;
  _extensionAuxiliaryVendorProtocol_protocol_2795 = v0;

}

- (id)initWithVendorEndpoint:(void *)a3 processIdentity:(void *)a4 delegate:
{
  id v7;
  id v8;
  id v9;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)NEExtensionProviderHostContext;
    v10 = (id *)objc_msgSendSuper2(&v22, sel_initWithInputItems_, 0);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 7, v9);
      *((_BYTE *)a1 + 49) = 1;
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v7);
      v12 = a1[9];
      a1[9] = (id)v11;

      objc_msgSend((id)objc_opt_class(), "_extensionAuxiliaryHostProtocol");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[9], "setExportedInterface:", v13);

      objc_msgSend(a1[9], "setExportedObject:", a1);
      objc_msgSend((id)objc_opt_class(), "_extensionAuxiliaryVendorProtocol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[9], "setRemoteObjectInterface:", v14);

      objc_initWeak(&location, a1);
      v15 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke;
      v19[3] = &unk_1E3CC39A8;
      objc_copyWeak(&v20, &location);
      objc_msgSend(a1[9], "setInterruptionHandler:", v19);
      v17[0] = v15;
      v17[1] = 3221225472;
      v17[2] = __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke_2;
      v17[3] = &unk_1E3CC39A8;
      objc_copyWeak(&v18, &location);
      objc_msgSend(a1[9], "setInvalidationHandler:", v17);
      objc_msgSend(a1[9], "resume");
      objc_storeStrong(a1 + 8, a3);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  id v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 7);
    objc_msgSend(v3, "extension:didFailWithError:", v6, 0);

    v2 = v6;
    v4 = v6[9];
    if (v4)
    {
      objc_msgSend(v4, "invalidate");
      v5 = v6[9];
      v6[9] = 0;

      v2 = v6;
    }
  }

}

void __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  id v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 7);
    objc_msgSend(v3, "extensionDidStop:", v6);

    v2 = v6;
    v4 = v6[9];
    if (v4)
    {
      objc_msgSend(v4, "invalidate");
      v5 = v6[9];
      v6[9] = 0;

      v2 = v6;
    }
  }

}

@end
