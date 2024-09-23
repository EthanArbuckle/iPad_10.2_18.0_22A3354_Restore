@implementation _NAOperationQueueScheduler

- (_NAOperationQueueScheduler)initWithMaxConcurrentOperationCount:(unint64_t)a3
{
  _NAOperationQueueScheduler *v4;
  NSOperationQueue *v5;
  NSOperationQueue *queue;
  _NAOperationQueueScheduler *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NAOperationQueueScheduler;
  v4 = -[_NAOperationQueueScheduler init](&v9, sel_init);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v4->_queue;
    v4->_queue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_queue, "setMaxConcurrentOperationCount:", a3);
    v7 = v4;
  }

  return v4;
}

- (void)performBlock:(id)a3
{
  -[NSOperationQueue addOperationWithBlock:](self->_queue, "addOperationWithBlock:", a3);
}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  NACancelationToken *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NACancelationToken *v9;
  void *v10;
  NACancelationToken *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  _QWORD v19[4];
  NACancelationToken *v20;
  id v21;

  v4 = a3;
  v5 = objc_alloc_init(NACancelationToken);
  v6 = (void *)MEMORY[0x1E0CB34C8];
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53___NAOperationQueueScheduler_performCancelableBlock___block_invoke;
  v19[3] = &unk_1E62280B0;
  v8 = v4;
  v21 = v8;
  v9 = v5;
  v20 = v9;
  objc_msgSend(v6, "blockOperationWithBlock:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);
  v13 = v7;
  v14 = 3221225472;
  v15 = __53___NAOperationQueueScheduler_performCancelableBlock___block_invoke_2;
  v16 = &unk_1E6227E00;
  objc_copyWeak(&v17, &location);
  -[NACancelationToken addCancelationBlock:](v9, "addCancelationBlock:", &v13);
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v10, v13, v14, v15, v16);
  v11 = v9;
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  NACancelationToken *v7;
  void *v8;
  NACancelationToken *v9;
  id v10;
  id v11;
  void *v12;
  NACancelationToken *v13;
  _QWORD v15[4];
  NACancelationToken *v16;
  _NAOperationQueueScheduler *v17;
  id v18;

  v6 = a4;
  v7 = objc_alloc_init(NACancelationToken);
  +[NAScheduler globalAsyncScheduler](NAScheduler, "globalAsyncScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54___NAOperationQueueScheduler_afterDelay_performBlock___block_invoke;
  v15[3] = &unk_1E6228630;
  v9 = v7;
  v16 = v9;
  v17 = self;
  v18 = v6;
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "afterDelay:performBlock:", v15, a3);

  v12 = v18;
  v13 = v9;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
