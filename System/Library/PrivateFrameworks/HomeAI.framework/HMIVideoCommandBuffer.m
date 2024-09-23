@implementation HMIVideoCommandBuffer

- (HMIVideoCommandBuffer)initWithMaxCapacity:(unint64_t)a3
{
  char *v4;
  HMITimeIntervalAverage *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMIVideoCommandBuffer;
  v4 = -[HMIVideoCommandBuffer init](&v11, sel_init);
  if (v4)
  {
    v5 = -[HMITimeIntervalAverage initWithMaxCapacity:]([HMITimeIntervalAverage alloc], "initWithMaxCapacity:", 32);
    v6 = (void *)*((_QWORD *)v4 + 9);
    *((_QWORD *)v4 + 9) = v5;

    v7 = MEMORY[0x24BDC0D88];
    *(_OWORD *)(v4 + 24) = *MEMORY[0x24BDC0D88];
    *((_QWORD *)v4 + 5) = *(_QWORD *)(v7 + 16);
    *((_QWORD *)v4 + 7) = a3;
    v8 = objc_alloc_init(MEMORY[0x24BDD14C8]);
    v9 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = v8;

  }
  return (HMIVideoCommandBuffer *)v4;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  OS_dispatch_queue *v6;
  OS_dispatch_queue *delegateQueue;

  v6 = (OS_dispatch_queue *)a4;
  objc_storeWeak((id *)&self->_delegate, a3);
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v6;

}

- (float)fillRatio
{
  return fminf((float)-[HMIVideoCommandBuffer size](self, "size")/ (float)-[HMIVideoCommandBuffer capacity](self, "capacity"), 1.0);
}

- (BOOL)isFull
{
  unint64_t v3;

  v3 = -[HMIVideoCommandBuffer size](self, "size");
  return v3 >= -[HMIVideoCommandBuffer capacity](self, "capacity");
}

- (BOOL)isEmpty
{
  return -[HMIVideoCommandBuffer size](self, "size") == 0;
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  size_t TotalSampleSize;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  HMIVideoCommandBuffer *v16;
  id v17;
  opaqueCMSampleBuffer *v18;
  size_t v19;

  TotalSampleSize = CMSampleBufferGetTotalSampleSize(a3);
  -[HMIVideoCommandBuffer condition](self, "condition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  if (-[HMIVideoCommandBuffer isFull](self, "isFull"))
  {
    do
    {
      -[HMIVideoCommandBuffer condition](self, "condition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "wait");

    }
    while (-[HMIVideoCommandBuffer isFull](self, "isFull"));
  }
  -[HMIVideoCommandBuffer setSize:](self, "setSize:", -[HMIVideoCommandBuffer size](self, "size") + TotalSampleSize);
  CFRetain(a3);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoCommandBuffer delegateQueue](self, "delegateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __44__HMIVideoCommandBuffer_handleSampleBuffer___block_invoke;
  v15 = &unk_24DBEDF60;
  v16 = self;
  v17 = v8;
  v18 = a3;
  v19 = TotalSampleSize;
  v10 = v8;
  dispatch_async(v9, &v12);

  -[HMIVideoCommandBuffer condition](self, "condition", v12, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

}

void __44__HMIVideoCommandBuffer_handleSampleBuffer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "sampleBufferDelay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addValue:");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buffer:willHandleSampleBuffer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  CFRelease(*(CFTypeRef *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "condition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(*(id *)(a1 + 32), "setSize:", objc_msgSend(*(id *)(a1 + 32), "size") - *(_QWORD *)(a1 + 56));
  if ((objc_msgSend(*(id *)(a1 + 32), "isFull") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "condition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signal");

  }
  objc_msgSend(*(id *)(a1 + 32), "condition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)flushAsync
{
  NSObject *v3;
  _QWORD block[5];

  -[HMIVideoCommandBuffer delegateQueue](self, "delegateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMIVideoCommandBuffer_flushAsync__block_invoke;
  block[3] = &unk_24DBE9C90;
  block[4] = self;
  dispatch_async(v3, block);

}

void __35__HMIVideoCommandBuffer_flushAsync__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bufferWillFlush:", *(_QWORD *)(a1 + 32));

}

- (void)flush
{
  NSObject *v3;
  _QWORD block[5];

  -[HMIVideoCommandBuffer delegateQueue](self, "delegateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__HMIVideoCommandBuffer_flush__block_invoke;
  block[3] = &unk_24DBE9C90;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __30__HMIVideoCommandBuffer_flush__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bufferWillFlush:", *(_QWORD *)(a1 + 32));

}

- (void)handleBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[HMIVideoCommandBuffer delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMIVideoCommandBuffer_handleBlock___block_invoke;
  block[3] = &unk_24DBEBCA0;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __37__HMIVideoCommandBuffer_handleBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)delay
{
  void *v2;
  double v3;
  double v4;

  -[HMIVideoCommandBuffer sampleBufferDelay](self, "sampleBufferDelay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_videoDuration, 24, 1, 0);
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (NSCondition)condition
{
  return (NSCondition *)objc_getProperty(self, a2, 64, 1);
}

- (HMITimeIntervalAverage)sampleBufferDelay
{
  return (HMITimeIntervalAverage *)objc_getProperty(self, a2, 72, 1);
}

- (HMIVideoCommandBufferDelegate)delegate
{
  return (HMIVideoCommandBufferDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sampleBufferDelay, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
