@implementation CNCombineLatestObservable

void __40___CNCombineLatestObservable_subscribe___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "observableAtIndex:didReceiveResult:forObserver:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 32));

}

void __40___CNCombineLatestObservable_subscribe___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "observableAtIndexDidComplete:forObserver:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __40___CNCombineLatestObservable_subscribe___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  _QWORD v18[4];
  id v19;
  id v20[2];
  _QWORD v21[4];
  id v22;
  id v23[3];

  v5 = a2;
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __40___CNCombineLatestObservable_subscribe___block_invoke_2;
  v21[3] = &unk_1E29BB390;
  objc_copyWeak(v23, (id *)(a1 + 56));
  v23[1] = a3;
  v22 = *(id *)(a1 + 32);
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __40___CNCombineLatestObservable_subscribe___block_invoke_3;
  v18[3] = &unk_1E29BB3B8;
  objc_copyWeak(v20, (id *)(a1 + 56));
  v20[1] = a3;
  v19 = *(id *)(a1 + 32);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __40___CNCombineLatestObservable_subscribe___block_invoke_4;
  v15[3] = &unk_1E29BB3E0;
  objc_copyWeak(v17, (id *)(a1 + 56));
  v17[1] = a3;
  v16 = *(id *)(a1 + 32);
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v21, v18, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 40);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __40___CNCombineLatestObservable_subscribe___block_invoke_5;
  v12[3] = &unk_1E29BB408;
  v12[4] = v10;
  v14 = a3;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "performWithResourceLock:", v12);
  objc_msgSend(*(id *)(a1 + 48), "addCancelable:", v11);

  objc_destroyWeak(v17);
  objc_destroyWeak(v20);

  objc_destroyWeak(v23);
}

void __40___CNCombineLatestObservable_subscribe___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activeObservableIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsIndex:", *(_QWORD *)(a1 + 48));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "tokens");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

void __71___CNCombineLatestObservable_observableAtIndexDidComplete_forObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "tokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replaceObjectAtIndex:withObject:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "activeObservableIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeIndex:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "activeObservableIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = CNIsIndexSetEmpty_block_invoke((uint64_t)&__block_literal_global_68, v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "resultScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71___CNCombineLatestObservable_observableAtIndexDidComplete_forObserver___block_invoke_2;
    v8[3] = &unk_1E29B9358;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v7, "performBlock:", v8);

  }
}

void __77___CNCombineLatestObservable_observableAtIndex_didReceiveResult_forObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "silentObservableIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeIndex:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "silentObservableIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = CNIsIndexSetEmpty_block_invoke((uint64_t)&__block_literal_global_68, v4);

  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(*(id *)(a1 + 32), "resultScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77___CNCombineLatestObservable_observableAtIndex_didReceiveResult_forObserver___block_invoke_2;
    v9[3] = &unk_1E29B8C10;
    v10 = *(id *)(a1 + 48);
    v11 = v6;
    v8 = v6;
    objc_msgSend(v7, "performBlock:", v9);

  }
}

uint64_t __71___CNCombineLatestObservable_observableAtIndexDidComplete_forObserver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __84___CNCombineLatestObservable_initWithObservables_resultScheduler_schedulerProvider___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0C99E38], "null");
}

uint64_t __84___CNCombineLatestObservable_initWithObservables_resultScheduler_schedulerProvider___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99E38], "null");
}

uint64_t __84___CNCombineLatestObservable_initWithObservables_resultScheduler_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "distinctUntilChanged");
}

uint64_t __77___CNCombineLatestObservable_observableAtIndex_didReceiveResult_forObserver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));
}

void __40___CNCombineLatestObservable_subscribe___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "observableAtIndex:didFailWithError:forObserver:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 32));

}

void __77___CNCombineLatestObservable_observableAtIndex_didFailWithError_forObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "activeObservableIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeIndex:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_cn_filter:", &__block_literal_global_4_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_each:", &__block_literal_global_42);

  objc_msgSend(*(id *)(a1 + 32), "resultScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77___CNCombineLatestObservable_observableAtIndex_didFailWithError_forObserver___block_invoke_2;
  v8[3] = &unk_1E29B8C10;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v7, "performBlock:", v8);

}

uint64_t __77___CNCombineLatestObservable_observableAtIndex_didFailWithError_forObserver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", *(_QWORD *)(a1 + 40));
}

@end
