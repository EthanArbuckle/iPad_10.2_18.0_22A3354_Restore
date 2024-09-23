@implementation FontPickerSupportHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sSharedInstance;
}

void __42__FontPickerSupportHandler_sharedInstance__block_invoke()
{
  FontPickerSupportHandler *v0;
  void *v1;

  v0 = objc_alloc_init(FontPickerSupportHandler);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

- (FontPickerSupportHandler)init
{
  FontPickerSupportHandler *v2;
  void *v3;
  uint64_t v4;
  NSXPCListener *listener;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FontPickerSupportHandler;
  v2 = -[FontPickerSupportHandler init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_registeredFontsChanged_, CFSTR("CTFontManagerFontChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v4 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSXPCListener *listener;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  listener = self->_listener;
  v9 = &protocolRef_FontServicesFontPickerSupportProtocol;
  if (listener != v6)
    v9 = &protocolRef_FontServicesFontPickerClientSupportProtocol;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", *v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v10);
  objc_msgSend(v7, "setExportedObject:", self);
  if (listener == v6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__FontPickerSupportHandler_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_1E612C2A0;
    v13[4] = self;
    objc_msgSend(v7, "setInvalidationHandler:", v13);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB7B10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v11);
    objc_storeStrong((id *)&self->_connection, a4);

  }
  objc_msgSend(v7, "resume");

  return 1;
}

uint64_t __63__FontPickerSupportHandler_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
}

- (void)ping:(id)a3 reply:(id)a4
{
  (*((void (**)(id, const __CFString *))a4 + 2))(a4, CFSTR("hello"));
}

- (void)activateFontsForFontPickerClient:(id)a3 reply:(id)a4
{
  void (**v4)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a4;
  GSFontProcessRegistrationInfoForFontPickerClient();
  v4[2](v4, 1);

}

- (BOOL)pathsContainsFontAsset:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if ((IsPathFontAssetFontFile(*(void **)(*((_QWORD *)&v9 + 1) + 8 * i), v4) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)checkin:(id)a3
{
  void (**v4)(id, void *, void *, _BOOL8, uint64_t);
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  NSXPCListener *v10;
  NSXPCListener *listenerForFontServicesDaemon;
  void *v12;
  uint64_t ShouldBeHidden;
  __int128 v14;
  __int128 v15;

  v4 = (void (**)(id, void *, void *, _BOOL8, uint64_t))a3;
  v5 = (void *)GSFontCopyLocallyActivatedFontFilePaths();
  if (v5)
  {
    v6 = -[FontPickerSupportHandler pathsContainsFontAsset:](self, "pathsContainsFontAsset:", v5);
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "auditToken");
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
    }

    SandboxExtensionsForPathsAndAuditToken(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener", v14, v15);
    v10 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    listenerForFontServicesDaemon = self->_listenerForFontServicesDaemon;
    self->_listenerForFontServicesDaemon = v10;

    -[NSXPCListener setDelegate:](self->_listenerForFontServicesDaemon, "setDelegate:", self);
    -[NSXPCListener resume](self->_listenerForFontServicesDaemon, "resume");
    -[NSXPCListener endpoint](self->_listenerForFontServicesDaemon, "endpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ShouldBeHidden = GSFontProfileFontShouldBeHidden();
    v4[2](v4, v12, v9, v6, ShouldBeHidden);

  }
}

- (void)registeredFontsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  NSXPCConnection *connection;
  void *v13;
  void *v14;

  v4 = a3;
  -[FontPickerSupportHandler connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CTFontManagerAvailableFontURLsAdded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CTFontManagerAvailableFontURLsRemoved"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke((uint64_t)v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke((uint64_t)v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FontPickerSupportHandler pathsContainsFontAsset:](self, "pathsContainsFontAsset:", v9);
    connection = self->_connection;
    if (connection)
      -[NSXPCConnection auditToken](connection, "auditToken");
    SandboxExtensionsForPathsAndAuditToken(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "synchronize:deactivated:includingFontAssets:", v13, v10, v11);

  }
}

id __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke_2;
  v6[3] = &unk_1E612C2C8;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

void __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "absoluteURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __51__FontPickerSupportHandler_registeredFontsChanged___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("xpc error: %s - %@"), "-[FontPickerSupportHandler registeredFontsChanged:]_block_invoke_3", a2);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSXPCListener)listenerForFontServicesDaemon
{
  return self->_listenerForFontServicesDaemon;
}

- (void)setListenerForFontServicesDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_listenerForFontServicesDaemon, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listenerForFontServicesDaemon, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
