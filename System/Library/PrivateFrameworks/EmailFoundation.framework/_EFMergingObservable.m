@implementation _EFMergingObservable

+ (void)subscribeObserver:(id)a3 toObservables:(id)a4 unless:(id)a5
{
  id v7;
  EFCancelationToken *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  EFCancelationToken *v19;
  id v20;
  EFCancelationToken *v21;
  id v22;
  id v23;
  id obj;
  id v25;
  void *v26;
  _QWORD v27[4];
  EFCancelationToken *v28;
  id v29;
  _QWORD v30[4];
  EFCancelationToken *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v7 = a4;
  v23 = a5;
  v8 = objc_alloc_init(EFCancelationToken);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count", v7));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = *(_QWORD *)v40;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
        +[EFPromise promise](EFPromise, "promise");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v10;
        v37[1] = 3221225472;
        v37[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke;
        v37[3] = &unk_1E62A5928;
        v38 = v25;
        v35[0] = v10;
        v35[1] = 3221225472;
        v35[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_2;
        v35[3] = &unk_1E62A5860;
        v36 = v14;
        v33[0] = v10;
        v33[1] = 3221225472;
        v33[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_3;
        v33[3] = &unk_1E62A5888;
        v15 = v36;
        v34 = v15;
        +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v37, v35, v33);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "subscribe:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "addObject:", v15);
        -[EFCancelationToken addCancelable:](v8, "addCancelable:", v15);
        -[EFCancelationToken addCancelable:](v8, "addCancelable:", v17);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v9);
  }

  +[EFFuture join:](EFFuture, "join:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  v30[1] = 3221225472;
  v30[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_4;
  v30[3] = &unk_1E62A57C0;
  v19 = v8;
  v31 = v19;
  v20 = v25;
  v32 = v20;
  objc_msgSend(v18, "addSuccessBlock:", v30);
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __63___EFMergingObservable_subscribeObserver_toObservables_unless___block_invoke_5;
  v27[3] = &unk_1E62A5810;
  v21 = v19;
  v28 = v21;
  v22 = v20;
  v29 = v22;
  objc_msgSend(v18, "addFailureBlock:", v27);
  objc_msgSend(v23, "addCancelable:", v21);

}

@end
