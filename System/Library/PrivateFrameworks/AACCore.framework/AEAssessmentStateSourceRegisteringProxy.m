@implementation AEAssessmentStateSourceRegisteringProxy

- (id)initWithXPCProxy:(void *)a3 queue:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)AEAssessmentStateSourceRegisteringProxy;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

+ (id)proxyWithOrigin:(void *)a3 queue:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id *v9;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "makeInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AEXPCProxy initWithOrigin:interface:]((id *)[AEXPCProxy alloc], v5, v7);
  v9 = -[AEAssessmentStateSourceRegisteringProxy initWithXPCProxy:queue:]((id *)[AEAssessmentStateSourceRegisteringProxy alloc], v8, v4);

  return v9;
}

+ (id)daemonProxyWithQueue:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = -[AEMachServiceXPCConnectionOrigin initWithMachServiceName:options:]([AEMachServiceXPCConnectionOrigin alloc], CFSTR("com.apple.assessmentagent"), 4096);
  +[AEAssessmentStateSourceRegisteringProxy proxyWithOrigin:queue:]((uint64_t)a1, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[AEAnonymousXPCConnectionOrigin initWithEndpoint:]((id *)[AEAnonymousXPCConnectionOrigin alloc], v7);

  +[AEAssessmentStateSourceRegisteringProxy proxyWithOrigin:queue:]((uint64_t)a1, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)registerPublisherWithLifetimeEndpoint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __92__AEAssessmentStateSourceRegisteringProxy_registerPublisherWithLifetimeEndpoint_completion___block_invoke;
  v8[3] = &unk_24FA21F18;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[AEAssessmentStateSourceRegisteringProxy _registerPublisherWithLifetimeEndpoint:completion:]((uint64_t)self, a3, v8);

}

void __92__AEAssessmentStateSourceRegisteringProxy_registerPublisherWithLifetimeEndpoint_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(NSObject **)(v7 + 16);
  else
    v8 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__AEAssessmentStateSourceRegisteringProxy_registerPublisherWithLifetimeEndpoint_completion___block_invoke_2;
  block[3] = &unk_24FA21B38;
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

uint64_t __92__AEAssessmentStateSourceRegisteringProxy_registerPublisherWithLifetimeEndpoint_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_registerPublisherWithLifetimeEndpoint:(void *)a3 completion:
{
  id v5;
  void *v6;
  _QWORD *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = *(_QWORD **)(a1 + 8);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __93__AEAssessmentStateSourceRegisteringProxy__registerPublisherWithLifetimeEndpoint_completion___block_invoke;
    v11[3] = &unk_24FA21AE8;
    v8 = v5;
    v12 = v8;
    v9 = a2;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v7, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerPublisherWithLifetimeEndpoint:completion:", v9, v8);

  }
}

uint64_t __93__AEAssessmentStateSourceRegisteringProxy__registerPublisherWithLifetimeEndpoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcProxy, 0);
}

@end
