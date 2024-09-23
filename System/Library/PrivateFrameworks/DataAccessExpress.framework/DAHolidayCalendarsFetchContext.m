@implementation DAHolidayCalendarsFetchContext

- (DAHolidayCalendarsFetchContext)initWithResultsBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  DAHolidayCalendarsFetchContext *v8;
  void *v9;
  id resultsBlock;
  void *v11;
  id completionBlock;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DAHolidayCalendarsFetchContext;
  v8 = -[DAHolidayCalendarsFetchContext init](&v14, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v6);
    resultsBlock = v8->_resultsBlock;
    v8->_resultsBlock = v9;

    v11 = _Block_copy(v7);
    completionBlock = v8->_completionBlock;
    v8->_completionBlock = v11;

  }
  return v8;
}

- (void)resultsReturned:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (self->_resultsBlock)
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
    v8[2] = __50__DAHolidayCalendarsFetchContext_resultsReturned___block_invoke;
    v8[3] = &unk_1E68DAD40;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

uint64_t __50__DAHolidayCalendarsFetchContext_resultsReturned___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
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
    v8[2] = __52__DAHolidayCalendarsFetchContext_finishedWithError___block_invoke;
    v8[3] = &unk_1E68DAD40;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

uint64_t __52__DAHolidayCalendarsFetchContext_finishedWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

- (id)resultsBlock
{
  return self->_resultsBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
}

@end
