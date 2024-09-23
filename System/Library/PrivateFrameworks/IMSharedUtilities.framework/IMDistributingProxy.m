@implementation IMDistributingProxy

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  -[IMDistributingProxy targetQueue](self, "targetQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[IMDistributingProxy isAsynchronous](self, "isAsynchronous"))
    {
      objc_msgSend(v4, "retainArguments");
      -[IMDistributingProxy targetQueue](self, "targetQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19E26BC3C;
      block[3] = &unk_1E3FB4EF8;
      block[4] = self;
      v12 = v4;
      dispatch_async(v6, block);

      v7 = v12;
    }
    else
    {
      -[IMDistributingProxy targetQueue](self, "targetQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = sub_19E26BC48;
      v9[3] = &unk_1E3FB4EF8;
      v9[4] = self;
      v10 = v4;
      dispatch_sync(v8, v9);

      v7 = v10;
    }

  }
  else
  {
    sub_19E2424A4(self, v4);
  }

}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (NSArray)targets
{
  return self->_targets;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IMDistributingProxy targets](self, "targets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "methodSignatureForSelector:", a3);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (IMDistributingProxy)initWithTargets:(id)a3 targetQueue:(id)a4 asynchronous:(BOOL)a5 filterBlock:(id)a6
{
  OS_dispatch_queue *v10;
  id v11;
  NSArray *v12;
  NSArray *targets;
  OS_dispatch_queue *targetQueue;
  OS_dispatch_queue *v15;
  void *v16;
  id filterBlock;

  v10 = (OS_dispatch_queue *)a4;
  v11 = a6;
  v12 = (NSArray *)objc_msgSend(a3, "copy");
  targets = self->_targets;
  self->_targets = v12;

  targetQueue = self->_targetQueue;
  self->_targetQueue = v10;
  v15 = v10;

  self->_asynchronous = a5;
  v16 = (void *)objc_msgSend(v11, "copy");

  filterBlock = self->_filterBlock;
  self->_filterBlock = v16;

  return self;
}

- (IMDistributingProxy)initWithTargets:(id)a3
{
  return (IMDistributingProxy *)MEMORY[0x1E0DE7D20](self, sel_initWithTargets_targetQueue_asynchronous_filterBlock_);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[IMDistributingProxy targets](self, "targets", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isAsynchronous
{
  return self->_asynchronous;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

@end
