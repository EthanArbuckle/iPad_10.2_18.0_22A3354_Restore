@implementation BSDispatchQueueAttributes

- (id)serviceClass:(unsigned int)a3 relativePriority:(int)a4
{
  OS_dispatch_queue_attr *attrs;
  int v6;

  attrs = self->_attrs;
  if (a4 <= -15)
    v6 = -15;
  else
    v6 = a4;
  dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)self->_attrs, (dispatch_qos_class_t)a3, v6 & (v6 >> 31));
  self->_attrs = (OS_dispatch_queue_attr *)objc_claimAutoreleasedReturnValue();

  return self;
}

- (OS_dispatch_queue_attr)attributes
{
  return self->_attrs;
}

+ (id)serial
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init((Class)a1);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

- (id)serviceClass:(unsigned int)a3
{
  return -[BSDispatchQueueAttributes serviceClass:relativePriority:](self, "serviceClass:relativePriority:", *(_QWORD *)&a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_attrs, 0);
}

- (id)targetQueue:(id)a3
{
  OS_dispatch_queue *v5;

  v5 = (OS_dispatch_queue *)a3;
  if (self->_targetQueue != v5)
    objc_storeStrong((id *)&self->_targetQueue, a3);

  return self;
}

- (id)autoreleaseFrequency:(unint64_t)a3
{
  NSObject *attrs;

  attrs = self->_attrs;
  dispatch_queue_attr_make_with_autorelease_frequency(attrs, (dispatch_autorelease_frequency_t)a3);
  self->_attrs = (OS_dispatch_queue_attr *)objc_claimAutoreleasedReturnValue();

  return self;
}

+ (id)concurrent
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init((Class)a1);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

- (id)inactive
{
  NSObject *attrs;

  attrs = self->_attrs;
  dispatch_queue_attr_make_initially_inactive(attrs);
  self->_attrs = (OS_dispatch_queue_attr *)objc_claimAutoreleasedReturnValue();

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_attrs);
  objc_storeStrong(v4 + 2, self->_targetQueue);
  return v4;
}

@end
