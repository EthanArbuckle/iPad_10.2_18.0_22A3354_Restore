@implementation _BPSThrottleInner

- (_BPSThrottleInner)initWithDownstream:(id)a3 interval:(double)a4 latest:(BOOL)a5 getTimestamp:(id)a6
{
  id v11;
  id v12;
  _BPSThrottleInner *v13;
  _BPSThrottleInner *v14;
  id intervalEvent;
  uint64_t v16;
  NSDate *nextIntervalBoundary;
  NSDate *startTimestamp;
  uint64_t v19;
  id getTimestamp;
  objc_super v22;

  v11 = a3;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_BPSThrottleInner;
  v13 = -[_BPSThrottleInner init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_downstream, a3);
    v14->_interval = a4;
    v14->_latest = a5;
    intervalEvent = v14->_intervalEvent;
    v14->_intervalEvent = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = objc_claimAutoreleasedReturnValue();
    nextIntervalBoundary = v14->_nextIntervalBoundary;
    v14->_nextIntervalBoundary = (NSDate *)v16;

    startTimestamp = v14->_startTimestamp;
    v14->_startTimestamp = 0;

    v19 = objc_msgSend(v12, "copy");
    getTimestamp = v14->_getTimestamp;
    v14->_getTimestamp = (id)v19;

    v14->_lock._os_unfair_lock_opaque = 0;
  }

  return v14;
}

- (void)cancel
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
  OUTLINED_FUNCTION_0(&dword_1A956A000, v0, v1, "%@ - cancel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)receiveCompletion:(id)a3
{
  _BPSThrottleInner *v4;
  id v5;
  NSObject *v6;
  void *v7;

  v4 = self;
  v5 = a3;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_BPSThrottleInner receiveCompletion:].cold.1();

  -[_BPSThrottleInner downstream](v4, "downstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receiveCompletion:", v5);

}

- (int64_t)receiveInput:(id)a3
{
  id v5;
  _BPSThrottleInner *v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  NSObject *v9;
  NSDate *nextIntervalBoundary;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSDate *v14;
  void *v15;
  int64_t v16;
  id intervalEvent;
  id v18;
  double v19;
  uint64_t v20;
  NSDate *v21;
  NSObject *v22;
  void *v23;
  long double __y;

  v5 = a3;
  v6 = self;
  p_lock = &v6->_lock;
  os_unfair_lock_lock(&v6->_lock);
  (*((void (**)(void))v6->_getTimestamp + 2))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_BPSDebounceInner receiveInput:].cold.2((uint64_t)v5, v8);

  nextIntervalBoundary = v6->_nextIntervalBoundary;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(nextIntervalBoundary) = -[NSDate isEqualToDate:](nextIntervalBoundary, "isEqualToDate:", v11);

  if ((_DWORD)nextIntervalBoundary)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_BPSThrottleInner receiveInput:].cold.1();

    objc_storeStrong((id *)&v6->_startTimestamp, v8);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v8, v6->_interval);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v6->_nextIntervalBoundary;
    v6->_nextIntervalBoundary = (NSDate *)v13;

    os_unfair_lock_unlock(p_lock);
    -[_BPSThrottleInner downstream](v6, "downstream");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "receiveInput:", v5);

    goto LABEL_19;
  }
  if (objc_msgSend(v8, "compare:", v6->_nextIntervalBoundary) != 1)
  {
    if (v6->_latest || !v6->_intervalEvent)
      objc_storeStrong(&v6->_intervalEvent, a3);
    os_unfair_lock_unlock(p_lock);
    goto LABEL_18;
  }
  intervalEvent = v6->_intervalEvent;
  if (intervalEvent)
    v18 = intervalEvent;
  objc_msgSend(v8, "timeIntervalSinceDate:", v6->_startTimestamp);
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v8, (double)((1.0 - modf(v19 / v6->_interval, &__y)) * v6->_interval));
  v21 = v6->_nextIntervalBoundary;
  v6->_nextIntervalBoundary = (NSDate *)v20;

  objc_storeStrong(&v6->_intervalEvent, a3);
  os_unfair_lock_unlock(p_lock);
  if (!intervalEvent)
  {
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  __biome_log_for_category();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[_BPSThrottleInner receiveInput:].cold.2();

  -[_BPSThrottleInner downstream](v6, "downstream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v23, "receiveInput:", intervalEvent);

LABEL_19:
  return v16;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSThrottleInner downstream](self, "downstream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveSubscription:", v4);

}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (BOOL)latest
{
  return self->_latest;
}

- (void)setLatest:(BOOL)a3
{
  self->_latest = a3;
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
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong(&self->_getTimestamp, 0);
}

- (void)receiveCompletion:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1A956A000, v0, v1, "%@ - completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)receiveInput:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1A956A000, v0, v1, "delivering 1st: %@", v2);
}

- (void)receiveInput:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1A956A000, v0, v1, "delivering: %@", v2);
}

@end
