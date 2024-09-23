@implementation BPSThrottle

- (BPSThrottle)initWithUpstream:(id)a3 interval:(double)a4 latest:(BOOL)a5 getTimestamp:(id)a6
{
  id v12;
  id v13;
  BPSThrottle *v14;
  BPSThrottle *v15;
  uint64_t v16;
  id getTimestamp;
  id intervalEvent;
  uint64_t v19;
  NSDate *nextIntervalBoundary;
  NSDate *startTimestamp;
  void *v23;
  objc_super v24;

  v12 = a3;
  v13 = a6;
  if (a4 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSThrottle.m"), 139, CFSTR("interval should be greater than or equal to 0"));

  }
  v24.receiver = self;
  v24.super_class = (Class)BPSThrottle;
  v14 = -[BPSThrottle init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_upstream, a3);
    v15->_interval = a4;
    v15->_latest = a5;
    v16 = objc_msgSend(v13, "copy");
    getTimestamp = v15->_getTimestamp;
    v15->_getTimestamp = (id)v16;

    intervalEvent = v15->_intervalEvent;
    v15->_intervalEvent = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v19 = objc_claimAutoreleasedReturnValue();
    nextIntervalBoundary = v15->_nextIntervalBoundary;
    v15->_nextIntervalBoundary = (NSDate *)v19;

    startTimestamp = v15->_startTimestamp;
    v15->_startTimestamp = 0;

  }
  return v15;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  _BPSThrottleInner *v6;
  double v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  _BPSThrottleInner *v11;
  void *v12;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BPSThrottle subscribe:].cold.1();

  v6 = [_BPSThrottleInner alloc];
  -[BPSThrottle interval](self, "interval");
  v8 = v7;
  v9 = -[BPSThrottle latest](self, "latest");
  -[BPSThrottle getTimestamp](self, "getTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_BPSThrottleInner initWithDownstream:interval:latest:getTimestamp:](v6, "initWithDownstream:interval:latest:getTimestamp:", v4, v9, v10, v8);

  -[BPSThrottle upstream](self, "upstream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subscribe:", v11);

}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSThrottle upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  __int128 v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  long double v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  __int128 v34;
  _BYTE __y[12];
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[BPSThrottle upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  *(_QWORD *)&v5 = 138412802;
  v34 = v5;
  while (1)
  {
    -[BPSThrottle getTimestamp](self, "getTimestamp", v34);
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v26 = objc_opt_class();
      objc_msgSend(v7, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__y = v34;
      *(_QWORD *)&__y[4] = v26;
      v36 = 2112;
      v37 = v4;
      v38 = 2112;
      v39 = v27;
      _os_log_debug_impl(&dword_1A956A000, v8, OS_LOG_TYPE_DEBUG, "%@ - receiving: %@ at %@", __y, 0x20u);

    }
    -[BPSThrottle nextIntervalBoundary](self, "nextIntervalBoundary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToDate:", v10);

    if (v11)
      break;
    -[BPSThrottle nextIntervalBoundary](self, "nextIntervalBoundary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "compare:", v12);

    if (v13 == 1)
    {
      -[BPSThrottle intervalEvent](self, "intervalEvent");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[BPSThrottle intervalEvent](self, "intervalEvent");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[BPSThrottle startTimestamp](self, "startTimestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v15);
      v17 = v16;

      -[BPSThrottle interval](self, "interval");
      v19 = 1.0 - modf(v17 / v18, (long double *)__y);
      v20 = objc_alloc(MEMORY[0x1E0C99D68]);
      -[BPSThrottle interval](self, "interval");
      v22 = (void *)objc_msgSend(v20, "initWithTimeInterval:sinceDate:", v7, (double)(v19 * v21));
      -[BPSThrottle setNextIntervalBoundary:](self, "setNextIntervalBoundary:", v22);

      -[BPSThrottle setIntervalEvent:](self, "setIntervalEvent:", v4);
      if (v14)
      {
        __biome_log_for_category();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[BPSThrottle nextEvent].cold.2();

        goto LABEL_22;
      }
    }
    else if (-[BPSThrottle latest](self, "latest")
           || (-[BPSThrottle intervalEvent](self, "intervalEvent"),
               v23 = (void *)objc_claimAutoreleasedReturnValue(),
               v23,
               !v23))
    {
      -[BPSThrottle setIntervalEvent:](self, "setIntervalEvent:", v4);
    }
    -[BPSThrottle upstream](self, "upstream");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "nextEvent");
    v25 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v25;
    if (!v25)
      return 0;
  }
  __biome_log_for_category();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[BPSThrottle nextEvent].cold.1();

  -[BPSThrottle setStartTimestamp:](self, "setStartTimestamp:", v7);
  v30 = (void *)MEMORY[0x1E0C99D68];
  -[BPSThrottle interval](self, "interval");
  objc_msgSend(v30, "dateWithTimeInterval:sinceDate:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSThrottle setNextIntervalBoundary:](self, "setNextIntervalBoundary:", v31);

  v14 = v4;
LABEL_22:

  return v14;
}

- (void)reset
{
  void *v3;
  objc_super v4;

  -[BPSThrottle setIntervalEvent:](self, "setIntervalEvent:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSThrottle setNextIntervalBoundary:](self, "setNextIntervalBoundary:", v3);

  -[BPSThrottle setStartTimestamp:](self, "setStartTimestamp:", 0);
  v4.receiver = self;
  v4.super_class = (Class)BPSThrottle;
  -[BPSPublisher reset](&v4, sel_reset);
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (double)interval
{
  return self->_interval;
}

- (BOOL)latest
{
  return self->_latest;
}

- (id)getTimestamp
{
  return self->_getTimestamp;
}

- (id)intervalEvent
{
  return self->_intervalEvent;
}

- (void)setIntervalEvent:(id)a3
{
  objc_storeStrong(&self->_intervalEvent, a3);
}

- (NSDate)nextIntervalBoundary
{
  return self->_nextIntervalBoundary;
}

- (void)setNextIntervalBoundary:(id)a3
{
  objc_storeStrong((id *)&self->_nextIntervalBoundary, a3);
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_startTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_nextIntervalBoundary, 0);
  objc_storeStrong(&self->_intervalEvent, 0);
  objc_storeStrong(&self->_getTimestamp, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)subscribe:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0(&dword_1A956A000, v0, v1, "%@ - subscribe", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)nextEvent
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1A956A000, v0, v1, "%@ - delivering: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
