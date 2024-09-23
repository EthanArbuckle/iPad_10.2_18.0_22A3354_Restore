@implementation FSWebKitHostSupportManager

+ (FSWebKitHostSupportManager)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_7);
  return (FSWebKitHostSupportManager *)(id)sharedManager_sSharedManager;
}

void __43__FSWebKitHostSupportManager_sharedManager__block_invoke()
{
  FSWebKitHostSupportManager *v0;
  void *v1;

  v0 = objc_alloc_init(FSWebKitHostSupportManager);
  v1 = (void *)sharedManager_sSharedManager;
  sharedManager_sSharedManager = (uint64_t)v0;

}

- (FSWebKitHostSupportManager)init
{
  FSWebKitHostSupportManager *v2;
  uint64_t v3;
  NSXPCListener *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FSWebKitHostSupportManager;
  v2 = -[FSWebKitHostSupportManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  FSWebKitProcessSupportHandler *v7;

  v4 = (void *)MEMORY[0x1E0CB3B50];
  v5 = a4;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_1EEEB9190);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);
  v7 = -[FSWebKitProcessSupportHandler initWithConnection:]([FSWebKitProcessSupportHandler alloc], "initWithConnection:", v5);
  objc_msgSend(v5, "setExportedObject:", v7);

  objc_msgSend(v5, "resume");
  return 1;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
