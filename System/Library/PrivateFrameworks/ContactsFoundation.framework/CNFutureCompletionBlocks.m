@implementation CNFutureCompletionBlocks

- (CNFutureCompletionBlocks)init
{
  CNFutureCompletionBlocks *v2;
  NSMutableArray *v3;
  NSMutableArray *completionBlocks;
  CNFutureCompletionBlocks *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFutureCompletionBlocks;
  v2 = -[CNFutureCompletionBlocks init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)shouldCallImmediately
{
  CNFutureCompletionBlocks *v2;
  BOOL shouldCallImmediately;

  v2 = self;
  objc_sync_enter(v2);
  shouldCallImmediately = v2->_shouldCallImmediately;
  objc_sync_exit(v2);

  return shouldCallImmediately;
}

- (void)setShouldCallImmediately:(BOOL)a3
{
  CNFutureCompletionBlocks *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_shouldCallImmediately = a3;
  objc_sync_exit(obj);

}

- (void)addSuccessBlock:(id)a3 orCallWithFutureResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;

  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CNFutureCompletionBlocks_addSuccessBlock_orCallWithFutureResult___block_invoke;
  aBlock[3] = &unk_1E29BB168;
  v11 = v6;
  v7 = v6;
  v8 = a4;
  v9 = _Block_copy(aBlock);
  -[CNFutureCompletionBlocks addCompletionBlock:orCallWithFutureResult:](self, "addCompletionBlock:orCallWithFutureResult:", v9, v8);

}

uint64_t __67__CNFutureCompletionBlocks_addSuccessBlock_orCallWithFutureResult___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)addFailureBlock:(id)a3 orCallWithFutureResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;

  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CNFutureCompletionBlocks_addFailureBlock_orCallWithFutureResult___block_invoke;
  aBlock[3] = &unk_1E29BB168;
  v11 = v6;
  v7 = v6;
  v8 = a4;
  v9 = _Block_copy(aBlock);
  -[CNFutureCompletionBlocks addCompletionBlock:orCallWithFutureResult:](self, "addCompletionBlock:orCallWithFutureResult:", v9, v8);

}

uint64_t __67__CNFutureCompletionBlocks_addFailureBlock_orCallWithFutureResult___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)addCompletionBlock:(id)a3 orCallWithFutureResult:(id)a4
{
  id v6;
  CNFutureCompletionBlocks *v7;
  void *v8;
  NSMutableArray *completionBlocks;
  void *v10;
  void (**v11)(id, CNFutureCompletionBlocks *, void *);

  v11 = (void (**)(id, CNFutureCompletionBlocks *, void *))a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (v7->_shouldCallImmediately)
  {
    objc_sync_exit(v7);

    objc_msgSend(v6, "result");
    v7 = (CNFutureCompletionBlocks *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v7, v8);

  }
  else
  {
    completionBlocks = v7->_completionBlocks;
    v10 = (void *)objc_msgSend(v11, "copy");
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v10);

    objc_sync_exit(v7);
  }

}

- (void)flushCompletionBlocksWithFutureResult:(id)a3
{
  id v4;
  CNFutureCompletionBlocks *v5;
  void *v6;
  id v7;
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
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableArray copy](v5->_completionBlocks, "copy");
  -[NSMutableArray removeAllObjects](v5->_completionBlocks, "removeAllObjects");
  objc_sync_exit(v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(v4, "result", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

@end
