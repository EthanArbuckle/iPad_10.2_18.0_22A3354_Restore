@implementation CNVirtualScheduler

+ (id)providerWithScheduler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  CNSchedulerProvider *v6;
  CNSchedulerProvider *v7;
  uint64_t aBlock;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;

  v3 = a3;
  aBlock = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __44__CNVirtualScheduler_providerWithScheduler___block_invoke;
  v12 = &unk_1E29B96B0;
  v13 = v3;
  v4 = v3;
  v5 = _Block_copy(&aBlock);
  v6 = [CNSchedulerProvider alloc];
  v7 = -[CNSchedulerProvider initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:](v6, "initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v4, v4, v4, v4, v5, &__block_literal_global_11, &__block_literal_global_2, aBlock, v10, v11, v12);

  return v7;
}

id __44__CNVirtualScheduler_providerWithScheduler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

CNScheduler *__44__CNVirtualScheduler_providerWithScheduler___block_invoke_2()
{
  return +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
}

CNVirtualReaderWriterScheduler *__44__CNVirtualScheduler_providerWithScheduler___block_invoke_3()
{
  CNVirtualReaderWriterScheduler *v0;
  void *v1;
  CNVirtualReaderWriterScheduler *v2;

  v0 = [CNVirtualReaderWriterScheduler alloc];
  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[CNVirtualReaderWriterScheduler initWithScheduler:](v0, "initWithScheduler:", v1);

  return v2;
}

- (CNVirtualScheduler)init
{
  CNVirtualScheduler *v2;
  uint64_t v3;
  CNQueue *queue;
  CNVirtualScheduler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNVirtualScheduler;
  v2 = -[CNVirtualScheduler init](&v7, sel_init);
  if (v2)
  {
    +[CNQueue priorityQueueWithComparator:](CNQueue, "priorityQueueWithComparator:", CNVirtualSchedulerJobTimeComparator);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (CNQueue *)v3;

    v2->_isStarted = 0;
    v5 = v2;
  }

  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;

  if (-[CNQueue count](self->_queue, "count"))
  {
    -[CNQueue allObjects](self->_queue, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_cn_map:", &__block_literal_global_8_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cn_map:", &__block_literal_global_13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = objc_msgSend(v6, "count");
    if (objc_msgSend(v6, "count") == 1)
      v9 = CFSTR("job");
    else
      v9 = CFSTR("jobs");
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%lu %@ scheduled for t=%@"), v8, v9, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("no jobs scheduled");
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p clock=%lu, %@>"), v14, self, self->_clock, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

uint64_t __33__CNVirtualScheduler_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "time"));
}

uint64_t __33__CNVirtualScheduler_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

- (void)performBlock:(id)a3
{
  -[CNVirtualScheduler performBlock:qualityOfService:](self, "performBlock:qualityOfService:", a3, 0);
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = -[CNVirtualScheduler _scheduleBlock:atTime:](self, "_scheduleBlock:atTime:", v6, -[CNVirtualScheduler _nextSchedulableTick](self, "_nextSchedulableTick"));
  if (self->_isStarted && !self->_isPerforming)
    -[CNVirtualScheduler _performJobs](self, "_performJobs");

}

- (id)performCancelableBlock:(id)a3
{
  return -[CNVirtualScheduler performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5;
  CNCancelationToken *v6;
  uint64_t v7;
  CNCancelationToken *v8;
  id v9;
  void *v10;
  void *v11;
  CNCancelationToken *v12;
  _QWORD v14[5];
  id v15;
  id location;
  _QWORD v17[4];
  CNCancelationToken *v18;
  id v19;

  v5 = a3;
  v6 = objc_alloc_init(CNCancelationToken);
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__CNVirtualScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v17[3] = &unk_1E29B9380;
  v8 = v6;
  v18 = v8;
  v9 = v5;
  v19 = v9;
  v10 = (void *)objc_msgSend(v17, "copy");
  -[CNVirtualScheduler _scheduleBlock:atTime:](self, "_scheduleBlock:atTime:", v10, -[CNVirtualScheduler _nextSchedulableTick](self, "_nextSchedulableTick"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v11);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __62__CNVirtualScheduler_performCancelableBlock_qualityOfService___block_invoke_2;
  v14[3] = &unk_1E29B9758;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  -[CNCancelationToken addCancelationBlock:](v8, "addCancelationBlock:", v14);
  if (self->_isStarted && !self->_isPerforming)
    -[CNVirtualScheduler _performJobs](self, "_performJobs");
  v12 = v8;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

uint64_t __62__CNVirtualScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __62__CNVirtualScheduler_performCancelableBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueObject:", WeakRetained);

}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return -[CNVirtualScheduler afterDelay:performBlock:qualityOfService:](self, "afterDelay:performBlock:qualityOfService:", a4, 0, a3);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id location;

  v7 = a4;
  -[CNVirtualScheduler _scheduleBlock:atTime:](self, "_scheduleBlock:atTime:", v7, objc_msgSend((id)objc_opt_class(), "timeWithDelay:fromClock:", self->_clock, a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__CNVirtualScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E29B9758;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

void __63__CNVirtualScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueObject:", WeakRetained);

}

- (double)timestamp
{
  return (double)-[CNVirtualScheduler clock](self, "clock") / 10000.0;
}

+ (unint64_t)timeWithDelay:(double)a3 fromClock:(unint64_t)a4
{
  unint64_t v4;

  v4 = vcvtad_u64_f64(a3 * 10000.0) + a4;
  if ((double)(~a4 / 0x2710) <= a3)
    return -1;
  else
    return v4;
}

- (id)_scheduleBlock:(id)a3 atTime:(unint64_t)a4
{
  void *v5;

  +[CNVirtualSchedulerJob jobWithTime:block:](CNVirtualSchedulerJob, "jobWithTime:block:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQueue enqueue:](self->_queue, "enqueue:", v5);
  return v5;
}

- (unint64_t)_nextSchedulableTick
{
  unint64_t v2;

  v2 = self->_nextSchedulableTick + 1;
  self->_nextSchedulableTick = v2;
  return v2;
}

- (void)start
{
  self->_isStarted = 1;
  -[CNVirtualScheduler _performJobs](self, "_performJobs");
}

- (void)advanceBy:(unint64_t)a3
{
  -[CNVirtualScheduler advanceTo:](self, "advanceTo:", self->_clock + a3);
}

- (void)advanceTo:(unint64_t)a3
{
  self->_stopTime = a3;
  if (-[CNVirtualScheduler _performJobs](self, "_performJobs"))
  {
    self->_clock = a3;
    self->_nextSchedulableTick = a3;
  }
}

- (BOOL)_performJobs
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void (**v6)(void);
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD v11[5];

  -[CNQueue peek](self->_queue, "peek");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      if (!self->_isStarted && objc_msgSend(v4, "time") > self->_stopTime)
        break;
      v5 = objc_msgSend(v4, "time");
      self->_clock = v5;
      self->_nextSchedulableTick = v5;
      self->_isPerforming = 1;
      objc_msgSend(v4, "block");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

      self->_isPerforming = 0;
      -[CNQueue dequeueObject:](self->_queue, "dequeueObject:", v4);
      -[CNQueue peek](self->_queue, "peek");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);

  }
  -[CNQueue allObjects](self->_queue, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__CNVirtualScheduler__performJobs__block_invoke;
  v11[3] = &unk_1E29B9780;
  v11[4] = self;
  v9 = objc_msgSend(v8, "_cn_any:", v11) ^ 1;

  return v9;
}

BOOL __34__CNVirtualScheduler__performJobs__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;

  v3 = objc_msgSend(a2, "time");
  return v3 <= objc_msgSend(*(id *)(a1 + 32), "stopTime");
}

- (void)stop
{
  self->_isStarted = 0;
}

- (BOOL)hasJobsScheduled
{
  return -[CNQueue count](self->_queue, "count") != 0;
}

- (unint64_t)clock
{
  return self->_clock;
}

- (unint64_t)nextSchedulableTick
{
  return self->_nextSchedulableTick;
}

- (unint64_t)stopTime
{
  return self->_stopTime;
}

- (CNQueue)queue
{
  return self->_queue;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (BOOL)isPerforming
{
  return self->_isPerforming;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
