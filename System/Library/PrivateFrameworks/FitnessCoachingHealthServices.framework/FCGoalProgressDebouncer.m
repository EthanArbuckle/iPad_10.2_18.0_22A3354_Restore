@implementation FCGoalProgressDebouncer

- (FCGoalProgressDebouncer)initWithServiceQueue:(id)a3
{
  id v5;
  FCGoalProgressDebouncer *v6;
  FCGoalProgressDebouncer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCGoalProgressDebouncer;
  v6 = -[FCGoalProgressDebouncer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceQueue, a3);

  return v7;
}

- (BOOL)inProgress
{
  return self->_timer != 0;
}

- (void)debounce
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[4];
  id v11;
  id location[2];

  if (!self->_timer)
  {
    objc_initWeak(location, self);
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_serviceQueue);
    timer = self->_timer;
    self->_timer = v3;

    v5 = self->_timer;
    v6 = dispatch_time(0, 2147483647000000000);
    dispatch_source_set_timer(v5, v6, 0x1DCD64FFC4653600uLL, 0);
    v7 = self->_timer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __35__FCGoalProgressDebouncer_debounce__block_invoke;
    handler[3] = &unk_1E8800770;
    objc_copyWeak(&v11, location);
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  v8 = dispatch_time(0, 10000000000);
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_1CC30F000, v9, OS_LOG_TYPE_DEFAULT, "Goal progress debounce pushed", (uint8_t *)location, 2u);
  }
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v8, 0x1DCD64FFC4653600uLL, 0);
}

void __35__FCGoalProgressDebouncer_debounce__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTimerFired");

}

- (void)_handleTimerFired
{
  NSObject *timer;
  OS_dispatch_source *v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CC30F000, v5, OS_LOG_TYPE_DEFAULT, "Goal progress debounce finished", v7, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "debouncerDidFinishDebounce:", self);

}

- (FCGoalProgressDebouncerDelegate)delegate
{
  return (FCGoalProgressDebouncerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end
