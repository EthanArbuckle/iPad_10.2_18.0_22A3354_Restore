@implementation HKGraphViewTileThread

- (HKGraphViewTileThread)initWithGraphView:(id)a3
{
  id v4;
  HKGraphViewTileThread *v5;
  NSLock *v6;
  NSLock *queueLock;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *queueSemaphore;
  NSMutableArray *v10;
  NSMutableArray *rendererQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKGraphViewTileThread;
  v5 = -[HKGraphViewTileThread init](&v13, sel_init);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    queueLock = v5->_queueLock;
    v5->_queueLock = v6;

    -[NSLock setName:](v5->_queueLock, "setName:", CFSTR("HKGraphViewTileThreadLock"));
    v8 = dispatch_semaphore_create(0);
    queueSemaphore = v5->_queueSemaphore;
    v5->_queueSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rendererQueue = v5->_rendererQueue;
    v5->_rendererQueue = v10;

    objc_storeWeak((id *)&v5->_graphView, v4);
  }

  return v5;
}

- (void)main
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1D829F904](self, a2);
  if ((-[HKGraphViewTileThread isCancelled](self, "isCancelled") & 1) == 0)
  {
    do
    {
      v4 = (void *)MEMORY[0x1D829F904]();
      -[HKGraphViewTileThread queueSemaphore](self, "queueSemaphore");
      v5 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

      -[NSLock lock](self->_queueLock, "lock");
      -[HKGraphViewTileThread rendererQueue](self, "rendererQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[HKGraphViewTileThread rendererQueue](self, "rendererQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectAtIndex:", 0);

        if (!-[HKGraphViewTileThread _laterRenderingExists:](self, "_laterRenderingExists:", v7))
        {
          -[NSLock unlock](self->_queueLock, "unlock");
          -[HKGraphViewTileThread graphView](self, "graphView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v7, "renderTileContent");

          goto LABEL_9;
        }

      }
      -[NSLock unlock](self->_queueLock, "unlock");
LABEL_9:
      objc_autoreleasePoolPop(v4);
    }
    while (!-[HKGraphViewTileThread isCancelled](self, "isCancelled"));
  }
  objc_autoreleasePoolPop(v3);
}

- (BOOL)_laterRenderingExists:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HKGraphViewTileThread rendererQueue](self, "rendererQueue", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sameForRendering:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)scheduleRedrawUsingRenderer:(id)a3
{
  NSLock *queueLock;
  id v5;
  void *v6;
  NSObject *v7;

  queueLock = self->_queueLock;
  v5 = a3;
  -[NSLock lock](queueLock, "lock");
  -[HKGraphViewTileThread rendererQueue](self, "rendererQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  -[NSLock unlock](self->_queueLock, "unlock");
  -[HKGraphViewTileThread queueSemaphore](self, "queueSemaphore");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v7);

}

- (void)cancel
{
  NSObject *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKGraphViewTileThread;
  -[HKGraphViewTileThread cancel](&v4, sel_cancel);
  -[HKGraphViewTileThread queueSemaphore](self, "queueSemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v3);

}

- (NSLock)queueLock
{
  return self->_queueLock;
}

- (OS_dispatch_semaphore)queueSemaphore
{
  return self->_queueSemaphore;
}

- (NSMutableArray)rendererQueue
{
  return self->_rendererQueue;
}

- (void)setRendererQueue:(id)a3
{
  objc_storeStrong((id *)&self->_rendererQueue, a3);
}

- (HKGraphView)graphView
{
  return (HKGraphView *)objc_loadWeakRetained((id *)&self->_graphView);
}

- (void)setGraphView:(id)a3
{
  objc_storeWeak((id *)&self->_graphView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_graphView);
  objc_storeStrong((id *)&self->_rendererQueue, 0);
  objc_storeStrong((id *)&self->_queueSemaphore, 0);
  objc_storeStrong((id *)&self->_queueLock, 0);
}

@end
