@implementation CNObservable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineDescription, 0);
}

void __20__CNObservable_map___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "observerDidReceiveResult:", v2);

}

uint64_t __26__CNObservable_doOnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

uint64_t __20__CNObservable_map___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __31__CNObservable_doOnCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

void __25__CNObservable_doOnNext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v5);

}

void __26__CNObservable_observeOn___block_invoke_2(id *a1, void *a2)
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
  v6[2] = __26__CNObservable_observeOn___block_invoke_3;
  v6[3] = &unk_1E29BA6D0;
  objc_copyWeak(&v9, a1 + 6);
  v7 = a1[4];
  v5 = v3;
  v8 = v5;
  objc_msgSend(WeakRetained, "performBlock:", v6);

  objc_destroyWeak(&v9);
}

void __26__CNObservable_observeOn___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));

}

void __26__CNObservable_observeOn___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");

}

void __43__CNObservable_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    (*(void (**)(void))(v5 + 16))();
  }

}

BOOL __48__CNObservable_observableWithResults_scheduler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  return v3 < objc_msgSend(*(id *)(a1 + 32), "count");
}

uint64_t __48__CNObservable_observableWithResults_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "unsignedIntegerValue") + 1);
}

uint64_t __48__CNObservable_observableWithResults_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(a2, "unsignedIntegerValue"));
}

uint64_t __30__CNObservable_doOnTerminate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

id __64__CNObservable_combineLatest_resultScheduler_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = a2;
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_14(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  __int128 v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_15;
  v3[3] = &unk_1E29BADB0;
  v7 = *(_OWORD *)(a1 + 64);
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  CNRunWithLock(v2, v3);

}

void __23__CNObservable_filter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v3);

}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_6;
  v6[3] = &unk_1E29BACC0;
  v10 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  CNRunWithLock(v4, v6);

}

uint64_t __31__CNObservable_onErrorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_15(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, *(void **)(a1 + 32)))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_16;
      v3[3] = &unk_1E29B9358;
      v2 = *(void **)(a1 + 40);
      v4 = *(id *)(a1 + 48);
      objc_msgSend(v2, "performBlock:", v3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

    }
  }
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", WeakRetained);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_10;
      v4[3] = &unk_1E29B9358;
      v3 = *(void **)(a1 + 40);
      v5 = *(id *)(a1 + 48);
      objc_msgSend(v3, "performBlock:", v4);

    }
  }

}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  CNSwitchWithSchedulerProviderSwitchedCancelationToken *v8;
  void *v9;
  CNSwitchWithSchedulerProviderSwitchedCancelationToken *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id location;
  _QWORD v42[4];
  id v43;
  CNSwitchWithSchedulerProviderSwitchedCancelationToken *v44;
  _QWORD v45[4];
  id v46;
  id v47;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_3;
  v45[3] = &unk_1E29B8C10;
  v46 = v4;
  v6 = *(void **)(a1 + 32);
  v47 = *(id *)(a1 + 40);
  v7 = v4;
  CNRunWithLock(v6, v45);
  objc_msgSend(v7, "_cn_each:", &__block_literal_global_42);

  v8 = objc_alloc_init(CNSwitchWithSchedulerProviderSwitchedCancelationToken);
  v42[0] = v5;
  v42[1] = 3221225472;
  v42[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_4;
  v42[3] = &unk_1E29B8C10;
  v9 = *(void **)(a1 + 32);
  v43 = *(id *)(a1 + 40);
  v10 = v8;
  v44 = v10;
  CNRunWithLock(v9, v42);
  objc_initWeak(&location, v10);
  v11 = objc_opt_class();
  v36[0] = v5;
  v36[1] = 3221225472;
  v36[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_5;
  v36[3] = &unk_1E29BACE8;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 64);
  v37 = v12;
  v40 = v13;
  v38 = *(id *)(a1 + 48);
  v39 = *(id *)(a1 + 56);
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_8;
  v29[3] = &unk_1E29BAD38;
  v30 = *(id *)(a1 + 32);
  objc_copyWeak(&v35, &location);
  v14 = *(id *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 72);
  v31 = v14;
  v34 = v15;
  v32 = *(id *)(a1 + 48);
  v33 = *(id *)(a1 + 56);
  v20 = v5;
  v21 = 3221225472;
  v22 = __44__CNObservable_switchWithSchedulerProvider___block_invoke_11;
  v23 = &unk_1E29BAD60;
  v16 = *(id *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 64);
  v24 = v16;
  v27 = v17;
  v25 = *(id *)(a1 + 48);
  v26 = *(id *)(a1 + 56);
  objc_copyWeak(&v28, (id *)(a1 + 80));
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v11, v36, v29, &v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscribe:", v18, v20, v21, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v10, "addCancelable:", v19);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __21__CNObservable_take___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v5),
        v3 = v5,
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24),
        !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v4 + 24))
    {
      *(_BYTE *)(v4 + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
    }
    objc_msgSend(*(id *)(a1 + 40), "cancel");
    v3 = v5;
  }

}

const __CFString *__27__CNObservable_doOnCancel___block_invoke_4()
{
  return CFSTR("doOnCancel");
}

id __31__CNObservable_doOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __31__CNObservable_doOnCompletion___block_invoke_2;
  v19[3] = &unk_1E29BA8B8;
  v20 = v3;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __31__CNObservable_doOnCompletion___block_invoke_3;
  v16[3] = &unk_1E29B9380;
  v17 = v20;
  v18 = *(id *)(a1 + 40);
  v11 = v6;
  v12 = 3221225472;
  v13 = __31__CNObservable_doOnCompletion___block_invoke_4;
  v14 = &unk_1E29B9558;
  v15 = v17;
  v7 = v17;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v19, v16, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)allObjects:(id *)a3
{
  CNPromise *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(CNPromise);
  -[CNPromise completionHandlerAdapter](v5, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNObserver observerWithCompletionHandler:](CNObserver, "observerWithCompletionHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNObservable subscribe:](self, "subscribe:", v7);
  -[CNPromise future](v5, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "result:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __26__CNObservable_doOnError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __26__CNObservable_doOnError___block_invoke_2;
  v19[3] = &unk_1E29BA8B8;
  v20 = v3;
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __26__CNObservable_doOnError___block_invoke_3;
  v17[3] = &unk_1E29B9358;
  v18 = v20;
  v11 = v6;
  v12 = 3221225472;
  v13 = __26__CNObservable_doOnError___block_invoke_4;
  v14 = &unk_1E29BA9C8;
  v15 = v18;
  v16 = *(id *)(a1 + 40);
  v7 = v18;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v19, v17, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __25__CNObservable_doOnNext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __25__CNObservable_doOnNext___block_invoke_2;
  v18[3] = &unk_1E29BAA10;
  v20 = *(id *)(a1 + 40);
  v19 = v3;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __25__CNObservable_doOnNext___block_invoke_3;
  v16[3] = &unk_1E29B9358;
  v17 = v19;
  v11 = v6;
  v12 = 3221225472;
  v13 = __25__CNObservable_doOnNext___block_invoke_4;
  v14 = &unk_1E29B9558;
  v15 = v17;
  v7 = v17;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v18, v16, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __20__CNObservable_map___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __20__CNObservable_map___block_invoke_2;
  v18[3] = &unk_1E29BAB48;
  v19 = v3;
  v20 = *(id *)(a1 + 40);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __20__CNObservable_map___block_invoke_3;
  v16[3] = &unk_1E29B9358;
  v17 = v19;
  v11 = v6;
  v12 = 3221225472;
  v13 = __20__CNObservable_map___block_invoke_4;
  v14 = &unk_1E29B9558;
  v15 = v17;
  v7 = v17;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v18, v16, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)observableWithFuture:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observableWithFuture:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

CNObservableWithFutureCancelationToken *__55__CNObservable_observableWithFuture_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNObservableWithFutureCancelationToken *v4;
  void *v5;
  uint64_t v6;
  CNObservableWithFutureCancelationToken *v7;
  id v8;
  void *v9;
  void *v10;
  CNObservableWithFutureCancelationToken *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  CNObservableWithFutureCancelationToken *v16;
  _QWORD v18[4];
  CNObservableWithFutureCancelationToken *v19;
  id v20;
  _QWORD v21[4];
  CNObservableWithFutureCancelationToken *v22;
  id v23;

  v3 = a2;
  v4 = objc_alloc_init(CNObservableWithFutureCancelationToken);
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_2;
  v21[3] = &unk_1E29BA058;
  v7 = v4;
  v22 = v7;
  v8 = v3;
  v23 = v8;
  objc_msgSend(*(id *)(a1 + 40), "immediateScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSuccessBlock:scheduler:", v21, v9);

  v10 = *(void **)(a1 + 32);
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_3;
  v18[3] = &unk_1E29B9508;
  v11 = v7;
  v19 = v11;
  v20 = v8;
  v12 = *(void **)(a1 + 40);
  v13 = v8;
  objc_msgSend(v12, "immediateScheduler", v6, 3221225472, __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_3, &unk_1E29B9508);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addFailureBlock:scheduler:", v18, v14);

  v15 = v20;
  v16 = v11;

  return v16;
}

CNCancelationToken *__31__CNObservable_onErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNCancelationToken *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v3 = a2;
  v4 = objc_alloc_init(CNCancelationToken);
  objc_initWeak(&location, v4);
  v5 = *(void **)(a1 + 32);
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __31__CNObservable_onErrorHandler___block_invoke_2;
  v21[3] = &unk_1E29BA8B8;
  v22 = v3;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __31__CNObservable_onErrorHandler___block_invoke_3;
  v19[3] = &unk_1E29B9358;
  v20 = v22;
  v12 = v7;
  v13 = 3221225472;
  v14 = __31__CNObservable_onErrorHandler___block_invoke_4;
  v15 = &unk_1E29BABB8;
  v17 = *(id *)(a1 + 40);
  v8 = v20;
  v16 = v8;
  objc_copyWeak(&v18, &location);
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v21, v19, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v4, "addCancelable:", v10);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v4;
}

CNObserveOnCancelationToken *__26__CNObservable_observeOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNObserveOnCancelationToken *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id location[2];

  v3 = a2;
  v4 = objc_alloc_init(CNObserveOnCancelationToken);
  objc_initWeak(location, v4);
  v13 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __26__CNObservable_observeOn___block_invoke_2;
  v22[3] = &unk_1E29BA6F8;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  objc_copyWeak(&v25, location);
  v7 = v3;
  v23 = v7;
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __26__CNObservable_observeOn___block_invoke_4;
  v18[3] = &unk_1E29BA720;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  objc_copyWeak(&v21, location);
  v8 = v7;
  v19 = v8;
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __26__CNObservable_observeOn___block_invoke_6;
  v14[3] = &unk_1E29BA748;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  objc_copyWeak(&v17, location);
  v9 = v8;
  v15 = v9;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v22, v18, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subscribe:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v4, "addCancelable:", v11);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(location);

  return v4;
}

id __23__CNObservable_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __23__CNObservable_filter___block_invoke_2;
  v18[3] = &unk_1E29BAA10;
  v20 = *(id *)(a1 + 40);
  v19 = v3;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __23__CNObservable_filter___block_invoke_3;
  v16[3] = &unk_1E29B9358;
  v17 = v19;
  v11 = v6;
  v12 = 3221225472;
  v13 = __23__CNObservable_filter___block_invoke_4;
  v14 = &unk_1E29B9558;
  v15 = v17;
  v7 = v17;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v18, v16, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  CNEnumerateObjectsUsingBlockCancelationToken *v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  _QWORD *v20;
  id v21;
  id location;
  _QWORD v23[4];

  v4 = a3;
  v5 = objc_alloc_init(CNEnumerateObjectsUsingBlockCancelationToken);
  v6 = dispatch_semaphore_create(0);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  objc_initWeak(&location, v5);
  v7 = objc_opt_class();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __43__CNObservable_enumerateObjectsUsingBlock___block_invoke;
  v17[3] = &unk_1E29BAAC0;
  objc_copyWeak(&v21, &location);
  v9 = v4;
  v19 = v9;
  v20 = v23;
  v18 = v6;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __43__CNObservable_enumerateObjectsUsingBlock___block_invoke_2;
  v15[3] = &unk_1E29B9358;
  v16 = v18;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __43__CNObservable_enumerateObjectsUsingBlock___block_invoke_3;
  v13[3] = &unk_1E29B9558;
  v10 = v16;
  v14 = v10;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v7, v17, v15, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable subscribe:](self, "subscribe:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v5, "addCancelable:", v12);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(v23, 8);

}

id __27__CNObservable_doOnCancel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[3];
  char v15;

  v3 = a2;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 1;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __27__CNObservable_doOnCancel___block_invoke_2;
  v13[3] = &unk_1E29B95A8;
  v13[4] = v14;
  objc_msgSend(v5, "doOnTerminate:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __27__CNObservable_doOnCancel___block_invoke_3;
  v10[3] = &unk_1E29B8BE8;
  v12 = v14;
  v11 = *(id *)(a1 + 40);
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addCancelable:", v7);

  _Block_object_dispose(v14, 8);
  return v8;
}

CNTakeCancelationToken *__21__CNObservable_take___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNTakeCancelationToken *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CNTakeCancelationToken *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CNTakeCancelationToken *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  CNTakeCancelationToken *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[4];

  v3 = a2;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = *(_QWORD *)(a1 + 40);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 1;
  v4 = objc_alloc_init(CNTakeCancelationToken);
  v5 = *(void **)(a1 + 32);
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __21__CNObservable_take___block_invoke_2;
  v24[3] = &unk_1E29BAE90;
  v27 = v31;
  v25 = v3;
  v28 = v29;
  v8 = v4;
  v26 = v8;
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __21__CNObservable_take___block_invoke_3;
  v21[3] = &unk_1E29B9330;
  v23 = v29;
  v22 = v25;
  v15 = v7;
  v16 = 3221225472;
  v17 = __21__CNObservable_take___block_invoke_4;
  v18 = &unk_1E29BAEB8;
  v20 = v29;
  v9 = v22;
  v19 = v9;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v24, v21, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v10, v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCancelationToken addCancelable:](v8, "addCancelable:", v11);

  v12 = v19;
  v13 = v8;

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  return v13;
}

- (id)throttle:(double)a3 schedulerProvider:(id)a4
{
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[CNObservable throttle:options:schedulerProvider:](self, "throttle:options:schedulerProvider:", 2, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__CNObservable_throttle_schedulerProvider___block_invoke;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v9[4] = a3;
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", v9, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)throttle:(double)a3 options:(unint64_t)a4 schedulerProvider:(id)a5
{
  id v8;
  _CNThrottledObservable *v9;
  void *v10;
  _QWORD v12[6];

  v8 = a5;
  v9 = -[_CNThrottledObservable initWithInterval:options:observable:schedulerProvider:]([_CNThrottledObservable alloc], "initWithInterval:options:observable:schedulerProvider:", a4, self, v8, a3);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__CNObservable_throttle_options_schedulerProvider___block_invoke;
  v12[3] = &__block_descriptor_48_e15___NSString_8__0l;
  *(double *)&v12[4] = a3;
  v12[5] = a4;
  -[CNObservable pipelineDescriptionWithOperation:onObservable:](v9, "pipelineDescriptionWithOperation:onObservable:", v12, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __26__CNObservable_observeOn___block_invoke_4(id *a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__CNObservable_observeOn___block_invoke_5;
  v3[3] = &unk_1E29B9758;
  objc_copyWeak(&v5, a1 + 6);
  v4 = a1[4];
  objc_msgSend(WeakRetained, "performBlock:", v3);

  objc_destroyWeak(&v5);
}

uint64_t __30__CNObservable_doOnTerminate___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", v3);

}

void __31__CNObservable_onErrorHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "subscribe:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "addCancelable:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", v7);
  }

}

uint64_t __25__CNObservable_doOnNext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

id __24__CNObservable_onError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __20__CNObservable_map___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

CNObservableWithResultCancelationToken *__37__CNObservable_observableWithResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "observerDidReceiveResult:", v2);
  objc_msgSend(v3, "observerDidComplete");

  return objc_alloc_init(CNObservableWithResultCancelationToken);
}

uint64_t __31__CNObservable_doOnCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __26__CNObservable_doOnError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

intptr_t __43__CNObservable_enumerateObjectsUsingBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __27__CNObservable_doOnCancel___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", v3);
    objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
  }

}

uint64_t __23__CNObservable_filter___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_9;
  v5[3] = &unk_1E29BAD10;
  objc_copyWeak(&v10, (id *)(a1 + 72));
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v6 = v3;
  v9 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  CNRunWithLock(v2, v5);

  objc_destroyWeak(&v10);
}

uint64_t __26__CNObservable_scan_seed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

void __25__CNObservable_takeLast___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "drain");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CNObserver sendArray:error:toObserver:untilCanceled:](CNObserver, "sendArray:error:toObserver:untilCanceled:", v2, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __21__CNObservable_take___block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "observerDidComplete");
  return result;
}

CNConcatenateCancelationToken *__28__CNObservable_concatenate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNConcatenateCancelationToken *v4;

  v3 = a2;
  v4 = objc_alloc_init(CNConcatenateCancelationToken);
  +[_CNConcatenatingObservable subscribeObserver:toObservables:unless:](_CNConcatenatingObservable, "subscribeObserver:toObservables:unless:", v3, *(_QWORD *)(a1 + 32), v4);

  return v4;
}

uint64_t __31__CNObservable_onErrorHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

+ (id)combineLatest:(id)a3 schedulerProvider:(id)a4
{
  return (id)objc_msgSend(a1, "combineLatest:resultScheduler:schedulerProvider:", a3, 0, a4);
}

- (id)distinctUntilChanged
{
  _CNDistinctUntilChangedObservable *v3;
  void *v4;

  v3 = -[_CNDistinctUntilChangedObservable initWithObservable:]([_CNDistinctUntilChangedObservable alloc], "initWithObservable:", self);
  -[CNObservable pipelineDescriptionWithOperation:onObservable:](v3, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_172, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)takeLast:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __25__CNObservable_takeLast___block_invoke;
  v10[3] = &unk_1E29BAC98;
  v10[4] = self;
  v10[5] = a3;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __25__CNObservable_takeLast___block_invoke_5;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v9[4] = a3;
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", v9, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)scan:(id)a3
{
  void *v4;
  void *v5;

  -[CNObservable scan:seed:](self, "scan:seed:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_236, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)scan:(id)a3 seed:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  CNObservable *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __26__CNObservable_scan_seed___block_invoke;
  v17[3] = &unk_1E29BAC48;
  v9 = v7;
  v18 = v9;
  v19 = self;
  v20 = v6;
  v10 = v6;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __26__CNObservable_scan_seed___block_invoke_4;
  v15[3] = &unk_1E29BA320;
  v16 = v9;
  v12 = v9;
  objc_msgSend(v11, "pipelineDescriptionWithOperation:onObservable:", v15, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)take:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __21__CNObservable_take___block_invoke;
  v10[3] = &unk_1E29BAC98;
  v10[4] = self;
  v10[5] = a3;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __21__CNObservable_take___block_invoke_5;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v9[4] = a3;
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", v9, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)doOnCancel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  CNObservable *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __27__CNObservable_doOnCancel___block_invoke;
  v12 = &unk_1E29BA960;
  v13 = self;
  v14 = v4;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_176, self, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)observableWithResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __37__CNObservable_observableWithResult___block_invoke;
    v14[3] = &unk_1E29BA2F8;
    v7 = v4;
    v15 = v7;
    +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __37__CNObservable_observableWithResult___block_invoke_2;
    v12[3] = &unk_1E29BA320;
    v13 = v7;
    objc_msgSend(v8, "pipelineDescription:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CNObservable os_log](CNObservable, "os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[CNObservable observableWithResult:].cold.1(v10);

    objc_msgSend(a1, "emptyObservable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)subscribeOn:(id)a3
{
  id v4;
  _CNScheduledObservable *v5;
  void *v6;

  v4 = a3;
  v5 = -[_CNScheduledObservable initWithObservable:scheduler:]([_CNScheduledObservable alloc], "initWithObservable:scheduler:", self, v4);

  -[CNObservable pipelineDescriptionWithOperation:onObservable:](v5, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_130, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)onEmpty:(id)a3
{
  id v4;
  _CNOnEmptyObservable *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = -[_CNOnEmptyObservable initWithObservable:nextObservable:]([_CNOnEmptyObservable alloc], "initWithObservable:nextObservable:", self, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __24__CNObservable_onEmpty___block_invoke;
  v9[3] = &unk_1E29BA320;
  v10 = v4;
  v6 = v4;
  -[CNObservable pipelineDescriptionWithOperation:onObservable:](v5, "pipelineDescriptionWithOperation:onObservable:", v9, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *);
  void *v13;
  CNObservable *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __23__CNObservable_filter___block_invoke;
  v13 = &unk_1E29BA960;
  v14 = self;
  v15 = v4;
  v6 = v4;
  objc_msgSend(v5, "observableWithBlock:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_201, self, v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __22__CNObservable_using___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __22__CNObservable_using___block_invoke_2;
  v12[3] = &unk_1E29B9358;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "doOnTerminate:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribe:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __30__CNObservable_doOnTerminate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a2;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __30__CNObservable_doOnTerminate___block_invoke_2;
  v18[3] = &unk_1E29BA8B8;
  v19 = v3;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __30__CNObservable_doOnTerminate___block_invoke_3;
  v15[3] = &unk_1E29B9380;
  v16 = v19;
  v17 = *(id *)(a1 + 40);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __30__CNObservable_doOnTerminate___block_invoke_4;
  v12[3] = &unk_1E29BA9C8;
  v13 = v16;
  v14 = *(id *)(a1 + 40);
  v8 = v16;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v18, v15, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addCancelable:", v10);

  return v4;
}

- (id)doOnTerminate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  CNObservable *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __30__CNObservable_doOnTerminate___block_invoke;
  v12 = &unk_1E29BAA58;
  v13 = self;
  v14 = v4;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_195, self, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)using:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __22__CNObservable_using___block_invoke;
  v8[3] = &unk_1E29BAA58;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

CNTakeLastCancelationToken *__25__CNObservable_takeLast___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNTakeLastCancelationToken *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CNTakeLastCancelationToken *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CNTakeLastCancelationToken *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CNTakeLastCancelationToken *v21;
  _QWORD v22[4];
  id v23;

  v3 = a2;
  +[CNQueue boundedQueueWithCapacity:](CNQueue, "boundedQueueWithCapacity:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(CNTakeLastCancelationToken);
  v6 = *(void **)(a1 + 32);
  v7 = objc_opt_class();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __25__CNObservable_takeLast___block_invoke_2;
  v22[3] = &unk_1E29BA8B8;
  v23 = v4;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __25__CNObservable_takeLast___block_invoke_3;
  v18[3] = &unk_1E29B9308;
  v19 = v23;
  v20 = v3;
  v9 = v5;
  v21 = v9;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __25__CNObservable_takeLast___block_invoke_4;
  v16[3] = &unk_1E29B9558;
  v17 = v20;
  v10 = v20;
  v11 = v23;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v7, v22, v18, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v9, "addCancelable:", v13);
  v14 = v9;

  return v14;
}

id __26__CNObservable_scan_seed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v3 = a2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__5;
  v19[4] = __Block_byref_object_dispose__5;
  v20 = *(id *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __26__CNObservable_scan_seed___block_invoke_240;
  v15[3] = &unk_1E29BAC20;
  v18 = v19;
  v16 = v3;
  v17 = *(id *)(a1 + 48);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __26__CNObservable_scan_seed___block_invoke_2;
  v13[3] = &unk_1E29B9358;
  v14 = v16;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __26__CNObservable_scan_seed___block_invoke_3;
  v11[3] = &unk_1E29B9558;
  v7 = v14;
  v12 = v7;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v15, v13, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v19, 8);
  return v9;
}

CNSwitchWithSchedulerProviderOuterCancelationToken *__44__CNObservable_switchWithSchedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNSwitchWithSchedulerProviderOuterCancelationToken *v5;
  CNUnfairLock *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CNUnfairLock *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  CNUnfairLock *v16;
  id v17;
  void *v19;
  _QWORD v20[4];
  CNUnfairLock *v21;
  id v22;
  _QWORD v23[4];
  CNUnfairLock *v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  CNUnfairLock *v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD v37[4];
  CNUnfairLock *v38;
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  id v44;
  id location;
  _QWORD v46[3];
  char v47;
  _QWORD v48[3];
  char v49;

  v3 = a2;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(CNSwitchWithSchedulerProviderOuterCancelationToken);
  v6 = objc_alloc_init(CNUnfairLock);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.reactive.switch.downstream"));
  objc_initWeak(&location, v5);
  v19 = *(void **)(a1 + 40);
  v8 = objc_opt_class();
  v9 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_2;
  v37[3] = &unk_1E29BAD88;
  v38 = v6;
  v39 = v4;
  v42 = v46;
  v40 = v7;
  v41 = v3;
  v43 = v48;
  objc_copyWeak(&v44, &location);
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_14;
  v30[3] = &unk_1E29BADD8;
  v31 = v38;
  v35 = v48;
  v36 = v46;
  v32 = v39;
  v33 = v40;
  v34 = v41;
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_17;
  v23[3] = &unk_1E29BAE28;
  v10 = v31;
  v24 = v10;
  v28 = v48;
  v29 = v46;
  v11 = v33;
  v25 = v11;
  v12 = v34;
  v26 = v12;
  v13 = v32;
  v27 = v13;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v8, v37, v30, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "subscribe:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v5, "addCancelable:", v15);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_20;
  v20[3] = &unk_1E29B8C10;
  v16 = v10;
  v21 = v16;
  v17 = v13;
  v22 = v17;
  -[CNCancelationToken addCancelationBlock:](v5, "addCancelationBlock:", v20);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);

  return v5;
}

+ (id)merge:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "merge:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)merge:(id)a3 schedulerProvider:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") != 1)
    {
      +[CNObservable observableWithResults:](CNObservable, "observableWithResults:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "flatMap:schedulerProvider:", &__block_literal_global_76, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __40__CNObservable_merge_schedulerProvider___block_invoke;
      v12[3] = &unk_1E29BA320;
      v13 = v5;
      objc_msgSend(v10, "pipelineDescription:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v5, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNObservable emptyObservable](CNObservable, "emptyObservable");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

+ (id)emptyObservable
{
  if (emptyObservable_cn_once_token_5 != -1)
    dispatch_once(&emptyObservable_cn_once_token_5, &__block_literal_global_103);
  return (id)emptyObservable_cn_once_object_5;
}

- (id)flatMap:(id)a3 schedulerProvider:(id)a4
{
  void *v5;
  void *v6;

  +[_CNFlatMapObservable flatMapWithObservable:transform:schedulerProvider:](_CNFlatMapObservable, "flatMapWithObservable:transform:schedulerProvider:", self, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_204, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)startWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable startWith:scheduler:](self, "startWith:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)startWith:(id)a3 scheduler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[CNObservable observableWithResults:scheduler:](CNObservable, "observableWithResults:scheduler:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNObservable concatenate:](CNObservable, "concatenate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__CNObservable_startWith_scheduler___block_invoke;
  v13[3] = &unk_1E29BA320;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "pipelineDescriptionWithOperation:onObservable:", v13, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)concatenate:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    if (objc_msgSend(v3, "count") != 1)
    {
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __28__CNObservable_concatenate___block_invoke;
      v13[3] = &unk_1E29BA2F8;
      v14 = v3;
      +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v3, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNObservable emptyObservable](CNObservable, "emptyObservable");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __28__CNObservable_concatenate___block_invoke_2;
  v11[3] = &unk_1E29BA320;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v7, "pipelineDescription:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)observableWithResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observableWithResults:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)observableWithResults:(id)a3 scheduler:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "copy");
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__CNObservable_observableWithResults_scheduler___block_invoke;
  v17[3] = &unk_1E29BA458;
  v18 = v6;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __48__CNObservable_observableWithResults_scheduler___block_invoke_3;
  v15[3] = &unk_1E29BA4A0;
  v8 = v18;
  v16 = v8;
  +[CNObservable observableWithInitialState:condition:nextState:resultSelector:scheduler:](CNObservable, "observableWithInitialState:condition:nextState:resultSelector:scheduler:", &unk_1E29F0040, v17, &__block_literal_global_84_0, v15, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __48__CNObservable_observableWithResults_scheduler___block_invoke_4;
  v13[3] = &unk_1E29BA320;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "pipelineDescription:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 scheduler:(id)a7
{
  return (id)objc_msgSend(a1, "observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:", a3, a4, a5, a6, 0, a7);
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _CNGeneratorObservable *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[_CNGeneratorObservable initWithInitialState:condition:nextState:resultSelector:delay:scheduler:]([_CNGeneratorObservable alloc], "initWithInitialState:condition:nextState:resultSelector:delay:scheduler:", v18, v17, v16, v15, v14, v13);

  return v19;
}

+ (id)combineLatest:(id)a3 resultScheduler:(id)a4 schedulerProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _CNCombineLatestObservable *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v16 = -[_CNCombineLatestObservable initWithObservables:resultScheduler:schedulerProvider:]([_CNCombineLatestObservable alloc], "initWithObservables:resultScheduler:schedulerProvider:", v10, v8, v9);
LABEL_13:
    v19 = v16;
    goto LABEL_14;
  }
  if (!objc_msgSend(v10, "count"))
  {
    +[CNObservable emptyObservable](CNObservable, "emptyObservable");
    v16 = (_CNCombineLatestObservable *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v10, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "map:", &__block_literal_global_114);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "observeOn:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __64__CNObservable_combineLatest_resultScheduler_schedulerProvider___block_invoke_2;
  v23[3] = &unk_1E29BA320;
  v24 = v10;
  v20 = v10;
  objc_msgSend(v19, "pipelineDescription:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)observeOn:(id)a3
{
  id v4;
  void *v5;
  CNObservable *v6;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, v4);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __26__CNObservable_observeOn___block_invoke;
    v8[3] = &unk_1E29BA770;
    v8[4] = self;
    objc_copyWeak(&v9, &location);
    +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_136, self);
    v6 = (CNObservable *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = self;
  }

  return v6;
}

- (id)switchMap:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[CNObservable map:](self, "map:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switchWithSchedulerProvider:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_266, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)switchWithSchedulerProvider:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  CNSwitchWithSchedulerProviderOuterCancelationToken *(*v11)(uint64_t, void *);
  void *v12;
  id v13;
  CNObservable *v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __44__CNObservable_switchWithSchedulerProvider___block_invoke;
  v12 = &unk_1E29BA348;
  v13 = v4;
  v14 = self;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_263, self, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)onError:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __24__CNObservable_onError___block_invoke;
  v13[3] = &unk_1E29BAB90;
  v6 = v4;
  v14 = v6;
  -[CNObservable onErrorHandler:](self, "onErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __24__CNObservable_onError___block_invoke_2;
  v11[3] = &unk_1E29BA320;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "pipelineDescriptionWithOperation:onObservable:", v11, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)onErrorHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  CNCancelationToken *(*v11)(uint64_t, void *);
  void *v12;
  CNObservable *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __31__CNObservable_onErrorHandler___block_invoke;
  v12 = &unk_1E29BA960;
  v13 = self;
  v14 = v4;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_226, self, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)doOnCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  CNObservable *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __31__CNObservable_doOnCompletion___block_invoke;
  v12 = &unk_1E29BA960;
  v13 = self;
  v14 = v4;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_180, self, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)doOnError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  CNObservable *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __26__CNObservable_doOnError___block_invoke;
  v12 = &unk_1E29BA960;
  v13 = self;
  v14 = v4;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_184, self, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)doOnNext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  CNObservable *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __25__CNObservable_doOnNext___block_invoke;
  v12 = &unk_1E29BA960;
  v13 = self;
  v14 = v4;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_188, self, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)map:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  CNObservable *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __20__CNObservable_map___block_invoke;
  v12 = &unk_1E29BA960;
  v13 = self;
  v14 = v4;
  v5 = v4;
  +[CNMapObservable observableWithBlock:](CNMapObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_212, self, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)observableWithFuture:(id)a3 schedulerProvider:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke;
  v16[3] = &unk_1E29BA348;
  v8 = v5;
  v17 = v8;
  v18 = v6;
  v9 = v6;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_4;
  v14[3] = &unk_1E29BA320;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v10, "pipelineDescription:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)observableWithBlock:(id)a3
{
  id v3;
  _CNBlockObservable *v4;
  void *v5;

  v3 = a3;
  v4 = -[_CNBlockObservable initWithBlock:]([_CNBlockObservable alloc], "initWithBlock:", v3);

  -[CNObservable pipelineDescription:](v4, "pipelineDescription:", &__block_literal_global_49);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setArray:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

id __22__CNObservable_using___block_invoke_2()
{
  return (id)objc_opt_self();
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_7;
    v3[3] = &unk_1E29B8C10;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v2, "performBlock:", v3);

  }
}

void __31__CNObservable_emptyObservable__block_invoke()
{
  _CNEmptyObservable *v0;
  void *v1;

  v0 = objc_alloc_init(_CNEmptyObservable);
  v1 = (void *)emptyObservable_cn_once_object_5;
  emptyObservable_cn_once_object_5 = (uint64_t)v0;

}

- (id)takeUntil:(id)a3
{
  id v4;
  _CNObservableTakeUntilOperator *v5;

  v4 = a3;
  v5 = -[_CNObservableTakeUntilOperator initWithInput:signal:]([_CNObservableTakeUntilOperator alloc], "initWithInput:signal:", self, v4);

  return v5;
}

- (id)publish
{
  CNPublishingSubject *v3;
  void *v4;

  v3 = -[CNPublishingSubject initWithObservable:]([CNPublishingSubject alloc], "initWithObservable:", self);
  -[CNObservable pipelineDescriptionWithOperation:onObservable:](v3, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_230, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(_QWORD *)(a1 + 48);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke_2;
  v16[3] = &unk_1E29BB8D8;
  v17 = v3;
  v8 = v3;
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, v7, 0, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke_3;
  v13[3] = &unk_1E29B8C10;
  v14 = *(id *)(a1 + 32);
  v15 = v9;
  v10 = v9;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)observableOnNotificationCenter:(id)a3 withName:(id)a4 object:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke;
  v15[3] = &unk_1E29BB900;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observableWithInitialState:condition:nextState:resultSelector:scheduler:", v13, v12, v11, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_1_6 != -1)
    dispatch_once(&os_log_cn_once_token_1_6, &__block_literal_global_43);
  return (OS_os_log *)(id)os_log_cn_once_object_1_6;
}

void __22__CNObservable_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.rx", "general");
  v1 = (void *)os_log_cn_once_object_1_6;
  os_log_cn_once_object_1_6 = (uint64_t)v0;

}

+ (OS_os_log)os_log_protocol
{
  if (os_log_protocol_cn_once_token_2 != -1)
    dispatch_once(&os_log_protocol_cn_once_token_2, &__block_literal_global_46);
  return (OS_os_log *)(id)os_log_protocol_cn_once_object_2;
}

void __31__CNObservable_os_log_protocol__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.rx", "protocol");
  v1 = (void *)os_log_protocol_cn_once_object_2;
  os_log_protocol_cn_once_object_2 = (uint64_t)v0;

}

uint64_t __36__CNObservable_observableWithBlock___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Block Observable"));
}

uint64_t __37__CNObservable_observableWithResult___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Observable with Result(%@)"), *(_QWORD *)(a1 + 32));
}

uint64_t __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Observable with Future(%@)"), *(_QWORD *)(a1 + 32));
}

+ (id)observableWithFutures:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observableWithFutures:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)observableWithFutures:(id)a3 schedulerProvider:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__CNObservable_observableWithFutures_schedulerProvider___block_invoke;
  v16[3] = &unk_1E29BA370;
  v17 = v6;
  v8 = v6;
  objc_msgSend(v5, "_cn_map:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNObservable merge:schedulerProvider:](CNObservable, "merge:schedulerProvider:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __56__CNObservable_observableWithFutures_schedulerProvider___block_invoke_2;
  v14[3] = &unk_1E29BA320;
  v15 = v5;
  v11 = v5;
  objc_msgSend(v10, "pipelineDescription:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

CNObservable *__56__CNObservable_observableWithFutures_schedulerProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNObservable observableWithFuture:schedulerProvider:](CNObservable, "observableWithFuture:schedulerProvider:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __56__CNObservable_observableWithFutures_schedulerProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Observable with Futures(%@)"), *(_QWORD *)(a1 + 32));
}

+ (id)observableWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observableWithRange:scheduler:", location, length, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)observableWithRange:(_NSRange)a3 scheduler:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[6];

  length = a3.length;
  location = a3.location;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithUnsignedInteger:", location);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__CNObservable_observableWithRange_scheduler___block_invoke;
  v15[3] = &__block_descriptor_48_e18_B16__0__NSNumber_8l;
  v15[4] = location;
  v15[5] = length;
  objc_msgSend(a1, "observableWithInitialState:condition:nextState:resultSelector:scheduler:", v9, v15, &__block_literal_global_71, &__block_literal_global_72_0, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __46__CNObservable_observableWithRange_scheduler___block_invoke_4;
  v14[3] = &__block_descriptor_48_e15___NSString_8__0l;
  v14[4] = location;
  v14[5] = length;
  objc_msgSend(v11, "pipelineDescription:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __46__CNObservable_observableWithRange_scheduler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3 >= v4;
  v5 = v3 - v4;
  v6 = !v6 || v5 >= *(_QWORD *)(a1 + 40);
  return !v6;
}

uint64_t __46__CNObservable_observableWithRange_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "unsignedIntegerValue") + 1);
}

id __46__CNObservable_observableWithRange_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

id __46__CNObservable_observableWithRange_scheduler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Observable with Range(%@,%@)"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)observableWithRange:(_NSRange)a3 interval:(double)a4 scheduler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[7];
  _QWORD v17[5];
  _QWORD v18[6];

  length = a3.length;
  location = a3.location;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  objc_msgSend(v9, "numberWithUnsignedInteger:", location);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__CNObservable_observableWithRange_interval_scheduler___block_invoke;
  v18[3] = &__block_descriptor_48_e18_B16__0__NSNumber_8l;
  v18[4] = location;
  v18[5] = length;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_4;
  v17[3] = &__block_descriptor_40_e8_d16__0_8l;
  *(double *)&v17[4] = a4;
  objc_msgSend(a1, "observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:", v11, v18, &__block_literal_global_76, &__block_literal_global_77, v17, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_5;
  v16[3] = &__block_descriptor_56_e15___NSString_8__0l;
  v16[4] = location;
  v16[5] = length;
  *(double *)&v16[6] = a4;
  objc_msgSend(v13, "pipelineDescription:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

BOOL __55__CNObservable_observableWithRange_interval_scheduler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3 >= v4;
  v5 = v3 - v4;
  v6 = !v6 || v5 >= *(_QWORD *)(a1 + 40);
  return !v6;
}

uint64_t __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "unsignedIntegerValue") + 1);
}

id __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

double __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(double *)(a1 + 48);
  if (v5 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v5 * 1000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Observable with Range(%@, %@, %@ apart)"), v3, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __48__CNObservable_observableWithResults_scheduler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Observable with Results(%@)"), *(_QWORD *)(a1 + 32));
}

+ (id)observableWithResults:(id)a3 interval:(double)a4 scheduler:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  double v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a5;
  v8 = (void *)objc_msgSend(a3, "copy");
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__CNObservable_observableWithResults_interval_scheduler___block_invoke;
  v21[3] = &unk_1E29BA458;
  v22 = v8;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_3;
  v19[3] = &unk_1E29BA4A0;
  v10 = v22;
  v20 = v10;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_4;
  v18[3] = &__block_descriptor_40_e8_d16__0_8l;
  *(double *)&v18[4] = a4;
  +[CNObservable observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:](CNObservable, "observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:", &unk_1E29F0040, v21, &__block_literal_global_87, v19, v18, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_5;
  v15[3] = &unk_1E29BA4E8;
  v16 = v10;
  v17 = a4;
  v12 = v10;
  objc_msgSend(v11, "pipelineDescription:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

BOOL __57__CNObservable_observableWithResults_interval_scheduler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  return v3 < objc_msgSend(*(id *)(a1 + 32), "count");
}

uint64_t __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "unsignedIntegerValue") + 1);
}

uint64_t __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(a2, "unsignedIntegerValue"));
}

double __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  double v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  if (v3 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v3 * 1000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("Observable with Results(%@, %@ apart)"), v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)observableWithError:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__CNObservable_observableWithError___block_invoke;
  v12[3] = &unk_1E29BA2F8;
  v5 = v3;
  v13 = v5;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __36__CNObservable_observableWithError___block_invoke_2;
  v10[3] = &unk_1E29BA320;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "pipelineDescription:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

CNObservableWithErrorCancelationToken *__36__CNObservable_observableWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "observerDidFailWithError:", *(_QWORD *)(a1 + 32));
  return objc_alloc_init(CNObservableWithErrorCancelationToken);
}

id __36__CNObservable_observableWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Observable with Error(%@, code %ld)"), v3, objc_msgSend(*(id *)(a1 + 32), "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)observableWithTimeInterval:(double)a3 scheduler:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_4;
  v10[3] = &__block_descriptor_40_e8_d16__0_8l;
  *(double *)&v10[4] = a3;
  +[CNObservable observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:](CNObservable, "observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:", &unk_1E29F0040, &__block_literal_global_94_0, &__block_literal_global_95, &__block_literal_global_97, v10, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_5;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v9[4] = a3;
  objc_msgSend(v6, "pipelineDescription:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke()
{
  return 1;
}

uint64_t __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a2, "unsignedLongLongValue") + 1);
}

id __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

double __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_5(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v2 * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("Observable with TimeInterval(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)neverObservable
{
  if (neverObservable_cn_once_token_4 != -1)
    dispatch_once(&neverObservable_cn_once_token_4, &__block_literal_global_101);
  return (id)neverObservable_cn_once_object_4;
}

void __31__CNObservable_neverObservable__block_invoke()
{
  _CNNeverObservable *v0;
  void *v1;

  v0 = objc_alloc_init(_CNNeverObservable);
  v1 = (void *)neverObservable_cn_once_object_4;
  neverObservable_cn_once_object_4 = (uint64_t)v0;

}

+ (id)timerWithDelay:(double)a3
{
  void *v5;
  void *v6;

  +[CNScheduler globalAsyncScheduler](CNScheduler, "globalAsyncScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timerWithDelay:scheduler:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)timerWithDelay:(double)a3 scheduler:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__CNObservable_timerWithDelay_scheduler___block_invoke_4;
  v10[3] = &__block_descriptor_40_e8_d16__0_8l;
  *(double *)&v10[4] = a3;
  objc_msgSend(a1, "observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:", &unk_1E29F0040, &__block_literal_global_105, &__block_literal_global_106, &__block_literal_global_107, v10, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __41__CNObservable_timerWithDelay_scheduler___block_invoke_5;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v9[4] = a3;
  objc_msgSend(v6, "pipelineDescription:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __41__CNObservable_timerWithDelay_scheduler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unsignedIntegerValue") == 0;
}

uint64_t __41__CNObservable_timerWithDelay_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "unsignedIntegerValue") + 1);
}

id __41__CNObservable_timerWithDelay_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

double __41__CNObservable_timerWithDelay_scheduler___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id __41__CNObservable_timerWithDelay_scheduler___block_invoke_5(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v2 * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("Timer(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)amb:(id)a3
{
  id v3;
  _CNAmbObservable *v4;

  v3 = a3;
  v4 = -[_CNAmbObservable initWithObservables:]([_CNAmbObservable alloc], "initWithObservables:", v3);

  return v4;
}

+ (id)combineLatest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "combineLatest:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __64__CNObservable_combineLatest_resultScheduler_schedulerProvider___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_475);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringWithFormat:", CFSTR("CombineLatest(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __28__CNObservable_concatenate___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_475);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringWithFormat:", CFSTR("Concatenate(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)forkJoin:(id)a3 scheduler:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  +[_CNForkJoinObservable forkJoin:](_CNForkJoinObservable, "forkJoin:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__CNObservable_forkJoin_scheduler___block_invoke;
  v9[3] = &unk_1E29BA320;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "pipelineDescription:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __35__CNObservable_forkJoin_scheduler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_475);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringWithFormat:", CFSTR("ForkJoin(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__CNObservable_merge_schedulerProvider___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_475);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringWithFormat:", CFSTR("Merge(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)progressiveForkJoin:(id)a3 scheduler:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  +[_CNForkJoinObservable progressiveForkJoin:](_CNForkJoinObservable, "progressiveForkJoin:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__CNObservable_progressiveForkJoin_scheduler___block_invoke;
  v9[3] = &unk_1E29BA320;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "pipelineDescription:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __46__CNObservable_progressiveForkJoin_scheduler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_475);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringWithFormat:", CFSTR("ProgressiveForkJoin(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

const __CFString *__28__CNObservable_subscribeOn___block_invoke()
{
  return CFSTR("subscribeOn");
}

void __26__CNObservable_observeOn___block_invoke_6(id *a1, void *a2)
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
  v6[2] = __26__CNObservable_observeOn___block_invoke_7;
  v6[3] = &unk_1E29BA6D0;
  objc_copyWeak(&v9, a1 + 6);
  v7 = a1[4];
  v5 = v3;
  v8 = v5;
  objc_msgSend(WeakRetained, "performBlock:", v6);

  objc_destroyWeak(&v9);
}

void __26__CNObservable_observeOn___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", *(_QWORD *)(a1 + 40));

}

const __CFString *__26__CNObservable_observeOn___block_invoke_8()
{
  return CFSTR("observeOn");
}

- (id)ambWith:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = self;
  v8[1] = a3;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNObservable amb:](CNObservable, "amb:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)any:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNObservable filter:](self, "filter:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "take:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "map:", &__block_literal_global_141);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNObservable observableWithResult:](CNObservable, "observableWithResult:", MEMORY[0x1E0C9AAA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onEmpty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __20__CNObservable_any___block_invoke()
{
  return MEMORY[0x1E0C9AAB0];
}

- (id)buffer:(unint64_t)a3
{
  _CNBufferingObservable *v5;
  void *v6;
  _QWORD v8[5];

  v5 = -[_CNBufferingObservable initWithLength:observable:]([_CNBufferingObservable alloc], "initWithLength:observable:", a3, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__CNObservable_buffer___block_invoke;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = a3;
  -[CNObservable pipelineDescriptionWithOperation:onObservable:](v5, "pipelineDescriptionWithOperation:onObservable:", v8, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __23__CNObservable_buffer___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("buffer(%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buffer:(unint64_t)a3 interval:(double)a4
{
  void *v7;
  void *v8;

  +[CNScheduler globalAsyncScheduler](CNScheduler, "globalAsyncScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable buffer:interval:scheduler:](self, "buffer:interval:scheduler:", a3, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)buffer:(unint64_t)a3 interval:(double)a4 scheduler:(id)a5
{
  id v8;
  _CNBufferingObservable *v9;
  void *v10;
  _QWORD v12[6];

  v8 = a5;
  v9 = -[_CNBufferingObservable initWithLength:timeInterval:scheduler:observable:]([_CNBufferingObservable alloc], "initWithLength:timeInterval:scheduler:observable:", a3, v8, self, a4);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__CNObservable_buffer_interval_scheduler___block_invoke;
  v12[3] = &__block_descriptor_48_e15___NSString_8__0l;
  v12[4] = a3;
  *(double *)&v12[5] = a4;
  -[CNObservable pipelineDescriptionWithOperation:onObservable:](v9, "pipelineDescriptionWithOperation:onObservable:", v12, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __42__CNObservable_buffer_interval_scheduler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)(a1 + 40);
  if (v4 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v4 * 1000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("buffer(%@,%@)"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bufferWithInterval:(double)a3
{
  void *v5;
  void *v6;

  +[CNScheduler globalAsyncScheduler](CNScheduler, "globalAsyncScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable bufferWithInterval:scheduler:](self, "bufferWithInterval:scheduler:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bufferWithInterval:(double)a3 scheduler:(id)a4
{
  id v6;
  _CNBufferingObservable *v7;
  void *v8;
  _QWORD v10[5];

  v6 = a4;
  v7 = -[_CNBufferingObservable initWithTimeInterval:scheduler:observable:]([_CNBufferingObservable alloc], "initWithTimeInterval:scheduler:observable:", v6, self, a3);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__CNObservable_bufferWithInterval_scheduler___block_invoke;
  v10[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v10[4] = a3;
  -[CNObservable pipelineDescriptionWithOperation:onObservable:](v7, "pipelineDescriptionWithOperation:onObservable:", v10, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __45__CNObservable_bufferWithInterval_scheduler___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v2 * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("buffer(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)concatMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable concatMap:schedulerProvider:](self, "concatMap:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)concatMap:(id)a3 schedulerProvider:(id)a4
{
  void *v5;
  void *v6;

  +[_CNFlatMapObservable concatMapWithObservable:transform:schedulerProvider:](_CNFlatMapObservable, "concatMapWithObservable:transform:schedulerProvider:", self, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_148, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

const __CFString *__44__CNObservable_concatMap_schedulerProvider___block_invoke()
{
  return CFSTR("concatmap");
}

- (id)delay:(double)a3 scheduler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  CNObservable *v15;
  double v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __32__CNObservable_delay_scheduler___block_invoke;
  v13[3] = &unk_1E29BA890;
  v16 = a3;
  v14 = v6;
  v15 = self;
  v8 = v6;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __32__CNObservable_delay_scheduler___block_invoke_8;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v12[4] = a3;
  objc_msgSend(v9, "pipelineDescriptionWithOperation:onObservable:", v12, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

CNDelayCancelationToken *__32__CNObservable_delay_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNDelayCancelationToken *v4;
  uint64_t v5;
  uint64_t v6;
  CNDelayCancelationToken *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  CNDelayCancelationToken *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  CNDelayCancelationToken *v18;
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  CNDelayCancelationToken *v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  CNDelayCancelationToken *v28;
  id v29;
  id v30;
  uint64_t v31;

  v3 = a2;
  v4 = objc_alloc_init(CNDelayCancelationToken);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __32__CNObservable_delay_scheduler___block_invoke_2;
  v27[3] = &unk_1E29BA818;
  v28 = v4;
  v29 = *(id *)(a1 + 32);
  v31 = *(_QWORD *)(a1 + 48);
  v30 = v3;
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __32__CNObservable_delay_scheduler___block_invoke_4;
  v22[3] = &unk_1E29BA840;
  v23 = v28;
  v24 = *(id *)(a1 + 32);
  v26 = *(_QWORD *)(a1 + 48);
  v25 = v30;
  v14 = v6;
  v15 = 3221225472;
  v16 = __32__CNObservable_delay_scheduler___block_invoke_6;
  v17 = &unk_1E29BA868;
  v7 = v23;
  v18 = v7;
  v8 = *(id *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 48);
  v19 = v8;
  v20 = v25;
  v9 = v25;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v27, v22, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "subscribe:", v10, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCancelationToken addCancelable:](v7, "addCancelable:", v11);
  v12 = v7;

  return v12;
}

void __32__CNObservable_delay_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(double *)(a1 + 56);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __32__CNObservable_delay_scheduler___block_invoke_3;
  v12 = &unk_1E29B8C10;
  v13 = *(id *)(a1 + 48);
  v14 = v3;
  v7 = v3;
  objc_msgSend(v5, "afterDelay:performBlock:", &v9, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addCancelable:", v8, v9, v10, v11, v12);

}

uint64_t __32__CNObservable_delay_scheduler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));
}

void __32__CNObservable_delay_scheduler___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(double *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__CNObservable_delay_scheduler___block_invoke_5;
  v5[3] = &unk_1E29B9358;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "afterDelay:performBlock:", v5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addCancelable:", v4);

}

uint64_t __32__CNObservable_delay_scheduler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

void __32__CNObservable_delay_scheduler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(double *)(a1 + 56);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __32__CNObservable_delay_scheduler___block_invoke_7;
  v12 = &unk_1E29B8C10;
  v13 = *(id *)(a1 + 48);
  v14 = v3;
  v7 = v3;
  objc_msgSend(v5, "afterDelay:performBlock:", &v9, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addCancelable:", v8, v9, v10, v11, v12);

}

uint64_t __32__CNObservable_delay_scheduler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", *(_QWORD *)(a1 + 40));
}

id __32__CNObservable_delay_scheduler___block_invoke_8(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v2 * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("delay(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)delaySubscription:(double)a3 scheduler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  CNObservable *v15;
  double v16;

  v6 = a4;
  v7 = v6;
  if (a3 <= 0.0)
  {
    -[CNObservable subscribeOn:](self, "subscribeOn:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__CNObservable_delaySubscription_scheduler___block_invoke;
    v13[3] = &unk_1E29BA890;
    v16 = a3;
    v14 = v6;
    v15 = self;
    +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __44__CNObservable_delaySubscription_scheduler___block_invoke_3;
    v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
    *(double *)&v12[4] = a3;
    objc_msgSend(v9, "pipelineDescriptionWithOperation:onObservable:", v12, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

CNDelaySubscriptionCancelationToken *__44__CNObservable_delaySubscription_scheduler___block_invoke(double *a1, void *a2)
{
  id v3;
  CNDelaySubscriptionCancelationToken *v4;
  double v5;
  void *v6;
  CNDelaySubscriptionCancelationToken *v7;
  id v8;
  void *v9;
  CNDelaySubscriptionCancelationToken *v10;
  _QWORD v12[5];
  id v13;
  CNDelaySubscriptionCancelationToken *v14;

  v3 = a2;
  v4 = objc_alloc_init(CNDelaySubscriptionCancelationToken);
  v5 = a1[6];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__CNObservable_delaySubscription_scheduler___block_invoke_2;
  v12[3] = &unk_1E29B9308;
  v6 = (void *)*((_QWORD *)a1 + 4);
  *(double *)&v12[4] = a1[5];
  v13 = v3;
  v7 = v4;
  v14 = v7;
  v8 = v3;
  objc_msgSend(v6, "afterDelay:performBlock:", v12, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCancelationToken addCancelable:](v7, "addCancelable:", v9);
  v10 = v7;

  return v10;
}

void __44__CNObservable_delaySubscription_scheduler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "subscribe:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addCancelable:", v2);

}

id __44__CNObservable_delaySubscription_scheduler___block_invoke_3(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v2 * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("delaySubscription(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dematerialize
{
  CNDematerializeCancelationToken *v3;
  uint64_t v4;
  CNDematerializeCancelationToken *v5;
  void *v6;
  CNDematerializeCancelationToken *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  CNDematerializeCancelationToken *v12;
  _QWORD v13[5];
  CNDematerializeCancelationToken *v14;

  v3 = objc_alloc_init(CNDematerializeCancelationToken);
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __29__CNObservable_dematerialize__block_invoke;
  v13[3] = &unk_1E29BA348;
  v13[4] = self;
  v5 = v3;
  v14 = v5;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __29__CNObservable_dematerialize__block_invoke_3;
  v11[3] = &unk_1E29B9358;
  v12 = v5;
  v7 = v5;
  objc_msgSend(v6, "doOnTerminate:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_164, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __29__CNObservable_dematerialize__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __29__CNObservable_dematerialize__block_invoke_2;
  v16[3] = &unk_1E29BA8B8;
  v17 = v3;
  v11 = v6;
  v12 = 3221225472;
  v13 = __29__CNObservable_dematerialize__block_invoke_2_163;
  v14 = &unk_1E29B9558;
  v15 = v17;
  v7 = v17;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v16, &__block_literal_global_162, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addCancelable:", v9);
  return v9;
}

void __29__CNObservable_dematerialize__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (v4 && ((objc_opt_isKindOfClass() & 1) == 0 ? (v5 = 0) : (v5 = v4), v6 = v5, v4, v6))
  {
    -[NSObject dematerializeWithObserver:](v6, "dematerializeWithObserver:", *(_QWORD *)(a1 + 32));
    v7 = v4;
  }
  else
  {
    +[CNObservable os_log](CNObservable, "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __29__CNObservable_dematerialize__block_invoke_2_cold_1((uint64_t)v4, v7);
  }

}

uint64_t __29__CNObservable_dematerialize__block_invoke_2_163(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

uint64_t __29__CNObservable_dematerialize__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

const __CFString *__29__CNObservable_dematerialize__block_invoke_4()
{
  return CFSTR("dematerialize");
}

- (id)distinct
{
  _CNDistinctObservable *v3;
  void *v4;

  v3 = -[_CNDistinctObservable initWithObservable:]([_CNDistinctObservable alloc], "initWithObservable:", self);
  -[CNObservable pipelineDescriptionWithOperation:onObservable:](v3, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_168, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

const __CFString *__24__CNObservable_distinct__block_invoke()
{
  return CFSTR("distinct");
}

const __CFString *__36__CNObservable_distinctUntilChanged__block_invoke()
{
  return CFSTR("distinctUntilChanged");
}

uint64_t __27__CNObservable_doOnCancel___block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __31__CNObservable_doOnCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

const __CFString *__31__CNObservable_doOnCompletion___block_invoke_5()
{
  return CFSTR("doOnCompletion");
}

void __26__CNObservable_doOnError___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "observerDidFailWithError:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

const __CFString *__26__CNObservable_doOnError___block_invoke_5()
{
  return CFSTR("doOnError");
}

uint64_t __25__CNObservable_doOnNext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

const __CFString *__25__CNObservable_doOnNext___block_invoke_5()
{
  return CFSTR("doOnNext");
}

- (id)doOnSubscribe:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  CNObservable *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __30__CNObservable_doOnSubscribe___block_invoke;
  v12 = &unk_1E29BAA58;
  v13 = self;
  v14 = v4;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_191, self, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __30__CNObservable_doOnSubscribe___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  objc_msgSend(*(id *)(a1 + 32), "subscribe:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

const __CFString *__30__CNObservable_doOnSubscribe___block_invoke_2()
{
  return CFSTR("doOnSubscribe");
}

uint64_t __30__CNObservable_doOnTerminate___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

const __CFString *__30__CNObservable_doOnTerminate___block_invoke_5()
{
  return CFSTR("doOnTerminate");
}

intptr_t __43__CNObservable_enumerateObjectsUsingBlock___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __23__CNObservable_filter___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

const __CFString *__23__CNObservable_filter___block_invoke_5()
{
  return CFSTR("filter");
}

- (id)flatMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable flatMap:schedulerProvider:](self, "flatMap:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

const __CFString *__42__CNObservable_flatMap_schedulerProvider___block_invoke()
{
  return CFSTR("flatmap");
}

- (id)ignoreElements
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__CNObservable_ignoreElements__block_invoke;
  v6[3] = &unk_1E29BA2F8;
  v6[4] = self;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_208, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __30__CNObservable_ignoreElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __30__CNObservable_ignoreElements__block_invoke_2;
  v16[3] = &unk_1E29B9358;
  v17 = v3;
  v11 = v6;
  v12 = 3221225472;
  v13 = __30__CNObservable_ignoreElements__block_invoke_3;
  v14 = &unk_1E29B9558;
  v15 = v17;
  v7 = v17;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, 0, v16, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __30__CNObservable_ignoreElements__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __30__CNObservable_ignoreElements__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

const __CFString *__30__CNObservable_ignoreElements__block_invoke_4()
{
  return CFSTR("ignoreElements");
}

const __CFString *__20__CNObservable_map___block_invoke_5()
{
  return CFSTR("map");
}

- (id)materialize
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__CNObservable_materialize__block_invoke;
  v6[3] = &unk_1E29BA2F8;
  v6[4] = self;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_216, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __27__CNObservable_materialize__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __27__CNObservable_materialize__block_invoke_2;
  v15[3] = &unk_1E29BA8B8;
  v16 = v3;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __27__CNObservable_materialize__block_invoke_3;
  v13[3] = &unk_1E29B9358;
  v14 = v16;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __27__CNObservable_materialize__block_invoke_4;
  v11[3] = &unk_1E29B9558;
  v12 = v14;
  v7 = v14;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v5, v15, v13, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __27__CNObservable_materialize__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[CNObservableEvent eventWithResult:](CNObservableEvent, "eventWithResult:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observerDidReceiveResult:", v3);

}

uint64_t __27__CNObservable_materialize__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  +[CNObservableEvent completionEvent](CNObservableEvent, "completionEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observerDidReceiveResult:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __27__CNObservable_materialize__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  +[CNObservableEvent failureEventWithError:](CNObservableEvent, "failureEventWithError:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observerDidReceiveResult:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

const __CFString *__27__CNObservable_materialize__block_invoke_5()
{
  return CFSTR("materialize");
}

id __24__CNObservable_onEmpty___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "debugPipelineDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("onEmpty(%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __24__CNObservable_onError___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "debugPipelineDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("onError(%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

const __CFString *__31__CNObservable_onErrorHandler___block_invoke_5()
{
  return CFSTR("onErrorHandler");
}

const __CFString *__23__CNObservable_publish__block_invoke()
{
  return CFSTR("publish");
}

- (id)sample:(double)a3
{
  void *v5;
  void *v6;

  +[CNScheduler globalAsyncScheduler](CNScheduler, "globalAsyncScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable sample:scheduler:](self, "sample:scheduler:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sample:(double)a3 scheduler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  +[CNObservable observableWithTimeInterval:scheduler:](CNObservable, "observableWithTimeInterval:scheduler:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable sampleWithObservable:](self, "sampleWithObservable:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__CNObservable_sample_scheduler___block_invoke;
  v10[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v10[4] = a3;
  objc_msgSend(v7, "pipelineDescriptionWithOperation:onObservable:", v10, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __33__CNObservable_sample_scheduler___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v2 * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("sample(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sampleWithObservable:(id)a3
{
  id v4;
  _CNSamplingObservable *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = -[_CNSamplingObservable initWithObservable:sampler:]([_CNSamplingObservable alloc], "initWithObservable:sampler:", self, v4);
  -[CNObservable publish](v5, "publish");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__CNObservable_sampleWithObservable___block_invoke;
  v10[3] = &unk_1E29BA320;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", v10, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __37__CNObservable_sampleWithObservable___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "debugPipelineDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("sample(%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

const __CFString *__21__CNObservable_scan___block_invoke()
{
  return CFSTR("scan");
}

void __26__CNObservable_scan_seed___block_invoke_240(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v4);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v3);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = v9;
    v6 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }

}

uint64_t __26__CNObservable_scan_seed___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

__CFString *__26__CNObservable_scan_seed___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {
    v4 = CFSTR("scan(@[])");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scan(%@)"), *(_QWORD *)(a1 + 32));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)skip:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __21__CNObservable_skip___block_invoke;
  v10[3] = &unk_1E29BAC98;
  v10[4] = self;
  v10[5] = a3;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __21__CNObservable_skip___block_invoke_5;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v9[4] = a3;
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", v9, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __21__CNObservable_skip___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[4];

  v3 = a2;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v5 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  v22[3] = *(_QWORD *)(v5 + 8);
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __21__CNObservable_skip___block_invoke_2;
  v19[3] = &unk_1E29BAC70;
  v21 = v22;
  v20 = v3;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __21__CNObservable_skip___block_invoke_3;
  v17[3] = &unk_1E29B9358;
  v18 = v20;
  v12 = v7;
  v13 = 3221225472;
  v14 = __21__CNObservable_skip___block_invoke_4;
  v15 = &unk_1E29B9558;
  v8 = v18;
  v16 = v8;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v19, v17, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v22, 8);
  return v10;
}

uint64_t __21__CNObservable_skip___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (!v3)
    return objc_msgSend(*(id *)(result + 32), "observerDidReceiveResult:", a2);
  *(_QWORD *)(v2 + 24) = v3 - 1;
  return result;
}

uint64_t __21__CNObservable_skip___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __21__CNObservable_skip___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

id __21__CNObservable_skip___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("skip(%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)skipLast:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __25__CNObservable_skipLast___block_invoke;
  v10[3] = &unk_1E29BAC98;
  v10[4] = self;
  v10[5] = a3;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __25__CNObservable_skipLast___block_invoke_6;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v9[4] = a3;
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", v9, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __25__CNObservable_skipLast___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __25__CNObservable_skipLast___block_invoke_2;
  v24[3] = &unk_1E29BA8B8;
  v6 = v3;
  v25 = v6;
  +[CNQueue boundedQueueWithCapacity:overflowHandler:](CNQueue, "boundedQueueWithCapacity:overflowHandler:", v4, v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = objc_opt_class();
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __25__CNObservable_skipLast___block_invoke_3;
  v22[3] = &unk_1E29BA8B8;
  v23 = v7;
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __25__CNObservable_skipLast___block_invoke_4;
  v20[3] = &unk_1E29B9358;
  v21 = v6;
  v15 = v5;
  v16 = 3221225472;
  v17 = __25__CNObservable_skipLast___block_invoke_5;
  v18 = &unk_1E29B9558;
  v19 = v21;
  v10 = v21;
  v11 = v7;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v9, v22, v20, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribe:", v12, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __25__CNObservable_skipLast___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

uint64_t __25__CNObservable_skipLast___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "enqueue:", a2);
}

uint64_t __25__CNObservable_skipLast___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __25__CNObservable_skipLast___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

id __25__CNObservable_skipLast___block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("skipLast(%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)skipUntil:(id)a3
{
  id v4;
  _CNObservableSkipUntilOperator *v5;

  v4 = a3;
  v5 = -[_CNObservableSkipUntilOperator initWithInput:signal:]([_CNObservableSkipUntilOperator alloc], "initWithInput:signal:", self, v4);

  return v5;
}

uint64_t __36__CNObservable_startWith_scheduler___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("startWith(%@)"), *(_QWORD *)(a1 + 32));
}

- (id)switch
{
  void *v3;
  void *v4;

  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable switchWithSchedulerProvider:](self, "switchWithSchedulerProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_12;
  v7[3] = &unk_1E29BACC0;
  v11 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v6 = v3;
  CNRunWithLock(v4, v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "cancel");

}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_12(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_13;
    v4[3] = &unk_1E29B8C10;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v3, "performBlock:", v4);

    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_BYTE *)(v1 + 24) = 0;
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", *(_QWORD *)(a1 + 40));
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_18;
  v8[3] = &unk_1E29BAE00;
  v14 = *(_OWORD *)(a1 + 64);
  v5 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v4;
  v13 = *(id *)(a1 + 56);
  v6 = v4;
  v7 = v3;
  CNRunWithLock(v5, v8);
  objc_msgSend(v6, "_cn_each:", &__block_literal_global_42);

}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __44__CNObservable_switchWithSchedulerProvider___block_invoke_19;
    v8 = &unk_1E29B8C10;
    v3 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "performBlock:", &v5);

    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  }
  *(_BYTE *)(v2 + 24) = 0;
  objc_msgSend(*(id *)(a1 + 56), "setArray:", *(_QWORD *)(a1 + 64), v5, v6, v7, v8);
  return objc_msgSend(*(id *)(a1 + 64), "removeAllObjects");
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", *(_QWORD *)(a1 + 40));
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_20(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_21;
  v5[3] = &unk_1E29B8C10;
  v6 = v2;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4 = v2;
  CNRunWithLock(v3, v5);
  objc_msgSend(v4, "_cn_each:", &__block_literal_global_42);

}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_21(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setArray:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
}

const __CFString *__44__CNObservable_switchWithSchedulerProvider___block_invoke_22()
{
  return CFSTR("switch");
}

- (id)switchMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CNSchedulerProvider defaultProvider](CNSchedulerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable switchMap:schedulerProvider:](self, "switchMap:schedulerProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

const __CFString *__44__CNObservable_switchMap_schedulerProvider___block_invoke()
{
  return CFSTR("switchMap");
}

uint64_t __21__CNObservable_take___block_invoke_4(uint64_t result, uint64_t a2)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "observerDidFailWithError:", a2);
  return result;
}

id __21__CNObservable_take___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("take(%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __25__CNObservable_takeLast___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "enqueue:", a2);
}

uint64_t __25__CNObservable_takeLast___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

id __25__CNObservable_takeLast___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("takeLast(%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__CNObservable_throttle_schedulerProvider___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v2 * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("throttle(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __51__CNObservable_throttle_options_schedulerProvider___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(double *)(a1 + 32);
  if (v3 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v3 * 1000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("throttle(%@, options: 0x%lx)"), v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)throttleFirst:(double)a3 scheduler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  CNObservable *v15;
  double v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__CNObservable_throttleFirst_scheduler___block_invoke;
  v13[3] = &unk_1E29BA890;
  v16 = a3;
  v14 = v6;
  v15 = self;
  v8 = v6;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __40__CNObservable_throttleFirst_scheduler___block_invoke_5;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v12[4] = a3;
  objc_msgSend(v9, "pipelineDescriptionWithOperation:onObservable:", v12, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __40__CNObservable_throttleFirst_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[3];
  double v25;

  v3 = a2;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v25 = v4 - *(double *)(a1 + 48) + -1.0;
  v5 = *(void **)(a1 + 40);
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __40__CNObservable_throttleFirst_scheduler___block_invoke_2;
  v19[3] = &unk_1E29BAEE0;
  v20 = *(id *)(a1 + 32);
  v22 = v24;
  v23 = *(_QWORD *)(a1 + 48);
  v21 = v3;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __40__CNObservable_throttleFirst_scheduler___block_invoke_3;
  v17[3] = &unk_1E29B9358;
  v18 = v21;
  v12 = v7;
  v13 = 3221225472;
  v14 = __40__CNObservable_throttleFirst_scheduler___block_invoke_4;
  v15 = &unk_1E29B9558;
  v8 = v18;
  v16 = v8;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v19, v17, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v24, 8);
  return v10;
}

void __40__CNObservable_throttleFirst_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  if (v3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(double *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "timestamp");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
    objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", v5);
  }

}

uint64_t __40__CNObservable_throttleFirst_scheduler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __40__CNObservable_throttleFirst_scheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

id __40__CNObservable_throttleFirst_scheduler___block_invoke_5(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v2 * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("throttleFirst(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)throttleFirstAndLast:(double)a3 schedulerProvider:(id)a4
{
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[CNObservable throttle:options:schedulerProvider:](self, "throttle:options:schedulerProvider:", 3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__CNObservable_throttleFirstAndLast_schedulerProvider___block_invoke;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v9[4] = a3;
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", v9, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __55__CNObservable_throttleFirstAndLast_schedulerProvider___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v2 * 1000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("throttleFirstAndLast(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)timeInterval
{
  void *v3;
  void *v4;

  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable timeIntervalWithScheduler:](self, "timeIntervalWithScheduler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)timeIntervalWithScheduler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  CNObservable *v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __42__CNObservable_timeIntervalWithScheduler___block_invoke;
  v12 = &unk_1E29BA348;
  v13 = v4;
  v14 = self;
  v5 = v4;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_290, self, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__CNObservable_timeIntervalWithScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  uint64_t v21;

  v3 = a2;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v21 = v4;
  v5 = *(void **)(a1 + 40);
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__CNObservable_timeIntervalWithScheduler___block_invoke_2;
  v16[3] = &unk_1E29BAF08;
  v17 = *(id *)(a1 + 32);
  v19 = v20;
  v18 = v3;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __42__CNObservable_timeIntervalWithScheduler___block_invoke_3;
  v14[3] = &unk_1E29B9358;
  v15 = v18;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __42__CNObservable_timeIntervalWithScheduler___block_invoke_4;
  v12[3] = &unk_1E29B9558;
  v8 = v15;
  v13 = v8;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v16, v14, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v20, 8);
  return v10;
}

void __42__CNObservable_timeIntervalWithScheduler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  CNRelativeTimestamped *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "timestamp");
  v6 = v5;
  v7 = -[CNTimestamped initWithValue:timestamp:]([CNRelativeTimestamped alloc], "initWithValue:timestamp:", v4, v5 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", v7);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

}

uint64_t __42__CNObservable_timeIntervalWithScheduler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __42__CNObservable_timeIntervalWithScheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

const __CFString *__42__CNObservable_timeIntervalWithScheduler___block_invoke_5()
{
  return CFSTR("timeInterval");
}

- (id)timeoutAfterDelay:(double)a3 alternateObservable:(id)a4 schedule:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  double v19;
  _QWORD v20[4];
  id v21;
  id v22;
  CNObservable *v23;
  double v24;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke;
  v20[3] = &unk_1E29BAF50;
  v21 = v9;
  v24 = a3;
  v11 = v8;
  v22 = v11;
  v23 = self;
  v12 = v9;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_7;
  v17[3] = &unk_1E29BA4E8;
  v19 = a3;
  v18 = v11;
  v14 = v11;
  objc_msgSend(v13, "pipelineDescriptionWithOperation:onObservable:", v17, self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNTimeoutAfterDelayCancelationToken *v4;
  double v5;
  uint64_t v6;
  void *v7;
  id v8;
  CNTimeoutAfterDelayCancelationToken *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  CNTimeoutAfterDelayCancelationToken *v33;
  id v34;
  id v35;

  v3 = a2;
  v4 = objc_alloc_init(CNTimeoutAfterDelayCancelationToken);
  v5 = *(double *)(a1 + 56);
  v6 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_2;
  v32[3] = &unk_1E29B9308;
  v33 = v4;
  v7 = *(void **)(a1 + 32);
  v34 = *(id *)(a1 + 40);
  v8 = v3;
  v35 = v8;
  v9 = v4;
  objc_msgSend(v7, "afterDelay:performBlock:", v32, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 48);
  v12 = objc_opt_class();
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_3;
  v30[3] = &unk_1E29BA8B8;
  v31 = v8;
  v27[0] = v6;
  v27[1] = 3221225472;
  v27[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_4;
  v27[3] = &unk_1E29B8C10;
  v28 = v10;
  v29 = v31;
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_5;
  v24[3] = &unk_1E29B9508;
  v13 = v28;
  v25 = v13;
  v26 = v29;
  v14 = v29;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v12, v30, v27, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subscribe:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v9, "addCancelable:", v16);
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_6;
  v21[3] = &unk_1E29B8C10;
  v22 = v16;
  v23 = v13;
  v17 = v13;
  v18 = v16;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return (id)objc_msgSend(*(id *)(a1 + 40), "subscribe:", *(_QWORD *)(a1 + 48));
}

uint64_t __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

uint64_t __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
}

void __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cancel");
  objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", v4);

}

uint64_t __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "cancel");
}

id __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_7(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(double *)(a1 + 40);
  if (v3 >= 1.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fs"), *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fms"), v3 * 1000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "debugPipelineDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("timeout(%@, alternate: %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)timestampWithScheduler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__CNObservable_timestampWithScheduler___block_invoke;
  v9[3] = &unk_1E29B9C70;
  v10 = v4;
  v5 = v4;
  -[CNObservable map:](self, "map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_298, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

CNTimestamped *__39__CNObservable_timestampWithScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNTimestamped *v4;
  CNTimestamped *v5;

  v3 = a2;
  v4 = [CNTimestamped alloc];
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v5 = -[CNTimestamped initWithValue:timestamp:](v4, "initWithValue:timestamp:", v3);

  return v5;
}

const __CFString *__39__CNObservable_timestampWithScheduler___block_invoke_2()
{
  return CFSTR("timestamp");
}

- (id)toArray
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __23__CNObservable_toArray__block_invoke;
  v4[3] = &unk_1E29BAF98;
  objc_copyWeak(&v5, &location);
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

id __23__CNObservable_toArray__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __23__CNObservable_toArray__block_invoke_2;
  v21[3] = &unk_1E29BA8B8;
  v22 = v5;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __23__CNObservable_toArray__block_invoke_3;
  v18[3] = &unk_1E29B8C10;
  v19 = v3;
  v20 = v22;
  v13 = v7;
  v14 = 3221225472;
  v15 = __23__CNObservable_toArray__block_invoke_4;
  v16 = &unk_1E29B9558;
  v17 = v19;
  v8 = v19;
  v9 = v22;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v6, v21, v18, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "subscribe:", v10, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __23__CNObservable_toArray__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __23__CNObservable_toArray__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __23__CNObservable_toArray__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

- (id)subscribe:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("subscribe: must be overridden"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (NSString)debugPipelineDescription
{
  return self->_pipelineDescription;
}

+ (id)observableWithAbsoluteTimestamps:(id)a3 schedulerProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  CNRelativeTimestamped *v22;
  void *v23;
  CNRelativeTimestamped *v24;
  double v25;
  void *v26;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v28 = a1;
  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v5;
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timestamp");
  v13 = v12;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v19, "timestamp", v28);
        v21 = vabdd_f64(v20, v13);
        v22 = [CNRelativeTimestamped alloc];
        objc_msgSend(v19, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[CNTimestamped initWithValue:timestamp:](v22, "initWithValue:timestamp:", v23, v21);

        objc_msgSend(v10, "addObject:", v24);
        objc_msgSend(v19, "timestamp");
        v13 = v25;

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
  }

  objc_msgSend(v28, "observableWithRelativeTimestamps:schedulerProvider:", v10, v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)observableWithRelativeTimestamps:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v6))
  {
    +[CNObservable emptyObservable](CNObservable, "emptyObservable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__CNObservable_TimestampReplay__observableWithRelativeTimestamps_schedulerProvider___block_invoke;
    v10[3] = &unk_1E29BA890;
    v11 = v6;
    v12 = v7;
    v13 = a1;
    +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

CNCancelationToken *__84__CNObservable_TimestampReplay__observableWithRelativeTimestamps_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNQueue *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CNCancelationToken *v11;
  void *v12;
  double v13;
  double v14;
  CNCancelationToken *v15;
  id v16;
  id v17;
  CNQueue *v18;
  id v19;
  void *v20;
  CNCancelationToken *v21;
  _QWORD v23[4];
  CNQueue *v24;
  id v25;
  CNCancelationToken *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(CNQueue);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        -[CNQueue enqueue:](v4, "enqueue:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.reactive.relative-timestamps.downstream"));
  v11 = objc_alloc_init(CNCancelationToken);
  -[CNQueue peek](v4, "peek");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timestamp");
  v14 = v13;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__CNObservable_TimestampReplay__observableWithRelativeTimestamps_schedulerProvider___block_invoke_2;
  v23[3] = &unk_1E29BB6E0;
  v28 = *(_QWORD *)(a1 + 48);
  v24 = v4;
  v25 = v3;
  v15 = v11;
  v26 = v15;
  v27 = v10;
  v16 = v10;
  v17 = v3;
  v18 = v4;
  v19 = (id)objc_msgSend(v16, "afterDelay:performBlock:", v23, v14);
  v20 = v27;
  v21 = v15;

  return v21;
}

uint64_t __84__CNObservable_TimestampReplay__observableWithRelativeTimestamps_schedulerProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 64), "sendNextTimestampFromQueue:toObserver:untilCanceled:scheduler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (void)sendNextTimestampFromQueue:(id)a3 toObserver:(id)a4 untilCanceled:(id)a5 scheduler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count") && (objc_msgSend(v12, "isCanceled") & 1) == 0)
  {
    objc_msgSend(v10, "dequeue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "observerDidReceiveResult:", v15);

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "peek");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timestamp");
      v18 = v17;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __95__CNObservable_TimestampReplay__sendNextTimestampFromQueue_toObserver_untilCanceled_scheduler___block_invoke;
      v20[3] = &unk_1E29BB6E0;
      v25 = a1;
      v21 = v10;
      v22 = v11;
      v23 = v12;
      v24 = v13;
      v19 = (id)objc_msgSend(v24, "afterDelay:performBlock:", v20, v18);

    }
    else
    {
      objc_msgSend(v11, "observerDidComplete");
    }

  }
}

uint64_t __95__CNObservable_TimestampReplay__sendNextTimestampFromQueue_toObserver_untilCanceled_scheduler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 64), "sendNextTimestampFromQueue:toObserver:untilCanceled:scheduler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (id)scannerResultsInString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v3))
  {
    +[CNResult successWithValue:](CNResult, "successWithValue:", MEMORY[0x1E0C9AA60]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1CE70], "scanString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNResult successWithValue:](CNResult, "successWithValue:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)asyncScannerResultsInString:(id)a3
{
  id v3;
  void *v4;
  CNPromise *v5;
  uint64_t v6;
  void *v7;
  CNPromise *v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[4];
  CNPromise *v13;

  v3 = a3;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v3))
  {
    +[CNFuture futureWithResult:](CNFuture, "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(CNPromise);
    v6 = MEMORY[0x1E0C809B0];
    v7 = (void *)MEMORY[0x1E0D1CE70];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__CNObservable_DataDetectors__asyncScannerResultsInString___block_invoke;
    v12[3] = &unk_1E29BB758;
    v13 = v5;
    v8 = v5;
    v9 = objc_msgSend(v7, "scanString:completionBlock:", v3, v12);
    -[CNPromise future](v8, "future");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __59__CNObservable_DataDetectors__asyncScannerResultsInString___block_invoke_2;
    v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v11[4] = v9;
    objc_msgSend(v4, "addFailureBlock:", v11);

  }
  return v4;
}

uint64_t __59__CNObservable_DataDetectors__asyncScannerResultsInString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

uint64_t __59__CNObservable_DataDetectors__asyncScannerResultsInString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = +[CNFoundationError isCanceledError:](CNFoundationError, "isCanceledError:", a2);
  if ((_DWORD)result)
    return objc_msgSend(MEMORY[0x1E0D1CE70], "cancelJob:", *(_QWORD *)(a1 + 32));
  return result;
}

+ (id)observableWithScannerResultsInString:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v3))
  {
    +[CNObservable emptyObservable](CNObservable, "emptyObservable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke;
    v6[3] = &unk_1E29BA2F8;
    v7 = v3;
    +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

CNCancelationToken *__68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNCancelationToken *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CNCancelationToken *v8;
  id v9;
  CNCancelationToken *v10;
  CNCancelationToken *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  CNCancelationToken *v16;

  v3 = a2;
  v4 = objc_alloc_init(CNCancelationToken);
  v5 = (void *)MEMORY[0x1E0D1CE70];
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_2;
  v14[3] = &unk_1E29BB7C8;
  v15 = v3;
  v8 = v4;
  v16 = v8;
  v9 = v3;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_5;
  v13[3] = &__block_descriptor_40_e5_v8__0l;
  v13[4] = objc_msgSend(v5, "scanString:completionBlock:", v7, v14);
  -[CNCancelationToken addCancelationBlock:](v8, "addCancelationBlock:", v13);
  v10 = v16;
  v11 = v8;

  return v11;
}

void __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_3;
  v8[3] = &unk_1E29BB7A0;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(a2, "_cn_each:untilCancelled:", v8, *(_QWORD *)(a1 + 40));
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_4;
  v6[3] = &unk_1E29B9358;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "performBlock:", v6);

}

uint64_t __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

uint64_t __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D1CE70], "cancelJob:", *(_QWORD *)(a1 + 32));
}

+ (id)observableWithScannerResultsOfType:(unint64_t)a3 inString:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a1, "observableWithScannerResultsInString:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binderTypeForResultType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v7))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__CNObservable_DataDetectors__observableWithScannerResultsOfType_inString___block_invoke;
    v10[3] = &unk_1E29BB7F0;
    v11 = v7;
    objc_msgSend(v6, "filter:", v10);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

uint64_t __75__CNObservable_DataDetectors__observableWithScannerResultsOfType_inString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)binderTypeForResultType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return &stru_1E29BCC70;
  else
    return **((id **)&unk_1E29BB830 + a3 - 1);
}

+ (id)observableWithEmailAddressesInString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "observableWithScannerResultsOfType:inString:", 2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "map:", &__block_literal_global_53);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __68__CNObservable_DataDetectors__observableWithEmailAddressesInString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchedString");
}

+ (id)observableOnDefaultNotificationCenterWithName:(id)a3 object:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observableOnNotificationCenter:withName:object:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

uint64_t __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
}

+ (id)observableOnDarwinNotificationCenterWithName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__CNObservable_DarwinNotify__observableOnDarwinNotificationCenterWithName___block_invoke;
  v7[3] = &unk_1E29BA2F8;
  v8 = v3;
  v4 = v3;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __75__CNObservable_DarwinNotify__observableOnDarwinNotificationCenterWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  __CFNotificationCenter *v16;

  v3 = a2;
  DarwinObservers();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, v5);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_handler, *(CFStringRef *)(a1 + 32), 0, CFNotificationSuspensionBehaviorDrop);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__CNObservable_DarwinNotify__observableOnDarwinNotificationCenterWithName___block_invoke_2;
  v12[3] = &unk_1E29BA840;
  v13 = v4;
  v14 = v5;
  v15 = v3;
  v16 = DarwinNotifyCenter;
  v7 = v3;
  v8 = v5;
  v9 = v4;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __75__CNObservable_DarwinNotify__observableOnDarwinNotificationCenterWithName___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  CFNotificationCenterRemoveEveryObserver(*(CFNotificationCenterRef *)(a1 + 56), *(const void **)(a1 + 48));
}

+ (id)observableForKeyPath:(id)a3 ofObject:(id)a4 withOptions:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;

  v7 = a3;
  v8 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__CNObservable_NSKeyValueObserving__observableForKeyPath_ofObject_withOptions___block_invoke;
  v13[3] = &unk_1E29BA890;
  v14 = v8;
  v15 = v7;
  v16 = a5;
  v9 = v7;
  v10 = v8;
  +[CNObservable observableWithBlock:](CNObservable, "observableWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __79__CNObservable_NSKeyValueObserving__observableForKeyPath_ofObject_withOptions___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  _CNKeyValueObserverHandler *v4;
  _CNKeyValueObserverHandler *v5;
  void *v6;
  _QWORD v8[4];
  _CNKeyValueObserverHandler *v9;

  v3 = a2;
  v4 = -[_CNKeyValueObserverHandler initWithObject:keyPath:observer:]([_CNKeyValueObserverHandler alloc], "initWithObject:keyPath:observer:", a1[4], a1[5], v3);

  -[_CNKeyValueObserverHandler startObservingWithOptions:](v4, "startObservingWithOptions:", a1[6]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__CNObservable_NSKeyValueObserving__observableForKeyPath_ofObject_withOptions___block_invoke_2;
  v8[3] = &unk_1E29B9358;
  v9 = v4;
  v5 = v4;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __79__CNObservable_NSKeyValueObserving__observableForKeyPath_ofObject_withOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopObserving");
}

+ (void)observableWithResult:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18F80C000, log, OS_LOG_TYPE_FAULT, "Nil result passed to observableWithResult:", v1, 2u);
}

void __29__CNObservable_dematerialize__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_18F80C000, a2, OS_LOG_TYPE_DEBUG, "Attempt to dematerialize a non-event: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
