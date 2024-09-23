@implementation NACancelationToken

- (void)cancel
{
  NACancelationToken *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NACancelationToken nts_cancel](v2, "nts_cancel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  -[NACancelationToken callCancelationBlocks:](v2, "callCancelationBlocks:", v3);
}

- (id)nts_cancel
{
  void *v2;
  NSMutableArray *cancelationBlocks;

  if (self->_isCanceled)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self->_isCanceled = 1;
    v2 = (void *)-[NSMutableArray copy](self->_cancelationBlocks, "copy");
    cancelationBlocks = self->_cancelationBlocks;
    self->_cancelationBlocks = 0;

  }
  return v2;
}

- (void)callCancelationBlocks:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationBlocks, 0);
}

+ (id)tokenWithCancelationBlock:(id)a3
{
  id v3;
  NACancelationToken *v4;

  v3 = a3;
  v4 = objc_alloc_init(NACancelationToken);
  -[NACancelationToken addCancelationBlock:](v4, "addCancelationBlock:", v3);

  return v4;
}

- (NACancelationToken)init
{
  NACancelationToken *v2;
  NSMutableArray *v3;
  NSMutableArray *cancelationBlocks;
  NACancelationToken *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NACancelationToken;
  v2 = -[NACancelationToken init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cancelationBlocks = v2->_cancelationBlocks;
    v2->_cancelationBlocks = v3;

    v5 = v2;
  }

  return v2;
}

- (void)addCancelationBlock:(id)a3
{
  NACancelationToken *v4;
  NSMutableArray *cancelationBlocks;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_isCanceled)
  {
    objc_sync_exit(v4);

    v7[2]();
  }
  else
  {
    cancelationBlocks = v4->_cancelationBlocks;
    v6 = (void *)objc_msgSend(v7, "copy");
    -[NSMutableArray addObject:](cancelationBlocks, "addObject:", v6);

    objc_sync_exit(v4);
  }

}

- (BOOL)isCanceled
{
  NACancelationToken *v2;
  BOOL isCanceled;

  v2 = self;
  objc_sync_enter(v2);
  isCanceled = v2->_isCanceled;
  objc_sync_exit(v2);

  return isCanceled;
}

+ (id)tokenWrappingCancelable:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__NACancelationToken_tokenWrappingCancelable___block_invoke;
  v8[3] = &unk_1E6227D68;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "tokenWithCancelationBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __46__NACancelationToken_tokenWrappingCancelable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)addCancelable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__NACancelationToken_addCancelable___block_invoke;
  v6[3] = &unk_1E6227D68;
  v7 = v4;
  v5 = v4;
  -[NACancelationToken addCancelationBlock:](self, "addCancelationBlock:", v6);

}

uint64_t __36__NACancelationToken_addCancelable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
