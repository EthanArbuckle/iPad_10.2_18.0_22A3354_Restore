@implementation CMContinuityCaptureDeviceBase

- (CMContinuityCaptureDeviceBase)initWithCapabilities:(id)a3 compositeDelegate:(id)a4 transportDevice:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  CMContinuityCaptureConfiguration *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id WeakRetained;
  id v27;
  NSObject *v28;
  CMContinuityCaptureDeviceBase *v29;
  id v31;
  _QWORD block[4];
  id v33;
  objc_super v34;
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  location = 0;
  CMContinuityCaptureMediaIdentifierFromEntityType(objc_msgSend(v11, "entityType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.continuitycapture.%@"), v15);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v34.receiver = self;
  v34.super_class = (Class)CMContinuityCaptureDeviceBase;
  v16 = -[CMContinuityCaptureDeviceBase init](&v34, sel_init);
  if (v16
    && (objc_storeWeak(&location, v16),
        *((_QWORD *)v16 + 2) = objc_msgSend(v11, "entityType"),
        objc_storeWeak((id *)v16 + 4, v12),
        objc_storeStrong((id *)v16 + 3, a3),
        *((_QWORD *)v16 + 3)))
  {
    if (v14)
    {
      v17 = v14;
    }
    else
    {
      objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      v17 = (id)FigDispatchQueueCreateWithPriority();
    }
    v18 = (void *)*((_QWORD *)v16 + 1);
    *((_QWORD *)v16 + 1) = v17;

    v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = (void *)*((_QWORD *)v16 + 5);
    *((_QWORD *)v16 + 5) = v19;

    v21 = objc_alloc_init(CMContinuityCaptureConfiguration);
    v22 = (void *)*((_QWORD *)v16 + 9);
    *((_QWORD *)v16 + 9) = v21;

    objc_msgSend(*((id *)v16 + 9), "setEntity:", objc_msgSend(*((id *)v16 + 3), "entityType"));
    v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v24 = (void *)*((_QWORD *)v16 + 16);
    *((_QWORD *)v16 + 16) = v23;

    objc_msgSend(v16, "setupStreamActionStateMachine");
    objc_msgSend(v16, "setupStateMachine");
    objc_storeStrong((id *)v16 + 17, a5);
    objc_msgSend(*((id *)v16 + 17), "addObserver:forKeyPath:options:context:", v16, CFSTR("active"), 3, 0);
    v25 = (void *)*((_QWORD *)v16 + 7);
    WeakRetained = objc_loadWeakRetained((id *)v16 + 4);
    v27 = objc_loadWeakRetained(&location);
    objc_msgSend(v25, "addObserver:forKeyPath:options:context:", WeakRetained, CFSTR("currentState"), 3, v27);

    objc_msgSend(*((id *)v16 + 7), "addObserver:forKeyPath:options:context:", v16, CFSTR("currentState"), 3, 0);
    atomic_store(1u, (unsigned __int8 *)v16 + 184);
    v28 = *((_QWORD *)v16 + 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __94__CMContinuityCaptureDeviceBase_initWithCapabilities_compositeDelegate_transportDevice_queue___block_invoke;
    block[3] = &unk_24F06AE60;
    objc_copyWeak(&v33, &location);
    dispatch_async(v28, block);
    objc_destroyWeak(&v33);
    objc_storeWeak((id *)v16 + 20, v13);
    if (objc_msgSend(v13, "remote"))
    {
      *(_QWORD *)(v16 + 212) = 0x500000004;
      v16[220] = FigGetCFPreferenceBooleanWithDefault() != 0;
    }
    v29 = v16;
  }
  else
  {
    v29 = 0;
  }

  objc_destroyWeak(&location);
  return v29;
}

void __94__CMContinuityCaptureDeviceBase_initWithCapabilities_compositeDelegate_transportDevice_queue___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "transportStream");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v4[18];
    v4[18] = v2;

    WeakRetained = v4;
  }

}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_227C5D000, a2, OS_LOG_TYPE_ERROR, "%@ ContinuityCapture error : dealloc unterminated device", (uint8_t *)&v2, 0xCu);
}

- (BOOL)invalidated
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
  id WeakRetained;
  void *v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_invalidated);
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __43__CMContinuityCaptureDeviceBase_invalidate__block_invoke;
    v6[3] = &unk_24F06ADE8;
    v6[4] = self;
    v7 = WeakRetained;
    dispatch_async(queue, v6);

  }
}

uint64_t __43__CMContinuityCaptureDeviceBase_invalidate__block_invoke(uint64_t result)
{
  unsigned __int8 v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(result + 32) + 184));
  if ((v1 & 1) != 0)
  {
    v2 = result;
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v2 + 32);
      v5 = *(_QWORD *)(v2 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ remove SM update KVO with composite delegate %@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 56), "removeObserver:forKeyPath:context:", *(_QWORD *)(v2 + 40), CFSTR("currentState"));
    result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 56), "removeObserver:forKeyPath:context:", *(_QWORD *)(v2 + 32), CFSTR("currentState"), 0);
    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(v2 + 32) + 184));
  }
  return result;
}

- (unint64_t)cameraCaptureStackStartTime
{
  CMContinuityCaptureDeviceBase *v2;
  unint64_t cameraCaptureStackStartTime;

  v2 = self;
  objc_sync_enter(v2);
  cameraCaptureStackStartTime = v2->_cameraCaptureStackStartTime;
  objc_sync_exit(v2);

  return cameraCaptureStackStartTime;
}

- (unint64_t)avCaptureStackStartTime
{
  CMContinuityCaptureDeviceBase *v2;
  unint64_t avCaptureStackStartTime;

  v2 = self;
  objc_sync_enter(v2);
  avCaptureStackStartTime = v2->_avCaptureStackStartTime;
  objc_sync_exit(v2);

  return avCaptureStackStartTime;
}

- (void)resetTransportDevice:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  CMContinuityCaptureDeviceBase *v11;
  id v12;
  _QWORD block[5];
  id v14;

  v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__CMContinuityCaptureDeviceBase_resetTransportDevice___block_invoke;
    block[3] = &unk_24F06ADE8;
    block[4] = self;
    v14 = v12;
    dispatch_async_and_wait(v10, block);

    v11 = self;
    objc_sync_enter(v11);
    objc_storeStrong((id *)&v11->_transportDevice, a3);
    objc_sync_exit(v11);

  }
}

id __54__CMContinuityCaptureDeviceBase_resetTransportDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("active"), 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("active"), 3, 0);
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
}

- (void)terminateComplete:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  unsigned __int8 v11;
  CMContinuityCaptureStateMachine *stateMachine;
  id v13;
  _QWORD v14[5];
  id location;

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_terminated)
  {
    v4[2](v4);
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
    if (WeakRetained)
    {
      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_not_V2(v8);

      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "queue");
      v10 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __51__CMContinuityCaptureDeviceBase_terminateComplete___block_invoke;
      v14[3] = &unk_24F06AEB0;
      v14[4] = self;
      dispatch_async_and_wait(v10, v14);

      v11 = atomic_load((unsigned __int8 *)&self->_observingStateMachineState);
      if ((v11 & 1) != 0)
      {
        stateMachine = self->_stateMachine;
        v13 = objc_loadWeakRetained(&location);
        -[CMContinuityCaptureStateMachine removeObserver:forKeyPath:context:](stateMachine, "removeObserver:forKeyPath:context:", WeakRetained, CFSTR("currentState"), v13);

        atomic_store(0, (unsigned __int8 *)&self->_observingStateMachineState);
      }
      self->_terminated = 1;
      v5[2](v5);
    }

    objc_destroyWeak(&location);
  }

}

id __51__CMContinuityCaptureDeviceBase_terminateComplete___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "transportDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("active"), 0);

  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 160), 0);
}

- (ContinuityCaptureTransportDevice)transportDevice
{
  CMContinuityCaptureDeviceBase *v2;
  ContinuityCaptureTransportDevice *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_transportDevice;
  objc_sync_exit(v2);

  return v3;
}

- (void)startSendingInvalidFrames
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  CMContinuityCaptureDeviceBase *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543618;
    v6 = self;
    v7 = 2080;
    v8 = "-[CMContinuityCaptureDeviceBase startSendingInvalidFrames]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
  }

  self->_dispatchingInvalidFrames = 1;
}

- (void)stopSendingInvalidFrames
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  CMContinuityCaptureDeviceBase *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_dispatchingInvalidFrames)
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543618;
      v6 = self;
      v7 = 2080;
      v8 = "-[CMContinuityCaptureDeviceBase stopSendingInvalidFrames]";
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
    }

    self->_dispatchingInvalidFrames = 0;
  }
}

- (void)restartSendingInvalidFramesIfApplicable
{
  NSObject *v3;
  int v4;
  CMContinuityCaptureDeviceBase *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_dispatchingInvalidFrames)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543618;
      v5 = self;
      v6 = 2080;
      v7 = "-[CMContinuityCaptureDeviceBase restartSendingInvalidFramesIfApplicable]";
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v4, 0x16u);
    }

    -[CMContinuityCaptureDeviceBase stopSendingInvalidFrames](self, "stopSendingInvalidFrames");
    -[CMContinuityCaptureDeviceBase startSendingInvalidFrames](self, "startSendingInvalidFrames");
  }
}

- (void)scheduleSendingInvalidFramesAfterTimeout:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  id invalidFrameBlock;
  id v8;
  id invalidFrameTimeoutBlock;
  id v10;
  dispatch_block_t v11;
  id v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDeviceBase *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!self->_ignoreSendingInvalidFrames)
  {
    if (v3)
    {
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2080;
        v28 = "-[CMContinuityCaptureDeviceBase scheduleSendingInvalidFramesAfterTimeout:]";
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s schedule", buf, 0x16u);
      }

      invalidFrameBlock = self->_invalidFrameBlock;
      if (invalidFrameBlock)
      {
        dispatch_block_cancel(invalidFrameBlock);
        v8 = self->_invalidFrameBlock;
        self->_invalidFrameBlock = 0;

      }
      invalidFrameTimeoutBlock = self->_invalidFrameTimeoutBlock;
      if (invalidFrameTimeoutBlock)
      {
        dispatch_block_cancel(invalidFrameTimeoutBlock);
        v10 = self->_invalidFrameTimeoutBlock;
        self->_invalidFrameTimeoutBlock = 0;

      }
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __74__CMContinuityCaptureDeviceBase_scheduleSendingInvalidFramesAfterTimeout___block_invoke;
      v22 = &unk_24F06AE60;
      objc_copyWeak(&v23, &location);
      v11 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v19);
      v12 = self->_invalidFrameBlock;
      self->_invalidFrameBlock = v11;

      v13 = dispatch_time(0, 1000000000 * self->_timeToWaitBeforeSendingInvalidFramesWhenConnectingInSec);
      -[CMContinuityCaptureDeviceBase queue](self, "queue", v19, v20, v21, v22);
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_after(v13, v14, self->_invalidFrameBlock);

      objc_destroyWeak(&v23);
    }
    else
    {
      v15 = self->_invalidFrameBlock;
      if (v15)
      {
        dispatch_block_cancel(v15);
        v16 = self->_invalidFrameBlock;
        self->_invalidFrameBlock = 0;

      }
      v17 = self->_invalidFrameTimeoutBlock;
      if (v17)
      {
        dispatch_block_cancel(v17);
        v18 = self->_invalidFrameTimeoutBlock;
        self->_invalidFrameTimeoutBlock = 0;

      }
      -[CMContinuityCaptureDeviceBase stopSendingInvalidFrames](self, "stopSendingInvalidFrames");
      if (self->_invalidFrameNotificationScheduled)
      {
        self->_invalidFrameNotificationScheduled = 0;
        -[CMContinuityCaptureDeviceBase scheduleInvalidFramesNotification:](self, "scheduleInvalidFramesNotification:", 0);
      }
    }
  }
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureDeviceBase_scheduleSendingInvalidFramesAfterTimeout___block_invoke(uint64_t a1)
{
  id *v1;
  unsigned int *WeakRetained;
  unsigned int *v3;
  dispatch_block_t v4;
  void *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "startSendingInvalidFrames");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__CMContinuityCaptureDeviceBase_scheduleSendingInvalidFramesAfterTimeout___block_invoke_2;
    block[3] = &unk_24F06AE60;
    objc_copyWeak(&v9, v1);
    v4 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    v5 = (void *)*((_QWORD *)v3 + 25);
    *((_QWORD *)v3 + 25) = v4;

    v6 = dispatch_time(0, 1000000000 * v3[54]);
    objc_msgSend(v3, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v6, v7, *((dispatch_block_t *)v3 + 25));

    objc_destroyWeak(&v9);
  }

}

void __74__CMContinuityCaptureDeviceBase_scheduleSendingInvalidFramesAfterTimeout___block_invoke_2(uint64_t a1)
{
  id *v1;
  _BYTE *WeakRetained;
  _BYTE *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[208])
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_loadWeakRetained(v1);
      v6 = 138543618;
      v7 = v5;
      v8 = 2080;
      v9 = "-[CMContinuityCaptureDeviceBase scheduleSendingInvalidFramesAfterTimeout:]_block_invoke_2";
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s no frames after timeout", (uint8_t *)&v6, 0x16u);

    }
    objc_msgSend(v3, "scheduleSendingInvalidFramesAfterTimeout:", 0);
    v3[209] = 1;
    objc_msgSend(v3, "scheduleInvalidFramesNotification:", 1);
  }

}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  NSDate *v11;
  NSDate *lastStreamFirstFrameDispatchTime;
  int v13;
  CMContinuityCaptureDeviceBase *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  if (!self->_lastStreamNoOfFramesDispatched)
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
      CMContinuityCaptureGetTimeStringFromDate(self->_lastStreamStartTime);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = self;
      v15 = 2048;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ [sessionID:%llx] Dispatch first frame for stream started at %{public}@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastStreamFirstFrameDispatchTime = self->_lastStreamFirstFrameDispatchTime;
    self->_lastStreamFirstFrameDispatchTime = v11;

  }
  if (CMGetAttachment(a3, CFSTR("HighLatencyFrame"), 0))
    ++self->_lastStreamNoOfHighLatencyFrames;
  ++self->_lastStreamNoOfFramesDispatched;
  -[CMContinuityCaptureDeviceBase printFrameBufferLog:](self, "printFrameBufferLog:");

}

- (ContinuityCaptureTransportDeviceStream)transportStream
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "entity", (_QWORD)v14);
        if (v11 == -[CMContinuityCaptureDeviceBase entity](self, "entity"))
        {
          v12 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return (ContinuityCaptureTransportDeviceStream *)v12;
}

- (CMContinuityCaptureStateMachine)streamActionStateMachine
{
  return self->_streamActionStateMachine;
}

- (CMContinuityCaptureState)stateMachineCurrentState
{
  NSObject *v3;

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return -[CMContinuityCaptureStateMachine currentState](self->_stateMachine, "currentState");
}

- (CMContinuityCaptureConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)stateMachineStreamSubstateSendData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  int64_t entity;
  void *v19;
  int v20;
  CMContinuityCaptureDeviceBase *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyConfiguration"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "remote"),
        v7,
        v6,
        v8))
  {
    if (self->_avcStreamNegotiator)
    {
      -[CMContinuityCaptureStateMachine enqueueEventWithNameToPostOnCurrentQueue:data:](self->_streamActionStateMachine, "enqueueEventWithNameToPostOnCurrentQueue:data:", CFSTR("kCMContinuityCaptureStreamActionEventReceivedData"), 0);
      if (self->_avcStackStarted)
        -[CMContinuityCaptureStateMachine enqueueEventWithNameToPost:data:](self->_streamActionStateMachine, "enqueueEventWithNameToPost:data:", CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarted"), 0);
    }
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyConfiguration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startStream:option:completion:", v10, objc_msgSend(v11, "integerValue"), &__block_literal_global_4);

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyAVCData"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "remote");

      if ((v15 & 1) == 0)
      {
        CMContinuityCaptureLog(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138543618;
          v21 = self;
          v22 = 2048;
          v23 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
          _os_log_impl(&dword_227C5D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Negotiation data sent", (uint8_t *)&v20, 0x16u);
        }

        -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        entity = self->_entity;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyAVCData"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleAVCNegotiation:data:", entity, v19);

      }
    }
  }

}

- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  CMContinuityCaptureStateMachine *stateMachine;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDeviceBase *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  switch(a3)
  {
    case 1uLL:
      -[CMContinuityCaptureDeviceBase stateMachineStartStreamOnEvent:option:](self, "stateMachineStartStreamOnEvent:option:", v8, a5);
      break;
    case 2uLL:
      -[CMContinuityCaptureDeviceBase stateMachineStopStreamOnEvent:option:](self, "stateMachineStopStreamOnEvent:option:", v8, a5);
      break;
    case 3uLL:
      -[CMContinuityCaptureDeviceBase stateMachineReStartStreamOnEvent:option:](self, "stateMachineReStartStreamOnEvent:option:", v8, a5);
      break;
    case 0xAuLL:
      CMContinuityCaptureLog(2);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v16 = self;
        _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate", buf, 0xCu);
      }

      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __66__CMContinuityCaptureDeviceBase_postActionOfType_forEvent_option___block_invoke;
      v12[3] = &unk_24F06AE60;
      objc_copyWeak(&v13, &location);
      -[CMContinuityCaptureDeviceBase terminateComplete:](self, "terminateComplete:", v12);
      objc_destroyWeak(&v13);
      break;
    case 0xCuLL:
      stateMachine = self->_stateMachine;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 3, 0);
      -[CMContinuityCaptureStateMachine notifyCompletion:](stateMachine, "notifyCompletion:", v11);

      break;
    case 0xDuLL:
      -[CMContinuityCaptureStateMachine notifyCompletion:](self->_stateMachine, "notifyCompletion:", 0);
      break;
    default:
      break;
  }
  objc_destroyWeak(&location);

}

void __66__CMContinuityCaptureDeviceBase_postActionOfType_forEvent_option___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 4);
    if (v2)
    {
      objc_msgSend(v3, "stopCameraCaptureStack:", 512);
      objc_msgSend(v2, "terminateCompleteForDevice:", v3);
      objc_msgSend(v3, "stateMachineNotifyComplete:", 0);
    }

    WeakRetained = v3;
  }

}

- (BOOL)postActionGuardOfType:(unint64_t)a3 forEventName:(id)a4 option:(unint64_t)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return 1;
}

- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  int v15;
  CMContinuityCaptureDeviceBase *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureStateMachine currentState](self->_stateMachine, "currentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = self;
    v17 = 2114;
    v18 = v8;
    v19 = 2114;
    v20 = v12;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ postCompletion for %{public}@ with currentState:%{public}@ eventStatus:%@", (uint8_t *)&v15, 0x2Au);

  }
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"));
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v14)[2](v14, v10);

    }
  }

}

- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4
{
  NSObject *queue;
  AVCMediaStreamNegotiator *avcStreamNegotiator;
  void (**v7)(id, _QWORD);

  queue = self->_queue;
  v7 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2(queue);
  avcStreamNegotiator = self->_avcStreamNegotiator;
  self->_avcStreamNegotiator = 0;

  self->_avcStackStarted = 0;
  v7[2](v7, 0);

}

- (BOOL)startAVConferenceStack:(unint64_t)a3
{
  NSObject *v4;
  CMContinuityCaptureDeviceBase *v5;
  int v7;
  CMContinuityCaptureDeviceBase *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2080;
    v10 = "-[CMContinuityCaptureDeviceBase startAVConferenceStack:]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v7, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CMContinuityCaptureStateMachine enqueueEventWithNameToPost:data:](self->_streamActionStateMachine, "enqueueEventWithNameToPost:data:", CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarted"), 0);
  self->_avcStackStarted = 1;
  v5 = self;
  objc_sync_enter(v5);
  v5->_avCaptureStackStartTime = mach_continuous_time();
  objc_sync_exit(v5);

  return 1;
}

- (BOOL)startCameraCaptureStack:(unint64_t)a3
{
  NSObject *v4;
  CMContinuityCaptureDeviceBase *v5;
  int v7;
  CMContinuityCaptureDeviceBase *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2080;
    v10 = "-[CMContinuityCaptureDeviceBase startCameraCaptureStack:]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v7, 0x16u);
  }

  -[CMContinuityCaptureStateMachine enqueueEventWithNameToPost:data:](self->_streamActionStateMachine, "enqueueEventWithNameToPost:data:", CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarting"), 0);
  v5 = self;
  objc_sync_enter(v5);
  v5->_cameraCaptureStackStartTime = mach_continuous_time();
  objc_sync_exit(v5);

  return 1;
}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__CMContinuityCaptureDeviceBase_handleAVCNegotiation_data___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __59__CMContinuityCaptureDeviceBase_handleAVCNegotiation_data___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleAVCNegotiation:data:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  id v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  AVCMediaStreamNegotiator *avcStreamNegotiator;
  id *v12;
  int v13;
  NSObject *v14;
  CMContinuityCaptureDeviceBase *v15;
  unint64_t v16;
  id obj;
  _QWORD block[4];
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDeviceBase *v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
    *(_DWORD *)buf = 138543618;
    v30 = self;
    v31 = 2048;
    v32 = v7;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Negotiation data received", buf, 0x16u);
  }

  -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "remote");

  if (v9)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__CMContinuityCaptureDeviceBase__handleAVCNegotiation_data___block_invoke;
    block[3] = &unk_24F06BAD8;
    objc_copyWeak(&v21, &location);
    v19 = v5;
    v20 = &v22;
    dispatch_async(v10, block);

    objc_destroyWeak(&v21);
  }
  else
  {
    avcStreamNegotiator = self->_avcStreamNegotiator;
    v12 = (id *)(v23 + 5);
    obj = (id)v23[5];
    v13 = -[AVCMediaStreamNegotiator setAnswer:withError:](avcStreamNegotiator, "setAnswer:withError:", v5, &obj);
    objc_storeStrong(v12, obj);
    if ((v13 & 1) != 0)
    {
      -[CMContinuityCaptureDeviceBase startAVConferenceStack:](self, "startAVConferenceStack:", 0);
    }
    else
    {
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (CMContinuityCaptureDeviceBase *)objc_loadWeakRetained(&location);
        v16 = v23[5];
        *(_DWORD *)buf = 138543618;
        v30 = v15;
        v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Failed to get set answer AVCNegotiator error %{public}@", buf, 0x16u);

      }
    }
  }
  -[CMContinuityCaptureStateMachine enqueueEventWithNameToPostOnCurrentQueue:data:](self->_streamActionStateMachine, "enqueueEventWithNameToPostOnCurrentQueue:data:", CFSTR("kCMContinuityCaptureStreamActionEventReceivedData"), 0);
  _Block_object_dispose(&v22, 8);

  objc_destroyWeak(&location);
}

void __60__CMContinuityCaptureDeviceBase__handleAVCNegotiation_data___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id obj;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = objc_alloc(MEMORY[0x24BDFD9F0]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = (void *)objc_msgSend(v4, "initWithOffer:error:", v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    if (v7)
    {
      v8 = WeakRetained[1];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __60__CMContinuityCaptureDeviceBase__handleAVCNegotiation_data___block_invoke_21;
      v12[3] = &unk_24F06BAB0;
      v12[4] = WeakRetained;
      v13 = v7;
      objc_copyWeak(&v14, v2);
      dispatch_async(v8, v12);
      objc_destroyWeak(&v14);

    }
    else
    {
      CMContinuityCaptureLog(2);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_loadWeakRetained(v2);
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v17 = v10;
        v18 = 2114;
        v19 = v11;
        _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Failed to get AVCNegotiator error %{public}@", buf, 0x16u);

      }
    }

  }
}

uint64_t __60__CMContinuityCaptureDeviceBase__handleAVCNegotiation_data___block_invoke_21(id *a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)a1[4] + 15, a1[5]);
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v4 = objc_msgSend(a1[4], "currentSessionID");
    v9 = 138543618;
    v10 = WeakRetained;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Negotiation data sent", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(a1[4], "transportDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1[4], "entity");
  objc_msgSend(*((id *)a1[4] + 15), "answer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleAVCNegotiation:data:", v6, v7);

  return objc_msgSend(a1[4], "startAVConferenceStack:", 0);
}

- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CMContinuityCaptureDeviceBase_startStream_option_completion___block_invoke;
  block[3] = &unk_24F06B068;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __63__CMContinuityCaptureDeviceBase_startStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startStream:option:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  NSDate *v12;
  NSDate *lastStreamStartTime;
  void *v14;
  NSObject *v15;
  NSMutableArray *pendingCompletionBlocks;
  uint64_t v17;
  void *v18;
  CMContinuityCaptureStateMachine *streamActionStateMachine;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  AVCMediaStreamNegotiator *v26;
  void *v27;
  id v28;
  AVCMediaStreamNegotiator *avcStreamNegotiator;
  AVCMediaStreamNegotiator *v30;
  void *v31;
  CMContinuityCaptureStateMachine *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  CMContinuityCaptureDeviceBase *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void (**)(id, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[CMContinuityCaptureDeviceBase streaming](self, "streaming"))
  {
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = self;
      _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Stream Session In Progress", buf, 0xCu);
    }

    v10[2](v10, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastStreamStartTime = self->_lastStreamStartTime;
    self->_lastStreamStartTime = v12;

    objc_msgSend(v9, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_storeStrong((id *)&self->_activeConfiguration, a3);
      -[CMContinuityCaptureDeviceBase willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("streaming"));
      atomic_store(1u, (unsigned __int8 *)&self->_streaming);
      -[CMContinuityCaptureDeviceBase didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("streaming"));
      CMContinuityCaptureLog(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v44 = self;
        v45 = 2114;
        v46 = v9;
        v47 = 1024;
        v48 = a4;
        _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream config:%{public}@ option:%d", buf, 0x1Cu);
      }

      if ((a4 & 0x800) != 0)
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
        ((void (**)(id, void *))v10)[2](v10, v22);

      }
      else
      {
        if (-[NSMutableArray count](self->_pendingCompletionBlocks, "count"))
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ ContinuityCapture error : Invalid completion block array"), self);
        pendingCompletionBlocks = self->_pendingCompletionBlocks;
        v17 = MEMORY[0x22E2A7CB0](v10);
        -[NSMutableArray addObject:](pendingCompletionBlocks, "addObject:", v17);

        -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v17) = objc_msgSend(v18, "remote");

        if ((v17 & 1) != 0)
        {
          streamActionStateMachine = self->_streamActionStateMachine;
          v39[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v39[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyConfiguration");
          v40[0] = v20;
          v40[1] = v9;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMContinuityCaptureStateMachine enqueueEventWithNameToPostOnCurrentQueue:data:](streamActionStateMachine, "enqueueEventWithNameToPostOnCurrentQueue:data:", CFSTR("kCMContinuityCaptureStreamActionEventSendData"), v21);

        }
        else
        {
          if (-[CMContinuityCaptureDeviceBase entity](self, "entity") == 3)
          {
            -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "audioDeviceMode");

            if (v24 == 1667329132)
              v25 = &unk_24F07FD78;
            else
              v25 = 0;
            v38 = 0;
            v26 = (AVCMediaStreamNegotiator *)objc_msgSend(objc_alloc(MEMORY[0x24BDFD9F0]), "initWithMode:options:error:", 4, v25, &v38);
            v27 = v38;
          }
          else
          {
            v37 = 0;
            v26 = (AVCMediaStreamNegotiator *)objc_msgSend(objc_alloc(MEMORY[0x24BDFD9F0]), "initWithMode:error:", 3, &v37);
            v27 = v37;
          }
          v28 = v27;
          avcStreamNegotiator = self->_avcStreamNegotiator;
          self->_avcStreamNegotiator = v26;

          v30 = self->_avcStreamNegotiator;
          if (v30
            && (-[AVCMediaStreamNegotiator offer](v30, "offer"),
                v31 = (void *)objc_claimAutoreleasedReturnValue(),
                v31,
                v31))
          {
            v32 = self->_streamActionStateMachine;
            v41[0] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyAVCData");
            -[AVCMediaStreamNegotiator offer](self->_avcStreamNegotiator, "offer");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = v33;
            v41[1] = CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v42[1] = v34;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[CMContinuityCaptureStateMachine enqueueEventWithNameToPostOnCurrentQueue:data:](v32, "enqueueEventWithNameToPostOnCurrentQueue:data:", CFSTR("kCMContinuityCaptureStreamActionEventSendData"), v35);

          }
          else
          {
            CMContinuityCaptureLog(2);
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v44 = self;
              v45 = 2114;
              v46 = v28;
              _os_log_impl(&dword_227C5D000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Failed to get AVCNegotiator error %{public}@", buf, 0x16u);
            }

          }
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ ContinuityCapture error : Invalid sessionID"), self);
    }
  }

}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13[3];
  id location;

  v8 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__CMContinuityCaptureDeviceBase_stopStream_option_completion___block_invoke;
  block[3] = &unk_24F06B158;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v13[2] = (id)a4;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureDeviceBase_stopStream_option_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_stopStream:option:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (BOOL)stopCameraCaptureStack:(unint64_t)a3
{
  return 1;
}

- (void)_stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  CMContinuityCaptureConfiguration *activeConfiguration;
  NSDate *lastStreamStartTime;
  NSDate *lastStreamFirstFrameDispatchTime;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18[3];
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDeviceBase *v21;
  __int16 v22;
  CMContinuityCaptureConfiguration *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (-[CMContinuityCaptureDeviceBase streaming](self, "streaming"))
  {
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      activeConfiguration = self->_activeConfiguration;
      *(_DWORD *)buf = 138543874;
      v21 = self;
      v22 = 2114;
      v23 = activeConfiguration;
      v24 = 1024;
      v25 = a4;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream config:%{public}@ option:%d", buf, 0x1Cu);
    }

    -[CMContinuityCaptureDeviceBase willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("streaming"));
    atomic_store(0, (unsigned __int8 *)&self->_streaming);
    -[CMContinuityCaptureDeviceBase didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("streaming"));
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __63__CMContinuityCaptureDeviceBase__stopStream_option_completion___block_invoke;
    v16[3] = &unk_24F06B1D0;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a4;
    v18[2] = (id)a3;
    v17 = v8;
    -[CMContinuityCaptureDeviceBase stopCaptureStack:completion:](self, "stopCaptureStack:completion:", a4, v16);
    -[CMContinuityCaptureDeviceBase logStreamSessionSummary](self, "logStreamSessionSummary");
    self->_lastStreamNoOfFramesDispatched = 0;
    self->_lastStreamNoOfHighLatencyFrames = 0;
    lastStreamStartTime = self->_lastStreamStartTime;
    self->_lastStreamStartTime = 0;

    lastStreamFirstFrameDispatchTime = self->_lastStreamFirstFrameDispatchTime;
    self->_lastStreamFirstFrameDispatchTime = 0;

    objc_destroyWeak(v18);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Stream Session not In Progress", buf, 0xCu);
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 3, 0);
    (*((void (**)(id, void *))v8 + 2))(v8, v15);

  }
  objc_destroyWeak(&location);

}

void __63__CMContinuityCaptureDeviceBase__stopStream_option_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v13 = 138543618;
    v14 = WeakRetained;
    v15 = 2114;
    v16 = a2;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stopCaptureStack %{public}@", (uint8_t *)&v13, 0x16u);

  }
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "transportDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "remote") || (v9 = *(_QWORD *)(a1 + 48), (v9 & 0x10) != 0))
    {

    }
    else
    {

      if ((v9 & 0x80) == 0)
      {
        CMContinuityCaptureLog(2);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138543362;
          v14 = v7;
          _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sending stop to remote", (uint8_t *)&v13, 0xCu);
        }

        objc_msgSend(v7, "transportDevice");
        v11 = objc_claimAutoreleasedReturnValue();
        -[NSObject stopStream:option:completion:](v11, "stopStream:option:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), &__block_literal_global_34);
LABEL_13:

        v12 = *(_QWORD *)(a1 + 32);
        if (v12)
          (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, a2);
        goto LABEL_15;
      }
    }
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ skip sending stop", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_15:

}

- (BOOL)hasStreamIntent
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_hasStreamIntent);
  return v2 & 1;
}

- (void)setStreamIntent:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_hasStreamIntent);
}

- (void)printFrameBufferLog:(int64_t)a3
{
  NSObject *v5;
  int v6;
  CMContinuityCaptureDeviceBase *v7;
  __int16 v8;
  unint64_t v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)a3 <= 0x1E && ((1 << a3) & 0x40000022) != 0
    || __ROR8__(0x4FA4FA4FA4FA4FA5 * a3 + 0x2D82D82D82D82D8, 1) <= 0x2D82D82D82D82D8uLL)
  {
    CMContinuityCaptureLog(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543874;
      v7 = self;
      v8 = 2048;
      v9 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
      v10 = 2048;
      v11 = a3;
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Received FrameCounter %lu", (uint8_t *)&v6, 0x20u);
    }

  }
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  _BYTE buf[12];
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = self;
    v19 = 2080;
    v20 = "-[CMContinuityCaptureDeviceBase postEvent:entity:data:]";
    v21 = 2112;
    v22 = v8;
    v23 = 2048;
    v24 = a4;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@ %ld", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CMContinuityCaptureDeviceBase_postEvent_entity_data___block_invoke;
  block[3] = &unk_24F06AF00;
  objc_copyWeak(&v17, (id *)buf);
  v15 = v9;
  v16 = v8;
  v12 = v8;
  v13 = v9;
  dispatch_async(queue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __55__CMContinuityCaptureDeviceBase_postEvent_entity_data___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v8 = WeakRetained;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyConfiguration"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = *(_QWORD *)(a1 + 32);
      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyConfiguration"));
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = v8[9];
        v8[9] = (id)v6;

        WeakRetained = v8;
        v5 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        WeakRetained = v8;
      }
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(WeakRetained[7], "enqueueEventWithNameToPostOnCurrentQueue:data:", *(_QWORD *)(a1 + 40), v5);
    WeakRetained = v8;
  }

}

+ (BOOL)keepRemoteClientAliveForEvent:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = keepRemoteClientAliveForEvent__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&keepRemoteClientAliveForEvent__onceToken, &__block_literal_global_35);
  v5 = objc_msgSend((id)keepRemoteClientAliveForEvent__keepAliveEventNames, "containsObject:", v4);

  return v5;
}

void __63__CMContinuityCaptureDeviceBase_keepRemoteClientAliveForEvent___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("kCMContinuityCaptureEventUserPause"), CFSTR("kCMContinuityCaptureEventUserResume"), CFSTR("kCMContinuityCaptureEventActiveCallStart"), CFSTR("kCMContinuityCaptureEventActiveCallEnd"), CFSTR("kCMContinuityCaptureEventCaptureSessionStarted"), CFSTR("kCMContinuityCaptureEventCaptureSessionEnded"), CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUse"), CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUseExit"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keepRemoteClientAliveForEvent__keepAliveEventNames;
  keepRemoteClientAliveForEvent__keepAliveEventNames = v0;

}

- (unint64_t)currentSessionID
{
  void *v2;
  unint64_t v3;

  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentSessionID");

  return v3;
}

- (void)stateMachineReStartStreamOnEvent:(id)a3 option:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  CMContinuityCaptureStateMachine *stateMachine;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  int64_t entity;
  _QWORD v26[4];
  id v27[2];
  id location;
  uint8_t buf[4];
  CMContinuityCaptureDeviceBase *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamInterrupted"));

  if (v8)
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a4 |= 4uLL;
    if (v10)
    {
      objc_msgSend(v6, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if ((v13 & 1) == 0)
      {
        -[CMContinuityCaptureDeviceBase stopCaptureStack:completion:](self, "stopCaptureStack:completion:", a4, &__block_literal_global_37);
        stateMachine = self->_stateMachine;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
        -[CMContinuityCaptureStateMachine notifyCompletion:](stateMachine, "notifyCompletion:", v15);

        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v6, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v6, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (!v19)
    {
      objc_msgSend(v6, "data");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");

      a4 |= v22;
    }
  }
  CMContinuityCaptureLog(2);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)(a4 | 1);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v30 = self;
    v31 = 2082;
    v32 = "-[CMContinuityCaptureDeviceBase stateMachineReStartStreamOnEvent:option:]";
    v33 = 2114;
    v34 = v6;
    v35 = 1024;
    v36 = (int)v24;
    _os_log_impl(&dword_227C5D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s %{public}@ option %d", buf, 0x26u);
  }

  entity = self->_entity;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __73__CMContinuityCaptureDeviceBase_stateMachineReStartStreamOnEvent_option___block_invoke_38;
  v26[3] = &unk_24F06AFF0;
  objc_copyWeak(v27, &location);
  v27[1] = v24;
  -[CMContinuityCaptureDeviceBase stopStream:option:completion:](self, "stopStream:option:completion:", entity, v24, v26);
  objc_destroyWeak(v27);
LABEL_12:
  objc_destroyWeak(&location);

}

void __73__CMContinuityCaptureDeviceBase_stateMachineReStartStreamOnEvent_option___block_invoke_38(uint64_t a1, uint64_t a2)
{
  id *v4;
  id *WeakRetained;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v7)
      {
        v8 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138412546;
        v15 = v8;
        v16 = 2114;
        v17 = a2;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ Stream Stop failed with error %{public}@", buf, 0x16u);

      }
      objc_msgSend(WeakRetained[7], "notifyCompletion:", a2);
    }
    else
    {
      if (v7)
      {
        v9 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ Stream Stop complete, restart new session", buf, 0xCu);

      }
      objc_msgSend(WeakRetained, "activeConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __73__CMContinuityCaptureDeviceBase_stateMachineReStartStreamOnEvent_option___block_invoke_39;
      v12[3] = &unk_24F06AFC8;
      objc_copyWeak(&v13, v4);
      objc_msgSend(WeakRetained, "startStream:option:completion:", v10, v11, v12);

      objc_destroyWeak(&v13);
    }
  }

}

void __73__CMContinuityCaptureDeviceBase_stateMachineReStartStreamOnEvent_option___block_invoke_39(uint64_t a1, uint64_t a2)
{
  id *v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[7], "notifyCompletion:", a2);
    if (a2)
    {
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_loadWeakRetained(v3);
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = a2;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ start stream failed error %@", (uint8_t *)&v8, 0x16u);

      }
    }
  }

}

- (void)stateMachineStartStreamOnEvent:(id)a3 option:(unint64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29[2];
  _QWORD v30[4];
  id v31;
  id location;

  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
  if (!WeakRetained)
    goto LABEL_16;
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      a4 |= objc_msgSend(v12, "integerValue");

    }
  }
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("kCMContinuityCaptureEventRemoteClientReconnect"));

  if (v14)
    v15 = a4 | 0x20;
  else
    v15 = a4;
  objc_msgSend(v6, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("kCMContinuityCaptureEventCaptureSessionEnded")))
  {

LABEL_11:
    v15 |= 0x100uLL;
    goto LABEL_12;
  }
  objc_msgSend(v6, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUseExit"));

  if (v18)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(v6, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[CMContinuityCaptureDeviceBase keepRemoteClientAliveForEvent:](CMContinuityCaptureDeviceBase, "keepRemoteClientAliveForEvent:", v19);

  -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "remote");
  v23 = (void *)(v15 | v20);

  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  if ((v22 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __71__CMContinuityCaptureDeviceBase_stateMachineStartStreamOnEvent_option___block_invoke_41;
    v27[3] = &unk_24F06BB60;
    v25 = v29;
    objc_copyWeak(v29, &location);
    v28 = v6;
    v29[1] = v23;
    objc_msgSend(WeakRetained, "startStream:option:completion:", v24, v23, v27);

    v26 = v28;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __71__CMContinuityCaptureDeviceBase_stateMachineStartStreamOnEvent_option___block_invoke;
    v30[3] = &unk_24F06AFC8;
    v25 = &v31;
    objc_copyWeak(&v31, &location);
    -[CMContinuityCaptureDeviceBase startStream:option:completion:](self, "startStream:option:completion:", v26, v23, v30);
  }

  objc_destroyWeak(v25);
LABEL_16:

  objc_destroyWeak(&location);
}

void __71__CMContinuityCaptureDeviceBase_stateMachineStartStreamOnEvent_option___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[7], "notifyCompletion:", a2);
    if (a2)
    {
      CMContinuityCaptureLog(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_loadWeakRetained(v3);
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = a2;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ start stream failed error %@", (uint8_t *)&v8, 0x16u);

      }
    }
  }

}

void __71__CMContinuityCaptureDeviceBase_stateMachineStartStreamOnEvent_option___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 40));
      v8 = objc_msgSend(WeakRetained, "currentSessionID");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(WeakRetained, "activeConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544642;
      v15 = v7;
      v16 = 2048;
      v17 = v8;
      v18 = 2082;
      v19 = "-[CMContinuityCaptureDeviceBase stateMachineStartStreamOnEvent:option:]_block_invoke";
      v20 = 2114;
      v21 = v9;
      v22 = 1024;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] %{public}s %{public}@ option %d configuration %{public}@", (uint8_t *)&v14, 0x3Au);

    }
    objc_msgSend(WeakRetained[7], "notifyCompletion:", v3);
    if (v3)
    {
      CMContinuityCaptureLog(2);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_loadWeakRetained(v4);
        v14 = 138412546;
        v15 = v13;
        v16 = 2112;
        v17 = (uint64_t)v3;
        _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ start stream failed error %@", (uint8_t *)&v14, 0x16u);

      }
    }
  }

}

- (void)stateMachineStopStreamOnEvent:(id)a3 option:(unint64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  int v32;
  int64_t entity;
  int64_t v34;
  char v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location;
  _QWORD v43[4];
  uint8_t buf[4];
  CMContinuityCaptureDeviceBase *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
  if (!WeakRetained)
    goto LABEL_25;
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (!v11)
    {
      objc_msgSend(v6, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      a4 |= v14;
    }
  }
  objc_msgSend(v6, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[CMContinuityCaptureDeviceBase keepRemoteClientAliveForEvent:](CMContinuityCaptureDeviceBase, "keepRemoteClientAliveForEvent:", v15);

  objc_msgSend(v6, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = a4 | v16;
  if ((objc_msgSend(v17, "isEqualToString:") & 1) == 0)
  {

    goto LABEL_14;
  }
  objc_msgSend(v6, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_12;
  objc_msgSend(v6, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {

LABEL_12:
    goto LABEL_13;
  }
  objc_msgSend(v6, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyAttemptStreamRestart"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v23, "BOOLValue");

  if ((v35 & 1) == 0)
LABEL_13:
    v18 |= 0x10uLL;
LABEL_14:
  objc_msgSend(v6, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqualToString:", CFSTR("kCMContinuityCaptureEventTerminate")))
  {

LABEL_17:
    v18 |= 0x200uLL;
    goto LABEL_18;
  }
  objc_msgSend(v6, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("kCMContinuityCaptureEventUserDisconnect"));

  if (v26)
    goto LABEL_17;
LABEL_18:
  CMContinuityCaptureLog(2);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v45 = self;
    v46 = 2082;
    v47 = "-[CMContinuityCaptureDeviceBase stateMachineStopStreamOnEvent:option:]";
    v48 = 2114;
    v49 = v6;
    v50 = 1024;
    v51 = v18;
    _os_log_impl(&dword_227C5D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s %{public}@ option %d", buf, 0x26u);
  }

  -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "remote");

  if ((v29 & 1) != 0)
  {
    v43[0] = CFSTR("kCMContinuityCaptureEventUserPause");
    v43[1] = CFSTR("kCMContinuityCaptureEventActiveCallStart");
    v43[2] = CFSTR("kCMContinuityCaptureEventUserDisconnect");
    v43[3] = CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "containsObject:", v31);

    if (v32)
      v18 |= 0x80uLL;
    entity = self->_entity;
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_3;
    v36[3] = &unk_24F06B500;
    objc_copyWeak(&v38, &location);
    v37 = v6;
    objc_msgSend(WeakRetained, "stopStream:option:completion:", entity, v18, v36);

    objc_destroyWeak(&v38);
  }
  else
  {
    v34 = -[CMContinuityCaptureDeviceBase entity](self, "entity");
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke;
    v39[3] = &unk_24F06B500;
    objc_copyWeak(&v41, &location);
    v40 = v6;
    -[CMContinuityCaptureDeviceBase stopStream:option:completion:](self, "stopStream:option:completion:", v34, v18, v39);

    objc_destroyWeak(&v41);
  }
LABEL_25:

  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("kCMContinuityCaptureEventTerminate"));

    if (v7)
    {
      CMContinuityCaptureLog(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138543362;
        v15 = v9;
        _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate", buf, 0xCu);

      }
      v10 = *((_QWORD *)WeakRetained + 1);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_42;
      v11[3] = &unk_24F06AE88;
      objc_copyWeak(&v13, v4);
      v12 = v3;
      dispatch_async(v10, v11);

      objc_destroyWeak(&v13);
    }
    else
    {
      objc_msgSend(*((id *)WeakRetained + 7), "notifyCompletion:", v3);
    }
  }

}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_42(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_2;
    v4[3] = &unk_24F06AE88;
    objc_copyWeak(&v6, v2);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "terminateComplete:", v4);

    objc_destroyWeak(&v6);
  }

}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 4);
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "terminateCompleteForDevice:", v5);
      objc_msgSend(v5[7], "notifyCompletion:", *(_QWORD *)(a1 + 32));
    }

    WeakRetained = v5;
  }

}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("kCMContinuityCaptureEventTerminate"));

    if (v7)
    {
      CMContinuityCaptureLog(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_loadWeakRetained(v4);
        *(_DWORD *)buf = 138543362;
        v15 = v9;
        _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ terminate", buf, 0xCu);

      }
      v10 = *((_QWORD *)WeakRetained + 1);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_44;
      block[3] = &unk_24F06AF00;
      objc_copyWeak(&v13, v4);
      block[4] = WeakRetained;
      v12 = v3;
      dispatch_async(v10, block);

      objc_destroyWeak(&v13);
    }
    else
    {
      objc_msgSend(*((id *)WeakRetained + 7), "notifyCompletion:", v3);
    }
  }

}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_44(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_2_45;
    v5[3] = &unk_24F06AE88;
    objc_copyWeak(&v7, v2);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "terminateComplete:", v5);

    objc_destroyWeak(&v7);
  }

}

void __70__CMContinuityCaptureDeviceBase_stateMachineStopStreamOnEvent_option___block_invoke_2_45(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 4);
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "terminateCompleteForDevice:", v5);
      objc_msgSend(v5[7], "notifyCompletion:", *(_QWORD *)(a1 + 32));
    }

    WeakRetained = v5;
  }

}

+ (void)defaultStateEntryTransitionActionForState:(id)a3 onEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int valid;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  valid = CMContinuityCaptureSMIsValidEntryEventForState(v6, v7);

  if (valid)
  {
    objc_msgSend(v11, "pendingEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

+ (void)defaultStateExitTransitionActionForState:(id)a3 onEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(a4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureSMGetMatchingStateEntryEventForExitEvent(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v11, "pendingEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if (v9)
    {
      objc_msgSend(v11, "pendingEvents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v7);

    }
  }

}

+ (BOOL)defaultStateExitGuard:(id)a3 dstState:(id)a4 onEvent:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int valid;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a5;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  valid = CMContinuityCaptureSMIsValidExitEventForState(v8, v9);

  objc_msgSend(v7, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureSMGetMatchingStateEntryEventForExitEvent(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (valid && v13)
  {
    objc_msgSend(v6, "pendingEvents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") == 1)
    {
      objc_msgSend(v6, "pendingEvents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "containsObject:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (void)unconditionalTransitionForState:(id)a3 andDeferringEvent:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "pendingEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[CMContinuityCaptureStateMachine deferredEvents](self->_stateMachine, "deferredEvents");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v6);

}

- (void)stateMachineNotifyComplete:(id)a3
{
  -[CMContinuityCaptureStateMachine notifyCompletion:](self->_stateMachine, "notifyCompletion:", a3);
}

- (void)streamStateMachineNotifyComplete:(id)a3
{
  -[CMContinuityCaptureStateMachine notifyCompletion:](self->_streamActionStateMachine, "notifyCompletion:", a3);
}

- (void)stateMachineClearDeferredEvents
{
  id v2;

  -[CMContinuityCaptureStateMachine deferredEvents](self->_stateMachine, "deferredEvents");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)startStreamCompletedWithError:(id)a3
{
  NSMutableArray *pendingCompletionBlocks;
  id v5;
  void (**v6)(_QWORD, _QWORD);

  pendingCompletionBlocks = self->_pendingCompletionBlocks;
  v5 = a3;
  if (!-[NSMutableArray count](pendingCompletionBlocks, "count"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ ContinuityCapture error : Invalid completion block array"), self);
  -[NSMutableArray firstObject](self->_pendingCompletionBlocks, "firstObject");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v5);

  -[NSMutableArray removeObjectAtIndex:](self->_pendingCompletionBlocks, "removeObjectAtIndex:", 0);
}

- (BOOL)activeConnection
{
  void *v2;
  void *v3;

  -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeStreams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "count") != 0;
  return (char)v2;
}

- (void)setStreamStateTimeout:(BOOL)a3 forTime:(unsigned int)a4
{
  _BOOL4 v5;
  dispatch_block_t v7;
  id streamTimeoutBlock;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (v5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__CMContinuityCaptureDeviceBase_setStreamStateTimeout_forTime___block_invoke;
    v12[3] = &unk_24F06AE60;
    objc_copyWeak(&v13, &location);
    v7 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v12);
    streamTimeoutBlock = self->_streamTimeoutBlock;
    self->_streamTimeoutBlock = v7;

    v9 = dispatch_time(0, 1000000000 * a4);
    dispatch_after(v9, (dispatch_queue_t)self->_queue, self->_streamTimeoutBlock);
    objc_destroyWeak(&v13);
  }
  else
  {
    v10 = self->_streamTimeoutBlock;
    if (v10)
    {
      dispatch_block_cancel(v10);
      v11 = self->_streamTimeoutBlock;
      self->_streamTimeoutBlock = 0;

    }
  }
  objc_destroyWeak(&location);
}

void __63__CMContinuityCaptureDeviceBase_setStreamStateTimeout_forTime___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[8], "enqueueEventWithNameToPostOnCurrentQueue:data:", CFSTR("kCMContinuityCaptureStreamActionEventTimeout"), 0);
    WeakRetained = v2;
  }

}

- (void)logStreamSessionSummary
{
  NSDate *lastStreamStartTime;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDate *lastStreamFirstFrameDispatchTime;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSDate *v19;
  double v20;
  double v21;
  unint64_t lastStreamNoOfFramesDispatched;
  NSObject *v23;
  double v24;
  float v25;
  void *v26;
  unint64_t v27;
  void *v28;
  double v29;
  unint64_t lastStreamNoOfHighLatencyFrames;
  void *p_compositeDelegate;
  id WeakRetained;
  void *v33;
  __CFString *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSDate *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  CMContinuityCaptureDeviceBase *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  double v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  double v60;
  __int16 v61;
  __CFString *v62;
  _QWORD v63[7];
  _QWORD v64[9];

  v64[7] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)-[NSMutableArray count](self->_streamSessionLogs, "count") >= 0xB)
    -[NSMutableArray removeObjectAtIndex:](self->_streamSessionLogs, "removeObjectAtIndex:", 0);
  v63[0] = CFSTR("StreamSessionStartTime");
  lastStreamStartTime = self->_lastStreamStartTime;
  v40 = lastStreamStartTime;
  if (lastStreamStartTime)
  {
    CMContinuityCaptureGetTimeStringFromDate(lastStreamStartTime);
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24F06D368;
  }
  v35 = (id)v4;
  v64[0] = v4;
  v63[1] = CFSTR("StreamSessionTransport");
  v5 = (void *)0x24BDD1000;
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v38, "wired"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v36;
  v63[2] = CFSTR("StreamSessionStopTime");
  CMContinuityCaptureGetCurrentTimeString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v7;
  v63[3] = CFSTR("GID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CMContinuityCaptureConfiguration generationID](self->_activeConfiguration, "generationID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v8;
  v63[4] = CFSTR("StreamSessionFirstFrameDispatchTime");
  lastStreamFirstFrameDispatchTime = self->_lastStreamFirstFrameDispatchTime;
  if (lastStreamFirstFrameDispatchTime)
  {
    CMContinuityCaptureGetTimeStringFromDate(self->_lastStreamFirstFrameDispatchTime);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_24F06D368;
  }
  v64[4] = v10;
  v63[5] = CFSTR("StreamSessionTotalFrameDispatched");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lastStreamNoOfFramesDispatched);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v11;
  v63[6] = CFSTR("StreamSessionID");
  -[CMContinuityCaptureConfiguration sessionID](self->_activeConfiguration, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[CMContinuityCaptureConfiguration sessionID](self->_activeConfiguration, "sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("NA");
  }
  v64[6] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 7);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  if (lastStreamFirstFrameDispatchTime)

  v15 = v42;
  if (v40)

  -[NSMutableArray addObject:](self->_streamSessionLogs, "addObject:", v42);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", self->_lastStreamFirstFrameDispatchTime);
  v18 = v17;

  v19 = self->_lastStreamFirstFrameDispatchTime;
  v20 = 0.0;
  if (v19 && self->_lastStreamStartTime)
  {
    -[NSDate timeIntervalSinceDate:](v19, "timeIntervalSinceDate:");
    v20 = fmax(v21, 0.0);
  }
  lastStreamNoOfFramesDispatched = self->_lastStreamNoOfFramesDispatched;
  CMContinuityCaptureLog(2);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 1.0;
    if (v18 >= 1.0)
      v24 = v18;
    v25 = (double)lastStreamNoOfFramesDispatched / v24;
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v41, "lastSessionID");
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("StreamSessionStartTime"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("StreamSessionStopTime"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = self->_lastStreamNoOfFramesDispatched;
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("StreamSessionFirstFrameDispatchTime"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v25;
    lastStreamNoOfHighLatencyFrames = self->_lastStreamNoOfHighLatencyFrames;
    p_compositeDelegate = &self->_compositeDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
    objc_msgSend(WeakRetained, "currentSessionActivationStartTime");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v35 = objc_loadWeakRetained((id *)&self->_compositeDelegate);
      objc_msgSend(v35, "currentSessionActivationStartTime");
      p_compositeDelegate = (void *)objc_claimAutoreleasedReturnValue();
      CMContinuityCaptureGetTimeStringFromDate(p_compositeDelegate);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = &stru_24F06D368;
    }
    *(_DWORD *)buf = 138545666;
    v44 = self;
    v45 = 2048;
    v46 = v37;
    v47 = 2114;
    v48 = v39;
    v49 = 2114;
    v50 = v26;
    v51 = 2048;
    v52 = v27;
    v53 = 2114;
    v54 = v28;
    v55 = 2048;
    v56 = v29;
    v57 = 2048;
    v58 = lastStreamNoOfHighLatencyFrames;
    v59 = 2048;
    v60 = v20;
    v61 = 2114;
    v62 = v34;
    _os_log_impl(&dword_227C5D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] Stream stop requested, summary : StartTime %{public}@ StopTime %{public}@ #ofFramesDispatched %llu FirstFrameDispatchTime %{public}@ FrameRate %.3f fps #ofHighLatencyFrames %lld timeToFirstFrame %.3f currentSessionActivationStartTime %{public}@", buf, 0x66u);
    if (v33)
    {

    }
    v15 = v42;
  }

}

- (void)setupStreamActionStateMachine
{
  CMContinuityCaptureStateMachine *v3;
  CMContinuityCaptureStateMachine *streamActionStateMachine;
  CMContinuityCaptureStateMachineEvent *v5;
  CMContinuityCaptureStateMachineEvent *v6;
  CMContinuityCaptureStateMachineEvent *v7;
  CMContinuityCaptureStateMachineEvent *v8;
  CMContinuityCaptureStateMachineEvent *v9;
  CMContinuityCaptureStateMachine *v10;
  void *v11;
  CMContinuityCaptureState *v12;
  uint64_t v13;
  CMContinuityCaptureState *v14;
  CMContinuityCaptureStateTransition *v15;
  CMContinuityCaptureState *v16;
  CMContinuityCaptureStateTransition *v17;
  CMContinuityCaptureState *v18;
  CMContinuityCaptureStateMachineEvent *v19;
  CMContinuityCaptureStateTransition *v20;
  CMContinuityCaptureState *v21;
  CMContinuityCaptureStateTransition *v22;
  CMContinuityCaptureState *v23;
  CMContinuityCaptureStateTransition *v24;
  CMContinuityCaptureStateTransition *v25;
  CMContinuityCaptureStateTransition *v26;
  CMContinuityCaptureStateTransition *v27;
  CMContinuityCaptureState *v28;
  CMContinuityCaptureStateTransition *v29;
  CMContinuityCaptureStateTransition *v30;
  CMContinuityCaptureStateTransition *v31;
  CMContinuityCaptureStateMachine *v32;
  void *v33;
  CMContinuityCaptureStateMachineEvent *v34;
  CMContinuityCaptureStateMachineEvent *v35;
  CMContinuityCaptureStateTransition *v36;
  CMContinuityCaptureStateTransition *v37;
  CMContinuityCaptureStateTransition *v38;
  CMContinuityCaptureStateMachineEvent *v39;
  CMContinuityCaptureStateMachineEvent *v40;
  CMContinuityCaptureStateMachineEvent *v41;
  CMContinuityCaptureState *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  CMContinuityCaptureState *v46;
  CMContinuityCaptureStateMachineEvent *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  CMContinuityCaptureState *v52;
  CMContinuityCaptureStateMachineEvent *v53;
  id v54;
  _QWORD v55[4];
  CMContinuityCaptureState *v56;
  CMContinuityCaptureStateMachineEvent *v57;
  id v58;
  _QWORD v59[4];
  CMContinuityCaptureState *v60;
  CMContinuityCaptureStateMachineEvent *v61;
  id v62;
  _QWORD v63[4];
  CMContinuityCaptureState *v64;
  CMContinuityCaptureStateMachineEvent *v65;
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id location;
  _QWORD v72[8];
  _QWORD v73[7];

  v73[5] = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = -[CMContinuityCaptureStateMachine initWithActionDelegate:queue:]([CMContinuityCaptureStateMachine alloc], "initWithActionDelegate:queue:", self, self->_queue);
  streamActionStateMachine = self->_streamActionStateMachine;
  self->_streamActionStateMachine = v3;

  v5 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureStreamActionEventSendData"), 1, 0);
  v6 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureStreamActionEventReceivedData"), 0, 0);
  v7 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarting"), 1, 0);
  v8 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarted"), 0, 0);
  v9 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureStreamActionEventTimeout"), 0, 0);
  v10 = self->_streamActionStateMachine;
  v73[0] = v5;
  v73[1] = v6;
  v73[2] = v9;
  v73[3] = v8;
  v73[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStateMachine addEvents:](v10, "addEvents:", v11);
  v39 = v9;

  v42 = -[CMContinuityCaptureState initWithAttributes:entryAction:exitAction:]([CMContinuityCaptureState alloc], "initWithAttributes:entryAction:exitAction:", CFSTR("kCMContinuityCaptureStreamStateReady"), &__block_literal_global_68, &__block_literal_global_69);
  v12 = [CMContinuityCaptureState alloc];
  v13 = MEMORY[0x24BDAC760];
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_3;
  v69[3] = &unk_24F06BBE8;
  objc_copyWeak(&v70, &location);
  v67[0] = v13;
  v67[1] = 3221225472;
  v67[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_4;
  v67[3] = &unk_24F06BBE8;
  objc_copyWeak(&v68, &location);
  v14 = -[CMContinuityCaptureState initWithAttributes:entryAction:exitAction:](v12, "initWithAttributes:entryAction:exitAction:", CFSTR("kCMContinuityCaptureStreamStateWait"), v69, v67);
  v15 = [CMContinuityCaptureStateTransition alloc];
  v63[0] = v13;
  v63[1] = 3221225472;
  v63[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_5;
  v63[3] = &unk_24F06BC10;
  v16 = v14;
  v64 = v16;
  v40 = v5;
  v65 = v40;
  objc_copyWeak(&v66, &location);
  v36 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v15, "initWithAttributes:dstState:event:guard:action:", v42, v16, v40, 0, v63);
  v17 = [CMContinuityCaptureStateTransition alloc];
  v59[0] = v13;
  v59[1] = 3221225472;
  v59[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_7;
  v59[3] = &unk_24F06BC10;
  v18 = v16;
  v60 = v18;
  v19 = v6;
  v61 = v19;
  objc_copyWeak(&v62, &location);
  v37 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v17, "initWithAttributes:dstState:event:guard:action:", v18, v18, v19, &__block_literal_global_72, v59);
  v20 = [CMContinuityCaptureStateTransition alloc];
  v55[0] = v13;
  v55[1] = 3221225472;
  v55[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_8;
  v55[3] = &unk_24F06BC10;
  v21 = v18;
  v56 = v21;
  v35 = v7;
  v57 = v35;
  objc_copyWeak(&v58, &location);
  v38 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v20, "initWithAttributes:dstState:event:guard:action:", v21, v21, v35, 0, v55);
  v22 = [CMContinuityCaptureStateTransition alloc];
  v51[0] = v13;
  v51[1] = 3221225472;
  v51[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_10;
  v51[3] = &unk_24F06BC10;
  v23 = v21;
  v52 = v23;
  v41 = v8;
  v53 = v41;
  objc_copyWeak(&v54, &location);
  v24 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v22, "initWithAttributes:dstState:event:guard:action:", v23, v23, v41, &__block_literal_global_73, v51);
  v25 = [CMContinuityCaptureStateTransition alloc];
  v49[0] = v13;
  v49[1] = 3221225472;
  v49[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_12;
  v49[3] = &unk_24F06BBE8;
  objc_copyWeak(&v50, &location);
  v26 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v25, "initWithAttributes:dstState:event:guard:action:", v23, v42, v41, &__block_literal_global_74_0, v49);
  v27 = [CMContinuityCaptureStateTransition alloc];
  v45[0] = v13;
  v45[1] = 3221225472;
  v45[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_14;
  v45[3] = &unk_24F06BC10;
  v28 = v23;
  v46 = v28;
  v34 = v19;
  v47 = v34;
  objc_copyWeak(&v48, &location);
  v29 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v27, "initWithAttributes:dstState:event:guard:action:", v28, v42, v34, &__block_literal_global_75, v45);
  v30 = [CMContinuityCaptureStateTransition alloc];
  v43[0] = v13;
  v43[1] = 3221225472;
  v43[2] = __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_15;
  v43[3] = &unk_24F06BBE8;
  objc_copyWeak(&v44, &location);
  v31 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v30, "initWithAttributes:dstState:event:guard:action:", v28, v42, v39, 0, v43);
  v32 = self->_streamActionStateMachine;
  v72[0] = v36;
  v72[1] = v37;
  v72[2] = v29;
  v72[3] = v24;
  v72[4] = v26;
  v72[5] = v31;
  v72[6] = v38;
  v72[7] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStateMachine addStateTransitions:](v32, "addStateTransitions:", v33);

  -[CMContinuityCaptureStateMachine setCurrentState:](self->_streamActionStateMachine, "setCurrentState:", v42);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v58);

  objc_destroyWeak(&v62);
  objc_destroyWeak(&v66);

  objc_destroyWeak(&v68);
  objc_destroyWeak(&v70);

  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setStreamStateTimeout:forTime:", 1, 10);

}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setStreamStateTimeout:forTime:", 0, 0);

}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v12, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "stateMachineStreamSubstateSendData:", v5);

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v12, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v12, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startCameraCaptureStack:", objc_msgSend(v10, "integerValue"));

  }
  else
  {
    objc_msgSend(v6, "startCameraCaptureStack:", 0);
  }

  v11 = objc_loadWeakRetained(v3);
  objc_msgSend(v11, "streamStateMachineNotifyComplete:", 0);

}

uint64_t __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4) ^ 1;
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", v3, v4);
  v2 += 6;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "stateMachineStreamSubstateReceiveData:", v7);
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "streamStateMachineNotifyComplete:", 0);

}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "streamStateMachineNotifyComplete:", 0);

}

uint64_t __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4) ^ 1;
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_10(uint64_t a1)
{
  id WeakRetained;

  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "streamStateMachineNotifyComplete:", 0);

}

BOOL __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_12(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "startStreamCompletedWithError:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "streamStateMachineNotifyComplete:", 0);

}

BOOL __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_14(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", v3, v4);
  v2 += 6;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "stateMachineStreamSubstateReceiveData:", v7);
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "startStreamCompletedWithError:", 0);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "streamStateMachineNotifyComplete:", 0);

}

void __62__CMContinuityCaptureDeviceBase_setupStreamActionStateMachine__block_invoke_15(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870186, 0);
  objc_msgSend(WeakRetained, "startStreamCompletedWithError:", v3);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "streamStateMachineNotifyComplete:", 0);

}

- (void)setupStateMachine
{
  CMContinuityCaptureStateMachine *v3;
  CMContinuityCaptureStateMachine *stateMachine;
  CMContinuityCaptureStateMachineEvent *v5;
  CMContinuityCaptureStateMachineEvent *v6;
  CMContinuityCaptureStateMachineEvent *v7;
  CMContinuityCaptureStateMachineEvent *v8;
  CMContinuityCaptureStateMachineEvent *v9;
  CMContinuityCaptureStateMachineEvent *v10;
  CMContinuityCaptureStateMachineEvent *v11;
  CMContinuityCaptureStateMachine *v12;
  void *v13;
  CMContinuityCaptureState *v14;
  void *v15;
  CMContinuityCaptureState *v16;
  CMContinuityCaptureState *v17;
  CMContinuityCaptureStateTransition *v18;
  CMContinuityCaptureState *v19;
  CMContinuityCaptureStateTransition *v20;
  CMContinuityCaptureState *v21;
  CMContinuityCaptureStateTransition *v22;
  CMContinuityCaptureState *v23;
  CMContinuityCaptureStateTransition *v24;
  CMContinuityCaptureState *v25;
  CMContinuityCaptureStateTransition *v26;
  CMContinuityCaptureState *v27;
  CMContinuityCaptureStateTransition *v28;
  CMContinuityCaptureState *v29;
  CMContinuityCaptureStateTransition *v30;
  CMContinuityCaptureState *v31;
  CMContinuityCaptureStateTransition *v32;
  CMContinuityCaptureState *v33;
  CMContinuityCaptureStateTransition *v34;
  id v35;
  CMContinuityCaptureStateTransition *v36;
  CMContinuityCaptureStateTransition *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  CMContinuityCaptureStateTransition *v43;
  CMContinuityCaptureStateTransition *v44;
  CMContinuityCaptureStateTransition *v45;
  CMContinuityCaptureStateTransition *v46;
  CMContinuityCaptureStateTransition *v47;
  void *v48;
  CMContinuityCaptureState *v49;
  void *v50;
  CMContinuityCaptureState *v51;
  void *v52;
  CMContinuityCaptureState *v53;
  void *v54;
  CMContinuityCaptureState *v55;
  void *v56;
  CMContinuityCaptureState *v57;
  void *v58;
  CMContinuityCaptureState *v59;
  void *v60;
  CMContinuityCaptureState *v61;
  void *v62;
  CMContinuityCaptureState *v63;
  void *v64;
  CMContinuityCaptureState *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  CMContinuityCaptureStateMachine *v83;
  id v84;
  void *v85;
  CMContinuityCaptureStateMachine *v86;
  void *v87;
  CMContinuityCaptureStateMachine *v88;
  void *v89;
  CMContinuityCaptureStateMachine *v90;
  void *v91;
  CMContinuityCaptureStateMachine *v92;
  void *v93;
  CMContinuityCaptureStateMachine *v94;
  void *v95;
  CMContinuityCaptureStateMachineEvent *v96;
  CMContinuityCaptureStateMachineEvent *v97;
  CMContinuityCaptureStateMachineEvent *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  CMContinuityCaptureState *v112;
  void *v113;
  CMContinuityCaptureStateTransition *v114;
  CMContinuityCaptureStateTransition *v115;
  CMContinuityCaptureStateTransition *v116;
  CMContinuityCaptureStateTransition *v117;
  CMContinuityCaptureStateTransition *v118;
  CMContinuityCaptureStateTransition *v119;
  CMContinuityCaptureStateTransition *v120;
  void *v121;
  void *v122;
  CMContinuityCaptureStateTransition *v123;
  CMContinuityCaptureStateTransition *v124;
  CMContinuityCaptureStateTransition *v125;
  CMContinuityCaptureStateTransition *v126;
  CMContinuityCaptureStateTransition *v127;
  CMContinuityCaptureStateTransition *v128;
  CMContinuityCaptureStateTransition *v129;
  CMContinuityCaptureStateTransition *v130;
  CMContinuityCaptureStateTransition *v131;
  CMContinuityCaptureStateMachineEvent *v132;
  CMContinuityCaptureStateMachineEvent *v133;
  CMContinuityCaptureStateMachineEvent *v134;
  CMContinuityCaptureStateMachineEvent *v135;
  CMContinuityCaptureStateMachineEvent *v136;
  CMContinuityCaptureStateMachineEvent *v137;
  CMContinuityCaptureStateMachineEvent *v138;
  CMContinuityCaptureStateTransition *v139;
  CMContinuityCaptureStateMachineEvent *v140;
  CMContinuityCaptureStateMachineEvent *v141;
  CMContinuityCaptureStateMachineEvent *v142;
  CMContinuityCaptureStateTransition *v143;
  CMContinuityCaptureStateMachineEvent *v144;
  CMContinuityCaptureStateMachineEvent *v145;
  CMContinuityCaptureState *v146;
  CMContinuityCaptureStateMachineEvent *v147;
  CMContinuityCaptureStateMachineEvent *v148;
  CMContinuityCaptureStateMachineEvent *v149;
  CMContinuityCaptureStateMachineEvent *v150;
  CMContinuityCaptureStateMachineEvent *v151;
  CMContinuityCaptureStateMachineEvent *v152;
  CMContinuityCaptureStateMachineEvent *v153;
  CMContinuityCaptureStateMachineEvent *v154;
  CMContinuityCaptureStateMachineEvent *v155;
  CMContinuityCaptureStateMachineEvent *v156;
  CMContinuityCaptureStateMachineEvent *v157;
  CMContinuityCaptureStateMachineEvent *v158;
  CMContinuityCaptureStateMachineEvent *v159;
  CMContinuityCaptureStateMachineEvent *v160;
  CMContinuityCaptureStateMachineEvent *v161;
  CMContinuityCaptureStateMachineEvent *v162;
  CMContinuityCaptureStateMachineEvent *v163;
  CMContinuityCaptureStateMachineEvent *v164;
  CMContinuityCaptureStateMachineEvent *v165;
  CMContinuityCaptureStateMachineEvent *v166;
  CMContinuityCaptureStateMachineEvent *v167;
  void *v168;
  CMContinuityCaptureStateMachineEvent *v169;
  CMContinuityCaptureStateMachineEvent *v170;
  CMContinuityCaptureStateMachineEvent *v171;
  CMContinuityCaptureState *v172;
  CMContinuityCaptureState *v173;
  _QWORD v174[4];
  id v175;
  CMContinuityCaptureStateMachineEvent *v176;
  CMContinuityCaptureStateMachineEvent *v177;
  id v178;
  _QWORD v179[4];
  id v180;
  _QWORD v181[4];
  id v182;
  _QWORD v183[4];
  id v184;
  CMContinuityCaptureStateMachineEvent *v185;
  CMContinuityCaptureStateMachineEvent *v186;
  id v187;
  _QWORD v188[4];
  id v189;
  id v190;
  _QWORD v191[4];
  id v192;
  id v193;
  _QWORD v194[4];
  id v195;
  id v196;
  _QWORD v197[4];
  id v198;
  id v199;
  _QWORD v200[4];
  id v201;
  id v202;
  _QWORD v203[4];
  id v204;
  id v205;
  _QWORD v206[4];
  CMContinuityCaptureState *v207;
  id v208;
  _QWORD v209[4];
  CMContinuityCaptureState *v210;
  id v211;
  _QWORD v212[4];
  CMContinuityCaptureState *v213;
  id v214;
  _QWORD v215[4];
  CMContinuityCaptureState *v216;
  id v217;
  _QWORD v218[4];
  CMContinuityCaptureState *v219;
  id v220;
  _QWORD v221[4];
  CMContinuityCaptureState *v222;
  id v223;
  _QWORD v224[4];
  CMContinuityCaptureState *v225;
  id v226;
  _QWORD v227[4];
  id v228;
  _QWORD v229[4];
  CMContinuityCaptureState *v230;
  id v231;
  _QWORD v232[4];
  id v233;
  _QWORD v234[4];
  id v235;
  _QWORD v236[4];
  id v237;
  _QWORD v238[4];
  id v239;
  _QWORD v240[4];
  id v241;
  _QWORD v242[4];
  id v243;
  _QWORD v244[4];
  id v245;
  id v246;
  _QWORD v247[4];
  id v248;
  id v249[5];
  id v250;
  CMContinuityCaptureStateMachineEvent *v251;
  id v252;
  _QWORD v253[4];
  id v254[5];
  id v255;
  CMContinuityCaptureStateMachineEvent *v256;
  id v257[5];
  id v258;
  CMContinuityCaptureStateMachineEvent *v259;
  void *v260;
  uint64_t v261;
  uint64_t (*v262)(uint64_t);
  void *v263;
  CMContinuityCaptureState *v264;
  CMContinuityCaptureStateMachineEvent *v265;
  id v266[5];
  CMContinuityCaptureState *v267;
  CMContinuityCaptureStateMachineEvent *v268;
  id v269[5];
  CMContinuityCaptureState *v270;
  CMContinuityCaptureStateMachineEvent *v271;
  void *v272;
  uint64_t v273;
  uint64_t (*v274)(uint64_t);
  void *v275;
  CMContinuityCaptureState *v276;
  CMContinuityCaptureStateMachineEvent *v277;
  void *v278;
  uint64_t v279;
  uint64_t (*v280)(uint64_t);
  void *v281;
  CMContinuityCaptureState *v282;
  CMContinuityCaptureStateMachineEvent *v283;
  id v284[5];
  id v285[5];
  CMContinuityCaptureState *v286;
  CMContinuityCaptureStateMachineEvent *v287;
  id v288[5];
  id v289[5];
  CMContinuityCaptureState *v290;
  CMContinuityCaptureStateMachineEvent *v291;
  _QWORD v292[4];
  id v293;
  _QWORD v294[4];
  id v295;
  _QWORD v296[4];
  id v297;
  _QWORD v298[4];
  id v299;
  id location;
  _QWORD v301[3];
  _QWORD v302[4];
  _QWORD v303[2];
  _QWORD v304[5];
  _QWORD v305[4];
  _QWORD v306[6];
  CMContinuityCaptureState *v307;
  _QWORD v308[3];
  _QWORD v309[6];
  CMContinuityCaptureState *v310;
  _QWORD v311[2];
  _QWORD v312[2];
  _QWORD v313[2];
  _QWORD v314[2];
  _QWORD v315[2];
  _QWORD v316[3];
  CMContinuityCaptureState *v317;
  _QWORD v318[3];
  _QWORD v319[3];
  _QWORD v320[3];
  _QWORD v321[3];
  _QWORD v322[5];
  _QWORD v323[5];
  _QWORD v324[4];
  _QWORD v325[4];
  _QWORD v326[30];

  v326[28] = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = -[CMContinuityCaptureStateMachine initWithActionDelegate:queue:]([CMContinuityCaptureStateMachine alloc], "initWithActionDelegate:queue:", self, self->_queue);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v3;

  v5 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventStartStream"), 1, 0);
  v144 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventStopStream"), 0, 0);
  v142 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventUserDisconnect"), 0, 0);
  v6 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventForceRestartStream"), 1, 0);
  v7 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventStreamInterrupted"), 1, 0);
  v153 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventCaptureSessionStarted"), 1, 0);
  v147 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventCaptureSessionEnded"), 0, 0);
  v164 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventSystemSleep"), 1, 0);
  v170 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventSystemWake"), 0, 0);
  v8 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventAssociatedDevicePause"), 1, 0);
  v160 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventAssociatedDeviceResume"), 0, 0);
  v159 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventTerminate"), 1, 0);
  v9 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventUserPause"), 1, 0);
  v149 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventUserResume"), 0, 0);
  v165 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventStreamDisableForMultipleStream"), 1, 0);
  v171 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventStreamEnableForMultipleStreamExit"), 0, 0);
  v156 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventImageCapture"), 0, 0);
  v155 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventEnqueueReactionEffect"), 0, 0);
  v10 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUse"), 1, 0);
  v140 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUseExit"), 0, 0);
  v11 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventActiveCallStart"), 1, 0);
  v138 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventActiveCallEnd"), 0, 0);
  v163 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventStreamDisableForWifiContention"), 1, 0);
  v167 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventStreamEnableForWifiContentionExit"), 0, 0);
  v162 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventScreenLocked"), 1, 0);
  v169 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventScreenUnlocked"), 0, 0);
  v161 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect"), 1, 0);
  v166 = -[CMContinuityCaptureStateMachineEvent initWithName:isEntry:eventAction:]([CMContinuityCaptureStateMachineEvent alloc], "initWithName:isEntry:eventAction:", CFSTR("kCMContinuityCaptureEventRemoteClientReconnect"), 0, 0);
  v12 = self->_stateMachine;
  v326[0] = v5;
  v326[1] = v144;
  v326[2] = v153;
  v326[3] = v7;
  v326[4] = v147;
  v326[5] = v164;
  v326[6] = v170;
  v326[7] = v159;
  v326[8] = v6;
  v326[9] = v9;
  v326[10] = v149;
  v326[11] = v163;
  v326[12] = v167;
  v326[13] = v8;
  v326[14] = v10;
  v326[15] = v140;
  v326[16] = v160;
  v326[17] = v165;
  v326[18] = v171;
  v326[19] = v156;
  v326[20] = v155;
  v326[21] = v142;
  v326[22] = v11;
  v326[23] = v138;
  v326[24] = v162;
  v326[25] = v169;
  v326[26] = v161;
  v326[27] = v166;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v326, 28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStateMachine addEvents:](v12, "addEvents:", v13);
  v157 = v5;
  v132 = v8;
  v134 = v7;
  v136 = v6;

  v172 = -[CMContinuityCaptureState initWithAttributes:entryAction:exitAction:]([CMContinuityCaptureState alloc], "initWithAttributes:entryAction:exitAction:", CFSTR("kCMContinuityCaptureStateInit"), 0, 0);
  v14 = [CMContinuityCaptureState alloc];
  v15 = (void *)MEMORY[0x24BDAC760];
  v298[0] = MEMORY[0x24BDAC760];
  v298[1] = 3221225472;
  v298[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke;
  v298[3] = &unk_24F06BBE8;
  objc_copyWeak(&v299, &location);
  v296[0] = v15;
  v296[1] = 3221225472;
  v296[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_2;
  v296[3] = &unk_24F06BBE8;
  objc_copyWeak(&v297, &location);
  v173 = -[CMContinuityCaptureState initWithAttributes:entryAction:exitAction:](v14, "initWithAttributes:entryAction:exitAction:", CFSTR("kCMContinuityCaptureStateStreaming"), v298, v296);
  v112 = -[CMContinuityCaptureState initWithAttributes:entryAction:exitAction:]([CMContinuityCaptureState alloc], "initWithAttributes:entryAction:exitAction:", CFSTR("kCMContinuityCaptureStateDisabled"), 0, 0);
  v16 = [CMContinuityCaptureState alloc];
  v294[0] = v15;
  v294[1] = 3221225472;
  v294[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_3;
  v294[3] = &unk_24F06BBE8;
  objc_copyWeak(&v295, &location);
  v292[0] = v15;
  v292[1] = 3221225472;
  v292[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_4;
  v292[3] = &unk_24F06BBE8;
  objc_copyWeak(&v293, &location);
  v17 = -[CMContinuityCaptureState initWithAttributes:entryAction:exitAction:](v16, "initWithAttributes:entryAction:exitAction:", CFSTR("kCMContinuityCaptureStatePaused"), v294, v292);
  v146 = -[CMContinuityCaptureState initWithAttributes:entryAction:exitAction:]([CMContinuityCaptureState alloc], "initWithAttributes:entryAction:exitAction:", CFSTR("kCMContinuityCaptureStateTerminated"), 0, 0);
  v18 = [CMContinuityCaptureStateTransition alloc];
  v289[1] = v15;
  v289[2] = (id)3221225472;
  v289[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_5;
  v289[4] = &unk_24F06BCD8;
  v19 = v17;
  v290 = v19;
  v291 = v9;
  v152 = v291;
  v123 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v18, "initWithAttributes:dstState:event:guard:action:", v173, v19);
  v20 = [CMContinuityCaptureStateTransition alloc];
  v288[1] = v15;
  v288[2] = (id)3221225472;
  v288[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_6;
  v288[4] = &unk_24F06BD00;
  objc_copyWeak(v289, &location);
  v285[1] = v15;
  v285[2] = (id)3221225472;
  v285[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_7;
  v285[4] = &unk_24F06BD28;
  objc_copyWeak(v288, &location);
  v21 = v19;
  v286 = v21;
  v287 = v153;
  v135 = v287;
  v126 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v20, "initWithAttributes:dstState:event:guard:action:", v173, v21);
  v22 = [CMContinuityCaptureStateTransition alloc];
  v284[1] = v15;
  v284[2] = (id)3221225472;
  v284[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_8;
  v284[4] = &unk_24F06BD00;
  objc_copyWeak(v285, &location);
  v278 = v15;
  v279 = 3221225472;
  v280 = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_9;
  v281 = &unk_24F06BD28;
  objc_copyWeak(v284, &location);
  v23 = v21;
  v282 = v23;
  v283 = v10;
  v137 = v283;
  v128 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v22, "initWithAttributes:dstState:event:guard:action:", v173, v23);
  v24 = [CMContinuityCaptureStateTransition alloc];
  v272 = v15;
  v273 = 3221225472;
  v274 = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_10;
  v275 = &unk_24F06BCD8;
  v25 = v23;
  v276 = v25;
  v277 = v11;
  v151 = v277;
  v130 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v24, "initWithAttributes:dstState:event:guard:action:", v173, v25);
  v26 = [CMContinuityCaptureStateTransition alloc];
  v269[1] = v15;
  v269[2] = (id)3221225472;
  v269[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_12;
  v269[4] = &unk_24F06BCD8;
  v27 = v25;
  v270 = v27;
  v271 = v149;
  v150 = v271;
  v125 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v26, "initWithAttributes:dstState:event:guard:action:", v27, v173);
  v28 = [CMContinuityCaptureStateTransition alloc];
  v266[1] = v15;
  v266[2] = (id)3221225472;
  v266[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_14;
  v266[4] = &unk_24F06BD28;
  objc_copyWeak(v269, &location);
  v29 = v27;
  v267 = v29;
  v268 = v147;
  v133 = v268;
  v127 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v28, "initWithAttributes:dstState:event:guard:action:", v29, v173);
  v30 = [CMContinuityCaptureStateTransition alloc];
  v260 = v15;
  v261 = 3221225472;
  v262 = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_16;
  v263 = &unk_24F06BD28;
  objc_copyWeak(v266, &location);
  v31 = v29;
  v264 = v31;
  v265 = v140;
  v141 = v265;
  v129 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v30, "initWithAttributes:dstState:event:guard:action:", v31, v173);
  v32 = [CMContinuityCaptureStateTransition alloc];
  v257[1] = v15;
  v257[2] = (id)3221225472;
  v257[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_18;
  v257[4] = &unk_24F06BCD8;
  v33 = v31;
  v258 = v33;
  v259 = v138;
  v148 = v259;
  v131 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v32, "initWithAttributes:dstState:event:guard:action:", v33, v173);
  v34 = [CMContinuityCaptureStateTransition alloc];
  v254[1] = v15;
  v254[2] = (id)3221225472;
  v254[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_19;
  v254[4] = &unk_24F06BD28;
  objc_copyWeak(v257, &location);
  v35 = v33;
  v255 = v35;
  v256 = v144;
  v154 = v256;
  v139 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v34, "initWithAttributes:dstState:event:guard:action:", v35, v173);
  v36 = [CMContinuityCaptureStateTransition alloc];
  v253[0] = v15;
  v253[1] = 3221225472;
  v253[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_20;
  v253[3] = &unk_24F06BBE8;
  objc_copyWeak(v254, &location);
  v124 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v36, "initWithAttributes:dstState:event:guard:action:", v35, v35, v157, 0, v253);
  v37 = [CMContinuityCaptureStateTransition alloc];
  v249[1] = v15;
  v249[2] = (id)3221225472;
  v249[3] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_21;
  v249[4] = &unk_24F06BD28;
  objc_copyWeak(&v252, &location);
  v38 = v35;
  v250 = v38;
  v251 = v142;
  v145 = v251;
  v143 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v37, "initWithAttributes:dstState:event:guard:action:", v38, v173);
  v325[0] = v152;
  v325[1] = v151;
  v325[2] = v135;
  v325[3] = v137;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v325, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v247[0] = v15;
  v247[1] = 3221225472;
  v247[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_22;
  v247[3] = &unk_24F06BDD0;
  v40 = v38;
  v248 = v40;
  objc_copyWeak(v249, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v40, v40, v39, v247, 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  v324[0] = v150;
  v324[1] = v148;
  v324[2] = v133;
  v324[3] = v141;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v324, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v244[0] = v15;
  v244[1] = 3221225472;
  v244[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_23;
  v244[3] = &unk_24F06BDD0;
  v245 = v40;
  objc_copyWeak(&v246, &location);
  v242[0] = v15;
  v242[1] = 3221225472;
  v242[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_24;
  v242[3] = &unk_24F06BDF8;
  v42 = v245;
  v243 = v42;
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v42, v42, v41, v244, v242);
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = [CMContinuityCaptureStateTransition alloc];
  v240[0] = v15;
  v240[1] = 3221225472;
  v240[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_25;
  v240[3] = &unk_24F06BD00;
  objc_copyWeak(&v241, &location);
  v120 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v43, "initWithAttributes:dstState:event:guard:action:", v172, v173, v157, v240, 0);
  v119 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:]([CMContinuityCaptureStateTransition alloc], "initWithAttributes:dstState:event:guard:action:", v173, v172, v154, 0, 0);
  v118 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:]([CMContinuityCaptureStateTransition alloc], "initWithAttributes:dstState:event:guard:action:", v173, v172, v145, 0, 0);
  v44 = [CMContinuityCaptureStateTransition alloc];
  v238[0] = v15;
  v238[1] = 3221225472;
  v238[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_26;
  v238[3] = &unk_24F06BBE8;
  objc_copyWeak(&v239, &location);
  v117 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v44, "initWithAttributes:dstState:event:guard:action:", v173, v173, v136, 0, v238);
  v45 = [CMContinuityCaptureStateTransition alloc];
  v236[0] = v15;
  v236[1] = 3221225472;
  v236[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_27;
  v236[3] = &unk_24F06BBE8;
  objc_copyWeak(&v237, &location);
  v116 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v45, "initWithAttributes:dstState:event:guard:action:", v173, v173, v7, 0, v236);
  v46 = [CMContinuityCaptureStateTransition alloc];
  v234[0] = v15;
  v234[1] = 3221225472;
  v234[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_28;
  v234[3] = &unk_24F06BBE8;
  objc_copyWeak(&v235, &location);
  v115 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v46, "initWithAttributes:dstState:event:guard:action:", v173, v173, v156, 0, v234);
  v47 = [CMContinuityCaptureStateTransition alloc];
  v232[0] = v15;
  v232[1] = 3221225472;
  v232[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_29;
  v232[3] = &unk_24F06BBE8;
  objc_copyWeak(&v233, &location);
  v114 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:](v47, "initWithAttributes:dstState:event:guard:action:", v173, v173, v155, 0, v232);
  v323[0] = v170;
  v323[1] = v171;
  v323[2] = v167;
  v323[3] = v169;
  v323[4] = v166;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v323, 5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v229[0] = v15;
  v229[1] = 3221225472;
  v229[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_30;
  v229[3] = &unk_24F06BDD0;
  v49 = v112;
  v230 = v49;
  objc_copyWeak(&v231, &location);
  v227[0] = v15;
  v227[1] = 3221225472;
  v227[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_31;
  v227[3] = &unk_24F06BD00;
  objc_copyWeak(&v228, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v49, v173, v48, v229, v227);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  v322[0] = v164;
  v322[1] = v165;
  v322[2] = v163;
  v322[3] = v162;
  v322[4] = v161;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v322, 5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v224[0] = v15;
  v224[1] = 3221225472;
  v224[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_32;
  v224[3] = &unk_24F06BDD0;
  v51 = v49;
  v225 = v51;
  objc_copyWeak(&v226, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v173, v51, v50, v224, 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  v321[0] = v172;
  v321[1] = v51;
  v321[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v321, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v221[0] = v15;
  v221[1] = 3221225472;
  v221[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_33;
  v221[3] = &unk_24F06BDD0;
  v53 = v51;
  v222 = v53;
  objc_copyWeak(&v223, &location);
  CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v52, v53, v165, v221, 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  v320[0] = v172;
  v320[1] = v53;
  v320[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v320, 3);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v218[0] = v15;
  v218[1] = 3221225472;
  v218[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_34;
  v218[3] = &unk_24F06BDD0;
  v55 = v53;
  v219 = v55;
  objc_copyWeak(&v220, &location);
  CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v54, v55, v163, v218, 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  v319[0] = v172;
  v319[1] = v55;
  v319[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v319, 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v215[0] = v15;
  v215[1] = 3221225472;
  v215[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_35;
  v215[3] = &unk_24F06BDD0;
  v57 = v55;
  v216 = v57;
  objc_copyWeak(&v217, &location);
  CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v56, v57, v162, v215, 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v318[0] = v172;
  v318[1] = v57;
  v318[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v318, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v212[0] = v15;
  v212[1] = 3221225472;
  v212[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_36;
  v212[3] = &unk_24F06BDD0;
  v59 = v57;
  v213 = v59;
  objc_copyWeak(&v214, &location);
  CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v58, v59, v164, v212, 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  v317 = v59;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v317, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v209[0] = v15;
  v209[1] = 3221225472;
  v209[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_37;
  v209[3] = &unk_24F06BDD0;
  v61 = v59;
  v210 = v61;
  objc_copyWeak(&v211, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v172, v60, v132, v209, 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v316[0] = v172;
  v316[1] = v61;
  v316[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v316, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v206[0] = v15;
  v206[1] = 3221225472;
  v206[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_38;
  v206[3] = &unk_24F06BDD0;
  v63 = v61;
  v207 = v63;
  objc_copyWeak(&v208, &location);
  CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v62, v63, v161, v206, 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  v315[0] = v172;
  v315[1] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v315, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v203[0] = v15;
  v203[1] = 3221225472;
  v203[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_39;
  v203[3] = &unk_24F06BDD0;
  v65 = v63;
  v204 = v65;
  objc_copyWeak(&v205, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v65, v64, v171, v203, &__block_literal_global_80);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v314[0] = v172;
  v314[1] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v314, 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v200[0] = v15;
  v200[1] = 3221225472;
  v200[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_41;
  v200[3] = &unk_24F06BDD0;
  v67 = v65;
  v201 = v67;
  objc_copyWeak(&v202, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v67, v66, v167, v200, &__block_literal_global_81);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  v313[0] = v172;
  v313[1] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v313, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v197[0] = v15;
  v197[1] = 3221225472;
  v197[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_43;
  v197[3] = &unk_24F06BDD0;
  v69 = v67;
  v198 = v69;
  objc_copyWeak(&v199, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v69, v68, v169, v197, &__block_literal_global_82);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v312[0] = v172;
  v312[1] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v312, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v194[0] = v15;
  v194[1] = 3221225472;
  v194[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_45;
  v194[3] = &unk_24F06BDD0;
  v71 = v69;
  v195 = v71;
  objc_copyWeak(&v196, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v71, v70, v170, v194, &__block_literal_global_83);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v311[0] = v172;
  v311[1] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v311, 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v191[0] = v15;
  v191[1] = 3221225472;
  v191[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_47;
  v191[3] = &unk_24F06BDD0;
  v73 = v71;
  v192 = v73;
  objc_copyWeak(&v193, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v73, v72, v166, v191, &__block_literal_global_84);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v310 = v172;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v310, 1);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v188[0] = v15;
  v188[1] = 3221225472;
  v188[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_49;
  v188[3] = &unk_24F06BDD0;
  v75 = v73;
  v189 = v75;
  objc_copyWeak(&v190, &location);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(v75, v74, v160, v188, &__block_literal_global_85);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v309[0] = v170;
  v309[1] = v171;
  v309[2] = v167;
  v309[3] = v169;
  v309[4] = v166;
  v309[5] = v160;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v309, 6);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v183[0] = v15;
  v183[1] = 3221225472;
  v183[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_51;
  v183[3] = &unk_24F06BEE0;
  v184 = v75;
  v98 = v166;
  v185 = v98;
  v97 = v167;
  v186 = v97;
  objc_copyWeak(&v187, &location);
  v181[0] = v15;
  v181[1] = 3221225472;
  v181[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_52;
  v181[3] = &unk_24F06BDF8;
  v77 = v184;
  v182 = v77;
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v77, v77, v76, v183, v181);
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  v308[0] = v172;
  v308[1] = v77;
  v308[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v308, 3);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v179[0] = v15;
  v179[1] = 3221225472;
  v179[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_53;
  v179[3] = &unk_24F06BBE8;
  objc_copyWeak(&v180, &location);
  CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v78, v146, v159, v179, 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v307 = v173;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v307, 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(v80, v146, v159, 0, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  v306[0] = v154;
  v306[1] = v157;
  v306[2] = v152;
  v306[3] = v150;
  v306[4] = v151;
  v306[5] = v148;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v306, 6);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = self->_stateMachine;
  v174[0] = v15;
  v174[1] = 3221225472;
  v174[2] = __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_54;
  v174[3] = &unk_24F06BF08;
  v84 = v77;
  v175 = v84;
  v96 = v157;
  v176 = v96;
  objc_copyWeak(&v178, &location);
  v158 = v154;
  v177 = v158;
  CMContinuityCaptureSMDeferEventsInState(v82, v84, v83, v174);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = self->_stateMachine;
  v305[0] = v123;
  v305[1] = v130;
  v305[2] = v126;
  v305[3] = v128;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v305, 4);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStateMachine addStateTransitions:](v86, "addStateTransitions:", v87);

  v88 = self->_stateMachine;
  v304[0] = v125;
  v304[1] = v131;
  v304[2] = v139;
  v304[3] = v127;
  v304[4] = v129;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v304, 5);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStateMachine addStateTransitions:](v88, "addStateTransitions:", v89);

  v90 = self->_stateMachine;
  v303[0] = v124;
  v303[1] = v143;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v303, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStateMachine addStateTransitions:](v90, "addStateTransitions:", v91);

  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v122);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v121);
  v92 = self->_stateMachine;
  v302[0] = v120;
  v302[1] = v119;
  v302[2] = v118;
  v302[3] = v117;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v302, 4);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStateMachine addStateTransitions:](v92, "addStateTransitions:", v93);

  v94 = self->_stateMachine;
  v301[0] = v116;
  v301[1] = v115;
  v301[2] = v114;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v301, 3);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureStateMachine addStateTransitions:](v94, "addStateTransitions:", v95);

  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v113);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v111);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v107);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v110);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v109);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v108);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v106);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v105);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v104);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v103);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v102);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v101);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v100);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v99);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v168);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v79);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v81);
  -[CMContinuityCaptureStateMachine addStateTransitions:](self->_stateMachine, "addStateTransitions:", v85);
  -[CMContinuityCaptureStateMachine setCurrentState:](self->_stateMachine, "setCurrentState:", v172);

  objc_destroyWeak(&v178);
  objc_destroyWeak(&v180);

  objc_destroyWeak(&v187);
  objc_destroyWeak(&v190);

  objc_destroyWeak(&v193);
  objc_destroyWeak(&v196);

  objc_destroyWeak(&v199);
  objc_destroyWeak(&v202);

  objc_destroyWeak(&v205);
  objc_destroyWeak(&v208);

  objc_destroyWeak(&v211);
  objc_destroyWeak(&v214);

  objc_destroyWeak(&v217);
  objc_destroyWeak(&v220);

  objc_destroyWeak(&v223);
  objc_destroyWeak(&v226);

  objc_destroyWeak(&v228);
  objc_destroyWeak(&v231);

  objc_destroyWeak(&v233);
  objc_destroyWeak(&v235);

  objc_destroyWeak(&v237);
  objc_destroyWeak(&v239);

  objc_destroyWeak(&v241);
  objc_destroyWeak(&v246);

  objc_destroyWeak(v249);
  objc_destroyWeak(&v252);

  objc_destroyWeak(v254);
  objc_destroyWeak(v257);

  objc_destroyWeak(v266);
  objc_destroyWeak(v269);

  objc_destroyWeak(v284);
  objc_destroyWeak(v285);

  objc_destroyWeak(v288);
  objc_destroyWeak(v289);

  objc_destroyWeak(&v293);
  objc_destroyWeak(&v295);

  objc_destroyWeak(&v297);
  objc_destroyWeak(&v299);

  objc_destroyWeak(&location);
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 1, v3, 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 2, v3, 0);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setStreamStateTimeout:forTime:", 1, 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 8, v3, 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 9, v3, 0);

}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_5(uint64_t a1)
{
  return +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "activeConnection") ^ 1;

  return v2;
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "scheduleDeviceBusyNotification:", 1);

  return +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "activeConnection") ^ 1;

  return v2;
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_9(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "scheduleDeviceBusyNotification:", 1);

  return +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_10(uint64_t a1)
{
  return +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_12(uint64_t a1)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_14(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "scheduleDeviceBusyNotification:", 0);

  return +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_16(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "scheduleDeviceBusyNotification:", 0);

  return +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_18(uint64_t a1)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_19(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "scheduleDeviceBusyNotification:", 0);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "unconditionalTransitionForState:andDeferringEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_20(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachineClearDeferredEvents");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "stateMachineNotifyComplete:", 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_21(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "scheduleDeviceBusyNotification:", 0);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "unconditionalTransitionForState:andDeferringEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_22(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), v8);
  objc_msgSend(v8, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventCaptureSessionStarted")))
  {

LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "scheduleDeviceBusyNotification:", 1);

    goto LABEL_5;
  }
  objc_msgSend(v8, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUse"));

  if (v5)
    goto LABEL_4;
LABEL_5:
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "stateMachineNotifyComplete:", 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_23(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), v8);
  objc_msgSend(v8, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventCaptureSessionStarted")))
  {

LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "scheduleDeviceBusyNotification:", 0);

    goto LABEL_5;
  }
  objc_msgSend(v8, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUse"));

  if (v5)
    goto LABEL_4;
LABEL_5:
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "stateMachineNotifyComplete:", 0);

}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_24(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(*(id *)(a1 + 32), "pendingEvents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v1, "count") > 1;

  return v2;
}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(WeakRetained, "postActionGuardOfType:forEventName:option:", 1, v7, 0);
  return v8;
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_26(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 3, v3, 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_27(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 3, v3, 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_28(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 4, v3, 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_29(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 5, v3, 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", v3, v4);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 7, v4, 64);

}

uint64_t __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_31(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;

  v7 = a4;
  if (+[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, v7))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(WeakRetained, "postActionGuardOfType:forEventName:option:", 1, v9, 64);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", v3, v4);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 6, v4, 2);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_33(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 6, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_34(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 6, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_35(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 6, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_36(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 6, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_37(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 6, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_38(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateEntryTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateEntryTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 6, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_39(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 7, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_41(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 7, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_42(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_43(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 7, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_45(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 7, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_46(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_47(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 7, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_49(uint64_t a1, void *a2)
{
  id *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  v2 = (id *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", v3, v4);
  v2 += 5;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 7, v4, 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachineNotifyComplete:", 0);

}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[CMContinuityCaptureDeviceBase defaultStateExitGuard:dstState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitGuard:dstState:onEvent:", a2, a3, a4);
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_51(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  +[CMContinuityCaptureDeviceBase defaultStateExitTransitionActionForState:onEvent:](CMContinuityCaptureDeviceBase, "defaultStateExitTransitionActionForState:onEvent:", *(_QWORD *)(a1 + 32), v5);
  if (*(id *)(a1 + 40) == v5 || *(id *)(a1 + 48) == v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 7);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v4, "stateMachineNotifyComplete:", 0);

}

BOOL __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_52(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(*(id *)(a1 + 32), "pendingEvents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v1, "count") > 1;

  return v2;
}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_53(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 10, v3, 0);

}

void __50__CMContinuityCaptureDeviceBase_setupStateMachine__block_invoke_54(id *a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (a1[4] == v11)
  {
    if (a1[5] == v5)
    {
      WeakRetained = objc_loadWeakRetained(a1 + 7);
      v7 = WeakRetained;
      v8 = 6;
      v9 = v5;
      v10 = 2;
      goto LABEL_6;
    }
    if (a1[6] == v5)
    {
      WeakRetained = objc_loadWeakRetained(a1 + 7);
      v7 = WeakRetained;
      v8 = 7;
      v9 = v5;
      v10 = 64;
LABEL_6:
      objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", v8, v9, v10);

    }
  }

}

- (id)_aggregateStreamEventsInStreamState:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v6)
  {

    v8 = 0;
    goto LABEL_27;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v37;
  v11 = CFSTR("kCMContinuityCaptureEventData");
  v33 = v5;
  v32 = *(_QWORD *)v37;
  do
  {
    v12 = 0;
    v34 = v7;
    do
    {
      if (*(_QWORD *)v37 != v10)
        objc_enumerationMutation(v5);
      v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v35, "addObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12));
LABEL_8:
        v9 = 1;
        goto LABEL_18;
      }
      v14 = v11;
      objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v12), "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStartStream"));

      if (v16)
      {
        v11 = v14;
        if (v8)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
          -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](self, "postActionCompletionForEventName:eventData:error:", v17, v18, v19);

          v11 = v14;
        }

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
        -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](self, "postActionCompletionForEventName:eventData:error:", v20, v21, v22);

        v8 = 0;
        v9 = 0;
      }
      else
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStopStream"));

        v11 = v14;
        if (!v24)
        {
          v5 = v33;
          v7 = v34;
          v10 = v32;
          if (v8)
            objc_msgSend(v35, "addObject:", v8);

          objc_msgSend(v35, "addObject:", v13);
          v8 = 0;
          goto LABEL_8;
        }
        if (v8)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
          -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](self, "postActionCompletionForEventName:eventData:error:", v25, v26, v27);

          v11 = v14;
        }
        v28 = v13;

        v9 = 0;
        v8 = v28;
      }
      v5 = v33;
      v7 = v34;
      v10 = v32;
LABEL_18:
      ++v12;
    }
    while (v7 != v12);
    v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    v7 = v29;
  }
  while (v29);

  if (!v8)
  {
LABEL_27:
    v30 = v35;
    goto LABEL_28;
  }
  v30 = v35;
  objc_msgSend(v35, "addObject:", v8);
LABEL_28:

  return v30;
}

- (id)_aggregateStreamEventsInInitState:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  CMContinuityCaptureDeviceBase *v37;
  id v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v7)
  {

    v9 = 0;
    goto LABEL_32;
  }
  v8 = v7;
  v37 = self;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v42;
  v38 = v6;
  v39 = v5;
  v36 = *(_QWORD *)v42;
  do
  {
    v12 = 0;
    v40 = v8;
    do
    {
      if (*(_QWORD *)v42 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
      if ((v10 & 1) != 0)
      {
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v12));
        v10 = 1;
        goto LABEL_23;
      }
      objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v12), "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStartStream"));

      if (v15)
      {
        if (v9)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventData"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
          -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](v37, "postActionCompletionForEventName:eventData:error:", v16, v17, v18);

        }
        v19 = v13;

        v10 = 0;
        v9 = v19;
      }
      else
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStopStream"));

        if (v21)
        {
          if (v9)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventData"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
            -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](v37, "postActionCompletionForEventName:eventData:error:", v22, v23, v24);

          }
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventData"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
          -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](v37, "postActionCompletionForEventName:eventData:error:", v25, v26, v27);

          v9 = 0;
          v10 = 0;
          v5 = v39;
          v6 = v38;
          v11 = v36;
          goto LABEL_22;
        }
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "isEqualToString:", CFSTR("kCMContinuityCaptureEventForceRestartStream")))
        {

        }
        else
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamInterrupted"));

          if (!v30)
          {
            v5 = v39;
            if (v9)
              objc_msgSend(v39, "addObject:", v9);

            objc_msgSend(v39, "addObject:", v13);
            v9 = 0;
            v10 = 1;
            goto LABEL_21;
          }
        }
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventData"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
        -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](v37, "postActionCompletionForEventName:eventData:error:", v31, v32, v33);

        v10 = 0;
      }
      v5 = v39;
LABEL_21:
      v6 = v38;
LABEL_22:
      v8 = v40;
LABEL_23:
      ++v12;
    }
    while (v8 != v12);
    v34 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    v8 = v34;
  }
  while (v34);

  if (v9)
    objc_msgSend(v5, "addObject:", v9);
LABEL_32:

  return v5;
}

- (id)_aggregateEventPairInAnyState:(id)a3 entryEventName:(id)a4 exitEventName:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  CMContinuityCaptureDeviceBase *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v29 = a4;
  v28 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v11)
  {

    v13 = 0;
    goto LABEL_22;
  }
  v12 = v11;
  v13 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v31 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if ((v14 & 1) != 0)
      {
        objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        v14 = 1;
        continue;
      }
      v18 = v10;
      objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", v29))
      {

LABEL_11:
        if (v13)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventData"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
          -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](v27, "postActionCompletionForEventName:eventData:error:", v22, v23, v24);

        }
        v25 = v17;

        v14 = 0;
        v13 = v25;
        v10 = v18;
        continue;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v28);

      if (v21)
        goto LABEL_11;
      v10 = v18;
      if (v13)
        objc_msgSend(v9, "addObject:", v13);

      objc_msgSend(v9, "addObject:", v17);
      v13 = 0;
      v14 = 1;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  }
  while (v12);

  if (v13)
    objc_msgSend(v9, "addObject:", v13);
LABEL_22:

  return v9;
}

- (id)_aggregateEventDuplicatesInAnyState:(id)a3 eventName:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  CMContinuityCaptureDeviceBase *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v9)
  {

    v11 = 0;
    goto LABEL_21;
  }
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      if ((v12 & 1) != 0)
      {
        objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
LABEL_15:
        v12 = 1;
        continue;
      }
      objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v24);

      if (!v17)
      {
        if (v11)
          objc_msgSend(v7, "addObject:", v11);

        objc_msgSend(v7, "addObject:", v15);
        v11 = 0;
        goto LABEL_15;
      }
      if (v11)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventName"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCMContinuityCaptureEventData"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
        -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](v23, "postActionCompletionForEventName:eventData:error:", v18, v19, v20);

      }
      v21 = v15;

      v12 = 0;
      v11 = v21;
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v10);

  if (v11)
    objc_msgSend(v7, "addObject:", v11);
LABEL_21:

  return v7;
}

- (id)aggregateEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v4, "count"))
  {
    -[CMContinuityCaptureStateMachine currentState](self->_stateMachine, "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("kCMContinuityCaptureStateInit"));

    if (v7)
    {
      -[CMContinuityCaptureDeviceBase _aggregateStreamEventsInInitState:](self, "_aggregateStreamEventsInInitState:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CMContinuityCaptureStateMachine currentState](self->_stateMachine, "currentState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("kCMContinuityCaptureStateStreaming"));

      if (v12)
      {
        -[CMContinuityCaptureDeviceBase _aggregateStreamEventsInStreamState:](self, "_aggregateStreamEventsInStreamState:", v4);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v4);
      }
    }
    v13 = (void *)v8;
    -[CMContinuityCaptureDeviceBase _aggregateEventPairInAnyState:entryEventName:exitEventName:](self, "_aggregateEventPairInAnyState:entryEventName:exitEventName:", v8, CFSTR("kCMContinuityCaptureEventUserPause"), CFSTR("kCMContinuityCaptureEventUserResume"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMContinuityCaptureDeviceBase _aggregateEventPairInAnyState:entryEventName:exitEventName:](self, "_aggregateEventPairInAnyState:entryEventName:exitEventName:", v14, CFSTR("kCMContinuityCaptureEventActiveCallStart"), CFSTR("kCMContinuityCaptureEventActiveCallEnd"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMContinuityCaptureDeviceBase _aggregateEventDuplicatesInAnyState:eventName:](self, "_aggregateEventDuplicatesInAnyState:eventName:", v15, CFSTR("kCMContinuityCaptureEventStreamInterrupted"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMContinuityCaptureDeviceBase _aggregateEventDuplicatesInAnyState:eventName:](self, "_aggregateEventDuplicatesInAnyState:eventName:", v16, CFSTR("kCMContinuityCaptureEventForceRestartStream"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (void)postDeferredEvent:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  int v10;
  CMContinuityCaptureDeviceBase *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDelegate);
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543874;
      v11 = self;
      v12 = 2080;
      v13 = "-[CMContinuityCaptureDeviceBase postDeferredEvent:data:]";
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s name:%{pubic}@", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(WeakRetained, "postEvent:entity:data:", v6, -[CMContinuityCaptureDeviceBase entity](self, "entity"), v7);
  }

}

- (NSUUID)deviceID
{
  return 0;
}

- (int64_t)entity
{
  return -[CMContinuityCaptureDeviceCapabilities entityType](self->_capabilities, "entityType");
}

- (CMContinuityCaptureDeviceCapabilities)capabilities
{
  return self->_capabilities;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)controls
{
  return 0;
}

- (BOOL)streaming
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_streaming);
  return v2 & 1;
}

- (id)debugInfo
{
  return 0;
}

- (CMContinuityCaptureCompositeDeviceDelegate)compositeDelegate
{
  return (CMContinuityCaptureCompositeDeviceDelegate *)objc_loadWeakRetained((id *)&self->_compositeDelegate);
}

- (AVCMediaStreamNegotiator)avcStreamNegotiator
{
  return self->_avcStreamNegotiator;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ entity:%u [%p]"), v5, v7, self->_entity, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidFrameTimeoutBlock, 0);
  objc_storeStrong(&self->_invalidFrameBlock, 0);
  objc_destroyWeak((id *)&self->_deviceStatusObserverDevice);
  objc_storeStrong((id *)&self->_transportStream, 0);
  objc_storeStrong((id *)&self->_transportDevice, 0);
  objc_storeStrong((id *)&self->_pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_avcStreamNegotiator, 0);
  objc_storeStrong((id *)&self->_lastStreamFirstFrameDispatchTime, 0);
  objc_storeStrong((id *)&self->_lastStreamStartTime, 0);
  objc_storeStrong(&self->_streamTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_streamActionStateMachine, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_streamSessionLogs, 0);
  objc_destroyWeak((id *)&self->_compositeDelegate);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
