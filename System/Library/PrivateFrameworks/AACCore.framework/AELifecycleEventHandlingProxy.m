@implementation AELifecycleEventHandlingProxy

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
    v10.super_class = (Class)AELifecycleEventHandlingProxy;
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
  v11 = -[AELifecycleEventHandlingProxy initWithXPCProxy:queue:]((id *)[AELifecycleEventHandlingProxy alloc], v10, v5);

  return v11;
}

- (id)interruptionHandler
{
  if (self)
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  return -[AELifecycleEventHandlingProxy interruptionHandler](self, "interruptionHandler");
}

- (id)invalidationHandler
{
  if (self)
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  return -[AELifecycleEventHandlingProxy invalidationHandler](self, "invalidationHandler");
}

- (void)setInterruptionHandler:(id)a3
{
  if (self)
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  -[AELifecycleEventHandlingProxy setInterruptionHandler:](self, "setInterruptionHandler:", a3);
}

- (void)setInvalidationHandler:(id)a3
{
  if (self)
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  -[AELifecycleEventHandlingProxy setInvalidationHandler:](self, "setInvalidationHandler:", a3);
}

- (void)invalidate
{
  if (self)
    self = (AELifecycleEventHandlingProxy *)self->_xpcProxy;
  -[AELifecycleEventHandlingProxy invalidate](self, "invalidate");
}

- (void)handleEventDidBeginWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__AELifecycleEventHandlingProxy_handleEventDidBeginWithCompletion___block_invoke;
  v6[3] = &unk_24FA21AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AELifecycleEventHandlingProxy _handleEventDidBeginWithCompletion:]((uint64_t)self, v6);

}

void __67__AELifecycleEventHandlingProxy_handleEventDidBeginWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __67__AELifecycleEventHandlingProxy_handleEventDidBeginWithCompletion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __67__AELifecycleEventHandlingProxy_handleEventDidBeginWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_handleEventDidBeginWithCompletion:(uint64_t)a1
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
    v8[2] = __68__AELifecycleEventHandlingProxy__handleEventDidBeginWithCompletion___block_invoke;
    v8[3] = &unk_24FA21AE8;
    v6 = v3;
    v9 = v6;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleEventDidBeginWithCompletion:", v6);

  }
}

- (void)handleEventDidInvalidateWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__AELifecycleEventHandlingProxy_handleEventDidInvalidateWithError_completion___block_invoke;
  v8[3] = &unk_24FA21AC0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[AELifecycleEventHandlingProxy _handleEventDidInvalidateWithError:completion:]((uint64_t)self, a3, v8);

}

void __78__AELifecycleEventHandlingProxy_handleEventDidInvalidateWithError_completion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __78__AELifecycleEventHandlingProxy_handleEventDidInvalidateWithError_completion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __78__AELifecycleEventHandlingProxy_handleEventDidInvalidateWithError_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_handleEventDidInvalidateWithError:(void *)a3 completion:
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
    v11[2] = __79__AELifecycleEventHandlingProxy__handleEventDidInvalidateWithError_completion___block_invoke;
    v11[3] = &unk_24FA21AE8;
    v8 = v5;
    v12 = v8;
    v9 = a2;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v7, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleEventDidInvalidateWithError:completion:", v9, v8);

  }
}

- (void)handleEventWantsBeginSingleAppModeWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__AELifecycleEventHandlingProxy_handleEventWantsBeginSingleAppModeWithCompletion___block_invoke;
  v6[3] = &unk_24FA21AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AELifecycleEventHandlingProxy _handleEventWantsBeginSingleAppModeWithCompletion:]((uint64_t)self, v6);

}

void __82__AELifecycleEventHandlingProxy_handleEventWantsBeginSingleAppModeWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __82__AELifecycleEventHandlingProxy_handleEventWantsBeginSingleAppModeWithCompletion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __82__AELifecycleEventHandlingProxy_handleEventWantsBeginSingleAppModeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_handleEventWantsBeginSingleAppModeWithCompletion:(uint64_t)a1
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
    v8[2] = __83__AELifecycleEventHandlingProxy__handleEventWantsBeginSingleAppModeWithCompletion___block_invoke;
    v8[3] = &unk_24FA21AE8;
    v6 = v3;
    v9 = v6;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleEventWantsBeginSingleAppModeWithCompletion:", v6);

  }
}

- (void)handleEventWantsEndSingleAppModeWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__AELifecycleEventHandlingProxy_handleEventWantsEndSingleAppModeWithCompletion___block_invoke;
  v6[3] = &unk_24FA21AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AELifecycleEventHandlingProxy _handleEventWantsEndSingleAppModeWithCompletion:]((uint64_t)self, v6);

}

void __80__AELifecycleEventHandlingProxy_handleEventWantsEndSingleAppModeWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __80__AELifecycleEventHandlingProxy_handleEventWantsEndSingleAppModeWithCompletion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __80__AELifecycleEventHandlingProxy_handleEventWantsEndSingleAppModeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_handleEventWantsEndSingleAppModeWithCompletion:(uint64_t)a1
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
    v8[2] = __81__AELifecycleEventHandlingProxy__handleEventWantsEndSingleAppModeWithCompletion___block_invoke;
    v8[3] = &unk_24FA21AE8;
    v6 = v3;
    v9 = v6;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleEventWantsEndSingleAppModeWithCompletion:", v6);

  }
}

- (void)handleEventWantsPresentChoicePromptWithTitle:(id)a3 message:(id)a4 confirmTitle:(id)a5 cancelTitle:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v12 = a7;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __122__AELifecycleEventHandlingProxy_handleEventWantsPresentChoicePromptWithTitle_message_confirmTitle_cancelTitle_completion___block_invoke;
  v14[3] = &unk_24FA21EF0;
  v14[4] = self;
  v15 = v12;
  v13 = v12;
  -[AELifecycleEventHandlingProxy _handleEventWantsPresentChoicePromptWithTitle:message:confirmTitle:cancelTitle:completion:]((uint64_t)self, a3, a4, a5, a6, v14);

}

void __122__AELifecycleEventHandlingProxy_handleEventWantsPresentChoicePromptWithTitle_message_confirmTitle_cancelTitle_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(NSObject **)(v6 + 16);
  else
    v7 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __122__AELifecycleEventHandlingProxy_handleEventWantsPresentChoicePromptWithTitle_message_confirmTitle_cancelTitle_completion___block_invoke_2;
  block[3] = &unk_24FA21EC8;
  v8 = *(id *)(a1 + 40);
  v13 = a2;
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(v7, block);

}

uint64_t __122__AELifecycleEventHandlingProxy_handleEventWantsPresentChoicePromptWithTitle_message_confirmTitle_cancelTitle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_handleEventWantsPresentChoicePromptWithTitle:(void *)a3 message:(void *)a4 confirmTitle:(void *)a5 cancelTitle:(void *)a6 completion:
{
  id v11;
  void *v12;
  _QWORD *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v11 = a6;
  v12 = v11;
  if (a1)
  {
    v13 = *(_QWORD **)(a1 + 8);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __123__AELifecycleEventHandlingProxy__handleEventWantsPresentChoicePromptWithTitle_message_confirmTitle_cancelTitle_completion___block_invoke;
    v20[3] = &unk_24FA21AE8;
    v14 = v11;
    v21 = v14;
    v15 = a5;
    v16 = a4;
    v17 = a3;
    v18 = a2;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v13, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleEventWantsPresentChoicePromptWithTitle:message:confirmTitle:cancelTitle:completion:", v18, v17, v16, v15, v14);

  }
}

- (void)handleEventWantsPresentBannerWithTitle:(id)a3 duration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __92__AELifecycleEventHandlingProxy_handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke;
  v10[3] = &unk_24FA21AC0;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[AELifecycleEventHandlingProxy _handleEventWantsPresentBannerWithTitle:duration:completion:]((uint64_t)self, a3, a4, v10);

}

void __92__AELifecycleEventHandlingProxy_handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __92__AELifecycleEventHandlingProxy_handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke_2;
  v8[3] = &unk_24FA21A98;
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __92__AELifecycleEventHandlingProxy_handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_handleEventWantsPresentBannerWithTitle:(void *)a3 duration:(void *)a4 completion:
{
  id v7;
  void *v8;
  _QWORD *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a4;
  v8 = v7;
  if (a1)
  {
    v9 = *(_QWORD **)(a1 + 8);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __93__AELifecycleEventHandlingProxy__handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke;
    v14[3] = &unk_24FA21AE8;
    v10 = v7;
    v15 = v10;
    v11 = a3;
    v12 = a2;
    -[AEXPCProxy remoteObjectProxyWithErrorHandler:](v9, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleEventWantsPresentBannerWithTitle:duration:completion:", v12, v11, v10);

  }
}

uint64_t __68__AELifecycleEventHandlingProxy__handleEventDidBeginWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__AELifecycleEventHandlingProxy__handleEventDidInvalidateWithError_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__AELifecycleEventHandlingProxy__handleEventWantsBeginSingleAppModeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__AELifecycleEventHandlingProxy__handleEventWantsEndSingleAppModeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __123__AELifecycleEventHandlingProxy__handleEventWantsPresentChoicePromptWithTitle_message_confirmTitle_cancelTitle_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__AELifecycleEventHandlingProxy__handleEventWantsPresentBannerWithTitle_duration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcProxy, 0);
}

@end
