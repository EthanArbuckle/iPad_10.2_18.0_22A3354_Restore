@implementation MTRAsyncCallbackWorkQueue

- (MTRAsyncCallbackWorkQueue)initWithContext:(id)context queue:(dispatch_queue_t)queue
{
  id v7;
  NSObject *v8;
  MTRAsyncCallbackWorkQueue *v9;
  MTRAsyncCallbackWorkQueue *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *items;
  objc_super v16;

  v7 = context;
  v8 = queue;
  v16.receiver = self;
  v16.super_class = (Class)MTRAsyncCallbackWorkQueue;
  v9 = -[MTRAsyncCallbackWorkQueue init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v9->_context, context);
    objc_storeStrong((id *)&v10->_queue, queue);
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    items = v10->_items;
    v10->_items = (NSMutableArray *)v13;

  }
  return v10;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_context(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_items(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v10, v11, v12);
  objc_msgSend_stringWithFormat_(v4, v14, (uint64_t)CFSTR("MTRAsyncCallbackWorkQueue context: %@ items count: %lu"), v7, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (void)enqueueWorkItem:(MTRAsyncCallbackQueueWorkItem *)item
{
  MTRAsyncCallbackQueueWorkItem *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint8_t v17[16];

  v4 = item;
  if (objc_msgSend_enqueued(v4, v5, v6))
  {
    sub_234117B80(0, "NotSpecified");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_ERROR, "MTRAsyncCallbackWorkQueue enqueueWorkItem: item cannot be enqueued twice", v17, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }
  else
  {
    objc_msgSend_markEnqueued(v4, v7, v8);
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend_setWorkQueue_(v4, v10, (uint64_t)self);
    objc_msgSend_items(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v13, v14, (uint64_t)v4);

    objc_msgSend__callNextReadyWorkItem(self, v15, v16);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  NSMutableArray *items;
  NSMutableArray *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_items;
  items = self->_items;
  self->_items = 0;

  os_unfair_lock_unlock(p_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend_cancel(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v12++), v8, v9, (_QWORD)v15);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend_removeAllObjects(v6, v13, v14);
}

- (void)_postProcessWorkItem:(id)a3 retry:(BOOL)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint8_t v24[16];
  uint8_t buf[16];

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (objc_msgSend_runningWorkItemCount(self, v8, v9))
  {
    objc_msgSend_items(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v12, v13, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v6)
    {
      if (!a4)
      {
        objc_msgSend_items(self, v16, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectAtIndex_(v20, v21, 0);

      }
      objc_msgSend_setRunningWorkItemCount_(self, v16, 0);
      objc_msgSend__callNextReadyWorkItem(self, v22, v23);
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_233BF3000, v18, OS_LOG_TYPE_ERROR, "MTRAsyncCallbackWorkQueue endWork: work item is not first on work queue", v24, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
    }

  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v19, OS_LOG_TYPE_ERROR, "MTRAsyncCallbackWorkQueue endWork: no work is running on work queue", buf, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)endWork:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__postProcessWorkItem_retry_, a3);
}

- (void)retryWork:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__postProcessWorkItem_retry_, a3);
}

- (void)_callNextReadyWorkItem
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  if (!objc_msgSend_runningWorkItemCount(self, a2, v2))
  {
    objc_msgSend_items(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_count(v6, v7, v8);

    if (v9)
    {
      objc_msgSend_setRunningWorkItemCount_(self, v10, 1);
      objc_msgSend_items(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v13, v14, v15);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_context(self, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_callReadyHandlerWithContext_(v20, v19, (uint64_t)v18);

    }
  }
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (id)context
{
  return self->_context;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (unint64_t)runningWorkItemCount
{
  return self->_runningWorkItemCount;
}

- (void)setRunningWorkItemCount:(unint64_t)a3
{
  self->_runningWorkItemCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_context, 0);
}

@end
