@implementation GEOCoalescingTimer

- (GEOCoalescingTimer)initWithCoalescingInterval:(double)a3 deadlineInterval:(double)a4 queue:(id)a5 callback:(id)a6
{
  id v11;
  id v12;
  GEOCoalescingTimer *v13;
  uint64_t v14;
  geo_isolater *isolater;
  double v16;
  double v17;
  uint64_t v18;
  id callback;
  GEOCoalescingTimer *v20;
  objc_super v22;

  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)GEOCoalescingTimer;
  v13 = -[GEOCoalescingTimer init](&v22, sel_init);
  if (v13)
  {
    v14 = geo_isolater_create();
    isolater = v13->_isolater;
    v13->_isolater = (geo_isolater *)v14;

    if (a3 >= a4)
      v16 = a4;
    else
      v16 = a3;
    if (a3 >= a4)
      v17 = a3;
    else
      v17 = a4;
    v13->_coalescingInterval = v16;
    v13->_deadlineInterval = v17;
    v13->_deadline = 0.0;
    v13->_isScheduled = 0;
    objc_storeStrong((id *)&v13->_queue, a5);
    v18 = objc_msgSend(v12, "copy");
    callback = v13->_callback;
    v13->_callback = (id)v18;

    v20 = v13;
  }

  return v13;
}

- (BOOL)isScheduledToRun
{
  GEOCoalescingTimer *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_isolater;
  _geo_isolate_lock();
  LOBYTE(v2) = v2->_isScheduled;
  _geo_isolate_unlock();

  return (char)v2;
}

- (void)scheduleRun
{
  OS_dispatch_source *timer;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  NSObject *v6;
  double v7;
  double deadline;
  double v9;
  BOOL v10;
  double v11;
  double coalescingInterval;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD v15[5];
  id v16;
  id location;
  geo_isolater *v18;

  v18 = self->_isolater;
  _geo_isolate_lock();
  timer = self->_timer;
  if (!timer)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    v5 = self->_timer;
    self->_timer = v4;

    objc_initWeak(&location, self);
    v6 = self->_timer;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __33__GEOCoalescingTimer_scheduleRun__block_invoke;
    v15[3] = &unk_1E1C01158;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    dispatch_source_set_event_handler(v6, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  GEOGetMonotonicTime();
  deadline = self->_deadline;
  if (deadline == 0.0)
  {
    deadline = v7 + self->_deadlineInterval;
    self->_deadline = deadline;
  }
  v9 = deadline - v7;
  v10 = deadline <= v7;
  v11 = 0.0;
  if (!v10)
    v11 = v9;
  coalescingInterval = self->_coalescingInterval;
  if (coalescingInterval < v11)
    v11 = self->_coalescingInterval;
  if (v11 >= coalescingInterval || !self->_isScheduled)
  {
    v13 = self->_timer;
    v14 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_coalescingInterval * 1000000.0));
    self->_isScheduled = 1;
  }
  if (!timer)
    dispatch_activate((dispatch_object_t)self->_timer);
  _geo_isolate_unlock();

}

void __33__GEOCoalescingTimer_scheduleRun__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
    geo_isolate_sync();
  }

}

uint64_t __33__GEOCoalescingTimer_scheduleRun__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

- (void)dealloc
{
  NSObject *timer;
  OS_dispatch_source *v4;
  objc_super v5;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)GEOCoalescingTimer;
  -[GEOCoalescingTimer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

@end
