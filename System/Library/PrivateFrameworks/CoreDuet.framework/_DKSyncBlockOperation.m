@implementation _DKSyncBlockOperation

- (_DKSyncBlockOperation)init
{
  return -[_DKSyncBlockOperation initWithBlock:](self, "initWithBlock:", 0);
}

- (_DKSyncBlockOperation)initWithBlock:(id)a3
{
  id v4;
  _DKSyncBlockOperation *v5;
  _DKSyncBlockOperation *v6;
  uint64_t v7;
  NSMutableArray *blocks;
  NSMutableArray *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DKSyncBlockOperation;
  v5 = -[_DKSyncOperation init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    *((_DWORD *)&v5->super._state + 1) = 0;
    v7 = objc_opt_new();
    blocks = v6->_blocks;
    v6->_blocks = (NSMutableArray *)v7;

    if (v4)
    {
      v9 = v6->_blocks;
      v10 = (void *)MEMORY[0x193FEEAF4](v4);
      -[NSMutableArray addObject:](v9, "addObject:", v10);

    }
  }

  return v6;
}

+ (id)blockOperationWithBlock:(id)a3
{
  id v4;
  void *v5;
  _DKSyncBlockOperation *v6;
  id v8;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: block is nil"), a1);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v5 = v4;
  v6 = -[_DKSyncBlockOperation initWithBlock:]([_DKSyncBlockOperation alloc], "initWithBlock:", v4);

  return v6;
}

- (id)executionBlocks
{
  os_unfair_lock_s *v3;
  void *v4;

  v3 = (os_unfair_lock_s *)(&self->super._state + 4);
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._state + 1);
  v4 = (void *)-[NSMutableArray copy](self->_blocks, "copy");
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)addExecutionBlock:(id)a3
{
  NSMutableArray *blocks;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: block is nil"), self);
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  if (-[_DKSyncOperation isExecuting](self, "isExecuting")
    || -[_DKSyncOperation isFinished](self, "isFinished")
    || -[_DKSyncBlockOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: blocks cannot be added after the operation has started executing or finished or cancelled"), self);
    goto LABEL_8;
  }
  -[_DKSyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("executionBlocks"));
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._state + 1);
  blocks = self->_blocks;
  v5 = (void *)MEMORY[0x193FEEAF4](v7);
  -[NSMutableArray addObject:](blocks, "addObject:", v5);

  os_unfair_lock_unlock((os_unfair_lock_t)&self->super._state + 1);
  -[_DKSyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("executionBlocks"));

}

- (void)main
{
  void *v3;
  NSMutableArray *blocks;

  -[_DKSyncBlockOperation executionBlocks](self, "executionBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __DKSYNCBLOCKOPERATION_IS_CALLING_EXECUTION_BLOCKS__(v3);

  os_unfair_lock_lock((os_unfair_lock_t)&self->super._state + 1);
  blocks = self->_blocks;
  self->_blocks = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&self->super._state + 1);
}

- (BOOL)isAsynchronous
{
  return self->_lock._os_unfair_lock_opaque & 1;
}

- (void)setAsynchronous:(BOOL)a3
{
  LOBYTE(self->_lock._os_unfair_lock_opaque) = a3;
}

- (NSMutableArray)blocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
