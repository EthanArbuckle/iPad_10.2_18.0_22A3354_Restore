@implementation MTMetrics

- (MTMetrics)init
{
  MTMetrics *v2;
  uint64_t v3;
  NAScheduler *serializer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTMetrics;
  v2 = -[MTMetrics init](&v6, sel_init);
  if (v2)
  {
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTMetrics.serialqueue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v3 = objc_claimAutoreleasedReturnValue();
    serializer = v2->_serializer;
    v2->_serializer = (NAScheduler *)v3;

  }
  return v2;
}

+ (id)_sharedPublicMetrics
{
  if (_sharedPublicMetrics_onceToken != -1)
    dispatch_once(&_sharedPublicMetrics_onceToken, &__block_literal_global_23);
  return (id)_sharedPublicMetrics__sharedPublicMetrics;
}

void __33__MTMetrics__sharedPublicMetrics__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_sharedPublicMetrics__sharedPublicMetrics;
  _sharedPublicMetrics__sharedPublicMetrics = v0;

}

- (void)logAlarmAdded:(BOOL)a3
{
  NAScheduler *serializer;
  _QWORD v4[4];
  BOOL v5;

  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__MTMetrics_logAlarmAdded___block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = a3;
  -[NAScheduler performBlock:](serializer, "performBlock:", v4);
}

uint64_t __27__MTMetrics_logAlarmAdded___block_invoke(uint64_t a1)
{
  __CFString **v1;

  v1 = kMTMetricSleepAlarmAddKey;
  if (!*(_BYTE *)(a1 + 32))
    v1 = kMTMetricAlarmAddKey;
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *v1);
}

- (void)logAlarmDeleted:(BOOL)a3
{
  NAScheduler *serializer;
  _QWORD v4[4];
  BOOL v5;

  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__MTMetrics_logAlarmDeleted___block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = a3;
  -[NAScheduler performBlock:](serializer, "performBlock:", v4);
}

uint64_t __29__MTMetrics_logAlarmDeleted___block_invoke(uint64_t a1)
{
  __CFString **v1;

  v1 = kMTMetricSleepAlarmDeleteKey;
  if (!*(_BYTE *)(a1 + 32))
    v1 = kMTMetricAlarmDeleteKey;
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *v1);
}

- (void)logAlarmUpdated:(BOOL)a3
{
  NAScheduler *serializer;
  _QWORD v4[4];
  BOOL v5;

  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__MTMetrics_logAlarmUpdated___block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = a3;
  -[NAScheduler performBlock:](serializer, "performBlock:", v4);
}

uint64_t __29__MTMetrics_logAlarmUpdated___block_invoke(uint64_t a1)
{
  __CFString **v1;

  v1 = kMTMetricSleepAlarmUpdateKey;
  if (!*(_BYTE *)(a1 + 32))
    v1 = kMTMetricAlarmUpdateKey;
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *v1);
}

- (void)logAlarmSnoozeAction:(unint64_t)a3
{
  NAScheduler *serializer;
  _QWORD v4[5];

  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__MTMetrics_logAlarmSnoozeAction___block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a3;
  -[NAScheduler performBlock:](serializer, "performBlock:", v4);
}

uint64_t __34__MTMetrics_logAlarmSnoozeAction___block_invoke(uint64_t result)
{
  unint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1 <= 2)
    return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *off_1E39CD5E0[v1]);
  return result;
}

- (void)logAlarmDismissAction:(unint64_t)a3
{
  NAScheduler *serializer;
  _QWORD v4[5];

  serializer = self->_serializer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__MTMetrics_logAlarmDismissAction___block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a3;
  -[NAScheduler performBlock:](serializer, "performBlock:", v4);
}

uint64_t __35__MTMetrics_logAlarmDismissAction___block_invoke(uint64_t result)
{
  unint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1 <= 0xB && ((0xDE7u >> v1) & 1) != 0)
    return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *off_1E39CD5F8[v1]);
  return result;
}

- (void)logTimerAdded
{
  -[NAScheduler performBlock:](self->_serializer, "performBlock:", &__block_literal_global_5);
}

uint64_t __26__MTMetrics_logTimerAdded__block_invoke()
{
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", CFSTR("com.apple.MobileTimer.Timer.add"));
}

- (void)logMultipleTimersAdded:(id)a3
{
  id v4;
  NAScheduler *serializer;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MTMetrics_logMultipleTimersAdded___block_invoke;
  v7[3] = &unk_1E39CB858;
  v8 = v4;
  v6 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v7);

}

void __36__MTMetrics_logMultipleTimersAdded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("multipleTimersCount");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTAnalytics submitEvent:eventParameters:](MTAnalytics, "submitEvent:eventParameters:", CFSTR("com.apple.MobileTimer.MultipleTimers.running"), v2);

}

- (void)logTimerDeleted
{
  -[NAScheduler performBlock:](self->_serializer, "performBlock:", &__block_literal_global_7_0);
}

uint64_t __28__MTMetrics_logTimerDeleted__block_invoke()
{
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", CFSTR("com.apple.MobileTimer.Timer.delete"));
}

- (void)logTimerUpdated
{
  -[NAScheduler performBlock:](self->_serializer, "performBlock:", &__block_literal_global_8_0);
}

uint64_t __28__MTMetrics_logTimerUpdated__block_invoke()
{
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", CFSTR("com.apple.MobileTimer.Timer.update"));
}

- (void)logTimerDismissed
{
  -[NAScheduler performBlock:](self->_serializer, "performBlock:", &__block_literal_global_9_0);
}

uint64_t __30__MTMetrics_logTimerDismissed__block_invoke()
{
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", CFSTR("com.apple.MobileTimer.Timer.dismiss"));
}

- (void)logTimerRepeated
{
  -[NAScheduler performBlock:](self->_serializer, "performBlock:", &__block_literal_global_10_0);
}

uint64_t __29__MTMetrics_logTimerRepeated__block_invoke()
{
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", CFSTR("com.apple.MobileTimer.Timer.repeat"));
}

- (void)logSyncCompleted
{
  -[NAScheduler performBlock:](self->_serializer, "performBlock:", &__block_literal_global_11);
}

uint64_t __29__MTMetrics_logSyncCompleted__block_invoke()
{
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", CFSTR("com.apple.MobileTimer.Sync.success"));
}

- (void)logSyncFailedWithError:(id)a3
{
  id v4;
  NAScheduler *serializer;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MTMetrics_logSyncFailedWithError___block_invoke;
  v7[3] = &unk_1E39CB858;
  v8 = v4;
  v6 = v4;
  -[NAScheduler performBlock:](serializer, "performBlock:", v7);

}

void __36__MTMetrics_logSyncFailedWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", CFSTR("com.apple.MobileTimer.Sync.failure"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.MobileTimer.Sync.Error"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", v4);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
}

@end
