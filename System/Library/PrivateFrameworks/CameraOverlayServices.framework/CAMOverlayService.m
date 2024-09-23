@implementation CAMOverlayService

+ (int64_t)version
{
  return 1;
}

+ (CAMOverlayService)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_0);
  return (CAMOverlayService *)(id)sharedService_sharedService;
}

void __34__CAMOverlayService_sharedService__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CAMOverlayService _init]([CAMOverlayService alloc], "_init");
  v1 = (void *)sharedService_sharedService;
  sharedService_sharedService = (uint64_t)v0;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMOverlayService;
  return -[CAMOverlayService init](&v3, sel_init);
}

- (id)createConnectionWithClient:(id)a3
{
  return -[CAMOverlayService createConnectionWithClient:queue:](self, "createConnectionWithClient:queue:", a3, MEMORY[0x24BDAC9B8]);
}

- (id)createConnectionWithClient:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CAMOverlayServiceConnection *v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v14;

  v6 = a4;
  v7 = a3;
  -[CAMOverlayService _activeConnection](self, "_activeConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CAMOverlayServiceConnection initWithClient:queue:]([CAMOverlayServiceConnection alloc], "initWithClient:queue:", v7, v6);

  -[CAMOverlayService _setActiveConnection:](self, "_setActiveConnection:", v9);
  if (!v8
    || (objc_msgSend(v8, "clientQueue"), v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 == v6))
  {
    objc_msgSend(v8, "invalidateWithReason:", 0);
  }
  else
  {
    objc_msgSend(v8, "clientQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__CAMOverlayService_createConnectionWithClient_queue___block_invoke;
    block[3] = &unk_2508F8E40;
    v14 = v8;
    dispatch_async(v11, block);

  }
  return v9;
}

uint64_t __54__CAMOverlayService_createConnectionWithClient_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateWithReason:", 0);
}

- (CAMOverlayServiceConnection)_activeConnection
{
  return self->__activeConnection;
}

- (void)_setActiveConnection:(id)a3
{
  objc_storeStrong((id *)&self->__activeConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeConnection, 0);
}

@end
