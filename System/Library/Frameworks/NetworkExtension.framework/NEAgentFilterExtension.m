@implementation NEAgentFilterExtension

- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NEAgentFilterExtension *v17;
  NEAgentFilterExtension *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *dataExtensionIdentifier;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *controlExtensionIdentifier;
  uint64_t v31;
  NSArray *extensionUUIDs;
  uint64_t inited;
  NEAgentFilterExtension *v34;
  NSObject *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  objc_super v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v40.receiver = self;
  v40.super_class = (Class)NEAgentFilterExtension;
  v17 = -[NEAgentFilterExtension init](&v40, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_11;
  objc_storeWeak((id *)&v17->_managerObjectFactory, v16);
  objc_storeStrong((id *)&v18->_queue, a6);
  *(_WORD *)&v18->_dataExtensionInitialized = 0;
  objc_storeStrong((id *)&v18->_pluginType, a3);
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("extension-identifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", v19, v13, a4, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "machOUUIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v23);

    objc_msgSend(v22, "pluginIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    dataExtensionIdentifier = v18->_dataExtensionIdentifier;
    v18->_dataExtensionIdentifier = (NSString *)v24;

  }
  +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", 0, v13, 4, CFSTR("com.apple.networkextension.filter-control"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "machOUUIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v28);

    objc_msgSend(v27, "pluginIdentifier");
    v29 = objc_claimAutoreleasedReturnValue();
    controlExtensionIdentifier = v18->_controlExtensionIdentifier;
    v18->_controlExtensionIdentifier = (NSString *)v29;

  }
  if (!v18->_dataExtensionIdentifier)
  {
    ne_log_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      v34 = 0;
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412546;
    v42 = CFSTR("com.apple.networkextension.filter-data");
    v43 = 2112;
    v44 = v13;
    v36 = "Failed to find a %@ extension inside of app %@";
    v37 = v35;
    v38 = 22;
LABEL_18:
    _os_log_error_impl(&dword_19BD16000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
    goto LABEL_15;
  }
  if (objc_msgSend(v20, "count"))
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v20);
    extensionUUIDs = v18->_extensionUUIDs;
    v18->_extensionUUIDs = (NSArray *)v31;

  }
  inited = ne_filter_crypto_init_master();
  v18->_crypto_state = (cfil_crypto_state *)inited;
  if (!inited)
  {
    ne_log_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v36 = "Failed to initialize NE filter crypto";
    v37 = v35;
    v38 = 2;
    goto LABEL_18;
  }
  arc4random_buf(&v18->_crypto_kernel_salt, 4uLL);

LABEL_11:
  v34 = v18;
LABEL_16:

  return v34;
}

- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NEAgentFilterExtension *v20;
  NEAgentFilterExtension *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSArray *extensionUUIDs;
  NEAgentFilterExtension *v26;
  __objc2_class *v27;
  id *v28;
  NEFilterExtensionProviderHostContext *dataSessionContext;
  uint64_t inited;
  NSObject *v31;
  uint8_t buf[16];
  objc_super v34;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)NEAgentFilterExtension;
  v20 = -[NEAgentFilterExtension init](&v34, sel_init);
  v21 = v20;
  if (!v20)
    goto LABEL_9;
  objc_storeWeak((id *)&v20->_managerObjectFactory, v19);
  objc_storeStrong((id *)&v21->_queue, a7);
  v22 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(v17, "uuid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "initWithObjects:", v23, 0);
  extensionUUIDs = v21->_extensionUUIDs;
  v21->_extensionUUIDs = (NSArray *)v24;

  objc_storeStrong((id *)&v21->_pluginType, a3);
  if (a4 == 6)
  {
    v27 = NEFilterPacketExtensionProviderHostContext;
LABEL_6:
    v28 = -[NEExtensionProviderHostContext initWithVendorEndpoint:processIdentity:delegate:]((id *)[v27 alloc], v16, v17, v21);
    dataSessionContext = v21->_dataSessionContext;
    v21->_dataSessionContext = (NEFilterExtensionProviderHostContext *)v28;

    if (v21->_dataSessionContext)
    {
      objc_storeStrong((id *)&v21->_dataExtensionIdentifier, a3);
      inited = ne_filter_crypto_init_master();
      v21->_crypto_state = (cfil_crypto_state *)inited;
      if (inited)
      {
        arc4random_buf(&v21->_crypto_kernel_salt, 4uLL);
LABEL_9:
        v26 = v21;
        goto LABEL_14;
      }
      ne_log_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v31, OS_LOG_TYPE_ERROR, "Failed to initialize NE filter crypto", buf, 2u);
      }

    }
    v26 = 0;
    goto LABEL_14;
  }
  v26 = 0;
  if (a4 == 4)
  {
    v27 = NEFilterDataExtensionProviderHostContext;
    goto LABEL_6;
  }
LABEL_14:

  return v26;
}

- (void)dealloc
{
  cfil_crypto_state *crypto_state;
  const char *v4;
  NSObject *Property;
  SEL v6;
  objc_super v7;

  crypto_state = self->_crypto_state;
  if (crypto_state)
  {
    free(crypto_state);
    self->_crypto_state = 0;
  }
  if (objc_getProperty(self, a2, 128, 1))
  {
    Property = objc_getProperty(self, v4, 128, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(self, v6, 0, 128);
  }
  v7.receiver = self;
  v7.super_class = (Class)NEAgentFilterExtension;
  -[NEAgentFilterExtension dealloc](&v7, sel_dealloc);
}

- (void)handleInitWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  SEL v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  id Property;
  void *v14;
  _QWORD v15[5];
  id v16;
  id location;
  __int128 buf;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  _QWORD *v21;
  id v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E3CC2F70;
  v15[4] = self;
  v16 = v4;
  v6 = v4;
  v7 = v15;
  if (self)
  {
    objc_initWeak(&location, self);
    v23[0] = *MEMORY[0x1E0CB2A08];
    v9 = objc_getProperty(self, v8, 88, 1);
    v23[1] = *MEMORY[0x1E0CB2A28];
    v24[0] = v9;
    v24[1] = CFSTR("com.apple.networkextension.filter-data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      Property = objc_getProperty(self, v12, 88, 1);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = Property;
      _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEFAULT, "Looking for a data extension with identifier %@", (uint8_t *)&buf, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0CB35D8];
    *(_QWORD *)&buf = v5;
    *((_QWORD *)&buf + 1) = 3221225472;
    v19 = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke;
    v20 = &unk_1E3CC3058;
    objc_copyWeak(v22, &location);
    v21 = v7;
    objc_msgSend(v14, "extensionsWithMatchingAttributes:completion:", v10, &buf);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

}

- (void)handleDisposeWithCompletionHandler:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 80, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__NEAgentFilterExtension_handleDisposeWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E3CC46A8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)handleCancel
{
  -[NEAgentFilterExtension stopFilterExtensionWithReason:](self, 1);
}

- (void)handleAppsUninstalled:(id)a3
{
  NSObject *v4;
  NSString *pluginType;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "containsObject:", self->_pluginType))
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      pluginType = self->_pluginType;
      v6 = 138412290;
      v7 = pluginType;
      _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEFAULT, "App for plugin type %@ has been uninstalled, stopping", (uint8_t *)&v6, 0xCu);
    }

    -[NEAgentFilterExtension stopFilterExtensionWithReason:](self, 6);
  }
}

- (void)handleAppsUpdateBegins:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 80, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__NEAgentFilterExtension_handleAppsUpdateBegins___block_invoke;
  v8[3] = &unk_1E3CC2F98;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)handleAppsUpdateEnding:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 80, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__NEAgentFilterExtension_handleAppsUpdateEnding___block_invoke;
  v8[3] = &unk_1E3CC2F98;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)handleAppsUpdateEnds:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 80, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__NEAgentFilterExtension_handleAppsUpdateEnds___block_invoke;
  v8[3] = &unk_1E3CC2F98;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (NSArray)uuids
{
  return self->_extensionUUIDs;
}

- (NSXPCInterface)managerInterface
{
  if (managerInterface_onceToken_18224 != -1)
    dispatch_once(&managerInterface_onceToken_18224, &__block_literal_global_18225);
  return (NSXPCInterface *)(id)managerInterface_managerInterface_18226;
}

- (NSXPCInterface)driverInterface
{
  if (driverInterface_onceToken_18221 != -1)
    dispatch_once(&driverInterface_onceToken_18221, &__block_literal_global_26);
  return (NSXPCInterface *)(id)driverInterface_driverInterface_18222;
}

- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD *v13;
  NSObject *Property;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  _QWORD *v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke;
  v15[3] = &unk_1E3CC30D0;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v9 = v6;
  v10 = v7;
  v11 = v9;
  v13 = v15;
  if (self)
  {
    Property = objc_getProperty(self, v12, 80, 1);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke;
    block[3] = &unk_1E3CC3A30;
    block[4] = self;
    v20 = v13;
    v19 = v11;
    dispatch_async(Property, block);

  }
}

- (void)startFilter
{
  NEAgentFilterExtension *v2;
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (NEAgentFilterExtension *)objc_getProperty(self, a2, 80, 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NEAgentFilterExtension_startFilter__block_invoke;
  block[3] = &unk_1E3CC41F0;
  block[4] = v2;
  dispatch_async(&self->super, block);
}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  id Property;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v6 = v4;
  if (self && self->_dataExtensionInitialized)
  {
    Property = objc_getProperty(self, v5, 48, 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E3CC46A8;
    v8[4] = self;
    v9 = v6;
    objc_msgSend(Property, "sleepWithCompletionHandler:", v8);

  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }

}

- (void)wakeup
{
  SEL v3;
  id v4;
  BOOL controlExtensionInitialized;
  const char *v6;

  if (self)
  {
    if (self->_dataExtensionInitialized)
    {
      objc_msgSend(objc_getProperty(self, a2, 48, 1), "wake");
      v4 = objc_getProperty(self, v3, 40, 1);
      if (v4)
      {
        controlExtensionInitialized = self->_controlExtensionInitialized;

        if (controlExtensionInitialized)
          objc_msgSend(objc_getProperty(self, v6, 56, 1), "wake");
      }
    }
  }
}

- (void)updateConfiguration:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 80, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__NEAgentFilterExtension_updateConfiguration___block_invoke;
  v8[3] = &unk_1E3CC2F98;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)extension:(id)a3 didStartWithError:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  id Property;
  id v12;
  NEAgentFilterExtension *v13;
  uint64_t v14;
  uint64_t v15;
  SEL v16;
  id v17;
  SEL v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v9 = v7;
  if (self)
  {
    if (objc_getProperty(self, v8, 48, 1) == v6)
    {
      if (v9)
      {
LABEL_10:
        v13 = self;
        v14 = 0;
        v15 = 1;
LABEL_13:
        -[NEAgentFilterExtension sendFilterStatus:withError:]((uint64_t)v13, v14, v15);
        goto LABEL_14;
      }
      if (self->_controlExtensionInitialized)
      {
        objc_initWeak(&location, self);
        v17 = objc_getProperty(self, v16, 56, 1);
        v19 = objc_getProperty(self, v18, 112, 1);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __54__NEAgentFilterExtension_extension_didStartWithError___block_invoke;
        v20[3] = &unk_1E3CC3148;
        objc_copyWeak(&v21, &location);
        objc_msgSend(v17, "startFilterWithOptions:completionHandler:", v19, v20);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
        goto LABEL_14;
      }
LABEL_12:
      v13 = self;
      v14 = 2;
      v15 = 0;
      goto LABEL_13;
    }
    Property = objc_getProperty(self, v10, 56, 1);
  }
  else
  {
    if (!v6)
    {
      if (!v7)
        goto LABEL_14;
      goto LABEL_10;
    }
    Property = 0;
  }
  if (Property == v6)
  {
    if (v9)
    {
      if (self)
        v12 = objc_getProperty(self, v8, 48, 1);
      else
        v12 = 0;
      objc_msgSend(v12, "stopWithReason:", 7);
      goto LABEL_10;
    }
    goto LABEL_12;
  }
LABEL_14:

}

- (void)extension:(id)a3 didFailWithError:(id)a4
{
  const char *v6;
  id v7;
  id v8;
  ptrdiff_t v9;
  const char *v10;
  ptrdiff_t v11;
  SEL v12;
  SEL v13;
  char *_cmd;

  _cmd = (char *)a3;
  v7 = a4;
  if (!self)
    goto LABEL_5;
  if (objc_getProperty(self, v6, 48, 1) == _cmd)
  {
    v9 = 64;
    v8 = objc_getProperty(self, _cmd, 64, 1);
    v11 = 48;
LABEL_10:
    objc_setProperty_atomic(self, v10, 0, v11);
    objc_setProperty_atomic(self, v13, 0, v9);
    goto LABEL_11;
  }
  if (objc_getProperty(self, _cmd, 56, 1) == _cmd)
  {
    v9 = 72;
    v8 = objc_getProperty(self, _cmd, 72, 1);
LABEL_9:
    v11 = 56;
    goto LABEL_10;
  }
  if (!_cmd)
  {
    objc_setProperty_atomic(self, 0, 0, 48);
    objc_setProperty_atomic(self, v12, 0, 64);
    v8 = 0;
    v9 = 72;
    goto LABEL_9;
  }
LABEL_5:
  v8 = 0;
LABEL_11:
  -[NEAgentFilterExtension handleExtensionExit:](self, v8);

}

- (void)extensionDidStop:(id)a3
{
  char *v4;
  ptrdiff_t v5;
  const char *Property;
  const char *v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  void (**v13)(void);
  SEL v14;
  const char *_cmd;

  v4 = (char *)a3;
  if (self)
  {
    v5 = 48;
    _cmd = v4;
    Property = (const char *)objc_getProperty(self, v4, 48, 1);
    v7 = _cmd;
    if (Property == _cmd
      || (v5 = 56, v8 = (const char *)objc_getProperty(self, _cmd, 56, 1), v7 = _cmd, v8 == _cmd))
    {
      objc_setProperty_atomic(self, v7, 0, v5);
    }
    v9 = objc_getProperty(self, v7, 48, 1);
    if (v9)
    {

LABEL_7:
      v4 = (char *)_cmd;
      goto LABEL_9;
    }
    v11 = objc_getProperty(self, v10, 56, 1);
    v4 = (char *)_cmd;
    if (!v11)
    {
      v12 = objc_getProperty(self, _cmd, 144, 1);
      v4 = (char *)_cmd;
      if (v12)
      {
        v13 = (void (**)(void))objc_getProperty(self, _cmd, 144, 1);
        v13[2]();
        objc_setProperty_atomic_copy(self, v14, 0, 144);
        goto LABEL_7;
      }
    }
  }
LABEL_9:

}

- (void)sendBrowserContentFilterServerRequest
{
  id WeakRetained;
  id v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "managerObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "acceptAgentClients");
}

- (void)sendSocketContentFilterRequest
{
  NEAgentFilterExtension *v2;
  NEAgentFilterExtension *v3;
  char isKindOfClass;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  objc_class *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v2 = self;
  v16 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (NEAgentFilterExtension *)objc_getProperty(self, a2, 48, 1);
  v3 = self;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (v2)
      WeakRetained = objc_loadWeakRetained((id *)&v2->_managerObjectFactory);
    else
      WeakRetained = 0;
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke;
    v13[3] = &unk_1E3CC45C8;
    v13[4] = v2;
    objc_msgSend(WeakRetained, "managerObjectWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_62;
    v12[3] = &unk_1E3CC3170;
    v12[4] = v2;
    objc_msgSend(v7, "createContentFilterSocketWithCompletionHandler:", v12);

  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v2)
        objc_getProperty(v2, v9, 48, 1);
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "sendSocketContentFilterRequest called, but dataSessionContext is not a flow data provider: %@", buf, 0xCu);

    }
  }
}

- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4
{
  const char *v6;
  void *v7;
  id Property;
  NEFilterControlVerdict *v9;
  void (**v10)(id, NEFilterControlVerdict *);

  v10 = (void (**)(id, NEFilterControlVerdict *))a4;
  -[NEAgentFilterExtension sanitizeFilterFlow:]((unsigned int *)self, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (self)
      Property = objc_getProperty(self, v6, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "handleNewFlow:completionHandler:", v7, v10);
  }
  else
  {
    v9 = objc_alloc_init(NEFilterControlVerdict);
    v10[2](v10, v9);

  }
}

- (void)report:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  char *_cmd;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self)
  {
LABEL_18:

LABEL_19:
    _cmd = 0;
    goto LABEL_20;
  }
  if (!v4)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[NEAgentFilterExtension sanitizeReport:]";
      _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "%s called with null report", buf, 0xCu);
    }

    goto LABEL_18;
  }
  objc_msgSend(v4, "flow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAgentFilterExtension sanitizeFilterFlow:]((unsigned int *)self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "action");
  if ((unint64_t)(v8 - 1) >= 4)
    v9 = 0;
  else
    v9 = v8;
  v10 = objc_msgSend(v5, "event");
  if ((unint64_t)(v10 - 1) >= 3)
    v11 = 0;
  else
    v11 = v10;
  _cmd = 0;
  if (v7 && v9 && v11)
  {
    _cmd = (char *)-[NEFilterReport initWithFlow:action:event:]([NEFilterReport alloc], v7, v9, v11);
    objc_msgSend(_cmd, "setBytesInboundCount:", objc_msgSend(v7, "inBytes"));
    objc_msgSend(_cmd, "setBytesOutboundCount:", objc_msgSend(v7, "outBytes"));
  }

  if (!_cmd)
    goto LABEL_19;
  objc_msgSend(objc_getProperty(self, _cmd, 56, 1), "handleReport:", _cmd);
LABEL_20:

}

- (void)getFilterClientConnectionWithCompletionHandler:(int)a3 completionHandler:(id)a4
{
  const char *v6;
  id v7;
  id Property;
  id v9;
  char isKindOfClass;
  const char *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  objc_class *v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (self)
    Property = objc_getProperty(self, v6, 48, 1);
  else
    Property = 0;
  v9 = Property;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NEAgentFilterExtension generateClientKey:salt:]((uint64_t)self, a3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = a3;
        _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "getFilterClientConnection called, but failed to create client crypto key for pid %d", buf, 8u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
    if (self)
      v14 = objc_getProperty(self, v11, 80, 1);
    else
      v14 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke;
    block[3] = &unk_1E3CC3A30;
    block[4] = self;
    v21 = v12;
    v22 = v7;
    v15 = v12;
    dispatch_async(v14, block);

  }
  else
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (self)
        objc_getProperty(self, v17, 48, 1);
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "getFilterClientConnection called, but dataSessionContext is not a flow data provider: %@", buf, 0xCu);

    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)notifyRulesChanged
{
  NEAgentFilterExtension *v2;
  NEAgentFilterExtension *v3;
  char isKindOfClass;
  const char *v5;
  id Property;
  NSObject *v7;
  const char *v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v2 = self;
  v13 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (NEAgentFilterExtension *)objc_getProperty(self, a2, 48, 1);
  v3 = self;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (v2)
      Property = objc_getProperty(v2, v5, 48, 1);
    else
      Property = 0;
    objc_msgSend(Property, "handleRulesChanged");
  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v2)
        objc_getProperty(v2, v8, 48, 1);
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "notifyRulesChanged called, but dataSessionContext is not a flow data provider: %@", (uint8_t *)&v11, 0xCu);

    }
  }
}

- (void)provideRemediationMap:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  char isKindOfClass;
  const char *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 48, 1);
  else
    Property = 0;
  v7 = Property;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (self)
      v10 = objc_getProperty(self, v9, 48, 1);
    else
      v10 = 0;
    objc_msgSend(v10, "provideRemediationMap:", v5);
  }
  else
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self)
        objc_getProperty(self, v12, 48, 1);
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "provideRemediationMap called, but dataSessionContext is not a flow data provider: %@", (uint8_t *)&v15, 0xCu);

    }
  }

}

- (void)provideURLAppendStringMap:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  char isKindOfClass;
  const char *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 48, 1);
  else
    Property = 0;
  v7 = Property;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (self)
      v10 = objc_getProperty(self, v9, 48, 1);
    else
      v10 = 0;
    objc_msgSend(v10, "provideURLAppendStringMap:", v5);
  }
  else
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self)
        objc_getProperty(self, v12, 48, 1);
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "provideURLAppendStringMap called, but dataSessionContext is not a flow data provider: %@", (uint8_t *)&v15, 0xCu);

    }
  }

}

- (void)createPacketChannelForExtension:(id)a3 completionHandler:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[5];

  v5 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);
  else
    WeakRetained = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NEAgentFilterExtension_createPacketChannelForExtension_completionHandler___block_invoke;
  v8[3] = &unk_1E3CC45C8;
  v8[4] = self;
  objc_msgSend(WeakRetained, "managerObjectWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "createPacketChannelWithCompletionHandler:", v5);
}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  _QWORD v10[5];

  v6 = a3;
  v7 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);
  else
    WeakRetained = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__NEAgentFilterExtension_applySettings_completionHandler___block_invoke;
  v10[3] = &unk_1E3CC45C8;
  v10[4] = self;
  objc_msgSend(WeakRetained, "managerObjectWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "applySettings:completionHandler:", v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingDisposeCompletion, 0);
  objc_storeStrong((id *)&self->_sendFailedTimer, 0);
  objc_storeStrong((id *)&self->_extensionUUIDs, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_clientListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_controlExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_dataExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_controlSessionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSessionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_controlSessionContext, 0);
  objc_storeStrong((id *)&self->_dataSessionContext, 0);
  objc_storeStrong((id *)&self->_controlExtension, 0);
  objc_storeStrong((id *)&self->_dataExtension, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_destroyWeak((id *)&self->_managerObjectFactory);
}

void __58__NEAgentFilterExtension_applySettings_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Got an XPC error while applying filter settings: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(_QWORD *)(a1 + 32), 0, 1);
}

- (void)sendFilterStatus:(uint64_t)a3 withError:
{
  id WeakRetained;
  void *v6;
  id v7;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "managerObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), a3, 0);
    objc_msgSend(v7, "setStatus:error:", a2, v6);

  }
}

void __76__NEAgentFilterExtension_createPacketChannelForExtension_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Got an XPC error while creating a packet filter channel: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(_QWORD *)(a1 + 32), 0, 1);
}

- (NSObject)generateClientKey:(int)a3 salt:
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v10;
  int v11;
  int v12;
  __int128 buffer;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!pid)
    goto LABEL_5;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  buffer = 0u;
  if (proc_pidinfo(pid, 17, 1uLL, &buffer, 56) != 56)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 67109120;
      v12 = pid;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "failed to get upid for pid %d", (uint8_t *)&v11, 8u);
    }

    return 0;
  }
  a3 = v14;
LABEL_5:
  buffer = 0u;
  v14 = 0u;
  if ((ne_filter_crypto_generate_client_key() & 1) == 0)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 67109120;
      v12 = a3;
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "failed to generate client crypto key for salt %u", (uint8_t *)&v11, 8u);
    }
    goto LABEL_17;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &buffer, 32);
  if (!v5)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 67109120;
      v12 = a3;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "failed to create NSData for client crypto key for salt %u", (uint8_t *)&v11, 8u);
    }

    v6 = 0;
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  v6 = v5;
  v7 = v6;
LABEL_18:

  return v7;
}

void __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id Property;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  if (!v3)
    goto LABEL_9;
  if (!objc_getProperty(v3, a2, 104, 1))
  {
    v8 = *(void **)(a1 + 32);
    if (v8)
    {
      Property = objc_getProperty(v8, v4, 48, 1);
      v10 = *(_QWORD *)(a1 + 32);
LABEL_8:
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_2;
      v11[3] = &unk_1E3CC31C0;
      v11[4] = v10;
      v13 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 40);
      objc_msgSend(Property, "fetchProviderConnectionWithCompletionHandler:", v11);

      return;
    }
LABEL_9:
    v10 = 0;
    Property = 0;
    goto LABEL_8;
  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  if (v6)
    v7 = objc_getProperty(v6, v4, 104, 1);
  else
    v7 = 0;
  (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v7, *(_QWORD *)(a1 + 40));
}

void __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  NSObject *Property;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    Property = objc_getProperty(v5, v3, 80, 1);
    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = 0;
    Property = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_3;
  v9[3] = &unk_1E3CC3198;
  v9[4] = v7;
  v10 = v4;
  v12 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v8 = v4;
  dispatch_async(Property, v9);

}

uint64_t __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_3(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  id Property;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, *(id *)(a1 + 40), 104);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 56);
    if (v5)
      Property = objc_getProperty(v5, v4, 104, 1);
    else
      Property = 0;
  }
  else
  {
    Property = 0;
    v6 = *(_QWORD *)(a1 + 56);
  }
  return (*(uint64_t (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, Property, *(_QWORD *)(a1 + 48));
}

- (unsigned)sanitizeFilterFlow:(unsigned int *)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  SEL v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  const __CFString *v24;
  int v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  unsigned int *v29;
  uint8_t buf[4];
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v31 = "-[NEAgentFilterExtension sanitizeFilterFlow:]";
        _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "%s called with null flow", buf, 0xCu);
      }
      goto LABEL_18;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v31 = v3;
      _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "Sanitizing flow before: %@", buf, 0xCu);
    }

    v5 = v3;
    v7 = objc_getProperty(v5, v6, 120, 1);

    if (v7)
    {
      -[NEAgentFilterExtension generateClientKey:salt:]((uint64_t)a1, -[NSObject pid](v5, "pid"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSObject pid](v5, "pid");
      if (!v8)
        goto LABEL_15;
    }
    else
    {
      -[NEAgentFilterExtension generateClientKey:salt:]((uint64_t)a1, 0, a1[3]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[3];
      if (!v8)
      {
LABEL_15:
        ne_log_obj();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v31 = v9;
          _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Signature validation failed to generate client crypto key for salt %d", buf, 8u);
        }

LABEL_18:
        a1 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v10 = objc_retainAutorelease(v8);
    if (!objc_msgSend(v10, "bytes") || objc_msgSend(v10, "length") != 32)
      goto LABEL_15;
    v11 = +[NEAgentFilterExtension authenticateFlowWithState:crypto_key:flow:salt:isKernelSocket:](NEAgentFilterExtension, "authenticateFlowWithState:crypto_key:flow:salt:isKernelSocket:", *((_QWORD *)a1 + 17), v10, v5, v9, v7 == 0);

    if (!v11)
    {
      a1 = 0;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v5;
      a1 = -[NSObject copy](v12, "copy");
      objc_msgSend(a1, "setCrypto_signature:", 0);
      objc_msgSend(a1, "setPid:", 0);
      objc_msgSend(a1, "setEpid:", 0);
      objc_msgSend(a1, "setUuid:", 0);
      objc_msgSend(a1, "setEuuid:", 0);
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)v12[24].isa + 1 >= 2)
          v24 = CFSTR("kernel");
        else
          v24 = CFSTR("socket");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v31 = v24;
        *(_WORD *)&v31[8] = 2112;
        *(_QWORD *)&v31[10] = a1;
        _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "Sanitized %@ socket flow: %@", buf, 0x16u);
      }

      -[NSObject euuid](v12, "euuid");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        ne_log_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v31 = v26;
          v27 = v26;
          _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "Unknown flow class %@", buf, 0xCu);

        }
        a1 = 0;
        v14 = 0;
        goto LABEL_33;
      }
      a1 = -[NSObject copy](v5, "copy");
      objc_msgSend(a1, "setCrypto_signature:", 0);
      objc_msgSend(a1, "setPid:", 0);
      objc_msgSend(a1, "setEpid:", 0);
      objc_msgSend(a1, "setRequest:", 0);
      objc_msgSend(a1, "setResponse:", 0);
      objc_msgSend(a1, "setParentURL:", 0);
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v31 = a1;
        _os_log_debug_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEBUG, "Sanitized browser flow: %@", buf, 0xCu);
      }
      v14 = 0;
    }

    if (!a1)
    {
LABEL_34:
      v5 = v14;
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v31 = a1;
        _os_log_debug_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEBUG, "Sanitizing flow after: %@", buf, 0xCu);
      }

      goto LABEL_19;
    }
    objc_msgSend(a1, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    trimURL(v17);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setURL:", v18);
    objc_msgSend(a1, "sourceAppIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v25 = -[NSObject pid](v5, "pid");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v31 = v25;
      *(_WORD *)&v31[4] = 2112;
      *(_QWORD *)&v31[6] = v14;
      *(_WORD *)&v31[14] = 2112;
      *(_QWORD *)&v31[16] = v19;
      _os_log_debug_impl(&dword_19BD16000, v20, OS_LOG_TYPE_DEBUG, "LOOKUP: Sanitization (2) looking up pid %d, euuid %@, bundle id: %@", buf, 0x1Cu);
    }

    +[NEAppInfoCache sharedAppInfoCache]();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[NSObject pid](v5, "pid");
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __45__NEAgentFilterExtension_sanitizeFilterFlow___block_invoke;
    v28[3] = &unk_1E3CC31F0;
    a1 = a1;
    v29 = a1;
    -[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:](v21, v22, v14, v19, v28);

LABEL_33:
    goto LABEL_34;
  }
LABEL_20:

  return a1;
}

void __45__NEAgentFilterExtension_sanitizeFilterFlow___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3[3];
    objc_msgSend(*(id *)(a1 + 32), "setSourceAppIdentifier:", v5);

    v6 = v4[4];
    objc_msgSend(*(id *)(a1 + 32), "setSourceAppVersion:", v6);

    v7 = v4[5];
    objc_msgSend(*(id *)(a1 + 32), "setSourceAppUniqueIdentifier:", v7);
  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Could not find app info for flow", v9, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "sourceAppVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(*(id *)(a1 + 32), "setSourceAppVersion:", &stru_1E3CC53C8);

}

void __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Got an XPC error while creating a content filter socket: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(_QWORD *)(a1 + 32), 0, 1);
}

void __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_62(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  NSObject *Property;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    Property = objc_getProperty(v5, v3, 80, 1);
    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = 0;
    Property = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_2;
  v9[3] = &unk_1E3CC2F98;
  v10 = v4;
  v11 = v7;
  v8 = v4;
  dispatch_async(Property, v9);

}

void __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  __int128 *v9;
  unint64_t v10;
  __int128 v11;
  ssize_t v12;
  int *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  id Property;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  NSObject *v23;
  uint32_t v24;
  __int128 v25;
  uint8_t buf[16];
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Failed to create a content filter socket", buf, 2u);
    }

    -[NEAgentFilterExtension sendFilterStatus:withError:](*(_QWORD *)(a1 + 40), 0, 1);
    return;
  }
  v3 = objc_msgSend(v2, "fileDescriptor");
  v4 = *(_QWORD *)(a1 + 40);
  if (!v4
    || (-[NEAgentFilterExtension generateClientKey:salt:](v4, 0, *(_DWORD *)(v4 + 12)),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "sendSocketContentFilterRequest called, but failed to create client crypto key for kernel", buf, 2u);
    }
    v17 = 0;
    goto LABEL_23;
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  v8 = v7;
  if (!v6)
    goto LABEL_19;
  if (v3 < 0 || -[NSObject length](v7, "length") != 32)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v21 = "No control socket or invalid crypto key for sending crypto key";
    v22 = buf;
    v23 = v16;
    v24 = 2;
LABEL_32:
    _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, v21, v22, v24);
    goto LABEL_18;
  }
  *(_OWORD *)buf = xmmword_19BED7510;
  v27 = 0;
  v9 = (__int128 *)-[NSObject bytes](objc_retainAutorelease(v8), "bytes");
  v10 = 0;
  v11 = v9[1];
  v28 = *v9;
  v29 = v11;
  while (1)
  {
    v12 = write(v3, &buf[v10], 56 - v10);
    v13 = __error();
    if (v12 < 1)
      break;
    v10 += v12;
LABEL_12:
    if (v10 >= 0x38)
      goto LABEL_19;
  }
  if (!v12)
    goto LABEL_12;
  v14 = *v13;
  if (*v13 == 35)
    goto LABEL_12;
  ne_log_obj();
  v20 = objc_claimAutoreleasedReturnValue();
  v16 = v20;
  if (v14 != 2)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LODWORD(v25) = 136315138;
    *(_QWORD *)((char *)&v25 + 4) = strerror(v14);
    v21 = "Write operation on the control socket failed while sending the crypto key: (%s)";
    v22 = (uint8_t *)&v25;
    v23 = v16;
    v24 = 12;
    goto LABEL_32;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "Failed to send crypto key to kernel", (uint8_t *)&v25, 2u);
  }
LABEL_18:

LABEL_19:
  v17 = v8;
LABEL_23:

  Property = *(id *)(a1 + 40);
  if (Property)
    Property = objc_getProperty(Property, v18, 48, 1);
  objc_msgSend(Property, "providerControlSocketFileHandle:", *(_QWORD *)(a1 + 32), v25, *(_QWORD *)buf, *(_QWORD *)&buf[8], v27, v28, v29, v30);

}

- (void)handleExtensionExit:(void *)a1
{
  const char *v3;
  id v4;
  NSObject *Property;
  _QWORD v6[5];
  id v7;

  v4 = a2;
  if (a1)
  {
    Property = objc_getProperty(a1, v3, 80, 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__NEAgentFilterExtension_handleExtensionExit___block_invoke;
    v6[3] = &unk_1E3CC2F98;
    v6[4] = a1;
    v7 = v4;
    dispatch_async(Property, v6);

  }
}

void __46__NEAgentFilterExtension_handleExtensionExit___block_invoke(uint64_t a1, const char *a2)
{
  _BYTE *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  NSObject *Property;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE **)(a1 + 32);
  if (!v3)
  {
LABEL_4:
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEFAULT, "Scheduing timer for Filter extension failure/exit for %@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      Property = objc_getProperty(v7, v6, 80, 1);
      v9 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v9 = 0;
      Property = 0;
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__NEAgentFilterExtension_handleExtensionExit___block_invoke_41;
    v15[3] = &unk_1E3CC2F98;
    v15[4] = v9;
    v16 = *(id *)(a1 + 40);
    NECreateTimerSource(Property, 5, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    if (v12)
      objc_setProperty_atomic(v12, v10, v11, 128);

    return;
  }
  if ((v3[10] & 1) == 0)
  {
    if (objc_getProperty(v3, a2, 128, 1))
      return;
    goto LABEL_4;
  }
  ne_log_obj();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v18 = v14;
    _os_log_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEFAULT, "Filter App updating - ignore extension failure/exit for %@", buf, 0xCu);
  }

}

void __46__NEAgentFilterExtension_handleExtensionExit___block_invoke_41(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  NSObject *Property;
  const char *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (!v3)
    goto LABEL_9;
  if (objc_getProperty(v3, a2, 128, 1))
  {
    Property = *(NSObject **)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v4, 128, 1);
    dispatch_source_cancel(Property);
    v7 = *(void **)(a1 + 32);
    if (!v7)
      goto LABEL_9;
    objc_setProperty_atomic(v7, v6, 0, 128);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (!v8 || (*(_BYTE *)(v8 + 10) & 1) == 0)
  {
LABEL_9:
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "Handle Filter extension failure/exit for %@ - disconnect session", (uint8_t *)&v14, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      -[NEAgentFilterExtension sendFilterStatus:withError:](v10, 0, 1);
    return;
  }
  ne_log_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEFAULT, "Filter App updating - ignore extension failure/exit for %@", (uint8_t *)&v14, 0xCu);
  }

}

void __54__NEAgentFilterExtension_extension_didStartWithError___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  -[NEAgentFilterExtension handleStopCompleteWithError:]((uint64_t)WeakRetained, v3);

}

- (void)handleStopCompleteWithError:(uint64_t)a1
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    v4 = v3 != 0;
    v12 = v3;
    if (v3)
    {
      objc_msgSend(v3, "domain");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5
        && (v6 = (void *)v5,
            objc_msgSend(v12, "domain"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("NEAgentErrorDomain")),
            v7,
            v6,
            v8))
      {
        if (objc_msgSend(v12, "code") == 3)
        {
          v9 = 0;
          v10 = 4;
        }
        else
        {
          v11 = objc_msgSend(v12, "code");
          v10 = 0;
          if (v11 == 2)
            v9 = 2;
          else
            v9 = v4;
        }
      }
      else
      {
        v10 = 0;
        v9 = 1;
      }
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
    -[NEAgentFilterExtension sendFilterStatus:withError:](a1, v10, v9);
    v3 = v12;
  }

}

void __46__NEAgentFilterExtension_updateConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  void *v4;
  void *v5;
  _BYTE *v6;
  const char *v7;
  id v8;
  SEL v9;
  id v10;
  SEL v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 40), "contentFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v5)
    objc_setProperty_atomic(v5, v3, v4, 112);

  v6 = *(_BYTE **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  if (v6)
  {
    if ((v6[8] & 1) != 0)
    {
      v8 = objc_getProperty(v6, v7, 48, 1);
      objc_msgSend(v8, "setConfiguration:extensionIdentifier:", v12, objc_getProperty(v6, v9, 88, 1));

    }
    if ((v6[9] & 1) != 0)
    {
      v10 = objc_getProperty(v6, v7, 56, 1);
      objc_msgSend(v10, "setConfiguration:extensionIdentifier:", v12, objc_getProperty(v6, v11, 96, 1));

    }
  }

}

void __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  char v8;
  const char *v9;
  void *v10;
  id Property;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_INFO, "%@: Data Extension sleep event complete", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  if (!v5)
    goto LABEL_7;
  v6 = objc_getProperty(v5, v4, 40, 1);
  if (!v6)
    goto LABEL_7;
  v7 = *(_QWORD *)(a1 + 32);
  if (!v7)
  {

    goto LABEL_7;
  }
  v8 = *(_BYTE *)(v7 + 9);

  if ((v8 & 1) == 0)
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    Property = objc_getProperty(v10, v9, 56, 1);
    v12 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v12 = 0;
    Property = 0;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke_61;
  v13[3] = &unk_1E3CC46A8;
  v13[4] = v12;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(Property, "sleepWithCompletionHandler:", v13);

}

uint64_t __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke_61(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_INFO, "%@: Control Extension sleep event complete.", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __37__NEAgentFilterExtension_startFilter__block_invoke(uint64_t a1, const char *a2)
{
  _BYTE *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  _BYTE *v9;
  char v10;
  _BYTE *Property;
  void *v12;
  SEL v13;
  id v14;
  SEL v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v3 = *(_BYTE **)(a1 + 32);
  if (!v3 || (v3[8] & 1) == 0)
    goto LABEL_6;
  v4 = objc_getProperty(v3, a2, 40, 1);
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!v6)
    {

      goto LABEL_6;
    }
    v7 = *(_BYTE *)(v6 + 9);

    if ((v7 & 1) == 0)
    {
LABEL_6:
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17[0]) = 0;
        _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Data or Control Extension not initialized.", (uint8_t *)v17, 2u);
      }

      -[NEAgentFilterExtension sendFilterStatus:withError:](*(_QWORD *)(a1 + 32), 0, 1);
      return;
    }
  }
  v9 = *(_BYTE **)(a1 + 32);
  if (v9)
  {
    v10 = v9[9];
    Property = objc_getProperty(v9, v5, 112, 1);
    if (Property)
      Property[11] = v10 & 1;
    v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v14 = objc_getProperty(v12, v13, 48, 1);
      v16 = objc_getProperty(v12, v15, 112, 1);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __46__NEAgentFilterExtension_startFilterExtension__block_invoke;
      v17[3] = &unk_1E3CC3148;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v14, "startFilterWithOptions:completionHandler:", v16, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __46__NEAgentFilterExtension_startFilterExtension__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  -[NEAgentFilterExtension handleStopCompleteWithError:]((uint64_t)WeakRetained, v3);

}

void __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  _BYTE *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  _QWORD *v9;
  NSObject *Property;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[5];
  id v17;
  _QWORD *v18;

  v3 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (v3 && objc_getProperty(v3, a2, 40, 1))
    {
      v5 = *(void **)(a1 + 32);
      v4 = *(void **)(a1 + 40);
      v6 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke_60;
      v14[3] = &unk_1E3CC2F70;
      v14[4] = v5;
      v15 = *(id *)(a1 + 48);
      v7 = v4;
      v9 = v14;
      if (v5)
      {
        Property = objc_getProperty(v5, v8, 80, 1);
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke;
        block[3] = &unk_1E3CC3A30;
        block[4] = v5;
        v18 = v9;
        v17 = v7;
        dispatch_async(Property, block);

      }
    }
    else
    {
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(block[0]) = 0;
        _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEFAULT, "Control Extension not present", (uint8_t *)block, 2u);
      }

      v12 = *(_QWORD *)(a1 + 48);
      v13 = (void *)-[NEAgentFilterExtension copyProcessIdentities](*(void **)(a1 + 32));
      (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, 1, v13);

    }
  }
  else
  {
    -[NEAgentFilterExtension cleanupOnStartFailure](v3, a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke(id *a1, const char *a2)
{
  id v3;
  id Property;
  const char *v5;
  _WORD *v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  if (!v3)
    goto LABEL_16;
  Property = objc_getProperty(v3, a2, 48, 1);
  v6 = a1[4];
  if (Property)
  {
    if (v6)
    {
      v6 = objc_getProperty(a1[4], v5, 48, 1);
      v7 = a1[4];
    }
    else
    {
      v7 = 0;
    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2;
    v22[3] = &unk_1E3CC30D0;
    v22[4] = v7;
    v24 = a1[6];
    v23 = a1[5];
    objc_msgSend(v6, "createWithCompletionHandler:", v22);

    return;
  }
  if (v6)
  {
    objc_setProperty_atomic(a1[4], v5, 0, 104);
    v6[4] = 0;
    v8 = a1[4];
  }
  else
  {
LABEL_16:
    v8 = 0;
  }
  objc_initWeak(&location, v8);
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[4];
    if (v11)
      v11 = objc_getProperty(v11, v10, 32, 1);
    v12 = v11;
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v13;
    _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "Beginning data extension request with extension %@", buf, 0xCu);

  }
  v15 = a1[4];
  if (v15)
    v15 = objc_getProperty(v15, v14, 32, 1);
  v16 = v15;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_53;
  v17[3] = &unk_1E3CC3120;
  objc_copyWeak(&v20, &location);
  v19 = a1[6];
  v18 = a1[5];
  objc_msgSend(v16, "beginExtensionRequestWithInputItems:completion:", 0, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2(uint64_t a1, const char *a2)
{
  char v2;
  void *v4;
  NSObject *Property;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v2 = (char)a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    Property = objc_getProperty(v4, a2, 80, 1);
  else
    Property = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_3;
  v9[3] = &unk_1E3CC30A8;
  v12 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v11 = v6;
  v9[4] = v7;
  v10 = v8;
  dispatch_async(Property, v9);

}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_53(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  SEL v12;
  NSObject *Property;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v9)
    {
      objc_msgSend(objc_getProperty(WeakRetained, v10, 32, 1), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v11;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "Extension request with data extension %@ started with identifier %@", buf, 0x16u);

    }
    Property = objc_getProperty(WeakRetained, v12, 80, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_54;
    block[3] = &unk_1E3CC30F8;
    v15 = v6;
    v16 = WeakRetained;
    v19 = a1[5];
    v17 = v5;
    v18 = a1[4];
    dispatch_async(Property, block);

  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "strongself is nil after data extension request started", buf, 2u);
    }

    (*((void (**)(void))a1[5] + 2))();
  }

}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_54(uint64_t a1, const char *a2)
{
  NSObject *v3;
  const char *v4;
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id *v13;
  _BYTE *v14;
  NSObject *v15;
  const char *v16;
  id Property;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  _BYTE *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      Property = *(id *)(a1 + 40);
      if (Property)
        Property = objc_getProperty(Property, v4, 88, 1);
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v25 = Property;
      v26 = 2112;
      v27 = v18;
      _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Failed to start the data extension %@: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v5 = *(id *)(a1 + 40);
    if (v5)
      v5 = objc_getProperty(v5, a2, 32, 1);
    -[NSExtension extensionHostContextForUUID:](v5, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      if (v8)
      {
        objc_setProperty_atomic(v8, v6, *(id *)(a1 + 48), 64);
        v10 = *(void **)(a1 + 40);
        if (v10)
        {
          objc_setProperty_atomic(v10, v9, v7, 48);
          v12 = *(void **)(a1 + 40);
          if (v12)
          {
            v13 = (id *)objc_getProperty(*(id *)(a1 + 40), v11, 48, 1);
            if (v13)
              objc_storeWeak(v13 + 7, v12);
          }
        }
      }
      v14 = *(_BYTE **)(a1 + 40);
      if (v14)
      {
        v14[8] = 1;
        v14 = *(_BYTE **)(a1 + 40);
      }
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_55;
      v20[3] = &unk_1E3CC3080;
      v21 = v14;
      v22 = *(id *)(a1 + 56);
      v23 = *(id *)(a1 + 64);
      objc_msgSend(v7, "validateWithCompletionHandler:", v20);

    }
    else
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = *(id *)(a1 + 40);
        if (v19)
          v19 = objc_getProperty(v19, v16, 88, 1);
        *(_DWORD *)buf = 138412290;
        v25 = v19;
        _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Failed to get the host context for data extension %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_55(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  NSObject *Property;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    Property = objc_getProperty(v5, v3, 80, 1);
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v7 = 0;
    Property = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2_56;
  v9[3] = &unk_1E3CC3198;
  v10 = v4;
  v11 = v7;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v8 = v4;
  dispatch_async(Property, v9);

}

uint64_t __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2_56(_QWORD *a1, const char *a2)
{
  NSObject *v3;
  id Property;
  const char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v15 = a1[4];
      v16 = 138412290;
      v17 = v15;
      _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Filter Data provider validation failed with error: %@", (uint8_t *)&v16, 0xCu);
    }

    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    Property = (id)a1[5];
    if (Property)
      Property = objc_getProperty(Property, a2, 48, 1);
    v7 = Property;
    v8 = (void *)a1[5];
    v9 = a1[6];
    if (v8)
      v10 = objc_getProperty(v8, v6, 88, 1);
    else
      v10 = 0;
    objc_msgSend(v7, "setConfiguration:extensionIdentifier:", v9, v10);

    objc_msgSend((id)a1[6], "contentFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "provider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)a1[5];
    if (v14)
      objc_setProperty_atomic(v14, v12, v13, 112);

    return (*(uint64_t (**)(_QWORD, uint64_t))(a1[7] + 16))(a1[7], 1);
  }
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_3(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  id Property;
  _QWORD v6[5];
  id v7;
  id v8;

  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      *(_BYTE *)(v3 + 8) = 1;
      v4 = *(void **)(a1 + 32);
      if (v4)
      {
        Property = objc_getProperty(v4, a2, 48, 1);
        v3 = *(_QWORD *)(a1 + 32);
LABEL_5:
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_4;
        v6[3] = &unk_1E3CC3080;
        v6[4] = v3;
        v7 = *(id *)(a1 + 40);
        v8 = *(id *)(a1 + 48);
        objc_msgSend(Property, "validateWithCompletionHandler:", v6);

        return;
      }
      v3 = 0;
    }
    Property = 0;
    goto LABEL_5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  NSObject *Property;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    Property = objc_getProperty(v5, v3, 80, 1);
    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = 0;
    Property = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_5;
  v9[3] = &unk_1E3CC3198;
  v10 = v4;
  v11 = v7;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v8 = v4;
  dispatch_async(Property, v9);

}

uint64_t __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_5(_QWORD *a1, const char *a2)
{
  NSObject *v3;
  id Property;
  const char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v15 = a1[4];
      v16 = 138412290;
      v17 = v15;
      _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Filter provider validation failed: %@", (uint8_t *)&v16, 0xCu);
    }

    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    Property = (id)a1[5];
    if (Property)
      Property = objc_getProperty(Property, a2, 48, 1);
    v7 = Property;
    v8 = (void *)a1[5];
    v9 = a1[6];
    if (v8)
      v10 = objc_getProperty(v8, v6, 88, 1);
    else
      v10 = 0;
    objc_msgSend(v7, "setConfiguration:extensionIdentifier:", v9, v10);

    objc_msgSend((id)a1[6], "contentFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "provider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)a1[5];
    if (v14)
      objc_setProperty_atomic(v14, v12, v13, 112);

    return (*(uint64_t (**)(_QWORD, uint64_t))(a1[7] + 16))(a1[7], 1);
  }
}

- (void)cleanupOnStartFailure
{
  const char *v3;
  id v4;
  SEL v5;
  const char *v6;
  id v7;
  SEL v8;
  SEL v9;
  SEL v10;
  SEL v11;

  if (a1)
  {
    if (objc_getProperty(a1, a2, 64, 1))
    {
      v4 = objc_getProperty(a1, v3, 32, 1);
      objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", objc_getProperty(a1, v5, 64, 1));

    }
    if (objc_getProperty(a1, v3, 72, 1))
    {
      v7 = objc_getProperty(a1, v6, 40, 1);
      objc_msgSend(v7, "cancelExtensionRequestWithIdentifier:", objc_getProperty(a1, v8, 72, 1));

    }
    objc_setProperty_atomic(a1, v6, 0, 48);
    objc_setProperty_atomic(a1, v9, 0, 64);
    a1[8] = 0;
    objc_setProperty_atomic(a1, v10, 0, 56);
    objc_setProperty_atomic(a1, v11, 0, 72);
    a1[9] = 0;
  }
}

- (uint64_t)copyProcessIdentities
{
  id v2;
  SEL v3;
  const char *v4;
  id Property;
  const char *v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t v16[16];
  uint8_t buf[16];

  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_getProperty(a1, v3, 56, 1))
  {
    Property = objc_getProperty(a1, v4, 56, 1);
    if (Property)
      Property = objc_getProperty(Property, v6, 64, 1);
    v7 = Property;
  }
  else
  {
    v7 = 0;
  }
  if (!objc_getProperty(a1, v4, 48, 1))
  {
    v11 = 0;
    if (v7)
      goto LABEL_11;
LABEL_14:
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEFAULT, "No control extension process identity is available", buf, 2u);
    }

    if (v11)
      goto LABEL_12;
LABEL_17:
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "No data extension process identity is available", v16, 2u);
    }

    goto LABEL_20;
  }
  v9 = objc_getProperty(a1, v8, 48, 1);
  if (v9)
    v9 = objc_getProperty(v9, v10, 64, 1);
  v11 = v9;
  if (!v7)
    goto LABEL_14;
LABEL_11:
  objc_msgSend(v2, "addObject:", v7);
  if (!v11)
    goto LABEL_17;
LABEL_12:
  objc_msgSend(v2, "addObject:", v11);
LABEL_20:
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v2);

  return v14;
}

void __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke_60(uint64_t a1, const char *a2)
{
  uint64_t v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = (id)-[NEAgentFilterExtension copyProcessIdentities](*(void **)(a1 + 32));
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, 1, v4);

  }
  else
  {
    -[NEAgentFilterExtension cleanupOnStartFailure](*(_BYTE **)(a1 + 32), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke(id *a1)
{
  NSObject *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  const char *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, a1[4]);
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    Property = a1[4];
    if (Property)
      Property = objc_getProperty(Property, v3, 40, 1);
    v5 = Property;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "Beginning control extension request with extension %@", buf, 0xCu);

  }
  v8 = a1[4];
  if (v8)
    v8 = objc_getProperty(v8, v7, 40, 1);
  v9 = v8;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_57;
  v10[3] = &unk_1E3CC3120;
  objc_copyWeak(&v13, &location);
  v12 = a1[6];
  v11 = a1[5];
  objc_msgSend(v9, "beginExtensionRequestWithInputItems:completion:", 0, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_57(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  SEL v12;
  NSObject *Property;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v9)
    {
      objc_msgSend(objc_getProperty(WeakRetained, v10, 40, 1), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v11;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "Extension request with control extension %@ started with identifier %@", buf, 0x16u);

    }
    Property = objc_getProperty(WeakRetained, v12, 80, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_58;
    block[3] = &unk_1E3CC30F8;
    v15 = v6;
    v16 = WeakRetained;
    v19 = a1[5];
    v17 = v5;
    v18 = a1[4];
    dispatch_async(Property, block);

  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "strongself is nil after control extension request started", buf, 2u);
    }

    (*((void (**)(void))a1[5] + 2))();
  }

}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_58(uint64_t a1, const char *a2)
{
  NSObject *v3;
  const char *v4;
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id *v13;
  _BYTE *v14;
  NSObject *v15;
  const char *v16;
  id Property;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  _BYTE *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      Property = *(id *)(a1 + 40);
      if (Property)
        Property = objc_getProperty(Property, v4, 96, 1);
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v25 = Property;
      v26 = 2112;
      v27 = v18;
      _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Failed to start control extension %@: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v5 = *(id *)(a1 + 40);
    if (v5)
      v5 = objc_getProperty(v5, a2, 40, 1);
    -[NSExtension extensionHostContextForUUID:](v5, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      if (v8)
      {
        objc_setProperty_atomic(v8, v6, *(id *)(a1 + 48), 72);
        v10 = *(void **)(a1 + 40);
        if (v10)
        {
          objc_setProperty_atomic(v10, v9, v7, 56);
          v12 = *(void **)(a1 + 40);
          if (v12)
          {
            v13 = (id *)objc_getProperty(*(id *)(a1 + 40), v11, 56, 1);
            if (v13)
              objc_storeWeak(v13 + 7, v12);
          }
        }
      }
      v14 = *(_BYTE **)(a1 + 40);
      if (v14)
      {
        v14[9] = 1;
        v14 = *(_BYTE **)(a1 + 40);
      }
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_59;
      v20[3] = &unk_1E3CC3080;
      v21 = v14;
      v22 = *(id *)(a1 + 56);
      v23 = *(id *)(a1 + 64);
      objc_msgSend(v7, "validateWithCompletionHandler:", v20);

    }
    else
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = *(id *)(a1 + 40);
        if (v19)
          v19 = objc_getProperty(v19, v16, 96, 1);
        *(_DWORD *)buf = 138412290;
        v25 = v19;
        _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Failed to get the host context for control extension %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_59(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  NSObject *v5;
  void (*v6)(void);
  id Property;
  const char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Filter Control validation failed with error: %@", (uint8_t *)&v13, 0xCu);
    }

    v6 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    Property = (id)a1[4];
    if (Property)
      Property = objc_getProperty(Property, v3, 56, 1);
    v9 = Property;
    v10 = (void *)a1[4];
    v11 = a1[5];
    if (v10)
      v12 = objc_getProperty(v10, v8, 96, 1);
    else
      v12 = 0;
    objc_msgSend(v9, "setConfiguration:extensionIdentifier:", v11, v12);

    v6 = *(void (**)(void))(a1[6] + 16);
  }
  v6();

}

void __41__NEAgentFilterExtension_driverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE423900);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)driverInterface_driverInterface_18222;
  driverInterface_driverInterface_18222 = v0;

}

void __42__NEAgentFilterExtension_managerInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE42B4D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)managerInterface_managerInterface_18226;
  managerInterface_managerInterface_18226 = v0;

}

void __47__NEAgentFilterExtension_handleAppsUpdateEnds___block_invoke(uint64_t a1, const char *a2)
{
  id v2;
  _BYTE *v4;
  const char *v5;
  id v6;
  id Property;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  id v21;
  const char *v22;
  id v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = *(_BYTE **)(a1 + 32);
  if (!v4 || (v4[11] & 1) == 0)
    return;
  v6 = objc_getProperty(v4, a2, 88, 1);
  if (!v6)
    goto LABEL_8;
  Property = *(id *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  if (Property)
    Property = objc_getProperty(Property, v5, 88, 1);
  v2 = Property;
  if (!objc_msgSend(v8, "containsObject:", v2))
  {
LABEL_8:
    v9 = *(void **)(a1 + 32);
    if (v9 && (v10 = objc_getProperty(v9, v5, 96, 1)) != 0)
    {
      v12 = v10;
      v13 = *(void **)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      if (v13)
        v15 = objc_getProperty(v13, v11, 96, 1);
      else
        v15 = 0;
      v16 = objc_msgSend(v14, "containsObject:", v15);

      if (v6)
      {
LABEL_13:

        if ((v16 & 1) == 0)
          return;
        goto LABEL_17;
      }
    }
    else
    {
      v16 = 0;
      if (v6)
        goto LABEL_13;
    }
    if (!v16)
      return;
    goto LABEL_17;
  }

LABEL_17:
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
  {
    *(_BYTE *)(v17 + 10) = 0;
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      *(_BYTE *)(v18 + 11) = 0;
  }
  ne_log_obj();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(id *)(a1 + 32);
    if (v21)
    {
      v23 = objc_getProperty(v21, v20, 88, 1);
      v21 = *(id *)(a1 + 32);
      if (v21)
        v21 = objc_getProperty(v21, v22, 96, 1);
    }
    else
    {
      v23 = 0;
    }
    v24 = 138412546;
    v25 = v23;
    v26 = 2112;
    v27 = v21;
    _os_log_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEFAULT, "Extensions %@ and %@ have been updated, idling", (uint8_t *)&v24, 0x16u);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(_QWORD *)(a1 + 32), 0, 0);
}

void __49__NEAgentFilterExtension_handleAppsUpdateEnding___block_invoke(uint64_t a1, const char *a2)
{
  id v2;
  _BYTE *v4;
  const char *v5;
  id v6;
  id Property;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;

  v4 = *(_BYTE **)(a1 + 32);
  if (v4 && (v4[10] & 1) != 0 && (v4[11] & 1) == 0)
  {
    v6 = objc_getProperty(v4, a2, 88, 1);
    if (v6)
    {
      Property = *(id *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      if (Property)
        Property = objc_getProperty(Property, v5, 88, 1);
      v2 = Property;
      if (objc_msgSend(v8, "containsObject:", v2))
      {

LABEL_18:
        v17 = *(_QWORD *)(a1 + 32);
        if (v17)
          *(_BYTE *)(v17 + 11) = 1;
        return;
      }
    }
    v9 = *(void **)(a1 + 32);
    if (v9 && (v10 = objc_getProperty(v9, v5, 96, 1)) != 0)
    {
      v12 = v10;
      v13 = *(void **)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      if (v13)
        v15 = objc_getProperty(v13, v11, 96, 1);
      else
        v15 = 0;
      v16 = objc_msgSend(v14, "containsObject:", v15);

      if (v6)
      {
LABEL_14:

        if ((v16 & 1) == 0)
          return;
        goto LABEL_18;
      }
    }
    else
    {
      v16 = 0;
      if (v6)
        goto LABEL_14;
    }
    if (!v16)
      return;
    goto LABEL_18;
  }
}

void __49__NEAgentFilterExtension_handleAppsUpdateBegins___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  NSObject *Property;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  id v13;
  const char *v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if ((*(_BYTE *)(v2 + 10) & 1) != 0)
      return;
    v3 = *(_QWORD *)(v2 + 24);
  }
  else
  {
    v3 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      *(_BYTE *)(v5 + 10) = 1;
      v6 = *(void **)(a1 + 32);
      if (v6)
      {
        if (objc_getProperty(v6, v4, 128, 1))
        {
          Property = *(NSObject **)(a1 + 32);
          if (Property)
            Property = objc_getProperty(Property, v7, 128, 1);
          dispatch_source_cancel(Property);
          v10 = *(void **)(a1 + 32);
          if (v10)
            objc_setProperty_atomic(v10, v9, 0, 128);
        }
      }
    }
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(id *)(a1 + 32);
      if (v13)
      {
        v15 = objc_getProperty(v13, v12, 88, 1);
        v13 = *(id *)(a1 + 32);
        if (v13)
          v13 = objc_getProperty(v13, v14, 96, 1);
      }
      else
      {
        v15 = 0;
      }
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEFAULT, "Extensions %@ and %@ are being updated, stopping", (uint8_t *)&v16, 0x16u);
    }

    -[NEAgentFilterExtension sendFilterStatus:withError:](*(_QWORD *)(a1 + 32), 4, 0);
    -[NEAgentFilterExtension stopFilterExtensionWithReason:](*(_BYTE **)(a1 + 32), 40);
  }
}

- (void)stopFilterExtensionWithReason:(_BYTE *)a1
{
  NSObject *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = ne_session_stop_reason_to_string();
      _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEFAULT, "Stopping filter with reason %s", (uint8_t *)&v6, 0xCu);
    }

    if ((a1[8] & 1) != 0)
      objc_msgSend(objc_getProperty(a1, v5, 48, 1), "stopWithReason:", a2);
    if ((a1[9] & 1) != 0)
      objc_msgSend(objc_getProperty(a1, v5, 56, 1), "stopWithReason:", a2);
    objc_setProperty_atomic(a1, v5, 0, 104);
    *((_WORD *)a1 + 4) = 0;
  }
}

uint64_t __61__NEAgentFilterExtension_handleDisposeWithCompletionHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  id v4;
  const char *v5;
  const char *v6;
  void *v7;
  void *v8;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = objc_getProperty(v3, a2, 48, 1);
    if (v4)
    {

      goto LABEL_6;
    }
    v7 = *(void **)(a1 + 32);
    if (v7 && objc_getProperty(v7, v5, 56, 1))
    {
LABEL_6:
      v8 = *(void **)(a1 + 32);
      if (v8)
      {
        objc_setProperty_atomic_copy(v8, v6, *(id *)(a1 + 40), 144);
        v8 = *(void **)(a1 + 32);
      }
      return objc_msgSend(v8, "handleCancel");
    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke(uint64_t a1, const char *a2)
{
  char v2;
  void *v4;
  NSObject *Property;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v2 = (char)a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    Property = objc_getProperty(v4, a2, 80, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E3CC2F48;
  v9 = v2;
  v6 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  dispatch_async(Property, block);

}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  id Property;
  void *v12;
  SEL v13;
  uint64_t v14;
  SEL v15;
  id v16;
  SEL v17;
  id v18;
  SEL v19;
  id v20;
  NSObject *v21;
  const char *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v5, "count");
    if (WeakRetained)
      Property = objc_getProperty(WeakRetained, v9, 88, 1);
    else
      Property = 0;
    *(_DWORD *)buf = 134218242;
    v31 = (const __CFString *)v10;
    v32 = 2112;
    v33 = Property;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu data extension(s) with identifier %@", buf, 0x16u);
  }

  if (v5 && !v6 && objc_msgSend(v5, "count") && WeakRetained)
  {
    objc_initWeak((id *)buf, WeakRetained);
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(WeakRetained, v13, v12, 32);

    v14 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_44;
    v28[3] = &unk_1E3CC2FE0;
    objc_copyWeak(&v29, (id *)buf);
    v16 = objc_getProperty(WeakRetained, v15, 32, 1);
    objc_msgSend(v16, "setRequestInterruptionBlock:", v28);

    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_46;
    v26[3] = &unk_1E3CC3008;
    objc_copyWeak(&v27, (id *)buf);
    v18 = objc_getProperty(WeakRetained, v17, 32, 1);
    objc_msgSend(v18, "setRequestCompletionBlock:", v26);

    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_2;
    v24[3] = &unk_1E3CC3030;
    objc_copyWeak(&v25, (id *)buf);
    v20 = objc_getProperty(WeakRetained, v19, 32, 1);
    objc_msgSend(v20, "setRequestCancellationBlock:", v24);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      if (WeakRetained)
        v23 = objc_getProperty(WeakRetained, v22, 88, 1);
      else
        v23 = 0;
      *(_DWORD *)buf = 138412802;
      v31 = CFSTR("com.apple.networkextension.filter-data");
      v32 = 2112;
      v33 = v23;
      v34 = 2112;
      v35 = v6;
      _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "Failed to create a %@ extension with identifier %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  const char *v6;
  const char *v7;
  id v8;
  id Property;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained)
      Property = objc_getProperty(WeakRetained, v6, 88, 1);
    else
      Property = 0;
    v10 = 138412290;
    v11 = Property;
    _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Extension %@ died unexpectedly", (uint8_t *)&v10, 0xCu);
  }

  if (WeakRetained)
    v8 = objc_getProperty(WeakRetained, v7, 64, 1);
  else
    v8 = 0;
  if (objc_msgSend(v3, "isEqual:", v8))
  {
    -[NEAgentFilterExtension handleExtensionExit:](WeakRetained, v3);
    -[NEAgentFilterExtension cleanupDataExtensionWithRequestIdentifier:](WeakRetained, v3);
  }

}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_46(uint64_t a1, void *a2)
{
  id WeakRetained;
  const char *v4;
  void *v5;
  id Property;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    Property = objc_getProperty(WeakRetained, v4, 64, 1);
  else
    Property = 0;
  if (objc_msgSend(v7, "isEqual:", Property))
    -[NEAgentFilterExtension cleanupDataExtensionWithRequestIdentifier:](v5, v7);

}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  const char *v4;
  void *v5;
  id Property;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    Property = objc_getProperty(WeakRetained, v4, 64, 1);
  else
    Property = 0;
  if (objc_msgSend(v7, "isEqual:", Property))
    -[NEAgentFilterExtension cleanupDataExtensionWithRequestIdentifier:](v5, v7);

}

- (void)cleanupDataExtensionWithRequestIdentifier:(void *)a1
{
  const char *v3;
  id v4;
  NSObject *Property;
  _QWORD v6[5];
  id v7;

  v4 = a2;
  if (a1)
  {
    Property = objc_getProperty(a1, v3, 80, 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__NEAgentFilterExtension_cleanupDataExtensionWithRequestIdentifier___block_invoke;
    v6[3] = &unk_1E3CC2F98;
    v6[4] = a1;
    v7 = v4;
    dispatch_async(Property, v6);

  }
}

uint64_t __68__NEAgentFilterExtension_cleanupDataExtensionWithRequestIdentifier___block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  const char *v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;

  Property = *(id *)(a1 + 32);
  if (Property)
  {
    objc_setProperty_atomic(Property, a2, 0, 64);
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v4, 32, 1);
  }
  objc_msgSend(Property, "setRequestInterruptionBlock:", 0);
  v6 = *(id *)(a1 + 32);
  if (v6)
    v6 = objc_getProperty(v6, v5, 32, 1);
  objc_msgSend(v6, "setRequestCancellationBlock:", 0);
  v8 = *(id *)(a1 + 32);
  if (v8)
    v8 = objc_getProperty(v8, v7, 32, 1);
  objc_msgSend(v8, "setRequestCompletionBlock:", 0);
  v10 = *(id *)(a1 + 32);
  if (v10)
    v10 = objc_getProperty(v10, v9, 32, 1);
  objc_msgSend(v10, "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(a1 + 40));
  v12 = *(void **)(a1 + 32);
  if (v12)
    v13 = objc_getProperty(v12, v11, 48, 1);
  else
    v13 = 0;
  return objc_msgSend(v12, "extensionDidStop:", v13);
}

void __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  const char *v3;
  uint64_t *v4;
  id Property;
  SEL v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  id v11;
  void *v12;
  NSObject *v13;
  SEL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  __int128 buf;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  uint64_t *v24;
  id v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v1 = MEMORY[0x1E0C809B0];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_3;
    v18 = &unk_1E3CC2F20;
    v2 = *(void **)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    v4 = &v15;
    if (v2)
    {
      Property = objc_getProperty(v2, v3, 96, 1);
      if (objc_msgSend(Property, "length", v15, v16))
      {
        objc_initWeak(&location, v2);
        v26[0] = *MEMORY[0x1E0CB2A08];
        v7 = objc_getProperty(v2, v6, 96, 1);
        v26[1] = *MEMORY[0x1E0CB2A28];
        v27[0] = v7;
        v27[1] = CFSTR("com.apple.networkextension.filter-control");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ne_log_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_getProperty(v2, v10, 96, 1);
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "Looking for a control extension with identifier %@", (uint8_t *)&buf, 0xCu);
        }

        v12 = (void *)MEMORY[0x1E0CB35D8];
        *(_QWORD *)&buf = v1;
        *((_QWORD *)&buf + 1) = 3221225472;
        v22 = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke;
        v23 = &unk_1E3CC3058;
        objc_copyWeak(v25, &location);
        v24 = v4;
        objc_msgSend(v12, "extensionsWithMatchingAttributes:completion:", v8, &buf);

        objc_destroyWeak(v25);
        objc_destroyWeak(&location);
      }
      else
      {
        ne_log_obj();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "Control Extension not found", (uint8_t *)&buf, 2u);
        }

        objc_setProperty_atomic(v2, v14, 0, 40);
        ((void (*)(uint64_t *, uint64_t))v17)(v4, 1);
      }
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

uint64_t __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  id Property;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  id v16;
  id v17;
  const char *v18;
  id v19;
  id v20;
  const char *v21;
  id v22;
  id v23;
  NSObject *v24;
  const char *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v5, "count");
    if (WeakRetained)
      Property = objc_getProperty(WeakRetained, v9, 96, 1);
    else
      Property = 0;
    *(_DWORD *)buf = 134218242;
    v34 = (const __CFString *)v10;
    v35 = 2112;
    v36 = Property;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu control extension(s) with identifier %@", buf, 0x16u);
  }

  if (v5 && !v6 && objc_msgSend(v5, "count"))
  {
    objc_initWeak((id *)buf, WeakRetained);
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
      objc_setProperty_atomic(WeakRetained, v12, v13, 40);

    v14 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_50;
    v31[3] = &unk_1E3CC2FE0;
    objc_copyWeak(&v32, (id *)buf);
    if (WeakRetained)
      v16 = objc_getProperty(WeakRetained, v15, 40, 1);
    else
      v16 = 0;
    v17 = v16;
    objc_msgSend(v17, "setRequestInterruptionBlock:", v31);

    v29[0] = v14;
    v29[1] = 3221225472;
    v29[2] = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_51;
    v29[3] = &unk_1E3CC3008;
    objc_copyWeak(&v30, (id *)buf);
    if (WeakRetained)
      v19 = objc_getProperty(WeakRetained, v18, 40, 1);
    else
      v19 = 0;
    v20 = v19;
    objc_msgSend(v20, "setRequestCompletionBlock:", v29);

    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_2;
    v27[3] = &unk_1E3CC3030;
    objc_copyWeak(&v28, (id *)buf);
    if (WeakRetained)
      v22 = objc_getProperty(WeakRetained, v21, 40, 1);
    else
      v22 = 0;
    v23 = v22;
    objc_msgSend(v23, "setRequestCancellationBlock:", v27);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      if (WeakRetained)
        v26 = objc_getProperty(WeakRetained, v25, 96, 1);
      else
        v26 = 0;
      *(_DWORD *)buf = 138412802;
      v34 = CFSTR("com.apple.networkextension.filter-control");
      v35 = 2112;
      v36 = v26;
      v37 = 2112;
      v38 = v6;
      _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "Failed to create a %@ extension with identifier %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  const char *v6;
  const char *v7;
  id v8;
  id Property;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained)
      Property = objc_getProperty(WeakRetained, v6, 96, 1);
    else
      Property = 0;
    v10 = 138412290;
    v11 = Property;
    _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Extension %@ died unexpectedly", (uint8_t *)&v10, 0xCu);
  }

  if (WeakRetained)
    v8 = objc_getProperty(WeakRetained, v7, 72, 1);
  else
    v8 = 0;
  if (objc_msgSend(v3, "isEqual:", v8))
  {
    -[NEAgentFilterExtension handleExtensionExit:](WeakRetained, v3);
    -[NEAgentFilterExtension cleanupControlExtensionWithRequestIdentifier:](WeakRetained, v3);
  }

}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_51(uint64_t a1, void *a2)
{
  id WeakRetained;
  const char *v4;
  void *v5;
  id Property;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    Property = objc_getProperty(WeakRetained, v4, 72, 1);
  else
    Property = 0;
  if (objc_msgSend(v7, "isEqual:", Property))
    -[NEAgentFilterExtension cleanupControlExtensionWithRequestIdentifier:](v5, v7);

}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  const char *v4;
  void *v5;
  id Property;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    Property = objc_getProperty(WeakRetained, v4, 72, 1);
  else
    Property = 0;
  if (objc_msgSend(v7, "isEqual:", Property))
    -[NEAgentFilterExtension cleanupControlExtensionWithRequestIdentifier:](v5, v7);

}

- (void)cleanupControlExtensionWithRequestIdentifier:(void *)a1
{
  const char *v3;
  id v4;
  NSObject *Property;
  _QWORD v6[5];
  id v7;

  v4 = a2;
  if (a1)
  {
    Property = objc_getProperty(a1, v3, 80, 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__NEAgentFilterExtension_cleanupControlExtensionWithRequestIdentifier___block_invoke;
    v6[3] = &unk_1E3CC2F98;
    v6[4] = a1;
    v7 = v4;
    dispatch_async(Property, v6);

  }
}

uint64_t __71__NEAgentFilterExtension_cleanupControlExtensionWithRequestIdentifier___block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  const char *v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;

  Property = *(id *)(a1 + 32);
  if (Property)
  {
    objc_setProperty_atomic(Property, a2, 0, 72);
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v4, 40, 1);
  }
  objc_msgSend(Property, "setRequestInterruptionBlock:", 0);
  v6 = *(id *)(a1 + 32);
  if (v6)
    v6 = objc_getProperty(v6, v5, 40, 1);
  objc_msgSend(v6, "setRequestCancellationBlock:", 0);
  v8 = *(id *)(a1 + 32);
  if (v8)
    v8 = objc_getProperty(v8, v7, 40, 1);
  objc_msgSend(v8, "setRequestCompletionBlock:", 0);
  v10 = *(id *)(a1 + 32);
  if (v10)
    v10 = objc_getProperty(v10, v9, 40, 1);
  objc_msgSend(v10, "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(a1 + 40));
  v12 = *(void **)(a1 + 32);
  if (v12)
    v13 = objc_getProperty(v12, v11, 56, 1);
  else
    v13 = 0;
  return objc_msgSend(v12, "extensionDidStop:", v13);
}

+ (BOOL)authenticateFlowWithState:(cfil_crypto_state *)a3 crypto_key:(id)a4 flow:(id)a5 salt:(unsigned int)a6 isKernelSocket:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  _BYTE *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  id Property;
  id v19;
  const char *v20;
  id v21;
  id v22;
  int v23;
  NSObject *v24;
  char v25;
  _BOOL4 v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _BYTE *v36;
  const char *v37;
  _QWORD *v38;
  id v39;
  int v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  const sockaddr *address;
  int sa_family;
  sockaddr v46;
  void *v47;
  NSObject *v48;
  const sockaddr *v49;
  int v50;
  sockaddr v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  const char *v57;
  void *v58;
  void *v59;
  int v60;
  int v61;
  const char *v62;
  const char *v63;
  id v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  unsigned int v84;
  const char *v85;
  const char *v86;
  _BOOL4 v87;
  const char *v88;
  const char *v89;
  uint8_t v90[4];
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  unsigned int v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  void *v109;
  uint8_t buf[16];
  _OWORD v111[5];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;

  v7 = a7;
  v115 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    v12 = objc_retainAutorelease(v10);
    if (objc_msgSend(v12, "bytes"))
    {
      if (objc_msgSend(v12, "length") == 32)
      {
        objc_msgSend(v11, "crypto_signature");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v11, "crypto_signature");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");

          if (v16)
          {
            v113 = 0u;
            v114 = 0u;
            v112 = 0u;
            memset(v111, 0, sizeof(v111));
            *(_OWORD *)buf = 0u;
            if (v11)
              Property = objc_getProperty(v11, v17, 120, 1);
            else
              Property = 0;
            v19 = Property;

            if (v19)
            {
              if (v11)
                v21 = objc_getProperty(v11, v20, 120, 1);
              else
                v21 = 0;
              v22 = v21;
              objc_msgSend(v22, "getUUIDBytes:", buf);

            }
            DWORD2(v111[0]) = objc_msgSend(v11, "direction") != 1;
            DWORD2(v111[4]) = objc_msgSend(v11, "pid");
            if (objc_msgSend(v11, "epid"))
              v23 = objc_msgSend(v11, "epid");
            else
              v23 = objc_msgSend(v11, "pid");
            HIDWORD(v111[4]) = v23;
            *(_QWORD *)&v114 = objc_msgSend(v11, "inBytes");
            *((_QWORD *)&v114 + 1) = objc_msgSend(v11, "outBytes");
            if (objc_msgSend(v11, "inBytes"))
              v27 = 1;
            else
              v27 = objc_msgSend(v11, "outBytes") != 0;
            v87 = v27;
            if (v11)
            {
              if ((v11[13] & 1) != 0)
              {
                objc_msgSend(v11, "sourceAppIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  objc_msgSend(v11, "sourceAppIdentifier");
                  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v29, "UTF8String");

                  objc_msgSend(v11, "sourceAppIdentifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "length");

                }
              }
            }
            v84 = a6;
            objc_msgSend(v11, "URL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              objc_msgSend(v11, "URL");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "absoluteString");
              v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v33, "UTF8String");

              objc_msgSend(v11, "URL");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "absoluteString");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "length");

            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v40 = 0;
              v86 = "";
              v85 = "Browser";
              goto LABEL_60;
            }
            v36 = v11;
            v38 = v36;
            if (v11)
            {
              v39 = objc_getProperty(v36, v37, 120, 1);
              if (v39)
              {

LABEL_36:
                objc_msgSend(v38, "remoteFlowEndpoint");
                v42 = (void *)objc_claimAutoreleasedReturnValue();

                if (v42)
                {
                  objc_msgSend(v38, "remoteFlowEndpoint");
                  v43 = objc_claimAutoreleasedReturnValue();
                  address = nw_endpoint_get_address(v43);

                  if (address)
                  {
                    sa_family = address->sa_family;
                    if (sa_family == 30)
                    {
                      v46 = *address;
                      *(sockaddr *)((char *)&v111[1] + 8) = *(sockaddr *)&address->sa_data[10];
                      goto LABEL_42;
                    }
                    if (sa_family == 2)
                    {
                      v46 = *address;
LABEL_42:
                      *(sockaddr *)((char *)v111 + 12) = v46;
                    }
                  }
                }
                objc_msgSend(v38, "localFlowEndpoint");
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v47)
                  goto LABEL_50;
                objc_msgSend(v38, "localFlowEndpoint");
                v48 = objc_claimAutoreleasedReturnValue();
                v49 = nw_endpoint_get_address(v48);

                if (!v49)
                  goto LABEL_50;
                v50 = v49->sa_family;
                if (v50 == 30)
                {
                  v51 = *v49;
                  *(sockaddr *)((char *)&v111[3] + 4) = *(sockaddr *)&v49->sa_data[10];
                }
                else
                {
                  if (v50 != 2)
                    goto LABEL_50;
                  v51 = *v49;
                }
                *(sockaddr *)((char *)&v111[2] + 8) = v51;
LABEL_50:
                objc_msgSend(v38, "remoteHostname");
                v52 = objc_claimAutoreleasedReturnValue();
                if (v52
                  && (v53 = (void *)v52,
                      objc_msgSend(v38, "remoteHostname"),
                      v54 = (void *)objc_claimAutoreleasedReturnValue(),
                      v55 = objc_msgSend(v54, "length"),
                      v54,
                      v53,
                      v55))
                {
                  objc_msgSend(v38, "remoteHostname");
                  v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v57 = (const char *)objc_msgSend(v56, "UTF8String");

                  v83 = strlen(v57);
                }
                else
                {
                  v83 = 0;
                }
                DWORD1(v111[4]) = objc_msgSend(v38, "socketProtocol");
                objc_msgSend(v38, "uuid");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "getUUIDBytes:", &v112);

                objc_msgSend(v38, "euuid");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "getUUIDBytes:", &v113);

                v60 = objc_msgSend(v38, "socketProtocol");
                v61 = objc_msgSend(v38, "socketFamily");

                if (v61 == 2)
                  v62 = "v4";
                else
                  v62 = "v6";
                v63 = "UDP";
                if (v60 == 6)
                  v63 = "TCP";
                v85 = v63;
                v86 = v62;
                v40 = v83;
LABEL_60:
                objc_msgSend(objc_retainAutorelease(v12), "bytes");
                objc_msgSend(v11, "crypto_signature");
                v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v65 = objc_msgSend(v64, "bytes");
                objc_msgSend(v11, "crypto_signature");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v82) = objc_msgSend(v66, "length");
                LODWORD(v81) = v40;
                v25 = ne_filter_crypto_validate_data();

                ne_log_obj();
                v67 = objc_claimAutoreleasedReturnValue();
                v68 = v67;
                if ((v25 & 1) != 0)
                {
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                  {
                    if (v7)
                      v69 = "Kernel ";
                    else
                      v69 = "";
                    v70 = "New";
                    if (v87)
                      v70 = "Closed";
                    v88 = v70;
                    if (objc_msgSend(v11, "direction", v81, v65, v82) == 1)
                    {
                      v71 = "IN";
                    }
                    else if (objc_msgSend(v11, "direction") == 2)
                    {
                      v71 = "OUT";
                    }
                    else
                    {
                      v71 = "ANY";
                    }
                    objc_msgSend(v11, "crypto_signature");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v76 = objc_msgSend(v11, "inBytes");
                    v77 = objc_msgSend(v11, "outBytes");
                    objc_msgSend(v11, "sourceAppIdentifier");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v90 = 136317442;
                    v91 = v69;
                    v92 = 2080;
                    v93 = v88;
                    v94 = 2080;
                    v95 = v85;
                    v96 = 2080;
                    v97 = v86;
                    v98 = 2080;
                    v99 = v71;
                    v100 = 1024;
                    v101 = v84;
                    v102 = 2112;
                    v103 = v75;
                    v104 = 2048;
                    v105 = v76;
                    v106 = 2048;
                    v107 = v77;
                    v108 = 2112;
                    v109 = v78;
                    _os_log_debug_impl(&dword_19BD16000, v68, OS_LOG_TYPE_DEBUG, "Signature validation (%s%s - %s %s %s) succeeded for salt %d with signature %@ (inBytes %llu outBytes %llu) (app %@)", v90, 0x62u);
LABEL_86:

                  }
                }
                else if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                {
                  if (v7)
                    v72 = "Kernel ";
                  else
                    v72 = "";
                  v73 = "New";
                  if (v87)
                    v73 = "Closed";
                  v89 = v73;
                  if (objc_msgSend(v11, "direction", v81, v65, v82) == 1)
                  {
                    v74 = "IN";
                  }
                  else if (objc_msgSend(v11, "direction") == 2)
                  {
                    v74 = "OUT";
                  }
                  else
                  {
                    v74 = "ANY";
                  }
                  objc_msgSend(v11, "crypto_signature");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = objc_msgSend(v11, "inBytes");
                  v80 = objc_msgSend(v11, "outBytes");
                  objc_msgSend(v11, "sourceAppIdentifier");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v90 = 136317442;
                  v91 = v72;
                  v92 = 2080;
                  v93 = v89;
                  v94 = 2080;
                  v95 = v85;
                  v96 = 2080;
                  v97 = v86;
                  v98 = 2080;
                  v99 = v74;
                  v100 = 1024;
                  v101 = v84;
                  v102 = 2112;
                  v103 = v75;
                  v104 = 2048;
                  v105 = v79;
                  v106 = 2048;
                  v107 = v80;
                  v108 = 2112;
                  v109 = v78;
                  _os_log_error_impl(&dword_19BD16000, v68, OS_LOG_TYPE_ERROR, "Signature validation (%s%s - %s %s %s) failed for salt %d with signature %@ (inBytes %llu outBytes %llu) (app %@)", v90, 0x62u);
                  goto LABEL_86;
                }

                goto LABEL_18;
              }
              v41 = v38[24];
              if (v41 == -1)
                goto LABEL_36;
            }
            else
            {
              v41 = 0;
            }
            *(_QWORD *)&v111[0] = v41;
            goto LABEL_36;
          }
        }
        ne_log_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "Signature validation: flow has no signature", buf, 2u);
        }

      }
    }
  }
  v25 = 0;
LABEL_18:

  return v25;
}

@end
