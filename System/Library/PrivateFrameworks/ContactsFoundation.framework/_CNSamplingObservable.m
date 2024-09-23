@implementation _CNSamplingObservable

- (_CNSamplingObservable)initWithObservable:(id)a3 sampler:(id)a4
{
  id v7;
  id v8;
  _CNSamplingObservable *v9;
  _CNSamplingObservable *v10;
  _CNSamplingObservable *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNSamplingObservable;
  v9 = -[_CNSamplingObservable init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v10->_sampler, a4);
    v11 = v10;
  }

  return v10;
}

- (id)subscribe:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  CNObservable *observable;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _CNSamplingObservable *v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;

  v4 = a3;
  -[_CNSamplingObservable sampler](self, "sampler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __35___CNSamplingObservable_subscribe___block_invoke;
  v31[3] = &unk_1E29BA058;
  v31[4] = self;
  v7 = v4;
  v32 = v7;
  +[CNObserver observerWithResultBlock:](CNObserver, "observerWithResultBlock:", v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  observable = self->_observable;
  v11 = objc_opt_class();
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __35___CNSamplingObservable_subscribe___block_invoke_2;
  v30[3] = &unk_1E29BA8B8;
  v30[4] = self;
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __35___CNSamplingObservable_subscribe___block_invoke_3;
  v26[3] = &unk_1E29B9308;
  v27 = v9;
  v28 = self;
  v29 = v7;
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __35___CNSamplingObservable_subscribe___block_invoke_4;
  v23[3] = &unk_1E29B9508;
  v12 = v27;
  v24 = v12;
  v25 = v29;
  v13 = v29;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v11, v30, v26, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservable subscribe:](observable, "subscribe:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __35___CNSamplingObservable_subscribe___block_invoke_5;
  v20[3] = &unk_1E29B8C10;
  v21 = v12;
  v22 = v15;
  v16 = v15;
  v17 = v12;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)receiveResult:(id)a3
{
  _CNSamplingObservable *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[_CNSamplingObservable setSample:](v4, "setSample:", v5);
  objc_sync_exit(v4);

}

- (void)sendSampleToObserver:(id)a3
{
  _CNSamplingObservable *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[_CNSamplingObservable sample](v4, "sample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNSamplingObservable setSample:](v4, "setSample:", 0);
  objc_sync_exit(v4);

  if (v5)
    objc_msgSend(v6, "observerDidReceiveResult:", v5);

}

- (CNObservable)observable
{
  return self->_observable;
}

- (CNObservable)sampler
{
  return self->_sampler;
}

- (id)sample
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setSample:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CNCancelable)timer
{
  return (CNCancelable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_sample, 0);
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
