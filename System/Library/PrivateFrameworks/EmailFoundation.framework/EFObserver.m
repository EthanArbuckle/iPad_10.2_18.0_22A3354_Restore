@implementation EFObserver

+ (EFObserver)observerWithResultBlock:(id)a3
{
  id v3;
  _EFBlockObserver *v4;

  v3 = a3;
  v4 = -[_EFBlockObserver initWithResultBlock:completionBlock:failureBlock:]([_EFBlockObserver alloc], "initWithResultBlock:completionBlock:failureBlock:", v3, 0, 0);

  return (EFObserver *)v4;
}

+ (EFObserver)observerWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  _EFBlockObserver *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[_EFBlockObserver initWithResultBlock:completionBlock:failureBlock:]([_EFBlockObserver alloc], "initWithResultBlock:completionBlock:failureBlock:", v7, v8, v9);

  return (EFObserver *)v10;
}

+ (EFObserver)observerWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  +[EFPromise promise](EFPromise, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__EFObserver_observerWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E62A5900;
  v7 = v3;
  v18 = v7;
  objc_msgSend(v5, "addSuccessBlock:", v17);

  objc_msgSend(v4, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = 3221225472;
  v14 = __44__EFObserver_observerWithCompletionHandler___block_invoke_2;
  v15 = &unk_1E62A5D98;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v8, "addFailureBlock:", &v12);

  objc_msgSend(v4, "resultsObserverAdapter", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObserver *)v10;
}

uint64_t __44__EFObserver_observerWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__EFObserver_observerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
