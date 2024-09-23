@implementation _CATArbitratorWaitToken

- (_CATArbitratorWaitToken)initWithDelegateQueue:(id)a3 completionBlock:(id)a4
{
  id v8;
  id v9;
  void *v10;
  _CATArbitratorWaitToken *v11;
  uint64_t v12;
  NSMutableDictionary *mTokenByKey;
  uint64_t v14;
  id mCompletionBlock;
  dispatch_group_t v16;
  OS_dispatch_group *mGroup;
  void *v19;
  void *v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 591, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegateQueue"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)_CATArbitratorWaitToken;
  v11 = -[_CATArbitratorWaitToken init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_opt_new();
    mTokenByKey = v11->mTokenByKey;
    v11->mTokenByKey = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->mDelegateQueue, a3);
    v14 = MEMORY[0x20BD10A78](v10);
    mCompletionBlock = v11->mCompletionBlock;
    v11->mCompletionBlock = (id)v14;

    v16 = dispatch_group_create();
    mGroup = v11->mGroup;
    v11->mGroup = (OS_dispatch_group *)v16;

  }
  return v11;
}

- (void)waitForRegistrationEntry:(id)a3 forKey:(id)a4 exclusive:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v9 = a4;
  v10 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 608, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

    v10 = 0;
  }
  objc_msgSend(v10, "waitForResourceWithExclusive:group:", v5, self->mGroup);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mTokenByKey, "setObject:forKeyedSubscript:", v11, v9);

}

- (void)resume
{
  NSObject *mDelegateQueue;
  NSObject *mGroup;
  _QWORD block[5];
  _QWORD v5[5];
  _CATArbitratorWaitToken *v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy_;
  v5[4] = __Block_byref_object_dispose_;
  v6 = self;
  mDelegateQueue = v6->mDelegateQueue;
  mGroup = v6->mGroup;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33___CATArbitratorWaitToken_resume__block_invoke;
  block[3] = &unk_24C1C58D8;
  block[4] = v5;
  dispatch_group_notify(mGroup, mDelegateQueue, block);
  _Block_object_dispose(v5, 8);

}

- (void)performCompletionBlock
{
  void *v3;
  NSMutableDictionary *mTokenByKey;
  id v5;
  id mCompletionBlock;
  NSMutableDictionary *v7;
  OS_dispatch_queue *mDelegateQueue;
  OS_dispatch_group *mGroup;
  id v10;
  _QWORD v11[4];
  id v12;

  if (-[_CATArbitratorWaitToken whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 0, 2))
  {
    v3 = (void *)objc_opt_new();
    mTokenByKey = self->mTokenByKey;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49___CATArbitratorWaitToken_performCompletionBlock__block_invoke;
    v11[3] = &unk_24C1C5900;
    v12 = v3;
    v5 = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mTokenByKey, "enumerateKeysAndObjectsUsingBlock:", v11);
    v10 = (id)objc_msgSend(v5, "copy");

  }
  else
  {
    if (!-[_CATArbitratorWaitToken whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 1, 2))
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[NSMutableDictionary allValues](self->mTokenByKey, "allValues");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeObjectsPerformSelector:", sel_invalidate);
    v10 = 0;
  }

LABEL_7:
  (*((void (**)(void))self->mCompletionBlock + 2))();
  mCompletionBlock = self->mCompletionBlock;
  self->mCompletionBlock = 0;

  -[NSMutableDictionary removeAllObjects](self->mTokenByKey, "removeAllObjects");
  v7 = self->mTokenByKey;
  self->mTokenByKey = 0;

  mDelegateQueue = self->mDelegateQueue;
  self->mDelegateQueue = 0;

  mGroup = self->mGroup;
  self->mGroup = 0;

}

- (void)cancel
{
  id v3;

  if (-[_CATArbitratorWaitToken whenStateIs:atomicallySwapWith:](self, "whenStateIs:atomicallySwapWith:", 0, 1))
  {
    -[NSMutableDictionary allValues](self->mTokenByKey, "allValues");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "makeObjectsPerformSelector:", sel_cancel);

  }
}

- (BOOL)whenStateIs:(int)a3 atomicallySwapWith:(int)a4
{
  int *p_mState;
  unsigned int v5;
  BOOL result;

  p_mState = &self->mState;
  while (1)
  {
    v5 = __ldaxr((unsigned int *)p_mState);
    if (v5 != a3)
      break;
    if (!__stlxr(a4, (unsigned int *)p_mState))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mCompletionBlock, 0);
  objc_storeStrong((id *)&self->mGroup, 0);
  objc_storeStrong((id *)&self->mDelegateQueue, 0);
  objc_storeStrong((id *)&self->mTokenByKey, 0);
}

@end
