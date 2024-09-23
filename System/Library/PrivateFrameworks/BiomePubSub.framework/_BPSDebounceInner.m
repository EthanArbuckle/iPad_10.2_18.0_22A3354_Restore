@implementation _BPSDebounceInner

- (_BPSDebounceInner)initWithDownstream:(id)a3 for:(double)a4 getTimestamp:(id)a5
{
  id v9;
  id v10;
  _BPSDebounceInner *v11;
  _BPSDebounceInner *v12;
  id lastEvent;
  uint64_t v14;
  NSDate *lastArrivalTimestamp;
  uint64_t v16;
  id getTimestamp;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_BPSDebounceInner;
  v11 = -[_BPSDebounceInner init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downstream, a3);
    v12->_dueTime = a4;
    lastEvent = v12->_lastEvent;
    v12->_lastEvent = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v14 = objc_claimAutoreleasedReturnValue();
    lastArrivalTimestamp = v12->_lastArrivalTimestamp;
    v12->_lastArrivalTimestamp = (NSDate *)v14;

    v16 = objc_msgSend(v10, "copy");
    getTimestamp = v12->_getTimestamp;
    v12->_getTimestamp = (id)v16;

    v12->_lock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)cancel
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_0(&dword_1A956A000, v2, v3, "%@ - cancel", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)receiveCompletion:(id)a3
{
  _BPSDebounceInner *v4;
  id v5;
  NSObject *v6;
  void *v7;

  v4 = self;
  v5 = a3;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_BPSDebounceInner receiveCompletion:].cold.1();

  -[_BPSDebounceInner downstream](v4, "downstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receiveCompletion:", v5);

}

- (int64_t)receiveInput:(id)a3
{
  id v5;
  _BPSDebounceInner *v6;
  void *v7;
  NSObject *v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  int64_t v13;

  v5 = a3;
  v6 = self;
  os_unfair_lock_lock(&v6->_lock);
  (*((void (**)(void))v6->_getTimestamp + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_BPSDebounceInner receiveInput:].cold.2((uint64_t)v5, v7);

  objc_msgSend(v7, "timeIntervalSinceDate:", v6->_lastArrivalTimestamp);
  if (v9 >= v6->_dueTime)
    v10 = v6->_lastEvent;
  else
    v10 = 0;
  objc_storeStrong((id *)&v6->_lastArrivalTimestamp, v7);
  objc_storeStrong(&v6->_lastEvent, a3);
  os_unfair_lock_unlock(&v6->_lock);
  if (v10)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_BPSDebounceInner receiveInput:].cold.1((uint64_t)v10, v11);

    -[_BPSDebounceInner downstream](v6, "downstream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "receiveInput:", v10);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSDebounceInner downstream](self, "downstream");
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

- (double)dueTime
{
  return self->_dueTime;
}

- (void)setDueTime:(double)a3
{
  self->_dueTime = a3;
}

- (id)lastEvent
{
  return self->_lastEvent;
}

- (void)setLastEvent:(id)a3
{
  objc_storeStrong(&self->_lastEvent, a3);
}

- (NSDate)lastArrivalTimestamp
{
  return self->_lastArrivalTimestamp;
}

- (void)setLastArrivalTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastArrivalTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastArrivalTimestamp, 0);
  objc_storeStrong(&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong(&self->_getTimestamp, 0);
}

- (void)receiveCompletion:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_0(&dword_1A956A000, v2, v3, "%@ - completion", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)receiveInput:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A956A000, a2, OS_LOG_TYPE_DEBUG, "deliverying: %@", (uint8_t *)&v2, 0xCu);
}

- (void)receiveInput:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A956A000, v2, v3, "receiving: %@ at %@", v4, v5, v6, v7, 2u);

}

@end
