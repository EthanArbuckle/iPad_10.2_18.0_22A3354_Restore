@implementation _NMSDispatchQueue

- (_NMSDispatchQueue)init
{
  void *v3;
  _NMSDispatchQueue *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_NMSDispatchQueue initWithName:attributes:target:](self, "initWithName:attributes:target:", CFSTR("_NMSDispatchQueue"), v3, 0);

  return v4;
}

- (_NMSDispatchQueue)initWithName:(id)a3 attributes:(id)a4 target:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  _NMSDispatchQueue *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *q;
  _NMSDispatchQueue *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_NMSDispatchQueue;
  v11 = -[_NMSDispatchQueue init](&v16, sel_init);
  if (v11)
  {
    v12 = dispatch_queue_create_with_target_V2((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), v9, v10);
    q = v11->_q;
    v11->_q = (OS_dispatch_queue *)v12;

    +[SYQueueDumper registerQueue:](SYQueueDumper, "registerQueue:", v11->_q);
    atomic_store(1u, (unsigned __int8 *)&v11->_r);
    v14 = v11;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[_NMSDispatchQueue resume](self, "resume");
  v3.receiver = self;
  v3.super_class = (Class)_NMSDispatchQueue;
  -[_NMSDispatchQueue dealloc](&v3, sel_dealloc);
}

- (BOOL)isSuspended
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_r);
  return (v2 & 1) == 0;
}

- (void)suspend
{
  BOOL *p_r;
  int v4;
  NSObject *v5;
  const char *label;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  p_r = &self->_r;
  do
  {
    v4 = __ldaxr((unsigned __int8 *)p_r);
    if (v4 != 1)
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(0, (unsigned __int8 *)p_r));
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    label = dispatch_queue_get_label((dispatch_queue_t)self->_q);
    v7 = 136446210;
    v8 = label;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Suspending %{public}s", (uint8_t *)&v7, 0xCu);
  }
  dispatch_suspend((dispatch_object_t)self->_q);
}

- (void)resume
{
  BOOL *p_r;
  NSObject *v5;
  const char *label;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  p_r = &self->_r;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_r))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_r));
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    label = dispatch_queue_get_label((dispatch_queue_t)self->_q);
    v7 = 136446210;
    v8 = label;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Resuming %{public}s", (uint8_t *)&v7, 0xCu);
  }
  dispatch_resume((dispatch_object_t)self->_q);
}

- (void)sync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_q, a3);
}

- (void)async:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_q, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
}

@end
