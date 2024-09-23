@implementation CalLimitingQueue

- (CalLimitingQueue)initWithQueue:(id)a3 andBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_source_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalLimitingQueue;
  v8 = -[CalLimitingQueue init](&v14, sel_init);
  if (v8)
  {
    if (v6)
      v9 = (dispatch_queue_t)v6;
    else
      v9 = dispatch_queue_create("CalLimitingQueue", 0);
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    v11 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v8 + 1));
    v12 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v11;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v8 + 2), v7);
    dispatch_resume(*((dispatch_object_t *)v8 + 2));
  }

  return (CalLimitingQueue *)v8;
}

- (void)executeBlock
{
  dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
}

- (id)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
