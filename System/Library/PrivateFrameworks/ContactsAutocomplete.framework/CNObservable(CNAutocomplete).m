@implementation CNObservable(CNAutocomplete)

- (id)autocompleteTimeoutAfterDelay:()CNAutocomplete doOnTimeout:scheduler:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "doOnError:", &__block_literal_global_14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "onError:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "debugDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %@"), v14, a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __84__CNObservable_CNAutocomplete__autocompleteTimeoutAfterDelay_doOnTimeout_scheduler___block_invoke_3;
  v22[3] = &unk_1E70DEFA0;
  v23 = v15;
  v24 = v8;
  v17 = v8;
  v18 = v15;
  objc_msgSend(v16, "doOnSubscribe:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "timeoutAfterDelay:alternateObservable:schedule:", v19, v9, a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)activityIndicatingObservableWithActivityDidStartHandler:()CNAutocomplete activityDidStopHandler:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "doOnSubscribe:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (v7)
  {
    objc_msgSend(v9, "doOnTerminate:", v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }

  return v9;
}

- (uint64_t)localObservableWithScheduler:()CNAutocomplete
{
  return objc_msgSend(a1, "localObservableWithScheduler:doOnTimeout:", a3, 0);
}

- (uint64_t)localObservableWithScheduler:()CNAutocomplete doOnTimeout:
{
  return objc_msgSend(a1, "autocompleteTimeoutAfterDelay:doOnTimeout:scheduler:", a4, a3, 2.0);
}

- (id)networkObservableWithActivityDidStartHandler:()CNAutocomplete activityDidStopHandler:timeoutDelay:subscriptionDelay:scheduler:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  objc_msgSend(a1, "autocompleteTimeoutAfterDelay:doOnTimeout:scheduler:", 0, v12, a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activityIndicatingObservableWithActivityDidStartHandler:activityDidStopHandler:", v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "delaySubscription:scheduler:", v12, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
