@implementation _SYMultiSuspendableQueue

- (PBCodable)stateForLogging
{
  void *v3;
  void *v4;
  int *p_resumeCount;
  unsigned int v6;
  const char *label;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  p_resumeCount = &self->_resumeCount;
  do
    v6 = __ldaxr((unsigned int *)p_resumeCount);
  while (__stlxr(v6, (unsigned int *)p_resumeCount));
  objc_msgSend(v3, "setResumeCount:");
  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
  if (label)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", label);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLabel:", v8);

  }
  v9 = dispatch_queue_get_label((dispatch_queue_t)self->_targetQueue);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTarget:", v10);

  }
  return (PBCodable *)v4;
}

- (BOOL)isSuspended
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->_resumeCount);
  return v2 < 1;
}

- (_SYMultiSuspendableQueue)init
{
  return -[_SYMultiSuspendableQueue initWithName:qosClass:serial:target:](self, "initWithName:qosClass:serial:target:", 0, 21, 1, 0);
}

- (_SYMultiSuspendableQueue)initWithName:(id)a3 qosClass:(unsigned int)a4 serial:(BOOL)a5
{
  return -[_SYMultiSuspendableQueue initWithName:qosClass:serial:target:](self, "initWithName:qosClass:serial:target:", a3, *(_QWORD *)&a4, a5, 0);
}

- (_SYMultiSuspendableQueue)initWithName:(id)a3 qosClass:(unsigned int)a4 serial:(BOOL)a5 target:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  dispatch_queue_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v30;
  id location;
  objc_super v32;

  v10 = a3;
  v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)_SYMultiSuspendableQueue;
  v12 = -[_SYMultiSuspendableQueue init](&v32, sel_init);
  if (v12)
  {
    if (a5)
      v13 = 0;
    else
      v13 = MEMORY[0x24BDAC9C0];
    dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4)
    {
      dispatch_queue_attr_make_with_qos_class(v14, (dispatch_qos_class_t)a4, 0);
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = v16;
    }
    v17 = objc_retainAutorelease(v10);
    v18 = dispatch_queue_create_with_target_V2((const char *)objc_msgSend(v17, "UTF8String"), v15, v11);
    v19 = (void *)*((_QWORD *)v12 + 1);
    *((_QWORD *)v12 + 1) = v18;

    *((_QWORD *)v12 + 2) = v11;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s.%p"), objc_msgSend(objc_retainAutorelease(v17), "UTF8String"), v12);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v12 + 5);
    *((_QWORD *)v12 + 5) = v20;

    atomic_store(1u, (unsigned int *)v12 + 8);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v22 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG))
      -[_SYMultiSuspendableQueue initWithName:qosClass:serial:target:].cold.1((uint64_t *)v12 + 5, (unsigned int *)v12 + 8, v22);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    v24 = (void *)*((_QWORD *)v12 + 6);
    *((_QWORD *)v12 + 6) = v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    v26 = (void *)*((_QWORD *)v12 + 7);
    *((_QWORD *)v12 + 7) = v25;

    objc_initWeak(&location, v12);
    dispatch_get_global_queue(0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v30, &location);
    *((_QWORD *)v12 + 3) = os_state_add_handler();

    v28 = v12;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return (_SYMultiSuspendableQueue *)v12;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_8(&dword_211704000, a2, a3, "Queue %{public}@ deallocated while suspended", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (NSString)name
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", dispatch_queue_get_label((dispatch_queue_t)self->_queue));
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (unsigned)qosClass
{
  return dispatch_queue_get_qos_class((dispatch_queue_t)self->_queue, 0);
}

- (void)suspend
{
  int *p_resumeCount;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  NSString *logDescriptor;
  NSObject *v8;
  NSString *v9;
  unsigned int v10;
  void *v11;
  _SYMultiSuspendableQueue *v12;
  int v13;
  NSString *v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_resumeCount = &self->_resumeCount;
  do
  {
    v4 = __ldaxr((unsigned int *)p_resumeCount);
    v5 = v4 - 1;
  }
  while (__stlxr(v5, (unsigned int *)p_resumeCount));
  if (!v5)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      logDescriptor = self->_logDescriptor;
      v13 = 138543362;
      v14 = logDescriptor;
      _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@", (uint8_t *)&v13, 0xCu);
    }
    dispatch_suspend((dispatch_object_t)self->_queue);
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    v9 = self->_logDescriptor;
    v10 = atomic_load((unsigned int *)&self->_resumeCount);
    v13 = 138543618;
    v14 = v9;
    v15 = 1024;
    v16 = v10;
    _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_INFO, "%{public}@ resume count: %d", (uint8_t *)&v13, 0x12u);
  }
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self;
  objc_sync_enter(v12);
  -[NSMutableArray addObject:](v12->_latestSuspendBacktraces, "addObject:", v11);
  if ((unint64_t)-[NSMutableArray count](v12->_latestSuspendBacktraces, "count") >= 4)
    -[NSMutableArray removeObjectAtIndex:](v12->_latestSuspendBacktraces, "removeObjectAtIndex:", 0);
  objc_sync_exit(v12);

}

- (void)resume
{
  OUTLINED_FUNCTION_0_8(&dword_211704000, a2, a3, "Over-resume detected for queue %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)sync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_queue, a3);
}

- (void)async:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void)barrierSync:(id)a3
{
  dispatch_barrier_sync((dispatch_queue_t)self->_queue, a3);
}

- (void)barrierAsync:(id)a3
{
  dispatch_barrier_async((dispatch_queue_t)self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestResumeBacktraces, 0);
  objc_storeStrong((id *)&self->_latestSuspendBacktraces, 0);
  objc_storeStrong((id *)&self->_logDescriptor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithName:(os_log_t)log qosClass:serial:target:.cold.1(uint64_t *a1, unsigned int *a2, os_log_t log)
{
  uint64_t v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = atomic_load(a2);
  v5 = 138543618;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_debug_impl(&dword_211704000, log, OS_LOG_TYPE_DEBUG, "%{public}@ resume count: %d", (uint8_t *)&v5, 0x12u);
  OUTLINED_FUNCTION_2();
}

@end
