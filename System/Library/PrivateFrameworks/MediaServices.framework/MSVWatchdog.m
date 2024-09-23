@implementation MSVWatchdog

- (MSVWatchdog)init
{
  MSVWatchdog *v2;
  MSVWatchdog *v3;
  id timeoutCallback;
  objc_class *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_source_t v9;
  OS_dispatch_source *timer;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MSVWatchdog;
  v2 = -[MSVWatchdog init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_interval = xmmword_1A07D4CF0;
    timeoutCallback = v2->_timeoutCallback;
    v2->_timeoutCallback = 0;

    objc_storeStrong((id *)&v3->_mode, (id)*MEMORY[0x1E0C99860]);
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v3->_queue);
    timer = v3->_timer;
    v3->_timer = (OS_dispatch_source *)v9;

    dispatch_source_set_timer((dispatch_source_t)v3->_timer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    objc_initWeak(&location, v3);
    v11 = v3->_timer;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __19__MSVWatchdog_init__block_invoke;
    v13[3] = &unk_1E43E9DF0;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v11, v13);
    dispatch_resume((dispatch_object_t)v3->_timer);
    *(_WORD *)&v3->_scheduled = 0;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)suspend
{
  NSObject *v3;
  _QWORD block[5];

  -[MSVWatchdog queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__MSVWatchdog_suspend__block_invoke;
  block[3] = &unk_1E43E9C88;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  -[MSVWatchdog queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__MSVWatchdog_resume__block_invoke;
  block[3] = &unk_1E43E9C88;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_cancelTimeout
{
  void *v3;
  NSObject *v4;

  -[MSVWatchdog timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSVWatchdog timer](self, "timer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0, 0);

  }
}

- (void)_invokeCallback
{
  void *v3;
  void (**v4)(void);

  -[MSVWatchdog timeoutCallback](self, "timeoutCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSVWatchdog timeoutCallback](self, "timeoutCallback");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_scheduleTimeout
{
  void *v3;
  double v4;
  dispatch_time_t v5;
  NSObject *source;

  -[MSVWatchdog timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSVWatchdog timer](self, "timer");
    source = objc_claimAutoreleasedReturnValue();
    -[MSVWatchdog timeoutInterval](self, "timeoutInterval");
    v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    dispatch_source_set_timer(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0);

  }
}

- (void)_scheduleTest
{
  double v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  -[MSVWatchdog interval](self, "interval");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  -[MSVWatchdog queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MSVWatchdog__scheduleTest__block_invoke;
  block[3] = &unk_1E43E9C88;
  block[4] = self;
  dispatch_after(v4, v5, block);

}

- (void)scheduleInOperationQueue:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[MSVWatchdog running](self, "running"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVWatchdog.m"), 126, CFSTR("Watchdog is already running"));

  }
  if (-[MSVWatchdog scheduled](self, "scheduled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVWatchdog.m"), 127, CFSTR("Watchdog has already been scheduled"));

  }
  -[MSVWatchdog setOperationQueue:](self, "setOperationQueue:", v7);
  -[MSVWatchdog setRunning:](self, "setRunning:", 1);
  -[MSVWatchdog setScheduled:](self, "setScheduled:", 1);
  -[MSVWatchdog _scheduleTest](self, "_scheduleTest");

}

- (void)scheduleInDispatchQueue:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[MSVWatchdog running](self, "running"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVWatchdog.m"), 136, CFSTR("Watchdog is already running"));

  }
  if (-[MSVWatchdog scheduled](self, "scheduled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVWatchdog.m"), 137, CFSTR("Watchdog has already been scheduled"));

  }
  -[MSVWatchdog setDispatchQueue:](self, "setDispatchQueue:", v7);
  -[MSVWatchdog setRunning:](self, "setRunning:", 1);
  -[MSVWatchdog setScheduled:](self, "setScheduled:", 1);
  -[MSVWatchdog _scheduleTest](self, "_scheduleTest");

}

- (void)scheduleInRunLoop:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[MSVWatchdog running](self, "running"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVWatchdog.m"), 146, CFSTR("Watchdog is already running"));

  }
  if (-[MSVWatchdog scheduled](self, "scheduled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVWatchdog.m"), 147, CFSTR("Watchdog has already been scheduled"));

  }
  -[MSVWatchdog setRunLoop:](self, "setRunLoop:", v7);
  -[MSVWatchdog setRunning:](self, "setRunning:", 1);
  -[MSVWatchdog setScheduled:](self, "setScheduled:", 1);
  -[MSVWatchdog _scheduleTest](self, "_scheduleTest");

}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (id)timeoutCallback
{
  return self->_timeoutCallback;
}

- (void)setTimeoutCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSRunLoop)runLoop
{
  return self->_runLoop;
}

- (void)setRunLoop:(id)a3
{
  objc_storeStrong((id *)&self->_runLoop, a3);
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong(&self->_timeoutCallback, 0);
}

void __28__MSVWatchdog__scheduleTest__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFRunLoop *v10;
  void *v11;
  _QWORD v12[5];

  if (objc_msgSend(*(id *)(a1 + 32), "running"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_scheduleTimeout");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __28__MSVWatchdog__scheduleTest__block_invoke_2;
    v12[3] = &unk_1E43E9C88;
    v12[4] = *(_QWORD *)(a1 + 32);
    v2 = (void *)MEMORY[0x1A1AFBD28](v12);
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v2);
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "operationQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addOperation:", v4);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = *(void **)(a1 + 32);
      if (v6)
      {
        objc_msgSend(v7, "dispatchQueue");
        v4 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v4, v2);
      }
      else
      {
        objc_msgSend(v7, "runLoop");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
LABEL_9:

          return;
        }
        objc_msgSend(*(id *)(a1 + 32), "runLoop");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (__CFRunLoop *)objc_msgSend(v9, "getCFRunLoop");
        objc_msgSend(*(id *)(a1 + 32), "mode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CFRunLoopPerformBlock(v10, v11, v2);

        objc_msgSend(*(id *)(a1 + 32), "runLoop");
        v4 = objc_claimAutoreleasedReturnValue();
        CFRunLoopWakeUp((CFRunLoopRef)-[NSObject getCFRunLoop](v4, "getCFRunLoop"));
      }
    }

    goto LABEL_9;
  }
}

void __28__MSVWatchdog__scheduleTest__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MSVWatchdog__scheduleTest__block_invoke_3;
  block[3] = &unk_1E43E9C88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, block);

}

void __28__MSVWatchdog__scheduleTest__block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelTimeout");
    objc_msgSend(*(id *)(a1 + 32), "_scheduleTest");
  }
}

uint64_t __21__MSVWatchdog_resume__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "scheduled") && (objc_msgSend(*(id *)(a1 + 32), "running") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRunning:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "_scheduleTest");
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "scheduled");
    if ((result & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setRunning:", 1);
      return objc_msgSend(*(id *)(a1 + 32), "_scheduleTimeout");
    }
  }
  return result;
}

uint64_t __22__MSVWatchdog_suspend__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "running");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelTimeout");
    return objc_msgSend(*(id *)(a1 + 32), "setRunning:", 0);
  }
  return result;
}

void __19__MSVWatchdog_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancelTimeout");
  objc_msgSend(WeakRetained, "_invokeCallback");

}

@end
