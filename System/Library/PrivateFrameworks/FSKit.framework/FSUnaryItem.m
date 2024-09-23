@implementation FSUnaryItem

- (FSUnaryItem)init
{
  FSUnaryItem *v2;
  FSUnaryItem *v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FSUnaryItem;
  v2 = -[FSItem init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    queue = v2->_queue;
    v2->_queue = 0;

    v5 = init_fileHandleIndex++;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSItem setFileHandle:](v3, "setFileHandle:", v7);

  }
  return v3;
}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)FSUnaryItem;
  -[FSUnaryItem dealloc](&v4, sel_dealloc);
}

- (OS_dispatch_queue)queue
{
  OS_dispatch_queue *queue;
  FSUnaryItem *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  queue = self->_queue;
  if (!queue)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_queue)
    {
      v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fskit.fsitem.queue", 0);
      v6 = self->_queue;
      self->_queue = v5;

    }
    objc_sync_exit(v4);

    queue = self->_queue;
  }
  return queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
