@implementation FCNetworkSession

- (FCNetworkSession)init
{
  FCNetworkSession *v2;
  uint64_t v3;
  NSMutableArray *eventGroups;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCNetworkSession;
  v2 = -[FCNetworkSession init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    eventGroups = v2->_eventGroups;
    v2->_eventGroups = (NSMutableArray *)v3;

  }
  return v2;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMutableArray valueForKeyPath:](self->_eventGroups, "valueForKeyPath:", CFSTR("startDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMutableArray valueForKeyPath:](self->_eventGroups, "valueForKeyPath:", CFSTR("endDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (unint64_t)totalSuccessCount
{
  void *v2;
  unint64_t v3;

  -[NSMutableArray valueForKeyPath:](self->_eventGroups, "valueForKeyPath:", CFSTR("@sum.successesCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)totalFailureCount
{
  void *v2;
  unint64_t v3;

  -[NSMutableArray valueForKeyPath:](self->_eventGroups, "valueForKeyPath:", CFSTR("@sum.failuresCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (id)generateSessionJSONDataWithOptions:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[NSMutableArray fc_arrayByTransformingWithBlock:](self->_eventGroups, "fc_arrayByTransformingWithBlock:", &__block_literal_global_179);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __61__FCNetworkSession_generateSessionJSONDataWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (void)addEventGroup:(id)a3
{
  -[NSMutableArray addObject:](self->_eventGroups, "addObject:", a3);
}

- (BOOL)wifiReachable
{
  return self->_wifiReachable;
}

- (void)setWifiReachable:(BOOL)a3
{
  self->_wifiReachable = a3;
}

- (int64_t)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

- (void)setCellularRadioAccessTechnology:(int64_t)a3
{
  self->_cellularRadioAccessTechnology = a3;
}

- (NSArray)eventGroups
{
  return &self->_eventGroups->super;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventGroups, 0);
}

@end
