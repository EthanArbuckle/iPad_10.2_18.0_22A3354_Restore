@implementation ACHAWDSubmissionManager

- (ACHAWDSubmissionManager)initWithProfile:(id)a3 earnedInstanceStore:(id)a4
{
  id v6;
  id v7;
  ACHAWDSubmissionManager *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  id v11;
  id WeakRetained;
  double v13;
  void *v14;
  uint64_t v15;
  HDPeriodicActivity *scheduler;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ACHAWDSubmissionManager;
  v8 = -[ACHAWDSubmissionManager init](&v18, sel_init);
  if (v8)
  {
    HKCreateSerialDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v8->_earnedInstanceStore, a4);
    v11 = objc_alloc(MEMORY[0x24BE40B70]);
    WeakRetained = objc_loadWeakRetained((id *)&v8->_profile);
    v13 = (double)(uint64_t)*MEMORY[0x24BDAC630];
    ACHLogMetrics();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "initWithProfile:name:interval:delegate:loggingCategory:", WeakRetained, CFSTR("com.apple.healthd.awd-submission-manager.weekly"), v8, v14, v13);
    scheduler = v8->_scheduler;
    v8->_scheduler = (HDPeriodicActivity *)v15;

  }
  return v8;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  __n128 v8;
  _BOOL4 v9;
  void (*v10)(_QWORD *, uint64_t, _QWORD, __n128);
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;

  v13 = a4;
  -[ACHAWDSubmissionManager profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isProtectedDataAvailable");

  if ((v7 & 1) == 0)
  {
    v11 = v13;
    v10 = (void (*)(_QWORD *, uint64_t, _QWORD, __n128))v13[2];
    v8.n128_u64[0] = 0x408C200000000000;
LABEL_6:
    v12 = 2;
    goto LABEL_7;
  }
  v9 = -[ACHAWDSubmissionManager _computeAndSubmitAchievementCountMetric](self, "_computeAndSubmitAchievementCountMetric");
  v10 = (void (*)(_QWORD *, uint64_t, _QWORD, __n128))v13[2];
  if (!v9)
  {
    v8.n128_u64[0] = 0x408C200000000000;
    v11 = v13;
    goto LABEL_6;
  }
  v8.n128_u64[0] = 0;
  v11 = v13;
  v12 = 0;
LABEL_7:
  v10(v11, v12, 0, v8);

}

- (BOOL)_computeAndSubmitAchievementCountMetric
{
  void *v3;
  void *v4;
  HDActivityAWDActivityAchievementCountEvent *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  uint8_t v20[16];

  -[ACHAWDSubmissionManager _serverConnectionForComponentId:](self, "_serverConnectionForComponentId:", 67);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newMetricContainerWithIdentifier:", 4390912);
  if (v4)
  {
    v5 = objc_alloc_init(HDActivityAWDActivityAchievementCountEvent);
    -[ACHEarnedInstanceStore loadAllEarnedInstancesFromDatabaseIfNecessary](self->_earnedInstanceStore, "loadAllEarnedInstancesFromDatabaseIfNecessary");
    -[ACHEarnedInstanceStore earnedInstances](self->_earnedInstanceStore, "earnedInstances");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 <= 5)
      v8 = v7 > 1;
    else
      v8 = 2;
    if (v7 <= 10)
      v9 = v8;
    else
      v9 = 3;
    -[HDActivityAWDActivityAchievementCountEvent setTotalAchievementCount:](v5, "setTotalAchievementCount:", v9);
    -[HDActivityAWDActivityAchievementCountEvent setTotalOTAAchievementViewedCount:](v5, "setTotalOTAAchievementViewedCount:", 0);
    -[HDActivityAWDActivityAchievementCountEvent setTotalOTAAchievementCount:](v5, "setTotalOTAAchievementCount:", 0);
    -[ACHAWDSubmissionManager _formatMetricTypeToString:](self, "_formatMetricTypeToString:", objc_msgSend(v4, "metricId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.healthd.analytics-submission-manager.weekly"), "stringByAppendingString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDActivityAWDActivityAchievementCountEvent totalAchievementCount](v5, "totalAchievementCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FIActivityAnalyticsSubmission();

    objc_msgSend(CFSTR("com.apple.healthd.analytics-submission-manager.weekly"), "stringByAppendingString:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDActivityAWDActivityAchievementCountEvent totalOTAAchievementCount](v5, "totalOTAAchievementCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    FIActivityAnalyticsSubmission();

    objc_msgSend(CFSTR("com.apple.healthd.analytics-submission-manager.weekly"), "stringByAppendingString:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDActivityAWDActivityAchievementCountEvent totalOTAAchievementViewedCount](v5, "totalOTAAchievementViewedCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    FIActivityAnalyticsSubmission();

    v17 = -[ACHAWDSubmissionManager _submitMetric:container:connection:](self, "_submitMetric:container:connection:", v5, v4, v3);
  }
  else
  {
    ACHLogMetrics();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21407B000, v18, OS_LOG_TYPE_DEFAULT, "No metric container for achievement count", v20, 2u);
    }

    v17 = 1;
  }

  return v17;
}

- (id)_formatMetricTypeToString:(unsigned int)a3
{
  __CFString *v3;

  if (a3 - 4390912 < 8 && ((0xBFu >> a3) & 1) != 0)
  {
    v3 = off_24D13C020[a3 - 4390912];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %u)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_submitMetric:(id)a3 container:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "setMetric:", v7);
  v10 = objc_msgSend(v9, "submitMetric:", v8);

  ACHLogMetrics();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v12)
      goto LABEL_7;
    v17 = 67109120;
    LODWORD(v18) = objc_msgSend(v8, "metricId");
    v13 = "Metric %08x submitted";
  }
  else
  {
    if (!v12)
      goto LABEL_7;
    v17 = 67109120;
    LODWORD(v18) = objc_msgSend(v8, "metricId");
    v13 = "Metric %08x submission failed";
  }
  _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 8u);
LABEL_7:

  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
  {
    ACHLogMetrics();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "formattedText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_21407B000, v14, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v17, 0xCu);

    }
  }

  return v10;
}

- (id)_serverConnectionForComponentId:(unsigned int)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__ACHAWDSubmissionManager__serverConnectionForComponentId___block_invoke;
  block[3] = &unk_24D13C000;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __59__ACHAWDSubmissionManager__serverConnectionForComponentId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEC2B20]), "initWithComponentId:", *(unsigned int *)(a1 + 48));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v10)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    }
  }
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceStore, a3);
}

- (HDPeriodicActivity)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (NSMutableDictionary)serverConnectionsByComponentId
{
  return self->_serverConnectionsByComponentId;
}

- (void)setServerConnectionsByComponentId:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnectionsByComponentId, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverConnectionsByComponentId, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
