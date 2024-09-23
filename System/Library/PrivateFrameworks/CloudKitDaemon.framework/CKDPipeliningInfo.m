@implementation CKDPipeliningInfo

- (OS_dispatch_queue)perRequestCallbackQueue
{
  return self->_perRequestCallbackQueue;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (CKDURLRequestPipelining)request
{
  return self->_request;
}

- (OS_dispatch_group)perRequestGroup
{
  return self->_perRequestGroup;
}

- (BOOL)perRequestCallbackQueueSuspended
{
  return self->_perRequestCallbackQueueSuspended;
}

- (OS_dispatch_group)perRequestCallbackGroup
{
  return self->_perRequestCallbackGroup;
}

- (BOOL)isCancelled
{
  CKDPipeliningInfo *v2;
  BOOL isCancelled;

  v2 = self;
  objc_sync_enter(v2);
  isCancelled = v2->_isCancelled;
  objc_sync_exit(v2);

  return isCancelled;
}

- (CKDPipeliningInfo)initWithRequest:(id)a3 operation:(id)a4
{
  return (CKDPipeliningInfo *)MEMORY[0x1E0DE7D20](self, sel__initWithRequest_operation_, a3);
}

- (void)disablePerRequestCallbackBlocks
{
  NSMutableArray *perRequestCallbackBlocks;
  CKDPipeliningInfo *obj;

  obj = self;
  objc_sync_enter(obj);
  perRequestCallbackBlocks = obj->_perRequestCallbackBlocks;
  obj->_perRequestCallbackBlocks = 0;

  objc_sync_exit(obj);
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  if (objc_msgSend_perRequestCallbackQueueSuspended(self, a2, v2))
    dispatch_resume((dispatch_object_t)self->_perRequestCallbackQueue);
  v4.receiver = self;
  v4.super_class = (Class)CKDPipeliningInfo;
  -[CKDPipeliningInfo dealloc](&v4, sel_dealloc);
}

- (void)addPerRequestCallbackBlock:(id)a3
{
  CKDPipeliningInfo *v4;
  NSMutableArray *perRequestCallbackBlocks;
  void *v6;
  const char *v7;
  id aBlock;

  aBlock = a3;
  v4 = self;
  objc_sync_enter(v4);
  perRequestCallbackBlocks = v4->_perRequestCallbackBlocks;
  v6 = _Block_copy(aBlock);
  objc_msgSend_addObject_(perRequestCallbackBlocks, v7, (uint64_t)v6);

  objc_sync_exit(v4);
}

- (id)_initWithRequest:(id)a3 operation:(id)a4
{
  id v7;
  id v8;
  CKDPipeliningInfo *v9;
  CKDPipeliningInfo *v10;
  dispatch_group_t v11;
  OS_dispatch_group *perRequestCallbackGroup;
  dispatch_group_t v13;
  OS_dispatch_group *perRequestGroup;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *perRequestCallbackQueue;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSMutableArray *perRequestCallbackBlocks;
  objc_super v37;

  v7 = a3;
  v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CKDPipeliningInfo;
  v9 = -[CKDPipeliningInfo init](&v37, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    v11 = dispatch_group_create();
    perRequestCallbackGroup = v10->_perRequestCallbackGroup;
    v10->_perRequestCallbackGroup = (OS_dispatch_group *)v11;

    v13 = dispatch_group_create();
    perRequestGroup = v10->_perRequestGroup;
    v10->_perRequestGroup = (OS_dispatch_group *)v13;

    objc_msgSend_pipeliningDescription(v8, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("pipelining");
    if (v17)
      v19 = (__CFString *)v17;
    v20 = v19;

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v21, (uint64_t)CFSTR("com.apple.cloudkit.%@.callback.%p"), v20, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v27 = (const char *)objc_msgSend_UTF8String(v22, v25, v26);
    v28 = dispatch_queue_create(v27, v24);
    perRequestCallbackQueue = v10->_perRequestCallbackQueue;
    v10->_perRequestCallbackQueue = (OS_dispatch_queue *)v28;

    v30 = v10->_perRequestCallbackQueue;
    objc_msgSend_callbackQueue(v8, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v30, v33);

    dispatch_activate((dispatch_object_t)v10->_perRequestCallbackQueue);
    v34 = objc_opt_new();
    perRequestCallbackBlocks = v10->_perRequestCallbackBlocks;
    v10->_perRequestCallbackBlocks = (NSMutableArray *)v34;

    v10->_isCancelled = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perRequestCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_perRequestCallbackQueue, 0);
  objc_storeStrong((id *)&self->_perRequestGroup, 0);
  objc_storeStrong((id *)&self->_perRequestCallbackGroup, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_request, 0);
}

- (id)initForUnitTests
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__initWithRequest_operation_, 0);
}

- (void)cancelAndDisablePerRequestCallbackBlocks
{
  NSMutableArray *perRequestCallbackBlocks;
  CKDPipeliningInfo *obj;

  obj = self;
  objc_sync_enter(obj);
  perRequestCallbackBlocks = obj->_perRequestCallbackBlocks;
  if (perRequestCallbackBlocks)
    obj->_isCancelled = 1;
  obj->_perRequestCallbackBlocks = 0;

  objc_sync_exit(obj);
}

- (void)suspendCallbackQueue
{
  uint64_t v2;
  void *v5;
  const char *v6;

  if (self->_perRequestCallbackQueueSuspended)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 137, CFSTR("only one suspend is supported"));

  }
  objc_msgSend_setPerRequestCallbackQueueSuspended_(self, a2, 1);
  dispatch_suspend((dispatch_object_t)self->_perRequestCallbackQueue);
}

- (void)resumeCallbackQueue
{
  uint64_t v2;
  void *v5;
  const char *v6;

  if (!self->_perRequestCallbackQueueSuspended)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKDOperation.m"), 144, CFSTR("resume without a suspend"));

  }
  objc_msgSend_setPerRequestCallbackQueueSuspended_(self, a2, 0);
  dispatch_resume((dispatch_object_t)self->_perRequestCallbackQueue);
}

- (CKDOperationPipelining)operation
{
  return (CKDOperationPipelining *)objc_loadWeakRetained((id *)&self->_operation);
}

- (void)setOperation:(id)a3
{
  objc_storeWeak((id *)&self->_operation, a3);
}

- (void)setPerRequestCallbackGroup:(id)a3
{
  objc_storeStrong((id *)&self->_perRequestCallbackGroup, a3);
}

- (void)setPerRequestGroup:(id)a3
{
  objc_storeStrong((id *)&self->_perRequestGroup, a3);
}

- (void)setPerRequestCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_perRequestCallbackQueue, a3);
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (void)setPerRequestCallbackQueueSuspended:(BOOL)a3
{
  self->_perRequestCallbackQueueSuspended = a3;
}

- (NSMutableArray)perRequestCallbackBlocks
{
  return self->_perRequestCallbackBlocks;
}

- (void)setPerRequestCallbackBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_perRequestCallbackBlocks, a3);
}

@end
