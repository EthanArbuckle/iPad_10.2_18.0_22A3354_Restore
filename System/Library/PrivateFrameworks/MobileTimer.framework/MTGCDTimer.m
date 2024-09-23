@implementation MTGCDTimer

- (void)dealloc
{
  objc_super v3;

  -[MTGCDTimer cancelTimer](self, "cancelTimer");
  v3.receiver = self;
  v3.super_class = (Class)MTGCDTimer;
  -[MTGCDTimer dealloc](&v3, sel_dealloc);
}

- (void)startTimer:(double)a3 block:(id)a4
{
  id v6;
  NSObject *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *timer;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  MTPowerAssertion *v14;
  MTPowerAssertion *v15;
  MTPowerAssertion *powerAssertion;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  MTGCDTimer *v21;
  id v22;

  v6 = a4;
  if (self->_timer)
    -[MTGCDTimer cancelTimer](self, "cancelTimer");
  dispatch_get_global_queue(33, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);
  timer = self->_timer;
  self->_timer = v8;

  v10 = self->_timer;
  v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  v12 = self->_timer;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __31__MTGCDTimer_startTimer_block___block_invoke;
  v20 = &unk_1E39CDC08;
  v21 = self;
  v22 = v6;
  v13 = v6;
  dispatch_source_set_event_handler(v12, &v17);
  v14 = [MTPowerAssertion alloc];
  v15 = -[MTPowerAssertion initWithName:assertionTimeout:](v14, "initWithName:assertionTimeout:", CFSTR("com.apple.MTGCDTimer"), 20.0, v17, v18, v19, v20, v21);
  powerAssertion = self->_powerAssertion;
  self->_powerAssertion = v15;

  -[MTPowerAssertion takeAssertion](self->_powerAssertion, "takeAssertion");
  dispatch_resume((dispatch_object_t)self->_timer);

}

uint64_t __31__MTGCDTimer_startTimer_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "cancelTimer");
}

- (void)cancelTimer
{
  NSObject *timer;
  OS_dispatch_source *v4;
  MTPowerAssertion *powerAssertion;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

    -[MTPowerAssertion releaseAssertion](self->_powerAssertion, "releaseAssertion");
    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
