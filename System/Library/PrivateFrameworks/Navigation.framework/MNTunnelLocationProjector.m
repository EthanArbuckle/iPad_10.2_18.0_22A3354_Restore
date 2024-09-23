@implementation MNTunnelLocationProjector

- (MNTunnelLocationProjector)init
{
  MNTunnelLocationProjector *v2;
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNTunnelLocationProjector;
  v2 = -[MNTunnelLocationProjector init](&v5, sel_init);
  if (v2)
  {
    GEOConfigGetDouble();
    v2->_locationOverdueTimeoutForTunnel = v3;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MNTunnelLocationProjector stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)MNTunnelLocationProjector;
  -[MNTunnelLocationProjector dealloc](&v3, sel_dealloc);
}

- (void)updateLocation:(id)a3
{
  id v5;
  NSObject *v6;
  NSDate *v7;
  void *lastUnprojectedLocationDate;
  MNLocation *lastUnprojectedLocation;
  NSDate *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isProjected") & 1) == 0)
  {
    if (self->_isProjecting)
    {
      MNGetMNTunnelProjectorLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "Stopping projection because of new location: %@", (uint8_t *)&v11, 0xCu);
      }

    }
    self->_isProjecting = 0;
    -[MNTunnelLocationProjector _resetTimerWithTimeout:](self, "_resetTimerWithTimeout:", self->_locationOverdueTimeoutForTunnel);
    if (objc_msgSend(v5, "state") == 1)
    {
      objc_storeStrong((id *)&self->_lastUnprojectedLocation, a3);
      +[MNTimeManager currentDate](MNTimeManager, "currentDate");
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastUnprojectedLocationDate = self->_lastUnprojectedLocationDate;
      self->_lastUnprojectedLocationDate = v7;
    }
    else
    {
      lastUnprojectedLocation = self->_lastUnprojectedLocation;
      self->_lastUnprojectedLocation = 0;

      v10 = self->_lastUnprojectedLocationDate;
      self->_lastUnprojectedLocationDate = 0;

      -[NSTimer invalidate](self->_locationUpdateOverdueTimer, "invalidate");
      lastUnprojectedLocationDate = self->_locationUpdateOverdueTimer;
      self->_locationUpdateOverdueTimer = 0;
    }

  }
}

- (void)updateForRouteInfo:(id)a3
{
  MNActiveRouteInfo *currentRouteInfo;
  void *v6;
  void *v7;
  char v8;
  NSArray *tunnelRanges;
  id v10;

  v10 = a3;
  currentRouteInfo = self->_currentRouteInfo;
  if (!currentRouteInfo
    || (-[MNActiveRouteInfo routeID](currentRouteInfo, "routeID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "routeID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    -[MNTunnelLocationProjector stop](self, "stop");
    objc_storeStrong((id *)&self->_currentRouteInfo, a3);
    tunnelRanges = self->_tunnelRanges;
    self->_tunnelRanges = 0;

  }
}

- (void)stop
{
  MNActiveRouteInfo *currentRouteInfo;
  NSArray *tunnelRanges;
  MNLocation *lastUnprojectedLocation;
  NSDate *lastUnprojectedLocationDate;
  NSTimer *locationUpdateOverdueTimer;

  currentRouteInfo = self->_currentRouteInfo;
  self->_currentRouteInfo = 0;

  tunnelRanges = self->_tunnelRanges;
  self->_tunnelRanges = 0;

  lastUnprojectedLocation = self->_lastUnprojectedLocation;
  self->_lastUnprojectedLocation = 0;

  lastUnprojectedLocationDate = self->_lastUnprojectedLocationDate;
  self->_lastUnprojectedLocationDate = 0;

  -[NSTimer invalidate](self->_locationUpdateOverdueTimer, "invalidate");
  locationUpdateOverdueTimer = self->_locationUpdateOverdueTimer;
  self->_locationUpdateOverdueTimer = 0;

  self->_isProjecting = 0;
}

- (GEOPolylineCoordinateRange)_tunnelRangeForRouteCoordinate:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  PolylineCoordinate v10;
  PolylineCoordinate v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  GEOPolylineCoordinateRange result;

  v18 = *MEMORY[0x1E0C80C00];
  if (!GEOPolylineCoordinateIsInvalid())
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[MNTunnelLocationProjector _tunnelRanges](self, "_tunnelRanges", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
          v16 = 0uLL;
          objc_msgSend(v9, "getValue:", &v16);
          if (GEOPolylineCoordinateRangeIsValid() && (GEOPolylineCoordinateInRange() & 1) != 0)
          {

            goto LABEL_14;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  v16 = *MEMORY[0x1E0D26A88];
LABEL_14:
  v11 = (PolylineCoordinate)*((_QWORD *)&v16 + 1);
  v10 = (PolylineCoordinate)v16;
  result.end = v11;
  result.start = v10;
  return result;
}

- (id)_tunnelRanges
{
  NSArray *tunnelRanges;
  NSArray **p_tunnelRanges;
  MNActiveRouteInfo *currentRouteInfo;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_tunnelRanges = &self->_tunnelRanges;
  tunnelRanges = self->_tunnelRanges;
  if (tunnelRanges)
    return tunnelRanges;
  currentRouteInfo = self->_currentRouteInfo;
  if (currentRouteInfo)
  {
    v18 = (id *)p_tunnelRanges;
    -[MNActiveRouteInfo route](currentRouteInfo, "route");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v6, "cameraInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v12, "styleAttributes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "attributes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "key") == 65639)
          {
            v20 = 0;
            v21 = 0;
            v20 = objc_msgSend(v12, "routeCoordinateRange");
            v21 = v16;
            v20 = objc_msgSend(v6, "routeCoordinateForDistance:beforeRouteCoordinate:", v20, 100.0);
            objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v20, "{GEOPolylineCoordinateRange={?=If}{?=If}}");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v17);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    objc_storeStrong(v18, v19);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (void)_resetTimerWithTimeout:(double)a3
{
  void *v5;
  double v6;
  double v7;
  NSTimer *v8;
  NSTimer *locationUpdateOverdueTimer;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeScale");
  v7 = a3 / v6;

  -[NSTimer invalidate](self->_locationUpdateOverdueTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__locationUpdateOverdueTimerFired_, 0, 0, v7);
  v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  locationUpdateOverdueTimer = self->_locationUpdateOverdueTimer;
  self->_locationUpdateOverdueTimer = v8;

}

- (void)_locationUpdateOverdueTimerFired:(id)a3
{
  id v4;
  MNLocation *lastUnprojectedLocation;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id WeakRetained;
  void *v42;
  NSObject *v43;
  char *v44;
  void *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  _BYTE v51[18];
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lastUnprojectedLocation = self->_lastUnprojectedLocation;
  if (lastUnprojectedLocation
    && self->_lastUnprojectedLocationDate
    && self->_currentRouteInfo
    && -[MNLocation state](lastUnprojectedLocation, "state") == 1
    && (-[MNLocation routeMatch](self->_lastUnprojectedLocation, "routeMatch"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[MNTunnelLocationProjector _tunnelRangeForRouteCoordinate:](self, "_tunnelRangeForRouteCoordinate:", objc_msgSend(v6, "routeCoordinate")), v9 = v8, v6, !GEOPolylineCoordinateRangeIsInvalid()))
  {
    +[MNTimeManager currentDate](MNTimeManager, "currentDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", self->_lastUnprojectedLocationDate);
    v12 = v11;

    if (v12 < 0.0)
    {
      GEOFindOrCreateLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v47 = "-[MNTunnelLocationProjector _locationUpdateOverdueTimerFired:]";
        v48 = 2080;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTunnelLocationProjector.m";
        v50 = 1024;
        *(_DWORD *)v51 = 186;
        *(_WORD *)&v51[4] = 2080;
        *(_QWORD *)&v51[6] = "timeInterval >= 0";
        _os_log_impl(&dword_1B0AD7000, v43, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
      }

    }
    if (v12 >= 0.0)
    {
      +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeScale");
      v15 = v12 / v14;

      if (!self->_isProjecting)
      {
        -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pointAtRouteCoordinate:", v7);
        v18 = v17;
        v20 = v19;
        objc_msgSend(v16, "pointAtRouteCoordinate:", v9);
        v22 = v21;
        v24 = v23;
        MNGetMNTunnelProjectorLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          GEOPolylineCoordinateRangeAsString();
          v26 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v7, v9);
          *(_DWORD *)buf = 138413570;
          v47 = v26;
          v48 = 2048;
          v49 = v18;
          v50 = 2048;
          *(_QWORD *)v51 = v20;
          *(_WORD *)&v51[8] = 2048;
          *(_QWORD *)&v51[10] = v22;
          v52 = 2048;
          v53 = v24;
          v54 = 2048;
          v55 = v27;
          _os_log_impl(&dword_1B0AD7000, v25, OS_LOG_TYPE_INFO, "Starting location projection through tunnel [%@] (%f, %f) to (%f, %f), tunnel length: %0.1f meters", buf, 0x3Eu);

        }
      }
      -[MNTunnelLocationProjector _projectedLocationFrom:timeInterval:tunnelRange:](self, "_projectedLocationFrom:timeInterval:tunnelRange:", self->_lastUnprojectedLocation, v7, v9, v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        MNGetMNTunnelProjectorLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v28, "routeMatch");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "routeCoordinate");
          GEOPolylineCoordinateAsString();
          v44 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "routeMatch");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "locationCoordinate");
          v32 = v31;
          objc_msgSend(v28, "routeMatch");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "locationCoordinate");
          v35 = v34;
          -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNLocation routeMatch](self->_lastUnprojectedLocation, "routeMatch");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "routeCoordinate");
          objc_msgSend(v28, "routeMatch");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v38, objc_msgSend(v39, "routeCoordinate"));
          *(_DWORD *)buf = 134219010;
          v47 = *(const char **)&v15;
          v48 = 2112;
          v49 = v44;
          v50 = 2048;
          *(_QWORD *)v51 = v32;
          *(_WORD *)&v51[8] = 2048;
          *(_QWORD *)&v51[10] = v35;
          v52 = 2048;
          v53 = v40;
          _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_INFO, "Time: %0.1fs, projected location: [%@] (%f, %f), distance: %0.1f meters", buf, 0x34u);

        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "tunnelLocationProjector:didUpdateLocation:", self, v28);

      }
      +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "expectedGpsUpdateInterval");
      -[MNTunnelLocationProjector _resetTimerWithTimeout:](self, "_resetTimerWithTimeout:");

      self->_isProjecting = v28 != 0;
    }
  }
  else
  {
    self->_isProjecting = 0;
  }

}

- (id)_projectedLocationFrom:(id)a3 timeInterval:(double)a4 tunnelRange:(GEOPolylineCoordinateRange)a5
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  id v9;
  void *v10;
  $212C09783140BCCD23384160D545CE0D v11;
  MNLocation *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  _OWORD v36[8];
  _OWORD v37[12];

  end = a5.end;
  start = a5.start;
  v9 = a3;
  if (objc_msgSend(v9, "state") == 1)
  {
    objc_msgSend(v9, "routeMatch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MNTunnelLocationProjector _projectedRouteCoordinateFrom:timeInterval:tunnelRange:](self, "_projectedRouteCoordinateFrom:timeInterval:tunnelRange:", objc_msgSend(v10, "routeCoordinate"), start, end, a4);
    if ((GEOPolylineCoordinateIsInvalid() & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x1E0D274E0]);
      -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pointAtRouteCoordinate:", v11);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v22 = objc_msgSend(v13, "stepIndexForRouteCoordinate:", v11);
      objc_msgSend(v13, "courseAtRouteCoordinateIndex:", v11);
      v24 = v23;
      +[MNTimeManager currentDate](MNTimeManager, "currentDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v14, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v15, v11, v22, v25, v17, v19, v21, v24);

      objc_msgSend(v26, "setModifiedHorizontalAccuracy:", 10.0);
      objc_msgSend(v26, "setIsTunnelProjection:", 1);
      objc_msgSend(v26, "setIsGoodMatch:", 1);
      objc_msgSend(v26, "setShouldProjectLocationAlongRoute:", 1);
      memset(&v37[2], 0, 156);
      if (v9)
        objc_msgSend(v9, "clientLocation");
      objc_msgSend(v26, "locationCoordinate");
      *(_QWORD *)((char *)&v37[2] + 4) = v27;
      objc_msgSend(v26, "locationCoordinate");
      *(_QWORD *)((char *)&v37[2] + 12) = v28;
      *(_OWORD *)((char *)&v37[8] + 4) = *(_OWORD *)((char *)&v37[2] + 4);
      objc_msgSend(v26, "matchedCourse");
      *(_QWORD *)((char *)&v37[5] + 12) = v29;
      objc_msgSend(v13, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v10, "routeCoordinate"), v11);
      *(double *)((char *)&v37[4] + 12) = v30 / a4;
      objc_msgSend(v26, "timestamp");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "timeIntervalSinceReferenceDate");
      *(_QWORD *)((char *)&v37[6] + 12) = v32;

      v33 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      v36[6] = v37[8];
      v36[7] = v37[9];
      v37[0] = v37[10];
      *(_OWORD *)((char *)v37 + 12) = *(_OWORD *)((char *)&v37[10] + 12);
      v36[2] = v37[4];
      v36[3] = v37[5];
      v36[4] = v37[6];
      v36[5] = v37[7];
      v36[0] = v37[2];
      v36[1] = v37[3];
      v34 = (void *)objc_msgSend(v33, "initWithClientLocation:", v36);
      v12 = -[MNLocation initWithRouteMatch:rawLocation:locationMatchType:]([MNLocation alloc], "initWithRouteMatch:rawLocation:locationMatchType:", v26, v34, 2);
      -[MNLocation setLocationUnreliable:](v12, "setLocationUnreliable:", 1);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- ($212C09783140BCCD23384160D545CE0D)_projectedRouteCoordinateFrom:(id)a3 timeInterval:(double)a4 tunnelRange:(GEOPolylineCoordinateRange)a5
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  $212C09783140BCCD23384160D545CE0D v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int IsValid;
  int IsABeforeB;
  PolylineCoordinate v17;
  $212C09783140BCCD23384160D545CE0D v18;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  PolylineCoordinate v24;
  PolylineCoordinate v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];

  end = a5.end;
  start = a5.start;
  if (GEOPolylineCoordinateIsInvalid())
  {
    return ($212C09783140BCCD23384160D545CE0D)*MEMORY[0x1E0D26A38];
  }
  else
  {
    -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNActiveRouteInfo etaRoute](self->_currentRouteInfo, "etaRoute");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    *(double *)&v31[3] = a4;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2810000000;
    v13 = *MEMORY[0x1E0D26A38];
    v29 = &unk_1B0C0A341;
    v30 = v13;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __84__MNTunnelLocationProjector__projectedRouteCoordinateFrom_timeInterval_tunnelRange___block_invoke;
    v20[3] = &unk_1E61D7EB8;
    v24 = start;
    v25 = end;
    v22 = v31;
    v23 = &v26;
    v14 = v11;
    v21 = v14;
    objc_msgSend(v14, "iterateTravelTimeRangesFromRouteCoordinate:etaRoute:handler:", a3, v12, v20);
    IsValid = GEOPolylineCoordinateIsValid();
    v10 = ($212C09783140BCCD23384160D545CE0D)v27[4];
    if (IsValid)
    {
      IsABeforeB = GEOPolylineCoordinateIsABeforeB();
      if (IsABeforeB)
        v17 = end;
      else
        v17 = start;
      if (IsABeforeB)
        end = start;
      if (GEOPolylineCoordinateIsABeforeB())
        v18 = v10;
      else
        v18 = ($212C09783140BCCD23384160D545CE0D)v17;
      if (GEOPolylineCoordinateIsABeforeB())
        v10 = v18;
      else
        v10 = ($212C09783140BCCD23384160D545CE0D)end;
      v27[4] = (uint64_t)v10;
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(v31, 8);

  }
  return v10;
}

uint64_t __84__MNTunnelLocationProjector__projectedRouteCoordinateFrom_timeInterval_tunnelRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, double a5, double a6)
{
  uint64_t result;
  double v13;

  result = GEOPolylineCoordinateIsABeforeB();
  if ((result & 1) == 0)
  {
    result = GEOPolylineCoordinateIsABeforeB();
    if ((_DWORD)result)
    {
LABEL_5:
      *a4 = 1;
      return result;
    }
    v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v13 < a6)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "routeCoordinateForDistance:afterRouteCoordinate:", a2, v13 * a5 / a6);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = result;
      goto LABEL_5;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = a3;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                - a6;
  }
  return result;
}

- (MNTunnelLocationProjectorDelegate)delegate
{
  return (MNTunnelLocationProjectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isProjecting
{
  return self->_isProjecting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationUpdateOverdueTimer, 0);
  objc_storeStrong((id *)&self->_lastUnprojectedLocationDate, 0);
  objc_storeStrong((id *)&self->_lastUnprojectedLocation, 0);
  objc_storeStrong((id *)&self->_tunnelRanges, 0);
  objc_storeStrong((id *)&self->_currentRouteInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
