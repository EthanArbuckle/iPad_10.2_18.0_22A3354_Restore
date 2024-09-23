@implementation HMDHH2MigrationLogEventsAnalyzer

- (HMDHH2MigrationLogEventsAnalyzer)initWithDataSource:(id)a3
{
  id v4;
  HMDHH2MigrationLogEventsAnalyzer *v5;
  void *v6;
  uint64_t v7;
  HMDEventCounterGroup *counterGroup;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  void *v12;
  HMDCounterThresholdTTRTrigger *v13;
  void *v14;
  uint64_t v15;
  HMDCounterThresholdTTRTrigger *migrationFailureTTRTrigger;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMDHH2MigrationLogEventsAnalyzer;
  v5 = -[HMDHH2MigrationLogEventsAnalyzer init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "legacyCountersManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "counterGroupForName:", CFSTR("HMDHH2MigrationLogEventsAnalyzerGroupName"));
    v7 = objc_claimAutoreleasedReturnValue();
    counterGroup = v5->_counterGroup;
    v5->_counterGroup = (HMDEventCounterGroup *)v7;

    objc_msgSend(v4, "logEventDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    objc_msgSend(v4, "logEventDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:forEventClass:", v5, objc_opt_class());

    v13 = [HMDCounterThresholdTTRTrigger alloc];
    objc_msgSend(v4, "radarInitiator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDCounterThresholdTTRTrigger initWithThreshold:ttrCategory:radarInitiator:](v13, "initWithThreshold:ttrCategory:radarInitiator:", 1, CFSTR("HH2 Migration Failure"), v14);
    migrationFailureTTRTrigger = v5->_migrationFailureTTRTrigger;
    v5->_migrationFailureTTRTrigger = (HMDCounterThresholdTTRTrigger *)v15;

    objc_msgSend(v4, "legacyCountersManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:forEventName:requestGroup:", v5->_migrationFailureTTRTrigger, CFSTR("migrationFailureToTriggerTTRCounter"), CFSTR("HMDHH2MigrationLogEventsAnalyzerGroupName"));

    objc_msgSend(v4, "dailyScheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerDailyTaskRunner:", v5);

  }
  return v5;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDHH2MigrationLogEventsAnalyzer *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HMDHH2MigrationLogEventsAnalyzer_didReceiveEventFromDispatcher___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)runDailyTask
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHH2MigrationLogEventsAnalyzer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDHH2MigrationLogEventsAnalyzer_runDailyTask__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (HMDCounterThresholdTTRTrigger)migrationFailureTTRTrigger
{
  return self->_migrationFailureTTRTrigger;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDEventCounterGroup)counterGroup
{
  return self->_counterGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_migrationFailureTTRTrigger, 0);
}

void __48__HMDHH2MigrationLogEventsAnalyzer_runDailyTask__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "counterGroup");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetEventCounters");

}

void __66__HMDHH2MigrationLogEventsAnalyzer_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  id v16;

  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v16 = v3;

  v4 = v16;
  if (!v16)
    goto LABEL_23;
  v5 = (unint64_t)objc_msgSend(v16, "migrationEventType") >= 4;
  v4 = v16;
  if (!v5)
    goto LABEL_23;
  objc_msgSend(v16, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  if (!v6)
    goto LABEL_23;
  objc_msgSend(v16, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD5BD8]);

  if (!v9)
    goto LABEL_20;
  v10 = objc_msgSend(v7, "code");
  if ((unint64_t)(v10 - 2704) > 0x1C)
    goto LABEL_19;
  if (((1 << (v10 + 112)) & 0x1F718102) != 0)
  {
LABEL_11:

LABEL_22:
    v4 = v16;
    goto LABEL_23;
  }
  if (v10 != 2704)
  {
LABEL_19:
    if ((unint64_t)(v10 - 75) < 2 || v10 == 2013)
      goto LABEL_11;
LABEL_20:

LABEL_21:
    objc_msgSend(*(id *)(a1 + 40), "counterGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "incrementEventCounterForEventName:", CFSTR("migrationFailureToTriggerTTRCounter"));
    goto LABEL_22;
  }
  objc_msgSend(v7, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v15 = isTransientCloudKitError(v14);
  v4 = v16;
  if ((v15 & 1) == 0)
    goto LABEL_21;
LABEL_23:

}

@end
