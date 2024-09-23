@implementation MSOpenCompose

+ (MSOpenCompose)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__MSOpenCompose_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (MSOpenCompose *)(id)sharedInstance_instance;
}

void __31__MSOpenCompose_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

+ (void)presentNewMailWithContext:(id)a3 delegateEndpoint:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSOpenCompose presentNewMailWithContext:delegateEndpoint:completion:](v10, v11, v8, v9);

}

- (void)presentNewMailWithContext:(void *)a3 delegateEndpoint:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__MSOpenCompose_presentNewMailWithContext_delegateEndpoint_completion___block_invoke;
    v13[3] = &unk_24C385300;
    v11 = v9;
    v14 = v11;
    objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentNewMailWithContext:delegateEndpoint:completion:", v7, v8, v11);

  }
}

- (MSOpenCompose)init
{
  void *v3;
  MSOpenCompose *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25461A548);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)MSOpenCompose;
  v4 = -[MSXPCService initWithRemoteObjectInterface:](&v6, sel_initWithRemoteObjectInterface_, v3);

  return v4;
}

void __71__MSOpenCompose_presentNewMailWithContext_delegateEndpoint_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

@end
