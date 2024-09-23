@implementation FSWorkQueue

- (id)initQueueWithDomain:(id)a3 concurrency:(int)a4
{
  id v6;
  FSWorkQueue *v7;
  uint64_t v8;
  NSMutableArray *queues;
  uint64_t v10;
  id v11;
  dispatch_queue_t v12;
  dispatch_queue_t v13;
  void *v14;
  NSObject *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FSWorkQueue;
  v7 = -[FSWorkQueue init](&v17, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    queues = v7->_queues;
    v7->_queues = (NSMutableArray *)v8;

    v7->_index = 0;
    if (a4 >= 1)
    {
      v10 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.fskit.FSWorkQueue.%@.%d"), v6, v10);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
        if (!v12)
          break;
        v13 = v12;
        -[FSWorkQueue queues](v7, "queues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v13);

        v10 = (v10 + 1);
        if (a4 == (_DWORD)v10)
          goto LABEL_10;
      }
      fskit_std_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[FSWorkQueue initQueueWithDomain:concurrency:].cold.1((uint64_t)v11, v15);

      v7 = 0;
    }
  }
LABEL_10:

  return v7;
}

- (void)enqueue:(id)a3
{
  FSWorkQueue *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  dispatch_block_t block;

  block = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[FSWorkQueue queues](v4, "queues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", -[FSWorkQueue index](v4, "index"));
  v6 = objc_claimAutoreleasedReturnValue();

  dispatch_async(v6, block);
  v7 = -[FSWorkQueue index](v4, "index");
  -[FSWorkQueue queues](v4, "queues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FSWorkQueue setIndex:](v4, "setIndex:", ((v7 + 1) % (unint64_t)objc_msgSend(v8, "count")));

  objc_sync_exit(v4);
}

- (NSMutableArray)queues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)index
{
  return self->_index;
}

- (void)setIndex:(int)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queues, 0);
}

- (void)initQueueWithDomain:(uint64_t)a1 concurrency:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *__error();
  v5 = 138412546;
  v6 = a1;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_23B2A6000, a2, OS_LOG_TYPE_ERROR, "Can't create FSWorkQueue, unable to create queue (%@), errno (%d)", (uint8_t *)&v5, 0x12u);
}

@end
