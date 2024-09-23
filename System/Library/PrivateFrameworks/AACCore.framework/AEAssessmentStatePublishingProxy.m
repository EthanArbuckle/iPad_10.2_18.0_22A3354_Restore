@implementation AEAssessmentStatePublishingProxy

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
    v10.super_class = (Class)AEAssessmentStatePublishingProxy;
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

+ (id)proxyWithEndpoint:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  id *v10;
  id *v11;

  v5 = a4;
  v6 = a3;
  v7 = -[AEAnonymousXPCConnectionOrigin initWithEndpoint:]((id *)[AEAnonymousXPCConnectionOrigin alloc], v6);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "makeInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AEXPCProxy initWithOrigin:interface:]((id *)[AEXPCProxy alloc], v7, v9);
  v11 = -[AEAssessmentStatePublishingProxy initWithXPCProxy:queue:]((id *)[AEAssessmentStatePublishingProxy alloc], v10, v5);

  return v11;
}

- (void)publishAssessmentState:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__AEAssessmentStatePublishingProxy_publishAssessmentState_withCompletion___block_invoke;
  v8[3] = &unk_24FA21AC0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[AEAssessmentStatePublishingProxy _publishAssessmentState:withCompletion:]((uint64_t)self, a3, v8);

}

void __74__AEAssessmentStatePublishingProxy_publishAssessmentState_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(NSObject **)(v4 + 16);
  else
    v5 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__AEAssessmentStatePublishingProxy_publishAssessmentState_withCompletion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __74__AEAssessmentStatePublishingProxy_publishAssessmentState_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_publishAssessmentState:(void *)a3 withCompletion:
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
    v11[2] = __75__AEAssessmentStatePublishingProxy__publishAssessmentState_withCompletion___block_invoke;
    v11[3] = &unk_24FA21AE8;
    v8 = v5;
    v12 = v8;
    v9 = a2;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v7, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "publishAssessmentState:withCompletion:", v9, v8);

  }
}

- (void)endPublications:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__AEAssessmentStatePublishingProxy_endPublications___block_invoke;
  v6[3] = &unk_24FA21AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AEAssessmentStatePublishingProxy _endPublications:]((uint64_t)self, v6);

}

void __52__AEAssessmentStatePublishingProxy_endPublications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(NSObject **)(v4 + 16);
  else
    v5 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__AEAssessmentStatePublishingProxy_endPublications___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __52__AEAssessmentStatePublishingProxy_endPublications___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_endPublications:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(_QWORD **)(a1 + 8);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__AEAssessmentStatePublishingProxy__endPublications___block_invoke;
    v8[3] = &unk_24FA21AE8;
    v6 = v3;
    v9 = v6;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endPublications:", v6);

  }
}

uint64_t __75__AEAssessmentStatePublishingProxy__publishAssessmentState_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__AEAssessmentStatePublishingProxy__endPublications___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcProxy, 0);
}

@end
