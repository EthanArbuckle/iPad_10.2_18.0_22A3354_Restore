@implementation _EFGeneratorObservable

- (void)_scheduleNextResultForObserver:(id)a3
{
  id v4;
  void *v5;
  void (**delayForState)(id, id);
  EFScheduler *scheduler;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  _EFGeneratorObservable *v13;
  id v14;

  v4 = a3;
  if (-[_EFGeneratorObservable _isFinished](self, "_isFinished"))
  {
    objc_msgSend(v4, "observerDidComplete");
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __57___EFGeneratorObservable__scheduleNextResultForObserver___block_invoke;
    v12 = &unk_1E62A58B0;
    v13 = self;
    v14 = v4;
    v5 = _Block_copy(&v9);
    delayForState = (void (**)(id, id))self->_delayForState;
    scheduler = self->_scheduler;
    if (delayForState)
    {
      delayForState[2](delayForState, self->_state);
      v8 = (id)-[EFScheduler afterDelay:performBlock:](scheduler, "afterDelay:performBlock:", v5, v9, v10, v11, v12, v13);
    }
    else
    {
      -[EFScheduler performBlock:](self->_scheduler, "performBlock:", v5, v9, v10, v11, v12, v13);
    }

  }
}

- (BOOL)_isFinished
{
  return (*((uint64_t (**)(id, id))self->_condition + 2))(self->_condition, self->_state) ^ 1;
}

- (void)_updateState
{
  void *v3;
  id state;

  (*((void (**)(void))self->_nextStateForState + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  self->_state = v3;

}

- (id)subscribe:(id)a3
{
  EFCancelationToken *v4;

  -[_EFGeneratorObservable _scheduleNextResultForObserver:](self, "_scheduleNextResultForObserver:", a3);
  v4 = objc_alloc_init(EFCancelationToken);
  -[EFCancelationToken addCancelable:](v4, "addCancelable:", self->_cancelable);
  return v4;
}

- (_EFGeneratorObservable)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _EFGeneratorObservable *v20;
  _EFGeneratorObservable *v21;
  EFCancelationToken *v22;
  EFCancelationToken *cancelable;
  uint64_t v24;
  id state;
  void *v26;
  id condition;
  void *v28;
  id nextStateForState;
  void *v30;
  id resultFromState;
  void *v32;
  id delayForState;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)_EFGeneratorObservable;
  v20 = -[_EFGeneratorObservable init](&v35, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_scheduler, a8);
    v22 = objc_alloc_init(EFCancelationToken);
    cancelable = v21->_cancelable;
    v21->_cancelable = v22;

    v24 = objc_msgSend(v14, "copyWithZone:", 0);
    state = v21->_state;
    v21->_state = (id)v24;

    v26 = _Block_copy(v15);
    condition = v21->_condition;
    v21->_condition = v26;

    v28 = _Block_copy(v16);
    nextStateForState = v21->_nextStateForState;
    v21->_nextStateForState = v28;

    v30 = _Block_copy(v17);
    resultFromState = v21->_resultFromState;
    v21->_resultFromState = v30;

    v32 = _Block_copy(v18);
    delayForState = v21->_delayForState;
    v21->_delayForState = v32;

  }
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayForState, 0);
  objc_storeStrong(&self->_resultFromState, 0);
  objc_storeStrong(&self->_nextStateForState, 0);
  objc_storeStrong(&self->_condition, 0);
  objc_storeStrong(&self->_state, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
