@implementation HMDRemoteEventRouterClientRetryIntervals

- (HMDRemoteEventRouterClientRetryIntervals)init
{
  return -[HMDRemoteEventRouterClientRetryIntervals initWithIntervals:](self, "initWithIntervals:", &unk_1E8B32268);
}

- (HMDRemoteEventRouterClientRetryIntervals)initWithIntervals:(id)a3
{
  id v4;
  HMDRemoteEventRouterClientRetryIntervals *v5;
  uint64_t v6;
  NSArray *intervals;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteEventRouterClientRetryIntervals;
  v5 = -[HMDRemoteEventRouterClientRetryIntervals init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    intervals = v5->_intervals;
    v5->_intervals = (NSArray *)v6;

  }
  return v5;
}

- (double)nextInterval
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  -[HMDRemoteEventRouterClientRetryIntervals intervals](self, "intervals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[HMDRemoteEventRouterClientRetryIntervals currentIndex](self, "currentIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v7 = -[HMDRemoteEventRouterClientRetryIntervals currentIndex](self, "currentIndex");
  -[HMDRemoteEventRouterClientRetryIntervals intervals](self, "intervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") - 1;

  if (v7 < v9)
    -[HMDRemoteEventRouterClientRetryIntervals setCurrentIndex:](self, "setCurrentIndex:", -[HMDRemoteEventRouterClientRetryIntervals currentIndex](self, "currentIndex") + 1);
  return v6;
}

- (void)reset
{
  -[HMDRemoteEventRouterClientRetryIntervals setCurrentIndex:](self, "setCurrentIndex:", 0);
}

- (NSArray)intervals
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_currentIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervals, 0);
}

+ (id)retryIntervalsForResidentClient
{
  return -[HMDRemoteEventRouterClientRetryIntervals initWithIntervals:]([HMDRemoteEventRouterClientRetryIntervals alloc], "initWithIntervals:", &unk_1E8B32280);
}

@end
