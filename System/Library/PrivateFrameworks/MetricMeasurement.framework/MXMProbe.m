@implementation MXMProbe

- (OS_dispatch_queue)updateQueue
{
  OS_dispatch_queue *updateQueue;

  updateQueue = self->_updateQueue;
  if (updateQueue)
    return updateQueue;
  dispatch_get_global_queue(0, 0);
  return (OS_dispatch_queue *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)probe
{
  return objc_alloc_init((Class)a1);
}

- (MXMProbe)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXMProbe;
  return -[MXMProbe init](&v3, sel_init);
}

- (void)updateNowUntilStopped
{
  -[MXMProbe updateNowUntilStoppedWithUpdateHandler:stopHandler:](self, "updateNowUntilStoppedWithUpdateHandler:stopHandler:", 0, 0);
}

- (void)updateNowUntilStoppedWithUpdateHandler:(id)a3
{
  -[MXMProbe updateNowUntilStoppedWithUpdateHandler:stopHandler:](self, "updateNowUntilStoppedWithUpdateHandler:stopHandler:", a3, 0);
}

- (void)updateNowUntilStoppedWithUpdateHandler:(id)a3 stopHandler:(id)a4
{
  id v6;
  void *v7;
  id updateHandler;
  void *v9;
  id stopHandler;

  v6 = a4;
  v7 = _Block_copy(a3);
  updateHandler = self->_updateHandler;
  self->_updateHandler = v7;

  v9 = _Block_copy(v6);
  stopHandler = self->_stopHandler;
  self->_stopHandler = v9;

  -[MXMProbe _beginUpdates](self, "_beginUpdates");
}

- (void)updateNowUntilTimeout:(double)a3
{
  -[MXMProbe updateNowUntilTimeout:updateHandler:stopHandler:](self, "updateNowUntilTimeout:updateHandler:stopHandler:", 0, 0, a3);
}

- (void)updateNowUntilTimeout:(double)a3 updateHandler:(id)a4
{
  -[MXMProbe updateNowUntilTimeout:updateHandler:stopHandler:](self, "updateNowUntilTimeout:updateHandler:stopHandler:", a4, 0, a3);
}

- (void)updateNowUntilTimeout:(double)a3 updateHandler:(id)a4 stopHandler:(id)a5
{
  id v9;
  id v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14[2];
  id location;

  v9 = a4;
  v10 = a5;
  -[MXMProbe updateNowUntilStoppedWithUpdateHandler:stopHandler:](self, "updateNowUntilStoppedWithUpdateHandler:stopHandler:", v9, v10);
  objc_initWeak(&location, self);
  v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  -[MXMProbe updateQueue](self, "updateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__MXMProbe_updateNowUntilTimeout_updateHandler_stopHandler___block_invoke;
  v13[3] = &unk_24D193248;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a2;
  v13[4] = self;
  dispatch_after(v11, v12, v13);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __60__MXMProbe_updateNowUntilTimeout_updateHandler_stopHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("MXMProbe.m"), 73, CFSTR("_w_self pointer is nil."));

  }
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_stopUpdates");

}

- (void)_beginUpdates
{
  -[MXMProbe set_updating:](self, "set_updating:", 1);
}

- (void)_handleIncomingData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**updateHandler)(id, MXMProbe *, void *, _BYTE *);
  int v9;
  unsigned __int8 v10;

  v4 = a3;
  if (-[MXMProbe _shouldStop](self, "_shouldStop")
    || !objc_msgSend(v4, "numberOfSets")
    || -[MXMProbe _shouldStop](self, "_shouldStop"))
  {
    v5 = v4;
  }
  else
  {
    v10 = 0;
    -[MXMProbe filter](self, "filter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataMatchingFilter:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[MXMProbe delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "probeDidUpdate:data:stop:", self, v5, &v10);

    updateHandler = (void (**)(id, MXMProbe *, void *, _BYTE *))self->_updateHandler;
    v9 = v10;
    if (updateHandler && !v10)
    {
      updateHandler[2](updateHandler, self, v5, &v10);
      v9 = v10;
    }
    if (v9)
    {
      -[MXMProbe set_shouldStop:](self, "set_shouldStop:", 1);
      -[MXMProbe _stopUpdates](self, "_stopUpdates");
    }
  }

}

- (void)_stopUpdates
{
  id updateHandler;
  id stopHandler;
  NSObject *stopWaiter;
  OS_dispatch_semaphore *v6;

  -[MXMProbe set_updating:](self, "set_updating:", 0);
  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

  stopHandler = self->_stopHandler;
  self->_stopHandler = 0;

  stopWaiter = self->_stopWaiter;
  if (stopWaiter)
  {
    dispatch_semaphore_signal(stopWaiter);
    v6 = self->_stopWaiter;
    self->_stopWaiter = 0;

  }
}

- (BOOL)_setupWaitSemaphore
{
  MXMProbe *v2;
  BOOL v3;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *stopWaiter;

  v2 = self;
  objc_sync_enter(v2);
  if (-[MXMProbe _updating](v2, "_updating") && !v2->_stopWaiter)
  {
    v5 = dispatch_semaphore_create(0);
    stopWaiter = v2->_stopWaiter;
    v2->_stopWaiter = (OS_dispatch_semaphore *)v5;

    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)waitForeverUntilStopped
{
  if (-[MXMProbe _setupWaitSemaphore](self, "_setupWaitSemaphore"))
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_stopWaiter, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)waitUntilStoppedWithTimeout:(double)a3
{
  _BOOL4 v4;

  v4 = -[MXMProbe _setupWaitSemaphore](self, "_setupWaitSemaphore", a3);
  if (v4)
    LOBYTE(v4) = dispatch_semaphore_wait((dispatch_semaphore_t)self->_stopWaiter, 0xFFFFFFFFFFFFFFFFLL) != 0;
  return v4;
}

- (id)sampleWithTimeout:(double)a3
{
  return -[MXMProbe sampleWithTimeout:stopReason:](self, "sampleWithTimeout:stopReason:", 0, a3);
}

- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4
{
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  unint64_t v12;
  id v13;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v8 = dispatch_semaphore_create(0);
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __41__MXMProbe_sampleWithTimeout_stopReason___block_invoke;
  v17[3] = &unk_24D193270;
  v19 = &v24;
  v10 = v8;
  v18 = v10;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __41__MXMProbe_sampleWithTimeout_stopReason___block_invoke_2;
  v16[3] = &unk_24D193298;
  v16[4] = &v20;
  -[MXMProbe updateNowUntilStoppedWithUpdateHandler:stopHandler:](self, "updateNowUntilStoppedWithUpdateHandler:stopHandler:", v17, v16);
  v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  if (dispatch_semaphore_wait(v10, v11))
  {
    -[MXMProbe stopUpdates](self, "stopUpdates");
    if (!-[MXMProbe waitUntilStoppedWithTimeout:](self, "waitUntilStoppedWithTimeout:", 60.0))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMProbe.m"), 197, CFSTR("Failed to stop the probe!"));

      if (!a4)
        goto LABEL_8;
      goto LABEL_4;
    }
    if (a4)
    {
LABEL_4:
      v12 = 1;
LABEL_7:
      *a4 = v12;
    }
  }
  else if (a4)
  {
    v12 = v21[3];
    goto LABEL_7;
  }
LABEL_8:
  v13 = (id)v25[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

void __41__MXMProbe_sampleWithTimeout_stopReason___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __41__MXMProbe_sampleWithTimeout_stopReason___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

- (BOOL)performPreIterationActions
{
  return 1;
}

- (MXMSampleFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (MXMProbeDelegate)delegate
{
  return (MXMProbeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_updating
{
  return self->__updating;
}

- (void)set_updating:(BOOL)a3
{
  self->__updating = a3;
}

- (BOOL)_shouldStop
{
  return self->__shouldStop;
}

- (void)set_shouldStop:(BOOL)a3
{
  self->__shouldStop = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_stopWaiter, 0);
  objc_storeStrong(&self->_stopHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
