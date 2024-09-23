@implementation _EFConcatenatingObservable

+ (void)subscribeObserver:(id)a3 toObservables:(id)a4 unless:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke;
    v27[3] = &unk_1E62A57C0;
    v28 = v10;
    v29 = v8;
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_2;
    v22[3] = &unk_1E62A57E8;
    v23 = v28;
    v26 = a1;
    v24 = v29;
    v25 = v9;
    v16 = v12;
    v17 = 3221225472;
    v18 = __69___EFConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_3;
    v19 = &unk_1E62A5810;
    v13 = v23;
    v20 = v13;
    v21 = v24;
    +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v27, v22, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subscribe:", v14, v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addCancelable:", v15);

  }
  else if ((objc_msgSend(v10, "isCanceled") & 1) == 0)
  {
    objc_msgSend(v8, "observerDidComplete");
  }

}

@end
