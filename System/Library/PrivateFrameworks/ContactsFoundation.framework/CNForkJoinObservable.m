@implementation CNForkJoinObservable

void __35___CNForkJoinObservable_subscribe___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;

  v5 = a2;
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __35___CNForkJoinObservable_subscribe___block_invoke_2;
  v20[3] = &unk_1E29BC950;
  v21 = a1[4];
  v23 = a3;
  v22 = a1[5];
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __35___CNForkJoinObservable_subscribe___block_invoke_3;
  v16[3] = &unk_1E29BB408;
  v17 = a1[4];
  v19 = a3;
  v18 = a1[5];
  v10 = v7;
  v11 = 3221225472;
  v12 = __35___CNForkJoinObservable_subscribe___block_invoke_4;
  v13 = &unk_1E29B9508;
  v14 = a1[6];
  v15 = a1[5];
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v20, v16, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v8, v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[6], "addCancelable:", v9);
}

uint64_t __35___CNForkJoinObservable_subscribe___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveResult:fromObservableAtIndex:observer:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __35___CNForkJoinObservable_subscribe___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observableAtIndex:didCompleteForObserver:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __35___CNForkJoinObservable_subscribe___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cancel");
  objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", v4);

}

@end
