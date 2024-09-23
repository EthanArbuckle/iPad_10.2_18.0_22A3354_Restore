@implementation FSWebKitProcessSupportManager

- (FSWebKitProcessSupportManager)initWithXPCEndpoint:(id)a3
{
  id v4;
  FSWebKitProcessSupportManager *v5;
  void *v6;
  uint64_t v7;
  NSXPCConnection *hostConnection;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FSWebKitProcessSupportManager;
  v5 = -[FSWebKitProcessSupportManager init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "_setEndpoint:", v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v6);
    hostConnection = v5->_hostConnection;
    v5->_hostConnection = (NSXPCConnection *)v7;

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__FSWebKitProcessSupportManager_initWithXPCEndpoint___block_invoke;
    v15[3] = &unk_1E612C2A0;
    v9 = v5;
    v16 = v9;
    -[NSXPCConnection setInvalidationHandler:](v5->_hostConnection, "setInvalidationHandler:", v15);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB9190);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_hostConnection, "setRemoteObjectInterface:", v10);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB8098);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5->_hostConnection, "setExportedInterface:", v11);
    -[NSXPCConnection setExportedObject:](v5->_hostConnection, "setExportedObject:", v9);
    -[NSXPCConnection resume](v5->_hostConnection, "resume");
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v9[2];
    v9[2] = (id)v12;

    objc_msgSend(v9[2], "setDelegate:", v9);
    objc_msgSend(v9[2], "resume");

  }
  return v5;
}

void __53__FSWebKitProcessSupportManager_initWithXPCEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  NSLog(CFSTR("FSWebKitProcessSupportManager host connection was invalidated."));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (void)checkin
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FSWebKitProcessSupportManager hostConnection](self, "hostConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[FSWebKitProcessSupportManager serverListener](self, "serverListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkin:reply:", v5, &__block_literal_global_15_0);

}

void __40__FSWebKitProcessSupportManager_checkin__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("xpc error: %s - %@"), "-[FSWebKitProcessSupportManager checkin]_block_invoke", a2);
}

void __40__FSWebKitProcessSupportManager_checkin__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "objectForKey:", kFSWebKitSupportParamLocallyActivatedFontsKey);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("FSWebKitProcessSupport was called."));
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_19_0);

}

void __40__FSWebKitProcessSupportManager_checkin__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  NSLog(CFSTR("FSWebKitSupport - %@"), v6);
  MEMORY[0x1B5E09640](v6, v4);

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (GSFontRegisterURL())
    NSLog(CFSTR("failed to use host app's locally activated font - %@"), v6);

}

- (void)ping:(id)a3
{
  void (**v3)(id, const __CFString *);

  v3 = (void (**)(id, const __CFString *))a3;
  GSFontInitialize();
  v3[2](v3, CFSTR("Hello!"));

}

- (void)userInstalledFontsInfo:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  v5 = a3;
  NSLog(CFSTR("FSWebKitSupport - userInstalledFontsInfo %@"), v5);
  GSFontSetupForUserInstalledFonts();

  v6[2]();
}

- (void)ping2:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Hello fontservicesd!"));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_31_0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB8118);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);
  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

void __68__FSWebKitProcessSupportManager_listener_shouldAcceptNewConnection___block_invoke()
{
  NSLog(CFSTR("FSWebKitProcessSupportManager server connection was invalidated."));
}

- (NSXPCConnection)hostConnection
{
  return self->_hostConnection;
}

- (void)setHostConnection:(id)a3
{
  objc_storeStrong((id *)&self->_hostConnection, a3);
}

- (NSXPCListener)serverListener
{
  return self->_serverListener;
}

- (void)setServerListener:(id)a3
{
  objc_storeStrong((id *)&self->_serverListener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverListener, 0);
  objc_storeStrong((id *)&self->_hostConnection, 0);
}

@end
