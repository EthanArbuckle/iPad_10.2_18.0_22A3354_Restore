@implementation HKMHDaySummaryQuery

- (HKMHDaySummaryQuery)initWithDayIndexRange:(id)a3 gregorianCalendar:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 resultsHandler:(id)a7
{
  int64_t var1;
  int64_t var0;
  id v14;
  id v15;
  HKMHDaySummaryQuery *v16;
  HKMHDaySummaryQuery *v17;
  uint64_t v18;
  id resultsHandler;
  objc_super v21;

  var1 = a3.var1;
  var0 = a3.var0;
  v14 = a4;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HKMHDaySummaryQuery;
  v16 = -[HKQuery _initWithObjectType:predicate:](&v21, sel__initWithObjectType_predicate_, 0, 0);
  v17 = v16;
  if (v16)
  {
    v16->_dayIndexRange.start = var0;
    v16->_dayIndexRange.duration = var1;
    objc_storeStrong((id *)&v16->_gregorianCalendar, a4);
    v17->_ascending = a5;
    v17->_limit = a6;
    v18 = objc_msgSend(v15, "copy");
    resultsHandler = v17->_resultsHandler;
    v17->_resultsHandler = (id)v18;

  }
  return v17;
}

- (void)client_deliverDaySummaries:(id)a3 clearPending:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[HKQuery queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86__HKMHDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke;
  v15[3] = &unk_25119D7F8;
  v15[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

void __86__HKMHDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;

  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEBUG))
    __86__HKMHDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_cold_1(a1, v2);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  if (v3 && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = v4;

  }
  if (*(_BYTE *)(a1 + 57))
  {
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 160);
    *(_QWORD *)(v8 + 160) = 0;

    v10 = (void *)MEMORY[0x242699AA4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 48);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __86__HKMHDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_183;
      v13[3] = &unk_25119D7D0;
      v13[4] = v11;
      v14 = v7;
      v15 = v10;
      objc_msgSend(v11, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v12, 1, v13);

    }
  }
}

uint64_t __86__HKMHDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_183(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = *(void **)(a1 + 40);
    v7 = v4;
    objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v4;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2416DD000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering %@ summaries: %@", (uint8_t *)&v11, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMHDaySummaryQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setDayIndexRange:", self->_dayIndexRange.start, self->_dayIndexRange.duration, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setGregorianCalendar:", self->_gregorianCalendar);
  objc_msgSend(v4, "setAscending:", self->_ascending);
  objc_msgSend(v4, "setLimit:", self->_limit);

}

+ (id)clientInterfaceProtocol
{
  return &unk_25714B5F8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKMHDaySummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID_, 0, 0);

}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x242699AA4](self->_resultsHandler);
  -[HKQuery clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HKMHDaySummaryQuery_queue_deliverError___block_invoke;
  block[3] = &unk_25119D820;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __42__HKMHDaySummaryQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMHDaySummaryQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_resultsHandler)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD44A0], CFSTR("%@ resultsHandler must not be nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMHDaySummaryQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  $BB81632A5F90EABF970498852D8C14B8 *p_dayIndexRange;
  int64_t start;
  int64_t duration;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_dayIndexRange = &self->_dayIndexRange;
  start = self->_dayIndexRange.start;
  duration = p_dayIndexRange->duration;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_summariesPendingDelivery, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

void __86__HKMHDaySummaryQuery_client_deliverDaySummaries_clearPending_isFinalBatch_queryUUID___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = *(void **)(a1 + 40);
  v16 = v4;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "dayIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "dayIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138544642;
  v18 = v4;
  v19 = 2112;
  v20 = v7;
  v21 = 2112;
  v22 = v10;
  v23 = 2112;
  v24 = v13;
  v25 = 2112;
  v26 = v14;
  v27 = 2112;
  v28 = v15;
  _os_log_debug_impl(&dword_2416DD000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] Received batch of %@ summaries (%@ - %@), clear pending: %@, is final: %@", buf, 0x3Eu);

}

@end
