@implementation MROptimisticState

- (MROptimisticState)initWithInitialState:(id)a3 expectedState:(id)a4 timeout:(double)a5 queue:(id)a6 timeoutHandler:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  MROptimisticState *v18;
  void *v19;
  uint64_t v20;
  MSVTimer *timer;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)MROptimisticState;
  v18 = -[MROptimisticState init](&v28, sel_init);
  if (v18)
  {
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("MROptimisticState.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    }
    objc_storeStrong(&v18->_initialState, a3);
    objc_storeStrong(&v18->_expectedState, a4);
    objc_initWeak(&location, v18);
    v19 = (void *)MEMORY[0x1E0D4D110];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __85__MROptimisticState_initWithInitialState_expectedState_timeout_queue_timeoutHandler___block_invoke;
    v24[3] = &unk_1E30C8180;
    objc_copyWeak(&v26, &location);
    v25 = v17;
    objc_msgSend(v19, "timerWithInterval:repeats:queue:block:", 0, v16, v24, a5);
    v20 = objc_claimAutoreleasedReturnValue();
    timer = v18->_timer;
    v18->_timer = (MSVTimer *)v20;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __85__MROptimisticState_initWithInitialState_expectedState_timeout_queue_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  MROptimisticState *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[MROptimisticState timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  _MRLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MROptimisticState]<%p> dealloc", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)MROptimisticState;
  -[MROptimisticState dealloc](&v5, sel_dealloc);
}

- (id)initialState
{
  return self->_initialState;
}

- (id)expectedState
{
  return self->_expectedState;
}

- (MSVTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_expectedState, 0);
  objc_storeStrong(&self->_initialState, 0);
}

@end
