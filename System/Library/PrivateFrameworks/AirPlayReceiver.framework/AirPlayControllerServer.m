@implementation AirPlayControllerServer

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  self->_serviceName = 0;
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");

  self->_xpcListener = 0;
  self->_performCommandBlock = 0;

  self->_copyPropertyBlock = 0;
  self->_setPropertyBlock = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AirPlayControllerServer;
  -[AirPlayControllerServer dealloc](&v4, sel_dealloc);
}

- (void)setDispatchQueue:(id)a3
{
  NSObject *queue;

  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void)invalidate
{
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
}

- (void)startWithXPCName:(id)a3
{
  NSXPCListener *v5;

  self->_serviceName = (NSString *)objc_msgSend(a3, "copy");
  v5 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", a3);
  self->_xpcListener = v5;
  -[NSXPCListener setDelegate:](v5, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x24BDAC8D0];
  if (gLogCategory_AirPlayControllerServer <= 10
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    v10 = objc_msgSend(a4, "processIdentifier");
    LogPrintF();
  }
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2553CFC90, v10);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v12[6] = objc_opt_class();
  v8 = objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 7));
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_performCommand_qualifier_params_completion_, 1, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_performCommand_qualifier_params_completion_, 2, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_postEvent_qualifier_params_completion_, 1, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_postEvent_qualifier_params_completion_, 2, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getProperty_qualifier_completion_, 1, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getProperty_qualifier_completion_, 1, 1);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_setProperty_qualifier_value_completion_, 1, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_setProperty_qualifier_value_completion_, 2, 0);
  objc_msgSend(a4, "setExportedInterface:", v6);
  objc_msgSend(a4, "setExportedObject:", self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__AirPlayControllerServer_listener_shouldAcceptNewConnection___block_invoke;
  v11[3] = &unk_24E21FD40;
  v11[4] = self;
  v11[5] = a4;
  objc_msgSend(a4, "setInvalidationHandler:", v11);
  if (self->_queue && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a4, "_setQueue:", self->_queue);
  objc_msgSend(a4, "resume");
  return 1;
}

- (void)_connectionInvalidated:(id)a3
{
  if (gLogCategory_AirPlayControllerServer <= 10
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(a3, "processIdentifier");
    LogPrintF();
  }
  objc_msgSend(a3, "setInvalidationHandler:", 0);
}

- (void)performCommand:(id)a3 qualifier:(id)a4 params:(id)a5 completion:(id)a6
{
  uint64_t (**performCommandBlock)(id, id, id, id, id *);
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v18 = 0;
  if (gLogCategory_AirPlayControllerServer <= 30
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    v16 = a4;
    v17 = a5;
    v15 = a3;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isEqual:", CFSTR("test"), v15, v16, v17))
  {
    if (gLogCategory_AirPlayControllerServer <= 50
      && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v18 = &unk_24E22D0A0;
    v14 = &unk_24E22D0A0;
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  performCommandBlock = (uint64_t (**)(id, id, id, id, id *))self->_performCommandBlock;
  if (!performCommandBlock)
  {
    v13 = 4294960582;
    goto LABEL_15;
  }
  v12 = performCommandBlock[2](performCommandBlock, a3, a4, a5, &v18);
  if (!(_DWORD)v12)
    goto LABEL_14;
  v13 = v12;
LABEL_15:
  (*((void (**)(id, uint64_t, id))a6 + 2))(a6, v13, v18);

}

- (void)postEvent:(id)a3 qualifier:(id)a4 params:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;

  if (gLogCategory_AirPlayControllerServer <= 30
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    v11 = a4;
    v12 = a5;
    v10 = a3;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isEqual:", CFSTR("test"), v10, v11, v12)
    && gLogCategory_AirPlayControllerServer <= 50
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id))a6 + 2))(a6);
}

- (void)getProperty:(id)a3 qualifier:(id)a4 completion:(id)a5
{
  uint64_t (**copyPropertyBlock)(id, id, id, int *);
  __CFString *v10;
  __CFString *v11;
  id v12;
  id v13;
  int v14;

  if (gLogCategory_AirPlayControllerServer <= 30
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    v12 = a3;
    v13 = a4;
    LogPrintF();
  }
  v14 = 0;
  if (objc_msgSend(a3, "isEqual:", CFSTR("test"), v12, v13))
  {
    if (gLogCategory_AirPlayControllerServer <= 50
      && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = CFSTR("value");
    v11 = CFSTR("value");
  }
  else
  {
    copyPropertyBlock = (uint64_t (**)(id, id, id, int *))self->_copyPropertyBlock;
    if (!copyPropertyBlock)
    {
      v10 = 0;
      v14 = -6714;
      goto LABEL_15;
    }
    v10 = (__CFString *)copyPropertyBlock[2](copyPropertyBlock, a3, a4, &v14);
    if (v14)
      goto LABEL_15;
  }
  v14 = 0;
LABEL_15:
  (*((void (**)(id))a5 + 2))(a5);

}

- (void)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 completion:(id)a6
{
  uint64_t (**setPropertyBlock)(id, id, id, id);
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  if (gLogCategory_AirPlayControllerServer <= 30
    && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
  {
    v15 = a4;
    v16 = a5;
    v14 = a3;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isEqual:", CFSTR("test"), v14, v15, v16))
  {
    if (gLogCategory_AirPlayControllerServer <= 50
      && (gLogCategory_AirPlayControllerServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    setPropertyBlock = (uint64_t (**)(id, id, id, id))self->_setPropertyBlock;
    if (!setPropertyBlock)
    {
      v13 = 4294960582;
      goto LABEL_12;
    }
    v12 = setPropertyBlock[2](setPropertyBlock, a3, a4, a5);
    if ((_DWORD)v12)
    {
      v13 = v12;
      goto LABEL_12;
    }
  }
  v13 = 0;
LABEL_12:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_queue;
}

- (id)performCommandBlock
{
  return self->_performCommandBlock;
}

- (void)setPerformCommandBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)copyPropertyBlock
{
  return self->_copyPropertyBlock;
}

- (void)setCopyPropertyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)setPropertyBlock
{
  return self->_setPropertyBlock;
}

- (void)setSetPropertyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

uint64_t __62__AirPlayControllerServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionInvalidated:", *(_QWORD *)(a1 + 40));
}

@end
