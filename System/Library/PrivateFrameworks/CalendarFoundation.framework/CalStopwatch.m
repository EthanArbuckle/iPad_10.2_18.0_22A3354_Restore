@implementation CalStopwatch

- (CalStopwatch)init
{
  CalStopwatch *v2;
  CalStopwatch *v3;
  uint64_t v4;
  NSMutableDictionary *events;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalStopwatch;
  v2 = -[CalStopwatch init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isRunning = 0;
    v2->_hasValidElapsedTime = 0;
    v4 = objc_opt_new();
    events = v3->_events;
    v3->_events = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)start
{
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, a2, a3, "Will not start stopwatch.  It is already running.  Stopwatch: [%@].", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (id)elapsedTimeAsString:(int)a3
{
  unint64_t v4;
  CalStopwatch *v5;
  __CFString *v6;

  v4 = -[CalStopwatch elapsedTimeAsNumber:](self, "elapsedTimeAsNumber:", *(_QWORD *)&a3);
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_hasValidElapsedTime)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("Unknown");
  }
  objc_sync_exit(v5);

  return v6;
}

- (unint64_t)elapsedTimeAsNumber:(int)a3
{
  unint64_t v4;
  unint64_t v5;

  v4 = -[CalStopwatch elapsedTimeInNanoseconds](self, "elapsedTimeInNanoseconds");
  if (a3 > 2)
    v5 = 1;
  else
    v5 = qword_18FC712B8[a3];
  return v4 / v5;
}

- (unint64_t)elapsedTimeInNanoseconds
{
  uint64_t v3;
  CalStopwatch *v4;
  unint64_t v5;

  v3 = mach_absolute_time();
  if (elapsedTimeInNanoseconds_onceToken != -1)
    dispatch_once(&elapsedTimeInNanoseconds_onceToken, &__block_literal_global_32);
  if (!elapsedTimeInNanoseconds_ratio)
    return 0;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_isRunning)
  {
    v5 = (v3 - v4->_lastStartTime + v4->_elapsedTime) * elapsedTimeInNanoseconds_ratio;
  }
  else if (v4->_hasValidElapsedTime)
  {
    v5 = v4->_elapsedTime * elapsedTimeInNanoseconds_ratio;
  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v4);

  return v5;
}

void __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke()
{
  kern_return_t v0;
  int v1;
  NSObject *v2;
  mach_timebase_info info;

  info = 0;
  v0 = mach_timebase_info(&info);
  if (v0)
  {
    v1 = v0;
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_3(v1, v2);
  }
  else if (info.denom)
  {
    elapsedTimeInNanoseconds_ratio = info.numer / info.denom;
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_2(v2);
  }
  else
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_1(v2);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
}

- (id)description
{
  CalDescriptionBuilder *v3;
  void *v4;
  CalDescriptionBuilder *v5;
  CalStopwatch *v6;
  void *v7;
  objc_super v9;

  v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalStopwatch;
  -[CalStopwatch description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CalDescriptionBuilder initWithSuperclassDescription:](v3, "initWithSuperclassDescription:", v4);

  v6 = self;
  objc_sync_enter(v6);
  -[CalDescriptionBuilder setKey:withUnsignedLongLong:](v5, "setKey:withUnsignedLongLong:", CFSTR("LastStartTime"), v6->_lastStartTime);
  -[CalDescriptionBuilder setKey:withUnsignedLongLong:](v5, "setKey:withUnsignedLongLong:", CFSTR("ElapsedTime"), v6->_elapsedTime);
  -[CalDescriptionBuilder setKey:withBoolean:](v5, "setKey:withBoolean:", CFSTR("IsRunning"), v6->_isRunning);
  -[CalDescriptionBuilder setKey:withBoolean:](v5, "setKey:withBoolean:", CFSTR("HasValidElapsedTime"), v6->_hasValidElapsedTime);
  objc_sync_exit(v6);

  -[CalDescriptionBuilder build](v5, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)stop
{
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, a2, a3, "Will not stop stopwatch.  It is not running. Stopwatch: [%@].", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)reset
{
  CalStopwatch *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isRunning = 0;
  obj->_lastStartTime = 0;
  obj->_elapsedTime = 0;
  obj->_hasValidElapsedTime = 0;
  objc_sync_exit(obj);

}

- (void)markEventStart:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CalFoundationLogSubsystem eventTimer](CalFoundationLogSubsystem, "eventTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CalStopwatch markEventStart:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  if (-[CalStopwatch usesSignalFlags](self, "usesSignalFlags"))
  {
    +[CalFoundationLogSubsystem eventTimer](CalFoundationLogSubsystem, "eventTimer");
    v13 = objc_claimAutoreleasedReturnValue();
    CalPerfLogStart(v13);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_events, "setObject:forKeyedSubscript:", v14, v4);

}

- (double)markEventSplit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_events, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0.0;
  if (v7)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v7);
    v10 = v11;
  }
  if (v8)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v8);
    v9 = v12;
  }
  +[CalFoundationLogSubsystem eventTimer](CalFoundationLogSubsystem, "eventTimer");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v18 = v4;
    v19 = 2048;
    v20 = v9;
    v21 = 2048;
    v22 = v10;
    _os_log_debug_impl(&dword_18FC12000, v13, OS_LOG_TYPE_DEBUG, "Event %@ has taken %f seconds so far (%f seconds since last split)", buf, 0x20u);
  }

  if (-[CalStopwatch usesSignalFlags](self, "usesSignalFlags"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Split %li"), v4, objc_msgSend(v6, "count") + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalFoundationLogSubsystem eventTimer](CalFoundationLogSubsystem, "eventTimer");
    v15 = objc_claimAutoreleasedReturnValue();
    CalPerfLogPoint(v15);

  }
  objc_msgSend(v6, "addObject:", v5);

  return v10;
}

- (double)markEventEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  double v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_events, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0.0;
  v10 = 0;
  if (v7)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v7);
    v10 = v11;
  }
  if (v8)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v8);
    v9 = v12;
  }
  +[CalFoundationLogSubsystem eventTimer](CalFoundationLogSubsystem, "eventTimer");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412802;
    v17 = v4;
    v18 = 2048;
    v19 = v9;
    v20 = 2048;
    v21 = v10;
    _os_log_debug_impl(&dword_18FC12000, v13, OS_LOG_TYPE_DEBUG, "Event %@ took a total of %f seconds (%f seconds since last split)", (uint8_t *)&v16, 0x20u);
  }

  if (-[CalStopwatch usesSignalFlags](self, "usesSignalFlags"))
  {
    +[CalFoundationLogSubsystem eventTimer](CalFoundationLogSubsystem, "eventTimer");
    v14 = objc_claimAutoreleasedReturnValue();
    CalPerfLogEnd(v14);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_events, "removeObjectForKey:", v4);

  return v9;
}

- (BOOL)usesSignalFlags
{
  return self->_usesSignalFlags;
}

- (void)setUsesSignalFlags:(BOOL)a3
{
  self->_usesSignalFlags = a3;
}

void __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "Mach timebase information produced a result with a denominator of 0.  Stopwatches will not work.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

void __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_2(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = elapsedTimeInNanoseconds_ratio;
  _os_log_debug_impl(&dword_18FC12000, log, OS_LOG_TYPE_DEBUG, "Mach timebase information ratio: [%u]", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_2();
}

void __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Could not acquire Mach timebase information.  Stopwatches will not work.  Error: [%d]", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)markEventStart:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, a2, a3, "Started event %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
