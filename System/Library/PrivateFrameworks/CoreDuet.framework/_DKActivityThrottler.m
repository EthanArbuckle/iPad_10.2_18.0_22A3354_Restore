@implementation _DKActivityThrottler

- (void)setDate:(void *)a3 forKey:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v5, v6);
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39___DKActivityThrottler_setDate_forKey___block_invoke;
    block[3] = &unk_1E26E35A8;
    block[4] = a1;
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

- (id)dateForKey:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  double v7;
  char v8;

  v3 = a2;
  if (!a1)
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
  }
  objc_msgSend(v5, "timeIntervalSinceNow");
  if (v7 > 0.0)
  {

LABEL_9:
    v5 = 0;
    goto LABEL_15;
  }
  if (v5)
    v8 = v6;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v5, v3);
LABEL_15:

  return v5;
}

- (void)_performWithDelayInSecondsOf:(void *)a3 name:(void *)a4 queue:(double)a5 activityBlock:
{
  id v9;
  NSObject *v10;
  id v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  dispatch_time_t v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v12 = a1;
    objc_sync_enter(v12);
    if (objc_msgSend(v12[2], "containsObject:", v9))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:].cold.1((uint64_t)v9, v13, v14, v15, v16, v17, v18, v19);
    }
    else
    {
      objc_msgSend(v12[2], "addObject:", v9);
      v20 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:].cold.2((uint64_t)v9, v22, (uint64_t)v31);
      }

      v23 = objc_retainAutorelease(v9);
      objc_msgSend(v23, "UTF8String");
      v24 = (void *)os_transaction_create();
      v25 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __78___DKActivityThrottler__performWithDelayInSecondsOf_name_queue_activityBlock___block_invoke;
      v27[3] = &unk_1E26E5A70;
      v30 = v11;
      v27[4] = v12;
      v28 = v23;
      v29 = v24;
      v26 = v24;
      dispatch_after(v25, v10, v27);

    }
    objc_sync_exit(v12);

  }
}

- (void)_performOrScheduleWithTimeInterval:(void *)a3 name:(void *)a4 queue:(unint64_t)a5 activityBlock:(double)a6 callDepth:
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  double v40;
  _QWORD v41[5];
  id v42;
  NSObject *v43;
  id v44;
  double v45;
  unint64_t v46;
  _BYTE v47[32];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  if (a1)
  {
    v14 = a1;
    objc_sync_enter(v14);
    if (a5)
    {
      if (a5 >= 0xB)
      {
        v15 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:].cold.2((uint64_t)v11, v17, (uint64_t)v47);
        }

        goto LABEL_14;
      }
    }
    else if (-[_DKActivityThrottler _minimumIntervalScheduledActionsContainsActionName:]((uint64_t)v14, v11))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:].cold.1((uint64_t)v11, v18, v19, v20, v21, v22, v23, v24);
      goto LABEL_14;
    }
    v25 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke;
    v41[3] = &unk_1E26E5A48;
    v41[4] = v14;
    v26 = v11;
    v42 = v26;
    v45 = a6;
    v27 = v12;
    v43 = v27;
    v28 = v13;
    v44 = v28;
    v46 = a5;
    v29 = (void *)MEMORY[0x193FEEAF4](v41);
    -[_DKActivityThrottler _minimumIntervalScheduledActionsAddActionName:]((uint64_t)v14, v26);
    dispatch_get_current_queue();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30 == v27;

    if (v31)
    {
      -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v14, v26, v28, v29, a6);
      -[_DKActivityThrottler _minimumIntervalScheduledActionsRemoveActionName:]((uint64_t)v14, v26);
    }
    else
    {
      v32 = objc_retainAutorelease(v26);
      objc_msgSend(v32, "UTF8String");
      v33 = (void *)os_transaction_create();
      v35[0] = v25;
      v35[1] = 3221225472;
      v35[2] = __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_2;
      v35[3] = &unk_1E26E59F8;
      v35[4] = v14;
      v40 = a6;
      v36 = v32;
      v38 = v28;
      v39 = v29;
      v37 = v33;
      v34 = v33;
      dispatch_async(v27, v35);

    }
LABEL_14:
    objc_sync_exit(v14);

  }
}

- (void)_performNoMoreOftenInSecondsThan:(void *)a3 name:(void *)a4 activityBlock:(double)a5 throttleBlock:
{
  void (**v9)(_QWORD);
  void (**v10)(_QWORD, double);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v18 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = a1;
    objc_sync_enter(v11);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_DKThrottledActivityLast%@ActivityDate"), v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKActivityThrottler dateForKey:]((uint64_t)v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (objc_msgSend(v13, "timeIntervalSinceNow"), v16 = v15, -v15 < a5))
    {

      objc_sync_exit(v11);
      if (v10)
        v10[2](v10, v16 + a5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKActivityThrottler setDate:forKey:]((uint64_t)v11, v17, v12);

      objc_sync_exit(v11);
      if (v9)
        v9[2](v9);
    }
  }

}

- (void)_minimumIntervalScheduledActionsRemoveActionName:(uint64_t)a1
{
  id v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 8);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 8), "removeObject:", v4);
    objc_sync_exit(v3);

  }
}

- (uint64_t)_minimumIntervalScheduledActionsContainsActionName:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 8);
    objc_sync_enter(v4);
    a1 = objc_msgSend(*(id *)(a1 + 8), "containsObject:", v3);
    objc_sync_exit(v4);

  }
  return a1;
}

- (void)_minimumIntervalScheduledActionsAddActionName:(uint64_t)a1
{
  id v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 8);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 8), "addObject:", v4);
    objc_sync_exit(v3);

  }
}

- (_QWORD)initWithStore:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  dispatch_queue_t v18;
  void *v19;
  objc_super v21;

  v4 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)_DKActivityThrottler;
    v5 = objc_msgSendSuper2(&v21, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 5, a2);
      v6 = objc_opt_new();
      v7 = (void *)a1[1];
      a1[1] = v6;

      v8 = objc_opt_new();
      v9 = (void *)a1[2];
      a1[2] = v8;

      v10 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      objc_msgSend(v10, "setCountLimit:", 200);
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@@%p"), v13, a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setName:", v14);

      v15 = (void *)a1[3];
      a1[3] = v10;
      v16 = v10;

      objc_msgSend(v16, "name");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
      v19 = (void *)a1[4];
      a1[4] = v18;

    }
  }

  return a1;
}

- (void)clearHistoryForName:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = a1;
    objc_sync_enter(v4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_DKThrottledActivityLast%@ActivityDate"), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKActivityThrottler clearDateForKey:]((uint64_t)v4, v5);

    objc_sync_exit(v4);
    v3 = v6;
  }

}

- (id)keyForName:(void *)a1
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_DKThrottledActivityLast%@ActivityDate"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)clearDateForKey:(uint64_t)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    v3 = *(void **)(a1 + 24);
    v4 = a2;
    objc_msgSend(v3, "removeObjectForKey:", v4);
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v4);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  _CDPrettyPrintCollection(self->_minimumIntervalScheduledActions, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPrettyPrintCollection(self->_delayScheduledActions, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ minimumIntervalScheduledActions=%@, delayScheduledActions=%@ }"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_delayScheduledActions, 0);
  objc_storeStrong((id *)&self->_minimumIntervalScheduledActions, 0);
}

- (void)_performOrScheduleWithTimeInterval:(uint64_t)a3 name:(uint64_t)a4 queue:(uint64_t)a5 activityBlock:(uint64_t)a6 callDepth:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, MEMORY[0x1E0C81028], a3, "Activity '%@' is already scheduled", a5, a6, a7, a8, 2u);
}

- (void)_performOrScheduleWithTimeInterval:(uint64_t)a3 name:queue:activityBlock:callDepth:.cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;

  OUTLINED_FUNCTION_0_8(a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Runaway throttled activity '%@' with interval of %@ seconds", v4, 0x16u);

}

- (void)_performWithDelayInSecondsOf:(uint64_t)a3 name:queue:activityBlock:.cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;

  OUTLINED_FUNCTION_0_8(a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Delaying activity '%@' by %@ seconds", v4, 0x16u);

}

@end
