@implementation IMInvocationQueue

- (IMInvocationQueue)init
{
  IMInvocationQueue *v2;
  NSMutableArray *v3;
  NSMutableArray *queue;
  NSMutableArray *v5;
  NSMutableArray *options;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMInvocationQueue;
  v2 = -[IMInvocationQueue init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    queue = v2->_queue;
    v2->_queue = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    options = v2->_options;
    v2->_options = v5;

    v2->_holdQueue = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IMInvocationQueue;
  -[IMInvocationQueue dealloc](&v2, sel_dealloc);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  char v23;
  BOOL v24;

  v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6, v7);
  v10 = objc_msgSend__optionsForInvocation_(self, v8, (uint64_t)v4, v9);
  if (v10)
  {
    v14 = v10;
    if ((v10 & 0x10) != 0 && !objc_msgSend_count(self->_queue, v11, v12, v13))
    {
      objc_msgSend__invokeInvocation_(self, v11, (uint64_t)v4, v15);
    }
    else
    {
      v24 = objc_msgSend__enqueueInvocation_options_(self, v11, (uint64_t)v4, v14) == 0;
      if (objc_msgSend_wantsReturnValue(v4, v16, v17, v18))
        objc_msgSend_setReturnValue_(v4, v19, (uint64_t)&v24, v20);
    }
  }
  else if (objc_msgSend_wantsReturnValue(v4, v11, v12, v13))
  {
    v23 = 0;
    objc_msgSend_setReturnValue_(v4, v21, (uint64_t)&v23, v22);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v3;
  NSProtocolChecker *protocolChecker;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  protocolChecker = self->_protocolChecker;
  if (protocolChecker)
  {
    objc_msgSend_methodSignatureForSelector_(protocolChecker, a2, (uint64_t)a3, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_target(self, a2, (uint64_t)a3, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methodSignatureForSelector_(v8, v9, (uint64_t)a3, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setProtocol:(id)a3
{
  NSProtocolChecker *protocolChecker;
  id v5;
  const char *v6;
  uint64_t v7;
  NSProtocolChecker *v8;
  NSProtocolChecker *v9;
  id v10;

  v10 = a3;
  protocolChecker = self->_protocolChecker;
  self->_protocolChecker = 0;

  if (v10)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB38C0]);
    v8 = (NSProtocolChecker *)objc_msgSend_initWithProtocol_(v5, v6, (uint64_t)v10, v7);
    v9 = self->_protocolChecker;
    self->_protocolChecker = v8;

  }
}

- (Protocol)protocol
{
  uint64_t v2;
  uint64_t v3;

  return (Protocol *)objc_msgSend_protocol(self->_protocolChecker, a2, v2, v3);
}

- (void)setDequeueRate:(double)a3
{
  uint64_t v3;
  uint64_t v4;

  self->_dequeueRate = a3;
  objc_msgSend__setQueueTimer(self, a2, v3, v4);
}

- (void)_stepQueueNotification:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  if (_IMWillLog(CFSTR("InvocationQueue")))
    _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Stepping the queue per request"), v6, v7, v8, v9, v10, v11);
  objc_msgSend__checkQueue(self, v4, v5, v6);
}

- (void)_holdQueueNotification:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (_IMWillLog(CFSTR("InvocationQueue")))
    _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Holding the queue per request"), v5, v6, v7, v8, v9, v10);
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], v4, (uint64_t)self, (uint64_t)sel__checkQueue, 0);
  self->_holdQueue = 1;
}

- (void)_releaseQueueNotification:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  if (_IMWillLog(CFSTR("InvocationQueue")))
    _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Releasing the queue per request"), v6, v7, v8, v9, v10, v11);
  self->_holdQueue = 0;
  objc_msgSend__checkQueue(self, v4, v5, v6);
}

- (void)_setQueueTimer
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  char v10;

  if (!self->_holdQueue)
  {
    if (_IMWillLog(CFSTR("InvocationQueue")))
      _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Setting the queue timer"), v4, v5, v6, v7, v8, v10);
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], v3, (uint64_t)self, (uint64_t)sel__checkQueue, 0);
    if (self->_dequeueRate >= 0.0)
      objc_msgSend_performSelector_withObject_afterDelay_(self, v9, (uint64_t)sel__checkQueue, 0);
  }
}

- (BOOL)_invokeInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  BOOL v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v32;
  char v33;

  v4 = a3;
  if (_IMWillLog(CFSTR("InvocationQueue")))
  {
    objc_msgSend_target(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (const char *)objc_msgSend_selector(v4, v13, v14, v15);
    NSStringFromSelector(v16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("  - Invoking: -[%@ %@]"), v17, v18, v19, v20, v21, (char)v12);

  }
  objc_msgSend_target(self, v5, v6, v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invokeWithTarget_(v4, v23, (uint64_t)v22, v24);

  v25 = 1;
  v33 = 1;
  if (objc_msgSend_wantsReturnValue(v4, v26, v27, v28))
  {
    objc_msgSend_getReturnValue_(v4, v29, (uint64_t)&v33, v30);
    v25 = v33 != 0;
  }

  return v25;
}

- (void)_checkQueue
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  id v48;

  objc_msgSend_peek(self, a2, v2, v3);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  if (!v48)
    goto LABEL_21;
  if (_IMWillLog(CFSTR("InvocationQueue")))
  {
    v8 = objc_msgSend_count(self->_queue, v5, v6, v7);
    _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Seeing if I can dequeue... (Size: %d)"), v9, v10, v11, v12, v13, v8);
  }
  objc_msgSend_delegate(self, v5, v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_delegate(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_queue_shouldInvoke_(v18, v19, (uint64_t)self, (uint64_t)v48);

    if (!v20)
    {
      if (!_IMWillLog(CFSTR("InvocationQueue")))
        goto LABEL_17;
      v28 = CFSTR("  - Nope, delegate refused");
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (_IMWillLog(CFSTR("InvocationQueue")))
    _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("  - Dequeueing..."), v30, v31, v32, v33, v34, v47);
  if (objc_msgSend__invokeInvocation_(self, v29, (uint64_t)v48, v30))
  {
    v38 = (id)objc_msgSend__dequeueInvocation(self, v35, v36, v37);
    if (!_IMWillLog(CFSTR("InvocationQueue")))
      goto LABEL_17;
    v28 = CFSTR("  - Dequeued");
  }
  else
  {
    if (!_IMWillLog(CFSTR("InvocationQueue")))
      goto LABEL_17;
    v28 = CFSTR("  - Dequeue failed");
  }
LABEL_16:
  _IMAlwaysLog(0, CFSTR("InvocationQueue"), v28, v23, v24, v25, v26, v27, v47);
LABEL_17:
  if ((objc_msgSend_isEmpty(self, v21, v22, v23) & 1) != 0)
  {
    if (_IMWillLog(CFSTR("InvocationQueue")))
      _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Queue is now empty"), v42, v43, v44, v45, v46, v47);
  }
  else
  {
    objc_msgSend__setQueueTimer(self, v39, v40, v41);
  }
LABEL_21:

}

- (unint64_t)_optionsForInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  unint64_t v15;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend_delegate(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_queue_optionsForInvocation_(v13, v14, (uint64_t)self, (uint64_t)v4);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (int)_numberOfLimitedMessagesInQueue
{
  NSMutableArray *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  v3 = self->_queue;
  objc_sync_enter(v3);
  v7 = 0;
  v8 = 0;
  while (objc_msgSend_count(self->_queue, v4, v5, v6) > (unint64_t)v7)
  {
    objc_msgSend_objectAtIndex_(self->_options, v9, v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_unsignedIntegerValue(v11, v12, v13, v14);

    v8 += (v15 >> 3) & 1;
    ++v7;
  }
  objc_sync_exit(v3);

  return v8;
}

- (int)_maxQueueLimitSize
{
  int result;

  result = dword_1EE1DCA70;
  if (dword_1EE1DCA70 < 0)
  {
    result = IMGetAppIntForKey(CFSTR("MaxQueueSize"));
    if (!result)
      result = 3;
    dword_1EE1DCA70 = result;
  }
  return result;
}

- (BOOL)_acceptsOptions:(unint64_t)a3
{
  uint64_t v3;
  char v4;
  _BOOL4 v5;
  int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  if ((a3 & 8) != 0)
  {
    v17 = v4;
    v7 = objc_msgSend__numberOfLimitedMessagesInQueue(self, a2, a3, v3);
    if (v7 >= (int)objc_msgSend__maxQueueLimitSize(self, v8, v9, v10))
    {
      v5 = _IMWillLog(CFSTR("InvocationQueue"));
      if (v5)
      {
        _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("   Nope, we're full"), v11, v12, v13, v14, v15, v17);
        LOBYTE(v5) = 0;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_replaceSimilarInvocation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int i;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v5 = self->_queue;
  objc_sync_enter(v5);
  for (i = 0; ; ++i)
  {
    v12 = objc_msgSend_count(self->_queue, v6, v7, v8);
    if (v12 <= i)
      break;
    objc_msgSend_objectAtIndex_(self->_queue, v10, i, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_selector(v13, v14, v15, v16);
    if (v17 == objc_msgSend_selector(v4, v18, v19, v20))
    {
      objc_msgSend_replaceObjectAtIndex_withObject_(self->_queue, v21, i, (uint64_t)v4);
      if (_IMWillLog(CFSTR("InvocationQueue")))
      {
        v25 = (const char *)objc_msgSend_selector(v4, v22, v23, v24);
        NSStringFromSelector(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Replacing previous invocation with selector: %@ at %d"), v27, v28, v29, v30, v31, (char)v26);

      }
      break;
    }

  }
  objc_sync_exit(v5);

  return v12 > i;
}

- (BOOL)_insertInvocation:(id)a3 options:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int i;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  NSMutableArray *options;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = a3;
  v7 = self->_queue;
  objc_sync_enter(v7);
  for (i = 0; ; ++i)
  {
    v14 = objc_msgSend_count(self->_queue, v8, v9, v10);
    if (v14 <= i)
      break;
    objc_msgSend_objectAtIndex_(self->_options, v12, i, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);

    if ((v19 & 2) == 0)
    {
      objc_msgSend_insertObject_atIndex_(self->_queue, v8, (uint64_t)v6, i);
      options = self->_options;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v21, a4, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_insertObject_atIndex_(options, v24, (uint64_t)v23, i);

      if (_IMWillLog(CFSTR("InvocationQueue")))
      {
        v28 = (const char *)objc_msgSend_selector(v6, v25, v26, v27);
        NSStringFromSelector(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Inserting limited message (%@) at %d"), v30, v31, v32, v33, v34, (char)v29);

      }
      break;
    }
  }
  objc_sync_exit(v7);

  return v14 > i;
}

- (int64_t)_enqueueInvocation:(id)a3 options:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  NSMutableArray *options;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;

  v6 = a3;
  objc_msgSend_retainArguments(v6, v7, v8, v9);
  if (!objc_msgSend__acceptsOptions_(self, v10, a4, v11))
  {
    v17 = 2;
    goto LABEL_12;
  }
  if ((a4 & 4) == 0)
  {
    if ((a4 & 2) != 0 && (objc_msgSend__insertInvocation_options_(self, v12, (uint64_t)v6, a4) & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if ((objc_msgSend__replaceSimilarInvocation_(self, v12, (uint64_t)v6, v13) & 1) == 0)
  {
LABEL_8:
    v18 = self->_queue;
    objc_sync_enter(v18);
    objc_msgSend_addObject_(self->_queue, v19, (uint64_t)v6, v20);
    options = self->_options;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v22, a4, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(options, v25, (uint64_t)v24, v26);

    objc_sync_exit(v18);
  }
LABEL_9:
  if (!self->_holdQueue)
    objc_msgSend__checkQueue(self, v14, v15, v16);
  v17 = 0;
LABEL_12:

  return v17;
}

- (id)_dequeueInvocation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  if ((objc_msgSend_isEmpty(self, a2, v2, v3) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend___imFirstObject(self->_queue, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_IMWillLog(CFSTR("InvocationQueue")))
    {
      objc_msgSend___imFirstObject(self->_options, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15);
      _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Dequeueing an invocation with options: %-8x"), v17, v18, v19, v20, v21, v16);

    }
    v22 = self->_queue;
    objc_sync_enter(v22);
    objc_msgSend_removeFirstObject(self->_queue, v23, v24, v25);
    objc_msgSend_removeFirstObject(self->_options, v26, v27, v28);
    objc_sync_exit(v22);

  }
  return v8;
}

- (void)removeAllInvocations
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *obj;

  if (_IMWillLog(CFSTR("InvocationQueue")))
  {
    v6 = objc_msgSend_count(self->_queue, v3, v4, v5);
    _IMAlwaysLog(0, CFSTR("InvocationQueue"), CFSTR("Emptying queue of size: %d"), v7, v8, v9, v10, v11, v6);
  }
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], v3, (uint64_t)self, (uint64_t)sel__checkQueue, 0);
  obj = self->_queue;
  objc_sync_enter(obj);
  objc_msgSend_removeAllObjects(self->_queue, v12, v13, v14);
  objc_msgSend_removeAllObjects(self->_options, v15, v16, v17);
  objc_sync_exit(obj);

}

- (void)invokeAll
{
  uint64_t v2;
  uint64_t v3;
  BOOL holdQueue;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  holdQueue = self->_holdQueue;
  self->_holdQueue = 1;
  if ((objc_msgSend_isEmpty(self, a2, v2, v3) & 1) == 0)
  {
    do
      objc_msgSend__checkQueue(self, v6, v7, v8);
    while (!objc_msgSend_isEmpty(self, v9, v10, v11));
  }
  self->_holdQueue = holdQueue;
}

- (unint64_t)count
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_queue, a2, v2, v3);
}

- (BOOL)isEmpty
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_queue, a2, v2, v3) == 0;
}

- (id)peek
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if ((objc_msgSend_isEmpty(self, a2, v2, v3) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend___imFirstObject(self->_queue, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = a3;
}

- (double)dequeueRate
{
  return self->_dequeueRate;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (NSMutableArray)options
{
  return self->_options;
}

- (NSProtocolChecker)protocolChecker
{
  return self->_protocolChecker;
}

- (BOOL)holdQueue
{
  return self->_holdQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolChecker, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
