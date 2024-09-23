@implementation ATXTimer

- (ATXTimer)initWithDate:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  dispatch_source_t v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  id v14;
  timespec v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXTimer;
  v8 = -[ATXTimer init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "timeIntervalSince1970");
    v16.tv_sec = (int)v9;
    v16.tv_nsec = 0;
    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 1uLL, MEMORY[0x1E0C80D38]);
    v11 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v10;

    v12 = *((_QWORD *)v8 + 1);
    v13 = dispatch_walltime(&v16, 0);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(*((dispatch_source_t *)v8 + 1), v7);
    dispatch_resume(*((dispatch_object_t *)v8 + 1));
    v14 = v8;
  }

  return (ATXTimer *)v8;
}

- (void)dealloc
{
  NSObject *source;
  OS_dispatch_source *v4;
  objc_super v5;

  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    v4 = self->_source;
    self->_source = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ATXTimer;
  -[ATXTimer dealloc](&v5, sel_dealloc);
}

+ (id)fireAtDate:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:block:", v7, v6);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
