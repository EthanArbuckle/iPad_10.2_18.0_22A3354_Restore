@implementation DATestQueue

+ (id)testQueueWithDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithDelegate:", v4);

  return v5;
}

- (void)enqueueTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[DATestQueueEntry queueEntryWithAttributes:parameters:completion:](DATestQueueEntry, "queueEntryWithAttributes:parameters:completion:", a3, a4, a5));
  -[DATestQueue _enqueueTestWithQueueEntry:](self, "_enqueueTestWithQueueEntry:", v6);

}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    if (!a3)
      -[DATestQueue _tickleTestQueue](self, "_tickleTestQueue");
  }
}

- (DATestQueue)initWithDelegate:(id)a3
{
  id v4;
  DATestQueue *v5;
  uint64_t v6;
  NSMutableArray *testQueue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DATestQueue;
  v5 = -[DATestQueue init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
    testQueue = v5->_testQueue;
    v5->_testQueue = (NSMutableArray *)v6;

    v5->_suspended = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)_tickleTestQueue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[DATestQueue suspended](self, "suspended"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DATestQueue _dequeueTest](self, "_dequeueTest"));
    if (v7)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue delegate](self, "delegate"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributes"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parameters"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "completion"));
      objc_msgSend(v3, "executeTestWithTestAttributes:parameters:completion:", v4, v5, v6);

    }
  }
}

- (void)_enqueueTestWithQueueEntry:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
  -[DATestQueue _tickleTestQueue](self, "_tickleTestQueue");

}

- (id)_dequeueTest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueue testQueue](self, "testQueue"));
    objc_msgSend(v8, "removeObjectAtIndex:", 0);

  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v3);

  return v7;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (NSMutableArray)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_testQueue, a3);
}

- (DATestQueueDelegate)delegate
{
  return (DATestQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_testQueue, 0);
}

@end
