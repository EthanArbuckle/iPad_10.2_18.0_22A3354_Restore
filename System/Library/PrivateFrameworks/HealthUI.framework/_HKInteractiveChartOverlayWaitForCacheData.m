@implementation _HKInteractiveChartOverlayWaitForCacheData

- (_HKInteractiveChartOverlayWaitForCacheData)initWithOverlayController:(id)a3
{
  id v4;
  _HKInteractiveChartOverlayWaitForCacheData *v5;
  _HKInteractiveChartOverlayWaitForCacheData *v6;
  NSMutableArray *v7;
  NSMutableArray *waitForDataSources;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HKInteractiveChartOverlayWaitForCacheData;
  v5 = -[_HKInteractiveChartOverlayWaitForCacheData init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_HKInteractiveChartOverlayWaitForCacheData setOverlayController:](v5, "setOverlayController:", v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    waitForDataSources = v6->_waitForDataSources;
    v6->_waitForDataSources = v7;

  }
  return v6;
}

- (void)addWaitForDataSource:(id)a3 graphSeriesContext:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 priorityDelegate:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _HKInteractiveChartOverlayWaitForDataSource *v21;
  _HKInteractiveChartOverlayWaitForDataSource *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  -[_HKInteractiveChartOverlayWaitForCacheData _findDataSource:](self, "_findDataSource:", v25);
  v21 = (_HKInteractiveChartOverlayWaitForDataSource *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v22 = [_HKInteractiveChartOverlayWaitForDataSource alloc];
    -[_HKInteractiveChartOverlayWaitForCacheData overlayController](self, "overlayController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_HKInteractiveChartOverlayWaitForDataSource initWithOverlayController:dataSource:parent:](v22, "initWithOverlayController:dataSource:parent:", v23, v25, self);

    -[_HKInteractiveChartOverlayWaitForCacheData waitForDataSources](self, "waitForDataSources");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v21);

  }
  -[_HKInteractiveChartOverlayWaitForDataSource addWaitForDataGraphSeriesContext:timeScope:resolution:startDate:endDate:priorityDelegate:completion:](v21, "addWaitForDataGraphSeriesContext:timeScope:resolution:startDate:endDate:priorityDelegate:completion:", v16, a5, a6, v17, v18, v19, v20);

}

- (id)_findDataSource:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_HKInteractiveChartOverlayWaitForCacheData waitForDataSources](self, "waitForDataSources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "dataSource");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeWaitForDataSource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_HKInteractiveChartOverlayWaitForCacheData waitForDataSources](self, "waitForDataSources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (HKInteractiveChartOverlayViewController)overlayController
{
  return (HKInteractiveChartOverlayViewController *)objc_loadWeakRetained((id *)&self->_overlayController);
}

- (void)setOverlayController:(id)a3
{
  objc_storeWeak((id *)&self->_overlayController, a3);
}

- (NSMutableArray)waitForDataSources
{
  return self->_waitForDataSources;
}

- (void)setWaitForDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_waitForDataSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForDataSources, 0);
  objc_destroyWeak((id *)&self->_overlayController);
}

@end
