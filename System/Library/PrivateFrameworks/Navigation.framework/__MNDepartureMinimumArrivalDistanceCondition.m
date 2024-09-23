@implementation __MNDepartureMinimumArrivalDistanceCondition

- (__MNDepartureMinimumArrivalDistanceCondition)initWithUpdater:(id)a3 distanceThreshold:(double)a4
{
  id v6;
  __MNDepartureMinimumArrivalDistanceCondition *v7;
  __MNDepartureMinimumArrivalDistanceCondition *v8;
  __MNDepartureMinimumArrivalDistanceCondition *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)__MNDepartureMinimumArrivalDistanceCondition;
  v7 = -[__MNDepartureMinimumArrivalDistanceCondition init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_updater, v6);
    v8->_threshold = a4;
    v8->_closestDistanceToWaypoint = 1.79769313e308;
    v9 = v8;
  }

  return v8;
}

- (double)scoreForLocation:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  id v17;
  unint64_t v18;
  double closestDistanceToWaypoint;
  double threshold;
  NSObject *v21;
  id v22;
  int v23;
  double v24;
  double v25;
  int v27;
  _BYTE v28[14];
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updater);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_updater);
    objc_msgSend(v6, "arrivalLeg");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "coordinate");
    objc_msgSend(v7, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");

    GEOCalculateDistance();
    v10 = v9;
    if (v9 < self->_closestDistanceToWaypoint)
    {
      self->_closestDistanceToWaypoint = v9;
      MNGetMNDepartureUpdaterLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v27 = 134217984;
        *(double *)v28 = v10;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "Updating closest distance to waypoint: %g", (uint8_t *)&v27, 0xCu);
      }

    }
    v12 = objc_loadWeakRetained((id *)&self->_updater);
    objc_msgSend(v12, "route");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routeMatch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "segmentIndexForPointIndex:", objc_msgSend(v14, "routeCoordinate"));

    v16 = -1.0;
    if (objc_msgSend(v4, "state") == 1)
    {
      v17 = objc_loadWeakRetained((id *)&self->_updater);
      v18 = objc_msgSend(v17, "arrivalWaypointLegIndex");

      if (v15 > v18)
      {
        closestDistanceToWaypoint = self->_closestDistanceToWaypoint;
        threshold = self->_threshold;
        if (closestDistanceToWaypoint <= threshold)
        {
          MNGetMNDepartureUpdaterLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_loadWeakRetained((id *)&self->_updater);
            v23 = objc_msgSend(v22, "arrivalWaypointLegIndex");
            v24 = self->_closestDistanceToWaypoint;
            v25 = self->_threshold;
            v27 = 67109632;
            *(_DWORD *)v28 = v23;
            *(_WORD *)&v28[4] = 2048;
            *(double *)&v28[6] = v24;
            v29 = 2048;
            v30 = v25;
            _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_DEFAULT, "Minimum distance to intermediary waypoint arrival point completed. Leg: %d. Distance (%0.1fm) < Required distance (%0.1fm).", (uint8_t *)&v27, 0x1Cu);

          }
          v16 = 1.0;
        }
        else
        {
          v16 = threshold / closestDistanceToWaypoint;
        }
      }
    }

  }
  else
  {
    v16 = -1.0;
  }

  return v16;
}

- (NSString)name
{
  return (NSString *)CFSTR("__MNDepartureMinimumArrivalDistanceCondition");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updater);
}

@end
