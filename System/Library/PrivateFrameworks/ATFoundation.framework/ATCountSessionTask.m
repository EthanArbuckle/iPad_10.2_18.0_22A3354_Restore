@implementation ATCountSessionTask

- (ATCountSessionTask)initWithMaximumCount:(unint64_t)a3
{
  ATCountSessionTask *v4;
  ATCountSessionTask *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATCountSessionTask;
  v4 = -[ATSessionTask init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ATSessionTask setTotalItemCount:](v4, "setTotalItemCount:", a3);
  return v5;
}

- (void)start
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  v6 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v5, v6, 0x3B9ACA00uLL, 0);
  v7 = self->_timer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __27__ATCountSessionTask_start__block_invoke;
  handler[3] = &unk_1E928CC80;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

void __27__ATCountSessionTask_start__block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setCompletedItemCount:", objc_msgSend(*(id *)(a1 + 32), "completedItemCount") + 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "completedItemCount");
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "totalItemCount"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 168));
  }
}

@end
