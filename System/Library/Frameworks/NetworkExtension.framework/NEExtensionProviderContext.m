@implementation NEExtensionProviderContext

- (NEExtensionProviderContext)initWithProvider:(id)a3
{
  id v5;
  NEExtensionProviderContext *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NEExtensionProviderContext;
  v6 = -[NEExtensionProviderContext init](&v8, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "beginRequestWithExtensionContext:", v6);
    objc_storeStrong((id *)&v6->_provider, a3);
  }

  return v6;
}

- (void)dropProvider
{
  NEProvider *provider;

  provider = self->_provider;
  self->_provider = 0;

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NEExtensionProviderContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEFAULT, "%@: Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NEExtensionProviderContext;
  -[NEExtensionProviderContext dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  NSString *description;
  objc_super v4;

  description = self->_description;
  if (description)
    return description;
  v4.receiver = self;
  v4.super_class = (Class)NEExtensionProviderContext;
  -[NEExtensionProviderContext description](&v4, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_principalObject
{
  NEProvider *provider;
  objc_super v4;

  if (self && self->_isDisposed)
    return 0;
  provider = self->_provider;
  if (provider)
    return provider;
  v4.receiver = self;
  v4.super_class = (Class)NEExtensionProviderContext;
  -[NEExtensionProviderContext _principalObject](&v4, sel__principalObject);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)completeSession
{
  const char *v3;
  NSXPCConnection *hostConnection;
  NEProvider *provider;
  OS_os_transaction *transaction;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  if (self && objc_getProperty(self, a2, 64, 1))
  {
    objc_msgSend(objc_getProperty(self, v3, 64, 1), "invalidate");
    hostConnection = self->_hostConnection;
    self->_hostConnection = 0;

    provider = self->_provider;
    self->_provider = 0;

    transaction = self->_transaction;
    self->_transaction = 0;

    +[NEProviderServer sharedServer](NEProviderServer, "sharedServer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeProviderContext:", self);

  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_INFO, "Calling completeRequest", buf, 2u);
    }

    -[NEExtensionProviderContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", 0, 0);
  }
}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NEExtensionProviderContext *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Calling sleepWithCompletionHandler:", (uint8_t *)&v7, 0xCu);
  }

  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepWithCompletionHandler:", v4);

}

- (void)wake
{
  NSObject *v3;
  void *v4;
  int v5;
  NEExtensionProviderContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@: Calling wake", (uint8_t *)&v5, 0xCu);
  }

  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wake");

}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  NEExtensionProviderContext *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (nelog_is_info_logging_enabled())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Extension %@]"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEExtensionProviderContext setDescription:]((uint64_t)self, v8);

  }
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_large_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      _os_log_debug_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEBUG, "%@: Setting configuration to %@", buf, 0x16u);
    }
  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_INFO, "%@: Setting configuration", buf, 0xCu);
    }
  }

  if (self)
    objc_setProperty_atomic(self, v10, v6, 48);
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAppName:", v12);

}

- (void)cancelWithError:(id)a3
{
  const char *v4;
  id v5;
  NSObject *v6;
  SEL v7;
  void (**Property)(id, id);
  SEL v9;
  int v10;
  NEExtensionProviderContext *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self && objc_getProperty(self, v4, 56, 1))
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@: Calling stop completion handler with error %@", (uint8_t *)&v10, 0x16u);
    }

    Property = (void (**)(id, id))objc_getProperty(self, v7, 56, 1);
    Property[2](Property, v5);
    objc_setProperty_atomic_copy(self, v9, 0, 56);
  }

}

- (void)startedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  const char *v8;
  int v9;
  NEExtensionProviderContext *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_INFO, "%@: Started with error %@", (uint8_t *)&v9, 0x16u);
  }

  -[NEExtensionProviderContext hostContext](self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startedWithError:", v4);

  if (self && v4)
    objc_setProperty_atomic_copy(self, v8, 0, 56);

}

- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  NEExtensionProviderContext *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  ne_log_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = self;
    _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%@: display message", (uint8_t *)&v14, 0xCu);
  }

  -[NEExtensionProviderContext hostContext](self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayMessage:message:completionHandler:", v10, v9, v8);

}

- (void)createWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  objc_class *v11;
  NEProvider *v12;
  NEProvider *provider;
  NEProvider *v14;
  void *v15;
  OS_os_transaction *v16;
  OS_os_transaction *transaction;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  __CFString *v23;
  uint8_t buf[4];
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("NetworkExtension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isa_nsdictionary(v6) & 1) == 0)
  {
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v19 = "NetworkExtension dictionary is missing from Info.plist";
LABEL_26:
    _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_11;
  }
  -[NEExtensionProviderContext extensionPoint](self, "extensionPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NEProviderClasses"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isa_nsdictionary(v8) & 1) == 0)
    {
      ne_log_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = CFSTR("NEProviderClasses");
        _os_log_error_impl(&dword_19BD16000, v20, OS_LOG_TYPE_ERROR, "%@ dictionary is missing from Info.plist", buf, 0xCu);
      }

      v4[2](v4, 0);
      goto LABEL_20;
    }
    -[NEExtensionProviderContext extensionPoint](self, "extensionPoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSString length](v10, "length"))
    {
      v11 = NSClassFromString(v10);
      if (v11)
      {
        v12 = (NEProvider *)objc_alloc_init(v11);
        -[NEProvider beginRequestWithExtensionContext:](v12, "beginRequestWithExtensionContext:", self);
        provider = self->_provider;
        self->_provider = v12;
        v14 = v12;

        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.networkextension.providerContext.%@"), v10);
        objc_msgSend(v15, "UTF8String");
        v16 = (OS_os_transaction *)os_transaction_create();
        transaction = self->_transaction;
        self->_transaction = v16;

        v4[2](v4, 1);
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = (const __CFString *)v10;
        _os_log_error_impl(&dword_19BD16000, v22, OS_LOG_TYPE_ERROR, "No such class: %@", buf, 0xCu);
      }

    }
    else
    {
      ne_log_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[NEExtensionProviderContext extensionPoint](self, "extensionPoint");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v23;
        _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "NetworkExtension Info.plist dictionary does not contain a NEProvider class for extension point %@", buf, 0xCu);

      }
    }
    v4[2](v4, 0);
    goto LABEL_19;
  }
  ne_log_obj();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v19 = "Extension point is nil";
    goto LABEL_26;
  }
LABEL_11:

  v4[2](v4, 0);
LABEL_21:

}

- (void)dispose
{
  NSObject *v3;
  int v4;
  NEExtensionProviderContext *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self || !self->_isDisposed)
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@: disposing", (uint8_t *)&v4, 0xCu);
    }

    if (self)
      self->_isDisposed = 1;
    -[NEExtensionProviderContext completeSession](self, "completeSession");
  }
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  if (self)
    objc_setProperty_atomic_copy(self, a2, a4, 56);
}

- (void)stopWithReason:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (a3 == 40)
  {
    v4 = 3;
  }
  else
  {
    if (a3 != 6)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = 2;
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), v4, 0);
LABEL_7:
  v6 = (id)v5;
  -[NEExtensionProviderContext cancelWithError:](self, "cancelWithError:", v5);

}

- (void)validateWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEExtensionProviderContext requiredProviderSuperClass](self, "requiredProviderSuperClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), 4, 0);
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(-[NEExtensionProviderContext requiredProviderSuperClass](self, "requiredProviderSuperClass"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Provider is not a %@", (uint8_t *)&v9, 0xCu);

    }
  }
  v4[2](v4, v6);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "observerHelperHandler:ofObject:change:context:", v12, v11, v10, a6);

}

- (NSString)extensionPoint
{
  return 0;
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_hostConnection, 0);
  objc_storeStrong(&self->_stopCompletionHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);
}

- (_QWORD)hostContext
{
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  if (self)
  {
    v2 = self;
    v3 = (void *)self[3];
    if (!v3)
    {
      v4 = objc_getProperty(self, a2, 64, 1);
      if (!v4)
      {
        objc_msgSend(v2, "_auxiliaryConnection");
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_75);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v2[3];
      v2[3] = v5;

      if (!v2[3])
      {
        ne_log_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v9 = 0;
          _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Host context object is nil, cannot talk to host", v9, 2u);
        }

      }
      v3 = (void *)v2[3];
    }
    self = v3;
  }
  return self;
}

void __41__NEExtensionProviderContext_hostContext__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "Error while calling host: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setDescription:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2653 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2653, &__block_literal_global_2654);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2655;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2650 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2650, &__block_literal_global_65);
  return (id)_extensionAuxiliaryHostProtocol_protocol_2651;
}

void __61__NEExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE418950);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2651;
  _extensionAuxiliaryHostProtocol_protocol_2651 = v0;

}

void __63__NEExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4188A8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2655;
  _extensionAuxiliaryVendorProtocol_protocol_2655 = v0;

}

void __49__NEExtensionProviderContext_initWithConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  _QWORD newValue[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "%@: Session manager connection was invalidated", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (v5 && objc_getProperty(v5, v4, 56, 1))
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    newValue[0] = MEMORY[0x1E0C809B0];
    newValue[1] = 3221225472;
    newValue[2] = __49__NEExtensionProviderContext_initWithConnection___block_invoke_1;
    newValue[3] = &unk_1E3CC3148;
    objc_copyWeak(&v9, (id *)buf);
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v6, newValue, 56);
      v7 = *(void **)(a1 + 32);
    }
    objc_msgSend(v7, "stopWithReason:", 1);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __49__NEExtensionProviderContext_initWithConnection___block_invoke_1(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dispose");

}

@end
