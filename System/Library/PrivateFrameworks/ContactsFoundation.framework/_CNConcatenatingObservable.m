@implementation _CNConcatenatingObservable

+ (void)subscribeObserver:(id)a3 toObservables:(id)a4 unless:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26[2];
  _QWORD v27[4];
  id v28;
  id v29;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_initWeak(location, v10);
    objc_msgSend(v9, "_cn_tail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke;
    v27[3] = &unk_1E29BC330;
    objc_copyWeak(&v29, location);
    v15 = v8;
    v28 = v15;
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_2;
    v23[3] = &unk_1E29BC358;
    objc_copyWeak(v26, location);
    v26[1] = a1;
    v16 = v15;
    v24 = v16;
    v17 = v12;
    v25 = v17;
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __69___CNConcatenatingObservable_subscribeObserver_toObservables_unless___block_invoke_3;
    v20[3] = &unk_1E29BBE78;
    objc_copyWeak(&v22, location);
    v21 = v16;
    +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v13, v27, v23, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subscribe:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addCancelable:", v19);
    objc_destroyWeak(&v22);

    objc_destroyWeak(v26);
    objc_destroyWeak(&v29);

    objc_destroyWeak(location);
  }
  else if ((objc_msgSend(v10, "isCanceled") & 1) == 0)
  {
    objc_msgSend(v8, "observerDidComplete");
  }

}

@end
