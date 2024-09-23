@implementation CSRequestQueue

- (CSRequestQueue)initWithLabel:(char *)a3 target:(id)a4 startBlock:(id)a5
{
  return -[CSRequestQueue initWithLabel:target:critical:startBlock:](self, "initWithLabel:target:critical:startBlock:", a3, a4, 0, a5);
}

- (void)enqueue:(id)a3
{
  id v4;
  qos_class_t v5;
  OS_dispatch_queue *v6;
  qos_class_t v7;
  dispatch_block_t v8;
  id v9;

  v4 = a3;
  v5 = qos_class_self();
  os_unfair_lock_lock(&self->_workItemsLock);
  if (self->_workItemsQoS >= v5)
  {
    -[NSMutableArray addObject:](self->_workItems, "addObject:", v4);

    os_unfair_lock_unlock(&self->_workItemsLock);
    dispatch_source_merge_data((dispatch_source_t)self->_workSource, 1uLL);
  }
  else
  {
    self->_workItemsQoS = v5;
    -[NSMutableArray addObject:](self->_workItems, "addObject:", v4);

    os_unfair_lock_unlock(&self->_workItemsLock);
    dispatch_source_merge_data((dispatch_source_t)self->_workSource, 1uLL);
    v6 = self->_workQueue;
    v7 = qos_class_self();
    if (v7 < 0x1A)
      v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_152);
    else
      v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v7, 0, &__block_literal_global_152);
    v9 = v8;
    dispatch_async((dispatch_queue_t)v6, v8);

  }
}

- (void)handleEvent
{
  unsigned int v3;
  void *v5;
  unsigned int v6;

  if (dispatch_source_get_data((dispatch_source_t)self->_workSource))
  {
    os_unfair_lock_lock(&self->_workItemsLock);
    if (self->_critical)
      v3 = 17;
    else
      v3 = 9;
    self->_workItemsQoS = v3;
    while (-[NSMutableArray count](self->_workItems, "count"))
    {
      if (atomic_load(&self->_suspended))
        break;
      -[NSMutableArray firstObject](self->_workItems, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_workItems, "removeObjectAtIndex:", 0);
      os_unfair_lock_unlock(&self->_workItemsLock);
      (*((void (**)(void))self->_startBlock + 2))();
      os_unfair_lock_lock(&self->_workItemsLock);

    }
    os_unfair_lock_unlock(&self->_workItemsLock);
  }
  else
  {
    if (self->_critical)
      v6 = 17;
    else
      v6 = 9;
    self->_workItemsQoS = v6;
  }
}

- (void)validate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
}

- (void)async:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_workQueue, a3);
}

- (void)suspend
{
  unsigned int *p_suspended;
  unsigned int v3;

  p_suspended = &self->_suspended;
  do
    v3 = __ldaxr(p_suspended);
  while (__stlxr(v3 + 1, p_suspended));
}

+ (id)_requestQueueAttribute:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  dispatch_qos_class_t v5;
  NSObject *v6;

  v3 = a3;
  if (_requestQueueAttribute__onceToken != -1)
    dispatch_once(&_requestQueueAttribute__onceToken, &__block_literal_global_28);
  if (_requestQueueAttribute__shouldPropagateQos)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
      v5 = QOS_CLASS_UTILITY;
    else
      v5 = QOS_CLASS_BACKGROUND;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, v5, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __41__CSRequestQueue__requestQueueAttribute___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _requestQueueAttribute__shouldPropagateQos = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.migrationpluginwrapper"));
}

- (CSRequestQueue)initWithLabel:(char *)a3 target:(id)a4 critical:(BOOL)a5 startBlock:(id)a6
{
  dispatch_queue_t *v10;
  id v11;
  unsigned __int8 *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  void *v19;
  int v20;
  dispatch_source_t v21;
  void *v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v10 = (dispatch_queue_t *)a4;
  v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CSRequestQueue;
  v12 = -[CSRequestQueue init](&v28, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    v14 = (void *)*((_QWORD *)v12 + 5);
    *((_QWORD *)v12 + 5) = v13;

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = (void *)*((_QWORD *)v12 + 6);
    *((_QWORD *)v12 + 6) = v15;

    *((_DWORD *)v12 + 8) = 0;
    v12[56] = a5;
    objc_msgSend((id)objc_opt_class(), "_requestQueueAttribute:", v12[56]);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v10)
      v18 = dispatch_queue_create_with_target_V2(a3, v17, v10[2]);
    else
      v18 = dispatch_queue_create(a3, v17);
    v19 = (void *)*((_QWORD *)v12 + 2);
    *((_QWORD *)v12 + 2) = v18;

    if (v12[56])
      v20 = 17;
    else
      v20 = 9;
    *((_DWORD *)v12 + 9) = v20;
    v21 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v12 + 2));
    v22 = (void *)*((_QWORD *)v12 + 3);
    *((_QWORD *)v12 + 3) = v21;

    if (v12[56])
      dispatch_set_qos_class_floor(*((dispatch_object_t *)v12 + 3), QOS_CLASS_UTILITY, 0);
    location = 0;
    objc_initWeak(&location, v12);
    v23 = *((_QWORD *)v12 + 3);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __59__CSRequestQueue_initWithLabel_target_critical_startBlock___block_invoke;
    v25[3] = &unk_1E2405060;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v23, v25);
    dispatch_source_set_cancel_handler(*((dispatch_source_t *)v12 + 3), &__block_literal_global_151);
    dispatch_activate(*((dispatch_object_t *)v12 + 3));
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return (CSRequestQueue *)v12;
}

void __59__CSRequestQueue_initWithLabel_target_critical_startBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleEvent");

}

- (void)resume
{
  unsigned int *p_suspended;
  unsigned int v3;
  unsigned int v4;

  p_suspended = &self->_suspended;
  do
  {
    v3 = __ldaxr(p_suspended);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, p_suspended));
  if (!v4)
    dispatch_source_merge_data((dispatch_source_t)self->_workSource, 1uLL);
}

- (void)async:(id)a3 critical:(BOOL)a4
{
  OS_dispatch_queue *v6;
  id v7;
  qos_class_t v8;
  BOOL v9;
  dispatch_block_t v10;
  dispatch_block_t block;

  v6 = self->_workQueue;
  v7 = a3;
  v8 = qos_class_self();
  v9 = v8 > QOS_CLASS_BACKGROUND && a4;
  if (v9 || v8 >= 0x1A)
    v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, v7);
  else
    v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  block = v10;

  dispatch_async((dispatch_queue_t)v6, block);
}

- (void)sync:(id)a3
{
  NSObject *workQueue;
  dispatch_block_t block;

  workQueue = self->_workQueue;
  block = a3;
  dispatch_assert_queue_not_V2(workQueue);
  dispatch_sync((dispatch_queue_t)self->_workQueue, block);

}

- (const)label
{
  return dispatch_queue_get_label((dispatch_queue_t)self->_workQueue);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workItems, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong((id *)&self->_workSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
