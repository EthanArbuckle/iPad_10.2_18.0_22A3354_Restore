@implementation CRXUDispatchQueue

- (CRXUDispatchQueue)initWithQueue:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  CRXUDispatchQueue *v9;
  CRXUDispatchQueue *v10;
  uint64_t v11;
  NSString *name;
  os_log_t v13;
  OS_os_log *log;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRXUDispatchQueue;
  v9 = -[CRXUDispatchQueue init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    if (v8)
    {
      v11 = objc_msgSend(v8, "copy");
      name = v10->_name;
      v10->_name = (NSString *)v11;

    }
    v13 = os_log_create(CRXULoggingSubsystem, CRXULoggingCategory);
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;

  }
  return v10;
}

+ (CRXUDispatchQueue)dispatchQueueWithQueue:(id)a3
{
  NSObject *v4;
  const char *label;
  void *v6;
  void *v7;

  v4 = a3;
  label = dispatch_queue_get_label(v4);
  if (label)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", label, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithQueue:name:", v4, v6);

  return (CRXUDispatchQueue *)v7;
}

- (void)dispatchSync:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v6 = v4;
  if (self->_tracingEnabled)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__CRXUDispatchQueue_dispatchSync___block_invoke;
    block[3] = &unk_250B042D0;
    block[4] = self;
    v8 = v4;
    dispatch_sync(queue, block);

  }
  else
  {
    dispatch_sync(queue, v4);
  }

}

void __34__CRXUDispatchQueue_dispatchSync___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[CRXUDispatchQueue dispatchSync:]_block_invoke";
    v12 = 1024;
    v13 = 80;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_239FC4000, v4, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> sync enter", (uint8_t *)&v10, 0x1Cu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[CRXUDispatchQueue dispatchSync:]_block_invoke";
    v12 = 1024;
    v13 = 82;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_239FC4000, v8, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> sync leave", (uint8_t *)&v10, 0x1Cu);

  }
}

- (void)dispatchAsync:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  queue = self->_queue;
  if (self->_tracingEnabled)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__CRXUDispatchQueue_dispatchAsync___block_invoke;
    v7[3] = &unk_250B042D0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_queue, v4);
  }

}

void __35__CRXUDispatchQueue_dispatchAsync___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[CRXUDispatchQueue dispatchAsync:]_block_invoke";
    v12 = 1024;
    v13 = 92;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_239FC4000, v4, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> async enter", (uint8_t *)&v10, 0x1Cu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[CRXUDispatchQueue dispatchAsync:]_block_invoke";
    v12 = 1024;
    v13 = 94;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_239FC4000, v8, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> async leave", (uint8_t *)&v10, 0x1Cu);

  }
}

- (void)afterDelay:(double)a3 dispatchAsync:(id)a4
{
  id v6;
  dispatch_time_t v7;
  dispatch_time_t v8;
  NSObject *queue;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v8 = v7;
  queue = self->_queue;
  if (self->_tracingEnabled)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__CRXUDispatchQueue_afterDelay_dispatchAsync___block_invoke;
    v10[3] = &unk_250B042D0;
    v10[4] = self;
    v11 = v6;
    dispatch_after(v8, queue, v10);

  }
  else
  {
    dispatch_after(v7, (dispatch_queue_t)self->_queue, v6);
  }

}

void __46__CRXUDispatchQueue_afterDelay_dispatchAsync___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[CRXUDispatchQueue afterDelay:dispatchAsync:]_block_invoke";
    v12 = 1024;
    v13 = 105;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_239FC4000, v4, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> async enter", (uint8_t *)&v10, 0x1Cu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[CRXUDispatchQueue afterDelay:dispatchAsync:]_block_invoke";
    v12 = 1024;
    v13 = 107;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_239FC4000, v8, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> async leave", (uint8_t *)&v10, 0x1Cu);

  }
}

- (void)dispatchBarrierSync:(id)a3
{
  dispatch_barrier_sync((dispatch_queue_t)self->_queue, a3);
}

- (void)dispatchBarrierAsync:(id)a3
{
  dispatch_barrier_async((dispatch_queue_t)self->_queue, a3);
}

- (void)assert
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRXUDispatchQueue name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)serialQueueWithName:(id)a3
{
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create(v5, v6);

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithQueue:name:", v7, v4);
  return v8;
}

+ (id)concurrentQueueWithName:(id)a3
{
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create(v5, v6);

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithQueue:name:", v7, v4);
  return v8;
}

+ (CRXUDispatchQueue)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__CRXUDispatchQueue_main__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (main_onceToken != -1)
    dispatch_once(&main_onceToken, block);
  return (CRXUDispatchQueue *)(id)main_mainQueue;
}

void __25__CRXUDispatchQueue_main__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = objc_msgSend(v1, "initWithQueue:name:", MEMORY[0x24BDAC9B8], CFSTR("<main>"));
  v3 = (void *)main_mainQueue;
  main_mainQueue = v2;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)tracingEnabled
{
  return self->_tracingEnabled;
}

- (void)setTracingEnabled:(BOOL)a3
{
  self->_tracingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
