@implementation _DKSyncBlockCompositeOperation

- (_DWORD)initWithParent:(void *)a3 block:
{
  id v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)_DKSyncBlockCompositeOperation;
    v6 = objc_msgSendSuper2(&v13, sel_initWithParent_, a2);
    v7 = v6;
    if (v6)
    {
      v6[74] = 0;
      v8 = objc_opt_new();
      v9 = (void *)*((_QWORD *)v7 + 38);
      *((_QWORD *)v7 + 38) = v8;

      if (v5)
      {
        v10 = (void *)*((_QWORD *)v7 + 38);
        v11 = (void *)MEMORY[0x193FEEAF4](v5);
        objc_msgSend(v10, "addObject:", v11);

      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (_DWORD)blockCompositeOperationWithBlock:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  _DKSyncBlockCompositeOperation *v4;
  _DWORD *v5;
  id v7;

  v2 = a2;
  v3 = objc_opt_self();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: block is nil"), v3);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v4 = [_DKSyncBlockCompositeOperation alloc];
  if (v4)
    v5 = -[_DKSyncBlockCompositeOperation initWithParent:block:](v4, 0, v2);
  else
    v5 = 0;

  return v5;
}

- (id)executionBlocks
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_blocks, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)main
{
  void *v3;
  NSMutableArray *blocks;

  -[_DKSyncBlockCompositeOperation executionBlocks](self, "executionBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __DKSYNCBLOCKOPERATION_IS_CALLING_EXECUTION_BLOCKS__(v3);

  os_unfair_lock_lock(&self->_lock);
  blocks = self->_blocks;
  self->_blocks = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMutableArray)blocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 304, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
