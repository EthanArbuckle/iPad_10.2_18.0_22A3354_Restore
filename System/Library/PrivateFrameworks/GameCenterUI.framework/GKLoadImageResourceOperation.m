@implementation GKLoadImageResourceOperation

+ (NSURLSession)URLSession
{
  if (URLSession_onceToken != -1)
    dispatch_once(&URLSession_onceToken, &__block_literal_global_11);
  return (NSURLSession *)(id)URLSession_URLSession;
}

void __42__GKLoadImageResourceOperation_URLSession__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("User-Agent");
  v1 = (void *)MEMORY[0x1E0CFDCA8];
  objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userAgentForProcessInfo:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setHTTPAdditionalHeaders:", v4);

  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)URLSession_URLSession;
  URLSession_URLSession = v5;

}

+ (OS_dispatch_queue)dataConsumerQueue
{
  if (dataConsumerQueue_onceToken != -1)
    dispatch_once(&dataConsumerQueue_onceToken, &__block_literal_global_6);
  return (OS_dispatch_queue *)(id)dataConsumerQueue_dataConsumerQueue;
}

void __49__GKLoadImageResourceOperation_dataConsumerQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("GameCenterUI.LoadImageResourceOperation.dataConsumerQueue", v2);
  v1 = (void *)dataConsumerQueue_dataConsumerQueue;
  dataConsumerQueue_dataConsumerQueue = (uint64_t)v0;

}

- (GKLoadImageResourceOperation)initWithURLRequest:(id)a3 URLSession:(id)a4 dataConsumer:(id)a5 dataConsumerQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GKLoadImageResourceOperation *v14;
  uint64_t v15;
  NSURLSessionDataTask *task;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)GKLoadImageResourceOperation;
  v14 = -[GKLoadImageResourceOperation init](&v21, sel_init);
  if (v14)
  {
    objc_initWeak(&location, v14);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __93__GKLoadImageResourceOperation_initWithURLRequest_URLSession_dataConsumer_dataConsumerQueue___block_invoke;
    v18[3] = &unk_1E59C5490;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v10, v18);
    v15 = objc_claimAutoreleasedReturnValue();
    task = v14->_task;
    v14->_task = (NSURLSessionDataTask *)v15;

    objc_storeStrong((id *)&v14->_dataConsumer, a5);
    objc_storeStrong((id *)&v14->_dataConsumerQueue, a6);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __93__GKLoadImageResourceOperation_initWithURLRequest_URLSession_dataConsumer_dataConsumerQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "didFinishTaskWithData:response:error:", v9, v8, v7);

}

- (GKLoadImageResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  GKLoadImageResourceOperation *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "URLSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dataConsumerQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GKLoadImageResourceOperation initWithURLRequest:URLSession:dataConsumer:dataConsumerQueue:](self, "initWithURLRequest:URLSession:dataConsumer:dataConsumerQueue:", v7, v8, v6, v9);

  return v10;
}

- (void)didFinishTaskWithData:(id)a3 response:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  GKLoadImageResourceOperation *v14;
  id v15;

  v7 = a3;
  v8 = a5;
  -[GKLoadImageResourceOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[GKLoadImageResourceOperation dataConsumerQueue](self, "dataConsumerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__GKLoadImageResourceOperation_didFinishTaskWithData_response_error___block_invoke;
  block[3] = &unk_1E59C54B8;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

  -[GKLoadImageResourceOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

void __69__GKLoadImageResourceOperation_didFinishTaskWithData_response_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "dataConsumer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 0;
    objc_msgSend(v4, "objectForData:error:", v5, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (v7)
    {
      v8 = 0;
      v9 = v7;
    }
    else
    {
      v8 = v6;
      v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "didCompleteWithResource:error:", v8, v9);

  }
  else
  {
    objc_msgSend(v2, "didCompleteWithResource:error:", 0, *(_QWORD *)(a1 + 48));
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isCancelled"), 0);
}

- (BOOL)isExecuting
{
  BOOL v3;
  void *v4;

  if ((-[GKLoadImageResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
    return 0;
  -[GKLoadImageResourceOperation task](self, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "state") == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("isCancelled"), CFSTR("isExecuting"), 0);
}

- (BOOL)isFinished
{
  BOOL v3;
  void *v4;

  if ((-[GKLoadImageResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
    return 1;
  -[GKLoadImageResourceOperation task](self, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "state") == 3;

  return v3;
}

- (void)setQueuePriority:(int64_t)a3
{
  __int128 v5;
  unint64_t v6;
  int v7;
  void *v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKLoadImageResourceOperation;
  -[GKLoadImageResourceOperation setQueuePriority:](&v10, sel_setQueuePriority_);
  *((_QWORD *)&v5 + 1) = a3;
  *(_QWORD *)&v5 = a3 + 8;
  v6 = (v5 >> 2) - 1;
  if (v6 > 3)
    v7 = 1045220557;
  else
    v7 = dword_1AB7F7F80[v6];
  -[GKLoadImageResourceOperation task](self, "task");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = v7;
  objc_msgSend(v8, "setPriority:", v9);

}

- (void)start
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  unint64_t v6;
  int v7;
  void *v8;
  double v9;
  void *v10;

  -[GKLoadImageResourceOperation task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if ((-[GKLoadImageResourceOperation isCancelled](self, "isCancelled") & 1) == 0 && v4 != 2)
  {
    if (v4 == 1)
    {
      -[GKLoadImageResourceOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
      *((_QWORD *)&v5 + 1) = -[GKLoadImageResourceOperation queuePriority](self, "queuePriority");
      *(_QWORD *)&v5 = *((_QWORD *)&v5 + 1) + 8;
      v6 = (v5 >> 2) - 1;
      if (v6 > 3)
        v7 = 1045220557;
      else
        v7 = dword_1AB7F7F80[v6];
      -[GKLoadImageResourceOperation task](self, "task");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = v7;
      objc_msgSend(v8, "setPriority:", v9);

      -[GKLoadImageResourceOperation task](self, "task");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resume");

      -[GKLoadImageResourceOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    }
    else
    {
      NSLog(CFSTR("*** Warning, %s called multiple times on %@"), "-[GKLoadImageResourceOperation start]", self);
    }
  }
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[GKLoadImageResourceOperation task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)GKLoadImageResourceOperation;
  -[GKLoadImageResourceOperation cancel](&v4, sel_cancel);
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (GKResourceDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (OS_dispatch_queue)dataConsumerQueue
{
  return self->_dataConsumerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataConsumerQueue, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
