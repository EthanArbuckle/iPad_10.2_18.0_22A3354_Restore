@implementation MSOpenComposeDelegateRequest

- (MSOpenComposeDelegateRequest)init
{
  void *v3;
  MSOpenComposeDelegateRequest *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25461A5A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)MSOpenComposeDelegateRequest;
  v4 = -[MSXPCService initWithRemoteObjectInterface:](&v6, sel_initWithRemoteObjectInterface_, v3);

  return v4;
}

- (void)checkInComposeWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__MSOpenComposeDelegateRequest_checkInComposeWithIdentifier_completion___block_invoke;
  v10[3] = &unk_24C385300;
  v8 = v7;
  v11 = v8;
  -[MSXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "checkInComposeWithIdentifier:completion:", v6, v8);

}

void __72__MSOpenComposeDelegateRequest_checkInComposeWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v3 + 16))(v3, 0, 0, v4);

}

@end
