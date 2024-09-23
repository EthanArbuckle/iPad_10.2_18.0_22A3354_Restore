@implementation CNWatchdog

- (unint64_t)statusForEvent:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;

  -[CNCache objectForKeyedSubscript:](self->_events, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_cn_timeIntervalValue");
    v6 = v5;
    +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timestamp");
    v10 = v9 - v6;

    v11 = v10 < 60.0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (CNWatchdog)defaultWatchdog
{
  return objc_alloc_init(CNWatchdog);
}

- (CNWatchdog)init
{
  CNWatchdog *v2;
  uint64_t v3;
  CNCache *events;
  CNWatchdog *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNWatchdog;
  v2 = -[CNWatchdog init](&v7, sel_init);
  if (v2)
  {
    +[CNCache atomicCache](CNCache, "atomicCache");
    v3 = objc_claimAutoreleasedReturnValue();
    events = v2->_events;
    v2->_events = (CNCache *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)recordExceptionForEvent:(id)a3
{
  -[CNWatchdog setStatus:forEvent:](self, "setStatus:forEvent:", 1, a3);
}

- (void)setStatus:(unint64_t)a3 forEvent:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CNCache *events;
  id v10;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a4;
    +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    objc_msgSend(v5, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCache setObject:forKeyedSubscript:](self->_events, "setObject:forKeyedSubscript:", v8, v6);

  }
  else
  {
    events = self->_events;
    v10 = a4;
    -[CNCache setObject:forKeyedSubscript:](events, "setObject:forKeyedSubscript:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
}

@end
