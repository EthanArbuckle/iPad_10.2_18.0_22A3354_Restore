@implementation __MNDepartureMinimumDepartureDistanceCondition

- (__MNDepartureMinimumDepartureDistanceCondition)initWithUpdater:(id)a3 arrivalPoints:(id)a4 distanceThreshold:(double)a5
{
  id v8;
  id v9;
  __MNDepartureMinimumDepartureDistanceCondition *v10;
  __MNDepartureMinimumDepartureDistanceCondition *v11;
  __MNDepartureMinimumDepartureDistanceCondition *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)__MNDepartureMinimumDepartureDistanceCondition;
  v10 = -[__MNDepartureMinimumDepartureDistanceCondition init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_updater, v8);
    objc_storeStrong((id *)&v11->_arrivalPoints, a4);
    v11->_threshold = a5;
    v12 = v11;
  }

  return v11;
}

- (__MNDepartureMinimumDepartureDistanceCondition)initWithUpdater:(id)a3 distanceThreshold:(double)a4
{
  return -[__MNDepartureMinimumDepartureDistanceCondition initWithUpdater:arrivalPoints:distanceThreshold:](self, "initWithUpdater:arrivalPoints:distanceThreshold:", a3, 0, a4);
}

- (double)scoreForLocation:(id)a3
{
  id v4;
  MNDepartureUpdater **p_updater;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSArray *arrivalPoints;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  id v30;
  int v31;
  double threshold;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_updater = &self->_updater;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updater);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_updater);
    objc_msgSend(v7, "arrivalLeg");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "coordinate");
    v9 = objc_loadWeakRetained((id *)&self->_updater);
    objc_msgSend(v9, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointAt:", objc_msgSend(v8, "endPointIndex"));

    arrivalPoints = self->_arrivalPoints;
    if (arrivalPoints)
    {
      threshold = self->_threshold;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v12 = arrivalPoints;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v35;
        v16 = 0.0;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v35 != v15)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v18, "point");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "lat");
            objc_msgSend(v18, "point");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "lng");

            GEOCalculateDistance();
            if (v21 > v16)
            {
              v22 = v21;
              GEOCalculateDistance();
              threshold = v23 + self->_threshold;
              v16 = v22;
            }
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        }
        while (v14);
      }
      else
      {
        v16 = 0.0;
      }

      v28 = threshold;
    }
    else
    {
      objc_msgSend(v8, "destination");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "coordinate");

      GEOCalculateDistance();
      v16 = v26;
      GEOCalculateDistance();
      v28 = v27 + self->_threshold;
    }
    if (v16 >= v28)
    {
      MNGetMNDepartureUpdaterLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_loadWeakRetained((id *)p_updater);
        v31 = objc_msgSend(v30, "arrivalWaypointLegIndex");
        *(_DWORD *)buf = 67109632;
        v39 = v31;
        v40 = 2048;
        v41 = v16;
        v42 = 2048;
        v43 = v28;
        _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_DEFAULT, "Minimum deviation from intermediary waypoint detected. Leg: %d. Distance (%0.1fm) > Required distance (%0.1fm).", buf, 0x1Cu);

      }
      v24 = 1.0;
    }
    else
    {
      v24 = v16 / v28;
    }

  }
  else
  {
    v24 = -1.0;
  }

  return v24;
}

- (NSString)name
{
  return (NSString *)CFSTR("__MNDepartureMinimumDepartureDistanceCondition");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalPoints, 0);
  objc_destroyWeak((id *)&self->_updater);
}

@end
