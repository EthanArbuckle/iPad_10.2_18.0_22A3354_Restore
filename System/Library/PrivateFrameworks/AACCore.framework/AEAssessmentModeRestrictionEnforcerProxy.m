@implementation AEAssessmentModeRestrictionEnforcerProxy

- (void)dealloc
{
  objc_super v3;

  -[AEAssessmentModeRestrictionEnforcerProxy invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AEAssessmentModeRestrictionEnforcerProxy;
  -[AEAssessmentModeRestrictionEnforcerProxy dealloc](&v3, sel_dealloc);
}

- (AEAssessmentModeRestrictionEnforcerProxy)initWithMachServiceName:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  AEAssessmentModeRestrictionEnforcerProxy *v9;
  AEAssessmentModeRestrictionEnforcerProxy *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AEAssessmentModeRestrictionEnforcerProxy;
  v9 = -[AEAssessmentModeRestrictionEnforcerProxy init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_machServiceName, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)invalidate
{
  id v2;

  if (self->_proxy)
  {
    -[AEAssessmentModeRestrictionEnforcerProxy proxy]((void **)&self->super.isa);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidate");

  }
}

- (void)proxy
{
  void **v1;
  void *v2;
  _QWORD *v3;
  void *v4;
  id *v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    v2 = a1[3];
    if (!v2)
    {
      v3 = -[AEMachServiceXPCConnectionOrigin initWithMachServiceName:options:]([AEMachServiceXPCConnectionOrigin alloc], a1[1], 4096);
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E02068);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[AEXPCProxy initWithOrigin:interface:]((id *)[AEXPCProxy alloc], v3, v4);
      v6 = v1[3];
      v1[3] = v5;

      v2 = v1[3];
    }
    a1 = v2;
  }
  return a1;
}

- (void)shouldBeginRestrictingForAssessmentModeWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke;
  v7[3] = &unk_24FA21E30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  id v10;

  -[AEAssessmentModeRestrictionEnforcerProxy proxy](*(void ***)(a1 + 32));
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_2;
  v8 = &unk_24FA21AC0;
  v3 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v2, &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "shouldBeginRestrictingForAssessmentModeWithCompletion:", *(_QWORD *)(a1 + 40), v5, v6, v7, v8, v9);
}

void __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v8[2] = __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_3;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __98__AEAssessmentModeRestrictionEnforcerProxy_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)shouldEndRestrictingForAssessmentModeWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke;
  v7[3] = &unk_24FA21E30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  uint64_t v9;
  id v10;

  -[AEAssessmentModeRestrictionEnforcerProxy proxy](*(void ***)(a1 + 32));
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke_2;
  v8 = &unk_24FA21AC0;
  v3 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v2, &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "shouldEndRestrictingForAssessmentModeWithCompletion:", *(_QWORD *)(a1 + 40), v5, v6, v7, v8, v9);
}

void __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v8[2] = __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke_3;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __96__AEAssessmentModeRestrictionEnforcerProxy_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end
