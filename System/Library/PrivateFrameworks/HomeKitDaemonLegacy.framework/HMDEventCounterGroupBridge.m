@implementation HMDEventCounterGroupBridge

- (HMDEventCounterGroupBridge)initWithContext:(id)a3 bridgedCounterGroup:(id)a4 dateProvider:(id)a5 statisticsGroupBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDEventCounterGroupBridge *v16;
  _QWORD aBlock[4];
  id v19;

  v10 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__HMDEventCounterGroupBridge_initWithContext_bridgedCounterGroup_dateProvider_statisticsGroupBlock___block_invoke;
  aBlock[3] = &unk_1E89BEA60;
  v19 = v10;
  v11 = v10;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = _Block_copy(aBlock);
  v16 = -[HMDEventCounterGroupBridge initWithContext:bridgedCounterGroup:queryDateBlock:statisticsGroupBlock:](self, "initWithContext:bridgedCounterGroup:queryDateBlock:statisticsGroupBlock:", v14, v13, v15, v12);

  return v16;
}

- (HMDEventCounterGroupBridge)initWithContext:(id)a3 bridgedCounterGroup:(id)a4 groupDate:(id)a5 statisticsGroupBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDEventCounterGroupBridge *v16;
  _QWORD aBlock[4];
  id v19;

  v10 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__HMDEventCounterGroupBridge_initWithContext_bridgedCounterGroup_groupDate_statisticsGroupBlock___block_invoke;
  aBlock[3] = &unk_1E89BEA60;
  v19 = v10;
  v11 = v10;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = _Block_copy(aBlock);
  v16 = -[HMDEventCounterGroupBridge initWithContext:bridgedCounterGroup:queryDateBlock:statisticsGroupBlock:](self, "initWithContext:bridgedCounterGroup:queryDateBlock:statisticsGroupBlock:", v14, v13, v15, v12);

  return v16;
}

- (HMDEventCounterGroupBridge)initWithContext:(id)a3 bridgedCounterGroup:(id)a4 queryDateBlock:(id)a5 statisticsGroupBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HMDEventCounterGroupBridge *v17;
  void *v18;
  id statisticsGroupBlock;
  void *v20;
  id queryDateBlock;
  objc_super v23;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0D334D0];
  v15 = a3;
  objc_msgSend(v14, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)HMDEventCounterGroupBridge;
  v17 = -[HMDEventCounterGroup initWithContext:serializedEventCounters:uptimeProvider:](&v23, sel_initWithContext_serializedEventCounters_uptimeProvider_, v15, 0, v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_bridgedCounterGroup, a4);
    v18 = _Block_copy(v13);
    statisticsGroupBlock = v17->_statisticsGroupBlock;
    v17->_statisticsGroupBlock = v18;

    v20 = _Block_copy(v12);
    queryDateBlock = v17->_queryDateBlock;
    v17->_queryDateBlock = v20;

  }
  return v17;
}

- (HMMStatisticsGroup)bridgedStatisticsGroup
{
  os_unfair_lock_s *p_lock;
  void (**v4)(void);
  HMMStatisticsGroup *v5;
  HMMStatisticsGroup *bridgedStatisticsGroup;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_bridgedStatisticsGroup)
  {
    -[HMDEventCounterGroupBridge statisticsGroupBlock](self, "statisticsGroupBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (HMMStatisticsGroup *)objc_claimAutoreleasedReturnValue();
    bridgedStatisticsGroup = self->_bridgedStatisticsGroup;
    self->_bridgedStatisticsGroup = v5;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_bridgedStatisticsGroup;
}

- (void)addObserver:(id)a3 forEventName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forCounter:", v7, v6);

}

- (void)addMaxValueObserver:(id)a3 forStatisticsName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDEventCounterGroupBridge bridgedStatisticsGroup](self, "bridgedStatisticsGroup");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addMaxValueObserver:forStatistics:", v7, v6);

}

- (void)incrementEventCounterForEventName:(id)a3 withValue:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incrementCounter:by:", v6, a4);

  -[HMDEventCounterGroup context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterChanged");

}

- (void)resumeDurationCounter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeDurationCounter:", v4);

}

- (void)pauseDurationCounter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pauseDurationCounter:", v4);

}

- (void)addValue:(unint64_t)a3 toStatisticsName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[HMDEventCounterGroupBridge bridgedStatisticsGroup](self, "bridgedStatisticsGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addValue:toStatistics:", a3, v6);

  -[HMDEventCounterGroup context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "counterChanged");

}

- (unint64_t)fetchEventCounterForEventName:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[HMDEventCounterGroupBridge queryDateBlock](self, "queryDateBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDEventCounterGroupBridge fetchEventCounterForEventName:forDate:](self, "fetchEventCounterForEventName:forDate:", v4, v6);

  return v7;
}

- (unint64_t)fetchEventCounterForEventName:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;

  v6 = a4;
  v7 = a3;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "valueForCounter:inDatePartition:", v7, v6);

  return v9;
}

- (double)durationForCounter:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventCounterGroupBridge queryDateBlock](self, "queryDateBlock");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "durationForCounter:inDatePartition:", v4, v7);
  v9 = v8;

  return v9;
}

- (double)durationForCounter:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v6 = a4;
  v7 = a3;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "durationForCounter:inDatePartition:", v7, v6);
  v10 = v9;

  return v10;
}

- (unint64_t)fetchMaxValueForStatisticsName:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  -[HMDEventCounterGroupBridge bridgedStatisticsGroup](self, "bridgedStatisticsGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventCounterGroupBridge queryDateBlock](self, "queryDateBlock");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statistics:inDatePartition:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "maxValue");
  return v9;
}

- (id)eventCounters
{
  void *v3;
  void (**v4)(void);
  void *v5;
  void *v6;

  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventCounterGroupBridge queryDateBlock](self, "queryDateBlock");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countersInDatePartition:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)eventCountersForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countersInDatePartition:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)summedEventCounters
{
  void *v3;
  void (**v4)(void);
  void *v5;
  unint64_t v6;

  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventCounterGroupBridge queryDateBlock](self, "queryDateBlock");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "sumOfCountersInDatePartition:", v5);

  return v6;
}

- (unint64_t)summedEventCountersForDate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sumOfCountersInDatePartition:", v4);

  return v6;
}

- (unint64_t)maxCounterName:(id *)a3
{
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__171105;
  v20 = __Block_byref_object_dispose__171106;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[HMDEventCounterGroupBridge bridgedCounterGroup](self, "bridgedCounterGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventCounterGroupBridge queryDateBlock](self, "queryDateBlock");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countersInDatePartition:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__HMDEventCounterGroupBridge_maxCounterName___block_invoke;
  v11[3] = &unk_1E89C22B8;
  v11[4] = &v12;
  v11[5] = &v16;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (HMMCounterGroup)bridgedCounterGroup
{
  return self->_bridgedCounterGroup;
}

- (id)statisticsGroupBlock
{
  return self->_statisticsGroupBlock;
}

- (id)queryDateBlock
{
  return self->_queryDateBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_queryDateBlock, 0);
  objc_storeStrong(&self->_statisticsGroupBlock, 0);
  objc_storeStrong((id *)&self->_bridgedCounterGroup, 0);
  objc_storeStrong((id *)&self->_bridgedStatisticsGroup, 0);
}

void __45__HMDEventCounterGroupBridge_maxCounterName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6;
  unint64_t v7;
  id v8;

  v8 = a2;
  v6 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v6 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
  }

}

id __97__HMDEventCounterGroupBridge_initWithContext_bridgedCounterGroup_groupDate_statisticsGroupBlock___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __100__HMDEventCounterGroupBridge_initWithContext_bridgedCounterGroup_dateProvider_statisticsGroupBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startOfDayByAddingDayCount:", -1);
}

@end
