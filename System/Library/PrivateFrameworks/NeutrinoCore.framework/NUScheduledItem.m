@implementation NUScheduledItem

- (NUScheduledItem)initWithScheduledTime:(unint64_t)a3 queue:(id)a4 block:(id)a5
{
  OS_dispatch_queue *v8;
  id v9;
  NUScheduledItem *v10;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v12;
  uint64_t v13;
  id block;
  objc_super v16;

  v8 = (OS_dispatch_queue *)a4;
  v16.receiver = self;
  v16.super_class = (Class)NUScheduledItem;
  v9 = a5;
  v10 = -[NUScheduledItem init](&v16, sel_init);
  queue = v10->_queue;
  v10->_scheduledTime = a3;
  v10->_queue = v8;
  v12 = v8;

  v13 = MEMORY[0x1A85C1564](v9);
  block = v10->_block;
  v10->_block = (id)v13;

  return v10;
}

- (int64_t)compare:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  int64_t v6;

  v4 = objc_msgSend(a3, "scheduledTime");
  v5 = -[NUScheduledItem scheduledTime](self, "scheduledTime");
  if (v4 <= v5)
    v6 = 0;
  else
    v6 = -1;
  if (v4 < v5)
    return 1;
  else
    return v6;
}

- (void)dispatch
{
  dispatch_async((dispatch_queue_t)self->_queue, self->_block);
}

- (unint64_t)scheduledTime
{
  return self->_scheduledTime;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
