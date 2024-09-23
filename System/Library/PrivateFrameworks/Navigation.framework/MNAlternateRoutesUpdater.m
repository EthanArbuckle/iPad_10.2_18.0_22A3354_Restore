@implementation MNAlternateRoutesUpdater

- (NSArray)alternateRoutes
{
  NSArray *alternateRoutes;
  NSArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  alternateRoutes = self->_alternateRoutes;
  if (alternateRoutes)
    return alternateRoutes;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_trackedAlternateRoutes, "count"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_trackedAlternateRoutes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "alternateRoute", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = self->_alternateRoutes;
  self->_alternateRoutes = v5;
  v13 = v5;

  v14 = self->_alternateRoutes;
  return v14;
}

- (BOOL)setAlternateRoutes:(id)a3 forMainRoute:(id)a4
{
  id v6;
  id v7;
  NSArray *alternateRoutes;
  MNRouteDivergenceFinder *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _MNTrackedAlternateRoute *v23;
  uint64_t v24;
  NSMutableArray *trackedAlternateRoutes;
  MNAlternateRoutesUpdater *v27;
  char v28;
  NSMutableArray *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  alternateRoutes = self->_alternateRoutes;
  self->_alternateRoutes = 0;

  v27 = self;
  objc_storeStrong((id *)&self->_mainRoute, a4);
  v9 = objc_alloc_init(MNRouteDivergenceFinder);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v28 = 0;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v7, "route", v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "route");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNRouteDivergenceFinder findFirstDivergenceBetweenRoute:andRoute:](v9, "findFirstDivergenceBetweenRoute:andRoute:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "routeCoordinate");
        if (v18)
        {
          v20 = v19;
          if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
          {
            objc_msgSend(v7, "route");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "routeCoordinateForDistance:afterRouteCoordinate:", v20, 40.0);

            v23 = objc_alloc_init(_MNTrackedAlternateRoute);
            -[_MNTrackedAlternateRoute setMainRoute:](v23, "setMainRoute:", v7);
            -[_MNTrackedAlternateRoute setAlternateRoute:](v23, "setAlternateRoute:", v14);
            -[_MNTrackedAlternateRoute setDivergenceCoordinate:](v23, "setDivergenceCoordinate:", v22);
            -[NSMutableArray addObject:](v29, "addObject:", v23);

            v28 = 1;
          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }
  else
  {
    v28 = 0;
  }

  v24 = -[NSMutableArray count](v27->_trackedAlternateRoutes, "count");
  LOBYTE(v24) = v24 != -[NSMutableArray count](v29, "count");
  trackedAlternateRoutes = v27->_trackedAlternateRoutes;
  v27->_trackedAlternateRoutes = v29;

  return (v24 | v28) & 1;
}

- (BOOL)updateForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  NSArray *alternateRoutes;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_trackedAlternateRoutes, "count")
    && (objc_msgSend(v4, "routeMatch"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    if (!self->_mainRoute)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tracking alternate routes requires the main route."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = 136316162;
        v22 = "-[MNAlternateRoutesUpdater updateForLocation:]";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNAlternateRoutesUpdater.m";
        v25 = 1024;
        v26 = 104;
        v27 = 2080;
        v28 = "_mainRoute != nil";
        v29 = 2112;
        v30 = v19;
        _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v21, 0x30u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_trackedAlternateRoutes, "count"))
    {
      v7 = 0;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_trackedAlternateRoutes, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mainRoute");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "route");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "routeMatch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "route");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v12
          || (objc_msgSend(v4, "routeMatch"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v13, "routeCoordinate"),
              objc_msgSend(v8, "divergenceCoordinate"),
              v14 = GEOPolylineCoordinateCompare(),
              v13,
              v14 == 1))
        {
          objc_msgSend(v6, "addIndex:", v7);
        }

        ++v7;
      }
      while (v7 < -[NSMutableArray count](self->_trackedAlternateRoutes, "count"));
    }
    v15 = objc_msgSend(v6, "count");
    v16 = v15 != 0;
    if (v15)
    {
      -[NSMutableArray removeObjectsAtIndexes:](self->_trackedAlternateRoutes, "removeObjectsAtIndexes:", v6);
      alternateRoutes = self->_alternateRoutes;
      self->_alternateRoutes = 0;

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)updateForReroute:(id)a3 rerouteReason:(unint64_t)a4
{
  MNActiveRouteInfo *v6;
  MNActiveRouteInfo *mainRoute;
  NSUInteger v8;
  void *v9;
  NSUInteger v10;

  v6 = (MNActiveRouteInfo *)a3;
  mainRoute = self->_mainRoute;
  if (mainRoute != v6)
  {
    v8 = -[NSArray indexOfObject:](self->_alternateRoutes, "indexOfObject:", v6);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      v10 = v8;
      v9 = (void *)-[NSArray mutableCopy](self->_alternateRoutes, "mutableCopy");
      objc_msgSend(v9, "removeObjectAtIndex:", v10);
      if (a4 == 10 && self->_mainRoute)
        objc_msgSend(v9, "addObject:");
    }
    -[MNAlternateRoutesUpdater setAlternateRoutes:forMainRoute:](self, "setAlternateRoutes:forMainRoute:", v9, v6);

  }
  return mainRoute != v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedAlternateRoutes, 0);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_mainRoute, 0);
}

@end
