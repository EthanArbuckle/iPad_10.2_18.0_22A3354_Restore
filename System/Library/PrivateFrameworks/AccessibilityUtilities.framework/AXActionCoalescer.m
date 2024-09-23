@implementation AXActionCoalescer

- (AXActionCoalescer)initWithQueue:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  AXActionCoalescer *v9;
  AXActionCoalescer *v10;
  uint64_t v11;
  id block;
  dispatch_queue_t v13;
  OS_dispatch_queue *consistencyQueue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXActionCoalescer;
  v9 = -[AXActionCoalescer init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetQueue, a3);
    v11 = objc_msgSend(v8, "copy");
    block = v10->_block;
    v10->_block = (id)v11;

    v13 = dispatch_queue_create("com.apple.accessibility.AXRunloopCoalescer", 0);
    consistencyQueue = v10->_consistencyQueue;
    v10->_consistencyQueue = (OS_dispatch_queue *)v13;

    v10->_coalescing = 0;
  }

  return v10;
}

+ (id)mainQueueCoalescerWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(v5, "initWithQueue:block:", MEMORY[0x1E0C80D38], v4);

  return v6;
}

- (void)performCoalescedAsynchronously
{
  NSObject *consistencyQueue;
  uint64_t v4;
  NSObject *targetQueue;
  _QWORD v6[5];
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  consistencyQueue = self->_consistencyQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke;
  block[3] = &unk_1E24C52F0;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(consistencyQueue, block);
  if (!*((_BYTE *)v9 + 24))
  {
    targetQueue = self->_targetQueue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke_2;
    v6[3] = &unk_1E24C4C38;
    v6[4] = self;
    dispatch_async(targetQueue, v6);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 32))
    *(_BYTE *)(v1 + 32) = 1;
  return result;
}

void __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke_3;
  block[3] = &unk_1E24C4C38;
  block[4] = v2;
  dispatch_sync(v3, block);
}

uint64_t __51__AXActionCoalescer_performCoalescedAsynchronously__block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consistencyQueue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

@end
