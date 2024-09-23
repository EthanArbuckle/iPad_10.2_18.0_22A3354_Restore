@implementation CFXCameraStreamBufferQueue

- (CFXCameraStreamBufferQueue)initWithMaxCapacity:(unint64_t)a3
{
  NSMutableArray *v4;
  NSMutableArray *outputBuffers;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *accessQueue;

  self->_maxCapacity = a3;
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  outputBuffers = self->_outputBuffers;
  self->_outputBuffers = v4;

  JFXCreateDispatchQueue(self, CFSTR("bufferQueueAccessQueue"), 0);
  v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  self->_accessQueue = v6;

  return self;
}

- (unint64_t)count
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CFXCameraStreamBufferQueue accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__CFXCameraStreamBufferQueue_count__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__CFXCameraStreamBufferQueue_count__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "outputBuffers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)dequeue
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!-[CFXCameraStreamBufferQueue count](self, "count"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[CFXCameraStreamBufferQueue accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__CFXCameraStreamBufferQueue_dequeue__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__CFXCameraStreamBufferQueue_dequeue__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "outputBuffers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "outputBuffers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectAtIndex:", 0);

}

- (BOOL)enqueue:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = -[CFXCameraStreamBufferQueue count](self, "count");
  v6 = -[CFXCameraStreamBufferQueue maxCapacity](self, "maxCapacity");
  if (v5 < v6)
  {
    -[CFXCameraStreamBufferQueue accessQueue](self, "accessQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__CFXCameraStreamBufferQueue_enqueue___block_invoke;
    v9[3] = &unk_24EE57AA8;
    v9[4] = self;
    v10 = v4;
    dispatch_sync(v7, v9);

  }
  return v5 < v6;
}

void __38__CFXCameraStreamBufferQueue_enqueue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "outputBuffers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (double)headBufferTimestamp
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CFXCameraStreamBufferQueue accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__CFXCameraStreamBufferQueue_headBufferTimestamp__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__CFXCameraStreamBufferQueue_headBufferTimestamp__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "outputBuffers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (NSMutableArray)outputBuffers
{
  return self->_outputBuffers;
}

- (void)setOutputBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_outputBuffers, a3);
}

- (unint64_t)maxCapacity
{
  return self->_maxCapacity;
}

- (void)setMaxCapacity:(unint64_t)a3
{
  self->_maxCapacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBuffers, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
