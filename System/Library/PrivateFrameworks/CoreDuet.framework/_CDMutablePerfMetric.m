@implementation _CDMutablePerfMetric

+ (id)perfMetricForFetchRequest:(void *)a3 type:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLForKey:", CFSTR("CoreDuetQueryPerfMetricsEnabled")))
  {
    objc_msgSend(v4, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CDNormalizedStringFromQueryString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v4, "sortDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      objc_msgSend(v4, "sortDescriptors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForKey:", CFSTR("key"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" ORDER BY %@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendString:", v16);

    }
    if (objc_msgSend(v4, "fetchOffset"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" OFFSET ?"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendString:", v17);

    }
    if (objc_msgSend(v4, "fetchLimit"))
    {
      v18 = objc_msgSend(v4, "fetchLimit");
      if (v18 < 2 || v18 == 0xFFFFFFFF)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = CFSTR("N");
        v22 = CFSTR("NN");
        v23 = CFSTR("NNN");
        v24 = CFSTR("NNNN");
        if (v18 >> 5 >= 0xC35)
          v25 = CFSTR("NNNNNN+");
        else
          v25 = CFSTR("NNNNN");
        if (v18 >> 4 >= 0x271)
          v24 = v25;
        if (v18 >= 0x3E8)
          v23 = v24;
        if (v18 >= 0x64)
          v22 = v23;
        if (v18 >= 0xA)
          v21 = (__CFString *)v22;
        v19 = v21;
      }
      v26 = v19;
      v27 = v19;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" LIMIT %@"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendString:", v28);

    }
    +[_CDHashUtilities sha1ForString:](_CDHashUtilities, "sha1ForString:", v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "substringToIndex:", (unint64_t)objc_msgSend(v29, "length") >> 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDPerfMetricFamily perfMetricFamilyWithName:](_CDPerfMetricFamily, "perfMetricFamilyWithName:", v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "perfMetricWithName:string:", v30, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (_CDMutablePerfMetric)initWithName:(id)a3 string:(id)a4 family:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CDMutablePerfMetric;
  return -[_CDPerfMetric initWithName:string:family:](&v6, sel_initWithName_string_family_, a3, a4, a5);
}

- (void)endTimingWithEvent:(_CDPerfEvent *)a3 resultCount:(unint64_t)a4 incrementErrorCount:(BOOL)a5
{
  _BOOL4 v5;
  os_unfair_lock_s *p_lock;
  double var1;
  double var0;
  OS_os_activity *os_activity;
  double v13;
  _DKEventStatsTimerCounter *eventStatsTimerCounter;
  unint64_t count;
  double v16;
  double *p_minimumElapsedTime;

  if (a3)
  {
    v5 = a5;
    p_lock = &self->super._lock;
    os_unfair_lock_lock(&self->super._lock);
    var0 = a3->var0;
    var1 = a3->var1;
    if (self->_os_activity)
    {
      os_activity_scope_leave(&self->_os_activity_scope_state);
      os_activity = self->_os_activity;
      self->_os_activity = 0;

    }
    v13 = var1 - var0;
    eventStatsTimerCounter = self->_eventStatsTimerCounter;
    if (eventStatsTimerCounter)
      -[_DKEventStatsTimerCounter addTimingWithTimeInterval:]((uint64_t)eventStatsTimerCounter, v13);
    count = self->super._count;
    self->super._count = count + 1;
    v16 = a3->var1;
    self->super._lastElapsedTime = v13;
    self->super._lastResultCount = a4;
    self->super._totalElapsedTime = v13 + self->super._totalElapsedTime;
    self->super._lastUpdateTime = v16;
    if (count)
    {
      p_minimumElapsedTime = &self->super._minimumElapsedTime;
      if (v13 >= self->super._minimumElapsedTime)
      {
        p_minimumElapsedTime = &self->super._maximumElapsedTime;
        if (v13 <= self->super._maximumElapsedTime)
        {
          if (!v5)
          {
LABEL_11:
            os_unfair_lock_unlock(p_lock);
            return;
          }
LABEL_10:
          ++self->super._errorCount;
          goto LABEL_11;
        }
      }
    }
    else
    {
      self->super._minimumElapsedTime = v13;
      p_minimumElapsedTime = &self->super._maximumElapsedTime;
    }
    *p_minimumElapsedTime = v13;
    if (!v5)
      goto LABEL_11;
    goto LABEL_10;
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPerfMetric name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPerfMetric string](self, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDPerfMetric count](self, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDPerfMetric errorCount](self, "errorCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { name=%@, text='%@', count=%@, errorCount=%@ }"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStatsTimerCounter, 0);
  objc_storeStrong((id *)&self->_os_activity, 0);
}

@end
