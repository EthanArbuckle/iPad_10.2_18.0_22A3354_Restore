@implementation AXAccessQueueTimer

+ (id)timerTargettingMainAccessQueue
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[AXAccessQueue mainAccessQueue](AXAccessQueue, "mainAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithTargetAccessQueue:", v3);

  return v4;
}

- (AXAccessQueueTimer)init
{
  return -[AXAccessQueueTimer initWithTargetAccessQueue:](self, "initWithTargetAccessQueue:", 0);
}

- (AXAccessQueueTimer)initWithTargetAccessQueue:(id)a3
{
  id v4;
  AXAccessQueueTimer *v5;
  AXAccessQueueTimer *v6;
  AXAccessQueue *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXAccessQueueTimer;
  v5 = -[AXAccessQueueTimer init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXAccessQueueTimer setState:](v5, "setState:", 0);
    if (v4)
    {
      -[AXAccessQueueTimer setAccessQueue:](v6, "setAccessQueue:", v4);
      -[AXAccessQueueTimer setAccessQueueIsExternal:](v6, "setAccessQueueIsExternal:", 1);
    }
    else
    {
      v7 = -[AXAccessQueue initWithParentClass:description:appendUUIDToLabel:]([AXAccessQueue alloc], "initWithParentClass:description:appendUUIDToLabel:", objc_opt_class(), CFSTR("TimerAccessQueue"), 1);
      if (v7)
      {
        -[AXAccessQueueTimer setAccessQueue:](v6, "setAccessQueue:", v7);
      }
      else
      {

        v6 = 0;
      }

    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  -[AXAccessQueueTimer accessQueue](self, "accessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AXAccessQueueTimer_dealloc__block_invoke;
  v5[3] = &unk_1E28C1C88;
  v5[4] = self;
  objc_msgSend(v3, "performSynchronousWritingBlock:", v5);

  v4.receiver = self;
  v4.super_class = (Class)AXAccessQueueTimer;
  -[AXAccessQueueTimer dealloc](&v4, sel_dealloc);
}

uint64_t __29__AXAccessQueueTimer_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyCancel");
}

- (BOOL)isPending
{
  return -[AXAccessQueueTimer state](self, "state") == 1;
}

- (void)_performEnqueuedWritingBlock:(id)a3 asynchronousExecutionWarningHandler:(SEL)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[AXAccessQueueTimer accessQueue](self, "accessQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "canOnlyReadInCurrentExecutionThread"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      ((void (*)(AXAccessQueueTimer *, SEL))-[AXAccessQueueTimer methodForSelector:](self, "methodForSelector:", a4))(self, a4);
    objc_msgSend(v6, "performAsynchronousWritingBlock:", v7);
  }
  else
  {
    objc_msgSend(v6, "performSynchronousWritingBlock:", v7);
  }

}

- (void)afterDelay:(double)a3 processReadingBlock:(id)a4
{
  -[AXAccessQueueTimer _afterDelay:processBlock:shouldTreatAsWritingBlock:](self, "_afterDelay:processBlock:shouldTreatAsWritingBlock:", a4, 0, a3);
}

- (void)afterDelay:(double)a3 processWritingBlock:(id)a4
{
  -[AXAccessQueueTimer _afterDelay:processBlock:shouldTreatAsWritingBlock:](self, "_afterDelay:processBlock:shouldTreatAsWritingBlock:", a4, 1, a3);
}

- (void)_afterDelay:(double)a3 processBlock:(id)a4 shouldTreatAsWritingBlock:(BOOL)a5
{
  id v8;
  _QWORD v9[7];
  BOOL v10;
  _QWORD v11[5];
  AXAccessQueueTimer *v12;
  _QWORD v13[5];
  id v14;

  v8 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  v14 = (id)objc_msgSend(v8, "copy");
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__4;
  v11[4] = __Block_byref_object_dispose__5;
  v12 = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke;
  v9[3] = &unk_1E28C1E00;
  *(double *)&v9[6] = a3;
  v10 = a5;
  v9[4] = v11;
  v9[5] = v13;
  -[AXAccessQueueTimer _performEnqueuedWritingBlock:asynchronousExecutionWarningHandler:](v12, "_performEnqueuedWritingBlock:asynchronousExecutionWarningHandler:", v9, sel__warnAboutAsynchronousScheduling);
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(v13, 8);
}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD handler[4];
  __int128 v12;
  char v13;

  v2 = a1 + 32;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "automaticallyCancelPendingBlockUponSchedulingNewBlock")&& objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "state"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "_reallyCancel");
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "state"))
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_cold_1(v2, a1, v3);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "setState:", 1);
    v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
    if (v3)
    {
      v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
      dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      v5 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2;
      handler[3] = &unk_1E28C1DD8;
      v13 = *(_BYTE *)(a1 + 56);
      v12 = *(_OWORD *)(a1 + 32);
      dispatch_source_set_event_handler(v3, handler);
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_4;
      v10[3] = &unk_1E28C1CB0;
      v10[4] = *(_QWORD *)(a1 + 32);
      dispatch_source_set_cancel_handler(v3, v10);
      dispatch_resume(v3);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDispatchTimer:", v3);
    }
    else
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = 0;

      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

    }
  }

}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  char v15;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "accessQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_6;
  v12[3] = &unk_1E28C1DB0;
  v15 = *(_BYTE *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 32);
  v13 = v2;
  v11 = v2;
  objc_msgSend(v11, "performSynchronousWritingBlock:", v12);

}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_6(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "state") == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_reallyCancel");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setState:", 2);
    v2 = *(unsigned __int8 *)(a1 + 56);
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isActive");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setActive:", 1);
    if (v2)
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setActive:", v3);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_didFinishProcessingBlock");
    }
    else
    {
      v4 = *(void **)(a1 + 32);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_7;
      v7[3] = &unk_1E28C1D88;
      v9 = *(_QWORD *)(a1 + 48);
      v5 = v4;
      v6 = *(_QWORD *)(a1 + 40);
      v8 = v5;
      v10 = v6;
      v11 = v3;
      objc_msgSend(v5, "performAsynchronousReadingBlock:", v7);

    }
  }
}

uint64_t __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_7(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  char v5;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_3;
  v4[3] = &unk_1E28C1D60;
  v4[4] = *(_QWORD *)(a1 + 48);
  v5 = *(_BYTE *)(a1 + 56);
  return objc_msgSend(v2, "performAsynchronousWritingBlock:", v4);
}

uint64_t __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setActive:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_didFinishProcessingBlock");
}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_4(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "accessQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)_didFinishProcessingBlock
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "accessQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_18EBEC000, v2, v3, "Can't wrap up processing of %@ unless running within a writing block of %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_warnAboutAsynchronousScheduling
{
  void *v1;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  objc_msgSend(a1, "accessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18EBEC000, v5, v6, "Can't schedule timer %@ synchronously; scheduling it asynchronously instead. To avoid this, break on -[%@ %s], find "
    "the call site initiating a reading block onto %@, and change that to a writing block.",
    v7,
    v8,
    v9,
    v10,
    v11);

  OUTLINED_FUNCTION_3();
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __28__AXAccessQueueTimer_cancel__block_invoke;
  v2[3] = &unk_1E28C1C88;
  v2[4] = self;
  -[AXAccessQueueTimer _performEnqueuedWritingBlock:asynchronousExecutionWarningHandler:](self, "_performEnqueuedWritingBlock:asynchronousExecutionWarningHandler:", v2, sel__warnAboutAsynchronousCancelling);
}

uint64_t __28__AXAccessQueueTimer_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyCancel");
}

- (void)_reallyCancel
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "accessQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_18EBEC000, v2, v3, "Can't actually cancel %@ unless running within a writing block of %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_warnAboutAsynchronousCancelling
{
  void *v1;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  objc_msgSend(a1, "accessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18EBEC000, v5, v6, "Can't cancel timer %@ synchronously; cancelling it asynchronously instead. To avoid this, break on -[%@ %s], find th"
    "e call site initiating a reading block onto %@, and change that to a writing block.",
    v7,
    v8,
    v9,
    v10,
    v11);

  OUTLINED_FUNCTION_3();
}

- (NSString)description
{
  unsigned int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  _BOOL4 v13;
  const __CFString *v14;
  void *v15;

  v3 = -[AXAccessQueueTimer state](self, "state");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = off_1E28C1E20[v3];
  -[AXAccessQueueTimer label](self, "label");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v9 = CFSTR("; label = \");
  else
    v9 = &stru_1E28C88D8;
  if (v5)
    v10 = v5;
  else
    v10 = &stru_1E28C88D8;
  if (v5)
    v11 = CFSTR("\");
  else
    v11 = &stru_1E28C88D8;
  if (-[AXAccessQueueTimer isActive](self, "isActive"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = -[AXAccessQueueTimer automaticallyCancelPendingBlockUponSchedulingNewBlock](self, "automaticallyCancelPendingBlockUponSchedulingNewBlock");
  v14 = CFSTR("; automaticallyCancelPendingBlockUponSchedulingNewBlock = YES");
  if (!v13)
    v14 = &stru_1E28C88D8;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p%@%@%@; state = %@; active = %@%@>"),
    v8,
    self,
    v9,
    v10,
    v11,
    v4,
    v12,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock
{
  return self->_automaticallyCancelPendingBlockUponSchedulingNewBlock;
}

- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3
{
  self->_automaticallyCancelPendingBlockUponSchedulingNewBlock = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (AXAccessQueue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (BOOL)accessQueueIsExternal
{
  return self->_accessQueueIsExternal;
}

- (void)setAccessQueueIsExternal:(BOOL)a3
{
  self->_accessQueueIsExternal = a3;
}

- (OS_dispatch_source)dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)setDispatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  int v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v6 = *(_QWORD *)(a2 + 48);
  v7 = &stru_1E28C88D8;
  if (objc_msgSend(v5, "accessQueueIsExternal"))
    v8 = CFSTR(" on access queue: ");
  else
    v8 = &stru_1E28C88D8;
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "accessQueueIsExternal");
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "accessQueue");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = 138413058;
  v11 = v5;
  v12 = 2048;
  v13 = v6;
  v14 = 2112;
  v15 = v8;
  v16 = 2112;
  v17 = v7;
  _os_log_fault_impl(&dword_18EBEC000, a3, OS_LOG_TYPE_FAULT, "%@: Attempted to schedule new block for execution %.2f seconds from now%@%@ onto a timer that already has a pending block; ignoring new block. Please consider whether you should call -cancel before scheduling this block.",
    (uint8_t *)&v10,
    0x2Au);
  if (v9)

}

void __73__AXAccessQueueTimer__afterDelay_processBlock_shouldTreatAsWritingBlock___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_18EBEC000, a1, a3, "Timer unexpectedly deallocated early or what??", a5, a6, a7, a8, 0);
}

@end
