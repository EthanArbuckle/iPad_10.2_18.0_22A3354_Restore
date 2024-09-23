@implementation __MNDepartureTimeSpentCondition

- (__MNDepartureTimeSpentCondition)initWithUpdater:(id)a3 timeThreshold:(double)a4
{
  id v6;
  __MNDepartureTimeSpentCondition *v7;
  __MNDepartureTimeSpentCondition *v8;
  __MNDepartureTimeSpentCondition *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)__MNDepartureTimeSpentCondition;
  v7 = -[__MNDepartureTimeSpentCondition init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_updater, v6);
    v8->_threshold = fmin(a4, 1.0);
    v9 = v8;
  }

  return v8;
}

- (double)scoreForLocation:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  NSDate *initialDate;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  double threshold;
  NSDate *v17;
  NSDate *v18;
  NSObject *v20;
  id v21;
  int v22;
  double v23;
  _DWORD v24[2];
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updater);

  v6 = -1.0;
  if (WeakRetained)
  {
    initialDate = self->_initialDate;
    if (initialDate)
    {
      -[NSDate timeIntervalSinceNow](initialDate, "timeIntervalSinceNow");
      v9 = v8;
      v10 = objc_loadWeakRetained((id *)&self->_updater);
      objc_msgSend(v10, "route");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "routeMatch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "segmentIndexForPointIndex:", objc_msgSend(v12, "routeCoordinate"));

      if (objc_msgSend(v4, "state") == 1)
      {
        v14 = objc_loadWeakRetained((id *)&self->_updater);
        v15 = objc_msgSend(v14, "arrivalWaypointLegIndex");

        if (v13 > v15)
        {
          threshold = self->_threshold;
          if (threshold <= -v9)
          {
            MNGetMNDepartureUpdaterLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = objc_loadWeakRetained((id *)&self->_updater);
              v22 = objc_msgSend(v21, "arrivalWaypointLegIndex");
              v23 = self->_threshold;
              v24[0] = 67109632;
              v24[1] = v22;
              v25 = 2048;
              v26 = -v9;
              v27 = 2048;
              v28 = v23;
              _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEFAULT, "Minimum time spent at intermediary waypoint arrival point completed. Leg: %d. Time (%0.1fm) > Required time (%0.1fm).", (uint8_t *)v24, 0x1Cu);

            }
            v6 = 1.0;
          }
          else
          {
            v6 = -v9 / threshold;
          }
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v18 = self->_initialDate;
      self->_initialDate = v17;

    }
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)CFSTR("__MNDepartureTimeSpentCondition");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_destroyWeak((id *)&self->_updater);
}

@end
