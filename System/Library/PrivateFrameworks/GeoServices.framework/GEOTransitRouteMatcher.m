@implementation GEOTransitRouteMatcher

- (GEOTransitRouteMatcher)initWithRoute:(id)a3 motionContext:(id)a4 auditToken:(id)a5
{
  id v8;
  GEOTransitRouteMatcher *v9;
  GEOTransitRouteMatcher *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _GEORouteMatchUpdater_EnterBoard *v19;
  void *v20;
  _GEORouteMatchUpdater_LineProgression *v21;
  void *v22;
  _GEORouteMatchUpdater_FerryProgression *v23;
  void *v24;
  _GEORouteMatchUpdater_FerryProgression *v25;
  _GEORouteMatchUpdater_AlightExit *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  _GEORouteMatchUpdater_Transfer *v32;
  _GEORouteMatchUpdater_Arrival *v33;
  void *v34;
  _GEORouteMatchUpdater_Arrival *v35;
  uint64_t v36;
  NSArray *stationsOnRoute;
  NSArray *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSArray *stepRanges;
  GEOTransitRouteMatcher *v50;
  id v52;
  id obj;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v52 = a4;
  v62.receiver = self;
  v62.super_class = (Class)GEOTransitRouteMatcher;
  v57 = v8;
  v9 = -[GEORouteMatcher initWithRoute:auditToken:](&v62, sel_initWithRoute_auditToken_, v8, a5);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_motionContext, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v8, "steps");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v12)
    {
      v54 = *(_QWORD *)v59;
      do
      {
        v55 = v12;
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v59 != v54)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v14, "startingStop");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "getStationForStop:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v56, "addObject:", v16);
          objc_msgSend(v14, "endingStop");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "getStationForStop:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v56, "addObject:", v18);
          if (objc_msgSend(v14, "shouldCreateEnterBoardGroup"))
          {
            v19 = -[_GEORouteMatchUpdater_EnterBoard initWithTransitRouteMatcher:boardVehicleStep:]([_GEORouteMatchUpdater_EnterBoard alloc], "initWithTransitRouteMatcher:boardVehicleStep:", v10, v14);
            -[GEOTransitRouteMatcher _insertUpdater:into:](v10, "_insertUpdater:into:", v19, v11);

          }
          if (objc_msgSend(v14, "shouldCreateTripProgressionGroup"))
          {
            objc_msgSend(v57, "segmentForStepIndex:", objc_msgSend(v14, "stepIndex"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[_GEORouteMatchUpdater_LineProgression initWithTransitRouteMatcher:tripSegment:]([_GEORouteMatchUpdater_LineProgression alloc], "initWithTransitRouteMatcher:tripSegment:", v10, v20);
            -[GEOTransitRouteMatcher _insertUpdater:into:](v10, "_insertUpdater:into:", v21, v11);

          }
          if (objc_msgSend(v14, "shouldCreateFerryProgressionGroup"))
          {
            objc_msgSend(v57, "segmentForStepIndex:", objc_msgSend(v14, "stepIndex"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = [_GEORouteMatchUpdater_FerryProgression alloc];
            -[GEORouteMatcher route](v10, "route");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[_GEORouteMatchUpdater_FerryProgression initWithRoute:tripSegment:](v23, "initWithRoute:tripSegment:", v24, v22);

            -[GEOTransitRouteMatcher _insertUpdater:into:](v10, "_insertUpdater:into:", v25, v11);
          }
          if (objc_msgSend(v14, "shouldCreateAlightExitGroup"))
          {
            v26 = -[_GEORouteMatchUpdater_AlightExit initWithTransitRouteMatcher:alightStep:]([_GEORouteMatchUpdater_AlightExit alloc], "initWithTransitRouteMatcher:alightStep:", v10, v14);
            -[GEOTransitRouteMatcher _insertUpdater:into:](v10, "_insertUpdater:into:", v26, v11);

          }
          if (objc_msgSend(v14, "shouldCreateTransferGroup"))
          {
            if (objc_msgSend(v14, "transportType") == 1)
              v27 = v14;
            else
              v27 = 0;
            v28 = v27;
            objc_msgSend(v28, "nextTransitStep");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v29, "maneuver") == 6)
            {
              objc_msgSend(v29, "nextTransitStep");
              v30 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v30 = v29;
            }
            v31 = v30;
            v32 = -[_GEORouteMatchUpdater_Transfer initWithTransitRouteMatcher:alightStep:transferStep:boardStep:]([_GEORouteMatchUpdater_Transfer alloc], "initWithTransitRouteMatcher:alightStep:transferStep:boardStep:", v10, v28, v29, v30);
            -[GEOTransitRouteMatcher _insertUpdater:into:](v10, "_insertUpdater:into:", v32, v11);

          }
          if (objc_msgSend(v14, "shouldCreateArrivalGroup"))
          {
            v33 = [_GEORouteMatchUpdater_Arrival alloc];
            -[GEORouteMatcher route](v10, "route");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[_GEORouteMatchUpdater_Arrival initWithRoute:arrivalStep:](v33, "initWithRoute:arrivalStep:", v34, v14);

            -[GEOTransitRouteMatcher _insertUpdater:into:](v10, "_insertUpdater:into:", v35, v11);
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v12);
    }

    objc_msgSend(v56, "allObjects");
    v36 = objc_claimAutoreleasedReturnValue();
    stationsOnRoute = v10->_stationsOnRoute;
    v10->_stationsOnRoute = (NSArray *)v36;

    objc_storeStrong((id *)&v10->_routeMatchUpdaters, v11);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "steps");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    while (v40)
    {
      v41 = v40;
      objc_msgSend(v41, "getNextStep");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v42 = v41;
        while (-[GEOTransitRouteMatcher _stepsInSameRange:nextStep:](v10, "_stepsInSameRange:nextStep:", v41, v40))
        {
          v43 = v40;

          objc_msgSend(v43, "getNextStep");
          v44 = objc_claimAutoreleasedReturnValue();

          v40 = (void *)v44;
          v42 = v43;
          if (!v44)
            goto LABEL_39;
        }
        v43 = v42;
      }
      else
      {
        v43 = v41;
      }
LABEL_39:
      v45 = objc_msgSend(v41, "stepIndex");
      v46 = objc_msgSend(v43, "stepIndex");
      v47 = objc_msgSend(v41, "stepIndex");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v45, v46 - v47 + 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v38, "addObject:", v48);

    }
    stepRanges = v10->_stepRanges;
    v10->_stepRanges = v38;

    v50 = v10;
  }

  return v10;
}

- (BOOL)isStationCoordinateOnRoute:(id)a3
{
  double var1;
  double var0;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  var1 = a3.var1;
  var0 = a3.var0;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_stationsOnRoute;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "location", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "coordinate");
        v12 = GEOCalculateDistanceRadius(var0, var1, v10, v11, 6367000.0);

        if (v12 < 60.0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)motionContext
{
  return self->_motionContext;
}

- (BOOL)_stepsInSameRange:(id)a3 nextStep:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "transportType") == 1)
    v7 = objc_msgSend(v5, "maneuver");
  else
    v7 = 2;
  if (objc_msgSend(v6, "transportType") == 1)
    v8 = objc_msgSend(v6, "maneuver");
  else
    v8 = 2;
  v9 = v7 == v8 || v7 == 2 && v8 == 7 || v7 == 4 && v8 == 5;

  return v9;
}

- (void)_startRouteMatch
{
  self->_distanceToClosestWalkingSegment = 1.79769313e308;
}

- (void)_considerCandidateMatch:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;

  v9 = a3;
  -[GEORouteMatcher route](self, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v5 = *((_QWORD *)v9 + 6);
  else
    v5 = 0;
  objc_msgSend(v4, "stepAtIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "routeSegmentType");

  if (v7 == 2)
  {
    if (!v9)
    {
      v8 = 0.0;
      if (self->_distanceToClosestWalkingSegment <= 0.0)
        goto LABEL_7;
      goto LABEL_6;
    }
    v8 = *((double *)v9 + 7);
    if (self->_distanceToClosestWalkingSegment > v8)
LABEL_6:
      self->_distanceToClosestWalkingSegment = v8;
  }
LABEL_7:

}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  objc_super v16;
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
  v11 = self->_routeMatchUpdaters;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v11);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "updateRouteMatch:previousRouteMatch:forLocation:", v8, v9, v10) & 1) != 0)break;
      if (v12 == ++v14)
      {
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

  if (v9)
  {
    v15 = objc_msgSend(v8, "stepIndex");
    if (v15 < objc_msgSend(v9, "stepIndex"))
      objc_msgSend(v8, "setStepIndex:", objc_msgSend(v9, "stepIndex"));
  }
  v16.receiver = self;
  v16.super_class = (Class)GEOTransitRouteMatcher;
  -[GEORouteMatcher _finishRouteMatch:previousRouteMatch:forLocation:](&v16, sel__finishRouteMatch_previousRouteMatch_forLocation_, v8, v9, v10);

}

- (double)_scoreModifierForStep:(id)a3 previousStep:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v20;
  double v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v8 >= -[NSArray count](self->_stepRanges, "count"))
        break;
      -[NSArray objectAtIndex:](self->_stepRanges, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeValue");
      v14 = v13;

      v15 = objc_msgSend(v6, "stepIndex");
      v16 = objc_msgSend(v7, "stepIndex");
      if (v15 - v12 < v14 && v15 >= v12)
        v9 = v8;
      if (v16 - v12 < v14 && v16 >= v12)
        v10 = v8;
      ++v8;
    }
    while (v9 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL);
    v20 = -0.5;
    if (v9 == v10 + 1)
      v20 = -0.25;
    if (v9 == v10)
      v21 = 0.0;
    else
      v21 = v20;
  }
  else if (objc_msgSend(v6, "routeSegmentType") == 2)
  {
    v21 = 0.0;
  }
  else
  {
    v21 = -0.25;
  }

  return v21;
}

- (BOOL)_shouldConsiderCourseForLocation:(id)a3
{
  return 0;
}

- (void)_insertUpdater:(id)a3 into:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend(v5, "insertObject:atIndex:", v6, objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v5, "count"), 1536, &__block_literal_global_151));

}

uint64_t __46__GEOTransitRouteMatcher__insertUpdater_into___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "priority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

- (double)distanceToClosestWalkingSegment
{
  return self->_distanceToClosestWalkingSegment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepRanges, 0);
  objc_storeStrong((id *)&self->_routeMatchUpdaters, 0);
  objc_storeStrong((id *)&self->_stationsOnRoute, 0);
  objc_storeStrong((id *)&self->_motionContext, 0);
}

@end
