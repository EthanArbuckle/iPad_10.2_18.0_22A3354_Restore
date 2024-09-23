@implementation DADiscoveryExtension

- (id)description
{
  id v2;
  void *v4;

  -[_EXExtensionIdentity bundleIdentifier](self->_ekExtension, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v2 = 0;

  return v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__DADiscoveryExtension_activate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__DADiscoveryExtension_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  _EXExtensionIdentity *ekExtension;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DADiscoveryExtension *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    v12 = self;
    LogPrintF();
  }
  ekExtension = self->_ekExtension;
  v18 = 0;
  -[_EXExtensionIdentity makeXPCConnectionWithError:](ekExtension, "makeXPCConnectionWithError:", &v18, v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  if (v4)
  {
    objc_storeStrong((id *)&self->_xpcConnection, v4);
    objc_msgSend(v4, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6B8B8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v6);

    objc_msgSend(v4, "setExportedObject:", self);
    v7 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __33__DADiscoveryExtension__activate__block_invoke;
    v17[3] = &unk_24D169168;
    v17[4] = self;
    objc_msgSend(v4, "setInterruptionHandler:", v17);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __33__DADiscoveryExtension__activate__block_invoke_2;
    v16[3] = &unk_24D169168;
    v16[4] = self;
    objc_msgSend(v4, "setInvalidationHandler:", v16);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6D6E0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v8);

    objc_msgSend(v4, "resume");
    if (gLogCategory_DADiscovery <= 30)
    {
      if (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    v9 = (void *)sandbox_extension_issue_mach();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __33__DADiscoveryExtension__activate__block_invoke_3;
    v15[3] = &unk_24D169548;
    v15[4] = self;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "consumeToken:", v9);

    free(v9);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __33__DADiscoveryExtension__activate__block_invoke_4;
    v14[3] = &unk_24D169548;
    v14[4] = self;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDiscovery");

  }
  else if (gLogCategory_DADiscovery <= 90
         && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

uint64_t __33__DADiscoveryExtension__activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __33__DADiscoveryExtension__activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __33__DADiscoveryExtension__activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_DADiscovery <= 90)
  {
    v6 = v2;
    if (gLogCategory_DADiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      CUPrintNSError();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v3 = v6;
    }
  }

}

void __33__DADiscoveryExtension__activate__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_DADiscovery <= 90)
  {
    v6 = v2;
    if (gLogCategory_DADiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      CUPrintNSError();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v3 = v6;
    }
  }

}

- (void)_interrupted
{
  if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__DADiscoveryExtension_invalidate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__DADiscoveryExtension_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  DADiscovery *parent;

  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    LogPrintF();
  parent = self->_parent;
  self->_parent = 0;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  -[DADiscoveryExtension _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  id invalidationHandler;
  void *v4;
  id v5;

  if (!self->_xpcConnection)
  {
    v5 = _Block_copy(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = v5;
    if (v5)
    {
      (*((void (**)(id))v5 + 2))(v5);
      v4 = v5;
    }

  }
}

- (void)reportEvent:(id)a3
{
  void *v4;
  int v5;
  DADiscovery *parent;
  DADiscoveryExtension *v7;
  id v8;
  id v9;

  v9 = a3;
  -[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcConnection, "cuValueForEntitlementNoCache:", CFSTR("com.apple.developer.accessory-setup-discovery-extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", MEMORY[0x24BDBD1C8]);

  parent = self->_parent;
  if (v5)
  {
    if (parent)
    {
      if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
      {
        v7 = self;
        v8 = v9;
        LogPrintF();
      }
      -[DADiscovery _reportASKEvent:](self->_parent, "_reportASKEvent:", v9, v7, v8);
    }
  }
  else if (parent)
  {
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[DADiscovery _reportEvent:](self->_parent, "_reportEvent:", v9, self, v9);
    }
    else
    {
      -[DADiscovery _reportEvent:](self->_parent, "_reportEvent:", v9, v7, v8);
    }
  }

}

- (void)reportEventToExtension:(id)a3
{
  NSXPCConnection *xpcConnection;
  id v4;
  void *v5;
  _QWORD v6[5];

  xpcConnection = self->_xpcConnection;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__DADiscoveryExtension_reportEventToExtension___block_invoke;
  v6[3] = &unk_24D169548;
  v6[4] = self;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveDeviceChangedEvent:", v4);

}

void __47__DADiscoveryExtension_reportEventToExtension___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_DADiscovery <= 90)
  {
    v6 = v2;
    if (gLogCategory_DADiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      CUPrintNSError();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v3 = v6;
    }
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (_EXExtensionIdentity)ekExtension
{
  return self->_ekExtension;
}

- (void)setEkExtension:(id)a3
{
  objc_storeStrong((id *)&self->_ekExtension, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (DADiscovery)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
  objc_storeStrong((id *)&self->_parent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_ekExtension, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
