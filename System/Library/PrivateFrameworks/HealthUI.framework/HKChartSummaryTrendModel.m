@implementation HKChartSummaryTrendModel

- (HKChartSummaryTrendModel)initWithTimeScopeTrends:(id)a3 selectTrendInitially:(BOOL)a4
{
  id v7;
  HKChartSummaryTrendModel *v8;
  HKChartSummaryTrendModel *v9;
  NSMutableArray *v10;
  NSMutableArray *observers;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKChartSummaryTrendModel;
  v8 = -[HKChartSummaryTrendModel init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_selectTrendInitially = a4;
    objc_storeStrong((id *)&v8->_timeScopeTrends, a3);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v9->_observers;
    v9->_observers = v10;

  }
  return v9;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  HKChartSummaryTrendModelObserverWrapper *v6;

  v4 = a3;
  v6 = objc_alloc_init(HKChartSummaryTrendModelObserverWrapper);
  -[HKChartSummaryTrendModelObserverWrapper setWeakObserver:](v6, "setWeakObserver:", v4);

  -[HKChartSummaryTrendModel observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (void)_notifyObserversTrendModelChanged
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HKChartSummaryTrendModel observers](self, "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "weakObserver");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "trendModelChanged");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)updateChartSummaryTrendModel:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *timeScopeTrends;

  v4 = a3;
  self->_selectTrendInitially = objc_msgSend(v4, "selectTrendInitially");
  objc_msgSend(v4, "timeScopeTrends");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (NSArray *)objc_msgSend(v5, "copy");
  timeScopeTrends = self->_timeScopeTrends;
  self->_timeScopeTrends = v6;

  -[HKChartSummaryTrendModel _notifyObserversTrendModelChanged](self, "_notifyObserversTrendModelChanged");
}

- (BOOL)isEqual:(id)a3
{
  HKChartSummaryTrendModel *v4;
  char v5;

  v4 = (HKChartSummaryTrendModel *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_selectTrendInitially == v4->_selectTrendInitially)
      v5 = -[NSArray isEqual:](self->_timeScopeTrends, "isEqual:", v4->_timeScopeTrends);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  _BOOL8 selectTrendInitially;

  selectTrendInitially = self->_selectTrendInitially;
  return -[NSArray hash](self->_timeScopeTrends, "hash") ^ selectTrendInitially;
}

- (BOOL)selectTrendInitially
{
  return self->_selectTrendInitially;
}

- (NSArray)timeScopeTrends
{
  return self->_timeScopeTrends;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_timeScopeTrends, 0);
}

@end
