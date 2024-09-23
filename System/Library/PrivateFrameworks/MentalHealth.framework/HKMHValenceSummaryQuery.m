@implementation HKMHValenceSummaryQuery

- (HKMHValenceSummaryQuery)initWithDayIndexRange:(id)a3 gregorianCalendar:(id)a4 predicate:(id)a5 resultsHandler:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HKMHValenceSummaryQuery *v17;
  uint64_t v18;
  id resultsHandler;
  objc_super v21;

  var1 = a3.var1;
  var0 = a3.var0;
  v12 = a4;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDD3FE8];
  v15 = a5;
  objc_msgSend(v14, "stateOfMindType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)HKMHValenceSummaryQuery;
  v17 = -[HKQuery _initWithObjectType:predicate:](&v21, sel__initWithObjectType_predicate_, v16, v15);

  if (v17)
  {
    v17->_dayIndexRange.start = var0;
    v17->_dayIndexRange.duration = var1;
    objc_storeStrong((id *)&v17->_gregorianCalendar, a4);
    v18 = objc_msgSend(v13, "copy");
    resultsHandler = v17->_resultsHandler;
    v17->_resultsHandler = (id)v18;

  }
  return v17;
}

- (void)client_deliverValenceSummary:(id)a3 queryUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HKMHValenceSummaryQuery_client_deliverValenceSummary_queryUUID___block_invoke;
  block[3] = &unk_25119D758;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __66__HKMHValenceSummaryQuery_client_deliverValenceSummary_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v4 = v13;
    _os_log_impl(&dword_2416DD000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received ValenceSummary", buf, 0xCu);

  }
  v5 = (void *)MEMORY[0x242699AA4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__HKMHValenceSummaryQuery_client_deliverValenceSummary_queryUUID___block_invoke_183;
    v9[3] = &unk_25119D730;
    v9[4] = v7;
    v11 = v5;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v8, 1, v9);

  }
}

uint64_t __66__HKMHValenceSummaryQuery_client_deliverValenceSummary_queryUUID___block_invoke_183(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_2416DD000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering valence summary", (uint8_t *)&v6, 0xCu);

  }
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
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
  v5.super_class = (Class)HKMHValenceSummaryQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setDayIndexRange:", self->_dayIndexRange.start, self->_dayIndexRange.duration, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setGregorianCalendar:", self->_gregorianCalendar);

}

+ (id)clientInterfaceProtocol
{
  return &unk_257149A28;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKMHValenceSummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverValenceSummary_queryUUID_, 0, 0);

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
  block[2] = __46__HKMHValenceSummaryQuery_queue_deliverError___block_invoke;
  block[3] = &unk_25119D730;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __46__HKMHValenceSummaryQuery_queue_deliverError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_2416DD000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Throwing error", (uint8_t *)&v6, 0xCu);

  }
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMHValenceSummaryQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_resultsHandler)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD44A0], CFSTR("%@ resultsHandler must not be nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMHValenceSummaryQuery;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
