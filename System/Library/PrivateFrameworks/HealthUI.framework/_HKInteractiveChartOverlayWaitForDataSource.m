@implementation _HKInteractiveChartOverlayWaitForDataSource

- (_HKInteractiveChartOverlayWaitForDataSource)initWithOverlayController:(id)a3 dataSource:(id)a4 parent:(id)a5
{
  id v8;
  id v9;
  id v10;
  _HKInteractiveChartOverlayWaitForDataSource *v11;
  _HKInteractiveChartOverlayWaitForDataSource *v12;
  id v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_HKInteractiveChartOverlayWaitForDataSource;
  v11 = -[_HKInteractiveChartOverlayWaitForDataSource init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[_HKInteractiveChartOverlayWaitForDataSource setOverlayController:](v11, "setOverlayController:", v8);
    -[_HKInteractiveChartOverlayWaitForDataSource setParent:](v12, "setParent:", v10);
    objc_storeStrong((id *)&v12->_dataSource, a4);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_HKInteractiveChartOverlayWaitForDataSource setDeliveries:](v12, "setDeliveries:", v13);

    objc_msgSend(v9, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKInteractiveChartOverlayWaitForDataSource setPreviousDelegate:](v12, "setPreviousDelegate:", v14);

    objc_msgSend(v9, "setDelegate:", v12);
  }

  return v12;
}

- (void)addWaitForDataGraphSeriesContext:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 priorityDelegate:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _HKInteractiveChartOverlayDeliverCachedData *v20;
  void *v21;
  void *v22;
  void *v23;
  _HKInteractiveChartOverlayDeliverCachedData *v25;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  v20 = [_HKInteractiveChartOverlayDeliverCachedData alloc];
  -[_HKInteractiveChartOverlayWaitForDataSource overlayController](self, "overlayController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKInteractiveChartOverlayWaitForDataSource dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[_HKInteractiveChartOverlayDeliverCachedData initWithOverlayController:dataSource:graphSeriesContext:timeScope:resolution:startDate:endDate:completion:](v20, "initWithOverlayController:dataSource:graphSeriesContext:timeScope:resolution:startDate:endDate:completion:", v21, v22, v19, a4, a5, v18, v17, v15);

  -[_HKInteractiveChartOverlayWaitForDataSource deliveries](self, "deliveries");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v25);

  -[_HKInteractiveChartOverlayWaitForDataSource _requestDataForTimeScope:resolution:startDate:endDate:priorityDelegate:](self, "_requestDataForTimeScope:resolution:startDate:endDate:priorityDelegate:", a4, a5, v18, v17, v16);
}

- (void)_requestDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 priorityDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v12 = a5;
  v13 = a6;
  v26 = 0uLL;
  v27 = 0;
  v14 = a7;
  -[_HKInteractiveChartOverlayWaitForDataSource dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "blockPathForX:zoom:resolution:", v12, a3, a4);
  }
  else
  {
    v26 = 0uLL;
    v27 = 0;
  }

  v24 = 0uLL;
  v25 = 0;
  -[_HKInteractiveChartOverlayWaitForDataSource dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "blockPathForX:zoom:resolution:", v13, a3, a4);
  }
  else
  {
    v24 = 0uLL;
    v25 = 0;
  }

  -[_HKInteractiveChartOverlayWaitForDataSource dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v26;
  v23 = v27;
  v20 = v24;
  v21 = v25;
  objc_msgSend(v19, "blocksRequestedFromPath:toPath:priorityDelegate:", &v22, &v20, v14);

}

- (void)dataSourceDidUpdateCache:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[_HKInteractiveChartOverlayWaitForDataSource deliveries](self, "deliveries", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v12, "deliverDataToCompletion", (_QWORD)v22))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  -[_HKInteractiveChartOverlayWaitForDataSource deliveries](self, "deliveries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectsInArray:", v6);

  -[_HKInteractiveChartOverlayWaitForDataSource deliveries](self, "deliveries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    -[_HKInteractiveChartOverlayWaitForDataSource previousDelegate](self, "previousDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKInteractiveChartOverlayWaitForDataSource dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v16);

    -[_HKInteractiveChartOverlayWaitForDataSource previousDelegate](self, "previousDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[_HKInteractiveChartOverlayWaitForDataSource previousDelegate](self, "previousDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKInteractiveChartOverlayWaitForDataSource dataSource](self, "dataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataSourceDidUpdateCache:", v20);

    }
    -[_HKInteractiveChartOverlayWaitForDataSource parent](self, "parent", (_QWORD)v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeWaitForDataSource:", self);

  }
}

- (HKGraphSeriesDataSource)dataSource
{
  return self->_dataSource;
}

- (HKInteractiveChartOverlayViewController)overlayController
{
  return (HKInteractiveChartOverlayViewController *)objc_loadWeakRetained((id *)&self->_overlayController);
}

- (void)setOverlayController:(id)a3
{
  objc_storeWeak((id *)&self->_overlayController, a3);
}

- (_HKInteractiveChartOverlayWaitForCacheData)parent
{
  return (_HKInteractiveChartOverlayWaitForCacheData *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (HKGraphSeriesDataSourceDelegate)previousDelegate
{
  return self->_previousDelegate;
}

- (void)setPreviousDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_previousDelegate, a3);
}

- (NSMutableArray)deliveries
{
  return self->_deliveries;
}

- (void)setDeliveries:(id)a3
{
  objc_storeStrong((id *)&self->_deliveries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveries, 0);
  objc_storeStrong((id *)&self->_previousDelegate, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_overlayController);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
