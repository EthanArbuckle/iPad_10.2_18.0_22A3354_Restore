@implementation BRCDeadlineScheduler

- (BRCDeadlineScheduler)initWithName:(id)a3 fairScheduler:(id)a4
{
  id v7;
  id v8;
  BRCDeadlineScheduler *v9;
  BRCMinHeap *v10;
  BRCMinHeap *minHeap;
  uint64_t v12;
  OS_dispatch_workloop *workloop;
  BRCFairSource *v14;
  BRCFairSource *source;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BRCDeadlineScheduler;
  v9 = -[BRCDeadlineScheduler init](&v20, sel_init);
  if (v9)
  {
    v10 = -[BRCMinHeap initWithComparator:]([BRCMinHeap alloc], "initWithComparator:", &__block_literal_global_57);
    minHeap = v9->_minHeap;
    v9->_minHeap = v10;

    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v9->_fairScheduler, a4);
    -[BRCFairScheduler workloop](v9->_fairScheduler, "workloop");
    v12 = objc_claimAutoreleasedReturnValue();
    workloop = v9->_workloop;
    v9->_workloop = (OS_dispatch_workloop *)v12;

    objc_initWeak(&location, v9);
    v14 = -[BRCFairSource initWithName:scheduler:]([BRCFairSource alloc], "initWithName:scheduler:", CFSTR("deadline-sheduler"), v8);
    source = v9->_source;
    v9->_source = v14;

    -[BRCFairSource setWorkloop:](v9->_source, "setWorkloop:", v9->_workloop);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__BRCDeadlineScheduler_initWithName_fairScheduler___block_invoke_2;
    v17[3] = &unk_1E875DC98;
    objc_copyWeak(&v18, &location);
    -[BRCFairSource setEventHandler:](v9->_source, "setEventHandler:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

uint64_t __51__BRCDeadlineScheduler_initWithName_fairScheduler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  _BOOL8 v6;

  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a3 + 8);
  v5 = v3 < v4;
  v6 = v3 > v4;
  if (v5)
    return -1;
  else
    return v6;
}

void __51__BRCDeadlineScheduler_initWithName_fairScheduler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_schedule");

}

- (OS_dispatch_workloop)workloop
{
  return -[BRCFairScheduler workloop](self->_fairScheduler, "workloop");
}

- (BOOL)_setupTimerRequiredForDeadline:(int64_t)a3 now:(int64_t)a4
{
  int64_t v6;
  uint64_t (**computeNextAdmissibleDateForScheduling)(id, int64_t);
  char v8;
  int64_t v9;
  dispatch_time_t v10;
  NSObject *delay;
  int64_t leeway;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  OS_dispatch_source *v16;
  OS_dispatch_source *v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  OS_dispatch_source *v22;
  NSObject *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  dispatch_block_t v27;
  _QWORD v29[5];

  if (self->_leeway + self->_lastSchedule <= a3)
    v6 = a3;
  else
    v6 = self->_leeway + self->_lastSchedule;
  if (brc_is_before_deadline())
  {
    computeNextAdmissibleDateForScheduling = (uint64_t (**)(id, int64_t))self->_computeNextAdmissibleDateForScheduling;
    if (computeNextAdmissibleDateForScheduling)
      v6 = computeNextAdmissibleDateForScheduling[2](computeNextAdmissibleDateForScheduling, a4);
  }
  v8 = brc_is_before_deadline();
  if ((v8 & 1) == 0)
  {
    v9 = v6 - a4;
    v10 = dispatch_time(0, v9);
    delay = self->_delay;
    if (delay)
    {
      leeway = self->_leeway;
      if (leeway >= 0)
        v13 = self->_leeway;
      else
        v13 = leeway + 1;
      v14 = v13 >> 1;
      if ((unint64_t)(leeway + 1) >= 3)
        v15 = v14;
      else
        v15 = v9 / 10;
      dispatch_source_set_timer(delay, v10, 0xFFFFFFFFFFFFFFFFLL, v15);
    }
    else
    {
      v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_workloop);
      v17 = self->_delay;
      self->_delay = v16;

      v18 = self->_leeway;
      if (v18 >= 0)
        v19 = self->_leeway;
      else
        v19 = v18 + 1;
      v20 = v19 >> 1;
      if ((unint64_t)(v18 + 1) >= 3)
        v21 = v20;
      else
        v21 = v9 / 10;
      dispatch_source_set_timer((dispatch_source_t)self->_delay, v10, 0xFFFFFFFFFFFFFFFFLL, v21);
      v22 = self->_delay;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __59__BRCDeadlineScheduler__setupTimerRequiredForDeadline_now___block_invoke;
      v29[3] = &unk_1E875D500;
      v29[4] = self;
      v23 = v22;
      v24 = v29;
      v25 = v24;
      v26 = v24;
      if (*MEMORY[0x1E0D11070])
      {
        ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v26);
      dispatch_source_set_event_handler(v23, v27);

      dispatch_resume((dispatch_object_t)self->_delay);
    }
  }
  return v8 ^ 1;
}

uint64_t __59__BRCDeadlineScheduler__setupTimerRequiredForDeadline_now___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "signal");
}

- (void)signal
{
  -[BRCFairSource signal](self->_source, "signal");
}

- (void)runDeadlineSource:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  OS_dispatch_workloop *v8;
  OS_dispatch_workloop *workloop;
  BRCFairSource *v10;
  NSObject *v11;
  BRCFairSource *v12;
  _QWORD block[4];
  id v14;
  BRCFairSource *v15;
  void (**v16)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  objc_msgSend(v6, "workloop");
  v8 = (OS_dispatch_workloop *)objc_claimAutoreleasedReturnValue();
  workloop = self->_workloop;

  if (v8 == workloop)
  {
    objc_msgSend(v6, "runEventHandler");
    if (v7)
      v7[2](v7);
  }
  else
  {
    v10 = self->_source;
    -[BRCFairSource suspend](v10, "suspend");
    objc_msgSend(v6, "workloop");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__BRCDeadlineScheduler_runDeadlineSource_completionHandler___block_invoke;
    block[3] = &unk_1E875EB70;
    v14 = v6;
    v15 = v10;
    v16 = v7;
    v12 = v10;
    dispatch_async(v11, block);

  }
}

uint64_t __60__BRCDeadlineScheduler_runDeadlineSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "runEventHandler");
  objc_msgSend(*(id *)(a1 + 40), "resume");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_schedule
{
  uint64_t v3;
  BRCDeadlineScheduler *v4;
  void *v5;
  _QWORD *v6;
  BOOL v7;
  _QWORD *v8;
  _QWORD v9[5];
  BOOL v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  v3 = brc_current_date_nsec();
  v4 = self;
  objc_sync_enter(v4);
  v5 = 0;
  while (1)
  {
    -[BRCMinHeap firstObject](v4->_minHeap, "firstObject");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (!v6
      || -[BRCDeadlineScheduler _setupTimerRequiredForDeadline:now:](v4, "_setupTimerRequiredForDeadline:now:", v6[1], v3))
    {
      break;
    }
    -[BRCMinHeap removeFirstObject](v4->_minHeap, "removeFirstObject");
    v4->_lastSchedule = v3;
    v5 = v6;
    if (objc_msgSend(v6, "willRunEvenHandler"))
    {
      v7 = -[BRCMinHeap count](v4->_minHeap, "count") != 0;
      v8 = v6;
      goto LABEL_7;
    }
  }
  v7 = 0;
  v8 = 0;
LABEL_7:

  objc_sync_exit(v4);
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__BRCDeadlineScheduler__schedule__block_invoke;
    v9[3] = &unk_1E8760EE0;
    v10 = v7;
    v9[4] = v4;
    -[BRCDeadlineScheduler runDeadlineSource:completionHandler:](v4, "runDeadlineSource:completionHandler:", v8, v9);
  }

}

uint64_t __33__BRCDeadlineScheduler__schedule__block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 32), "signal");
  return result;
}

- (void)addSource:(id)a3 deadline:(int64_t)a4
{
  BRCDeadlineScheduler *v6;
  BRCMinHeap *minHeap;
  BOOL v8;
  BRCMinHeap *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = self;
  objc_sync_enter(v6);
  minHeap = v6->_minHeap;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BRCMinHeap removeObject:](minHeap, "removeObject:", v11);
  }
  else
  {
    v8 = -[BRCMinHeap containsObject:](minHeap, "containsObject:", v11);
    v9 = v6->_minHeap;
    if (v8)
      -[BRCMinHeap objectWeightChanged:](v9, "objectWeightChanged:", v11);
    else
      -[BRCMinHeap addObject:](v9, "addObject:", v11);
    -[BRCMinHeap firstObject](v6->_minHeap, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v11
      && !-[BRCDeadlineScheduler _setupTimerRequiredForDeadline:now:](v6, "_setupTimerRequiredForDeadline:now:", a4, brc_current_date_nsec()))
    {
      -[BRCDeadlineScheduler signal](v6, "signal");
    }
  }
  objc_sync_exit(v6);

}

- (void)suspend
{
  BRCDeadlineScheduler *obj;

  obj = self;
  objc_sync_enter(obj);
  -[BRCFairSource suspend](obj->_source, "suspend");
  obj->_isResumed = 0;
  objc_sync_exit(obj);

}

- (void)resume
{
  BRCDeadlineScheduler *obj;

  obj = self;
  objc_sync_enter(obj);
  -[BRCFairSource resume](obj->_source, "resume");
  obj->_isResumed = 1;
  objc_sync_exit(obj);

}

- (void)cancel
{
  BRCFairSource *source;
  BRCFairSource *v4;
  NSObject *delay;
  OS_dispatch_source *v6;

  self->_isCancelled = 1;
  source = self->_source;
  if (source)
  {
    -[BRCFairSource cancel](source, "cancel");
    v4 = self->_source;
    self->_source = 0;

  }
  delay = self->_delay;
  if (delay)
  {
    dispatch_source_cancel(delay);
    v6 = self->_delay;
    self->_delay = 0;

  }
}

- (void)_close
{
  NSObject *delay;
  OS_dispatch_source *v4;
  BRCFairSource *source;
  BRCDeadlineScheduler *v6;
  BRCFairSource *v7;
  BRCMinHeap *minHeap;

  delay = self->_delay;
  if (delay)
  {
    dispatch_source_cancel(delay);
    v4 = self->_delay;
    self->_delay = 0;

  }
  source = self->_source;
  if (source)
  {
    -[BRCFairSource cancel](source, "cancel");
    v6 = self;
    objc_sync_enter(v6);
    if (!v6->_isResumed)
      -[BRCFairSource resume](self->_source, "resume");
    v7 = self->_source;
    self->_source = 0;

    objc_sync_exit(v6);
  }
  minHeap = self->_minHeap;
  self->_minHeap = 0;

}

- (void)close
{
  NSObject *workloop;
  BRCFairScheduler *fairScheduler;
  _QWORD block[5];

  workloop = self->_workloop;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__BRCDeadlineScheduler_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async_and_wait(workloop, block);
  fairScheduler = self->_fairScheduler;
  self->_fairScheduler = 0;

}

uint64_t __29__BRCDeadlineScheduler_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_close");
}

- (void)dealloc
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ was deallocated without being closed%@", (uint8_t *)&v3, 0x16u);
}

- (int64_t)coalescingLeeway
{
  return self->_leeway;
}

- (void)setCoalescingLeeway:(int64_t)a3
{
  self->_leeway = a3;
}

- (id)computeNextAdmissibleDateForScheduling
{
  return self->_computeNextAdmissibleDateForScheduling;
}

- (void)setComputeNextAdmissibleDateForScheduling:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BRCFairScheduler)fairScheduler
{
  return self->_fairScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_computeNextAdmissibleDateForScheduling, 0);
  objc_storeStrong((id *)&self->_fairScheduler, 0);
  objc_storeStrong((id *)&self->_delay, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_minHeap, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
}

@end
