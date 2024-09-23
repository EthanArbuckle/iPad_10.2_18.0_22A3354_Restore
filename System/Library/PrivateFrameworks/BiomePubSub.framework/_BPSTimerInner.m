@implementation _BPSTimerInner

- (_BPSTimerInner)initWithDownstream:(id)a3 interval:(double)a4 getTimestamp:(id)a5
{
  id v9;
  id v10;
  _BPSTimerInner *v11;
  _BPSTimerInner *v12;
  uint64_t v13;
  NSDate *nextIntervalBoundary;
  NSDate *startTimestamp;
  uint64_t v16;
  id getTimestamp;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_BPSTimerInner;
  v11 = -[_BPSTimerInner init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downstream, a3);
    v12->_interval = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v13 = objc_claimAutoreleasedReturnValue();
    nextIntervalBoundary = v12->_nextIntervalBoundary;
    v12->_nextIntervalBoundary = (NSDate *)v13;

    startTimestamp = v12->_startTimestamp;
    v12->_startTimestamp = 0;

    v16 = objc_msgSend(v10, "copy");
    getTimestamp = v12->_getTimestamp;
    v12->_getTimestamp = (id)v16;

    v12->_lock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)receiveCompletion:(id)a3
{
  _BPSTimerInner *v4;
  id v5;
  NSObject *v6;
  void *v7;

  v4 = self;
  v5 = a3;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_BPSTimerInner receiveCompletion:].cold.1();

  -[_BPSTimerInner downstream](v4, "downstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receiveCompletion:", v5);

}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  _BPSTimerInner *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  NSObject *v8;
  NSDate **p_nextIntervalBoundary;
  NSDate *nextIntervalBoundary;
  void *v11;
  uint64_t v12;
  NSDate *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSDate *v17;
  uint8_t v19[4];
  _DWORD v20[7];

  *(_QWORD *)&v20[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  (*((void (**)(void))v5->_getTimestamp + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_BPSDebounceInner receiveInput:].cold.2((uint64_t)v4, v7);

  p_nextIntervalBoundary = &v5->_nextIntervalBoundary;
  nextIntervalBoundary = v5->_nextIntervalBoundary;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(nextIntervalBoundary) = -[NSDate isEqualToDate:](nextIntervalBoundary, "isEqualToDate:", v11);

  if ((_DWORD)nextIntervalBoundary)
  {
    objc_storeStrong((id *)&v5->_startTimestamp, v7);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v7, v5->_interval);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v5->_nextIntervalBoundary;
    v5->_nextIntervalBoundary = (NSDate *)v12;

  }
  else if (objc_msgSend(v7, "compare:", *p_nextIntervalBoundary) == 1
         && objc_msgSend(v7, "compare:", *p_nextIntervalBoundary) == 1)
  {
    do
    {
      os_unfair_lock_unlock(p_lock);
      __biome_log_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[_BPSTimerInner receiveInput:].cold.1(v19, (id *)&v5->_nextIntervalBoundary, v20, v14);

      -[_BPSTimerInner downstream](v5, "downstream");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "receiveInput:", v5->_nextIntervalBoundary);

      os_unfair_lock_lock(p_lock);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v5->_nextIntervalBoundary, v5->_interval);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v5->_nextIntervalBoundary;
      v5->_nextIntervalBoundary = (NSDate *)v16;

    }
    while (objc_msgSend(v7, "compare:", v5->_nextIntervalBoundary) == 1);
  }
  os_unfair_lock_unlock(p_lock);

  return 0;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSTimerInner downstream](self, "downstream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveSubscription:", v4);

}

- (void)cancel
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A956A000, v0, v1, "%@ - cancel", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
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

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A956A000, v0, v1, "%@ - completion", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)receiveInput:(_QWORD *)a3 .cold.1(uint8_t *a1, id *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(*a2, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A956A000, a4, OS_LOG_TYPE_DEBUG, "delivering: %@", a1, 0xCu);

}

@end
