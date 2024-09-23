@implementation EFCombineLatestObservableSubscription

id __62___EFCombineLatestObservableSubscription_initWithObservables___block_invoke_3()
{
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __62___EFCombineLatestObservableSubscription_initWithObservables___block_invoke_2()
{
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __62___EFCombineLatestObservableSubscription_initWithObservables___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "distinctUntilChanged");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v3;
  }
  return v2;
}

uint64_t __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_observableAtIndex:receivedResult:observer:", *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 40));
}

void __52___EFCombineLatestObservableSubscription_subscribe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  EFCancelationToken *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = objc_alloc_init(EFCancelationToken);
  objc_msgSend(*(id *)(a1 + 32), "addCancelable:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "replaceObjectAtIndex:withObject:", a3, v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "unlock");
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_2;
  v19[3] = &unk_1E62A5720;
  v8 = *(void **)(a1 + 48);
  v19[4] = *(_QWORD *)(a1 + 40);
  v21 = a3;
  v20 = v8;
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_3;
  v16[3] = &unk_1E62A5748;
  v9 = *(void **)(a1 + 48);
  v16[4] = *(_QWORD *)(a1 + 40);
  v18 = a3;
  v17 = v9;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_4;
  v13[3] = &unk_1E62A5770;
  v10 = *(void **)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 40);
  v15 = a3;
  v14 = v10;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v19, v16, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFCancelationToken addCancelable:](v6, "addCancelable:", v12);

}

uint64_t __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_observableAtIndex:didCompleteForObserver:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_observableAtIndex:didFailWithError:observer:", *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 40));
}

@end
