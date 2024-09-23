@implementation _CNGeneratorObservable

- (BOOL)isCanceled
{
  return -[CNCancelationToken isCanceled](self->_cancelable, "isCanceled");
}

- (BOOL)isFinished
{
  return (*((uint64_t (**)(id, id))self->_condition + 2))(self->_condition, self->_state) ^ 1;
}

- (void)updateState
{
  void *v3;
  id state;

  (*((void (**)(void))self->_nextState + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  self->_state = v3;

}

- (void)sendCurrentStateToObserver:(id)a3
{
  _QWORD *resultSelector;
  id state;
  void (*v5)(_QWORD *, id);
  id v6;
  id v7;

  resultSelector = self->_resultSelector;
  state = self->_state;
  v5 = (void (*)(_QWORD *, id))resultSelector[2];
  v6 = a3;
  v5(resultSelector, state);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "observerDidReceiveResult:", v7);

}

- (id)subscribe:(id)a3
{
  if (self->_delay)
    -[_CNGeneratorObservable scheduleNextResultForObserver:](self, "scheduleNextResultForObserver:", a3);
  else
    -[_CNGeneratorObservable sendResultsToObserver:](self, "sendResultsToObserver:", a3);
  return +[CNCancelationToken tokenWrappingCancelable:](CNCancelationToken, "tokenWrappingCancelable:", self->_cancelable);
}

- (void)sendResultsToObserver:(id)a3
{
  id v4;
  CNScheduler *scheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48___CNGeneratorObservable_sendResultsToObserver___block_invoke;
  v7[3] = &unk_1E29B8C10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CNScheduler performBlock:](scheduler, "performBlock:", v7);

}

- (_CNGeneratorObservable)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _CNGeneratorObservable *v20;
  uint64_t v21;
  id state;
  uint64_t v23;
  id condition;
  uint64_t v25;
  id nextState;
  uint64_t v27;
  id resultSelector;
  uint64_t v29;
  id delay;
  _CNGeneratorObservableCancelationToken *v31;
  CNCancelationToken *cancelable;
  _CNGeneratorObservable *v33;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)_CNGeneratorObservable;
  v20 = -[_CNGeneratorObservable init](&v35, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    state = v20->_state;
    v20->_state = (id)v21;

    v23 = objc_msgSend(v15, "copy");
    condition = v20->_condition;
    v20->_condition = (id)v23;

    v25 = objc_msgSend(v16, "copy");
    nextState = v20->_nextState;
    v20->_nextState = (id)v25;

    v27 = objc_msgSend(v17, "copy");
    resultSelector = v20->_resultSelector;
    v20->_resultSelector = (id)v27;

    v29 = objc_msgSend(v18, "copy");
    delay = v20->_delay;
    v20->_delay = (id)v29;

    objc_storeStrong((id *)&v20->_scheduler, a8);
    v31 = objc_alloc_init(_CNGeneratorObservableCancelationToken);
    cancelable = v20->_cancelable;
    v20->_cancelable = &v31->super;

    v33 = v20;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_delay, 0);
  objc_storeStrong(&self->_resultSelector, 0);
  objc_storeStrong(&self->_nextState, 0);
  objc_storeStrong(&self->_condition, 0);
  objc_storeStrong(&self->_state, 0);
}

- (void)scheduleNextResultForObserver:(id)a3
{
  id v4;
  void *v5;
  CNScheduler *scheduler;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  _CNGeneratorObservable *v15;
  id v16;

  v4 = a3;
  if (!-[_CNGeneratorObservable isCanceled](self, "isCanceled"))
  {
    if (-[_CNGeneratorObservable isFinished](self, "isFinished"))
    {
      objc_msgSend(v4, "observerDidComplete");
    }
    else
    {
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __56___CNGeneratorObservable_scheduleNextResultForObserver___block_invoke;
      v14 = &unk_1E29B8C10;
      v15 = self;
      v16 = v4;
      v5 = _Block_copy(&v11);
      scheduler = self->_scheduler;
      (*((void (**)(id, id, uint64_t, uint64_t, uint64_t))self->_delay + 2))(self->_delay, self->_state, v7, v8, v9);
      v10 = (id)-[CNScheduler afterDelay:performBlock:](scheduler, "afterDelay:performBlock:", v5, v11, v12, v13, v14, v15);

    }
  }

}

@end
