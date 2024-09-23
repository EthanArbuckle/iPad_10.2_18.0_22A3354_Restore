@implementation HMFBlockOperation

+ (id)blockOperationWithBlock:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)MEMORY[0x1A1AC373C](v4);

  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v5[39];
  v5[39] = v7;

  return v5;
}

- (HMFBlockOperation)initWithTimeout:(double)a3
{
  HMFBlockOperation *v3;
  HMFBlockOperation *v4;
  NSArray *executionBlocks;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMFBlockOperation;
  v3 = -[HMFOperation initWithTimeout:](&v7, sel_initWithTimeout_, a3);
  v4 = v3;
  if (v3)
  {
    executionBlocks = v3->_executionBlocks;
    v3->_executionBlocks = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v4;
}

- (NSArray)executionBlocks
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_executionBlocks;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addExecutionBlock:(id)a3
{
  id v4;
  NSArray *executionBlocks;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    os_unfair_lock_lock_with_options();
    if (self->super._executing || self->super._finished)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Operation is already executing or has finished."), 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v9);
    }
    executionBlocks = self->_executionBlocks;
    v6 = (void *)MEMORY[0x1A1AC373C](v10);
    -[NSArray arrayByAddingObject:](executionBlocks, "arrayByAddingObject:", v6);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_executionBlocks;
    self->_executionBlocks = v7;

    os_unfair_lock_unlock(&self->super._lock);
    v4 = v10;
  }

}

- (void)main
{
  void *v3;
  uint64_t v4;
  void *v5;
  HMFBlockOperation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *queue;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HMFBlockOperation executionBlocks](self, "executionBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (-[HMFOperation isExecuting](self, "isExecuting")
    && (-[HMFBlockOperation isCancelled](self, "isCancelled") & 1) == 0
    && v4)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v8;
      v25 = 2048;
      v26 = v4;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_INFO, "%{public}@Executing %tu blocks", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HMFBlockOperation executionBlocks](v6, "executionBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
          queue = v6->super._queue;
          block[0] = v13;
          block[1] = 3221225472;
          block[2] = __25__HMFBlockOperation_main__block_invoke;
          block[3] = &unk_1E3B38630;
          block[4] = v15;
          dispatch_async(queue, block);
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
}

uint64_t __25__HMFBlockOperation_main__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionBlocks, 0);
}

@end
