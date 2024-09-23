@implementation DACheckSubscribedCalendarIsJunkContext

- (DACheckSubscribedCalendarIsJunkContext)initWithURLString:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  DACheckSubscribedCalendarIsJunkContext *v9;
  DACheckSubscribedCalendarIsJunkContext *v10;
  void *v11;
  id completionBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DACheckSubscribedCalendarIsJunkContext;
  v9 = -[DACheckSubscribedCalendarIsJunkContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_urlString, a3);
    v11 = _Block_copy(v8);
    completionBlock = v10->_completionBlock;
    v10->_completionBlock = v11;

  }
  return v10;
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
    v8[2] = __60__DACheckSubscribedCalendarIsJunkContext_finishedWithError___block_invoke;
    v8[3] = &unk_1E68DAD40;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

void __60__DACheckSubscribedCalendarIsJunkContext_finishedWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  objc_msgSend(v2, "urlString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v3 + 16))(v3, v4, objc_msgSend(*(id *)(a1 + 32), "junkStatus"), *(_QWORD *)(a1 + 40));

}

- (NSString)urlString
{
  return self->_urlString;
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

- (int64_t)junkStatus
{
  return self->_junkStatus;
}

- (void)setJunkStatus:(int64_t)a3
{
  self->_junkStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
