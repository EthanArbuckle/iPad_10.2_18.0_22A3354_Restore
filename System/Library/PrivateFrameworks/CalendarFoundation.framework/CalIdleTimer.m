@implementation CalIdleTimer

- (CalIdleTimer)initWithQueue:(id)a3 timeoutInSeconds:(unint64_t)a4 leewayInSeconds:(unint64_t)a5 timeoutBlock:(id)a6
{
  id v11;
  id v12;
  CalIdleTimer *v13;
  CalIdleTimer *v14;
  uint64_t v15;
  id timeoutBlock;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CalIdleTimer;
  v13 = -[CalIdleTimer init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    v15 = MEMORY[0x19400A168](v12);
    timeoutBlock = v14->_timeoutBlock;
    v14->_timeoutBlock = (id)v15;

    v14->_timeoutInSeconds = a4;
    v14->_leewayInSeconds = a5;
  }

  return v14;
}

- (void)start
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_timer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v3;

    objc_initWeak(&location, self);
    v5 = self->_timer;
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __21__CalIdleTimer_start__block_invoke;
    v9 = &unk_1E2A84738;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v5, &v6);
    dispatch_activate((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  -[CalIdleTimer poke](self, "poke", v6, v7, v8, v9);
}

void __21__CalIdleTimer_start__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "cancel");
    (*(void (**)(void))(v2[2] + 16))();
    WeakRetained = v2;
  }

}

- (void)cancel
{
  NSObject *timer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)poke
{
  NSObject *timer;
  int64_t v4;
  uint64_t v5;
  dispatch_time_t v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timer = self->_timer;
  if (timer)
  {
    v4 = 1000000000 * self->_timeoutInSeconds;
    v5 = 1000000000 * self->_leewayInSeconds;
    v6 = dispatch_time(0, v4);
    dispatch_source_set_timer(timer, v6, 0xFFFFFFFFFFFFFFFFLL, v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
