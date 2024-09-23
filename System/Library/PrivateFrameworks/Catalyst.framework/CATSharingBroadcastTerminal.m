@implementation CATSharingBroadcastTerminal

- (CATSharingBroadcastTerminal)initWithBroadcastPrimitives:(id)a3 delegate:(id)a4 delegationQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  CATSharingBroadcastTerminal *v12;
  CATSharingBroadcastTerminal *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CATSharingBroadcastTerminal;
  v12 = -[CATSharingBroadcastTerminal init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mBroadcastPrimitive, a3);
    objc_storeWeak((id *)&v13->mDelegate, v10);
    objc_storeStrong((id *)&v13->mDelegationQueue, a5);
  }

  return v13;
}

- (void)activate
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD block[4];
  id v9;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__CATSharingBroadcastTerminal_activate__block_invoke;
  v5[3] = &unk_24C1C58B0;
  objc_copyWeak(&v6, &location);
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_24C1C5998;
  v9 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__CATSharingBroadcastTerminal_activate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_activate");

}

- (void)invalidate
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD block[4];
  id v9;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__CATSharingBroadcastTerminal_invalidate__block_invoke;
  v5[3] = &unk_24C1C58B0;
  objc_copyWeak(&v6, &location);
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_24C1C5998;
  v9 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __41__CATSharingBroadcastTerminal_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CATErrorWithCodeAndUserInfo(701, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_invalidateWithError:removePrimitiveHandlers:deactivatePrimitives:", v1, 1, 1);

}

- (void)_activate
{
  NSObject *v4;
  CATSharingBroadcastPrimitives *mBroadcastPrimitive;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (self->mInvalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSharingBroadcastTerminal.m"), 90, CFSTR("Terminal must not be invalidated"));

  }
  objc_initWeak(&location, self);
  mBroadcastPrimitive = self->mBroadcastPrimitive;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__CATSharingBroadcastTerminal__activate__block_invoke;
  v7[3] = &unk_24C1C5C28;
  objc_copyWeak(&v8, &location);
  -[CATSharingBroadcastPrimitives activateWithCompletion:](mBroadcastPrimitive, "activateWithCompletion:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40__CATSharingBroadcastTerminal__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__CATSharingBroadcastTerminal__activate__block_invoke_2;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __40__CATSharingBroadcastTerminal__activate__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (!v4)
    {
      objc_msgSend(WeakRetained, "setBroadcasting:", 1);
      objc_msgSend(v3, "addPrimitiveHandlers");
      v4 = *(void **)(a1 + 32);
    }
    v5 = (void *)v3[3];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__CATSharingBroadcastTerminal__activate__block_invoke_3;
    v6[3] = &unk_24C1C5C00;
    v6[4] = v3;
    v7 = v4;
    objc_msgSend(v5, "addOperationWithBlock:", v6);

  }
}

void __40__CATSharingBroadcastTerminal__activate__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "broadcastTerminal:didActivateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_invalidateWithError:(id)a3 removePrimitiveHandlers:(BOOL)a4 deactivatePrimitives:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  CATSharingBroadcastPrimitives *mBroadcastPrimitive;
  uint64_t v12;
  CATOperationQueue *mDelegationQueue;
  CATOperationQueue *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  CATGetCatalystQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v10);

  if (self->mInvalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSharingBroadcastTerminal.m"), 116, CFSTR("Terminal must not be invalidated"));

  }
  self->mInvalidated = 1;
  -[CATSharingBroadcastTerminal setBroadcasting:](self, "setBroadcasting:", 0);
  if (v6)
    -[CATSharingBroadcastTerminal removePrimitiveHandlers](self, "removePrimitiveHandlers");
  if (v5)
    -[CATSharingBroadcastPrimitives deactivate](self->mBroadcastPrimitive, "deactivate");
  mBroadcastPrimitive = self->mBroadcastPrimitive;
  self->mBroadcastPrimitive = 0;

  objc_initWeak(&location, self);
  v12 = MEMORY[0x24BDAC760];
  if (self->mIsDisplayingPIN)
  {
    mDelegationQueue = self->mDelegationQueue;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __97__CATSharingBroadcastTerminal__invalidateWithError_removePrimitiveHandlers_deactivatePrimitives___block_invoke;
    v20[3] = &unk_24C1C58B0;
    objc_copyWeak(&v21, &location);
    -[CATOperationQueue addOperationWithBlock:](mDelegationQueue, "addOperationWithBlock:", v20);
    objc_destroyWeak(&v21);
  }
  v14 = self->mDelegationQueue;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __97__CATSharingBroadcastTerminal__invalidateWithError_removePrimitiveHandlers_deactivatePrimitives___block_invoke_2;
  v17[3] = &unk_24C1C5D58;
  v15 = v9;
  v18 = v15;
  objc_copyWeak(&v19, &location);
  -[CATOperationQueue addOperationWithBlock:](v14, "addOperationWithBlock:", v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __97__CATSharingBroadcastTerminal__invalidateWithError_removePrimitiveHandlers_deactivatePrimitives___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v2, "broadcastTerminalNeedsToDismissPin:", v3);

    WeakRetained = v3;
  }

}

void __97__CATSharingBroadcastTerminal__invalidateWithError_removePrimitiveHandlers_deactivatePrimitives___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id *WeakRetained;
  id *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v8 = *MEMORY[0x24BDD1398];
    v9[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(700, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v7, "broadcastTerminal:stoppedWithError:", v6, v4);

  }
}

- (void)addPrimitiveHandlers
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke;
  v10[3] = &unk_24C1C5C28;
  objc_copyWeak(&v11, &location);
  -[CATSharingBroadcastPrimitives setInvalidationHandler:](self->mBroadcastPrimitive, "setInvalidationHandler:", v10);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_3;
  v8[3] = &unk_24C1C6390;
  objc_copyWeak(&v9, &location);
  -[CATSharingBroadcastPrimitives setShowPinHandler:](self->mBroadcastPrimitive, "setShowPinHandler:", v8);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_5;
  v6[3] = &unk_24C1C58B0;
  objc_copyWeak(&v7, &location);
  -[CATSharingBroadcastPrimitives setDismissPinHandler:](self->mBroadcastPrimitive, "setDismissPinHandler:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_7;
  v4[3] = &unk_24C1C58B0;
  objc_copyWeak(&v5, &location);
  -[CATSharingBroadcastPrimitives setSessionPairedHandler:](self->mBroadcastPrimitive, "setSessionPairedHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_2;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_invalidateWithError:removePrimitiveHandlers:deactivatePrimitives:", *(_QWORD *)(a1 + 32), 1, 1);

}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_4;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sessionNeedsToDisplayPin:", *(_QWORD *)(a1 + 32));

}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 3);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_6;
    v4[3] = &unk_24C1C5A60;
    v4[4] = v2;
    objc_msgSend(v3, "addOperationWithBlock:", v4);
  }

}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "broadcastTerminalNeedsToDismissPin:", *(_QWORD *)(a1 + 32));

}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  _QWORD block[4];
  id v7;

  v1 = MEMORY[0x24BDAC760];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_8;
  v4[3] = &unk_24C1C58B0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v2 = v4;
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = v1;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_18;
  block[3] = &unk_24C1C5998;
  v7 = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __51__CATSharingBroadcastTerminal_addPrimitiveHandlers__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sessionHasPaired");

}

- (void)removePrimitiveHandlers
{
  -[CATSharingBroadcastPrimitives setInvalidationHandler:](self->mBroadcastPrimitive, "setInvalidationHandler:", 0);
  -[CATSharingBroadcastPrimitives setShowPinHandler:](self->mBroadcastPrimitive, "setShowPinHandler:", 0);
  -[CATSharingBroadcastPrimitives setDismissPinHandler:](self->mBroadcastPrimitive, "setDismissPinHandler:", 0);
  -[CATSharingBroadcastPrimitives setSessionPairedHandler:](self->mBroadcastPrimitive, "setSessionPairedHandler:", 0);
}

- (void)sessionNeedsToDisplayPin:(id)a3
{
  id v5;
  NSObject *v6;
  CATOperationQueue *mDelegationQueue;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  if (self->mInvalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSharingBroadcastTerminal.m"), 207, CFSTR("Terminal must not be invalidated"));

  }
  self->mIsDisplayingPIN = 1;
  objc_initWeak(&location, self);
  mDelegationQueue = self->mDelegationQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__CATSharingBroadcastTerminal_sessionNeedsToDisplayPin___block_invoke;
  v10[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v12, &location);
  v8 = v5;
  v11 = v8;
  -[CATOperationQueue addOperationWithBlock:](mDelegationQueue, "addOperationWithBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __56__CATSharingBroadcastTerminal_sessionNeedsToDisplayPin___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "broadcastTerminal:needsToDisplayPin:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)sessionHasPaired
{
  NSObject *v4;
  CATSharingBroadcastConnection *v5;
  CATSharingBroadcastPrimitives *mBroadcastPrimitive;
  void *v7;
  CATSharingBroadcastConnection *v8;
  CATOperationQueue *mDelegationQueue;
  CATSharingBroadcastConnection *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  CATSharingBroadcastConnection *v14;
  id v15;
  id location;

  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (self->mInvalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSharingBroadcastTerminal.m"), 224, CFSTR("Terminal must not be invalidated"));

  }
  -[CATSharingBroadcastTerminal removePrimitiveHandlers](self, "removePrimitiveHandlers");
  v5 = [CATSharingBroadcastConnection alloc];
  mBroadcastPrimitive = self->mBroadcastPrimitive;
  v7 = (void *)objc_opt_new();
  v8 = -[CATSharingBroadcastConnection initWithBroadcastPrimitives:timerSource:](v5, "initWithBroadcastPrimitives:timerSource:", mBroadcastPrimitive, v7);

  objc_initWeak(&location, self);
  mDelegationQueue = self->mDelegationQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__CATSharingBroadcastTerminal_sessionHasPaired__block_invoke;
  v13[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v15, &location);
  v10 = v8;
  v14 = v10;
  -[CATOperationQueue addOperationWithBlock:](mDelegationQueue, "addOperationWithBlock:", v13);
  CATErrorWithCodeAndUserInfo(702, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATSharingBroadcastTerminal _invalidateWithError:removePrimitiveHandlers:deactivatePrimitives:](self, "_invalidateWithError:removePrimitiveHandlers:deactivatePrimitives:", v11, 0, 0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __47__CATSharingBroadcastTerminal_sessionHasPaired__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "broadcastTerminal:hasPairedDeviceConnection:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (BOOL)isBroadcasting
{
  return self->_broadcasting;
}

- (void)setBroadcasting:(BOOL)a3
{
  self->_broadcasting = a3;
}

- (CATOperationQueue)delegationQueue
{
  return self->_delegationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegationQueue, 0);
  objc_storeStrong((id *)&self->mDelegationQueue, 0);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_storeStrong((id *)&self->mBroadcastPrimitive, 0);
}

@end
