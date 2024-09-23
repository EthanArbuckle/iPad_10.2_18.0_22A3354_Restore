@implementation MTPromiseCompletionBlocks

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
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

- (void)flushCompletionBlocksWithPromiseResult:(id)a3
{
  id v4;
  MTPromiseCompletionBlocks *v5;
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

  v19 = *MEMORY[0x24BDAC8D0];
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

- (void)addCompletionBlock:(id)a3
{
  MTPromiseCompletionBlocks *v4;
  NSMutableArray *completionBlocks;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  completionBlocks = v4->_completionBlocks;
  v6 = (void *)objc_msgSend(v7, "copy");
  -[NSMutableArray addObject:](completionBlocks, "addObject:", v6);

  objc_sync_exit(v4);
}

- (MTPromiseCompletionBlocks)init
{
  MTPromiseCompletionBlocks *v2;
  NSMutableArray *v3;
  NSMutableArray *completionBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPromiseCompletionBlocks;
  v2 = -[MTPromiseCompletionBlocks init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

  }
  return v2;
}

uint64_t __43__MTPromiseCompletionBlocks_addErrorBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)addErrorBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__MTPromiseCompletionBlocks_addErrorBlock___block_invoke;
  v6[3] = &unk_24C7A03F8;
  v7 = v4;
  v5 = v4;
  -[MTPromiseCompletionBlocks addCompletionBlock:](self, "addCompletionBlock:", v6);

}

uint64_t __45__MTPromiseCompletionBlocks_addSuccessBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__MTPromiseCompletionBlocks_addSuccessBlock___block_invoke;
  v6[3] = &unk_24C7A03F8;
  v7 = v4;
  v5 = v4;
  -[MTPromiseCompletionBlocks addCompletionBlock:](self, "addCompletionBlock:", v6);

}

uint64_t __64__MTPromiseCompletionBlocks_callSuccessBlock_withPromiseResult___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __62__MTPromiseCompletionBlocks_callErrorBlock_withPromiseResult___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
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
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__MTPromiseCompletionBlocks_callSuccessBlock_withPromiseResult___block_invoke;
  v8[3] = &unk_24C7A03F8;
  v9 = v6;
  v7 = v6;
  -[MTPromiseCompletionBlocks callCompletionBlock:withPromiseResult:](self, "callCompletionBlock:withPromiseResult:", v8, a4);

}

- (void)callErrorBlock:(id)a3 withPromiseResult:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__MTPromiseCompletionBlocks_callErrorBlock_withPromiseResult___block_invoke;
  v8[3] = &unk_24C7A03F8;
  v9 = v6;
  v7 = v6;
  -[MTPromiseCompletionBlocks callCompletionBlock:withPromiseResult:](self, "callCompletionBlock:withPromiseResult:", v8, a4);

}

@end
