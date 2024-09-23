@implementation MERemoteExtensionContext

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__MERemoteExtensionContext_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, block);
  return (id)log_log_4;
}

void __31__MERemoteExtensionContext_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "MERemoteExtensiontInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "MEExtensionRemoteHostInterface");
}

- (MERemoteExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  MERemoteExtensionContext *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MERemoteExtensionContext;
  v11 = -[MERemoteExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](&v13, sel_initWithInputItems_listenerEndpoint_contextUUID_, v8, v9, v10);
  if (v11)
    NSLog(CFSTR("%s"), "-[MERemoteExtensionContext initWithInputItems:listenerEndpoint:contextUUID:]");

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MERemoteExtensionContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_20BB85000, v3, OS_LOG_TYPE_DEFAULT, "<MERemoteExtensionContext:%p> deallocated", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MERemoteExtensionContext;
  -[MERemoteExtensionContext dealloc](&v4, sel_dealloc);
}

- (id)remoteProxy
{
  void *v2;
  void *v3;

  -[MERemoteExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MEExtensionRemoteHostProtocol)remoteHostPoxy
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[MERemoteExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__MERemoteExtensionContext_remoteHostPoxy__block_invoke;
  v6[3] = &unk_24C4D27A8;
  v6[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MEExtensionRemoteHostProtocol *)v4;
}

void __42__MERemoteExtensionContext_remoteHostPoxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42__MERemoteExtensionContext_remoteHostPoxy__block_invoke_cold_1(a1);

}

- (id)_extensionInterface
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  MERemoteExtensionContext *v11;
  void *v13;
  void *v14;
  uint8_t buf[4];
  MERemoteExtensionContext *v16;
  __int16 v17;
  MERemoteExtensionContext *v18;
  __int16 v19;
  MERemoteExtensionContext *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MERemoteExtensionContext _principalObject](self, "_principalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MERemoteExtensionContext _principalObject](self, "_principalObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v16 = self;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_20BB85000, v6, OS_LOG_TYPE_DEFAULT, "ExtensionContext<%p>: Creating new _principalObject for extension Context:%@", buf, 0x16u);
    }

    -[MERemoteExtensionContext _createPrincipalObject](self, "_createPrincipalObject");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD19B0], "_sharedExtensionContextVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MERemoteExtensionContext _UUID](self, "_UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setPrincipalObject:forUUID:", v7, v9);

    v5 = (void *)v7;
  }
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_254744308) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MERemoteExtensionContext _principalObject](self, "_principalObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MERemoteExtensionContext.m"), 82, CFSTR("ExtensionContext<%p>: _principalObject %@ does not conform to MEExtension protocol in ExtensionContext :%@"), self, v14, self);

  }
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[MERemoteExtensionContext _principalObject](self, "_principalObject");
    v11 = (MERemoteExtensionContext *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v16 = self;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_20BB85000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext<%p>: _principalObject is %@ in ExtensionContext :%@", buf, 0x20u);

  }
  return v5;
}

- (id)_createPrincipalObject
{
  void *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSMapTable *v13;
  NSMapTable *composeSessionToHandlerMap;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  NSString *aClassName;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  MERemoteExtensionContext *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  MERemoteExtensionContext *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1528], "bundleRecordForCurrentProcess");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MERemoteExtensionContext.m"), 90, CFSTR("Unexpected bunde record class '%@'"), v18);

  }
  objc_msgSend(v27, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v35 = self;
    v36 = 2112;
    v37 = v26;
    v38 = 2112;
    v39 = self;
    _os_log_impl(&dword_20BB85000, v3, OS_LOG_TYPE_DEFAULT, "ExtensionContext<%p>: extensionDictionary is %@ for Extension Context :%@", buf, 0x20u);
  }

  objc_msgSend(v26, "objectForKey:", CFSTR("NSExtensionPrincipalClass"));
  aClassName = (NSString *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](aClassName, "length"))
  {
    v4 = objc_alloc_init(NSClassFromString(aClassName));
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v35 = self;
      v36 = 2112;
      v37 = v4;
      v38 = 2112;
      v39 = self;
      _os_log_impl(&dword_20BB85000, v5, OS_LOG_TYPE_DEFAULT, "ExtensionContext<%p>: principalObject is %@ for Extension Context :%@", buf, 0x20u);
    }

    if (!v4)
    {
      v12 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v26, "objectForKey:", CFSTR("NSExtensionAttributes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", CFSTR("MEExtensionCapabilities"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v30 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("MEComposeSessionHandler"))
            && (objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("MEMessageActionHandler"))
            && (objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("MEContentBlocker"))
            && (objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("MEMessageSecurityHandler"))
            && (objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v6);
    }

  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    v23 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MERemoteExtensionContext _createPrincipalObject].cold.1((uint64_t)self, v11);
    v4 = 0;
  }

  v12 = v4;
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v13 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  composeSessionToHandlerMap = self->_composeSessionToHandlerMap;
  self->_composeSessionToHandlerMap = v13;

  return v12;
}

- (id)_contentBlockerInterface
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handlerForContentBlocker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = CFSTR("handlerForContentBlocker");
      _os_log_impl(&dword_20BB85000, v8, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ does not implement %@", (uint8_t *)&v10, 0x16u);

    }
    return 0;
  }
}

- (id)contentRulesJSON
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  MERemoteExtensionContext *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_20BB85000, v4, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v9, 0x16u);

  }
  -[MERemoteExtensionContext _contentBlockerInterface](self, "_contentBlockerInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentRulesJSON");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)contentRulesJSONWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[MERemoteExtensionContext contentRulesJSON](self, "contentRulesJSON");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (id)_mailActionInterface
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handlerForMessageActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = CFSTR("handlerForMessageActions");
      _os_log_impl(&dword_20BB85000, v8, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ does not implement %@", (uint8_t *)&v10, 0x16u);

    }
    return 0;
  }
}

- (void)decideActionForMessage:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  MERemoteExtensionContext *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_20BB85000, v9, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v12, 0x16u);

  }
  -[MERemoteExtensionContext _mailActionInterface](self, "_mailActionInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "decideActionForMessage:completionHandler:", v7, v8);

}

- (NSArray)requiredHeaders
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  MERemoteExtensionContext *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_20BB85000, v4, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v9, 0x16u);

  }
  -[MERemoteExtensionContext _mailActionInterface](self, "_mailActionInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "requiredHeaders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return (NSArray *)v7;
}

- (void)requiredHeadersWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[MERemoteExtensionContext requiredHeaders](self, "requiredHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (id)_composeSessionInterfaceForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MERemoteExtensionContext remoteHostPoxy](self, "remoteHostPoxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteHostContext:", v5);

  -[NSMapTable objectForKey:](self->_composeSessionToHandlerMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handlerForComposeSession:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_composeSessionToHandlerMap, "setObject:forKey:", v6, v4);
    }
    else
    {
      +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v11;
        v15 = 2112;
        v16 = CFSTR("handlerForComposeSession:");
        _os_log_impl(&dword_20BB85000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ does not implement %@", (uint8_t *)&v13, 0x16u);

      }
      v6 = 0;
    }
  }

  return v6;
}

- (void)mailComposeSessionDidBegin:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  MERemoteExtensionContext *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_20BB85000, v6, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v9, 0x16u);

  }
  -[MERemoteExtensionContext _composeSessionInterfaceForSession:](self, "_composeSessionInterfaceForSession:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailComposeSessionDidBegin:", v5);

}

- (void)mailComposeSessionDidEnd:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  MERemoteExtensionContext *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_20BB85000, v6, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v9, 0x16u);

  }
  -[MERemoteExtensionContext _composeSessionInterfaceForSession:](self, "_composeSessionInterfaceForSession:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailComposeSessionDidEnd:", v5);

  -[NSMapTable removeObjectForKey:](self->_composeSessionToHandlerMap, "removeObjectForKey:", v5);
}

- (id)viewControllerForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v11;
  MERemoteExtensionContext *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MERemoteExtensionContext _composeSessionInterfaceForSession:](self, "_composeSessionInterfaceForSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForSession:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_20BB85000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ returned view controller: %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = v6;
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[MERemoteExtensionContext viewControllerForSession:].cold.1((uint64_t)self);

    v8 = 0;
  }

  return v8;
}

- (void)session:(id)a3 annotateAddressesWithCompletionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  MERemoteExtensionContext *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  -[MERemoteExtensionContext _composeSessionInterfaceForSession:](self, "_composeSessionInterfaceForSession:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_20BB85000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v9, "session:annotateAddressesWithCompletionHandler:", v7, v8);
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_20BB85000, v12, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Does not implement selector [%@]", (uint8_t *)&v14, 0x16u);

    }
    v8[2](v8, MEMORY[0x24BDBD1B8]);
  }

}

- (void)session:(id)a3 canSendMessageWithCompletionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  MERemoteExtensionContext *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  -[MERemoteExtensionContext _composeSessionInterfaceForSession:](self, "_composeSessionInterfaceForSession:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_20BB85000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v9, "session:canSendMessageWithCompletionHandler:", v7, v8);
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_20BB85000, v12, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Does not implement selector [%@]", (uint8_t *)&v14, 0x16u);

    }
    v8[2](v8, 0);
  }

}

- (void)session:(id)a3 hasSendMessageCheckWithCompletion:(id)a4
{
  void *v6;
  char v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  -[MERemoteExtensionContext _composeSessionInterfaceForSession:](self, "_composeSessionInterfaceForSession:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();
  v8[2](v8, v7 & 1);

}

- (id)additionalHeadersForSession:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  MERemoteExtensionContext *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[MERemoteExtensionContext _composeSessionInterfaceForSession:](self, "_composeSessionInterfaceForSession:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_20BB85000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(v6, "additionalHeadersForSession:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_20BB85000, v10, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Does not implement selector [%@]", (uint8_t *)&v13, 0x16u);

    }
    v9 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v9;
}

- (void)session:(id)a3 getAdditionalHeadersWithCompletion:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a4;
  -[MERemoteExtensionContext additionalHeadersForSession:](self, "additionalHeadersForSession:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6);

}

- (id)_messageSecurityHandlerInterface
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handlerForMessageSecurity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[MERemoteExtensionContext _extensionInterface](self, "_extensionInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = CFSTR("handlerForMessageSecurity");
      _os_log_impl(&dword_20BB85000, v8, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ does not implement %@", (uint8_t *)&v10, 0x16u);

    }
    return 0;
  }
}

- (void)getEncodingStatusForMessage:(id)a3 composeContext:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  MERemoteExtensionContext *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_20BB85000, v12, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v15, 0x16u);

  }
  -[MERemoteExtensionContext _messageSecurityHandlerInterface](self, "_messageSecurityHandlerInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getEncodingStatusForMessage:composeContext:completionHandler:", v9, v10, v11);

}

- (void)encodeMessage:(id)a3 composeContext:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  MERemoteExtensionContext *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_20BB85000, v12, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ Forwarding invocation [%@]", (uint8_t *)&v15, 0x16u);

  }
  -[MERemoteExtensionContext _messageSecurityHandlerInterface](self, "_messageSecurityHandlerInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeMessage:composeContext:completionHandler:", v9, v10, v11);

}

- (id)decodedMessageForMessageData:(id)a3
{
  NSObject *v5;
  void *v6;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MERemoteExtensionContext decodedMessageForMessageData:].cold.1((uint64_t)self, v6, v8, v5);
  }

  return 0;
}

- (id)decodedMessageForMessageData:(id)a3 decodeContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[MERemoteExtensionContext _messageSecurityHandlerInterface](self, "_messageSecurityHandlerInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  -[MERemoteExtensionContext _messageSecurityHandlerInterface](self, "_messageSecurityHandlerInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 1) != 0)
    objc_msgSend(v10, "performSelector:withObject:withObject:", sel_decodedMessageForMessageData_decodeContext_, v6, v7);
  else
    objc_msgSend(v10, "decodedMessageForMessageData:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)decodedMessageForMessageData:(id)a3 decodeContext:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a5;
  -[MERemoteExtensionContext decodedMessageForMessageData:decodeContext:](self, "decodedMessageForMessageData:decodeContext:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v8);

}

- (id)extensionViewControllerForMessageSigners:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v11;
  MERemoteExtensionContext *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MERemoteExtensionContext _messageSecurityHandlerInterface](self, "_messageSecurityHandlerInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionViewControllerForMessageSigners:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_20BB85000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ returned view controller: %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = v6;
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MERemoteExtensionContext extensionViewControllerForMessageSigners:].cold.1((uint64_t)self);

    v8 = 0;
  }

  return v8;
}

- (id)extensionViewControllerForMessageContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v11;
  MERemoteExtensionContext *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MERemoteExtensionContext _messageSecurityHandlerInterface](self, "_messageSecurityHandlerInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionViewControllerForMessageContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_20BB85000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ returned view controller: %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = v6;
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MERemoteExtensionContext extensionViewControllerForMessageSigners:].cold.1((uint64_t)self);

    v8 = 0;
  }

  return v8;
}

- (void)primaryActionClickedForMessageContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  -[MERemoteExtensionContext _messageSecurityHandlerInterface](self, "_messageSecurityHandlerInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MERemoteExtensionContext _messageSecurityHandlerInterface](self, "_messageSecurityHandlerInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __84__MERemoteExtensionContext_primaryActionClickedForMessageContext_completionHandler___block_invoke;
    v10[3] = &unk_24C4D2D08;
    v10[4] = self;
    v11 = v7;
    objc_msgSend(v9, "primaryActionClickedForMessageContext:completionHandler:", v6, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __84__MERemoteExtensionContext_primaryActionClickedForMessageContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __84__MERemoteExtensionContext_primaryActionClickedForMessageContext_completionHandler___block_invoke_cold_1(a1);
      goto LABEL_11;
    }
  }
  else
  {
    +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_20BB85000, v5, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ did not return a view controller for primary action clicked", (uint8_t *)&v8, 0xCu);
    }

  }
  +[MERemoteExtensionContext log](MERemoteExtensionContext, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_20BB85000, v4, OS_LOG_TYPE_DEFAULT, "ExtensionContext:%@ returned view controller for primary action clicked : %@", (uint8_t *)&v8, 0x16u);
  }
LABEL_11:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSMapTable)composeSessionToHandlerMap
{
  return self->_composeSessionToHandlerMap;
}

- (void)setComposeSessionToHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_composeSessionToHandlerMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeSessionToHandlerMap, 0);
}

void __42__MERemoteExtensionContext_remoteHostPoxy__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_20BB85000, v1, v2, "Fetching extension's remote host proxy %@ failed with error %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_createPrincipalObject
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_20BB85000, a2, OS_LOG_TYPE_ERROR, "ExtensionContext<%p>: principalObject can not be nil.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)viewControllerForSession:(uint64_t)a1 .cold.1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_20BB85000, v1, OS_LOG_TYPE_FAULT, "ExtensionContext:%@ Returned an invalid view controller: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)decodedMessageForMessageData:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_20BB85000, log, OS_LOG_TYPE_ERROR, "ExtensionContext:%@ should not invoke method [%@]", buf, 0x16u);

}

- (void)extensionViewControllerForMessageSigners:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_20BB85000, v1, v2, "ExtensionContext:%@ returned an invalid view controller: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __84__MERemoteExtensionContext_primaryActionClickedForMessageContext_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_20BB85000, v1, v2, "ExtensionContext:%@ returned an invalid view controller for primary action clicked: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
