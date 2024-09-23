@implementation _CNFlatMapObservable

- (id)subscribeInnerObservable:(id)a3 observer:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  CNFlatMapSubscribeInnerObservableCancelationToken *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  CNFlatMapSubscribeInnerObservableCancelationToken *v27;
  _CNFlatMapInnerSubscriptionContext *v28;
  id v30;
  _QWORD v31[4];
  id v32;
  CNFlatMapSubscribeInnerObservableCancelationToken *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id from;
  _QWORD v46[4];
  id v47;
  id v48;
  id location[2];

  v30 = a3;
  v8 = a4;
  v9 = a5;
  objc_initWeak(location, v9);
  -[_CNFlatMapObservable decoratorGenerator](self, "decoratorGenerator");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "downstream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v10)[2](v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "resourceLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke;
  v46[3] = &unk_1E29B8C10;
  v15 = v9;
  v47 = v15;
  v16 = v12;
  v48 = v16;
  objc_msgSend(v13, "performBlock:", v46);

  v17 = objc_alloc_init(CNFlatMapSubscribeInnerObservableCancelationToken);
  objc_initWeak(&from, v16);
  objc_initWeak(&v44, v17);
  v18 = objc_opt_class();
  v40[0] = v14;
  v40[1] = 3221225472;
  v40[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_2;
  v40[3] = &unk_1E29BA6F8;
  objc_copyWeak(&v42, &from);
  objc_copyWeak(&v43, &v44);
  v19 = v8;
  v41 = v19;
  v34[0] = v14;
  v34[1] = 3221225472;
  v34[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_5;
  v34[3] = &unk_1E29BC570;
  v20 = v16;
  v35 = v20;
  v21 = v15;
  v36 = v21;
  objc_copyWeak(&v38, location);
  objc_copyWeak(&v39, &v44);
  v22 = v19;
  v37 = v22;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v18, v40, v34, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "subscribe:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v17, "addCancelable:", v24);
  objc_msgSend(v21, "resourceLock");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_9;
  v31[3] = &unk_1E29B8C10;
  v26 = v21;
  v32 = v26;
  v27 = v17;
  v33 = v27;
  objc_msgSend(v25, "performBlock:", v31);

  v28 = -[_CNFlatMapInnerSubscriptionContext initWithDecorator:token:]([_CNFlatMapInnerSubscriptionContext alloc], "initWithDecorator:token:", v20, v27);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&from);

  objc_destroyWeak(location);
  return v28;
}

- (id)decoratorGenerator
{
  return self->_decoratorGenerator;
}

- (id)subscribe:(id)a3
{
  id v4;
  CNFlatMapSubscribeCancelationToken *v5;
  _CNFlatMapSubscriptionContext *v6;
  void *v7;
  _CNFlatMapSubscriptionContext *v8;
  uint64_t v9;
  _CNFlatMapSubscriptionContext *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  _CNFlatMapSubscriptionContext *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _CNFlatMapSubscriptionContext *v21;
  id v22;
  _QWORD v24[4];
  _CNFlatMapSubscriptionContext *v25;
  id v26;
  _QWORD v27[4];
  _CNFlatMapSubscriptionContext *v28;
  id v29;
  _QWORD v30[4];
  _CNFlatMapSubscriptionContext *v31;
  _CNFlatMapObservable *v32;
  id v33;
  id v34;
  id v35;
  id location;
  _QWORD aBlock[4];
  _CNFlatMapSubscriptionContext *v38;
  id v39;

  v4 = a3;
  v5 = objc_alloc_init(CNFlatMapSubscribeCancelationToken);
  v6 = [_CNFlatMapSubscriptionContext alloc];
  -[_CNFlatMapObservable schedulerProvider](self, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_CNFlatMapSubscriptionContext initWithSchedulerProvider:](v6, "initWithSchedulerProvider:", v7);

  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34___CNFlatMapObservable_subscribe___block_invoke;
  aBlock[3] = &unk_1E29B9508;
  v10 = v8;
  v38 = v10;
  v11 = v4;
  v39 = v11;
  v12 = _Block_copy(aBlock);
  objc_initWeak(&location, v5);
  v13 = objc_opt_class();
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __34___CNFlatMapObservable_subscribe___block_invoke_7;
  v30[3] = &unk_1E29BC4F8;
  v31 = v10;
  v32 = self;
  v14 = v12;
  v34 = v14;
  v33 = v11;
  objc_copyWeak(&v35, &location);
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __34___CNFlatMapObservable_subscribe___block_invoke_9;
  v27[3] = &unk_1E29B8C10;
  v15 = v31;
  v28 = v15;
  v16 = v33;
  v29 = v16;
  +[CNObserver blockObserverOfClass:withResultBlock:completionBlock:failureBlock:](CNObserver, "blockObserverOfClass:withResultBlock:completionBlock:failureBlock:", v13, v30, v27, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNFlatMapObservable observable](self, "observable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "subscribe:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNFlatMapSubscriptionContext resourceLock](v15, "resourceLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __34___CNFlatMapObservable_subscribe___block_invoke_12;
  v24[3] = &unk_1E29B8C10;
  v21 = v15;
  v25 = v21;
  v22 = v19;
  v26 = v22;
  objc_msgSend(v20, "performBlock:", v24);

  -[CNCancelationToken addCancelable:](v5, "addCancelable:", v22);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&location);
  return v5;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNObservable)observable
{
  return self->_observable;
}

+ (id)observableWithObservable:(id)a3 transform:(id)a4 decoratorGenerator:(id)a5 schedulerProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObservable:transform:decoratorGenerator:schedulerProvider:", v13, v12, v11, v10);

  return v14;
}

- (_CNFlatMapObservable)initWithObservable:(id)a3 transform:(id)a4 decoratorGenerator:(id)a5 schedulerProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _CNFlatMapObservable *v14;
  uint64_t v15;
  CNObservable *observable;
  uint64_t v17;
  id decoratorGenerator;
  _CNFlatMapObservable *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_CNFlatMapObservable;
  v14 = -[_CNFlatMapObservable init](&v21, sel_init);
  if (v14)
  {
    objc_msgSend(v10, "map:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    observable = v14->_observable;
    v14->_observable = (CNObservable *)v15;

    v17 = objc_msgSend(v12, "copy");
    decoratorGenerator = v14->_decoratorGenerator;
    v14->_decoratorGenerator = (id)v17;

    objc_storeStrong((id *)&v14->_schedulerProvider, a6);
    v19 = v14;
  }

  return v14;
}

+ (id)flatMapWithObservable:(id)a3 transform:(id)a4 schedulerProvider:(id)a5
{
  return (id)objc_msgSend(a1, "observableWithObservable:transform:decoratorGenerator:schedulerProvider:", a3, a4, &__block_literal_global_4_3, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong(&self->_decoratorGenerator, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

+ (id)concatMapWithObservable:(id)a3 transform:(id)a4 schedulerProvider:(id)a5
{
  return (id)objc_msgSend(a1, "observableWithObservable:transform:decoratorGenerator:schedulerProvider:", a3, a4, &__block_literal_global_80, a5);
}

@end
