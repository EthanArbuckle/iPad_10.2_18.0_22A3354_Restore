@implementation DKActivityThrottler

void __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_2(uint64_t a1)
{
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 56), *(void **)(a1 + 64), *(double *)(a1 + 72));
  -[_DKActivityThrottler _minimumIntervalScheduledActionsRemoveActionName:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __39___DKActivityThrottler_setDate_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 40), "setObject:forKey:", a1[5], a1[6]);
}

void __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke(uint64_t a1, double a2)
{
  uint64_t *v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (uint64_t *)(a1 + 40);
  -[_DKActivityThrottler _minimumIntervalScheduledActionsAddActionName:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_cold_1(v4, a1);
  v5 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_53;
  v11[3] = &unk_1E26E5A20;
  v6 = *(NSObject **)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v16 = *(_QWORD *)(a1 + 64);
  v14 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  v15 = v9;
  v17 = v10;
  dispatch_after(v5, v6, v11);

}

void __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_53(uint64_t a1)
{
  id v2;

  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v2 = (id)os_transaction_create();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) + 1, *(double *)(a1 + 64));
  -[_DKActivityThrottler _minimumIntervalScheduledActionsRemoveActionName:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));

}

uint64_t __78___DKActivityThrottler__performWithDelayInSecondsOf_name_queue_activityBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[7];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
}

void __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_cold_1(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a2 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Delaying activity '%@' by %@ seconds due to minimum interval of %@ seconds", (uint8_t *)&v6, 0x20u);

}

@end
