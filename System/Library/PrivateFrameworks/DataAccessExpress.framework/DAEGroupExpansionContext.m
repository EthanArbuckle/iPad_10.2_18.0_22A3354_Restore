@implementation DAEGroupExpansionContext

- (DAEGroupExpansionContext)initWithCompletionBlock:(id)a3
{
  id v4;
  DAEGroupExpansionContext *v5;
  uint64_t v6;
  id completionBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAEGroupExpansionContext;
  v5 = -[DAEGroupExpansionContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completionBlock = v5->_completionBlock;
    v5->_completionBlock = (id)v6;

  }
  return v5;
}

- (void)finishedWithError:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v6 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__DAEGroupExpansionContext_finishedWithError___block_invoke;
    v8[3] = &unk_1E68DAD40;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

uint64_t __46__DAEGroupExpansionContext_finishedWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

- (NSString)principalPath
{
  return self->_principalPath;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (BOOL)shouldSyncCalendar
{
  return self->_shouldSyncCalendar;
}

- (void)setShouldSyncCalendar:(BOOL)a3
{
  self->_shouldSyncCalendar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_principalPath, 0);
}

@end
