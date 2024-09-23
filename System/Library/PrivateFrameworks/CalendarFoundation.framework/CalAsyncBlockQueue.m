@implementation CalAsyncBlockQueue

- (CalAsyncBlockQueue)initWithBlockPerformer:(id)a3
{
  id v6;
  CalAsyncBlockQueue *v7;
  CalAsyncBlockQueue *v8;
  uint64_t v9;
  NSMutableSet *pendingBlocks;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalAsyncBlockQueue.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("blockPerformer != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CalAsyncBlockQueue;
  v7 = -[CalAsyncBlockQueue init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_blockPerformer, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    pendingBlocks = v8->_pendingBlocks;
    v8->_pendingBlocks = (NSMutableSet *)v9;

  }
  return v8;
}

- (void)performAsync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  CalAsyncBlockQueue *v13;
  id v14;

  v4 = a3;
  -[CalAsyncBlockQueue blockPerformer](self, "blockPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __35__CalAsyncBlockQueue_performAsync___block_invoke;
  v12 = &unk_1E2A84830;
  v13 = self;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsync:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalAsyncBlockQueue pendingBlocks](self, "pendingBlocks", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

uint64_t __35__CalAsyncBlockQueue_performAsync___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "pendingBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)performAfterDelay:(double)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  CalAsyncBlockQueue *v15;
  id v16;

  v6 = a4;
  -[CalAsyncBlockQueue blockPerformer](self, "blockPerformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __46__CalAsyncBlockQueue_performAfterDelay_block___block_invoke;
  v14 = &unk_1E2A84830;
  v15 = self;
  v16 = v6;
  v8 = v6;
  objc_msgSend(v7, "performAfterDelay:block:", &v11, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalAsyncBlockQueue pendingBlocks](self, "pendingBlocks", v11, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

}

uint64_t __46__CalAsyncBlockQueue_performAfterDelay_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "pendingBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cancelAllPendingBlocks
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CalAsyncBlockQueue pendingBlocks](self, "pendingBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[CalAsyncBlockQueue pendingBlocks](self, "pendingBlocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (CalAsyncBlockPerformer)blockPerformer
{
  return self->_blockPerformer;
}

- (NSMutableSet)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_blockPerformer, 0);
}

@end
