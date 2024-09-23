@implementation _CNThrottledObservable

- (void)observerScheduler_sendResultToObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  v12 = 0;
  -[_CNThrottledObservable resourceLock](self, "resourceLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___CNThrottledObservable_observerScheduler_sendResultToObserver___block_invoke;
  v6[3] = &unk_1E29B9330;
  v6[4] = self;
  v6[5] = &v7;
  CNRunWithLock(v5, v6);

  if (v8[5])
    objc_msgSend(v4, "observerDidReceiveResult:");
  _Block_object_dispose(&v7, 8);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_CNThrottledObservable delayToken](self, "delayToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)_CNThrottledObservable;
  -[_CNThrottledObservable dealloc](&v4, sel_dealloc);
}

- (CNCancelable)delayToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 72, 1);
}

- (NSLocking)resourceLock
{
  return (NSLocking *)objc_getProperty(self, a2, 56, 1);
}

- (CNScheduler)observerScheduler
{
  return (CNScheduler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelayToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (double)interval
{
  return self->_interval;
}

- (_CNThrottledObservable)initWithInterval:(double)a3 options:(unint64_t)a4 observable:(id)a5 schedulerProvider:(id)a6
{
  id v11;
  id v12;
  _CNThrottledObservable *v13;
  _CNThrottledObservable *v14;
  unint64_t v15;
  uint64_t v16;
  CNScheduler *observerScheduler;
  CNUnfairLock *v18;
  NSLocking *resourceLock;
  _CNThrottledObservable *v20;
  objc_super v22;

  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_CNThrottledObservable;
  v13 = -[_CNThrottledObservable init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_interval = a3;
    v15 = 2;
    if (a4)
      v15 = a4;
    v13->_options = v15;
    objc_storeStrong((id *)&v13->_observable, a5);
    v16 = objc_msgSend(v12, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.reactive.throttle.downstream"));
    observerScheduler = v14->_observerScheduler;
    v14->_observerScheduler = (CNScheduler *)v16;

    v18 = objc_alloc_init(CNUnfairLock);
    resourceLock = v14->_resourceLock;
    v14->_resourceLock = (NSLocking *)v18;

    v14->_isCoalescing = 0;
    v20 = v14;
  }

  return v14;
}

- (void)setIsCoalescing:(BOOL)a3
{
  self->_isCoalescing = a3;
}

- (id)subscribe:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[6];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __36___CNThrottledObservable_subscribe___block_invoke;
  v29[3] = &unk_1E29B9358;
  v29[4] = self;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNThrottledObservable resourceLock](self, "resourceLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = objc_opt_class();
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __36___CNThrottledObservable_subscribe___block_invoke_2;
  v24[3] = &unk_1E29BBE50;
  objc_copyWeak(&v27, &location);
  v9 = v7;
  v25 = v9;
  v10 = v4;
  v26 = v10;
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __36___CNThrottledObservable_subscribe___block_invoke_7;
  v21[3] = &unk_1E29B9758;
  objc_copyWeak(&v23, &location);
  v11 = v10;
  v22 = v11;
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __36___CNThrottledObservable_subscribe___block_invoke_9;
  v18[3] = &unk_1E29BBE78;
  objc_copyWeak(&v20, &location);
  v12 = v11;
  v19 = v12;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v8, v24, v21, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNThrottledObservable observable](self, "observable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subscribe:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addCancelable:", v15);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __36___CNThrottledObservable_subscribe___block_invoke_11;
  v17[3] = &unk_1E29B9358;
  v17[4] = self;
  objc_msgSend(v6, "addCancelationBlock:", v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v6;
}

- (CNObservable)observable
{
  return (CNObservable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMostRecentResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isCoalescing
{
  return self->_isCoalescing;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)mostRecentResult
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayToken, 0);
  objc_storeStrong(&self->_mostRecentResult, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
