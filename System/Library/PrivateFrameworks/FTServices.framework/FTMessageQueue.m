@implementation FTMessageQueue

- (FTMessageQueue)init
{
  FTMessageQueue *v2;
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  CUTDeferredTaskQueue *timeoutTask;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FTMessageQueue;
  v2 = -[FTMessageQueue init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D13200]);
    im_primary_queue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend_initWithCapacity_queue_block_(v3, v5, 1, v4, &unk_1E4DD9370);
    timeoutTask = v2->_timeoutTask;
    v2->_timeoutTask = (CUTDeferredTaskQueue *)v6;

  }
  return v2;
}

- (IDSBaseMessage)topMessage
{
  uint64_t v2;
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_count(self->_queue, a2, v2);
  if (v4)
  {
    objc_msgSend_objectAtIndex_(self->_queue, v5, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (IDSBaseMessage *)v4;
}

- (NSArray)messages
{
  return (NSArray *)self->_queue;
}

- (int64_t)count
{
  uint64_t v2;

  return objc_msgSend_count(self->_queue, a2, v2);
}

- (void)_clearTimeout
{
  ((void (*)(CUTDeferredTaskQueue *, char *))MEMORY[0x1E0DE7D20])(self->_timeoutTask, sel_cancelPendingExecutions);
}

- (void)_setTimeout
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  double v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  int v28;
  double v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend__clearTimeout(self, a2, v2);
  objc_msgSend_topMessage(self, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_delegate(self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend_objectAtIndex_(self->_addDates, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceNow(v11, v12, v13);
      v15 = fabs(v14);
      objc_msgSend_timeout(v8, v16, v17);
      v20 = v19 - v15;
      if (v20 <= 0.0)
      {
        v21 = 0.1;
        objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_timeoutTask, v18, (uint64_t)self, 0.1);
      }
      else
      {
        v21 = v20;
        objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_timeoutTask, v18, (uint64_t)self, v20);
      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_topMessage(self, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 134218242;
        v29 = v21;
        v30 = 2112;
        v31 = v27;
        _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, "Setting timeout for %f seconds from now  (Message: %@)", (uint8_t *)&v28, 0x16u);

      }
    }
  }

}

- (void)_timeoutHit
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_topMessage(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Queue timeout hit for message: %@", (uint8_t *)&v19, 0xCu);

  }
  objc_msgSend_delegate(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topMessage(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queue_hitTimeoutForMessage_(v10, v14, (uint64_t)self, v13);

  if (objc_msgSend_count(self->_queue, v15, v16))
    objc_msgSend__setTimeout(self, v17, v18);
}

- (void)removeAllMessages
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSMutableArray *queue;
  NSMutableArray *addDates;

  objc_msgSend__clearTimeout(self, a2, v2);
  objc_msgSend_removeAllObjects(self->_addDates, v4, v5);
  objc_msgSend_removeAllObjects(self->_queue, v6, v7);
  if (!objc_msgSend_count(self->_queue, v8, v9))
  {
    queue = self->_queue;
    self->_queue = 0;

  }
  if (!objc_msgSend_count(self->_addDates, v10, v11))
  {
    addDates = self->_addDates;
    self->_addDates = 0;

  }
}

- (id)dequeueTopMessage
{
  uint64_t v2;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSMutableArray *queue;
  NSMutableArray *addDates;

  if (objc_msgSend_count(self->_queue, a2, v2))
  {
    objc_msgSend_objectAtIndex_(self->_queue, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__clearTimeout(self, v6, v7);
    objc_msgSend_removeObjectAtIndex_(self->_queue, v8, 0);
    objc_msgSend_removeObjectAtIndex_(self->_addDates, v9, 0);
    if (objc_msgSend_count(self->_queue, v10, v11))
      objc_msgSend__setTimeout(self, v12, v13);
    if (!objc_msgSend_count(self->_queue, v12, v13))
    {
      queue = self->_queue;
      self->_queue = 0;

    }
    if (!objc_msgSend_count(self->_addDates, v14, v15))
    {
      addDates = self->_addDates;
      self->_addDates = 0;

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)messageForUniqueID:(unint64_t)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_msgSend_copy(self->_queue, a2, a3, 0);
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, v19, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend_uniqueID(v12, v7, v8) == a3)
        {
          v13 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)addMessage:(id)a3
{
  const char *v4;
  id v5;
  NSMutableArray *v6;
  NSMutableArray *queue;
  NSMutableArray *v8;
  NSMutableArray *addDates;
  NSMutableArray *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v5 = a3;
  if (!self->_queue)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    queue = self->_queue;
    self->_queue = v6;

  }
  if (!self->_addDates)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    addDates = self->_addDates;
    self->_addDates = v8;

  }
  objc_msgSend_addObject_(self->_queue, v4, (uint64_t)v5);
  v10 = self->_addDates;
  objc_msgSend_date(MEMORY[0x1E0C99D68], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v10, v14, (uint64_t)v13);

  if (objc_msgSend_count(self->_queue, v15, v16) == 1)
    objc_msgSend__setTimeout(self, v17, v18);

  return 1;
}

- (BOOL)addMessageAtHeadOfQueue:(id)a3
{
  const char *v4;
  id v5;
  NSMutableArray *v6;
  NSMutableArray *queue;
  NSMutableArray *v8;
  NSMutableArray *addDates;
  NSMutableArray *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v5 = a3;
  if (!self->_queue)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    queue = self->_queue;
    self->_queue = v6;

  }
  if (!self->_addDates)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    addDates = self->_addDates;
    self->_addDates = v8;

  }
  objc_msgSend_insertObject_atIndex_(self->_queue, v4, (uint64_t)v5, 0);
  v10 = self->_addDates;
  objc_msgSend_date(MEMORY[0x1E0C99D68], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_insertObject_atIndex_(v10, v14, (uint64_t)v13, 0);

  if (objc_msgSend_count(self->_queue, v15, v16) == 1)
    objc_msgSend__setTimeout(self, v17, v18);

  return 1;
}

- (BOOL)removeMessage:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSMutableArray *queue;
  NSMutableArray *addDates;

  v6 = a3;
  if (v6)
  {
    v7 = objc_msgSend_count(self->_queue, v4, v5);
    if (v7 - 1 < 0)
    {
      v11 = 0;
    }
    else
    {
      v10 = v7;
      v11 = 0;
      do
      {
        objc_msgSend_objectAtIndex_(self->_queue, v8, --v10);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          objc_msgSend_removeObjectAtIndex_(self->_queue, v8, v10);
          objc_msgSend_removeObjectAtIndex_(self->_addDates, v13, v10);
          v11 = 1;
        }
      }
      while (v10 > 0);
    }
    if (!objc_msgSend_count(self->_queue, v8, v9))
    {
      queue = self->_queue;
      self->_queue = 0;

    }
    if (!objc_msgSend_count(self->_addDates, v14, v15))
    {
      addDates = self->_addDates;
      self->_addDates = 0;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11 & 1;
}

- (NSMutableArray)_queue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)set_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)_addDates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_addDates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (FTMessageQueueDelegate)delegate
{
  return (FTMessageQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTask, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addDates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
