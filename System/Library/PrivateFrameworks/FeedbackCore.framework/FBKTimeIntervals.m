@implementation FBKTimeIntervals

+ (id)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_46);
  return (id)log_log;
}

void __23__FBKTimeIntervals_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "time");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

+ (FBKTimeIntervals)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_58);
  return (FBKTimeIntervals *)(id)sharedInstance_instance_0;
}

void __34__FBKTimeIntervals_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v0;

}

- (FBKTimeIntervals)init
{
  FBKTimeIntervals *v2;
  uint64_t v3;
  NSMutableDictionary *events;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBKTimeIntervals;
  v2 = -[FBKTimeIntervals init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    events = v2->_events;
    v2->_events = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)didStartEvent:(unint64_t)a3
{
  -[FBKTimeIntervals willStartEvent:context:](self, "willStartEvent:context:", a3, 0);
}

- (void)willStartEvent:(unint64_t)a3 context:(id)a4
{
  id v6;
  FBKTimeIntervalEvent *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[FBKTimeIntervalEvent initWithType:]([FBKTimeIntervalEvent alloc], "initWithType:", a3);
  -[FBKTimeIntervals keyForEvent:context:](self, "keyForEvent:context:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKTimeIntervals events](self, "events");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);

  objc_msgSend((id)objc_opt_class(), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[FBKTimeIntervalEvent description](v7, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "Event [%{public}@] has begun.", (uint8_t *)&v12, 0xCu);

  }
}

- (id)didEndEvent:(unint64_t)a3
{
  return -[FBKTimeIntervals didEndEvent:context:](self, "didEndEvent:context:", a3, 0);
}

- (id)didEndEvent:(unint64_t)a3 context:(id)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const char *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  int v24;
  double v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  -[FBKTimeIntervals keyForEvent:context:](self, "keyForEvent:context:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKTimeIntervals events](self, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setEndTimeInterval:", CACurrentMediaTime());
  if (v9)
  {
    objc_msgSend(v9, "endTimeInterval");
    v11 = v10;
    objc_msgSend(v9, "startTimeInterval");
    v13 = v11 - v12;
    objc_msgSend((id)objc_opt_class(), "log");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13 >= 1.0)
    {
      if (v15)
      {
        objc_msgSend(v9, "description");
        v20 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v20;
        v21 = &stru_24E15EAF8;
        v24 = 134218498;
        v25 = v13;
        if (v6)
          v21 = v6;
        v26 = 2114;
        v27 = v20;
        v28 = 2112;
        v29 = v21;
        v19 = "It took [%.2lfs] to %{public}@ %@";
        goto LABEL_11;
      }
    }
    else if (v15)
    {
      objc_msgSend(v9, "description");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = &stru_24E15EAF8;
      v24 = 134218498;
      v25 = v13 * 1000.0;
      if (v6)
        v18 = v6;
      v26 = 2114;
      v27 = v16;
      v28 = 2112;
      v29 = v18;
      v19 = "It took [%.2lfms] to %{public}@ %@";
LABEL_11:
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v24, 0x20u);

    }
    -[FBKTimeIntervals events](self, "events");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObjectForKey:", v7);

  }
  return v9;
}

- (id)keyForEvent:(unint64_t)a3 context:(id)a4
{
  if (a4)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu-%@"), a3, a4);
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableDictionary)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
}

@end
