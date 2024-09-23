@implementation EFObservable

EFCancelationToken *__51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  id v25[2];
  id location;
  _QWORD v27[4];
  int v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__5;
  v29[4] = __Block_byref_object_dispose__5;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2810000000;
  v27[3] = &unk_1B10E80F5;
  v28 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v4);
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_38;
  v19[3] = &unk_1E62A6C50;
  v22 = v27;
  v23 = v31;
  v24 = v29;
  v6 = *(void **)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v25[1] = *(id *)(a1 + 48);
  objc_copyWeak(v25, &location);
  v7 = v3;
  v21 = v7;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_3;
  v14[3] = &unk_1E62A6C78;
  v16 = v27;
  v17 = v29;
  objc_copyWeak(&v18, &location);
  v15 = v7;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_4;
  v12[3] = &unk_1E62A5888;
  v8 = v15;
  v13 = v8;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v19, v14, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EFCancelationToken addCancelable:](v4, "addCancelable:", v10);
  objc_destroyWeak(&v18);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
  return v4;
}

EFCancelationToken *__26__EFObservable_observeOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;
  uint64_t v5;
  void *v6;
  EFCancelationToken *v7;
  id v8;
  void *v9;
  void *v10;
  EFCancelationToken *v11;
  _QWORD v13[4];
  id v14;
  EFCancelationToken *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  EFCancelationToken *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  EFCancelationToken *v23;
  id v24;

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __26__EFObservable_observeOn___block_invoke_2;
  v21[3] = &unk_1E62A6B10;
  v6 = *(void **)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v23 = v4;
  v24 = v3;
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __26__EFObservable_observeOn___block_invoke_4;
  v17[3] = &unk_1E62A5ED8;
  v18 = *(id *)(a1 + 40);
  v19 = v23;
  v20 = v24;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __26__EFObservable_observeOn___block_invoke_6;
  v13[3] = &unk_1E62A6B38;
  v14 = *(id *)(a1 + 40);
  v7 = v19;
  v15 = v7;
  v8 = v20;
  v16 = v8;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v21, v17, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EFCancelationToken addCancelable:](v7, "addCancelable:", v10);
  v11 = v7;

  return v11;
}

EFCancelationToken *__21__EFObservable_take___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;
  uint64_t v5;
  void *v6;
  EFCancelationToken *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  EFCancelationToken *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  EFCancelationToken *v20;
  uint64_t v21;

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __21__EFObservable_take___block_invoke_2;
  v18[3] = &unk_1E62A6CC8;
  v6 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 40);
  v19 = v3;
  v7 = v4;
  v20 = v7;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __21__EFObservable_take___block_invoke_3;
  v16[3] = &unk_1E62A5860;
  v17 = v19;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __21__EFObservable_take___block_invoke_4;
  v14[3] = &unk_1E62A5888;
  v8 = v17;
  v15 = v8;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v18, v16, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFCancelationToken addCancelable:](v7, "addCancelable:", v10);

  v11 = v15;
  v12 = v7;

  return v12;
}

EFCancelationToken *__21__EFObservable_skip___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;
  uint64_t v5;
  void *v6;
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
  uint64_t v20;

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __21__EFObservable_skip___block_invoke_2;
  v18[3] = &unk_1E62A6D18;
  v6 = *(void **)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 40);
  v19 = v3;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __21__EFObservable_skip___block_invoke_3;
  v16[3] = &unk_1E62A5860;
  v17 = v19;
  v11 = v5;
  v12 = 3221225472;
  v13 = __21__EFObservable_skip___block_invoke_4;
  v14 = &unk_1E62A5888;
  v7 = v17;
  v15 = v7;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v18, v16, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFCancelationToken addCancelable:](v4, "addCancelable:", v9);

  return v4;
}

id __20__EFObservable_map___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __20__EFObservable_map___block_invoke_2;
  v17[3] = &unk_1E62A5FC8;
  v18 = v3;
  v19 = *(id *)(a1 + 40);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __20__EFObservable_map___block_invoke_3;
  v15[3] = &unk_1E62A5860;
  v16 = v18;
  v10 = v5;
  v11 = 3221225472;
  v12 = __20__EFObservable_map___block_invoke_4;
  v13 = &unk_1E62A5888;
  v6 = v16;
  v14 = v6;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v17, v15, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

EFCancelationToken *__28__EFObservable_concatenate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  +[_EFConcatenatingObservable subscribeObserver:toObservables:unless:](_EFConcatenatingObservable, "subscribeObserver:toObservables:unless:", v3, *(_QWORD *)(a1 + 32), v4);

  return v4;
}

EFCancelationToken *__48__EFObservable_observableOnNotifyTokenWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;
  const char *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  int v18;
  _QWORD handler[4];
  id v20;
  int out_token;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  out_token = -1;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __48__EFObservable_observableOnNotifyTokenWithName___block_invoke_2;
  handler[3] = &unk_1E62A6A38;
  v8 = v3;
  v20 = v8;
  LODWORD(v5) = notify_register_dispatch(v5, &out_token, v6, handler);

  if ((_DWORD)v5)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *__error();
    v22 = *MEMORY[0x1E0CB2D50];
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = __error();
    objc_msgSend(v11, "stringWithUTF8String:", strerror(*v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "observerDidFailWithError:", v15);

  }
  else
  {
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __48__EFObservable_observableOnNotifyTokenWithName___block_invoke_3;
    v17[3] = &__block_descriptor_36_e5_v8__0l;
    v18 = out_token;
    -[EFCancelationToken addCancelationBlock:](v4, "addCancelationBlock:", v17);
  }

  return v4;
}

- (id)distinctUntilChanged
{
  return -[_EFDistinctUntilChangedObservable initWithObservable:]([_EFDistinctUntilChangedObservable alloc], "initWithObservable:", self);
}

- (id)doOnError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __26__EFObservable_doOnError___block_invoke;
  v9[3] = &unk_1E62A6B88;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)observableOnNotifyTokenWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__EFObservable_observableOnNotifyTokenWithName___block_invoke;
  v8[3] = &unk_1E62A6918;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "observableWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __48__EFObservable_observableOnNotifyTokenWithName___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  uint32_t state;
  void *v6;
  void *v7;
  uint64_t state64;

  v4 = (void *)MEMORY[0x1B5E15A60]();
  state64 = 0;
  state = notify_get_state(a2, &state64);
  v6 = *(void **)(a1 + 32);
  if (state)
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", state64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "observerDidReceiveResult:", v7);

  objc_autoreleasePoolPop(v4);
}

+ (id)observableOnDefaultNotificationCenterWithName:(id)a3 object:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observableOnNotificationCenter:name:object:", v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)observableOnNotificationCenter:(id)a3 name:(id)a4 object:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke;
  v16[3] = &unk_1E62A6A10;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  objc_msgSend(a1, "observableWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  id v6;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  os_unfair_lock_lock(v2);
  if (--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v6 = 0;
  }
  else
  {
    v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  os_unfair_lock_unlock(v2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && v6 && (objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v6);

}

uint64_t __26__EFObservable_observeOn___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", *(_QWORD *)(a1 + 48));
  return result;
}

BOOL __48__EFObservable_observableWithResults_scheduler___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "unsignedIntegerValue") < *(_QWORD *)(a1 + 32);
}

EFCancelationToken *__22__EFObservable_merge___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  +[_EFMergingObservable subscribeObserver:toObservables:unless:](_EFMergingObservable, "subscribeObserver:toObservables:unless:", v3, *(_QWORD *)(a1 + 32), v4);

  return v4;
}

id __48__EFObservable_observableWithResults_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "unsignedIntegerValue") + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __48__EFObservable_observableWithResults_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "unsignedIntegerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __21__EFObservable_skip___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  v6 = v3;
  if (v5)
    *(_QWORD *)(v4 + 24) = v5 - 1;
  else
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v3);

}

- (id)map:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFObservable.m"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transform"));

  }
  v6 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __20__EFObservable_map___block_invoke;
  v11[3] = &unk_1E62A6B88;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "observableWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)concatenate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__EFObservable_concatenate___block_invoke;
  v8[3] = &unk_1E62A6918;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "observableWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)observableObserver
{
  return objc_alloc_init(_EFManualObservable);
}

- (id)subscribeWithResultBlock:(id)a3
{
  void *v4;
  void *v5;

  +[EFObserver observerWithResultBlock:](EFObserver, "observerWithResultBlock:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable subscribe:](self, "subscribe:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)observeOn:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __26__EFObservable_observeOn___block_invoke;
  v9[3] = &unk_1E62A6AE8;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debounceWithTimeInterval:(double)a3 scheduler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  double v13;

  v6 = a4;
  v7 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke;
  v11[3] = &unk_1E62A6CA0;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = a3;
  objc_msgSend(v7, "observableWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)observableWithBlock:(id)a3
{
  id v3;
  _EFBlockObservable *v4;

  v3 = a3;
  v4 = -[_EFBlockObservable initWithBlock:]([_EFBlockObservable alloc], "initWithBlock:", v3);

  return v4;
}

- (id)take:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = a3;
  v4 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__EFObservable_take___block_invoke;
  v7[3] = &unk_1E62A6CF0;
  v7[4] = self;
  v7[5] = v8;
  objc_msgSend(v4, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return v5;
}

- (id)skip:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = a3;
  v4 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__EFObservable_skip___block_invoke;
  v7[3] = &unk_1E62A6CF0;
  v7[4] = self;
  v7[5] = v8;
  objc_msgSend(v4, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v8, 8);
  return v5;
}

+ (id)merge:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __22__EFObservable_merge___block_invoke;
  v8[3] = &unk_1E62A6918;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "observableWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __26__EFObservable_observeOn___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__EFObservable_observeOn___block_invoke_3;
  v6[3] = &unk_1E62A5ED8;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

void __20__EFObservable_map___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v1, "observerDidReceiveResult:", v2);
  v3 = v4;
  if (!v4)
  {

    v3 = 0;
  }

}

void __21__EFObservable_take___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v3),
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24),
        !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
  {
    objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
    objc_msgSend(*(id *)(a1 + 40), "cancel");
  }

}

void __26__EFObservable_observeOn___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__EFObservable_observeOn___block_invoke_5;
  v3[3] = &unk_1E62A58B0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performBlock:", v3);

}

uint64_t __26__EFObservable_observeOn___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
  return result;
}

id __26__EFObservable_doOnError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __26__EFObservable_doOnError___block_invoke_2;
  v18[3] = &unk_1E62A5928;
  v19 = v3;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __26__EFObservable_doOnError___block_invoke_3;
  v16[3] = &unk_1E62A5860;
  v17 = v19;
  v10 = v5;
  v11 = 3221225472;
  v12 = __26__EFObservable_doOnError___block_invoke_4;
  v13 = &unk_1E62A5FF0;
  v6 = v17;
  v14 = v6;
  v15 = *(id *)(a1 + 40);
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v18, v16, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debounceWithTimeInterval:(double)a3
{
  void *v5;
  void *v6;

  +[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable debounceWithTimeInterval:scheduler:](self, "debounceWithTimeInterval:scheduler:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)startWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[EFScheduler immediateScheduler](EFScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable startWith:scheduler:](self, "startWith:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)startWith:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "observableWithResults:scheduler:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "concatenate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)observableWithResults:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__EFObservable_observableWithResults_scheduler___block_invoke;
  v14[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  v14[4] = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__EFObservable_observableWithResults_scheduler___block_invoke_3;
  v12[3] = &unk_1E62A6980;
  v9 = v6;
  v13 = v9;
  objc_msgSend(a1, "observableWithInitialState:condition:nextState:resultSelector:scheduler:", &unk_1E62BDBB8, v14, &__block_literal_global_22, v12, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 scheduler:(id)a7
{
  objc_msgSend(a1, "observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:", a3, a4, a5, a6, 0, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _EFGeneratorObservable *v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = -[_EFGeneratorObservable initWithInitialState:condition:nextState:resultSelector:delay:scheduler:]([_EFGeneratorObservable alloc], "initWithInitialState:condition:nextState:resultSelector:delay:scheduler:", v13, v14, v15, v16, v17, v18);

  return v19;
}

EFCancelationToken *__59__EFObservable_observableOnNotificationCenter_name_object___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  EFCancelationToken *v10;
  void *v11;
  id v12;
  void *v13;
  EFCancelationToken *v14;
  _QWORD v16[4];
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  EFCancelationToken *v21;

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke_2;
  v19[3] = &unk_1E62A69E8;
  v9 = v3;
  v20 = v9;
  v10 = v4;
  v21 = v10;
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, v7, 0, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke_3;
  v16[3] = &unk_1E62A58B0;
  v17 = *(id *)(a1 + 32);
  v18 = v11;
  v12 = v11;
  -[EFCancelationToken addCancelationBlock:](v10, "addCancelationBlock:", v16);
  v13 = v18;
  v14 = v10;

  return v14;
}

+ (id)combineLatest:(id)a3
{
  id v3;
  _EFCombineLatestObservable *v4;
  _EFCombineLatestObservable *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[_EFCombineLatestObservable initWithObservables:]([_EFCombineLatestObservable alloc], "initWithObservables:", v3);
  }
  else
  {
    +[EFObservable emptyObservable](EFObservable, "emptyObservable");
    v4 = (_EFCombineLatestObservable *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

uint64_t __26__EFObservable_doOnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

+ (id)observableWithFuture:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__EFObservable_observableWithFuture___block_invoke;
  v8[3] = &unk_1E62A6918;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "observableWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

EFCancelationToken *__37__EFObservable_observableWithFuture___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;
  void *v5;
  uint64_t v6;
  EFCancelationToken *v7;
  id v8;
  void *v9;
  EFCancelationToken *v10;
  id v11;
  void *v12;
  EFCancelationToken *v13;
  _QWORD v15[4];
  EFCancelationToken *v16;
  id v17;
  _QWORD v18[4];
  EFCancelationToken *v19;
  id v20;

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __37__EFObservable_observableWithFuture___block_invoke_2;
  v18[3] = &unk_1E62A57C0;
  v7 = v4;
  v19 = v7;
  v8 = v3;
  v20 = v8;
  objc_msgSend(v5, "addSuccessBlock:", v18);
  v9 = *(void **)(a1 + 32);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __37__EFObservable_observableWithFuture___block_invoke_3;
  v15[3] = &unk_1E62A5810;
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  objc_msgSend(v9, "addFailureBlock:", v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __37__EFObservable_observableWithFuture___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", v3);
    objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
  }

}

void __37__EFObservable_observableWithFuture___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", v3);

}

+ (id)observableWithResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__EFObservable_observableWithResult___block_invoke;
  v8[3] = &unk_1E62A6918;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "observableWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

EFCancelationToken *__37__EFObservable_observableWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;

  v3 = a2;
  objc_msgSend(v3, "observerDidReceiveResult:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "observerDidComplete");
  v4 = objc_alloc_init(EFCancelationToken);

  return v4;
}

+ (id)observableWithResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[EFScheduler immediateScheduler](EFScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observableWithResults:scheduler:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)observableWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__EFObservable_observableWithError___block_invoke;
  v8[3] = &unk_1E62A6918;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "observableWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

EFCancelationToken *__36__EFObservable_observableWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;

  v3 = a2;
  objc_msgSend(v3, "observerDidFailWithError:", *(_QWORD *)(a1 + 32));
  v4 = objc_alloc_init(EFCancelationToken);

  return v4;
}

+ (id)observableWithTimeInterval:(double)a3 scheduler:(id)a4
{
  objc_msgSend(a1, "observableAfterDelay:interval:scheduler:", a4, a3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)observableAfterDelay:(double)a3 scheduler:(id)a4
{
  objc_msgSend(a1, "observableAfterDelay:interval:scheduler:", a4, a3, 1.79769313e308);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)observableAfterDelay:(double)a3 interval:(double)a4 scheduler:(id)a5
{
  _QWORD v6[6];
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke;
  v7[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  *(double *)&v7[4] = a4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke_2_18;
  v6[3] = &__block_descriptor_48_e18_d16__0__NSNumber_8l;
  *(double *)&v6[4] = a3;
  *(double *)&v6[5] = a4;
  +[EFObservable observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:](EFObservable, "observableWithInitialState:condition:nextState:resultSelector:delay:scheduler:", &unk_1E62BDBB8, v7, &__block_literal_global_12_0, &__block_literal_global_16, v6, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  v4 = v3;
  v5 = 1.79769313e308 - *(double *)(a1 + 32) > 2.22044605e-16 || objc_msgSend(v3, "integerValue") < 1;

  return v5;
}

id __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "integerValue"))
    v3 = v2;
  else
    v3 = &unk_1E62BDBD0;

  return v3;
}

id __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke_14()
{
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return (id)objc_claimAutoreleasedReturnValue();
}

double __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke_2_18(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "integerValue");
  v4 = 40;
  if (!v3)
    v4 = 32;
  return *(double *)(a1 + v4);
}

uint64_t __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

uint64_t __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__EFObservable_observableOnNotifyTokenWithName___block_invoke_3(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(a1 + 32));
}

+ (id)neverObservable
{
  return (id)objc_msgSend(a1, "observableWithBlock:", &__block_literal_global_32);
}

EFCancelationToken *__31__EFObservable_neverObservable__block_invoke()
{
  return objc_alloc_init(EFCancelationToken);
}

+ (id)emptyObservable
{
  return (id)objc_msgSend(a1, "observableWithBlock:", &__block_literal_global_33);
}

EFCancelationToken *__31__EFObservable_emptyObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  EFCancelationToken *v3;

  v2 = a2;
  objc_msgSend(v2, "observerDidComplete");
  v3 = objc_alloc_init(EFCancelationToken);

  return v3;
}

- (id)subscribeOn:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  EFObservable *v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__EFObservable_subscribeOn___block_invoke;
  v9[3] = &unk_1E62A6AE8;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

EFCancelationToken *__28__EFObservable_subscribeOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;
  void *v5;
  EFCancelationToken *v6;
  uint64_t v7;
  id v8;
  void *v9;
  EFCancelationToken *v10;
  _QWORD v12[4];
  EFCancelationToken *v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v5 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__EFObservable_subscribeOn___block_invoke_2;
  v12[3] = &unk_1E62A6AC0;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v8 = v3;
  v15 = v8;
  objc_msgSend(v5, "performCancelableBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFCancelationToken addCancelable:](v6, "addCancelable:", v9);
  v10 = v6;

  return v10;
}

void __28__EFObservable_subscribeOn___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subscribe:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addCancelable:");

}

void __26__EFObservable_observeOn___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__EFObservable_observeOn___block_invoke_7;
  v6[3] = &unk_1E62A5ED8;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

uint64_t __26__EFObservable_observeOn___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", *(_QWORD *)(a1 + 48));
  return result;
}

- (id)allObjects:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[EFPromise promise](EFPromise, "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EFObserver observerWithCompletionHandler:](EFObserver, "observerWithCompletionHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable subscribe:](self, "subscribe:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "result:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)doOnSubscribe:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__EFObservable_doOnSubscribe___block_invoke;
  v9[3] = &unk_1E62A6B60;
  v6 = v4;
  v9[4] = self;
  v10 = v6;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __30__EFObservable_doOnSubscribe___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "subscribe:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)doOnNext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __25__EFObservable_doOnNext___block_invoke;
  v9[3] = &unk_1E62A6B88;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __25__EFObservable_doOnNext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __25__EFObservable_doOnNext___block_invoke_2;
  v17[3] = &unk_1E62A5DC0;
  v5 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v18 = v3;
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __25__EFObservable_doOnNext___block_invoke_3;
  v15[3] = &unk_1E62A5860;
  v16 = v18;
  v10 = v4;
  v11 = 3221225472;
  v12 = __25__EFObservable_doOnNext___block_invoke_4;
  v13 = &unk_1E62A5888;
  v6 = v16;
  v14 = v6;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v17, v15, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __25__EFObservable_doOnNext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v3);

}

uint64_t __25__EFObservable_doOnNext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __25__EFObservable_doOnNext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

- (id)doOnCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__EFObservable_doOnCompletion___block_invoke;
  v9[3] = &unk_1E62A6B88;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __31__EFObservable_doOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __31__EFObservable_doOnCompletion___block_invoke_2;
  v18[3] = &unk_1E62A5928;
  v19 = v3;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __31__EFObservable_doOnCompletion___block_invoke_3;
  v15[3] = &unk_1E62A64F0;
  v16 = v19;
  v17 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = 3221225472;
  v12 = __31__EFObservable_doOnCompletion___block_invoke_4;
  v13 = &unk_1E62A5888;
  v6 = v16;
  v14 = v6;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v18, v15, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __31__EFObservable_doOnCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

uint64_t __31__EFObservable_doOnCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __31__EFObservable_doOnCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

uint64_t __26__EFObservable_doOnError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

void __26__EFObservable_doOnError___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)doOnCancel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27__EFObservable_doOnCancel___block_invoke;
  v9[3] = &unk_1E62A6B88;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __27__EFObservable_doOnCancel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[3];
  char v20;

  v3 = a2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 1;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __27__EFObservable_doOnCancel___block_invoke_2;
  v18[3] = &unk_1E62A6BB0;
  v18[4] = v19;
  objc_msgSend(v5, "doOnCompletion:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __27__EFObservable_doOnCancel___block_invoke_3;
  v17[3] = &unk_1E62A6BD8;
  v17[4] = v19;
  objc_msgSend(v6, "doOnError:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribe:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v4;
  v12 = 3221225472;
  v13 = __27__EFObservable_doOnCancel___block_invoke_4;
  v14 = &unk_1E62A6C00;
  v16 = v19;
  v15 = *(id *)(a1 + 40);
  +[EFCancelationToken tokenWithCancelationBlock:](EFCancelationToken, "tokenWithCancelationBlock:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addCancelable:", v8, v11, v12, v13, v14);

  _Block_object_dispose(v19, 8);
  return v9;
}

uint64_t __27__EFObservable_doOnCancel___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __27__EFObservable_doOnCancel___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __27__EFObservable_doOnCancel___block_invoke_4(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (id)doOnTerminate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__EFObservable_doOnTerminate___block_invoke;
  v9[3] = &unk_1E62A6B88;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __30__EFObservable_doOnTerminate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __30__EFObservable_doOnTerminate___block_invoke_2;
  v16[3] = &unk_1E62A5928;
  v17 = v3;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __30__EFObservable_doOnTerminate___block_invoke_3;
  v13[3] = &unk_1E62A64F0;
  v14 = v17;
  v15 = *(id *)(a1 + 40);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __30__EFObservable_doOnTerminate___block_invoke_4;
  v10[3] = &unk_1E62A5FF0;
  v6 = v14;
  v11 = v6;
  v12 = *(id *)(a1 + 40);
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v16, v13, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribe:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __30__EFObservable_doOnTerminate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", a2);
}

uint64_t __30__EFObservable_doOnTerminate___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __30__EFObservable_doOnTerminate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_38(uint64_t a1, void *a2)
{
  id v4;
  os_unfair_lock_s *v5;
  void *v6;
  double v7;
  id v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  uint64_t v12;
  id v13;

  v4 = a2;
  v5 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  os_unfair_lock_lock(v5);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  os_unfair_lock_unlock(v5);
  v6 = *(void **)(a1 + 32);
  v7 = *(double *)(a1 + 80);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_2;
  v9[3] = &unk_1E62A6C28;
  v11 = *(_OWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 64);
  objc_copyWeak(&v13, (id *)(a1 + 72));
  v10 = *(id *)(a1 + 40);
  v8 = (id)objc_msgSend(v6, "afterDelay:performBlock:", v9, v7);

  objc_destroyWeak(&v13);
}

void __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  os_unfair_lock_lock(v2);
  v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  os_unfair_lock_unlock(v2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCanceled") & 1) == 0)
  {
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v7);
    objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
  }

}

uint64_t __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

- (id)delay:(double)a3 scheduler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  double v13;

  v6 = a4;
  v7 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__EFObservable_delay_scheduler___block_invoke;
  v11[3] = &unk_1E62A6CA0;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = a3;
  objc_msgSend(v7, "observableWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

EFCancelationToken *__32__EFObservable_delay_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EFCancelationToken *v4;
  uint64_t v5;
  void *v6;
  EFCancelationToken *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  EFCancelationToken *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  EFCancelationToken *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  EFCancelationToken *v23;
  id v24;
  uint64_t v25;

  v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __32__EFObservable_delay_scheduler___block_invoke_2;
  v21[3] = &unk_1E62A5E60;
  v6 = *(void **)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v25 = *(_QWORD *)(a1 + 48);
  v23 = v4;
  v24 = v3;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __32__EFObservable_delay_scheduler___block_invoke_4;
  v16[3] = &unk_1E62A57E8;
  v17 = *(id *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 48);
  v7 = v23;
  v18 = v7;
  v19 = v24;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __32__EFObservable_delay_scheduler___block_invoke_6;
  v14[3] = &unk_1E62A5888;
  v8 = v19;
  v15 = v8;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v21, v16, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFCancelationToken addCancelable:](v7, "addCancelable:", v10);

  v11 = v15;
  v12 = v7;

  return v12;
}

void __32__EFObservable_delay_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(double *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__EFObservable_delay_scheduler___block_invoke_3;
  v8[3] = &unk_1E62A5ED8;
  v5 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v6 = v3;
  v7 = (id)objc_msgSend(v5, "afterDelay:performBlock:", v8, v4);

}

uint64_t __32__EFObservable_delay_scheduler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", *(_QWORD *)(a1 + 48));
  return result;
}

void __32__EFObservable_delay_scheduler___block_invoke_4(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(double *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__EFObservable_delay_scheduler___block_invoke_5;
  v5[3] = &unk_1E62A58B0;
  v3 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v4 = (id)objc_msgSend(v3, "afterDelay:performBlock:", v5, v2);

}

uint64_t __32__EFObservable_delay_scheduler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
  return result;
}

uint64_t __32__EFObservable_delay_scheduler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

- (id)first
{
  return -[EFObservable take:](self, "take:", 1);
}

uint64_t __21__EFObservable_take___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __21__EFObservable_take___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

uint64_t __21__EFObservable_skip___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __21__EFObservable_skip___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

- (id)filter:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFObservable.m"), 485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filter"));

  }
  v6 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __23__EFObservable_filter___block_invoke;
  v11[3] = &unk_1E62A6B88;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "observableWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __23__EFObservable_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __23__EFObservable_filter___block_invoke_2;
  v17[3] = &unk_1E62A5DC0;
  v5 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v18 = v3;
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __23__EFObservable_filter___block_invoke_3;
  v15[3] = &unk_1E62A5860;
  v16 = v18;
  v10 = v4;
  v11 = 3221225472;
  v12 = __23__EFObservable_filter___block_invoke_4;
  v13 = &unk_1E62A5888;
  v6 = v16;
  v14 = v6;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v17, v15, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __23__EFObservable_filter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v3);

}

uint64_t __23__EFObservable_filter___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __23__EFObservable_filter___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

uint64_t __20__EFObservable_map___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __20__EFObservable_map___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

- (id)multicast:(id)a3
{
  id v4;
  _EFConnectableObservable *v5;

  v4 = a3;
  v5 = -[_EFConnectableObservable initWithObservable:subject:]([_EFConnectableObservable alloc], "initWithObservable:subject:", self, v4);

  return v5;
}

- (id)publish
{
  void *v3;
  void *v4;

  +[EFObservable observableObserver](EFObservable, "observableObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable multicast:](self, "multicast:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)replay
{
  return -[EFObservable replay:](self, "replay:", 0x7FFFFFFFFFFFFFFFLL);
}

- (id)replay:(unint64_t)a3
{
  _EFReplayObservable *v4;
  void *v5;

  v4 = -[_EFReplayObservable initWithCount:]([_EFReplayObservable alloc], "initWithCount:", a3);
  -[EFObservable multicast:](self, "multicast:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sampleWithTimeInterval:(double)a3
{
  void *v5;
  void *v6;

  +[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable sampleWithTimeInterval:scheduler:](self, "sampleWithTimeInterval:scheduler:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sampleWithTimeInterval:(double)a3 scheduler:(id)a4
{
  id v6;
  _EFIdealTimerObservable *v7;
  void *v8;

  v6 = a4;
  v7 = -[_EFIdealTimerObservable initWithObservable:timeInterval:scheduler:]([_EFIdealTimerObservable alloc], "initWithObservable:timeInterval:scheduler:", self, v6, a3);
  -[EFObservable sampleWithObservable:](self, "sampleWithObservable:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sampleWithObservable:(id)a3
{
  id v4;
  _EFSamplingObservable *v5;

  v4 = a3;
  v5 = -[_EFSamplingObservable initWithObservable:sampler:]([_EFSamplingObservable alloc], "initWithObservable:sampler:", self, v4);

  return v5;
}

@end
