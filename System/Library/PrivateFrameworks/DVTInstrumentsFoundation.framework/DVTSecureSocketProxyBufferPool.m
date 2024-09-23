@implementation DVTSecureSocketProxyBufferPool

- (DVTSecureSocketProxyBufferPool)initWithCount:(int)a3 bufferSize:(unint64_t)a4
{
  DVTSecureSocketProxyBufferPool *v6;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *bufferAvailable;
  uint64_t v9;
  NSMutableArray *dataBuffers;
  NSMutableArray *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DVTSecureSocketProxyBufferPool;
  v6 = -[DVTSecureSocketProxyBufferPool init](&v14, sel_init);
  if (v6)
  {
    v7 = dispatch_semaphore_create(a3);
    bufferAvailable = v6->_bufferAvailable;
    v6->_bufferAvailable = (OS_dispatch_semaphore *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    dataBuffers = v6->_dataBuffers;
    v6->_dataBuffers = (NSMutableArray *)v9;

    if (a3 >= 1)
    {
      do
      {
        v11 = v6->_dataBuffers;
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v11, "addObject:", v12);

        --a3;
      }
      while (a3);
    }
  }
  return v6;
}

- (id)blockingAcquireBuffer
{
  NSObject *v3;
  DVTSecureSocketProxyBufferPool *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[DVTSecureSocketProxyBufferPool bufferAvailable](self, "bufferAvailable");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  v4 = self;
  objc_sync_enter(v4);
  -[DVTSecureSocketProxyBufferPool dataBuffers](v4, "dataBuffers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    __assert_rtn("-[DVTSecureSocketProxyBufferPool blockingAcquireBuffer]", "DVTSecureSocketProxy.m", 427, "self.dataBuffers.count > 0");

  -[DVTSecureSocketProxyBufferPool dataBuffers](v4, "dataBuffers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DVTSecureSocketProxyBufferPool dataBuffers](v4, "dataBuffers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeLastObject");

  objc_sync_exit(v4);
  return v7;
}

- (void)releaseBuffer:(id)a3
{
  DVTSecureSocketProxyBufferPool *v4;
  void *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[DVTSecureSocketProxyBufferPool dataBuffers](v4, "dataBuffers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_sync_exit(v4);
  -[DVTSecureSocketProxyBufferPool bufferAvailable](v4, "bufferAvailable");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

}

- (OS_dispatch_semaphore)bufferAvailable
{
  return self->_bufferAvailable;
}

- (void)setBufferAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_bufferAvailable, a3);
}

- (NSMutableArray)dataBuffers
{
  return self->_dataBuffers;
}

- (void)setDataBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_dataBuffers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBuffers, 0);
  objc_storeStrong((id *)&self->_bufferAvailable, 0);
}

@end
