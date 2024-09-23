@implementation ACRateLimiter

- (ACRateLimiter)initWithMaximum:(unint64_t)a3 inTimeInterval:(double)a4
{
  ACRateLimiter *v6;
  ACRateLimiter *v7;
  uint64_t v8;
  NSMutableDictionary *keyToSimpleRateLimiter;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *instanceQueue;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *vacuumQueue;
  uint64_t v18;
  NSDate *nextVacuumDate;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ACRateLimiter;
  v6 = -[ACRateLimiter init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_maximum = a3;
    v6->_timeInterval = a4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    keyToSimpleRateLimiter = v7->_keyToSimpleRateLimiter;
    v7->_keyToSimpleRateLimiter = (NSMutableDictionary *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UNSPECIFIED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("ACRateLimiter queue", v11);
    instanceQueue = v7->_instanceQueue;
    v7->_instanceQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, (dispatch_qos_class_t)0xFFFF8000, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("ACRateLimiter vacuum queue", v15);
    vacuumQueue = v7->_vacuumQueue;
    v7->_vacuumQueue = (OS_dispatch_queue *)v16;

    v7->_vacuumTimeInterval = fmax(a4, 3600.0);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
    v18 = objc_claimAutoreleasedReturnValue();
    nextVacuumDate = v7->_nextVacuumDate;
    v7->_nextVacuumDate = (NSDate *)v18;

  }
  return v7;
}

- (BOOL)reservePerformActionForKey:(id)a3
{
  void *v4;
  char v5;

  -[ACRateLimiter simpleRateLimiterForKey:](self, "simpleRateLimiterForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "reservePerformActionNow");
  -[ACRateLimiter vacuumIfNeeded](self, "vacuumIfNeeded");

  return v5;
}

- (id)simpleRateLimiterForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  -[ACRateLimiter instanceQueue](self, "instanceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ACRateLimiter_simpleRateLimiterForKey___block_invoke;
  block[3] = &unk_1E4894398;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__ACRateLimiter_simpleRateLimiterForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  ACSimpleRateLimiter *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "keyToSimpleRateLimiter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = [ACSimpleRateLimiter alloc];
    v7 = objc_msgSend(*(id *)(a1 + 32), "maximum");
    objc_msgSend(*(id *)(a1 + 32), "timeInterval");
    v8 = -[ACSimpleRateLimiter initWithMaximum:inTimeInterval:](v6, "initWithMaximum:inTimeInterval:", v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "keyToSimpleRateLimiter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 40));

  }
}

- (void)vacuumIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *vacuumQueue;
  _QWORD block[5];

  if (!-[ACRateLimiter isVacuumInProgress](self, "isVacuumInProgress"))
  {
    -[ACRateLimiter nextVacuumDate](self, "nextVacuumDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "compare:", v4);

    if (v5 == -1)
    {
      -[ACRateLimiter setIsVacuumInProgress:](self, "setIsVacuumInProgress:", 1);
      vacuumQueue = self->_vacuumQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__ACRateLimiter_vacuumIfNeeded__block_invoke;
      block[3] = &unk_1E4892AD8;
      block[4] = self;
      dispatch_async(vacuumQueue, block);
    }
  }
}

uint64_t __31__ACRateLimiter_vacuumIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "nextVacuumDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3);

  if (v4 == -1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_vacuumQueue_vacuum");
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(*(id *)(a1 + 32), "vacuumTimeInterval");
    objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setNextVacuumDate:", v6);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setIsVacuumInProgress:", 0);
}

- (void)_vacuumQueue_vacuum
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  -[ACRateLimiter instanceQueue](self, "instanceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ACRateLimiter__vacuumQueue_vacuum__block_invoke;
  block[3] = &unk_1E48943C0;
  block[4] = self;
  block[5] = &v18;
  dispatch_sync(v3, block);

  _ACLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v19[5], "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v5;
    _os_log_impl(&dword_1A2BCD000, v4, OS_LOG_TYPE_DEFAULT, "\"Started rate limiter vacuuming (%{public}@ keys)\", buf, 0xCu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)v19[5];
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v7 += -[ACRateLimiter _vacuumQueue_vacuumKey:](self, "_vacuumQueue_vacuumKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
    }
    while (v8);
  }

  _ACLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl(&dword_1A2BCD000, v11, OS_LOG_TYPE_DEFAULT, "\"Finished rate limiter vacuuming (removed %{public}@ keys)\", buf, 0xCu);

  }
  _Block_object_dispose(&v18, 8);

}

void __36__ACRateLimiter__vacuumQueue_vacuum__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "keyToSimpleRateLimiter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_vacuumQueue_vacuumKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[ACRateLimiter instanceQueue](self, "instanceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ACRateLimiter__vacuumQueue_vacuumKey___block_invoke;
  block[3] = &unk_1E48943E8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __40__ACRateLimiter__vacuumQueue_vacuumKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "keyToSimpleRateLimiter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEmptyAfterFlushing"))
  {
    objc_msgSend(*(id *)(a1 + 32), "keyToSimpleRateLimiter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (OS_dispatch_queue)instanceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)vacuumQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)keyToSimpleRateLimiter
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKeyToSimpleRateLimiter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (double)vacuumTimeInterval
{
  return self->_vacuumTimeInterval;
}

- (BOOL)isVacuumInProgress
{
  return self->_isVacuumInProgress;
}

- (void)setIsVacuumInProgress:(BOOL)a3
{
  self->_isVacuumInProgress = a3;
}

- (NSDate)nextVacuumDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNextVacuumDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextVacuumDate, 0);
  objc_storeStrong((id *)&self->_keyToSimpleRateLimiter, 0);
  objc_storeStrong((id *)&self->_vacuumQueue, 0);
  objc_storeStrong((id *)&self->_instanceQueue, 0);
}

@end
