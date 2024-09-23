@implementation BPSDebounce

- (BPSDebounce)initWithUpstream:(id)a3 for:(double)a4 getTimestamp:(id)a5
{
  id v10;
  id v11;
  BPSDebounce *v12;
  BPSDebounce *v13;
  uint64_t v14;
  id getTimestamp;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  if (a4 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSDebounce.m"), 115, CFSTR("dueTime should be greater than or equal to 0"));

  }
  v18.receiver = self;
  v18.super_class = (Class)BPSDebounce;
  v12 = -[BPSDebounce init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    v13->_dueTime = a4;
    v14 = objc_msgSend(v11, "copy");
    getTimestamp = v13->_getTimestamp;
    v13->_getTimestamp = (id)v14;

  }
  return v13;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  _BPSDebounceInner *v6;
  double v7;
  double v8;
  void *v9;
  _BPSDebounceInner *v10;
  void *v11;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BPSDebounce subscribe:].cold.1();

  v6 = [_BPSDebounceInner alloc];
  -[BPSDebounce dueTime](self, "dueTime");
  v8 = v7;
  -[BPSDebounce getTimestamp](self, "getTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_BPSDebounceInner initWithDownstream:for:getTimestamp:](v6, "initWithDownstream:for:getTimestamp:", v4, v9, v8);

  -[BPSDebounce upstream](self, "upstream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subscribe:", v10);

}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSDebounce upstream](self, "upstream");
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
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[BPSDebounce upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  *(_QWORD *)&v5 = 138412802;
  v21 = v5;
  while (1)
  {
    -[BPSDebounce getTimestamp](self, "getTimestamp", v21);
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_opt_class();
      objc_msgSend(v7, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v21;
      v23 = v17;
      v24 = 2112;
      v25 = v4;
      v26 = 2112;
      v27 = v18;
      _os_log_debug_impl(&dword_1A956A000, v8, OS_LOG_TYPE_DEBUG, "%@ - receiving: %@ at %@", buf, 0x20u);

    }
    -[BPSDebounce lastArrivalTimestamp](self, "lastArrivalTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v9);
    v11 = v10;
    -[BPSDebounce dueTime](self, "dueTime");
    v13 = v12;

    if (v11 >= v13)
    {
      -[BPSDebounce lastEvent](self, "lastEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    -[BPSDebounce setLastArrivalTimestamp:](self, "setLastArrivalTimestamp:", v7);
    -[BPSDebounce setLastEvent:](self, "setLastEvent:", v4);
    if (v14)
      break;
    -[BPSDebounce upstream](self, "upstream");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "nextEvent");
    v16 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v16;
    if (!v16)
      return 0;
  }
  __biome_log_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[BPSDebounce nextEvent].cold.1();

  return v14;
}

- (void)reset
{
  objc_super v3;

  -[BPSDebounce setLastEvent:](self, "setLastEvent:", 0);
  -[BPSDebounce setLastArrivalTimestamp:](self, "setLastArrivalTimestamp:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BPSDebounce;
  -[BPSPublisher reset](&v3, sel_reset);
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (double)dueTime
{
  return self->_dueTime;
}

- (id)getTimestamp
{
  return self->_getTimestamp;
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

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A956A000, v0, v1, "%@ - subscribe", v2, v3, v4, v5, 2u);
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

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A956A000, v0, v1, "%@ - delivering: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
