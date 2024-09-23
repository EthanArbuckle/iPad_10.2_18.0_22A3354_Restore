@implementation AMSPromiseCompletionBlocks

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

- (void)flushCompletionBlocksWithPromiseResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_completionBlockLock);
  v5 = (void *)-[NSMutableArray copy](self->_completionBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects");
  os_unfair_lock_unlock(&self->_completionBlockLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(v4, "result", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (AMSPromiseCompletionBlocks)init
{
  AMSPromiseCompletionBlocks *v2;
  AMSPromiseCompletionBlocks *v3;
  NSMutableArray *v4;
  NSMutableArray *completionBlocks;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSPromiseCompletionBlocks;
  v2 = -[AMSPromiseCompletionBlocks init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_completionBlockLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionBlocks = v3->_completionBlocks;
    v3->_completionBlocks = v4;

  }
  return v3;
}

- (void)callCompletionBlock:(id)a3 withPromiseResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "result");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, id, void *))a3 + 2))(v6, v8, v7);
}

uint64_t __65__AMSPromiseCompletionBlocks_callSuccessBlock_withPromiseResult___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)callSuccessBlock:(id)a3 withPromiseResult:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__AMSPromiseCompletionBlocks_callSuccessBlock_withPromiseResult___block_invoke;
  v8[3] = &unk_1E2544D50;
  v9 = v6;
  v7 = v6;
  -[AMSPromiseCompletionBlocks callCompletionBlock:withPromiseResult:](self, "callCompletionBlock:withPromiseResult:", v8, a4);

}

uint64_t __63__AMSPromiseCompletionBlocks_callErrorBlock_withPromiseResult___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)callErrorBlock:(id)a3 withPromiseResult:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__AMSPromiseCompletionBlocks_callErrorBlock_withPromiseResult___block_invoke;
  v8[3] = &unk_1E2544D50;
  v9 = v6;
  v7 = v6;
  -[AMSPromiseCompletionBlocks callCompletionBlock:withPromiseResult:](self, "callCompletionBlock:withPromiseResult:", v8, a4);

}

- (void)addCompletionBlock:(id)a3
{
  os_unfair_lock_s *p_completionBlockLock;
  id v5;
  NSMutableArray *completionBlocks;
  void *v7;

  p_completionBlockLock = &self->_completionBlockLock;
  v5 = a3;
  os_unfair_lock_lock(p_completionBlockLock);
  completionBlocks = self->_completionBlocks;
  v7 = (void *)objc_msgSend(v5, "copy");

  -[NSMutableArray addObject:](completionBlocks, "addObject:", v7);
  os_unfair_lock_unlock(p_completionBlockLock);
}

- (void)addErrorBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__AMSPromiseCompletionBlocks_addErrorBlock___block_invoke;
  v8[3] = &unk_1E2544D28;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[AMSPromiseCompletionBlocks addCompletionBlock:](self, "addCompletionBlock:", v8);

}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__AMSPromiseCompletionBlocks_addSuccessBlock___block_invoke;
  v8[3] = &unk_1E2544D28;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[AMSPromiseCompletionBlocks addCompletionBlock:](self, "addCompletionBlock:", v8);

}

void __44__AMSPromiseCompletionBlocks_addErrorBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = AMSSetLogKey(*(void **)(a1 + 32));
  v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = v6;
  }

}

void __46__AMSPromiseCompletionBlocks_addSuccessBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = AMSSetLogKey(*(void **)(a1 + 32));
  v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = v5;
  }

}

@end
