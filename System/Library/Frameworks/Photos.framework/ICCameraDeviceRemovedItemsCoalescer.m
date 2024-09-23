@implementation ICCameraDeviceRemovedItemsCoalescer

- (ICCameraDeviceRemovedItemsCoalescer)initWithSource:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  ICCameraDeviceRemovedItemsCoalescer *v8;
  ICCameraDeviceRemovedItemsCoalescer *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  NSMutableArray *items;
  uint64_t v15;
  id block;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICCameraDeviceRemovedItemsCoalescer;
  v8 = -[ICCameraDeviceRemovedItemsCoalescer init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_source, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("ICCameraFileRemovedItemsCoalescer", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new();
    items = v9->_items;
    v9->_items = (NSMutableArray *)v13;

    v15 = objc_msgSend(v7, "copy");
    block = v9->_block;
    v9->_block = (id)v15;

  }
  return v9;
}

- (void)coalesceItems:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ICCameraDeviceRemovedItemsCoalescer_coalesceItems___block_invoke;
  v7[3] = &unk_1E35DF9E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_lastNotify, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

uint64_t __53__ICCameraDeviceRemovedItemsCoalescer_coalesceItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  dispatch_source_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD handler[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 8))
  {
    v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v2 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v7 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v6, v7, 0x5F5E100uLL, 0);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __53__ICCameraDeviceRemovedItemsCoalescer_coalesceItems___block_invoke_2;
    handler[3] = &unk_1E35DF110;
    handler[4] = v8;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

void __53__ICCameraDeviceRemovedItemsCoalescer_coalesceItems___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
    && (WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24)),
        WeakRetained,
        WeakRetained))
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
    v3 = objc_opt_new();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;
  }
  else
  {
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = 0;
  }

}

@end
