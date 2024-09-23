@implementation NSBlockOperation

- (void)main
{
  os_unfair_lock_s *p_lock;
  id block;
  void *v5;
  unint64_t v6;
  NSOperationQueue *v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  p_lock = &self->super._iop.__lock;
  os_unfair_lock_lock(&self->super._iop.__lock);
  block = self->_block;
  if (block)
  {
    v5 = _Block_copy(block);
    os_unfair_lock_unlock(p_lock);
    if (v5)
    {
      __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)v5);
      _Block_release(v5);
      return;
    }
    v6 = 0;
  }
  else
  {
    v6 = -[NSMutableArray count](self->_executionBlocks, "count");
    v5 = NSAllocateObjectArray(v6);
    -[NSMutableArray getObjects:range:](self->_executionBlocks, "getObjects:range:", v5, 0, v6);
    os_unfair_lock_unlock(p_lock);
  }
  v7 = +[NSOperationQueue currentQueue](NSOperationQueue, "currentQueue");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __24__NSBlockOperation_main__block_invoke;
  v8[3] = &unk_1E0F4FB00;
  v8[4] = v7;
  v8[5] = self;
  v8[6] = v5;
  dispatch_apply(v6, 0, v8);
  free(v5);
}

+ (NSBlockOperation)blockOperationWithBlock:(void *)block
{
  return (NSBlockOperation *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", block);
}

- (NSBlockOperation)initWithBlock:(id)a3
{
  NSBlockOperation *v5;
  NSBlockOperation *v6;
  NSString *v8;

  v5 = -[NSBlockOperation init](self, "init");
  v6 = v5;
  if (!a3)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: block is nil"), _NSMethodExceptionProem((objc_class *)v5, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0));
  }
  v5->_block = _Block_copy(a3);
  return v6;
}

- (NSBlockOperation)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSBlockOperation;
  return -[NSOperation init](&v3, sel_init);
}

- (void)dealloc
{
  id block;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  block = self->_block;
  if (block)
    _Block_release(block);
  v4.receiver = self;
  v4.super_class = (Class)NSBlockOperation;
  -[NSOperation dealloc](&v4, sel_dealloc);
}

- (void)addExecutionBlock:(void *)block
{
  NSMutableArray *executionBlocks;
  NSMutableArray *v7;
  void *v8;
  NSString *v9;

  if (!block)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: block is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_13:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v9, 0));
  }
  if (-[NSOperation isExecuting](self, "isExecuting") || -[NSOperation isFinished](self, "isFinished"))
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: blocks cannot be added after the operation has started executing or finished"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_13;
  }
  os_unfair_lock_lock(&self->super._iop.__lock);
  executionBlocks = self->_executionBlocks;
  if (self->_block)
  {
    if (!executionBlocks)
    {
      v7 = (NSMutableArray *)objc_opt_new();
      self->_executionBlocks = v7;
      -[NSMutableArray addObject:](v7, "addObject:", self->_block);
      _Block_release(self->_block);
      self->_block = 0;
    }
  }
  else if (!executionBlocks)
  {
    self->_block = _Block_copy(block);
    goto LABEL_9;
  }
  v8 = _Block_copy(block);
  -[NSMutableArray addObject:](self->_executionBlocks, "addObject:", v8);
  _Block_release(v8);
LABEL_9:
  os_unfair_lock_unlock(&self->super._iop.__lock);
}

uint64_t __24__NSBlockOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  _CFSetTSD();
  _CFSetTSD();
  __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * a2));
  _CFSetTSD();
  return _CFSetTSD();
}

- (NSArray)executionBlocks
{
  NSArray *v3;

  v3 = (NSArray *)(id)objc_opt_new();
  os_unfair_lock_lock(&self->super._iop.__lock);
  if (self->_block)
  {
    -[NSArray addObject:](v3, "addObject:");
  }
  else if (self->_executionBlocks)
  {
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  }
  os_unfair_lock_unlock(&self->super._iop.__lock);
  return v3;
}

@end
