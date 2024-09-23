@implementation CNCancelationToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationBlocks, 0);
}

- (CNCancelationToken)init
{
  CNCancelationToken *v2;
  NSMutableArray *v3;
  NSMutableArray *cancelationBlocks;
  CNCancelationToken *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNCancelationToken;
  v2 = -[CNCancelationToken init](&v7, sel_init);
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
  CNCancelationToken *v4;
  NSMutableArray *cancelationBlocks;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_isCanceled)
  {
    objc_sync_exit(v4);

    v8[2]();
  }
  else
  {
    cancelationBlocks = v4->_cancelationBlocks;
    v6 = (void *)objc_msgSend(v8, "copy");
    v7 = _Block_copy(v6);
    -[NSMutableArray addObject:](cancelationBlocks, "addObject:", v7);

    objc_sync_exit(v4);
  }

}

- (void)addCancelable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_67);
    v5 = CNGuardOSLog_cn_once_object_0_4;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT))
      -[CNCancelationToken addCancelable:].cold.1(v5);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CNCancelationToken_addCancelable___block_invoke;
  v7[3] = &unk_1E29B9358;
  v8 = v4;
  v6 = v4;
  -[CNCancelationToken addCancelationBlock:](self, "addCancelationBlock:", v7);

}

- (BOOL)isCanceled
{
  CNCancelationToken *v2;
  BOOL isCanceled;

  v2 = self;
  objc_sync_enter(v2);
  isCanceled = v2->_isCanceled;
  objc_sync_exit(v2);

  return isCanceled;
}

- (void)cancel
{
  CNCancelationToken *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  -[CNCancelationToken nts_cancel](v2, "nts_cancel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  -[CNCancelationToken callCancelationBlocks:](v2, "callCancelationBlocks:", v3);
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

- (id)nts_cancel
{
  void *v2;
  NSMutableArray *cancelationBlocks;

  if (self->_isCanceled)
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
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

uint64_t __36__CNCancelationToken_addCancelable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __46__CNCancelationToken_tokenWrappingCancelable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
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
  v8[2] = __46__CNCancelationToken_tokenWrappingCancelable___block_invoke;
  v8[3] = &unk_1E29B9358;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "tokenWithCancelationBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)performBlock:(id)a3
{
  CNCancelationToken *v4;
  _BOOL4 isCanceled;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  isCanceled = v4->_isCanceled;
  objc_sync_exit(v4);

  v6 = v7;
  if (v7 && !isCanceled)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

+ (id)tokenWithCancelationBlock:(id)a3
{
  id v3;
  CNWrappingCancelableToken *v4;

  v3 = a3;
  v4 = objc_alloc_init(CNWrappingCancelableToken);
  -[CNCancelationToken addCancelationBlock:](v4, "addCancelationBlock:", v3);

  return v4;
}

- (void)addCancelable:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18F80C000, log, OS_LOG_TYPE_FAULT, "parameter ‘cancelable’ must be nonnull", v1, 2u);
}

@end
