@implementation CNThrottledObservable

void __36___CNThrottledObservable_subscribe___block_invoke_5(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 2) != 0)
    objc_msgSend(*(id *)(a1 + 32), "observerScheduler_sendResultToObserver:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36___CNThrottledObservable_subscribe___block_invoke_6;
  v3[3] = &unk_1E29B9358;
  v3[4] = *(_QWORD *)(a1 + 32);
  CNRunWithLock(v2, v3);
}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "observerScheduler_sendResultToObserver:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
}

void __36___CNThrottledObservable_subscribe___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delayToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  objc_msgSend(WeakRetained, "observerScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36___CNThrottledObservable_subscribe___block_invoke_8;
  v5[3] = &unk_1E29B8C10;
  v5[4] = WeakRetained;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "performBlock:", v5);

}

void __36___CNThrottledObservable_subscribe___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v6 = a1[4];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __36___CNThrottledObservable_subscribe___block_invoke_3;
  v23[3] = &unk_1E29BBE28;
  v23[4] = WeakRetained;
  v7 = v3;
  v24 = v7;
  v25 = &v26;
  CNRunWithLock(v6, v23);
  if (*((_BYTE *)v27 + 24))
  {
    objc_msgSend(WeakRetained, "observerScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __36___CNThrottledObservable_subscribe___block_invoke_4;
    v21[3] = &unk_1E29B8C10;
    v21[4] = WeakRetained;
    v22 = a1[5];
    objc_msgSend(v8, "performBlock:", v21);

  }
  objc_msgSend(WeakRetained, "delayToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancel");

  objc_msgSend(WeakRetained, "observerScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "interval");
  v12 = v11;
  v14 = v5;
  v15 = 3221225472;
  v16 = __36___CNThrottledObservable_subscribe___block_invoke_5;
  v17 = &unk_1E29B9308;
  v18 = WeakRetained;
  v19 = a1[5];
  v20 = a1[4];
  objc_msgSend(v10, "afterDelay:performBlock:", &v14, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setDelayToken:", v13, v14, v15, v16, v17, v18);

  _Block_object_dispose(&v26, 8);
}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentResult:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "isCoalescing") & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "options") & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "setIsCoalescing:", 1);
}

uint64_t __65___CNThrottledObservable_observerScheduler_sendResultToObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "mostRecentResult");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setMostRecentResult:", 0);
}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsCoalescing:", 0);
}

void __36___CNThrottledObservable_subscribe___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delayToken");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancel");

}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerScheduler_sendResultToObserver:", *(_QWORD *)(a1 + 40));
}

void __36___CNThrottledObservable_subscribe___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delayToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  objc_msgSend(WeakRetained, "observerScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36___CNThrottledObservable_subscribe___block_invoke_10;
  v8[3] = &unk_1E29B8C10;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v6, "performBlock:", v8);

}

uint64_t __36___CNThrottledObservable_subscribe___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", *(_QWORD *)(a1 + 40));
}

@end
