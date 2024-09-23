@implementation CNFlatMapObservable

void __34___CNFlatMapObservable_subscribe___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(*(id *)(a1 + 32), "resourceLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __34___CNFlatMapObservable_subscribe___block_invoke_8;
  v13 = &unk_1E29B9330;
  v15 = &v16;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v4, "performBlock:", &v10);

  if (*((_BYTE *)v17 + 24))
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v3, "doOnError:", *(_QWORD *)(a1 + 56), v10, v11, v12, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscribeInnerObservable:observer:context:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v7, "token");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addCancelable:", v9);

  }
  _Block_object_dispose(&v16, 8);

}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_6(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1[4], "resourceLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_7;
  v3[3] = &unk_1E29BC520;
  objc_copyWeak(&v6, a1 + 7);
  objc_copyWeak(&v7, a1 + 8);
  v4 = a1[5];
  v5 = a1[6];
  objc_msgSend(v2, "performBlock:", v3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_3;
  v6[3] = &unk_1E29BA6D0;
  objc_copyWeak(&v9, a1 + 6);
  v7 = a1[4];
  v5 = v3;
  v8 = v5;
  objc_msgSend(WeakRetained, "performBlock:", v6);

  objc_destroyWeak(&v9);
}

void __34___CNFlatMapObservable_subscribe___block_invoke_9(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "resourceLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34___CNFlatMapObservable_subscribe___block_invoke_10;
  v3[3] = &unk_1E29B8C10;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performBlock:", v3);

}

void __34___CNFlatMapObservable_subscribe___block_invoke_12(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tokens");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __34___CNFlatMapObservable_subscribe___block_invoke_10(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setOperatorReceiving:", 0);
  objc_msgSend(*(id *)(a1 + 32), "decorators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "downstream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34___CNFlatMapObservable_subscribe___block_invoke_11;
    v5[3] = &unk_1E29B8C10;
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "performBlock:", v5);

  }
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "decorators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "resume");
  objc_msgSend(*(id *)(a1 + 32), "decorators");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueue:", *(_QWORD *)(a1 + 40));

}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

  objc_msgSend(WeakRetained, "decorators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "decorators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    v7 = objc_msgSend(WeakRetained, "isOperatorReceiving");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "downstream");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_8;
      v13[3] = &unk_1E29B8C10;
      v14 = WeakRetained;
      v15 = *(id *)(a1 + 40);
      objc_msgSend(v12, "performBlock:", v13);

      goto LABEL_7;
    }
  }
  objc_msgSend(WeakRetained, "decorators");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(WeakRetained, "decorators");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "peek");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
LABEL_7:

}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_9(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tokens");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isOperatorReceiving");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id __74___CNFlatMapObservable_flatMapWithObservable_transform_schedulerProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNSuspendableSchedulerDecorator resumedSchedulerWithScheduler:](CNSuspendableSchedulerDecorator, "resumedSchedulerWithScheduler:", a2);
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_3(id *a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_4;
  v3[3] = &unk_1E29B8C10;
  v4 = a1[4];
  v5 = a1[5];
  objc_msgSend(WeakRetained, "performBlock:", v3);

}

uint64_t __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_5(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_6;
  v3[3] = &unk_1E29BC548;
  v2 = a1[4];
  v4 = a1[5];
  objc_copyWeak(&v7, a1 + 7);
  objc_copyWeak(&v8, a1 + 8);
  v5 = a1[4];
  v6 = a1[6];
  objc_msgSend(v2, "performBlock:", v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);

}

uint64_t __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isObserverReceiving");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObserverReceiving:", 0);
    return objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
  }
  return result;
}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isObserverReceiving");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObserverReceiving:", 0);
    return objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
  }
  return result;
}

id __76___CNFlatMapObservable_concatMapWithObservable_transform_schedulerProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNSuspendableSchedulerDecorator suspendedSchedulerWithScheduler:](CNSuspendableSchedulerDecorator, "suspendedSchedulerWithScheduler:", a2);
}

void __34___CNFlatMapObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resourceLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34___CNFlatMapObservable_subscribe___block_invoke_2;
  v17[3] = &unk_1E29B8C10;
  v18 = *(id *)(a1 + 32);
  v19 = v4;
  v7 = v4;
  objc_msgSend(v5, "performBlock:", v17);

  objc_msgSend(v7, "_cn_each:", &__block_literal_global_42);
  objc_msgSend(*(id *)(a1 + 32), "resourceLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __34___CNFlatMapObservable_subscribe___block_invoke_4;
  v15[3] = &unk_1E29B9358;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v8, "performBlock:", v15);

  objc_msgSend(*(id *)(a1 + 32), "downstream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __34___CNFlatMapObservable_subscribe___block_invoke_6;
  v11[3] = &unk_1E29B9308;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v3;
  v10 = v3;
  objc_msgSend(v9, "performBlock:", v11);

}

void __34___CNFlatMapObservable_subscribe___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "decorators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_9_2);

  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "tokens");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "suspend");
}

void __34___CNFlatMapObservable_subscribe___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "decorators");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_cn_each:", &__block_literal_global_11_0);

}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resume");
}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isObserverReceiving");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObserverReceiving:", 0);
    return objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", *(_QWORD *)(a1 + 48));
  }
  return result;
}

@end
