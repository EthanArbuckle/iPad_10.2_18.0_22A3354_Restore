@implementation _HKSleepStageBucket

- (_HKSleepStageBucket)initWithBucketSize:(double)a3 distanceFromStart:(double)a4 startOfSleep:(id)a5 numberOfDays:(int64_t)a6
{
  id v11;
  _HKSleepStageBucket *v12;
  _HKSleepStageBucket *v13;
  uint64_t v14;
  NSMutableDictionary *sleepStageCounts;
  objc_super v17;

  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HKSleepStageBucket;
  v12 = -[_HKSleepStageBucket init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_bucketSize = a3;
    v12->_distanceFromStart = a4;
    objc_storeStrong((id *)&v12->_startOfSleep, a5);
    v13->_numberOfDays = a6;
    v13->_hasSleepStagesData = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    sleepStageCounts = v13->_sleepStageCounts;
    v13->_sleepStageCounts = (NSMutableDictionary *)v14;

  }
  return v13;
}

+ (id)bucketsWithSize:(double)a3 startOfSleep:(id)a4 maxSleepDuration:(double)a5 numberOfDays:(int64_t)a6
{
  id v9;
  void *v10;
  double v11;
  _HKSleepStageBucket *v12;
  void *v13;

  v9 = a4;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 > 0.0)
    {
      v11 = 0.0;
      do
      {
        v12 = -[_HKSleepStageBucket initWithBucketSize:distanceFromStart:startOfSleep:numberOfDays:]([_HKSleepStageBucket alloc], "initWithBucketSize:distanceFromStart:startOfSleep:numberOfDays:", v9, a6, a3, v11);
        objc_msgSend(v10, "addObject:", v12);

        v11 = v11 + a3;
      }
      while (v11 < a5);
    }
    v13 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (void)updateWithSegment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((unint64_t)(objc_msgSend(v10, "category") - 1) <= 4)
  {
    -[_HKSleepStageBucket setHasSleepStagesData:](self, "setHasSleepStagesData:", 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "category"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSleepStageBucket sleepStageCounts](self, "sleepStageCounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    -[_HKSleepStageBucket sleepStageCounts](self, "sleepStageCounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v4);

  }
}

- (id)probableSleepPeriodSegment
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if ((unint64_t)(-[_HKSleepStageBucket _probableSleepStage](self, "_probableSleepStage") - 1) > 4)
  {
    v7 = 0;
  }
  else
  {
    -[_HKSleepStageBucket startOfSleep](self, "startOfSleep");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSleepStageBucket distanceFromStart](self, "distanceFromStart");
    objc_msgSend(v3, "dateByAddingTimeInterval:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[_HKSleepStageBucket bucketSize](self, "bucketSize");
    v6 = (void *)objc_msgSend(v5, "initWithStartDate:duration:", v4);
    objc_msgSend(MEMORY[0x1E0CB6C00], "sleepPeriodSegmentWithDateInterval:category:", v6, -[_HKSleepStageBucket _probableSleepStage](self, "_probableSleepStage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (int64_t)_probableSleepStage
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[_HKSleepStageBucket sleepStageCounts](self, "sleepStageCounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keysSortedByValueUsingComparator:", &__block_literal_global_28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "integerValue");
  return v5;
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (double)distanceFromStart
{
  return self->_distanceFromStart;
}

- (NSDate)startOfSleep
{
  return self->_startOfSleep;
}

- (int64_t)numberOfDays
{
  return self->_numberOfDays;
}

- (BOOL)hasSleepStagesData
{
  return self->_hasSleepStagesData;
}

- (void)setHasSleepStagesData:(BOOL)a3
{
  self->_hasSleepStagesData = a3;
}

- (NSMutableDictionary)sleepStageCounts
{
  return self->_sleepStageCounts;
}

- (void)setSleepStageCounts:(id)a3
{
  objc_storeStrong((id *)&self->_sleepStageCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStageCounts, 0);
  objc_storeStrong((id *)&self->_startOfSleep, 0);
}

@end
