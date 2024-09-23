@implementation FCUserEventHistoryAggregateStoreData

- (FCUserEventHistoryAggregateStoreData)init
{
  FCUserEventHistoryAggregateStoreData *v2;
  uint64_t v3;
  FCUserEventHistoryAggregateCounts *aggregateCounts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCUserEventHistoryAggregateStoreData;
  v2 = -[FCUserEventHistoryAggregateStoreData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    aggregateCounts = v2->_aggregateCounts;
    v2->_aggregateCounts = (FCUserEventHistoryAggregateCounts *)v3;

  }
  return v2;
}

+ (FCUserEventHistoryAggregateStoreData)empty
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setBaselineTimestamp:", -1);
  objc_msgSend(v2, "setBaselineStatelessEventCount:", -1);
  objc_msgSend(v2, "setBaselineTotalEventCount:", -1);
  +[FCUserEventHistoryAggregateCounts empty](FCUserEventHistoryAggregateCounts, "empty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAggregateCounts:", v3);

  return (FCUserEventHistoryAggregateStoreData *)v2;
}

- (int64_t)baselineTimestamp
{
  return self->_baselineTimestamp;
}

- (void)setBaselineTimestamp:(int64_t)a3
{
  self->_baselineTimestamp = a3;
}

- (int64_t)baselineStatelessEventCount
{
  return self->_baselineStatelessEventCount;
}

- (void)setBaselineStatelessEventCount:(int64_t)a3
{
  self->_baselineStatelessEventCount = a3;
}

- (int64_t)baselineTotalEventCount
{
  return self->_baselineTotalEventCount;
}

- (void)setBaselineTotalEventCount:(int64_t)a3
{
  self->_baselineTotalEventCount = a3;
}

- (FCUserEventHistoryAggregateCounts)aggregateCounts
{
  return self->_aggregateCounts;
}

- (void)setAggregateCounts:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateCounts, 0);
}

@end
