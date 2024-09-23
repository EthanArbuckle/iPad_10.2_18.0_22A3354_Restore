@implementation HKOverlayRoomApplicationItems

+ (HKOverlayRoomApplicationItems)applicationItemsWithItems:(id)a3
{
  id v3;
  HKOverlayRoomApplicationItems *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(HKOverlayRoomApplicationItems);
  objc_msgSend(v3, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setHealthStore:](v4, "setHealthStore:", v5);

  objc_msgSend(v3, "timeScopeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setTimeScopeController:](v4, "setTimeScopeController:", v6);

  objc_msgSend(v3, "dateCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setDateCache:](v4, "setDateCache:", v7);

  objc_msgSend(v3, "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setUnitController:](v4, "setUnitController:", v8);

  objc_msgSend(v3, "chartDataCacheController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setChartDataCacheController:](v4, "setChartDataCacheController:", v9);

  objc_msgSend(v3, "sampleTypeUpdateController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setSampleTypeUpdateController:](v4, "setSampleTypeUpdateController:", v10);

  objc_msgSend(v3, "sampleDateRangeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomApplicationItems setSampleDateRangeController:](v4, "setSampleDateRangeController:", v11);

  objc_msgSend(v3, "displayTypeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomApplicationItems setDisplayTypeController:](v4, "setDisplayTypeController:", v12);
  return v4;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKSelectedTimeScopeController)timeScopeController
{
  return self->_timeScopeController;
}

- (void)setTimeScopeController:(id)a3
{
  objc_storeStrong((id *)&self->_timeScopeController, a3);
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void)setDateCache:(id)a3
{
  objc_storeStrong((id *)&self->_dateCache, a3);
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
  objc_storeStrong((id *)&self->_unitController, a3);
}

- (HKChartDataCacheController)chartDataCacheController
{
  return self->_chartDataCacheController;
}

- (void)setChartDataCacheController:(id)a3
{
  objc_storeStrong((id *)&self->_chartDataCacheController, a3);
}

- (HKSampleTypeUpdateController)sampleTypeUpdateController
{
  return self->_sampleTypeUpdateController;
}

- (void)setSampleTypeUpdateController:(id)a3
{
  objc_storeStrong((id *)&self->_sampleTypeUpdateController, a3);
}

- (HKSampleTypeDateRangeController)sampleDateRangeController
{
  return self->_sampleDateRangeController;
}

- (void)setSampleDateRangeController:(id)a3
{
  objc_storeStrong((id *)&self->_sampleDateRangeController, a3);
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_sampleDateRangeController, 0);
  objc_storeStrong((id *)&self->_sampleTypeUpdateController, 0);
  objc_storeStrong((id *)&self->_chartDataCacheController, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_timeScopeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
