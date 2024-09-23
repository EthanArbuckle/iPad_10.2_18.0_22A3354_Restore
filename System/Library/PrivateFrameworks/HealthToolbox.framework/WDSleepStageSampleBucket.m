@implementation WDSleepStageSampleBucket

- (WDSleepStageSampleBucket)initWithSleepStage:(int64_t)a3 timePeriod:(id)a4 sourceRevision:(id)a5 device:(id)a6
{
  id v11;
  id v12;
  id v13;
  WDSleepStageSampleBucket *v14;
  WDSleepStageSampleBucket *v15;
  HKSortedSampleArray *v16;
  HKSortedSampleArray *sortedSamples;
  void *v18;
  objc_super v20;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WDSleepStageSampleBucket;
  v14 = -[WDSleepStageSampleBucket init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_sleepStage = a3;
    objc_storeStrong((id *)&v14->_timePeriod, a4);
    objc_storeStrong((id *)&v15->_sourceRevision, a5);
    objc_storeStrong((id *)&v15->_device, a6);
    v16 = (HKSortedSampleArray *)objc_alloc_init(MEMORY[0x24BDD3FB8]);
    sortedSamples = v15->_sortedSamples;
    v15->_sortedSamples = v16;

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3710], 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSortedSampleArray setSortDescriptor:](v15->_sortedSamples, "setSortDescriptor:", v18);

  }
  return v15;
}

- (void)addSample:(id)a3
{
  HKSortedSampleArray *sortedSamples;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  sortedSamples = self->_sortedSamples;
  v7 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSortedSampleArray insertSamples:](sortedSamples, "insertSamples:", v6, v7, v8);

}

- (void)removeSample:(id)a3
{
  -[HKSortedSampleArray removeSample:](self->_sortedSamples, "removeSample:", a3);
}

- (void)removeAllSamples
{
  -[HKSortedSampleArray removeAllSamples](self->_sortedSamples, "removeAllSamples");
}

- (NSArray)samples
{
  return (NSArray *)-[HKSortedSampleArray allSamples](self->_sortedSamples, "allSamples");
}

- (unint64_t)numberOfSamples
{
  return -[HKSortedSampleArray count](self->_sortedSamples, "count");
}

- (double)totalDuration
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HKSortedSampleArray allSamples](self->_sortedSamples, "allSamples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__WDSleepStageSampleBucket_totalDuration__block_invoke;
  v5[3] = &unk_24D38D300;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __41__WDSleepStageSampleBucket_totalDuration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double result;

  v3 = a2;
  objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v7 + *(double *)(v8 + 24);
  *(double *)(v8 + 24) = result;
  return result;
}

- (NSPredicate)predicate
{
  void *v3;
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
  void *v16;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3E88], "predicateForCategorySamplesWithOperatorType:value:", 4, self->_sleepStage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD3E88];
  -[WDTimePeriod startDate](self->_timePeriod, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDTimePeriod endDate](self->_timePeriod, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForSamplesWithStartDate:endDate:options:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD3E88];
  v9 = (void *)MEMORY[0x24BDBCF20];
  -[WDSleepStageSampleBucket sourceRevision](self, "sourceRevision");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForObjectsFromSources:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD14C0];
  v18[0] = v7;
  v18[1] = v3;
  v18[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v16;
}

- (HKDevice)device
{
  return self->_device;
}

- (int64_t)sleepStage
{
  return self->_sleepStage;
}

- (WDTimePeriod)timePeriod
{
  return self->_timePeriod;
}

- (HKSourceRevision)sourceRevision
{
  return self->_sourceRevision;
}

- (HKSortedSampleArray)sortedSamples
{
  return self->_sortedSamples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedSamples, 0);
  objc_storeStrong((id *)&self->_sourceRevision, 0);
  objc_storeStrong((id *)&self->_timePeriod, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (unint64_t)sortNumber
{
  int64_t v2;

  v2 = -[WDSleepStageSampleBucket sleepStage](self, "sleepStage");
  if ((unint64_t)(v2 - 1) > 4)
    return 0;
  else
    return qword_2158777F0[v2 - 1];
}

@end
