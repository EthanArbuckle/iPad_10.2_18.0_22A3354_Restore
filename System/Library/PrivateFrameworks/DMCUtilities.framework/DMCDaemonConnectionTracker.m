@implementation DMCDaemonConnectionTracker

- (void)trackRequestFromPID:(int)a3
{
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  int v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__DMCDaemonConnectionTracker_trackRequestFromPID___block_invoke;
  block[3] = &unk_1E4D36EB8;
  v10 = a3;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (id)_nameForProcessWithPID:(int)a3 cache:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  size_t v16;
  _BYTE buffer[256];
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (proc_name(v4, buffer, 0x100u) < 1)
  {
    v16 = 648;
    dword_1EE77F874 = v4;
    byte_1EE77FC4B = 0;
    v8 = 0;
    if (sysctl(_nameForProcessWithPID_cache__name, 4u, &_nameForProcessWithPID_cache__kp, &v16, 0, 0)
      || !byte_1EE77FC4B)
    {
      goto LABEL_9;
    }
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = &byte_1EE77FC4B;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = buffer;
  }
  objc_msgSend(v10, "stringWithUTF8String:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v12);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v8);

    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("unknown");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("unknown"), v12);
  }

LABEL_15:
  return v9;
}

void __50__DMCDaemonConnectionTracker_trackRequestFromPID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  dispatch_time_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE buf[24];
  void *v33;
  id v34;
  uint64_t *v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_nameForProcessWithPID:cache:", *(unsigned int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEBUG, "New request from %{public}@(%d)", buf, 0x12u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  v8 = *(void **)(a1 + 40);
  v9 = *(id *)(v6 + 48);
  v10 = v8;
  v11 = v3;
  v12 = v7;
  v13 = dispatch_time(0, 3000000000);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___scheduleCleanup_block_invoke;
  v33 = &unk_1E4D37070;
  v34 = v9;
  v35 = v11;
  v36 = *(double *)&v10;
  v14 = v10;
  v15 = v11;
  v16 = v9;
  dispatch_after(v13, v12, buf);

  v17 = *(double *)(*(_QWORD *)(a1 + 32) + 72);
  v18 = *(void **)(a1 + 40);
  v19 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v20 = v18;
  v21 = v15;
  objc_msgSend(v19, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = v22 == 0;

  if ((_DWORD)v15)
  {
    v23 = (void *)objc_opt_new();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, v21);

  }
  objc_msgSend(v19, "objectForKeyedSubscript:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  if (objc_msgSend(v24, "count", 0))
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___queue_verifyThresholdAndAddDateRecord_block_invoke;
    v33 = &unk_1E4D37048;
    v34 = v20;
    v35 = &v28;
    v36 = v17;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", buf);

  }
  v25 = v29[3];
  objc_msgSend(v24, "addObject:", v20);
  _Block_object_dispose(&v28, 8);

  if (v17 <= (double)v25)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      __50__DMCDaemonConnectionTracker_trackRequestFromPID___block_invoke_cold_1(v21, v2);
    objc_msgSend(*(id *)(*(_QWORD *)v2 + 48), "objectForKeyedSubscript:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeAllObjects");

    v27 = *(_QWORD *)(*(_QWORD *)v2 + 16);
    if (v27)
      (*(void (**)(uint64_t, _QWORD, _QWORD *))(v27 + 16))(v27, *(unsigned int *)(a1 + 48), v21);
  }

}

void __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  dispatch_time_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE buf[24];
  void *v33;
  id v34;
  uint64_t *v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_nameForProcessWithPID:cache:", *(unsigned int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEBUG, "New connection from %{public}@(%d)", buf, 0x12u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  v8 = *(void **)(a1 + 40);
  v9 = *(id *)(v6 + 40);
  v10 = v8;
  v11 = v3;
  v12 = v7;
  v13 = dispatch_time(0, 3000000000);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___scheduleCleanup_block_invoke;
  v33 = &unk_1E4D37070;
  v34 = v9;
  v35 = v11;
  v36 = *(double *)&v10;
  v14 = v10;
  v15 = v11;
  v16 = v9;
  dispatch_after(v13, v12, buf);

  v17 = *(double *)(*(_QWORD *)(a1 + 32) + 64);
  v18 = *(void **)(a1 + 40);
  v19 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v20 = v18;
  v21 = v15;
  objc_msgSend(v19, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = v22 == 0;

  if ((_DWORD)v15)
  {
    v23 = (void *)objc_opt_new();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, v21);

  }
  objc_msgSend(v19, "objectForKeyedSubscript:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  if (objc_msgSend(v24, "count", 0))
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___queue_verifyThresholdAndAddDateRecord_block_invoke;
    v33 = &unk_1E4D37048;
    v34 = v20;
    v35 = &v28;
    v36 = v17;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", buf);

  }
  v25 = v29[3];
  objc_msgSend(v24, "addObject:", v20);
  _Block_object_dispose(&v28, 8);

  if (v17 <= (double)v25)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke_cold_1(v21, v2);
    objc_msgSend(*(id *)(*(_QWORD *)v2 + 40), "objectForKeyedSubscript:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeAllObjects");

    v27 = *(_QWORD *)(*(_QWORD *)v2 + 8);
    if (v27)
      (*(void (**)(uint64_t, _QWORD, _QWORD *))(v27 + 16))(v27, *(unsigned int *)(a1 + 48), v21);
  }

}

- (void)trackConnectionFromPID:(int)a3
{
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  int v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke;
  block[3] = &unk_1E4D36EB8;
  v10 = a3;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (DMCDaemonConnectionTracker)initWithProcessName:(id)a3 connectionThreshold:(unint64_t)a4 requestThreshold:(unint64_t)a5
{
  id v8;
  DMCDaemonConnectionTracker *v9;
  NSObject *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  NSMutableDictionary *requestCache;
  uint64_t v16;
  NSMutableDictionary *connectionCache;
  uint64_t v18;
  NSMutableDictionary *pidNameCache;
  uint64_t v20;
  NSString *clientName;
  uint64x2_t v22;
  DMCDaemonConnectionTracker *v28;
  objc_super v30;

  v8 = a3;
  if (+[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal"))
  {
    v30.receiver = self;
    v30.super_class = (Class)DMCDaemonConnectionTracker;
    v9 = -[DMCDaemonConnectionTracker init](&v30, sel_init);
    if (v9)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_connection_tracker"), v8);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), v10);
      queue = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)v12;

      v14 = objc_opt_new();
      requestCache = v9->_requestCache;
      v9->_requestCache = (NSMutableDictionary *)v14;

      v16 = objc_opt_new();
      connectionCache = v9->_connectionCache;
      v9->_connectionCache = (NSMutableDictionary *)v16;

      v18 = objc_opt_new();
      pidNameCache = v9->_pidNameCache;
      v9->_pidNameCache = (NSMutableDictionary *)v18;

      v20 = objc_msgSend(v8, "copy");
      clientName = v9->_clientName;
      v9->_clientName = (NSString *)v20;

      v22.i64[0] = a4;
      v22.i64[1] = a5;
      __asm { FMOV            V1.2D, #3.0 }
      *(float64x2_t *)&v9->_connectionThreshold = vmulq_f64(vcvtq_f64_u64(v22), _Q1);

    }
    self = v9;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)excessiveConncetionHandler
{
  return self->_excessiveConncetionHandler;
}

- (void)setExcessiveConncetionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)excessiveRequestHandler
{
  return self->_excessiveRequestHandler;
}

- (void)setExcessiveRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableDictionary)connectionCache
{
  return self->_connectionCache;
}

- (void)setConnectionCache:(id)a3
{
  objc_storeStrong((id *)&self->_connectionCache, a3);
}

- (NSMutableDictionary)requestCache
{
  return self->_requestCache;
}

- (void)setRequestCache:(id)a3
{
  objc_storeStrong((id *)&self->_requestCache, a3);
}

- (NSMutableDictionary)pidNameCache
{
  return self->_pidNameCache;
}

- (void)setPidNameCache:(id)a3
{
  objc_storeStrong((id *)&self->_pidNameCache, a3);
}

- (double)connectionThreshold
{
  return self->_connectionThreshold;
}

- (void)setConnectionThreshold:(double)a3
{
  self->_connectionThreshold = a3;
}

- (double)requestThreshold
{
  return self->_requestThreshold;
}

- (void)setRequestThreshold:(double)a3
{
  self->_requestThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidNameCache, 0);
  objc_storeStrong((id *)&self->_requestCache, 0);
  objc_storeStrong((id *)&self->_connectionCache, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_excessiveRequestHandler, 0);
  objc_storeStrong(&self->_excessiveConncetionHandler, 0);
}

void __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  objc_msgSend(*(id *)(*(_QWORD *)a2 + 32), "UTF8String");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A4951000, MEMORY[0x1E0C81028], v3, "%s has established too many connections to %s in the last %.1f second.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2();
}

void __50__DMCDaemonConnectionTracker_trackRequestFromPID___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  objc_msgSend(*(id *)(*(_QWORD *)a2 + 32), "UTF8String");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A4951000, MEMORY[0x1E0C81028], v3, "%s has made too many requests to %s in the last %.1f second.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2();
}

@end
