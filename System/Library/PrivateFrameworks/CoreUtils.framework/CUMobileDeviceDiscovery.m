@implementation CUMobileDeviceDiscovery

- (CUMobileDeviceDiscovery)init
{
  CUMobileDeviceDiscovery *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUMobileDeviceDiscovery;
  v2 = -[CUMobileDeviceDiscovery init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    *(_QWORD *)&v2->_changeFlags = 0x200000003;
  }
  return v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CUMobileDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**invalidationHandler)(void);
  id v8;
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  uint64_t v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled
    && gLogCategory_CUMobileDeviceDiscovery <= 50
    && (gLogCategory_CUMobileDeviceDiscovery != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, (uint64_t)"-[CUMobileDeviceDiscovery _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v12);
  }
  if (!self->_mdRunLoopThread)
  {
    if (gLogCategory_CUMobileDeviceDiscovery <= 30
      && (gLogCategory_CUMobileDeviceDiscovery != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, (uint64_t)"-[CUMobileDeviceDiscovery _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v3, v4, v5, v6, v12);
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      v8 = self->_invalidationHandler;
    }
    else
    {
      v8 = 0;
    }
    self->_invalidationHandler = 0;

    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    deviceChangedHandler = self->_deviceChangedHandler;
    self->_deviceChangedHandler = 0;

  }
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unsigned)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unsigned int)a3
{
  self->_discoveryFlags = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_selfRef, 0);
  objc_storeStrong((id *)&self->_mdRunLoopThread, 0);
}

uint64_t __37__CUMobileDeviceDiscovery_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id *v9;
  uint64_t v10;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 9))
  {
    v8 = result;
    if (gLogCategory_CUMobileDeviceDiscovery <= 30
      && (gLogCategory_CUMobileDeviceDiscovery != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, (uint64_t)"-[CUMobileDeviceDiscovery invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v10);
    }
    *(_BYTE *)(*(_QWORD *)(v8 + 32) + 9) = 1;
    v9 = *(id **)(v8 + 32);
    if (v9[2])
      return objc_msgSend(v9[2], "invalidate");
    else
      return objc_msgSend(v9, "_invalidated");
  }
  return result;
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CURunLoopThread *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD v16[4];
  uint64_t v17;
  _QWORD v18[4];
  uint64_t v19;
  _QWORD v20[4];
  uint64_t v21;

  if (gLogCategory_CUMobileDeviceDiscovery <= 30
    && (gLogCategory_CUMobileDeviceDiscovery != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMobileDeviceDiscovery, (uint64_t)"-[CUMobileDeviceDiscovery activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v15);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v9 = objc_alloc_init(CURunLoopThread);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend((id)objc_opt_class(), "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setLabel:", v12);

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke_2;
  v20[3] = &unk_1E25DF2A0;
  v21 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v21 + 16), "setInvalidationHandler:", v20);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke_3;
  v18[3] = &unk_1E25DF2A0;
  v19 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v19 + 16), "setThreadInitializeHandler:", v18);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __35__CUMobileDeviceDiscovery_activate__block_invoke_4;
  v16[3] = &unk_1E25DF2A0;
  v17 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v17 + 16), "setThreadFinalizeHandler:", v16);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activate");
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mdThreadInitialize");
}

uint64_t __35__CUMobileDeviceDiscovery_activate__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mdThreadFinalize");
}

+ (void)getDevicesWithQueue:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = dispatch_queue_create("CUMobileDeviceGetDevices", 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke;
  v10[3] = &unk_1E25DE600;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke_2;
  v6[3] = &unk_1E25DE600;
  v3 = *(NSObject **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __58__CUMobileDeviceDiscovery_getDevicesWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

@end
