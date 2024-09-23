@implementation NPKDoubleClickClientSuppressor

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__NPKDoubleClickClientSuppressor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, block);
  return (id)sharedInstance_sharedInstance_3;
}

void __48__NPKDoubleClickClientSuppressor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v1;

}

- (NPKDoubleClickClientSuppressor)init
{
  NPKDoubleClickClientSuppressor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *suppressorQueue;
  NSObject *v5;
  _QWORD block[4];
  NPKDoubleClickClientSuppressor *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NPKDoubleClickClientSuppressor;
  v2 = -[NPKDoubleClickClientSuppressor init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.nanopasskit.NPKDoubleClickClientSuppressor", 0);
    suppressorQueue = v2->_suppressorQueue;
    v2->_suppressorQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_suppressorQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__NPKDoubleClickClientSuppressor_init__block_invoke;
    block[3] = &unk_24CFE7998;
    v8 = v2;
    dispatch_sync(v5, block);

  }
  return v2;
}

void __38__NPKDoubleClickClientSuppressor_init__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NPKDoubleClickClientSuppressor suppressionAssertion](self, "suppressionAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateWithCompletion:", 0);

  v4.receiver = self;
  v4.super_class = (Class)NPKDoubleClickClientSuppressor;
  -[NPKDoubleClickClientSuppressor dealloc](&v4, sel_dealloc);
}

+ (unint64_t)requestDoubleClickClientSuppressionWithResponseHandler:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  +[NPKDoubleClickClientSuppressor sharedInstance](NPKDoubleClickClientSuppressor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requestDoubleClickClientSuppressionWithResponseHandler:", v3);

  return v5;
}

+ (void)endDoubleClickClientSuppressionWithRequestToken:(unint64_t)a3
{
  id v4;

  +[NPKDoubleClickClientSuppressor sharedInstance](NPKDoubleClickClientSuppressor, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDoubleClickClientSuppressionWithRequestToken:", a3);

}

+ (BOOL)isSuppressingDoubleClickClients
{
  void *v2;
  char v3;

  +[NPKDoubleClickClientSuppressor sharedInstance](NPKDoubleClickClientSuppressor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuppressingDoubleClickClients");

  return v3;
}

- (unint64_t)requestDoubleClickClientSuppressionWithResponseHandler:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  unint64_t v7;
  _QWORD block[6];
  id v10;
  BOOL v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = -[NPKDoubleClickClientSuppressor isSuppressingDoubleClickClients](self, "isSuppressingDoubleClickClients");
  objc_initWeak(&location, self);
  -[NPKDoubleClickClientSuppressor suppressorQueue](self, "suppressorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__NPKDoubleClickClientSuppressor_requestDoubleClickClientSuppressionWithResponseHandler___block_invoke;
  block[3] = &unk_24CFEBDF0;
  objc_copyWeak(&v10, &location);
  block[4] = self;
  block[5] = &v13;
  v11 = v5;
  dispatch_sync(v6, block);

  -[NPKDoubleClickClientSuppressor _acquireSuppressionAssertionIfNeededWithCompletion:](self, "_acquireSuppressionAssertionIfNeededWithCompletion:", v4);
  v7 = v14[3];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __89__NPKDoubleClickClientSuppressor_requestDoubleClickClientSuppressionWithResponseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "nextSuppressionRequestToken");
  objc_msgSend(WeakRetained, "setNextSuppressionRequestToken:", v3 + 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if (!*(_BYTE *)(a1 + 56))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__NPKDoubleClickClientSuppressor_requestDoubleClickClientSuppressionWithResponseHandler___block_invoke_2;
    block[3] = &unk_24CFE7998;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __89__NPKDoubleClickClientSuppressor_requestDoubleClickClientSuppressionWithResponseHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSuppressionStateChanged");
}

- (void)endDoubleClickClientSuppressionWithRequestToken:(unint64_t)a3
{
  BOOL v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8[2];
  BOOL v9;
  id location;

  v5 = -[NPKDoubleClickClientSuppressor isSuppressingDoubleClickClients](self, "isSuppressingDoubleClickClients");
  objc_initWeak(&location, self);
  -[NPKDoubleClickClientSuppressor suppressorQueue](self, "suppressorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__NPKDoubleClickClientSuppressor_endDoubleClickClientSuppressionWithRequestToken___block_invoke;
  v7[3] = &unk_24CFEBE18;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v9 = v5;
  dispatch_async(v6, v7);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __82__NPKDoubleClickClientSuppressor_endDoubleClickClientSuppressionWithRequestToken___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "suppressionRequestTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeIndex:", *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(a1 + 48))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__NPKDoubleClickClientSuppressor_endDoubleClickClientSuppressionWithRequestToken___block_invoke_2;
    block[3] = &unk_24CFE7998;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  objc_msgSend(WeakRetained, "suppressionRequestTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    objc_msgSend(WeakRetained, "suppressionAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateWithCompletion:", 0);

  }
}

uint64_t __82__NPKDoubleClickClientSuppressor_endDoubleClickClientSuppressionWithRequestToken___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSuppressionStateChanged");
}

- (BOOL)isSuppressingDoubleClickClients
{
  NSObject *v3;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  -[NPKDoubleClickClientSuppressor suppressorQueue](self, "suppressorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__NPKDoubleClickClientSuppressor_isSuppressingDoubleClickClients__block_invoke;
  block[3] = &unk_24CFEBE40;
  objc_copyWeak(&v6, &location);
  block[4] = &v8;
  dispatch_sync(v3, block);

  LOBYTE(v3) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)v3;
}

void __65__NPKDoubleClickClientSuppressor_isSuppressingDoubleClickClients__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "suppressionRequestTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "suppressionRequestTokens");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "count") != 0;

  }
}

- (void)_acquireSuppressionAssertionIfNeededWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  -[NPKDoubleClickClientSuppressor suppressionAssertion](self, "suppressionAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (-[NPKDoubleClickClientSuppressor suppressionAssertion](self, "suppressionAssertion"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isAcquired"),
        v5,
        v6))
  {
    v7[2](v7, 0);
  }
  else
  {
    -[NPKDoubleClickClientSuppressor _acquireSuppressionAssertionWithCompletion:](self, "_acquireSuppressionAssertionWithCompletion:", v7);
  }

}

- (void)_acquireSuppressionAssertionWithCompletion:(id)a3
{
  NPKAssertion *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(id, uint64_t);

  v9 = (void (**)(id, uint64_t))a3;
  v4 = -[NPKAssertion initWithType:reason:]([NPKAssertion alloc], "initWithType:reason:", 0, CFSTR("Double click client suppression"));
  -[NPKDoubleClickClientSuppressor suppressionAssertion](self, "suppressionAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateWithCompletion:", 0);

  -[NPKDoubleClickClientSuppressor suppressionRequestTokens](self, "suppressionRequestTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[NPKDoubleClickClientSuppressor setSuppressionAssertion:](self, "setSuppressionAssertion:", v4);
    v8 = 0;
  }
  else
  {
    -[NPKAssertion invalidateWithCompletion:](v4, "invalidateWithCompletion:", 0);
    v8 = 1;
  }
  if (v9)
    v9[2](v9, v8);

}

- (void)_postSuppressionStateChanged
{
  id v2;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NPKDoubleClickClientSuppressionChangedNotification"), 0);

}

- (NPKAssertion)suppressionAssertion
{
  return self->_suppressionAssertion;
}

- (void)setSuppressionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suppressionAssertion, a3);
}

- (NSMutableIndexSet)suppressionRequestTokens
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSuppressionRequestTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)nextSuppressionRequestToken
{
  return self->_nextSuppressionRequestToken;
}

- (void)setNextSuppressionRequestToken:(unint64_t)a3
{
  self->_nextSuppressionRequestToken = a3;
}

- (OS_dispatch_queue)suppressorQueue
{
  return self->_suppressorQueue;
}

- (void)setSuppressorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_suppressorQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressorQueue, 0);
  objc_storeStrong((id *)&self->_suppressionRequestTokens, 0);
  objc_storeStrong((id *)&self->_suppressionAssertion, 0);
}

@end
