@implementation DNDSLocationLifetimeMonitor

- (DNDSLocationLifetimeMonitor)initWithMeDeviceService:(id)a3
{
  id v5;
  DNDSLocationLifetimeMonitor *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  DNDSUntilExitLocationLifetimeMonitor *v10;
  DNDSUntilExitLocationLifetimeMonitor *untilExitMonitor;
  DNDSExplicitRegionLocationLifetimeMonitor *v12;
  DNDSExplicitRegionLocationLifetimeMonitor *explicitRegionMonitor;
  DNDSUntilExitLocationLifetimeMonitor *v14;
  uint64_t v15;
  NSArray *children;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v21[4];
  DNDSLocationLifetimeMonitor *v22;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DNDSLocationLifetimeMonitor;
  v6 = -[DNDSLocationLifetimeMonitor init](&v23, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.donotdisturb.server.LocationLifetimeMonitor", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_meDeviceService, a3);
    objc_msgSend(v5, "addListener:", v6);
    v10 = -[DNDSUntilExitLocationLifetimeMonitor initWithAggregateMonitor:]([DNDSUntilExitLocationLifetimeMonitor alloc], "initWithAggregateMonitor:", v6);
    untilExitMonitor = v6->_untilExitMonitor;
    v6->_untilExitMonitor = v10;

    v12 = -[DNDSExplicitRegionLocationLifetimeMonitor initWithAggregateMonitor:]([DNDSExplicitRegionLocationLifetimeMonitor alloc], "initWithAggregateMonitor:", v6);
    explicitRegionMonitor = v6->_explicitRegionMonitor;
    v6->_explicitRegionMonitor = v12;

    v14 = v6->_untilExitMonitor;
    v24[0] = v6->_explicitRegionMonitor;
    v24[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v15 = objc_claimAutoreleasedReturnValue();
    children = v6->_children;
    v6->_children = (NSArray *)v15;

    objc_msgSend(v5, "meDeviceState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "meDeviceStatus");

    if (v18 == 2)
    {
      v19 = v6->_queue;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __55__DNDSLocationLifetimeMonitor_initWithMeDeviceService___block_invoke;
      v21[3] = &unk_1E86A5970;
      v22 = v6;
      dispatch_sync(v19, v21);

    }
  }

  return v6;
}

void __55__DNDSLocationLifetimeMonitor_initWithMeDeviceService___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0C9E3C8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "dnd_locationBundle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithEffectiveBundlePath:delegate:onQueue:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

}

- (NSArray)activeLifetimeAssertionUUIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[DNDSExplicitRegionLocationLifetimeMonitor activeLifetimeAssertionUUIDs](self->_explicitRegionMonitor, "activeLifetimeAssertionUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSUntilExitLocationLifetimeMonitor activeLifetimeAssertionUUIDs](self->_untilExitMonitor, "activeLifetimeAssertionUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)refreshMonitorForDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__DNDSLocationLifetimeMonitor_refreshMonitorForDate___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __53__DNDSLocationLifetimeMonitor_refreshMonitorForDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshMonitorForDate:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)availableRegions
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[CLLocationManager monitoredRegions](self->_locationManager, "monitoredRegions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = ~v4 + -[DNDSUntilExitLocationLifetimeMonitor hasCurrentRegion](self->_untilExitMonitor, "hasCurrentRegion") + 20;

  return v5;
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_children;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "locationManager:monitoringDidFailForRegion:withError:", v8, v9, v10, (_QWORD)v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_children;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "locationManager:didDetermineState:forRegion:", v8, a4, v9, (_QWORD)v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_children;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "locationManager:didUpdateLocations:", v6, v7, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_children;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "locationManager:didFailWithError:", v6, v7, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)meDeviceService:(id)a3 didReceiveMeDeviceStateUpdate:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  DNDSLocationLifetimeMonitor *v10;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__DNDSLocationLifetimeMonitor_meDeviceService_didReceiveMeDeviceStateUpdate___block_invoke;
  block[3] = &unk_1E86A59E8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __77__DNDSLocationLifetimeMonitor_meDeviceService_didReceiveMeDeviceStateUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "meDeviceStatus");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 16);
  if (v2 != 2)
  {
    *(_QWORD *)(v3 + 16) = 0;
LABEL_6:

    return;
  }
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "dnd_locationBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundlePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithEffectiveBundlePath:delegate:onQueue:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = v8;

    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_queue_refreshMonitorForDate:", v12);
    v4 = (void *)v12;
    goto LABEL_6;
  }
}

- (void)_queue_refreshMonitorForDate:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[DNDSExplicitRegionLocationLifetimeMonitor refreshMonitorForDate:](self->_explicitRegionMonitor, "refreshMonitorForDate:", v5);
  -[DNDSUntilExitLocationLifetimeMonitor refreshMonitorForDate:](self->_untilExitMonitor, "refreshMonitorForDate:", v5);

}

- (DNDSLocationLifetimeMonitorDataSource)dataSource
{
  return (DNDSLocationLifetimeMonitorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (DNDSLifetimeMonitorDelegate)delegate
{
  return (DNDSLifetimeMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_explicitRegionMonitor, 0);
  objc_storeStrong((id *)&self->_untilExitMonitor, 0);
  objc_storeStrong((id *)&self->_meDeviceService, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
