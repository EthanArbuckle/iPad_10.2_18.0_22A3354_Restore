@implementation AWEventStatistics

void __25__AWEventStatistics_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  double v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "integerValue");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        if (v12)
        {
          getEventMaskDescription(v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendFormat:", CFSTR("%llu %@ "), v12, v13);

          v6 = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  if ((v6 & 1) != 0 && currentLogLevel >= 6)
  {
    _AALog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = absTimeNS();
      if (v15 == -1)
        v16 = INFINITY;
      else
        v16 = (double)v15 / 1000000000.0;
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(v17 + 32);
      if (v18 == -1)
        v19 = INFINITY;
      else
        v19 = (double)v18 / 1000000000.0;
      v20 = *(_QWORD *)(v17 + 40);
      *(_DWORD *)buf = 134218754;
      v30 = v16;
      v31 = 2112;
      v32 = v24;
      v33 = 2048;
      v34 = v19;
      v35 = 2112;
      v36 = v20;
      _os_log_impl(&dword_1AF589000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: %@since %13.5f (%@)", buf, 0x2Au);
    }

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = absTimeNS();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;

}

+ (id)sharedStatistics
{
  if (sharedStatistics_onceToken != -1)
    dispatch_once(&sharedStatistics_onceToken, &__block_literal_global_58);
  return (id)sharedStatistics_statistics;
}

- (void)logEvent:(unint64_t)a3
{
  NSMutableDictionary *stats;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSObject *timer;
  dispatch_time_t v11;
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  stats = self->_stats;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](stats, "objectForKeyedSubscript:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "integerValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_stats;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  if (!self->_timerResumed)
  {
    timer = self->_timer;
    v11 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(timer, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timer);
    self->_timerResumed = 1;
  }

}

- (AWEventStatistics)init
{
  id v2;
  uint64_t v3;
  void *v4;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD handler[4];
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AWEventStatistics;
  v2 = -[AWEventStatistics init](&v16, sel_init);
  if (v2)
  {
    awQueue(1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = *((_QWORD *)v2 + 2);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __25__AWEventStatistics_init__block_invoke;
    handler[3] = &unk_1E5F8EC18;
    v8 = v2;
    v15 = v8;
    dispatch_source_set_event_handler(v7, handler);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v8[6];
    v8[6] = v9;

    v8[4] = absTimeNS();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v8[5];
    v8[5] = v11;

  }
  return (AWEventStatistics *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_lastLogDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __37__AWEventStatistics_sharedStatistics__block_invoke()
{
  AWEventStatistics *v0;
  void *v1;

  v0 = objc_alloc_init(AWEventStatistics);
  v1 = (void *)sharedStatistics_statistics;
  sharedStatistics_statistics = (uint64_t)v0;

}

@end
