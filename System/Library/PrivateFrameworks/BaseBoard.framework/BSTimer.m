@implementation BSTimer

+ (id)scheduledTimerWithFireInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFireInterval:queue:handler:", v8, v9, a3);
  objc_msgSend(v10, "schedule");

  return v10;
}

- (BSTimer)initWithFireInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  return -[BSTimer initWithFireInterval:repeatInterval:leewayInterval:queue:handler:](self, "initWithFireInterval:repeatInterval:leewayInterval:queue:handler:", a4, a5, a3, -1.0, 0.0);
}

- (BSTimer)initWithFireInterval:(double)a3 repeatInterval:(double)a4 leewayInterval:(double)a5 queue:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  BSTimer *v15;
  void *v16;
  dispatch_queue_t Serial;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v19;
  unsigned int v20;
  OS_dispatch_queue *callOutQueue;
  uint64_t v22;
  id handler;
  double v24;
  BOOL v25;
  double v26;
  void *v29;
  void *v30;

  v13 = a6;
  v14 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSTimer.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  if (a3 < 0.0 || a3 > 9223372040.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSTimer.m"), 49, CFSTR("requested a timer with an unsupported duration (%f)"), *(_QWORD *)&a3);

  }
  v15 = -[BSTimer init](self, "init");
  if (v15)
  {
    +[BSDescriptionBuilder descriptionForObject:](BSDescriptionBuilder, "descriptionForObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    Serial = BSDispatchQueueCreateSerial(v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)Serial;

    if (v13)
    {
      v19 = (OS_dispatch_queue *)v13;
    }
    else
    {
      v20 = BSPthreadCurrentEffectiveQualityOfService();
      dispatch_get_global_queue(v20, 0);
      v19 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    callOutQueue = v15->_callOutQueue;
    v15->_callOutQueue = v19;

    v22 = objc_msgSend(v14, "copy");
    handler = v15->_handler;
    v15->_handler = (id)v22;

    v24 = 0.0;
    v25 = fabs(a4) < 2.22044605e-16 || a4 < 0.0;
    v26 = -1.0;
    if (!v25)
      v26 = a4;
    v15->_fireInterval = a3;
    v15->_repeatInterval = v26;
    if (fabs(a5) >= 2.22044605e-16 && a5 >= 0.0)
      v24 = a5;
    v15->_leewayInterval = v24;
    v15->_oneShot = fabs(v26 + 1.0) < 2.22044605e-16;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[BSTimer cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)BSTimer;
  -[BSTimer dealloc](&v3, sel_dealloc);
}

- (BOOL)isScheduled
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__BSTimer_isScheduled__block_invoke;
  v5[3] = &unk_1E1EBEA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__BSTimer_isScheduled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 49);
  return result;
}

- (unint64_t)fireCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__BSTimer_fireCount__block_invoke;
  v5[3] = &unk_1E1EBEA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __20__BSTimer_fireCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)schedule
{
  NSObject *queue;
  _QWORD v3[6];

  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __19__BSTimer_schedule__block_invoke;
  v3[3] = &unk_1E1EBEA28;
  v3[4] = self;
  v3[5] = a2;
  dispatch_sync(queue, v3);
}

void __19__BSTimer_schedule__block_invoke(uint64_t a1)
{
  uint64_t v2;
  BSDispatchSource *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[4];
  __int128 v16;

  -[BSTimer _queue_cancel](*(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v2;
  v3 = [BSDispatchSource alloc];
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v15[2] = __19__BSTimer_schedule__block_invoke_2;
  v15[3] = &unk_1E1EBF678;
  v16 = v5;
  v7 = -[BSDispatchSource initWithType:handle:mask:queue:configureSourceBlock:](v3, MEMORY[0x1E0C80DD0], 0, 0, v6, v15);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __19__BSTimer_schedule__block_invoke_17;
  v12[3] = &unk_1E1EBF4D8;
  objc_copyWeak(&v13, &location);
  if (v10)
    objc_setProperty_nonatomic_copy(v10, v11, v12, 32);
  -[BSDispatchSource resume](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_queue_cancel
{
  void *v2;
  void *v3;

  if (a1)
  {
    BSDispatchQueueAssert(*(void **)(a1 + 8));
    v2 = *(void **)(a1 + 32);
    if (v2)
    {
      *(_BYTE *)(a1 + 49) = 0;
      objc_msgSend(v2, "invalidate");
      v3 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

    }
  }
}

void __19__BSTimer_schedule__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  double v5;
  int64_t v6;
  dispatch_time_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(double *)(v4 + 64);
  v17 = v3;
  if (v5 >= 9223372040.0)
  {
    v7 = -1;
  }
  else
  {
    if (v5 <= -9223372040.0)
      v6 = 0x8000000000000000;
    else
      v6 = (uint64_t)(v5 * 1000000000.0);
    v7 = dispatch_time(0, v6);
    v3 = v17;
    v4 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v4 + 48))
  {
    v8 = -1;
  }
  else
  {
    v9 = *(double *)(v4 + 72);
    if (v9 >= 9223372040.0)
    {
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (v9 <= -9223372040.0)
    {
      v8 = 0x8000000000000000;
    }
    else
    {
      v8 = (uint64_t)(v9 * 1000000000.0);
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("repeatTime != 0"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 40));
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138544642;
          v19 = v11;
          v20 = 2114;
          v21 = v13;
          v22 = 2048;
          v23 = v14;
          v24 = 2114;
          v25 = CFSTR("BSTimer.m");
          v26 = 1024;
          v27 = 104;
          v28 = 2114;
          v29 = v10;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1F4C6CLL);
      }
    }
  }
  v15 = *(double *)(v4 + 40);
  if (v15 >= 9223372040.0)
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (v15 <= -9223372040.0)
  {
    v16 = 0x8000000000000000;
  }
  else
  {
    v16 = (uint64_t)(v15 * 1000000000.0);
  }
  dispatch_source_set_timer(v3, v7, v8, v16);

}

void __19__BSTimer_schedule__block_invoke_17(uint64_t a1)
{
  void **WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject **v5;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (NSObject **)WeakRetained;
    BSDispatchQueueAssert(WeakRetained[2]);
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__5;
    v11 = __Block_byref_object_dispose__5;
    v12 = 0;
    v3 = v5[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__BSTimer__callOutQueue_noteTimerFired__block_invoke;
    block[3] = &unk_1E1EBF500;
    block[4] = v5;
    block[5] = &v7;
    dispatch_sync(v3, block);
    v4 = v8[5];
    if (v4)
      (*(void (**)(void))(v4 + 16))();
    _Block_object_dispose(&v7, 8);

    v2 = v5;
  }

}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __17__BSTimer_cancel__block_invoke;
  block[3] = &unk_1E1EBE890;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __17__BSTimer_cancel__block_invoke(uint64_t a1)
{
  -[BSTimer _queue_cancel](*(_QWORD *)(a1 + 32));
}

void __39__BSTimer__callOutQueue_noteTimerFired__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 49))
  {
    v3 = MEMORY[0x18D769CFC](*(_QWORD *)(v2 + 24));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 48))
    -[BSTimer _queue_cancel](v2);
}

- (double)startTime
{
  return self->_startTime;
}

- (double)fireInterval
{
  return self->_fireInterval;
}

- (double)repeatInterval
{
  return self->_repeatInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
