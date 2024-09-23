@implementation AirPlayController

- (AirPlayController)init
{
  AirPlayController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AirPlayController;
  v2 = -[AirPlayController init](&v4, sel_init);
  if (v2)
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("AirPlayController", 0);
  return v2;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_cnx, "invalidate");

  self->_cnx = 0;
  self->_xpcName = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AirPlayController;
  -[AirPlayController dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_cnx, "invalidate");
}

- (id)_setupConnection
{
  id result;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const __CFString *xpcName;
  NSXPCConnection *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  result = self->_cnx;
  if (!result)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255033708);
    v5 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v6 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 7);
    v7 = objc_msgSend(v5, "setWithArray:", v6, v11, v12, v13, v14, v15, v16);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_performCommand_qualifier_params_completion_, 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_performCommand_qualifier_params_completion_, 2, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_postEvent_qualifier_params_completion_, 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_postEvent_qualifier_params_completion_, 2, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_getProperty_qualifier_completion_, 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_getProperty_qualifier_completion_, 1, 1);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_setProperty_qualifier_value_completion_, 1, 0);
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_setProperty_qualifier_value_completion_, 2, 0);
    v8 = objc_alloc(MEMORY[0x24BDD1988]);
    if (self->_xpcName)
      xpcName = (const __CFString *)self->_xpcName;
    else
      xpcName = CFSTR("com.apple.airplay.sender.xpc");
    v10 = (NSXPCConnection *)objc_msgSend(v8, "initWithMachServiceName:options:", xpcName, 0);
    self->_cnx = v10;
    -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v4);
    -[NSXPCConnection resume](self->_cnx, "resume");
    return self->_cnx;
  }
  return result;
}

- (int)performCommand:(id)a3 qualifier:(id)a4 params:(id)a5 response:(id *)a6
{
  NSObject *v11;
  uint64_t *v12;
  id v13;
  int v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__AirPlayController_performCommand_qualifier_params_response___block_invoke;
  v16[3] = &unk_24DA38758;
  v16[5] = &v23;
  v16[6] = &v17;
  v16[4] = v11;
  -[AirPlayController performCommand:qualifier:params:completion:](self, "performCommand:qualifier:params:completion:", a3, a4, a5, v16);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v11);
  v12 = v18;
  if (a6)
    *a6 = (id)v18[5];
  v13 = (id)v12[5];
  v14 = *((_DWORD *)v24 + 6);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

- (void)performCommand:(id)a3 qualifier:(id)a4 params:(id)a5 completion:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__AirPlayController_performCommand_qualifier_params_completion___block_invoke;
  block[3] = &unk_24DA38910;
  block[7] = a5;
  block[8] = a6;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)postEvent:(id)a3 qualifier:(id)a4 params:(id)a5
{
  NSObject *v9;
  _QWORD v10[5];

  v9 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__AirPlayController_postEvent_qualifier_params___block_invoke;
  v10[3] = &unk_24DA38898;
  v10[4] = v9;
  -[AirPlayController postEvent:qualifier:params:completion:](self, "postEvent:qualifier:params:completion:", a3, a4, a5, v10);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
}

- (void)postEvent:(id)a3 qualifier:(id)a4 params:(id)a5 completion:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__AirPlayController_postEvent_qualifier_params_completion___block_invoke;
  block[3] = &unk_24DA38910;
  block[7] = a5;
  block[8] = a6;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (id)getProperty:(id)a3 qualifier:(id)a4 status:(int *)a5
{
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v9 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__AirPlayController_getProperty_qualifier_status___block_invoke;
  v13[3] = &unk_24DA387F8;
  v13[5] = &v14;
  v13[6] = a5;
  v13[4] = v9;
  -[AirPlayController getProperty:qualifier:completion:](self, "getProperty:qualifier:completion:", a3, a4, v13);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  v10 = (id)v15[5];
  v11 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (void)getProperty:(id)a3 qualifier:(id)a4 completion:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__AirPlayController_getProperty_qualifier_completion___block_invoke;
  v6[3] = &unk_24DA38988;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

- (int)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5
{
  NSObject *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__AirPlayController_setProperty_qualifier_value___block_invoke;
  v11[3] = &unk_24DA38848;
  v11[4] = v9;
  v11[5] = &v12;
  -[AirPlayController setProperty:qualifier:value:completion:](self, "setProperty:qualifier:value:completion:", a3, a4, a5, v11);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  LODWORD(v9) = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return (int)v9;
}

- (void)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 completion:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__AirPlayController_setProperty_qualifier_value_completion___block_invoke;
  block[3] = &unk_24DA38910;
  block[7] = a5;
  block[8] = a6;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (NSString)xpcName
{
  return self->_xpcName;
}

- (void)setXpcName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

uint64_t __60__AirPlayController_setProperty_qualifier_value_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_setupConnection");
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__AirPlayController_setProperty_qualifier_value_completion___block_invoke_2;
  v10[3] = &unk_24DA38780;
  v10[4] = *(_QWORD *)(a1 + 64);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  if (!v6)
    v6 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = *(_QWORD *)(a1 + 56);
  if (!v7)
    v7 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __60__AirPlayController_setProperty_qualifier_value_completion___block_invoke_3;
  v9[3] = &unk_24DA38870;
  v9[4] = *(_QWORD *)(a1 + 64);
  return objc_msgSend(v4, "setProperty:qualifier:value:completion:", v5, v6, v7, v9);
}

uint64_t __60__AirPlayController_setProperty_qualifier_value_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __60__AirPlayController_setProperty_qualifier_value_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t __49__AirPlayController_setProperty_qualifier_value___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __54__AirPlayController_getProperty_qualifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_setupConnection");
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__AirPlayController_getProperty_qualifier_completion___block_invoke_2;
  v9[3] = &unk_24DA38780;
  v9[4] = *(_QWORD *)(a1 + 56);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (!v5)
    v5 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __54__AirPlayController_getProperty_qualifier_completion___block_invoke_3;
  v8[3] = &unk_24DA38820;
  v8[4] = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v4, "getProperty:qualifier:completion:", v6, v5, v8);
}

uint64_t __54__AirPlayController_getProperty_qualifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"), 0);
}

uint64_t __54__AirPlayController_getProperty_qualifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t __50__AirPlayController_getProperty_qualifier_status___block_invoke(uint64_t a1, int a2, void *a3)
{
  _DWORD *v4;

  v4 = *(_DWORD **)(a1 + 48);
  if (v4)
    *v4 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __59__AirPlayController_postEvent_qualifier_params_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_setupConnection");
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__AirPlayController_postEvent_qualifier_params_completion___block_invoke_2;
  v10[3] = &unk_24DA38780;
  v10[4] = *(_QWORD *)(a1 + 64);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  if (!v6)
    v6 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = *(_QWORD *)(a1 + 56);
  if (!v7)
    v7 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __59__AirPlayController_postEvent_qualifier_params_completion___block_invoke_3;
  v9[3] = &unk_24DA387D0;
  v9[4] = *(_QWORD *)(a1 + 64);
  return objc_msgSend(v4, "postEvent:qualifier:params:completion:", v5, v6, v7, v9);
}

uint64_t __59__AirPlayController_postEvent_qualifier_params_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__AirPlayController_postEvent_qualifier_params_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t __48__AirPlayController_postEvent_qualifier_params___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __64__AirPlayController_performCommand_qualifier_params_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_setupConnection");
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__AirPlayController_performCommand_qualifier_params_completion___block_invoke_2;
  v10[3] = &unk_24DA38780;
  v10[4] = *(_QWORD *)(a1 + 64);
  v4 = (void *)objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  if (!v6)
    v6 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = *(_QWORD *)(a1 + 56);
  if (!v7)
    v7 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __64__AirPlayController_performCommand_qualifier_params_completion___block_invoke_3;
  v9[3] = &unk_24DA387A8;
  v9[4] = *(_QWORD *)(a1 + 64);
  return objc_msgSend(v4, "performCommand:qualifier:params:completion:", v5, v6, v7, v9);
}

uint64_t __64__AirPlayController_performCommand_qualifier_params_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"), 0);
}

uint64_t __64__AirPlayController_performCommand_qualifier_params_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t __62__AirPlayController_performCommand_qualifier_params_response___block_invoke(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
