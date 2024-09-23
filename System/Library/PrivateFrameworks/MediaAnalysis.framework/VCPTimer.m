@implementation VCPTimer

- (VCPTimer)initWithIntervalNanoseconds:(unint64_t)a3 isOneShot:(BOOL)a4 andBlock:(id)a5
{
  id v8;
  id v9;
  dispatch_queue_t v10;
  void *v11;
  dispatch_source_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v8 = a5;
  v24.receiver = self;
  v24.super_class = (Class)VCPTimer;
  v9 = -[VCPTimer init](&v24, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.mediaanalysisd.timer", 0);
    v11 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v10;

    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v9 + 1));
    v13 = (void *)*((_QWORD *)v9 + 2);
    *((_QWORD *)v9 + 2) = v12;

    atomic_store(1u, (unsigned __int8 *)v9 + 24);
    *((_BYTE *)v9 + 25) = a4;
    v14 = _Block_copy(v8);
    v15 = (void *)*((_QWORD *)v9 + 4);
    *((_QWORD *)v9 + 4) = v14;

    v16 = *((_QWORD *)v9 + 2);
    v17 = dispatch_time(0, a3);
    if (*((_BYTE *)v9 + 25))
      v18 = -1;
    else
      v18 = a3;
    dispatch_source_set_timer(v16, v17, v18, 0xF4240uLL);
    objc_initWeak(&location, v9);
    v19 = *((_QWORD *)v9 + 2);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__VCPTimer_initWithIntervalNanoseconds_isOneShot_andBlock___block_invoke;
    v21[3] = &unk_1E6B16988;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v19, v21);
    dispatch_resume(*((dispatch_object_t *)v9 + 2));
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return (VCPTimer *)v9;
}

void __59__VCPTimer_initWithIntervalNanoseconds_isOneShot_andBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimerEvent");

}

+ (id)timerWithInterval:(unint64_t)a3 unit:(unint64_t)a4 oneShot:(BOOL)a5 andBlock:(id)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;

  v6 = a5;
  v9 = a6;
  if (a4 <= 3)
    v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIntervalNanoseconds:isOneShot:andBlock:", +[VCPTimer timerWithInterval:unit:oneShot:andBlock:]::kTimeScaler[a4] * a3, v6, v9);
  else
    v10 = 0;

  return v10;
}

+ (id)timerWithIntervalSeconds:(unint64_t)a3 isOneShot:(BOOL)a4 andBlock:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;

  v5 = a4;
  v7 = a5;
  objc_msgSend((id)objc_opt_class(), "timerWithInterval:unit:oneShot:andBlock:", a3, 3, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[VCPTimer destroy](self, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)VCPTimer;
  -[VCPTimer dealloc](&v3, sel_dealloc);
}

- (void)handleTimerEvent
{
  BOOL *p_active;
  unsigned __int8 v3;
  unsigned __int8 v4;

  p_active = &self->_active;
  if (!self->_isOneShot)
  {
    v4 = atomic_load((unsigned __int8 *)p_active);
    if ((v4 & 1) == 0)
      return;
LABEL_6:
    (*((void (**)(void))self->_block + 2))();
    return;
  }
  do
    v3 = __ldaxr((unsigned __int8 *)p_active);
  while (__stlxr(0, (unsigned __int8 *)p_active));
  if ((v3 & 1) != 0)
    goto LABEL_6;
}

- (void)destroy
{
  BOOL *p_active;
  unsigned __int8 v3;

  p_active = &self->_active;
  do
    v3 = __ldaxr((unsigned __int8 *)p_active);
  while (__stlxr(0, (unsigned __int8 *)p_active));
  if ((v3 & 1) != 0)
    dispatch_source_cancel((dispatch_source_t)self->_source);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
