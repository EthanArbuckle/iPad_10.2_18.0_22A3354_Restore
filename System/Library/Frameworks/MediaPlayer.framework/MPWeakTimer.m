@implementation MPWeakTimer

- (MPWeakTimer)initWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return -[MPWeakTimer initWithInterval:repeats:queue:block:](self, "initWithInterval:repeats:queue:block:", 1, a4, a5, a3);
}

- (MPWeakTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  NSObject *v9;
  id v10;
  id v11;
  dispatch_source_t v12;
  void *v13;
  double v14;
  dispatch_time_t v15;
  objc_super v17;

  v9 = a5;
  v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MPWeakTimer;
  v11 = -[MPWeakTimer init](&v17, sel_init);
  if (v11)
  {
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);
    v13 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v12;

    v14 = a3 * 1000000000.0;
    v15 = dispatch_time(0, (uint64_t)v14);
    dispatch_source_set_timer(*((dispatch_source_t *)v11 + 1), v15, (unint64_t)v14, 0x989680uLL);
    dispatch_source_set_event_handler(*((dispatch_source_t *)v11 + 1), v10);
    dispatch_resume(*((dispatch_object_t *)v11 + 1));
  }

  return (MPWeakTimer *)v11;
}

- (void)dealloc
{
  objc_super v3;

  -[MPWeakTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MPWeakTimer;
  -[MPWeakTimer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *timerSource;
  OS_dispatch_source *v4;

  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    v4 = self->_timerSource;
    self->_timerSource = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
}

+ (id)timerWithInterval:(double)a3 block:(id)a4
{
  return (id)objc_msgSend(a1, "timerWithInterval:repeats:block:", 1, a4, a3);
}

+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 block:(id)a5
{
  return (id)objc_msgSend(a1, "timerWithInterval:repeats:queue:block:", a4, MEMORY[0x1E0C80D38], a5, a3);
}

+ (id)timerWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return (id)objc_msgSend(a1, "timerWithInterval:repeats:queue:block:", 1, a4, a5, a3);
}

+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInterval:repeats:queue:block:", v7, v11, v10, a3);

  return v12;
}

@end
