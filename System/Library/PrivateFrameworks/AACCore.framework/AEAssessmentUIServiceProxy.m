@implementation AEAssessmentUIServiceProxy

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
    v10.super_class = (Class)AEAssessmentUIServiceProxy;
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
  v9 = -[AEAssessmentUIServiceProxy initWithXPCProxy:queue:]((id *)[AEAssessmentUIServiceProxy alloc], v8, v4);

  return v9;
}

+ (id)serviceProxyWithQueue:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = -[AEServiceXPCConnectionOrigin initWithServiceName:]([AEServiceXPCConnectionOrigin alloc], CFSTR("com.apple.assessmentmode.AssessmentUIService"));
  +[AEAssessmentUIServiceProxy proxyWithOrigin:queue:]((uint64_t)a1, v5, v4);
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

  +[AEAssessmentUIServiceProxy proxyWithOrigin:queue:]((uint64_t)a1, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)interruptionHandler
{
  if (self)
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  return -[AEAssessmentUIServiceProxy interruptionHandler](self, "interruptionHandler");
}

- (id)invalidationHandler
{
  if (self)
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  return -[AEAssessmentUIServiceProxy invalidationHandler](self, "invalidationHandler");
}

- (void)setInterruptionHandler:(id)a3
{
  if (self)
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  -[AEAssessmentUIServiceProxy setInterruptionHandler:](self, "setInterruptionHandler:", a3);
}

- (void)setInvalidationHandler:(id)a3
{
  if (self)
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  -[AEAssessmentUIServiceProxy setInvalidationHandler:](self, "setInvalidationHandler:", a3);
}

- (void)invalidate
{
  if (self)
    self = (AEAssessmentUIServiceProxy *)self->_xpcProxy;
  -[AEAssessmentUIServiceProxy invalidate](self, "invalidate");
}

- (void)activateWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__AEAssessmentUIServiceProxy_activateWithConfiguration_completion___block_invoke;
  v8[3] = &unk_24FA21AC0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[AEAssessmentUIServiceProxy _activateWithConfiguration:completion:]((uint64_t)self, a3, v8);

}

void __67__AEAssessmentUIServiceProxy_activateWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __67__AEAssessmentUIServiceProxy_activateWithConfiguration_completion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __67__AEAssessmentUIServiceProxy_activateWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_activateWithConfiguration:(void *)a3 completion:
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
    v11[2] = __68__AEAssessmentUIServiceProxy__activateWithConfiguration_completion___block_invoke;
    v11[3] = &unk_24FA21AE8;
    v8 = v5;
    v12 = v8;
    v9 = a2;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v7, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateWithConfiguration:completion:", v9, v8);

  }
}

uint64_t __68__AEAssessmentUIServiceProxy__activateWithConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)animateInWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__AEAssessmentUIServiceProxy_animateInWithCompletion___block_invoke;
  v6[3] = &unk_24FA21AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AEAssessmentUIServiceProxy _animateInWithCompletion:]((uint64_t)self, v6);

}

void __54__AEAssessmentUIServiceProxy_animateInWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __54__AEAssessmentUIServiceProxy_animateInWithCompletion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __54__AEAssessmentUIServiceProxy_animateInWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_animateInWithCompletion:(uint64_t)a1
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
    v8[2] = __55__AEAssessmentUIServiceProxy__animateInWithCompletion___block_invoke;
    v8[3] = &unk_24FA21AE8;
    v6 = v3;
    v9 = v6;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animateInWithCompletion:", v6);

  }
}

uint64_t __55__AEAssessmentUIServiceProxy__animateInWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)animateOutWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__AEAssessmentUIServiceProxy_animateOutWithCompletion___block_invoke;
  v6[3] = &unk_24FA21AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AEAssessmentUIServiceProxy _animateOutWithCompletion:]((uint64_t)self, v6);

}

void __55__AEAssessmentUIServiceProxy_animateOutWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __55__AEAssessmentUIServiceProxy_animateOutWithCompletion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __55__AEAssessmentUIServiceProxy_animateOutWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_animateOutWithCompletion:(uint64_t)a1
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
    v8[2] = __56__AEAssessmentUIServiceProxy__animateOutWithCompletion___block_invoke;
    v8[3] = &unk_24FA21AE8;
    v6 = v3;
    v9 = v6;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animateOutWithCompletion:", v6);

  }
}

uint64_t __56__AEAssessmentUIServiceProxy__animateOutWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deactivateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__AEAssessmentUIServiceProxy_deactivateWithCompletion___block_invoke;
  v6[3] = &unk_24FA21AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AEAssessmentUIServiceProxy _deactivateWithCompletion:]((uint64_t)self, v6);

}

void __55__AEAssessmentUIServiceProxy_deactivateWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __55__AEAssessmentUIServiceProxy_deactivateWithCompletion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __55__AEAssessmentUIServiceProxy_deactivateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_deactivateWithCompletion:(uint64_t)a1
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
    v8[2] = __56__AEAssessmentUIServiceProxy__deactivateWithCompletion___block_invoke;
    v8[3] = &unk_24FA21AE8;
    v6 = v3;
    v9 = v6;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivateWithCompletion:", v6);

  }
}

uint64_t __56__AEAssessmentUIServiceProxy__deactivateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcProxy, 0);
}

@end
