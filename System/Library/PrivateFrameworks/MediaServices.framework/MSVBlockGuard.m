@implementation MSVBlockGuard

- (MSVBlockGuard)initWithDeallocHandler:(id)a3
{
  id v4;
  id v5;
  MSVBlockGuard *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__MSVBlockGuard_initWithDeallocHandler___block_invoke;
  v8[3] = &unk_1E43E9D88;
  v9 = v4;
  v5 = v4;
  v6 = -[MSVBlockGuard initWithTimeout:interruptionHandler:](self, "initWithTimeout:interruptionHandler:", v8, 0.0);

  return v6;
}

- (MSVBlockGuard)initWithTimeout:(double)a3 interruptionHandler:(id)a4
{
  id v6;
  MSVBlockGuard *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  uint64_t v10;
  id interruptionHandler;
  void *v12;
  uint64_t v13;
  MSVTimer *timeoutTimer;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MSVBlockGuard;
  v7 = -[MSVBlockGuard init](&v19, sel_init);
  if (v7)
  {
    v8 = dispatch_queue_create("com.apple.MediaServices/MSVBlockGuard/access", 0);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v8;

    v10 = MEMORY[0x1A1AFBD28](v6);
    interruptionHandler = v7->_interruptionHandler;
    v7->_interruptionHandler = (id)v10;

    if (a3 > 0.0)
    {
      objc_initWeak(&location, v7);
      dispatch_get_global_queue(21, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __53__MSVBlockGuard_initWithTimeout_interruptionHandler___block_invoke;
      v16[3] = &unk_1E43E9DF0;
      objc_copyWeak(&v17, &location);
      +[MSVTimer timerWithInterval:repeats:queue:block:](MSVTimer, "timerWithInterval:repeats:queue:block:", 0, v12, v16, a3);
      v13 = objc_claimAutoreleasedReturnValue();
      timeoutTimer = v7->_timeoutTimer;
      v7->_timeoutTimer = (MSVTimer *)v13;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[MSVBlockGuard _interruptWithReason:](self, "_interruptWithReason:", 1);
  v3.receiver = self;
  v3.super_class = (Class)MSVBlockGuard;
  -[MSVBlockGuard dealloc](&v3, sel_dealloc);
}

- (void)_interruptWithReason:(int64_t)a3
{
  NSObject *accessQueue;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5185;
  v11 = __Block_byref_object_dispose__5186;
  v12 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MSVBlockGuard__interruptWithReason___block_invoke;
  block[3] = &unk_1E43E9E18;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v5 = v8[5];
  if (v5)
    (*(void (**)(uint64_t, int64_t))(v5 + 16))(v5, a3);
  _Block_object_dispose(&v7, 8);

}

void __38__MSVBlockGuard__interruptWithReason___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = a1[4];
  if (!*(_BYTE *)(v1 + 16))
  {
    v3 = *(_QWORD *)(v1 + 32);
    if (v3)
    {
      if (!a1[6])
      {
        *(_BYTE *)(v1 + 17) = 1;
        v3 = *(_QWORD *)(a1[4] + 32);
      }
      v4 = MEMORY[0x1A1AFBD28](v3);
      v5 = *(_QWORD *)(a1[5] + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

- (BOOL)disarm
{
  NSObject *accessQueue;
  BOOL v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MSVBlockGuard_disarm__block_invoke;
  block[3] = &unk_1E43E9E40;
  block[4] = self;
  block[5] = &v6;
  block[6] = &v10;
  dispatch_sync(accessQueue, block);
  v3 = 0;
  if (!*((_BYTE *)v11 + 24))
    v3 = *((_BYTE *)v7 + 24) == 0;
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

void __23__MSVBlockGuard_disarm__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 16);
  *(_BYTE *)(a1[4] + 16) = 1;
  objc_msgSend(*(id *)(a1[4] + 24), "invalidate");
  v2 = a1[4];
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = a1[4];
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 17);
}

- (MSVBlockGuard)init
{
  MSVBlockGuard *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSVBlockGuard;
  v2 = -[MSVBlockGuard init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaServices/MSVBlockGuard/access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (MSVBlockGuard)initWithTimeout:(double)a3
{
  return -[MSVBlockGuard initWithTimeout:interruptionHandler:](self, "initWithTimeout:interruptionHandler:", &__block_literal_global_5192, a3);
}

void __53__MSVBlockGuard_initWithTimeout_interruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_interruptWithReason:", 0);

}

uint64_t __40__MSVBlockGuard_initWithDeallocHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
