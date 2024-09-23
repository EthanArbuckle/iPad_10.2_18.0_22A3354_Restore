@implementation MSVTimer

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

- (MSVTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  NSObject *v10;
  id v11;
  id v12;
  dispatch_source_t v13;
  void *v14;
  double v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  BOOL v22;
  id location;
  objc_super v24;

  v10 = a5;
  v11 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MSVTimer;
  v12 = -[MSVTimer init](&v24, sel_init);
  if (v12)
  {
    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v10);
    v14 = (void *)*((_QWORD *)v12 + 1);
    *((_QWORD *)v12 + 1) = v13;

    v15 = a3 * 1000000000.0;
    v16 = dispatch_time(0, (uint64_t)v15);
    dispatch_source_set_timer(*((dispatch_source_t *)v12 + 1), v16, (unint64_t)v15, 0x989680uLL);
    objc_initWeak(&location, v12);
    v17 = *((_QWORD *)v12 + 1);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__MSVTimer_initWithInterval_repeats_queue_block___block_invoke;
    v19[3] = &unk_1E43E8938;
    v20 = v11;
    v22 = a4;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v17, v19);
    dispatch_resume(*((dispatch_object_t *)v12 + 1));
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }

  return (MSVTimer *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
}

void __49__MSVTimer_initWithInterval_repeats_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "invalidate");

  }
}

- (void)dealloc
{
  objc_super v3;

  -[MSVTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MSVTimer;
  -[MSVTimer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *timerSource;
  OS_dispatch_source *v3;
  MSVTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  timerSource = obj->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    v3 = obj->_timerSource;
    obj->_timerSource = 0;

  }
  objc_sync_exit(obj);

}

- (MSVTimer)initWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return -[MSVTimer initWithInterval:repeats:queue:block:](self, "initWithInterval:repeats:queue:block:", 1, a4, a5, a3);
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

@end
