@implementation NEAgentExtension

- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NEAgentExtension *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *extensionIdentifier;
  uint64_t v22;
  NSArray *extensionUUIDs;
  uint64_t v24;
  NSString *extensionPointIdentifier;
  NEAgentExtension *v26;
  objc_super v28;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)NEAgentExtension;
  v17 = -[NEAgentExtension init](&v28, sel_init);
  if (v17)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("extension-identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", v18, v13, a4, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v26 = 0;
      goto LABEL_6;
    }
    objc_storeWeak((id *)&v17->_managerObjectFactory, v16);
    objc_storeStrong((id *)&v17->_queue, a6);
    objc_msgSend(v19, "pluginIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    extensionIdentifier = v17->_extensionIdentifier;
    v17->_extensionIdentifier = (NSString *)v20;

    objc_msgSend(v19, "machOUUIDs");
    v22 = objc_claimAutoreleasedReturnValue();
    extensionUUIDs = v17->_extensionUUIDs;
    v17->_extensionUUIDs = (NSArray *)v22;

    objc_storeStrong((id *)&v17->_pluginType, a3);
    +[NELaunchServices pluginClassToExtensionPoint:](NELaunchServices, "pluginClassToExtensionPoint:", a4);
    v24 = objc_claimAutoreleasedReturnValue();
    extensionPointIdentifier = v17->_extensionPointIdentifier;
    v17->_extensionPointIdentifier = (NSString *)v24;

  }
  v26 = v17;
LABEL_6:

  return v26;
}

- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NEAgentExtension *v20;
  NEAgentExtension *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSArray *extensionUUIDs;
  NEAgentExtension *v26;
  __objc2_class *v27;
  id *v28;
  NEExtensionProviderHostContext *sessionContext;
  objc_super v31;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v31.receiver = self;
  v31.super_class = (Class)NEAgentExtension;
  v20 = -[NEAgentExtension init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_managerObjectFactory, v19);
    objc_storeStrong((id *)&v21->_queue, a7);
    v22 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v17, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithObjects:", v23, 0);
    extensionUUIDs = v21->_extensionUUIDs;
    v21->_extensionUUIDs = (NSArray *)v24;

    objc_storeStrong((id *)&v21->_pluginType, a3);
    objc_storeStrong((id *)&v21->_extensionIdentifier, a3);
    v26 = 0;
    switch(a4)
    {
      case 2:
        v27 = NEExtensionAppProxyProviderHostContext;
        goto LABEL_7;
      case 3:
        v27 = NEExtensionDNSProxyProviderHostContext;
        goto LABEL_7;
      case 5:
        v27 = NEExtensionPacketTunnelProviderHostContext;
        goto LABEL_7;
      case 7:
        v27 = NEExtensionAppPushProviderHostContext;
LABEL_7:
        v28 = -[NEExtensionProviderHostContext initWithVendorEndpoint:processIdentity:delegate:]((id *)[v27 alloc], v16, v17, v21);
        sessionContext = v21->_sessionContext;
        v21->_sessionContext = (NEExtensionProviderHostContext *)v28;

        if (v21->_sessionContext)
          goto LABEL_8;
        v26 = 0;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_8:
    v26 = v21;
  }

  return v26;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;

  -[NEAgentExtension sendFailedTimer](self, "sendFailedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NEAgentExtension sendFailedTimer](self, "sendFailedTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[NEAgentExtension setSendFailedTimer:](self, "setSendFailedTimer:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)NEAgentExtension;
  -[NEAgentExtension dealloc](&v5, sel_dealloc);
}

- (void)handleInitWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *extensionPointIdentifier;
  void *v8;
  NSString *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  NSString *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEAgentExtension extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v22[0] = *MEMORY[0x1E0CB2A08];
    -[NEAgentExtension extensionIdentifier](self, "extensionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    v22[1] = *MEMORY[0x1E0CB2A28];
    if (self)
      extensionPointIdentifier = self->_extensionPointIdentifier;
    else
      extensionPointIdentifier = 0;
    v23[1] = extensionPointIdentifier;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = extensionPointIdentifier;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  ne_log_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[NEAgentExtension extensionIdentifier](self, "extensionIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (self)
      v13 = self->_extensionPointIdentifier;
    else
      v13 = 0;
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEFAULT, "Looking for an extension with identifier %@ and extension point %@", buf, 0x16u);

  }
  v14 = (void *)MEMORY[0x1E0CB35D8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E3CC46D0;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  objc_msgSend(v14, "extensionsWithMatchingAttributes:completion:", v5, v16);

}

- (void)handleDisposeWithCompletionHandler:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  void (**newValue)(_QWORD);

  newValue = (void (**)(_QWORD))a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (self)
      objc_setProperty_atomic_copy(self, v5, newValue, 112);
    -[NEAgentExtension sessionContext](self, "sessionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dispose");

    goto LABEL_7;
  }
  v7 = newValue;
  if (newValue)
  {
    newValue[2](newValue);
LABEL_7:
    v7 = newValue;
  }

}

- (NSArray)uuids
{
  return self->_extensionUUIDs;
}

- (NSXPCInterface)managerInterface
{
  return 0;
}

- (NSXPCInterface)driverInterface
{
  if (driverInterface_onceToken_15173 != -1)
    dispatch_once(&driverInterface_onceToken_15173, &__block_literal_global_15174);
  return (NSXPCInterface *)(id)driverInterface_driverInterface_15175;
}

- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  id *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSExtension *extension;
  NSExtension *v16;
  void *v17;
  NSExtension *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEAgentExtension sessionContext](self, "sessionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke;
    v24[3] = &unk_1E3CC30D0;
    v10 = &v26;
    v25 = v6;
    v26 = v7;
    v11 = &v25;
    v24[4] = self;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v9, "createWithCompletionHandler:", v24);

  }
  else
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        extension = self->_extension;
      else
        extension = 0;
      v16 = extension;
      -[NSExtension identifier](v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v17;
      _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEFAULT, "Beginning extension request with extension %@", buf, 0xCu);

    }
    if (self)
      v18 = self->_extension;
    else
      v18 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_33;
    v21[3] = &unk_1E3CC2400;
    v10 = &v23;
    v22 = v6;
    v23 = v7;
    v11 = &v22;
    v21[4] = self;
    v19 = v6;
    v20 = v7;
    -[NSExtension beginExtensionRequestWithInputItems:completion:](v18, "beginExtensionRequestWithInputItems:completion:", 0, v21);
  }

}

- (void)updateConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:extensionIdentifier:", v4, self->_extensionIdentifier);

}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepWithCompletionHandler:", v4);

}

- (void)wakeup
{
  id v2;

  -[NEAgentExtension sessionContext](self, "sessionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wake");

}

- (void)extension:(id)a3 didFailWithError:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[NEAgentExtension queue](self, "queue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NEAgentExtension_extension_didFailWithError___block_invoke;
  block[3] = &unk_1E3CC41F0;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)extensionDidStop:(id)a3
{
  const char *v4;
  const char *v5;
  void (**Property)(void);
  SEL v7;

  -[NEAgentExtension setSessionContext:](self, "setSessionContext:", 0);
  if (self)
  {
    if (objc_getProperty(self, v4, 112, 1))
    {
      Property = (void (**)(void))objc_getProperty(self, v5, 112, 1);
      Property[2]();
      objc_setProperty_atomic_copy(self, v7, 0, 112);
    }
  }
}

- (void)handleExtensionStartedWithCompletionHandler:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (NEPluginManagerObjectFactory)managerObjectFactory
{
  return (NEPluginManagerObjectFactory *)objc_loadWeakRetained((id *)&self->_managerObjectFactory);
}

- (NEExtensionProviderHostContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
  objc_storeStrong((id *)&self->_sessionContext, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)pluginType
{
  return self->_pluginType;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSXPCInterface)managerProtocol
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 56, 1);
}

- (NSXPCInterface)driverProtocol
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)appsUpdateStarted
{
  return self->_appsUpdateStarted;
}

- (void)setAppsUpdateStarted:(BOOL)a3
{
  self->_appsUpdateStarted = a3;
}

- (BOOL)appsUpdateEnding
{
  return self->_appsUpdateEnding;
}

- (void)setAppsUpdateEnding:(BOOL)a3
{
  self->_appsUpdateEnding = a3;
}

- (OS_dispatch_source)sendFailedTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSendFailedTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingDisposeCompletion, 0);
  objc_storeStrong((id *)&self->_extensionUUIDs, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_sendFailedTimer, 0);
  objc_storeStrong((id *)&self->_driverProtocol, 0);
  objc_storeStrong((id *)&self->_managerProtocol, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_destroyWeak((id *)&self->_managerObjectFactory);
}

void __47__NEAgentExtension_extension_didFailWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v3 = (void *)v2[10];
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v2, "setSessionContext:", 0);
  -[NEAgentExtension setSessionRequestIdentifier:](*(_QWORD *)(a1 + 32), 0);
  -[NEAgentExtension handleExtensionExit:](*(void **)(a1 + 32), v4);

}

- (void)setSessionRequestIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)handleExtensionExit:(void *)a1
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__NEAgentExtension_handleExtensionExit___block_invoke;
    v5[3] = &unk_1E3CC2F98;
    v5[4] = a1;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

void __40__NEAgentExtension_handleExtensionExit___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "appsUpdateStarted"))
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "App updating - ignore extension failure/exit for %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sendFailedTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v17 = v6;
        _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "Scheduing timer for extension failure/exit for %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __40__NEAgentExtension_handleExtensionExit___block_invoke_8;
      v13 = &unk_1E3CC2F98;
      v8 = *(void **)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = v8;
      NECreateTimerSource(v7, 5, &v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSendFailedTimer:", v9, v10, v11, v12, v13, v14);

    }
  }
}

void __40__NEAgentExtension_handleExtensionExit___block_invoke_8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sendFailedTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sendFailedTimer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setSendFailedTimer:", 0);
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "appsUpdateStarted");
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "App updating - ignore extension failure/exit for %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    if (v6)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "Handle extension failure/exit for %@ - disconnect session", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "sendExtensionFailed");
  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2;
  v8[3] = &unk_1E3CC30A8;
  v11 = a2;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v5;
  v8[4] = v6;
  v9 = v7;
  dispatch_async(v4, v8);

}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_33(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    if (v8)
      v8 = (_QWORD *)v8[12];
    v9 = v8;
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v10;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEFAULT, "Extension request with extension %@ started with identifier %@", buf, 0x16u);

  }
  objc_msgSend(a1[4], "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_34;
  block[3] = &unk_1E3CC30F8;
  v12 = a1[4];
  v16 = v6;
  v17 = v12;
  v20 = a1[6];
  v18 = v5;
  v19 = a1[5];
  v13 = v5;
  v14 = v6;
  dispatch_async(v11, block);

}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD **)(a1 + 40);
      if (v8)
        v8 = (_QWORD *)v8[12];
      v9 = v8;
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "Failed to start extension %@: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = *(_QWORD **)(a1 + 40);
    if (v3)
      v3 = (_QWORD *)v3[12];
    v4 = *(_QWORD *)(a1 + 48);
    v5 = v3;
    -[NSExtension extensionHostContextForUUID:](v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_35;
      v15[3] = &unk_1E3CC3CE0;
      v15[4] = *(_QWORD *)(a1 + 40);
      v19 = *(id *)(a1 + 64);
      v16 = *(id *)(a1 + 48);
      v17 = v6;
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v17, "validateWithCompletionHandler:", v15);

    }
    else
    {
      ne_log_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD **)(a1 + 40);
        if (v12)
          v12 = (_QWORD *)v12[12];
        v13 = v12;
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Failed to get the host context for extension %@", buf, 0xCu);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_35(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2_36;
  v7[3] = &unk_1E3CC23D8;
  v5 = a1[4];
  v8 = v3;
  v9 = v5;
  v13 = a1[8];
  v10 = a1[5];
  v11 = a1[6];
  v12 = a1[7];
  v6 = v3;
  dispatch_async(v4, v7);

}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2_36(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "pluginType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "Provider %@ validation failed: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    -[NEAgentExtension setSessionRequestIdentifier:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setSessionContext:", *(_QWORD *)(a1 + 56));
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "sessionContext");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      objc_storeWeak((id *)(v4 + 56), v3);

    objc_msgSend(*(id *)(a1 + 40), "updateConfiguration:", *(_QWORD *)(a1 + 64));
    v6 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_37;
    v9[3] = &unk_1E3CC2F70;
    v9[4] = v6;
    v10 = *(id *)(a1 + 72);
    objc_msgSend(v6, "handleExtensionStartedWithCompletionHandler:", v9);

  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_37(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  if ((a2 & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 80);
      if (v5)
      {
        v6 = *(id *)(v4 + 96);
        objc_msgSend(v6, "cancelExtensionRequestWithIdentifier:", v5);

      }
    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = -[NEAgentExtension copyProcessIdentities](*(id *)(a1 + 32));
  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

- (id)copyProcessIdentities
{
  void *v1;
  void *v2;
  void *Property;
  const char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[16];

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "sessionContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      goto LABEL_7;
    objc_msgSend(v1, "sessionContext");
    Property = (void *)objc_claimAutoreleasedReturnValue();
    v5 = Property;
    if (Property)
      Property = objc_getProperty(Property, v4, 64, 1);
    v6 = Property;

    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, 0);

      return (id)v7;
    }
    else
    {
LABEL_7:
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "No extension process identity is available", buf, 2u);
      }

      return objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
  }
  return result;
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_3;
    v3[3] = &unk_1E3CC3080;
    v3[4] = *(_QWORD *)(a1 + 32);
    v5 = *(id *)(a1 + 48);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "validateWithCompletionHandler:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_4;
  v7[3] = &unk_1E3CC3198;
  v5 = a1[4];
  v8 = v3;
  v9 = v5;
  v11 = a1[6];
  v10 = a1[5];
  v6 = v3;
  dispatch_async(v4, v7);

}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "pluginType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "Provider %@ validation failed: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "updateConfiguration:", *(_QWORD *)(a1 + 48));
    v3 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_30;
    v7[3] = &unk_1E3CC2F70;
    v4 = *(id *)(a1 + 56);
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = v4;
    objc_msgSend(v3, "handleExtensionStartedWithCompletionHandler:", v7);

  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_30(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = -[NEAgentExtension copyProcessIdentities](*(id *)(a1 + 32));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);

}

void __35__NEAgentExtension_driverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4193D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)driverInterface_driverInterface_15175;
  driverInterface_driverInterface_15175 = v0;

}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E3CC3198;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "extensionIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      v6 = *(_QWORD *)(v6 + 88);
    *(_DWORD *)buf = 134218498;
    v28 = v3;
    v29 = 2112;
    v30 = v4;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "Found %lu extension(s) with identifier %@ and extension point %@", buf, 0x20u);

  }
  if (!*(_QWORD *)(a1 + 48) && (v8 = *(void **)(a1 + 32)) != 0 && objc_msgSend(v8, "count"))
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAgentExtension setExtension:](*(_QWORD *)(a1 + 40), v9);

    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_12;
    v25[3] = &unk_1E3CC2FE0;
    objc_copyWeak(&v26, (id *)buf);
    v11 = *(_QWORD **)(a1 + 40);
    if (v11)
      v11 = (_QWORD *)v11[12];
    v12 = v11;
    objc_msgSend(v12, "setRequestInterruptionBlock:", v25);

    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_14;
    v23[3] = &unk_1E3CC3008;
    objc_copyWeak(&v24, (id *)buf);
    v13 = *(_QWORD **)(a1 + 40);
    if (v13)
      v13 = (_QWORD *)v13[12];
    v14 = v13;
    objc_msgSend(v14, "setRequestCompletionBlock:", v23);

    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2_16;
    v21[3] = &unk_1E3CC3030;
    objc_copyWeak(&v22, (id *)buf);
    v15 = *(_QWORD **)(a1 + 40);
    if (v15)
      v15 = (_QWORD *)v15[12];
    v16 = v15;
    objc_msgSend(v16, "setRequestCancellationBlock:", v21);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "extensionIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = *(_QWORD *)(a1 + 40);
      if (v19)
        v19 = *(_QWORD *)(v19 + 88);
      v20 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v28 = v17;
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Failed to find an app extension with identifier %@ and extension point %@: %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)setExtension:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained)
      v7 = (void *)WeakRetained[12];
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Extension %@ died unexpectedly", (uint8_t *)&v10, 0xCu);

  }
  if (WeakRetained)
    v6 = WeakRetained[10];
  else
    v6 = 0;
  if (objc_msgSend(v3, "isEqual:", v6))
  {
    -[NEAgentExtension handleExtensionExit:](WeakRetained, v3);
    -[NEAgentExtension cleanupExtensionWithRequestIdentifier:](WeakRetained, v3);
  }

}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t *WeakRetained;
  uint64_t *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = WeakRetained[10];
  else
    v5 = 0;
  if (objc_msgSend(v6, "isEqual:", v5))
    -[NEAgentExtension cleanupExtensionWithRequestIdentifier:](v4, v6);

}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2_16(uint64_t a1, void *a2)
{
  uint64_t *WeakRetained;
  uint64_t *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = WeakRetained[10];
  else
    v5 = 0;
  if (objc_msgSend(v6, "isEqual:", v5))
    -[NEAgentExtension cleanupExtensionWithRequestIdentifier:](v4, v6);

}

- (void)cleanupExtensionWithRequestIdentifier:(void *)a1
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__NEAgentExtension_cleanupExtensionWithRequestIdentifier___block_invoke;
    v5[3] = &unk_1E3CC2F98;
    v5[4] = a1;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

void __58__NEAgentExtension_cleanupExtensionWithRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[NEAgentExtension setSessionRequestIdentifier:](*(_QWORD *)(a1 + 32), 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "setRequestInterruptionBlock:", 0);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 96);
  else
    v5 = 0;
  objc_msgSend(v5, "setRequestCancellationBlock:", 0);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 96);
  else
    v7 = 0;
  objc_msgSend(v7, "setRequestCompletionBlock:", 0);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 96);
  else
    v9 = 0;
  objc_msgSend(v9, "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(a1 + 40));
  -[NEAgentExtension setExtension:](*(_QWORD *)(a1 + 32), 0);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "sessionContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extensionDidStop:", v11);

}

@end
