@implementation CNObserver

+ (CNObserver)observerWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__CNObserver_observerWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E29BA8B8;
  v17 = v5;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __44__CNObserver_observerWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E29B8D88;
  v14 = v17;
  v15 = v4;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __44__CNObserver_observerWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E29BA220;
  v12 = v15;
  v7 = v15;
  v8 = v17;
  objc_msgSend(a1, "observerWithResultBlock:completionBlock:failureBlock:", v16, v13, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNObserver *)v9;
}

+ (CNObserver)observerWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", objc_opt_class(), v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNObserver *)v11;
}

+ (id)blockObserverOfClass:(Class)a3 withResultBlock:(id)a4 completionBlock:(id)a5 failureBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend([a3 alloc], "initWithResultBlock:completionBlock:failureBlock:", v11, v10, v9);

  return v12;
}

uint64_t __44__CNObserver_observerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

+ (void)sendArray:(id)a3 error:(id)a4 toObserver:(id)a5 untilCanceled:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a5;
  v9 = a6;
  if (a4)
  {
    objc_msgSend(v11, "observerDidFailWithError:", a4);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__CNObserver_sendArray_error_toObserver_untilCanceled___block_invoke;
    v12[3] = &unk_1E29BA8B8;
    v10 = v11;
    v13 = v10;
    objc_msgSend(a3, "_cn_each:untilCancelled:", v12, v9);
    if ((objc_msgSend(v9, "isCanceled") & 1) == 0)
      objc_msgSend(v10, "observerDidComplete");

  }
}

+ (CNObserver)observerWithWeakTarget:(id)a3 resultSelector:(SEL)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__CNObserver_observerWithWeakTarget_resultSelector___block_invoke;
  v9[3] = &unk_1E29BC738;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a4;
  objc_msgSend(a1, "observerWithResultBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return (CNObserver *)v7;
}

+ (CNObserver)observerWithResultBlock:(id)a3
{
  id v3;
  _CNBlockObserver *v4;

  v3 = a3;
  v4 = -[_CNBlockObserver initWithResultBlock:completionBlock:failureBlock:]([_CNBlockObserver alloc], "initWithResultBlock:completionBlock:failureBlock:", v3, 0, 0);

  return (CNObserver *)v4;
}

void __52__CNObserver_observerWithWeakTarget_resultSelector___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void (*v4)(id, _QWORD, id);
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void (*)(id, _QWORD, id))objc_msgSend(WeakRetained, "methodForSelector:", *(_QWORD *)(a1 + 40));
  if (v4)
    v4(WeakRetained, *(_QWORD *)(a1 + 40), v5);

}

uint64_t __44__CNObserver_observerWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __44__CNObserver_observerWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)sendArray:(id)a3 error:(id)a4 toObserver:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNCancelationToken *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(CNCancelationToken);
  objc_msgSend(a1, "sendArray:error:toObserver:untilCanceled:", v10, v9, v8, v11);

}

uint64_t __55__CNObserver_sendArray_error_toObserver_untilCanceled___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

+ (void)sendResult:(id)a3 error:(id)a4 toObserver:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "observerDidFailWithError:", v7);
  }
  else
  {
    if (v10)
      objc_msgSend(v8, "observerDidReceiveResult:", v10);
    objc_msgSend(v9, "observerDidComplete");
  }

}

+ (void)sendObserver:(id)a3 resultsOfBlock:(id)a4
{
  void (*v6)(id, id *);
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = 0;
  v6 = (void (*)(id, id *))*((_QWORD *)a4 + 2);
  v7 = a3;
  v6(a4, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  objc_msgSend(a1, "sendArray:error:toObserver:", v8, v9, v7);

}

@end
