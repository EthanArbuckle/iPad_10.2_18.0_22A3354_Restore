@implementation NMSKeepLocalRequestProxy

- (NMSKeepLocalRequestProxy)initWithModelObject:(id)a3 enableState:(int64_t)a4
{
  NMSKeepLocalRequestProxy *v4;
  NMSMediaSyncService *v5;
  NMSMediaSyncService *mediaSyncService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NMSKeepLocalRequestProxy;
  v4 = -[NMSKeepLocalRequest initWithModelObject:enableState:](&v8, sel_initWithModelObject_enableState_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(NMSMediaSyncService);
    mediaSyncService = v4->_mediaSyncService;
    v4->_mediaSyncService = v5;

  }
  return v4;
}

- (void)performWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NMSMediaSyncService *mediaSyncService;
  int64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (-[NMSKeepLocalRequest enableState](self, "enableState") == 1)
  {
    if (objc_msgSend(v12, "requiresValidation"))
    {
      objc_msgSend(v12, "cellularBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Required cellular bundle identifier missing during KeepLocalRequest validation."), 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v11);
      }
    }
  }
  mediaSyncService = self->_mediaSyncService;
  v9 = -[NMSKeepLocalRequest enableState](self, "enableState");
  -[NMSKeepLocalRequest modelObject](self, "modelObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncService performKeepLocalRequestWithEnableState:modelObject:options:completion:](mediaSyncService, "performKeepLocalRequestWithEnableState:modelObject:options:completion:", v9, v10, v12, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSyncService, 0);
}

@end
