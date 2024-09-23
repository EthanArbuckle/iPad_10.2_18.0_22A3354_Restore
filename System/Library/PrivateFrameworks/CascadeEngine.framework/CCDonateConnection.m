@implementation CCDonateConnection

void __67__CCDonateConnection_addItemsWithContents_metaContents_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void (*v6)(_QWORD *);
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v2 = (void *)MEMORY[0x23B820268]();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));

  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(void (**)(_QWORD *))(v4 + 48);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __67__CCDonateConnection_addItemsWithContents_metaContents_completion___block_invoke_2;
    v8[3] = &unk_25098A960;
    v8[4] = v4;
    v9 = v5;
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v6(v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 11);
  }
  objc_autoreleasePoolPop(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong(&self->_openStreamCompletion, 0);
  objc_destroyWeak((id *)&self->_request);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

- (void)addItemsWithContents:(id)a3 metaContents:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CCDonateConnection_addItemsWithContents_metaContents_completion___block_invoke;
  block[3] = &unk_25098A960;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);

}

- (CCDonateConnection)initWithRequestManager:(id)a3 xpcConnection:(id)a4 accessAssertion:(id)a5
{
  id v9;
  id v10;
  id v11;
  CCDonateConnection *v12;
  CCDonateConnection *v13;
  id openStreamCompletion;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CCDonateConnection;
  v12 = -[CCDonateConnection init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestManager, a3);
    objc_storeWeak((id *)&v13->_xpcConnection, v10);
    openStreamCompletion = v13->_openStreamCompletion;
    v13->_openStreamCompletion = 0;

    objc_storeStrong((id *)&v13->_accessAssertion, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("DonateConnection", v15);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

  }
  return v13;
}

- (void)beginSetDonationWithItemType:(unsigned __int16)a3 fromDevice:(id)a4 encodedDescriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  id openStreamCompletion;
  CCDonateRequest *obj;

  v12 = a3;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = (void *)MEMORY[0x23B8203DC](a8);
  openStreamCompletion = self->_openStreamCompletion;
  self->_openStreamCompletion = v17;

  obj = -[CCDonateRequest initWithConnection:manager:itemType:encodedDescriptors:version:validity:device:accessAssertion:]([CCDonateRequest alloc], "initWithConnection:manager:itemType:encodedDescriptors:version:validity:device:accessAssertion:", self, self->_requestManager, v12, v15, a6, v14, v16, self->_accessAssertion);
  objc_storeWeak((id *)&self->_request, obj);
  -[CCDonateRequestManager submitRequest:](self->_requestManager, "submitRequest:", obj);

}

- (BOOL)isXPC
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)isAlive
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__CCDonateConnection_isAlive__block_invoke;
  v5[3] = &unk_25098A910;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resume
{
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  v4 = 138412290;
  v5 = WeakRetained;
  _os_log_error_impl(&dword_237B02000, a2, OS_LOG_TYPE_ERROR, "Rejecting request %@ after updater failed to be initialized", (uint8_t *)&v4, 0xCu);

}

void __29__CCDonateConnection_isAlive__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = WeakRetained != 0;

}

- (CCDonateConnection)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_isEntitledXPC
{
  NSXPCConnection **p_xpcConnection;
  id WeakRetained;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;

  p_xpcConnection = &self->_xpcConnection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.CascadeSets.donate.internal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)p_xpcConnection);
    objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.siri.koa.donate.internal"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0;
  }

  return v5;
}

- (void)_cleanupRequestState
{
  CCDifferentialUpdater *updater;
  BMAccessAssertion *accessAssertion;

  objc_storeWeak((id *)&self->_request, 0);
  updater = self->_updater;
  self->_updater = 0;

  accessAssertion = self->_accessAssertion;
  self->_accessAssertion = 0;

}

uint64_t __28__CCDonateConnection_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDonation:", 3);
}

uint64_t __28__CCDonateConnection_resume__block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDonation:", 2);
}

uint64_t __28__CCDonateConnection_resume__block_invoke_34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDonation:", 3);
}

- (void)timeout
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__CCDonateConnection_timeout__block_invoke;
  block[3] = &unk_25098A6F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __29__CCDonateConnection_timeout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDonation:", 4);
}

- (void)endSetDonationWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CCDonateConnection_endSetDonationWithOptions_completion___block_invoke;
  block[3] = &unk_25098A938;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync(queue, block);

}

void __59__CCDonateConnection_endSetDonationWithOptions_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void (*v6)(_QWORD *);
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x23B820268]();
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));

  if (WeakRetained)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[2] = __59__CCDonateConnection_endSetDonationWithOptions_completion___block_invoke_2;
    v8[3] = &unk_25098A938;
    v4 = a1[4];
    v5 = (void *)a1[5];
    v6 = *(void (**)(_QWORD *))(v4 + 48);
    v8[1] = 3221225472;
    v10 = a1[6];
    v8[4] = v4;
    v9 = v5;
    v6(v8);

  }
  else
  {
    v7 = a1[5];
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 11);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __59__CCDonateConnection_endSetDonationWithOptions_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t result;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "finish:", *(_DWORD *)(a1 + 48) & 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = WeakRetained;
  if (v2)
    v5 = 0;
  else
    v5 = 3;
  if (v2)
    v6 = 7;
  else
    v6 = 11;
  objc_msgSend(WeakRetained, "terminateWithType:", v5);

  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    CCDonateServiceResponseDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_237B02000, v7, OS_LOG_TYPE_DEFAULT, "Completing request %@ with response %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_cleanupRequestState");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v6);
  return result;
}

- (void)abortSetDonation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CCDonateConnection_abortSetDonation__block_invoke;
  block[3] = &unk_25098A6F0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__CCDonateConnection_abortSetDonation__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x23B820268]();
  objc_msgSend(*(id *)(a1 + 32), "_cleanupDonation:", 1);
  objc_autoreleasePoolPop(v2);
}

- (void)_cleanupDonation:(int64_t)a3
{
  id WeakRetained;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  NSXPCConnection **p_xpcConnection;
  id v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_request);

  if (WeakRetained)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained((id *)&self->_request);
      CCDonateRequestTerminationTypeDescription(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_237B02000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up request %@ with termination type %@", (uint8_t *)&v13, 0x16u);

    }
    -[CCDifferentialUpdater abort](self->_updater, "abort");
    v9 = objc_loadWeakRetained((id *)&self->_request);
    objc_msgSend(v9, "terminateWithType:", a3);

    -[CCDonateConnection _cleanupRequestState](self, "_cleanupRequestState");
  }
  p_xpcConnection = &self->_xpcConnection;
  v11 = objc_loadWeakRetained((id *)p_xpcConnection);

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)p_xpcConnection);
    objc_msgSend(v12, "invalidate");

  }
}

uint64_t __67__CCDonateConnection_addItemsWithContents_metaContents_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t (*v3)(void);

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addItemsWithContents:metaContents:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    result = *(_QWORD *)(a1 + 56);
    if (!result)
      return result;
    v3 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cleanupDonation:", 3);
    result = *(_QWORD *)(a1 + 56);
    if (!result)
      return result;
    v3 = *(uint64_t (**)(void))(result + 16);
  }
  return v3();
}

- (void)removeSourceItemIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CCDonateConnection_removeSourceItemIdentifier_completion___block_invoke;
  block[3] = &unk_25098A988;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __60__CCDonateConnection_removeSourceItemIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void (*v6)(_QWORD *);
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v2 = (void *)MEMORY[0x23B820268]();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));

  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(void (**)(_QWORD *))(v4 + 48);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__CCDonateConnection_removeSourceItemIdentifier_completion___block_invoke_2;
    v8[3] = &unk_25098A988;
    v8[4] = v4;
    v9 = v5;
    v10 = *(id *)(a1 + 48);
    v6(v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 11);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __60__CCDonateConnection_removeSourceItemIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t (*v3)(void);

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isIncremental")
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeSourceItemIdentifier:", *(_QWORD *)(a1 + 40)))
  {
    result = *(_QWORD *)(a1 + 48);
    if (!result)
      return result;
    v3 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cleanupDonation:", 3);
    result = *(_QWORD *)(a1 + 48);
    if (!result)
      return result;
    v3 = *(uint64_t (**)(void))(result + 16);
  }
  return v3();
}

- (void)mergeDelta:(id)a3 withDeltaMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__CCDonateConnection_mergeDelta_withDeltaMetadata_completion___block_invoke;
  block[3] = &unk_25098A960;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);

}

void __62__CCDonateConnection_mergeDelta_withDeltaMetadata_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void (*v5)(_QWORD *);
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));

  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(void (**)(_QWORD *))(v3 + 48);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__CCDonateConnection_mergeDelta_withDeltaMetadata_completion___block_invoke_2;
    v7[3] = &unk_25098A960;
    v7[4] = v3;
    v8 = v4;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    v5(v7);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 11);
  }
}

uint64_t __62__CCDonateConnection_mergeDelta_withDeltaMetadata_completion___block_invoke_2(_QWORD *a1)
{
  int v2;
  uint64_t result;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1[4] + 40), "mergeDelta:withDeltaMetadata:", a1[5], a1[6]);
  result = a1[7];
  if (result)
  {
    if (v2)
      v4 = 7;
    else
      v4 = 11;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

- (CCDonateRequestManager)requestManager
{
  return self->_requestManager;
}

- (void)setRequestManager:(id)a3
{
  objc_storeStrong((id *)&self->_requestManager, a3);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (CCDonateRequest)request
{
  return (CCDonateRequest *)objc_loadWeakRetained((id *)&self->_request);
}

- (void)setRequest:(id)a3
{
  objc_storeWeak((id *)&self->_request, a3);
}

- (id)openStreamCompletion
{
  return self->_openStreamCompletion;
}

- (void)setOpenStreamCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CCDifferentialUpdater)updater
{
  return self->_updater;
}

- (void)setUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_updater, a3);
}

- (void)attributionFunction
{
  return self->_attributionFunction;
}

- (void)setAttributionFunction:(void *)a3
{
  self->_attributionFunction = a3;
}

- (BMAccessAssertion)accessAssertion
{
  return self->_accessAssertion;
}

- (void)setAccessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_accessAssertion, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

@end
