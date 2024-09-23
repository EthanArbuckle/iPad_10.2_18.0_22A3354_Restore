@implementation UARPControllerXPC

- (UARPControllerXPC)initWithController:(id)a3
{
  id v4;
  UARPControllerXPC *v5;
  uint64_t v6;
  id providerErrorReply;
  os_log_t v8;
  OS_os_log *xpcLog;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UARPControllerXPC;
  v5 = -[UARPControllerXPC init](&v14, sel_init);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __40__UARPControllerXPC_initWithController___block_invoke;
    v11[3] = &unk_24CEA39B0;
    objc_copyWeak(&v12, &location);
    v6 = MEMORY[0x2199A515C](v11);
    providerErrorReply = v5->_providerErrorReply;
    v5->_providerErrorReply = (id)v6;

    v8 = os_log_create("com.apple.accessoryupdater.uarp", "xpc");
    xpcLog = v5->_xpcLog;
    v5->_xpcLog = (OS_os_log *)v8;

    objc_storeWeak((id *)&v5->_controller, v4);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __40__UARPControllerXPC_initWithController___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 2, a2);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UARPControllerXPC;
  -[UARPControllerXPC dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)xpcConnection
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.accessoryupdater.uarp"), 4096);
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B74DF8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectInterface](self->_xpcConnection, "remoteObjectInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getSupportedAccessories_reply_, 0, 1);

    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_initWeak(&location, self);
    v14 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __34__UARPControllerXPC_xpcConnection__block_invoke;
    v18[3] = &unk_24CEA2750;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v18);
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __34__UARPControllerXPC_xpcConnection__block_invoke_113;
    v16[3] = &unk_24CEA2750;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __34__UARPControllerXPC_xpcConnection__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  __int16 v4[8];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[4];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_212D08000, v3, OS_LOG_TYPE_INFO, "Connection interrupted", (uint8_t *)v4, 2u);
    }
  }

}

void __34__UARPControllerXPC_xpcConnection__block_invoke_113(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_212D08000, v3, OS_LOG_TYPE_INFO, "Connection invalidated", v5, 2u);
    }
    v4 = (void *)v2[1];
    v2[1] = 0;

  }
}

- (id)invocationForProviderSelector:(SEL)a3
{
  objc_method_description MethodDescription;
  void *v5;
  void *v6;

  MethodDescription = protocol_getMethodDescription((Protocol *)&unk_254B74DF8, a3, 1, 1);
  if (MethodDescription.types)
  {
    objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", MethodDescription.types);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelector:", a3);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)performSynchronousProviderInvocation:(id)a3 accessory:(id)a4 requireKnown:(BOOL)a5 description:(const char *)a6
{
  int v7;
  id v10;
  id v11;
  void *v12;
  id WeakRetained;
  int v14;
  NSObject *v15;
  BOOL v16;
  NSError *lastProviderError;
  void *v18;
  void *v19;
  NSError *v20;
  NSObject *xpcLog;
  const char *v23;
  NSError *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "getID");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setArgument:atIndex:", &v26, 2);
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v14 = objc_msgSend(WeakRetained, "accessoryKnown:", v12);

    if (v14 == v7)
    {
      lastProviderError = self->_lastProviderError;
      self->_lastProviderError = 0;

      -[UARPControllerXPC xpcConnection](self, "xpcConnection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __93__UARPControllerXPC_performSynchronousProviderInvocation_accessory_requireKnown_description___block_invoke;
      v25[3] = &unk_24CEA39D8;
      v25[4] = self;
      objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "invokeWithTarget:", v19);
      v20 = self->_lastProviderError;
      v16 = v20 == 0;
      if (v20)
      {
        xpcLog = self->_xpcLog;
        if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
        {
          v24 = self->_lastProviderError;
          *(_DWORD *)buf = 136446722;
          v28 = a6;
          v29 = 2114;
          v30 = v24;
          v31 = 2112;
          v32 = v12;
          _os_log_error_impl(&dword_212D08000, xpcLog, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@ (%@)", buf, 0x20u);
        }
      }

    }
    else
    {
      v15 = self->_xpcLog;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v23 = "known";
        *(_DWORD *)buf = 136446722;
        v28 = a6;
        if (v7)
          v23 = "unknown";
        v29 = 2082;
        v30 = (void *)v23;
        v31 = 2112;
        v32 = v12;
        _os_log_error_impl(&dword_212D08000, v15, OS_LOG_TYPE_ERROR, "%{public}s: %{public}s accessory (%@)", buf, 0x20u);
      }
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __93__UARPControllerXPC_performSynchronousProviderInvocation_accessory_requireKnown_description___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
}

- (BOOL)addAccessory:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v12;
  id v13;

  v6 = a4;
  v13 = v6;
  v7 = a3;
  -[UARPControllerXPC invocationForProviderSelector:](self, "invocationForProviderSelector:", sel_addAccessoryID_assetID_sandboxExtensionToken_reply_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (v6 && !objc_msgSend(v6, "type", v12, v13))
  {
    objc_msgSend(v6, "remoteURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSandboxExtension readWriteTokenStringWithURL:](UARPSandboxExtension, "readWriteTokenStringWithURL:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setArgument:atIndex:", &v13, 3, v12);
  objc_msgSend(v8, "setArgument:atIndex:", &v12, 4);
  objc_msgSend(v8, "setArgument:atIndex:", &self->_providerErrorReply, 5);
  v10 = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:](self, "performSynchronousProviderInvocation:accessory:requireKnown:description:", v8, v7, 0, "Add accessory");

  return v10;
}

- (BOOL)removeAccessory:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UARPControllerXPC invocationForProviderSelector:](self, "invocationForProviderSelector:", sel_removeAccessoryID_reply_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArgument:atIndex:", &self->_providerErrorReply, 3);
  LOBYTE(self) = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:](self, "performSynchronousProviderInvocation:accessory:requireKnown:description:", v5, v4, 1, "Remove accessory");

  return (char)self;
}

- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v12;
  id v13;

  v6 = a4;
  v13 = v6;
  v7 = a3;
  -[UARPControllerXPC invocationForProviderSelector:](self, "invocationForProviderSelector:", sel_changeAssetLocation_assetID_sandboxExtensionToken_reply_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (v6 && !objc_msgSend(v6, "type", v12, v13))
  {
    objc_msgSend(v6, "remoteURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSandboxExtension readWriteTokenStringWithURL:](UARPSandboxExtension, "readWriteTokenStringWithURL:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setArgument:atIndex:", &v13, 3, v12);
  objc_msgSend(v8, "setArgument:atIndex:", &v12, 4);
  objc_msgSend(v8, "setArgument:atIndex:", &self->_providerErrorReply, 5);
  v10 = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:](self, "performSynchronousProviderInvocation:accessory:requireKnown:description:", v8, v7, 1, "Change asset location");

  return v10;
}

- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5
{
  id v8;
  void *v9;
  BOOL v11;
  id v12;

  v12 = a4;
  v11 = a5;
  v8 = a3;
  -[UARPControllerXPC invocationForProviderSelector:](self, "invocationForProviderSelector:", sel_downloadFirmwareForAccessoryID_assetID_userIntent_reply_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setArgument:atIndex:", &v12, 3);
  objc_msgSend(v9, "setArgument:atIndex:", &v11, 4);
  objc_msgSend(v9, "setArgument:atIndex:", &self->_providerErrorReply, 5);
  LOBYTE(self) = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:](self, "performSynchronousProviderInvocation:accessory:requireKnown:description:", v9, v8, 1, "Download asset");

  return (char)self;
}

- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4
{
  id v6;
  void *v7;
  id v9;

  v9 = a4;
  v6 = a3;
  -[UARPControllerXPC invocationForProviderSelector:](self, "invocationForProviderSelector:", sel_downloadReleaseNotesForAccessoryID_assetID_reply_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArgument:atIndex:", &v9, 3);
  objc_msgSend(v7, "setArgument:atIndex:", &self->_providerErrorReply, 4);
  LOBYTE(self) = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:](self, "performSynchronousProviderInvocation:accessory:requireKnown:description:", v7, v6, 1, "Download release notes");

  return (char)self;
}

- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v10 = a4;
  v11 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firmwareUpdateProgressForAccessoryID:assetID:bytesSent:bytesTotal:", v13, v10, a5, a6);
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a4;
  v9 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stagingCompleteForAccessoryID:assetID:status:", v9, v8, a5);

}

- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firmwareUpdateProgressForUARPConsent:bytesSent:bytesTotal:", v8, a4, a5);

}

- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "progressForUARPConsent:bytesSent:bytesTotal:", v8, a4, a5);

}

- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "progressForUARPConsentInPostLogout:bytesSent:bytesTotal:", v8, a4, a5);

}

- (BOOL)checkForUpdate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UARPControllerXPC invocationForProviderSelector:](self, "invocationForProviderSelector:", sel_checkForUpdate_reply_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArgument:atIndex:", &self->_providerErrorReply, 3);
  LOBYTE(self) = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:](self, "performSynchronousProviderInvocation:accessory:requireKnown:description:", v5, v4, 1, "Check for update");

  return (char)self;
}

- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5
{
  uint64_t v6;
  id v8;
  id WeakRetained;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t *v16;
  NSObject *xpcLog;
  BOOL v18;
  uint64_t v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v6 = *(_QWORD *)&a4;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v10 = objc_msgSend(WeakRetained, "accessoryKnown:", v8);

  if ((v10 & 1) != 0)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__2;
    v31 = __Block_byref_object_dispose__2;
    v32 = 0;
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke;
    v26[3] = &unk_24CEA3A00;
    v26[4] = &v27;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    objc_msgSend(v8, "getID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke_2;
    v21[3] = &unk_24CEA3A28;
    v21[4] = &v22;
    v21[5] = &v27;
    objc_msgSend(v13, "personalizationVectorForAccessoryID:assetTag:reply:", v14, v15, v21);

    v16 = v28;
    if (v28[5])
    {
      xpcLog = self->_xpcLog;
      if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
      {
        v20 = v28[5];
        *(_DWORD *)buf = 136315906;
        v34 = "-[UARPControllerXPC personalizationVectorForAccessory:assetTag:outVector:]";
        v35 = 1024;
        v36 = v6;
        v37 = 2112;
        v38 = v8;
        v39 = 2112;
        v40 = v20;
        _os_log_error_impl(&dword_212D08000, xpcLog, OS_LOG_TYPE_ERROR, "%s: Failed to query assetTag 0x%08x for %@ (%@)", buf, 0x26u);
      }
      v16 = v28;
    }
    else
    {
      *a5 = *((_DWORD *)v23 + 6);
    }
    v18 = v16[5] == 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
      -[UARPControllerXPC personalizationVectorForAccessory:assetTag:outVector:].cold.1();
    v18 = 0;
  }

  return v18;
}

void __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = v7;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }

}

- (id)getAssetIDForAccessoryID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke;
  v17[3] = &unk_24CEA3A00;
  v17[4] = &v18;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19[5])
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
      -[UARPControllerXPC getAssetIDForAccessoryID:].cold.1();
    v8 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke_133;
    v10[3] = &unk_24CEA3A50;
    v10[4] = &v11;
    objc_msgSend(v7, "getAssetIDForAccessoryID:reply:", v4, v10);
    v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke_133(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getSupplementalAssetNameForAccessoryID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke;
  v17[3] = &unk_24CEA3A00;
  v17[4] = &v18;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19[5])
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
      -[UARPControllerXPC getSupplementalAssetNameForAccessoryID:].cold.1();
    v8 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke_135;
    v10[3] = &unk_24CEA3A78;
    v10[4] = &v11;
    objc_msgSend(v7, "getSupplementalAssetNameForAccessoryID:reply:", v4, v10);
    v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke_135(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v11 = objc_msgSend(WeakRetained, "accessoryKnown:", v8);

  if ((v11 & 1) != 0)
  {
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "manifestPropertiesReceivedForAccessoryID:assetTag:properties:", v14, v6, v9);

  }
  else if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPControllerXPC manifestPropertiesReceivedForAccessory:assetTag:properties:].cold.1();
  }

}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v12 = objc_msgSend(WeakRetained, "accessoryIDKnown:", v8);

  if ((v12 & 1) != 0)
  {
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:", v8, v9, v10);

  }
  else if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPControllerXPC sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:].cold.1();
  }

}

- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v11 = objc_msgSend(WeakRetained, "accessoryKnown:", v9);

  if ((v11 & 1) != 0)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    v25 = 0;
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke;
    v19[3] = &unk_24CEA3A00;
    v19[4] = &v20;
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "getID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke_2;
    v18[3] = &unk_24CEA3A00;
    v18[4] = &v20;
    objc_msgSend(v14, "updateProperty:value:forAccessory:reply:", a3, v8, v15, v18);

    v16 = v21[5] == 0;
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
      -[UARPControllerXPC updateProperty:value:forAccessory:].cold.1();
    v16 = 0;
  }

  return v16;
}

void __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)useAssetAvailabilityNotifications
{
  return 1;
}

- (BOOL)getSupportedAccessories:(id)a3 forProductGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *xpcLog;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__2;
    v31 = __Block_byref_object_dispose__2;
    v32 = 0;
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke;
    v26[3] = &unk_24CEA3A00;
    v26[4] = &v27;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28[5])
    {
      if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
        -[UARPControllerXPC getSupportedAccessories:forProductGroup:].cold.2();
      v11 = 0;
    }
    else
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__2;
      v24 = __Block_byref_object_dispose__2;
      v25 = 0;
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 1;
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke_137;
      v15[3] = &unk_24CEA3AA0;
      v15[4] = &v20;
      v15[5] = &v16;
      objc_msgSend(v10, "getSupportedAccessories:reply:", v7, v15);
      objc_msgSend((id)v21[5], "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v13);

      v11 = *((_BYTE *)v17 + 24) != 0;
      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&v20, 8);

    }
    _Block_object_dispose(&v27, 8);

  }
  else
  {
    xpcLog = self->_xpcLog;
    if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
      -[UARPControllerXPC getSupportedAccessories:forProductGroup:].cold.1(xpcLog);
    v11 = 0;
  }

  return v11;
}

void __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke_137(uint64_t a1, void *a2, char a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

- (BOOL)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke;
  v15[3] = &unk_24CEA3A00;
  v15[4] = &v16;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke_2;
  v14[3] = &unk_24CEA3A00;
  v14[4] = &v16;
  objc_msgSend(v12, "getSupportedAccessories:assetID:batchRequest:reply:", v8, v9, v5, v14);
  LOBYTE(v5) = v17[5] == 0;

  _Block_object_dispose(&v16, 8);
  return v5;
}

void __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getAttestationCertificates:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__UARPControllerXPC_getAttestationCertificates___block_invoke;
  v17[3] = &unk_24CEA3A00;
  v17[4] = &v18;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19[5])
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
      -[UARPControllerXPC getAttestationCertificates:].cold.1();
    v8 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __48__UARPControllerXPC_getAttestationCertificates___block_invoke_139;
    v10[3] = &unk_24CEA3AC8;
    v10[4] = &v11;
    objc_msgSend(v7, "getAttestationCertificates:reply:", v4, v10);
    v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __48__UARPControllerXPC_getAttestationCertificates___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__UARPControllerXPC_getAttestationCertificates___block_invoke_139(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)getAttestationCertificates:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke;
  v13[3] = &unk_24CEA3A00;
  v13[4] = &v14;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke_2;
  v12[3] = &unk_24CEA3A00;
  v12[4] = &v14;
  objc_msgSend(v10, "getAttestationCertificates:assetID:reply:", v6, v7, v12);
  LOBYTE(v8) = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return (char)v8;
}

void __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)requestConsent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__UARPControllerXPC_requestConsent___block_invoke;
  v10[3] = &unk_24CEA3A00;
  v10[4] = &v11;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __36__UARPControllerXPC_requestConsent___block_invoke_2;
  v9[3] = &unk_24CEA3A00;
  v9[4] = &v11;
  objc_msgSend(v7, "requestConsent:reply:", v4, v9);
  LOBYTE(v5) = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __36__UARPControllerXPC_requestConsent___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __36__UARPControllerXPC_requestConsent___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)revokeConsentRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__UARPControllerXPC_revokeConsentRequest___block_invoke;
  v10[3] = &unk_24CEA3A00;
  v10[4] = &v11;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __42__UARPControllerXPC_revokeConsentRequest___block_invoke_2;
  v9[3] = &unk_24CEA3A00;
  v9[4] = &v11;
  objc_msgSend(v7, "revokeConsentRequest:reply:", v4, v9);
  LOBYTE(v5) = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __42__UARPControllerXPC_revokeConsentRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __42__UARPControllerXPC_revokeConsentRequest___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  v10[3] = &unk_24CEA3A00;
  v10[4] = &v11;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2;
  v9[3] = &unk_24CEA3A00;
  v9[4] = &v11;
  objc_msgSend(v7, "enableTRMSystemAuthenticationForRegistryEntryID:reply:", v4, v9);
  LOBYTE(v5) = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  v10[3] = &unk_24CEA3A00;
  v10[4] = &v11;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2;
  v9[3] = &unk_24CEA3A00;
  v9[4] = &v11;
  objc_msgSend(v7, "disableTRMSystemAuthenticationForRegistryEntryID:reply:", v4, v9);
  LOBYTE(v5) = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getSandboxExtensionTokenForAssetID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke;
  v17[3] = &unk_24CEA3A00;
  v17[4] = &v18;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19[5])
  {
    if (os_log_type_enabled((os_log_t)self->_xpcLog, OS_LOG_TYPE_ERROR))
      -[UARPControllerXPC getSandboxExtensionTokenForAssetID:].cold.1();
    v8 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke_141;
    v10[3] = &unk_24CEA3A78;
    v10[4] = &v11;
    objc_msgSend(v7, "getSandboxExtensionTokenForAssetID:reply:", v4, v10);
    v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke_141(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_xpcLog, 0);
  objc_storeStrong(&self->_providerErrorReply, 0);
  objc_storeStrong((id *)&self->_lastProviderError, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)personalizationVectorForAccessory:assetTag:outVector:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: unknown accessory (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getAssetIDForAccessoryID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getSupplementalAssetNameForAccessoryID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)manifestPropertiesReceivedForAccessory:assetTag:properties:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: unknown accessory (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: unknown accessory ID (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateProperty:value:forAccessory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: unknown accessory (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getSupportedAccessories:(os_log_t)log forProductGroup:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[UARPControllerXPC getSupportedAccessories:forProductGroup:]";
  _os_log_error_impl(&dword_212D08000, log, OS_LOG_TYPE_ERROR, "%s: Caller provided nil parameter set", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)getSupportedAccessories:forProductGroup:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getAttestationCertificates:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getSandboxExtensionTokenForAssetID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: Failed to create proxy (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
