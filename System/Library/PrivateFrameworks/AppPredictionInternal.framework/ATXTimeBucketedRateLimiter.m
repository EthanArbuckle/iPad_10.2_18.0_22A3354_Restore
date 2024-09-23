@implementation ATXTimeBucketedRateLimiter

- (BOOL)tryToIncrementCountAndReturnSuccess
{
  ATXTimeBucketedRateLimiter *v2;
  unint64_t countForCurrentBucket;
  unint64_t maxCount;
  BOOL v5;

  v2 = self;
  objc_sync_enter(v2);
  -[ATXTimeBucketedRateLimiter _resetBucketIfNeeded](v2, "_resetBucketIfNeeded");
  countForCurrentBucket = v2->_countForCurrentBucket;
  maxCount = v2->_maxCount;
  if (countForCurrentBucket != maxCount)
    v2->_countForCurrentBucket = countForCurrentBucket + 1;
  v5 = countForCurrentBucket != maxCount;
  objc_sync_exit(v2);

  return v5;
}

- (void)_resetBucketIfNeeded
{
  NSDate *endOfCurrentBucket;
  void *v4;
  NSDate *v5;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  id v9;

  endOfCurrentBucket = self->_endOfCurrentBucket;
  -[ATXTimeBucketedRateLimiter now](self, "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate earlierDate:](endOfCurrentBucket, "earlierDate:", v4);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v6 = self->_endOfCurrentBucket;

  if (v5 == v6)
  {
    self->_countForCurrentBucket = 0;
    -[ATXTimeBucketedRateLimiter now](self, "now");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", self->_period);
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v8 = self->_endOfCurrentBucket;
    self->_endOfCurrentBucket = v7;

  }
}

- (NSDate)now
{
  NSDate *now;

  now = self->_now;
  if (now)
    return now;
  else
    return (NSDate *)(id)objc_opt_new();
}

- (ATXTimeBucketedRateLimiter)initWithMaxCount:(unint64_t)a3 perPeriod:(double)a4
{
  ATXTimeBucketedRateLimiter *v6;
  ATXTimeBucketedRateLimiter *v7;
  uint64_t v8;
  NSDate *endOfCurrentBucket;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATXTimeBucketedRateLimiter;
  v6 = -[ATXTimeBucketedRateLimiter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_maxCount = a3;
    v6->_period = a4;
    v6->_countForCurrentBucket = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = objc_claimAutoreleasedReturnValue();
    endOfCurrentBucket = v7->_endOfCurrentBucket;
    v7->_endOfCurrentBucket = (NSDate *)v8;

  }
  return v7;
}

- (void)setNow:(id)a3
{
  objc_storeStrong((id *)&self->_now, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_endOfCurrentBucket, 0);
}

@end
