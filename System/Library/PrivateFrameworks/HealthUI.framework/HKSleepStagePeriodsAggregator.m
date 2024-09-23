@implementation HKSleepStagePeriodsAggregator

- (HKSleepStagePeriodsAggregator)initWithSleepDaySummaries:(id)a3 bucketSize:(double)a4 summaryDateInterval:(id)a5
{
  id v9;
  id v10;
  HKSleepStagePeriodsAggregator *v11;
  HKSleepStagePeriodsAggregator *v12;
  double v13;
  uint64_t v14;
  NSDate *startDate;
  uint64_t v16;
  NSArray *buckets;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKSleepStagePeriodsAggregator;
  v11 = -[HKSleepStagePeriodsAggregator init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sleepDaySummaries, a3);
    objc_msgSend((id)objc_opt_class(), "_maximumDurationFromSleepDaySummaries:", v9);
    v12->_maximumDuration = v13;
    objc_msgSend((id)objc_opt_class(), "_averageStartDateFromSleepDaySummaries:summaryDateInterval:", v9, v10);
    v14 = objc_claimAutoreleasedReturnValue();
    startDate = v12->_startDate;
    v12->_startDate = (NSDate *)v14;

    +[_HKSleepStageBucket bucketsWithSize:startOfSleep:maxSleepDuration:numberOfDays:](_HKSleepStageBucket, "bucketsWithSize:startOfSleep:maxSleepDuration:numberOfDays:", v12->_startDate, objc_msgSend(v9, "count"), a4, v12->_maximumDuration);
    v16 = objc_claimAutoreleasedReturnValue();
    buckets = v12->_buckets;
    v12->_buckets = (NSArray *)v16;

  }
  return v12;
}

- (id)aggregateSleepPeriods
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[HKSleepStagePeriodsAggregator sleepDaySummaries](self, "sleepDaySummaries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return MEMORY[0x1E0C9AA60];
  -[HKSleepStagePeriodsAggregator _aggregateSleepPeriodSegments](self, "_aggregateSleepPeriodSegments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[HKSleepStagePeriodsAggregator _aggregateSleepInterval](self, "_aggregateSleepInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6BF8], "sleepPeriodWithDateInterval:segments:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)_aggregateSleepInterval
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[HKSleepStagePeriodsAggregator startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[HKSleepStagePeriodsAggregator startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStagePeriodsAggregator maximumDuration](self, "maximumDuration");
    v6 = (void *)objc_msgSend(v4, "initWithStartDate:duration:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_aggregateSleepPeriodSegments
{
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t j;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  void *v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[HKSleepStagePeriodsAggregator sleepDaySummaries](self, "sleepDaySummaries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v50 != v31)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v4, "hui_startOfSleep");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          v33 = i;
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v4, "periods");
          v34 = (id)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
          if (v36)
          {
            v35 = *(_QWORD *)v46;
            do
            {
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v46 != v35)
                  objc_enumerationMutation(v34);
                v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
                v41 = 0u;
                v42 = 0u;
                v43 = 0u;
                v44 = 0u;
                objc_msgSend(v7, "segments");
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
                if (v9)
                {
                  v10 = v9;
                  v11 = *(_QWORD *)v42;
                  do
                  {
                    for (k = 0; k != v10; ++k)
                    {
                      if (*(_QWORD *)v42 != v11)
                        objc_enumerationMutation(v8);
                      v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
                      objc_msgSend(v13, "dateInterval");
                      v14 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "startDate");
                      v15 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v15, "timeIntervalSinceDate:", v5);
                      v17 = v16;

                      v18 = -[HKSleepStagePeriodsAggregator _bucketIndexForDistanceFromStart:](self, "_bucketIndexForDistanceFromStart:", v17);
                      -[HKSleepStagePeriodsAggregator buckets](self, "buckets");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "objectAtIndexedSubscript:", v18);
                      v20 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v20, "updateWithSegment:", v13);
                    }
                    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
                  }
                  while (v10);
                }

              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
            }
            while (v36);
          }

          i = v33;
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v32);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[HKSleepStagePeriodsAggregator buckets](self, "buckets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * m), "probableSleepPeriodSegment");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v21, "addObject:", v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v24);
  }

  v28 = (void *)objc_msgSend(v21, "copy");
  return v28;
}

- (int64_t)_bucketIndexForDistanceFromStart:(double)a3
{
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  -[HKSleepStagePeriodsAggregator buckets](self, "buckets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)objc_msgSend(v5, "count") * a3;
  -[HKSleepStagePeriodsAggregator maximumDuration](self, "maximumDuration");
  v8 = vcvtpd_s64_f64(v6 / v7);

  -[HKSleepStagePeriodsAggregator buckets](self, "buckets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") - 1;

  if (v10 >= v8)
    return v8;
  else
    return v10;
}

+ (double)_maximumDurationFromSleepDaySummaries:(id)a3
{
  id v3;
  double v4;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v7 = 0;
    v8 = (double *)&v7;
    v9 = 0x2020000000;
    v10 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__HKSleepStagePeriodsAggregator__maximumDurationFromSleepDaySummaries___block_invoke;
    v6[3] = &unk_1E9C42188;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
    v4 = v8[3];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

uint64_t __71__HKSleepStagePeriodsAggregator__maximumDurationFromSleepDaySummaries___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "hui_durationOfSleep");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

+ (id)_averageStartDateFromSleepDaySummaries:(id)a3 summaryDateInterval:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v21;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((objc_msgSend(v14, "hasSleepStageData", (_QWORD)v20) & 1) == 0)
          {
            objc_msgSend(v14, "unspecifiedSleepDuration");
            if (v15 == 0.0)
              continue;
          }
          objc_msgSend(v14, "hui_startOfSleepOffset");
          v12 = v12 + v16;
          ++v10;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
      v12 = 0.0;
    }

    objc_msgSend(v6, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateByAddingTimeInterval:", v12 / (double)v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSArray)sleepDaySummaries
{
  return self->_sleepDaySummaries;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (NSArray)buckets
{
  return self->_buckets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sleepDaySummaries, 0);
}

@end
