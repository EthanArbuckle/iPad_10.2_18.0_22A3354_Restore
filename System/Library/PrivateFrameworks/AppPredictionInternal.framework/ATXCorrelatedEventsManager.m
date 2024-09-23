@implementation ATXCorrelatedEventsManager

- (ATXCorrelatedEventsManager)initWithFirstEventType:(Class)a3 firstEventTypeDateBuffer:(id)a4 secondEventType:(Class)a5 secondEventTypeDateBuffer:(id)a6
{
  id v11;
  id v12;
  void *v13;
  ATXCorrelatedEventsManager *v14;
  ATXCorrelatedEventsManager *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _PASLock *correlatedEventsLock;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _PASLock *typeAEventDataLock;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _PASLock *typeBEventDataLock;
  ATXCorrelatedEventsManager *v31;
  NSObject *v32;
  objc_super v34;

  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (a5 && a3 && v11 && v12)
  {
    v34.receiver = self;
    v34.super_class = (Class)ATXCorrelatedEventsManager;
    v14 = -[ATXCorrelatedEventsManager init](&v34, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_firstEventType, a3);
      objc_storeStrong((id *)&v15->_firstEventTypeDateBuffer, a4);
      objc_storeStrong((id *)&v15->_secondEventType, a5);
      objc_storeStrong((id *)&v15->_secondEventTypeDateBuffer, a6);
      v16 = objc_opt_new();
      v17 = objc_opt_new();
      v18 = *(void **)(v16 + 8);
      *(_QWORD *)(v16 + 8) = v17;

      *(_QWORD *)(v16 + 16) = 0;
      *(_WORD *)(v16 + 24) = 1;
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v16);
      correlatedEventsLock = v15->_correlatedEventsLock;
      v15->_correlatedEventsLock = (_PASLock *)v19;

      v21 = (_QWORD *)objc_opt_new();
      v21[1] = 0;
      v22 = objc_opt_new();
      v23 = (void *)v21[2];
      v21[2] = v22;

      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v21);
      typeAEventDataLock = v15->_typeAEventDataLock;
      v15->_typeAEventDataLock = (_PASLock *)v24;

      v26 = (_QWORD *)objc_opt_new();
      v26[1] = 0;
      v27 = objc_opt_new();
      v28 = (void *)v26[2];
      v26[2] = v27;

      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v26);
      typeBEventDataLock = v15->_typeBEventDataLock;
      v15->_typeBEventDataLock = (_PASLock *)v29;

    }
    self = v15;
    v31 = self;
  }
  else
  {
    __atxlog_handle_default();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[ATXCorrelatedEventsManager initWithFirstEventType:firstEventTypeDateBuffer:secondEventType:secondEventTypeDateBuffer:].cold.1();

    v31 = 0;
  }

  return v31;
}

- (void)insertEvents:(id)a3 forEventType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  _PASLock *typeBEventDataLock;
  id *v11;
  uint64_t *v12;
  void *v13;
  char isKindOfClass;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;

  v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    objc_msgSend(v6, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      typeBEventDataLock = self->_typeBEventDataLock;
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke_17;
      v19 = &unk_1E82E4420;
      v11 = &v20;
      v20 = v7;
      v12 = &v16;
      goto LABEL_7;
    }
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    goto LABEL_14;
  }
  if (a4)
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ATXCorrelatedEventsManager insertEvents:forEventType:].cold.1();
    goto LABEL_14;
  }
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) == 0)
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
LABEL_13:
      -[ATXCorrelatedEventsManager insertEvents:forEventType:].cold.2();
LABEL_14:

    goto LABEL_15;
  }
  typeBEventDataLock = self->_typeAEventDataLock;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke;
  v24 = &unk_1E82E4420;
  v11 = &v25;
  v25 = v7;
  v12 = &v21;
LABEL_7:
  -[_PASLock runWithLockAcquired:](typeBEventDataLock, "runWithLockAcquired:", v12, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);

  -[_PASLock runWithLockAcquired:](self->_correlatedEventsLock, "runWithLockAcquired:", &__block_literal_global_117);
LABEL_15:

}

uint64_t __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
}

uint64_t __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke_17(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
}

void __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke_18(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 25) = 0;
}

+ (BOOL)eventsOverlapForEventA:(id)a3 withDateBuffer:(id)a4 eventB:(id)a5 withDateBuffer:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "startDateWithBufferForEvent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDateWithBufferForEvent:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  objc_msgSend(v11, "endDateWithBufferForEvent:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startDateWithBufferForEvent:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v16, "compare:", v17);
  return (unint64_t)(v15 + 1) < 2 && v18 < 2;
}

- (void)correlateEvents
{
  void *v3;
  _PASLock *typeAEventDataLock;
  _QWORD v5[5];

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  typeAEventDataLock = self->_typeAEventDataLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke;
  v5[3] = &unk_1E82E4420;
  v5[4] = self;
  -[_PASLock runWithLockAcquired:](typeAEventDataLock, "runWithLockAcquired:", v5);
  objc_autoreleasePoolPop(v3);
}

void __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke_2;
  v7[3] = &unk_1E82E44B0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "runWithLockAcquired:", v7);

}

void __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke_3;
  v7[3] = &unk_1E82E4488;
  v8 = v4;
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "runWithLockAcquired:", v7);

}

void __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  ATXCorrelatedEvents *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v20 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v6 = *((_QWORD *)v21 + 2);
  if (v4 >= objc_msgSend(v3, "count"))
    goto LABEL_17;
  if (v6 == -1)
    v7 = 0;
  else
    v7 = v6;
  v19 = v7;
  do
  {
    v8 = v20;
    v9 = v19;
    if (v19 >= objc_msgSend(v5, "count"))
      goto LABEL_16;
    while (1)
    {
      v10 = (void *)MEMORY[0x1CAA48B6C]();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)objc_opt_class(), "eventsOverlapForEventA:withDateBuffer:eventB:withDateBuffer:", v11, *(_QWORD *)(*(_QWORD *)(v8 + 48) + 48), v12, *(_QWORD *)(*(_QWORD *)(v8 + 48) + 56)))
      {
        v13 = -[ATXCorrelatedEvents initWithFirstEvent:secondEvent:]([ATXCorrelatedEvents alloc], "initWithFirstEvent:secondEvent:", v11, v12);
        objc_msgSend(*((id *)v21 + 1), "addObject:", v13);
        if (*((_BYTE *)v21 + 24))
          *((_QWORD *)v21 + 2) = v9;

        goto LABEL_13;
      }
      v14 = v4;
      v15 = v3;
      objc_msgSend(*(id *)(*(_QWORD *)(v8 + 48) + 56), "startDateWithBufferForEvent:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(v8 + 48) + 48), "endDateWithBufferForEvent:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "compare:", v17);

      if (v18 == 1)
        break;
      v8 = v20;
      *((_BYTE *)v21 + 24) = 1;
      v3 = v15;
      v4 = v14;
LABEL_13:

      objc_autoreleasePoolPop(v10);
      if (++v9 >= objc_msgSend(v5, "count"))
        goto LABEL_16;
    }
    v19 = *((_QWORD *)v21 + 2);

    objc_autoreleasePoolPop(v10);
    v3 = v15;
    v4 = v14;
LABEL_16:
    ++v4;
  }
  while (v4 < objc_msgSend(v3, "count"));
LABEL_17:
  *((_BYTE *)v21 + 25) = 1;

}

- (id)correlatedEvents
{
  _PASLock *correlatedEventsLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__54;
  v10 = __Block_byref_object_dispose__54;
  v11 = 0;
  correlatedEventsLock = self->_correlatedEventsLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__ATXCorrelatedEventsManager_correlatedEvents__block_invoke;
  v5[3] = &unk_1E82E44D8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](correlatedEventsLock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__ATXCorrelatedEventsManager_correlatedEvents__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id *v7;

  v3 = a2;
  v7 = v3;
  if (!*((_BYTE *)v3 + 25))
  {
    objc_msgSend(*(id *)(a1 + 32), "correlateEvents");
    v3 = v7;
  }
  v4 = objc_msgSend(v3[1], "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (Class)firstEventType
{
  return self->_firstEventType;
}

- (Class)secondEventType
{
  return self->_secondEventType;
}

- (ATXCorrelatedEventsDateBuffer)firstEventTypeDateBuffer
{
  return self->_firstEventTypeDateBuffer;
}

- (ATXCorrelatedEventsDateBuffer)secondEventTypeDateBuffer
{
  return self->_secondEventTypeDateBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondEventTypeDateBuffer, 0);
  objc_storeStrong((id *)&self->_firstEventTypeDateBuffer, 0);
  objc_storeStrong((id *)&self->_secondEventType, 0);
  objc_storeStrong((id *)&self->_firstEventType, 0);
  objc_storeStrong((id *)&self->_typeBEventDataLock, 0);
  objc_storeStrong((id *)&self->_typeAEventDataLock, 0);
  objc_storeStrong((id *)&self->_correlatedEventsLock, 0);
}

- (void)initWithFirstEventType:firstEventTypeDateBuffer:secondEventType:secondEventTypeDateBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Initializing an instance of ATXCorrelatedEventsManager without specifying buffers for firstEventType or secondEventType, or their buffers.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)insertEvents:forEventType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Trying to insert ATXDuetEvents into ATXCorrelatedEventsManager that don't belong to group 1 or 2.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)insertEvents:forEventType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Trying to insert data of incorrect type into CorrelatedEventsManager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
