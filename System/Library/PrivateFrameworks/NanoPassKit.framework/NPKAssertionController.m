@implementation NPKAssertionController

- (NPKAssertionController)initWithAssertionFactory:(id)a3 invalidator:(id)a4
{
  id v6;
  id v7;
  NPKAssertionController *v8;
  uint64_t v9;
  id assertionFactory;
  uint64_t v11;
  id assertionInvalidator;
  uint64_t v13;
  NSMapTable *assertionMaps;
  dispatch_queue_t v15;
  OS_dispatch_queue *internalQueue;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPKAssertionController;
  v8 = -[NPKAssertionController init](&v18, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x2199B6780](v6);
    assertionFactory = v8->_assertionFactory;
    v8->_assertionFactory = (id)v9;

    v11 = MEMORY[0x2199B6780](v7);
    assertionInvalidator = v8->_assertionInvalidator;
    v8->_assertionInvalidator = (id)v11;

    objc_msgSend(MEMORY[0x24BDD1650], "pk_weakPointerPersonalityToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    assertionMaps = v8->_assertionMaps;
    v8->_assertionMaps = (NSMapTable *)v13;

    v15 = dispatch_queue_create("com.apple.NanoPassbook.alert.assertionManager", 0);
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v15;

  }
  return v8;
}

- (void)createAssertionForOwnerObject:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NPKAssertionController_createAssertionForOwnerObject_withReason___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(internalQueue, block);

}

void __67__NPKAssertionController_createAssertionForOwnerObject_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  NPKAssertionWrapper *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  NPKAssertionWrapper *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NPKAssertionWrapper initWithAssertion:invalidator:]([NPKAssertionWrapper alloc], "initWithAssertion:invalidator:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "_inQueue_releaseAssertionWithOwner:", *(_QWORD *)(a1 + 48));
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138412546;
      v9 = v3;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Obtained assertion:%@ for Owner:%@", (uint8_t *)&v8, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

}

- (void)releaseAssertionFromOwnerObject:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__NPKAssertionController_releaseAssertionFromOwnerObject___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __58__NPKAssertionController_releaseAssertionFromOwnerObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_releaseAssertionWithOwner:", *(_QWORD *)(a1 + 40));
}

- (void)releaseAssertionFromOwnerObject:(id)a3 withDelay:(double)a4
{
  -[NPKAssertionController _releaseAssertionFromOwnerObject:withDelay:completion:](self, "_releaseAssertionFromOwnerObject:withDelay:completion:", a3, 0, a4);
}

- (void)_releaseAssertionFromOwnerObject:(id)a3 withDelay:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__NPKAssertionController__releaseAssertionFromOwnerObject_withDelay_completion___block_invoke;
  v13[3] = &unk_24CFEBE90;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

void __80__NPKAssertionController__releaseAssertionFromOwnerObject_withDelay_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v7 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412802;
        v17 = v2;
        v18 = 2112;
        v19 = v6;
        v20 = 2048;
        v21 = v7;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Scheduled to invalidate assertion:%@ for owner:%@ with delay:%f", buf, 0x20u);
      }

    }
    v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v11 = *(NSObject **)(v9 + 32);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __80__NPKAssertionController__releaseAssertionFromOwnerObject_withDelay_completion___block_invoke_34;
    v12[3] = &unk_24CFE86A0;
    v12[4] = v9;
    v13 = v10;
    v14 = v2;
    v15 = *(id *)(a1 + 48);
    dispatch_after(v8, v11, v12);

  }
}

void __80__NPKAssertionController__releaseAssertionFromOwnerObject_withDelay_completion___block_invoke_34(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 48), "invalidateAssertionExpected:", 1);
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2)
  {
    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 48);
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Invalidated assertion:%@", (uint8_t *)&v10, 0xCu);
      }

    }
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
  else if (v4)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Fail scheduled invalidation assertion:%@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)_inQueue_releaseAssertionWithOwner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NSMapTable objectForKey:](self->_assertionMaps, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "invalidateAssertionExpected:", 1);
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      if (v9)
      {
        pk_General_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412546;
          v13 = v6;
          v14 = 2112;
          v15 = v4;
          v11 = "Notice: Invalidated assertion:%@ for owner:%@";
LABEL_9:
          _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = v6;
        v14 = 2112;
        v15 = v4;
        v11 = "Notice: Fail scheduled invalidation assertion:%@ for owner:%@";
        goto LABEL_9;
      }
LABEL_10:

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_assertionMaps, 0);
  objc_storeStrong(&self->_assertionInvalidator, 0);
  objc_storeStrong(&self->_assertionFactory, 0);
}

@end
