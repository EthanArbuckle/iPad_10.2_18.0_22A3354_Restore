@implementation AMSUINetworkImageFetchOperation

- (AMSUINetworkImageFetchOperation)initWithURL:(id)a3 URLSession:(id)a4
{
  id v7;
  id v8;
  AMSUINetworkImageFetchOperation *v9;
  AMSUINetworkImageFetchOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUINetworkImageFetchOperation;
  v9 = -[AMSUINetworkImageFetchOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_URLSession, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("isCancelled"), 0);
}

- (BOOL)isExecuting
{
  BOOL v3;
  void *v4;

  if ((-[AMSUINetworkImageFetchOperation isCancelled](self, "isCancelled") & 1) != 0)
    return 0;
  -[AMSUINetworkImageFetchOperation sessionTask](self, "sessionTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "state") == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("isCancelled"), CFSTR("isExecuting"), 0);
}

- (BOOL)isFinished
{
  BOOL v3;
  void *v4;

  if ((-[AMSUINetworkImageFetchOperation isCancelled](self, "isCancelled") & 1) != 0)
    return 1;
  -[AMSUINetworkImageFetchOperation sessionTask](self, "sessionTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "state") == 3;

  return v3;
}

- (void)setQueuePriority:(int64_t)a3
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AMSUINetworkImageFetchOperation;
  -[AMSUIAssetFetchOperation setQueuePriority:](&v10, sel_setQueuePriority_);
  -[AMSUINetworkImageFetchOperation sessionTask](self, "sessionTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUINetworkImageFetchOperation _sessionTaskPriorityForQueuePriority:](self, "_sessionTaskPriorityForQueuePriority:", a3);
    v7 = v6;
    -[AMSUINetworkImageFetchOperation sessionTask](self, "sessionTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = v7;
    objc_msgSend(v8, "setPriority:", v9);

  }
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, void *);
  void *v19;
  id v20;
  id location;

  v3 = (void *)MEMORY[0x24BDD1840];
  -[AMSUINetworkImageFetchOperation url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[AMSUINetworkImageFetchOperation URLSession](self, "URLSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __40__AMSUINetworkImageFetchOperation_start__block_invoke;
  v19 = &unk_24CB50258;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v5, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUINetworkImageFetchOperation setSessionTask:](self, "setSessionTask:", v7, v16, v17, v18, v19);

  -[AMSUINetworkImageFetchOperation _sessionTaskPriorityForQueuePriority:](self, "_sessionTaskPriorityForQueuePriority:", -[AMSUINetworkImageFetchOperation queuePriority](self, "queuePriority"));
  v9 = v8;
  -[AMSUINetworkImageFetchOperation sessionTask](self, "sessionTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = v9;
  objc_msgSend(v10, "setPriority:", v11);

  -[AMSUINetworkImageFetchOperation sessionTask](self, "sessionTask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "state");

  v14 = -[AMSUINetworkImageFetchOperation isCancelled](self, "isCancelled") ^ 1;
  if (v13 != 2)
    v14 = 1;
  if (v14 == 1 && v13 == 1)
  {
    -[AMSUINetworkImageFetchOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    -[AMSUINetworkImageFetchOperation sessionTask](self, "sessionTask");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resume");

    -[AMSUINetworkImageFetchOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __40__AMSUINetworkImageFetchOperation_start__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_didCompleteTaskWithData:error:", v7, v6);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUINetworkImageFetchOperation;
  -[AMSUIAssetFetchOperation cancel](&v4, sel_cancel);
  -[AMSUINetworkImageFetchOperation sessionTask](self, "sessionTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (float)_sessionTaskPriorityForQueuePriority:(int64_t)a3
{
  unint64_t v3;
  __int128 v4;
  float result;

  *((_QWORD *)&v4 + 1) = a3;
  *(_QWORD *)&v4 = a3 + 8;
  v3 = v4 >> 2;
  result = 1.0;
  if (v3 <= 4)
    return flt_211254760[v3];
  return result;
}

- (void)_didCompleteTaskWithData:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AMSUINetworkImageFetchOperation *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if ((-[AMSUINetworkImageFetchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[AMSUINetworkImageFetchOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    -[AMSUINetworkImageFetchOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        -[AMSUINetworkImageFetchOperation _eagerlyDecompressImage:](self, "_eagerlyDecompressImage:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = self;
          v11 = v9;
          v12 = 0;
LABEL_9:
          -[AMSUIAssetFetchOperation _finishWithImage:error:](v10, "_finishWithImage:error:", v11, v12);

          goto LABEL_10;
        }
      }
LABEL_8:
      AMSError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self;
      v11 = 0;
      v12 = v9;
      goto LABEL_9;
    }
    if (!v6)
      goto LABEL_8;
    -[AMSUIAssetFetchOperation _finishWithImage:error:](self, "_finishWithImage:error:", 0, v6);
  }
LABEL_10:

}

- (id)_eagerlyDecompressImage:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGSize v12;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "scale");
  v9 = v8;
  v12.width = v5;
  v12.height = v7;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v9);
  objc_msgSend(v3, "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v10;
}

- (NSURLSessionTask)sessionTask
{
  return self->_sessionTask;
}

- (void)setSessionTask:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTask, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSURLSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_URLSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sessionTask, 0);
}

@end
