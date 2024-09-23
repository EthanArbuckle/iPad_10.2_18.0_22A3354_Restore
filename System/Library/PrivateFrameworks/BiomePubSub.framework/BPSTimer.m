@implementation BPSTimer

- (BPSTimer)initWithUpstream:(id)a3 interval:(double)a4 getTimestamp:(id)a5
{
  id v10;
  id v11;
  BPSTimer *v12;
  BPSTimer *v13;
  uint64_t v14;
  id getTimestamp;
  uint64_t v16;
  NSDate *nextIntervalBoundary;
  uint64_t v18;
  NSMutableArray *pendingTimers;
  void *v21;
  objc_super v22;

  v10 = a3;
  v11 = a5;
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSTimer.m"), 123, CFSTR("interval should be greater than 0"));

  }
  v22.receiver = self;
  v22.super_class = (Class)BPSTimer;
  v12 = -[BPSTimer init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    v13->_interval = a4;
    v14 = objc_msgSend(v11, "copy");
    getTimestamp = v13->_getTimestamp;
    v13->_getTimestamp = (id)v14;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = objc_claimAutoreleasedReturnValue();
    nextIntervalBoundary = v13->_nextIntervalBoundary;
    v13->_nextIntervalBoundary = (NSDate *)v16;

    v18 = objc_opt_new();
    pendingTimers = v13->_pendingTimers;
    v13->_pendingTimers = (NSMutableArray *)v18;

  }
  return v13;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  _BPSTimerInner *v6;
  double v7;
  double v8;
  void *v9;
  _BPSTimerInner *v10;
  void *v11;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BPSDebounce subscribe:].cold.1();

  v6 = [_BPSTimerInner alloc];
  -[BPSTimer interval](self, "interval");
  v8 = v7;
  -[BPSTimer getTimestamp](self, "getTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_BPSTimerInner initWithDownstream:interval:getTimestamp:](v6, "initWithDownstream:interval:getTimestamp:", v4, v9, v8);

  -[BPSTimer upstream](self, "upstream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subscribe:", v10);

}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSTimer upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextEvent
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v10;
  __int128 v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  NSObject *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[BPSTimer pendingTimers](self, "pendingTimers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[BPSTimer pendingTimers](self, "pendingTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();

    -[BPSTimer pendingTimers](self, "pendingTimers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);

    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BPSTimer nextEvent].cold.2();
    goto LABEL_4;
  }
  -[BPSTimer upstream](self, "upstream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextEvent");
  v8 = objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v6 = 0;
    return v6;
  }
  *(_QWORD *)&v11 = 138412802;
  v41 = v11;
  while (1)
  {
    -[BPSTimer getTimestamp](self, "getTimestamp", v41);
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSObject *))v12)[2](v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v36 = objc_opt_class();
      objc_msgSend(v13, "description");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v41;
      v43 = v36;
      v44 = 2112;
      v45 = v8;
      v46 = 2112;
      v47 = v37;
      _os_log_debug_impl(&dword_1A956A000, v14, OS_LOG_TYPE_DEBUG, "%@ - receiving: %@ at %@", buf, 0x20u);

    }
    -[BPSTimer nextIntervalBoundary](self, "nextIntervalBoundary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToDate:", v16);

    if ((v17 & 1) == 0)
      break;
    v18 = (void *)MEMORY[0x1E0C99D68];
    -[BPSTimer interval](self, "interval");
    objc_msgSend(v18, "dateWithTimeInterval:sinceDate:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSTimer setNextIntervalBoundary:](self, "setNextIntervalBoundary:", v19);

    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v38 = objc_opt_class();
      -[BPSTimer nextIntervalBoundary](self, "nextIntervalBoundary");
      v39 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v38;
      v44 = 2112;
      v45 = v39;
      _os_log_debug_impl(&dword_1A956A000, v20, OS_LOG_TYPE_DEBUG, "%@ - started with nextIntervalBoundary: %@", buf, 0x16u);

    }
LABEL_23:
    -[BPSTimer upstream](self, "upstream");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "nextEvent");
    v6 = objc_claimAutoreleasedReturnValue();

    v8 = v6;
    if (!v6)
      return v6;
  }
  -[BPSTimer nextIntervalBoundary](self, "nextIntervalBoundary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v13, "compare:", v21);

  if (v22 != 1)
    goto LABEL_23;
  v6 = 0;
  do
  {
    if (v6)
    {
      -[BPSTimer pendingTimers](self, "pendingTimers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSTimer nextIntervalBoundary](self, "nextIntervalBoundary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

    }
    else
    {
      -[BPSTimer nextIntervalBoundary](self, "nextIntervalBoundary");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)MEMORY[0x1E0C99D68];
    -[BPSTimer interval](self, "interval");
    v27 = v26;
    -[BPSTimer nextIntervalBoundary](self, "nextIntervalBoundary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dateWithTimeInterval:sinceDate:", v28, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSTimer setNextIntervalBoundary:](self, "setNextIntervalBoundary:", v29);

    __biome_log_for_category();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v33 = objc_opt_class();
      -[BPSTimer nextIntervalBoundary](self, "nextIntervalBoundary");
      v34 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v33;
      v44 = 2112;
      v45 = v34;
      _os_log_debug_impl(&dword_1A956A000, v30, OS_LOG_TYPE_DEBUG, "%@ - set new nextIntervalBoundary: %@", buf, 0x16u);

    }
    -[BPSTimer nextIntervalBoundary](self, "nextIntervalBoundary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v13, "compare:", v31);

  }
  while (v32 == 1);
  if (!v6)
    goto LABEL_23;
  __biome_log_for_category();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    -[BPSTimer nextEvent].cold.1();

LABEL_4:
  return v6;
}

- (void)reset
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSTimer setNextIntervalBoundary:](self, "setNextIntervalBoundary:", v3);

  v4 = (void *)objc_opt_new();
  -[BPSTimer setPendingTimers:](self, "setPendingTimers:", v4);

  v5.receiver = self;
  v5.super_class = (Class)BPSTimer;
  -[BPSPublisher reset](&v5, sel_reset);
}

- (BOOL)completed
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[BPSTimer pendingTimers](self, "pendingTimers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)BPSTimer;
  return -[BPSPublisher completed](&v6, sel_completed);
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (double)interval
{
  return self->_interval;
}

- (id)getTimestamp
{
  return self->_getTimestamp;
}

- (NSDate)nextIntervalBoundary
{
  return self->_nextIntervalBoundary;
}

- (void)setNextIntervalBoundary:(id)a3
{
  objc_storeStrong((id *)&self->_nextIntervalBoundary, a3);
}

- (NSMutableArray)pendingTimers
{
  return self->_pendingTimers;
}

- (void)setPendingTimers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTimers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTimers, 0);
  objc_storeStrong((id *)&self->_nextIntervalBoundary, 0);
  objc_storeStrong(&self->_getTimestamp, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
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
  OUTLINED_FUNCTION_2(&dword_1A956A000, v0, v1, "%@ - returned pendingTimer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
