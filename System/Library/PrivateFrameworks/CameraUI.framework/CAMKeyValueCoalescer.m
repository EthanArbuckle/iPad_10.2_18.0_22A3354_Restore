@implementation CAMKeyValueCoalescer

- (CAMKeyValueCoalescer)initWithInterval:(double)a3 handler:(id)a4
{
  id v6;
  CAMKeyValueCoalescer *v7;
  CAMKeyValueCoalescer *v8;
  uint64_t v9;
  id handler;
  NSMutableDictionary *v11;
  NSMutableDictionary *values;
  NSMutableDictionary *v13;
  NSMutableDictionary *previousValues;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *coalescingQueue;
  CAMKeyValueCoalescer *v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMKeyValueCoalescer;
  v7 = -[CAMKeyValueCoalescer init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->__interval = a3;
    v9 = objc_msgSend(v6, "copy");
    handler = v8->__handler;
    v8->__handler = (id)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    values = v8->__values;
    v8->__values = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    previousValues = v8->__previousValues;
    v8->__previousValues = v13;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.camera.key-value-coalescing", v15);
    coalescingQueue = v8->__coalescingQueue;
    v8->__coalescingQueue = (OS_dispatch_queue *)v16;

    v18 = v8;
  }

  return v8;
}

- (void)coalesceValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[CAMKeyValueCoalescer _coalescingQueue](self, "_coalescingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CAMKeyValueCoalescer_coalesceValue_forKeyPath___block_invoke;
    block[3] = &unk_1EA329360;
    block[4] = self;
    v11 = v6;
    v12 = v8;
    dispatch_async(v9, block);

  }
}

- (OS_dispatch_queue)_coalescingQueue
{
  return self->__coalescingQueue;
}

void __49__CAMKeyValueCoalescer_coalesceValue_forKeyPath___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  double v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  NSObject *v13;

  objc_msgSend(*(id *)(a1 + 32), "_values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "coalescingTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_coalescingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);

    objc_msgSend(*(id *)(a1 + 32), "_interval");
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v5, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __49__CAMKeyValueCoalescer_coalesceValue_forKeyPath___block_invoke_2;
    v11 = &unk_1EA328A40;
    v12 = *(_QWORD *)(a1 + 32);
    v3 = v5;
    v13 = v3;
    dispatch_source_set_event_handler(v3, &v8);
    dispatch_resume(v3);
    objc_msgSend(*(id *)(a1 + 32), "setCoalescingTimer:", v3, v8, v9, v10, v11, v12);

  }
}

- (NSMutableDictionary)_values
{
  return self->__values;
}

- (OS_dispatch_source)coalescingTimer
{
  return self->_coalescingTimer;
}

- (double)_interval
{
  return self->__interval;
}

- (void)setCoalescingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingTimer, a3);
}

uint64_t __49__CAMKeyValueCoalescer_coalesceValue_forKeyPath___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_pushCoalescedValues");
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCoalescingTimer:", 0);
}

- (void)_pushCoalescedValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *, void *);

  -[CAMKeyValueCoalescer _handler](self, "_handler");
  v7 = (void (**)(id, void *, void *))objc_claimAutoreleasedReturnValue();
  -[CAMKeyValueCoalescer _values](self, "_values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMKeyValueCoalescer _previousValues](self, "_previousValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    v6 = (void *)objc_msgSend(v4, "copy");
    v7[2](v7, v5, v6);

  }
  objc_msgSend(v4, "removeAllObjects");
  objc_msgSend(v4, "addEntriesFromDictionary:", v3);
  objc_msgSend(v3, "removeAllObjects");

}

- (id)_handler
{
  return self->__handler;
}

- (NSMutableDictionary)_previousValues
{
  return self->__previousValues;
}

- (void)flush
{
  NSObject *v3;
  _QWORD block[5];

  -[CAMKeyValueCoalescer _coalescingQueue](self, "_coalescingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CAMKeyValueCoalescer_flush__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_async(v3, block);

}

void __29__CAMKeyValueCoalescer_flush__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "coalescingTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v2);
    objc_msgSend(*(id *)(a1 + 32), "setCoalescingTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_pushCoalescedValues");
    v2 = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__coalescingQueue, 0);
  objc_storeStrong((id *)&self->__previousValues, 0);
  objc_storeStrong((id *)&self->__values, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong(&self->__handler, 0);
}

@end
