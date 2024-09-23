@implementation DOCOperationBuffer

- (DOCOperationBuffer)initWithLabel:(id)a3
{
  return -[DOCOperationBuffer initWithLabel:targetQueue:](self, "initWithLabel:targetQueue:", a3, MEMORY[0x24BDAC9B8]);
}

- (void)signal
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[DOCOperationBuffer locked](self, "locked"))
  {
    -[DOCOperationBuffer setLocked:](self, "setLocked:", 0);
    v3 = os_log_create("com.apple.DocumentManager", "PointsOfInterest");
    v4 = os_signpost_id_generate(v3);
    v5 = v3;
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_2090A2000, v6, OS_SIGNPOST_EVENT, v4, "Files-PostLaunchBuffer unlocked", (const char *)&unk_2090D48C7, v8, 2u);
    }

    -[DOCOperationBuffer queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v7);

  }
}

- (BOOL)locked
{
  return self->_locked;
}

- (void)buffer:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[DOCOperationBuffer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (OS_dispatch_queue)queue
{
  OS_dispatch_queue *queue;
  DOCOperationBuffer *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  OS_dispatch_queue *v9;

  queue = self->_queue;
  if (!queue)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_queue)
    {
      -[DOCOperationBuffer label](v4, "label");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("com.apple.DocumentManager.operationBuffer."), "stringByAppendingString:", v5);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);

      -[DOCOperationBuffer targetQueue](v4, "targetQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_set_target_queue(v7, v8);

      dispatch_suspend(v7);
      v9 = self->_queue;
      self->_queue = (OS_dispatch_queue *)v7;

    }
    objc_sync_exit(v4);

    queue = self->_queue;
  }
  return queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (NSString)label
{
  return self->_label;
}

- (DOCOperationBuffer)initWithLabel:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  DOCOperationBuffer *v8;
  DOCOperationBuffer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DOCOperationBuffer;
  v8 = -[DOCOperationBuffer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[DOCOperationBuffer setLocked:](v8, "setLocked:", 1);
    -[DOCOperationBuffer setLabel:](v9, "setLabel:", v6);
    -[DOCOperationBuffer setTargetQueue:](v9, "setTargetQueue:", v7);
  }

  return v9;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void)setTargetQueue:(id)a3
{
  objc_storeStrong((id *)&self->_targetQueue, a3);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
