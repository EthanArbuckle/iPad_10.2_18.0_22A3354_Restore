@implementation MNDepartureUpdater

- (MNDepartureUpdater)initWithRoute:(id)a3 arrivalLegIndex:(unint64_t)a4
{
  id v7;
  MNDepartureUpdater *v8;
  MNDepartureUpdater *v9;
  void *v10;
  uint64_t v11;
  GEOComposedRouteLeg *arrivalLeg;
  uint64_t v13;
  NSMutableDictionary *conditionScores;
  MNDepartureUpdater *v15;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MNDepartureUpdater;
  v8 = -[MNDepartureUpdater init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_route, a3);
    objc_msgSend(v7, "legs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v11 = objc_claimAutoreleasedReturnValue();
    arrivalLeg = v9->_arrivalLeg;
    v9->_arrivalLeg = (GEOComposedRouteLeg *)v11;

    -[MNDepartureUpdater _initConditions](v9, "_initConditions");
    v13 = objc_opt_new();
    conditionScores = v9->_conditionScores;
    v9->_conditionScores = (NSMutableDictionary *)v13;

    v15 = v9;
  }

  return v9;
}

- (unint64_t)arrivalWaypointLegIndex
{
  return -[GEOComposedRouteLeg legIndex](self->_arrivalLeg, "legIndex");
}

- (BOOL)allowDepartureForLocation:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  NSMutableDictionary *conditionScores;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t j;
  double v28;
  BOOL v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  unint64_t v33;
  void *v34;
  uint64_t UInteger;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_conditionScores)
  {
    v29 = 0;
    goto LABEL_34;
  }
  UInteger = GEOConfigGetUInteger();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = self->_conditions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (!v6)
    goto LABEL_14;
  v7 = v6;
  v8 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v42 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_msgSend(v10, "scoreForLocation:", v4);
      v12 = v11;
      conditionScores = self->_conditionScores;
      objc_msgSend(v10, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](conditionScores, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      if (v17 == -1.0)
      {
        v18 = self->_conditionScores;
        objc_msgSend(v10, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v19);
      }
      else
      {
        if (v12 <= v17)
          continue;
        v20 = self->_conditionScores;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v19, v21);

      }
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  }
  while (v7);
LABEL_14:

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[NSMutableDictionary allValues](self->_conditionScores, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    v26 = 0.0;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "doubleValue");
        v26 = v26 + v28;
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v24);
  }
  else
  {
    v26 = 0.0;
  }

  if (-[NSMutableDictionary count](self->_conditionScores, "count"))
  {
    v30 = v26 / (double)(unint64_t)-[NSMutableDictionary count](self->_conditionScores, "count");
    MNGetMNDepartureUpdaterLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v30 <= (double)(unint64_t)UInteger / 100.0)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        -[MNDepartureUpdater _descriptionForSubScores](self, "_descriptionForSubScores");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v46 = v30;
        v47 = 2048;
        v48 = (double)(unint64_t)UInteger / 100.0;
        v49 = 2112;
        v50 = v34;
        _os_log_impl(&dword_1B0AD7000, v32, OS_LOG_TYPE_INFO, "Not allowing departure yet because score (%0.2f) is below the minimum score (%g). Sub scores:%@", buf, 0x20u);

      }
      v29 = 0;
    }
    else
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v46 = v30;
        v47 = 2048;
        v48 = (double)(unint64_t)UInteger / 100.0;
        _os_log_impl(&dword_1B0AD7000, v32, OS_LOG_TYPE_DEFAULT, "Allow departure because score (%0.2f) is above the minimum score (%g).", buf, 0x16u);
      }
      v29 = 1;
    }
  }
  else
  {
    objc_msgSend(v4, "routeMatch");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = -[NSObject legIndex](v32, "legIndex");
    v29 = v33 > -[MNDepartureUpdater arrivalWaypointLegIndex](self, "arrivalWaypointLegIndex");
  }

LABEL_34:
  return v29;
}

- (void)_initConditions
{
  void *v3;
  void *v4;
  void *conditions;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[GEOComposedRouteLeg arrivalParameters](self->_arrivalLeg, "arrivalParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[GEOComposedRouteLeg arrivalParameters](self->_arrivalLeg, "arrivalParameters", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalMapRegions");
    conditions = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(conditions, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(conditions);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "arrivalRegionAction") == 5
            || objc_msgSend(v10, "arrivalRegionAction") == 2)
          {

            -[MNDepartureUpdater _arrivalRegionsDepartureConditions](self, "_arrivalRegionsDepartureConditions");
            v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
            conditions = self->_conditions;
            self->_conditions = v11;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(conditions, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  if (!self->_conditions)
  {
    -[MNDepartureUpdater _defaultDepartureConditions](self, "_defaultDepartureConditions");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_conditions;
    self->_conditions = v12;

  }
}

- (id)_defaultDepartureConditions
{
  char BOOL;
  void *v4;
  void *v5;
  __MNDepartureTimeSpentCondition *v6;
  uint64_t v7;
  __MNDepartureMinimumDepartureDistanceCondition *v8;
  __MNDepartureMinimumArrivalDistanceCondition *v9;
  __MNDepartureMinimumArrivalDistanceCondition *v10;
  __MNDepartureMinimumDepartureDistanceCondition *v11;
  void *v12;
  void *v13;
  __MNDepartureMinimumDepartureDistanceCondition *v14;
  void *v15;
  __MNDepartureMinimumDepartureDistanceCondition *v16;
  __MNDepartureMinimumDepartureDistanceCondition *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  __MNDepartureMinimumArrivalDistanceCondition *v21;
  __MNDepartureMinimumDepartureDistanceCondition *v22;
  _QWORD v24[3];
  _QWORD v25[3];
  __MNDepartureMinimumDepartureDistanceCondition *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  BOOL = GEOConfigGetBOOL();
  -[GEOComposedRouteLeg arrivalParameters](self->_arrivalLeg, "arrivalParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BOOL & 1) == 0)
  {
    v16 = [__MNDepartureMinimumDepartureDistanceCondition alloc];
    if (!v5)
    {
      GEOConfigGetDouble();
      v8 = -[__MNDepartureMinimumDepartureDistanceCondition initWithUpdater:distanceThreshold:](v16, "initWithUpdater:distanceThreshold:", self);
      v26 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[GEOComposedRouteLeg arrivalParameters](self->_arrivalLeg, "arrivalParameters");
    v8 = (__MNDepartureMinimumDepartureDistanceCondition *)objc_claimAutoreleasedReturnValue();
    -[__MNDepartureMinimumDepartureDistanceCondition arrivalPoints](v8, "arrivalPoints");
    v10 = (__MNDepartureMinimumArrivalDistanceCondition *)objc_claimAutoreleasedReturnValue();
    GEOConfigGetDouble();
    v17 = -[__MNDepartureMinimumDepartureDistanceCondition initWithUpdater:arrivalPoints:distanceThreshold:](v16, "initWithUpdater:arrivalPoints:distanceThreshold:", self, v10);
    v27[0] = v17;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v27;
    v20 = 1;
    goto LABEL_7;
  }
  v6 = [__MNDepartureTimeSpentCondition alloc];
  GEOConfigGetDouble();
  v7 = -[__MNDepartureTimeSpentCondition initWithUpdater:timeThreshold:](v6, "initWithUpdater:timeThreshold:", self);
  v8 = (__MNDepartureMinimumDepartureDistanceCondition *)v7;
  if (!v5)
  {
    v24[0] = v7;
    v21 = [__MNDepartureMinimumArrivalDistanceCondition alloc];
    GEOConfigGetDouble();
    v10 = -[__MNDepartureMinimumArrivalDistanceCondition initWithUpdater:distanceThreshold:](v21, "initWithUpdater:distanceThreshold:", self);
    v24[1] = v10;
    v22 = [__MNDepartureMinimumDepartureDistanceCondition alloc];
    GEOConfigGetDouble();
    v17 = -[__MNDepartureMinimumDepartureDistanceCondition initWithUpdater:distanceThreshold:](v22, "initWithUpdater:distanceThreshold:", self);
    v24[2] = v17;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v24;
    v20 = 3;
LABEL_7:
    objc_msgSend(v18, "arrayWithObjects:count:", v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v25[0] = v7;
  v9 = [__MNDepartureMinimumArrivalDistanceCondition alloc];
  GEOConfigGetDouble();
  v10 = -[__MNDepartureMinimumArrivalDistanceCondition initWithUpdater:distanceThreshold:](v9, "initWithUpdater:distanceThreshold:", self);
  v25[1] = v10;
  v11 = [__MNDepartureMinimumDepartureDistanceCondition alloc];
  -[GEOComposedRouteLeg arrivalParameters](self->_arrivalLeg, "arrivalParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrivalPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  GEOConfigGetDouble();
  v14 = -[__MNDepartureMinimumDepartureDistanceCondition initWithUpdater:arrivalPoints:distanceThreshold:](v11, "initWithUpdater:arrivalPoints:distanceThreshold:", self, v13);
  v25[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
LABEL_9:

  return v15;
}

- (id)_arrivalRegionsDepartureConditions
{
  void *v3;
  void *v4;
  __MNDepartureExitedArrivalRegionCondition *v5;
  void *v6;
  void *v7;
  __MNDepartureExitedArrivalRegionCondition *v8;
  void *v9;
  NSObject *v11;
  __MNDepartureExitedArrivalRegionCondition *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[GEOComposedRouteLeg arrivalParameters](self->_arrivalLeg, "arrivalParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrivalMapRegions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v14 = "-[MNDepartureUpdater _arrivalRegionsDepartureConditions]";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNDepartureUpdater.m";
      v17 = 1024;
      v18 = 481;
      v19 = 2080;
      v20 = "_arrivalLeg.arrivalParameters.arrivalMapRegions != nil";
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }

  }
  v5 = [__MNDepartureExitedArrivalRegionCondition alloc];
  -[GEOComposedRouteLeg arrivalParameters](self->_arrivalLeg, "arrivalParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrivalMapRegions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[__MNDepartureExitedArrivalRegionCondition initWithUpdater:arrivalRegions:](v5, "initWithUpdater:arrivalRegions:", self, v7);
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_descriptionForSubScores
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[NSMutableDictionary allKeys](self->_conditionScores, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__MNDepartureUpdater__descriptionForSubScores__block_invoke;
  v9[3] = &unk_1E61D7F80;
  v9[4] = self;
  objc_msgSend(v3, "_geo_map:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n\t"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("\n\t%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __46__MNDepartureUpdater__descriptionForSubScores__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: %0.2f"), v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOComposedRouteLeg)arrivalLeg
{
  return self->_arrivalLeg;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalLeg, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_conditionScores, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end
