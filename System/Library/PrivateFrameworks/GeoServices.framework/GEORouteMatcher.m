@implementation GEORouteMatcher

- (GEORouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v7;
  id v8;
  GEORouteMatcher *v9;
  GEORouteMatcher *v10;
  GEORouteMatcher *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEORouteMatcher;
  v9 = -[GEORouteMatcher init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_route, a3);
    v10->_targetLegIndex = 0x7FFFFFFFFFFFFFFFLL;
    v10->_useStrictInitialOnRouteCriteria = 1;
    v10->_maxMatchDistanceFromPreviousRouteMatch = 1000.0;
    *(_WORD *)&v10->_requiresRoadNetworkData = 0;
    *(_WORD *)&v10->_shouldWaitForSnappedSegments = 0;
    objc_storeStrong((id *)&v10->_auditToken, a4);
    v11 = v10;
  }

  return v10;
}

- (id)matchToRouteWithLocation:(id)a3
{
  -[GEORouteMatcher matchToRouteWithLocation:previousRouteMatch:](self, "matchToRouteWithLocation:previousRouteMatch:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)matchToRouteWithLocation:(id)a3 previousRouteMatch:(id)a4
{
  GEOPathMatcher *v7;
  GEOComposedRoute *route;
  void *v9;
  GEOPathMatcher *v10;
  GEOPathMatcher *pathMatcher;
  $212C09783140BCCD23384160D545CE0D v12;
  NSArray *v13;
  NSArray *snappedSegments;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  GEORouteMatch *v30;
  uint64_t v31;
  GEOComposedRoute *v32;
  void *v33;
  void *v34;
  GEORouteMatch *v35;
  double v36;
  _BOOL8 v37;
  void *v38;
  _BOOL4 v39;
  double v41;
  double v42;
  GEONavigationMatchInfo *v43;
  GEONavigationMatchInfo *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  NSArray *v58;
  id v60;
  id v61;
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _QWORD v76[4];
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v61 = a4;
  if (self->_requiresRoadNetworkData)
  {
    if (!self->_pathMatcher)
    {
      v7 = [GEOPathMatcher alloc];
      route = self->_route;
      -[GEORouteMatcher auditToken](self, "auditToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GEOPathMatcher initWithRoute:auditToken:loggingIdentifier:](v7, "initWithRoute:auditToken:loggingIdentifier:", route, v9, CFSTR("RouteMatcher"));
      pathMatcher = self->_pathMatcher;
      self->_pathMatcher = v10;

      -[GEOPathMatcher setForceSync:](self->_pathMatcher, "setForceSync:", self->_shouldWaitForSnappedSegments);
    }
    if (v61)
      v12 = -[GEOComposedRoute routeCoordinateForDistance:beforeRouteCoordinate:](self->_route, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(v61, "routeCoordinate"), 100.0);
    else
      v12 = 0;
    -[GEOPathMatcher matchedSegmentsFromStart:toEnd:](self->_pathMatcher, "matchedSegmentsFromStart:toEnd:", v12, -[GEOComposedRoute routeCoordinateForDistance:afterRouteCoordinate:](self->_route, "routeCoordinateForDistance:afterRouteCoordinate:", v12, self->_maxMatchDistanceFromPreviousRouteMatch + 100.0));
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    snappedSegments = self->_snappedSegments;
    self->_snappedSegments = v13;

  }
  objc_storeStrong((id *)&self->_currentLocation, a3);
  objc_storeStrong((id *)&self->_previousRouteMatch, a4);
  -[GEORouteMatcher _startRouteMatch](self, "_startRouteMatch");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v76[3] = 0x7FEFFFFFFFFFFFFFLL;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__51;
  v74 = __Block_byref_object_dispose__51;
  v75 = 0;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __63__GEORouteMatcher_matchToRouteWithLocation_previousRouteMatch___block_invoke_3;
  v63[3] = &unk_1E1C0CDD0;
  v63[4] = self;
  v16 = v60;
  v64 = v16;
  v17 = v61;
  v65 = v17;
  v62 = v15;
  v66 = v62;
  v67 = &__block_literal_global_99;
  v68 = v76;
  v69 = &v70;
  -[GEORouteMatcher _forEachSegmentNearLocation:previousRouteMatch:handler:](self, "_forEachSegmentNearLocation:previousRouteMatch:handler:", v16, v17, v63);
  objc_storeStrong((id *)&self->_closestCandidateRouteMatch, (id)v71[5]);
  if (objc_msgSend(v62, "count"))
  {
    objc_msgSend(v62, "firstObject");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = *(_QWORD *)(v18 + 24);
    else
      v20 = 0;
    -[GEOComposedRoute courseAtRouteCoordinateIndex:](self->_route, "courseAtRouteCoordinateIndex:", v20);
    v22 = v21;
    if (v19)
      v23 = *(_QWORD *)(v19 + 24);
    else
      v23 = 0;
    -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", v23);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = [GEORouteMatch alloc];
    if (v19)
      v31 = *(_QWORD *)(v19 + 48);
    else
      v31 = 0;
    v32 = self->_route;
    v33 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v16, "timestamp");
    objc_msgSend(v33, "dateWithTimeIntervalSinceReferenceDate:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](v30, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v32, v23, v31, v34, v25, v27, v29, v22);

    if (v19)
      v36 = *(double *)(v19 + 56);
    else
      v36 = 0.0;
    -[GEORouteMatch setDistanceFromRoute:](v35, "setDistanceFromRoute:", v36);
    if (v19)
      v37 = *(_BYTE *)(v19 + 8) != 0;
    else
      v37 = 0;
    -[GEORouteMatch setIsGoodMatch:](v35, "setIsGoodMatch:", v37);
    if (self->_requiresRoadNetworkData)
    {
      -[GEORouteMatcher snappedSegmentForRouteCoordinate:](self, "snappedSegmentForRouteCoordinate:", v23);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEORouteMatch setPathSegment:](v35, "setPathSegment:", v38);
      -[GEORouteMatcher _roadWidthForSnappedSegment:](self, "_roadWidthForSnappedSegment:", v38);
      -[GEORouteMatch setRoadWidth:](v35, "setRoadWidth:");
      if (self->_shouldSnapRouteMatchToRoute)
      {
        v39 = -[GEORouteMatcher _supportsSnapping](self, "_supportsSnapping");
        if (v38 && v39)
        {
          objc_msgSend(v38, "locationCoordinateForRouteCoordinate:", v23);
          if (v42 >= -180.0 && v42 <= 180.0 && v41 >= -90.0 && v41 <= 90.0)
            -[GEORouteMatch setLocationCoordinate3D:](v35, "setLocationCoordinate3D:");
        }
      }

    }
    -[GEORouteMatcher _finishRouteMatch:previousRouteMatch:forLocation:](self, "_finishRouteMatch:previousRouteMatch:forLocation:", v35, v17, v16);
    if (!-[GEOComposedRoute transportType](self->_route, "transportType")
      || -[GEOComposedRoute transportType](self->_route, "transportType") == 3)
    {
      v43 = objc_alloc_init(GEONavigationMatchInfo);
      v44 = v43;
      if (v19)
        v45 = *(double *)(v19 + 16);
      else
        v45 = 0.0;
      -[GEONavigationMatchInfo setRouteMatchScore:](v43, "setRouteMatchScore:", v45);
      if (v19)
        v46 = *(double *)(v19 + 56);
      else
        v46 = 0.0;
      -[GEONavigationMatchInfo setDistanceFromRoute:](v44, "setDistanceFromRoute:", v46);
      if (v19)
        v47 = *(double *)(v19 + 64);
      else
        v47 = 0.0;
      -[GEONavigationMatchInfo setMaxDistance:](v44, "setMaxDistance:", v47);
      if (v19)
        v48 = *(double *)(v19 + 72);
      else
        v48 = 0.0;
      -[GEONavigationMatchInfo setDistanceMatchScore:](v44, "setDistanceMatchScore:", v48);
      if (v19)
        v49 = *(double *)(v19 + 80);
      else
        v49 = 0.0;
      -[GEONavigationMatchInfo setDistanceWeight:](v44, "setDistanceWeight:", v49);
      if (v19)
        v50 = *(double *)(v19 + 88);
      else
        v50 = 0.0;
      -[GEONavigationMatchInfo setCourseDelta:](v44, "setCourseDelta:", v50);
      if (v19)
        v51 = *(double *)(v19 + 96);
      else
        v51 = 0.0;
      -[GEONavigationMatchInfo setMaxCourseDelta:](v44, "setMaxCourseDelta:", v51);
      if (v19)
        v52 = *(double *)(v19 + 104);
      else
        v52 = 0.0;
      -[GEONavigationMatchInfo setCourseMatchScore:](v44, "setCourseMatchScore:", v52);
      if (v19)
        v53 = *(double *)(v19 + 112);
      else
        v53 = 0.0;
      -[GEONavigationMatchInfo setCourseWeight:](v44, "setCourseWeight:", v53);
      -[GEORouteMatch roadWidth](v35, "roadWidth");
      -[GEONavigationMatchInfo setRoadWidthOnRoute:](v44, "setRoadWidthOnRoute:");
      -[GEORouteMatch setDetailedMatchInfo:](v35, "setDetailedMatchInfo:", v44);

    }
    -[GEORouteMatch candidateSteps](v35, "candidateSteps");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54 == 0;

    if (v55)
    {
      -[GEORouteMatch step](v35, "step");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEORouteMatch setCandidateSteps:](v35, "setCandidateSteps:", v57);

    }
  }
  else
  {
    v35 = 0;
  }
  v58 = self->_snappedSegments;
  self->_snappedSegments = 0;

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(v76, 8);

  return v35;
}

uint64_t __63__GEORouteMatcher_matchToRouteWithLocation_previousRouteMatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double *v4;
  double *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;

  v4 = a2;
  v5 = a3;
  v6 = 0.0;
  v7 = 0.0;
  if (v4)
    v7 = v4[2];
  if (v5)
    v6 = v5[2];
  if (v7 <= v6)
  {
    v9 = 0.0;
    v10 = 0.0;
    if (v4)
      v10 = v4[2];
    if (v5)
      v9 = v5[2];
    v8 = v10 < v9;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

void __63__GEORouteMatcher_matchToRouteWithLocation_previousRouteMatch___block_invoke_3(uint64_t a1, void *a2)
{
  double *v3;
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_candidateForSegment:location:previousRouteMatch:");
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 56), "insertObject:atIndex:", v3, objc_msgSend(*(id *)(a1 + 56), "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(*(id *)(a1 + 56), "count"), 1536, *(_QWORD *)(a1 + 64)));
    while ((unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") >= 4)
      objc_msgSend(*(id *)(a1 + 56), "removeLastObject");
    v4 = v3[7];
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (v4 < *(double *)(v5 + 24))
    {
      *(double *)(v5 + 24) = v4;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v3);
    }
    objc_msgSend(*(id *)(a1 + 32), "_considerCandidateMatch:", v3);
  }

}

- (id)matchToClosestPointOnRouteWithLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PolylineCoordinate v9;
  double v10;
  GEORouteMatch *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  GEORouteMatch *v18;
  GEOComposedRoute *route;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "coordinate");
  v9 = -[GEORouteMatcher closestRouteCoordinateForLocationCoordinate:](self, "closestRouteCoordinateForLocationCoordinate:");
  *(float *)&v10 = v9.offset;
  if (v9.offset >= 0.0)
  {
    -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", v9, v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = [GEORouteMatch alloc];
    route = self->_route;
    v20 = -[GEOComposedRoute stepIndexForRouteCoordinate:](route, "stepIndexForRouteCoordinate:", v9);
    -[GEOComposedRoute courseAtRouteCoordinateIndex:](self->_route, "courseAtRouteCoordinateIndex:", v9);
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEORouteMatch initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:](v18, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", route, v9, v20, v23, v13, v15, v17, v22);

    -[GEORouteMatch setDistanceFromRoute:](v11, "setDistanceFromRoute:", (double)GEOCalculateDistanceRadius(v6, v8, v13, v15, 6367000.0));
    -[GEORouteMatch setIsGoodMatch:](v11, "setIsGoodMatch:", 0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PolylineCoordinate)closestRouteCoordinateForLocationCoordinate:(id)a3
{
  double var1;
  double var0;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float *v37;
  unsigned int v38;
  unsigned int v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  float *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  BOOL v51;
  double v52;
  float v53;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  __int128 v60;
  __int128 v61;
  double v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  var1 = a3.var1;
  var0 = a3.var0;
  v68 = *MEMORY[0x1E0C80C00];
  if (-[GEOComposedRoute pointCount](self->_route, "pointCount") >= 2)
  {
    v55 = var0;
    v56 = var1;
    v7 = GEOTilePointForCoordinate(var0, var1, 20.0);
    v9 = v8;
    -[GEOComposedRoute pointAt:](self->_route, "pointAt:", -[GEOComposedRoute pointCount](self->_route, "pointCount") >> 1);
    v11 = GEOMapPointsPerMeterAtLatitude(v10);
    -[GEOComposedRoute sections](self->_route, "sections");
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v64;
      v57 = -(v11 * -1000.0);
      v58 = v11 * -1000.0;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      v16 = 1.79769313e308;
      v59 = 0.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v64 != v14)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          if (v18)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "bounds");
            v19 = *((double *)&v60 + 1);
            v20 = *(double *)&v60;
            v21 = *((double *)&v61 + 1);
            v22 = v62;
          }
          else
          {
            v61 = 0u;
            v62 = 0.0;
            v22 = 0.0;
            v21 = 0.0;
            v19 = 0.0;
            v20 = 0.0;
            v60 = 0u;
          }
          v23 = fabs(v20);
          v24 = fabs(v19);
          v25 = v23 == INFINITY || v24 == INFINITY;
          v26 = v19;
          v27 = v20;
          v28 = v21;
          v29 = v22;
          if (!v25)
          {
            v27 = v58 + v20;
            v26 = v58 + v19;
            v28 = v21 + v57 * 2.0;
            v29 = v22 + v57 * 2.0;
            v23 = fabs(v58 + v20);
            v24 = fabs(v58 + v19);
          }
          v30 = v27 + v28;
          v31 = v26 + v29;
          if (v23 != INFINITY && v24 != INFINITY && v7 >= v27 && v7 < v30 && v9 >= v26 && v9 < v31)
          {
            v37 = (float *)objc_msgSend(v18, "points");
            v38 = objc_msgSend(v18, "pointCount");
            v39 = objc_msgSend(v18, "startPointIndex");
            if (v38 >= 2)
            {
              v40 = v19 + (float)(1.0 - v37[1]) * v22;
              v41 = v20 + *v37 * v21;
              v42 = v39;
              v43 = v38 - 1;
              v44 = v37 + 4;
              do
              {
                v45 = v20 + *(v44 - 1) * v21;
                v46 = v19 + (float)(1.0 - *v44) * v22;
                if (vabdd_f64(v41, v45) >= 0.00000001 || vabdd_f64(v40, v46) >= 0.00000001)
                {
                  v47 = v45 - v41;
                  v48 = v46 - v40;
                  v49 = ((v7 - v41) * (v45 - v41) + 0.0 + (v9 - v40) * (v46 - v40)) / (v47 * v47 + 0.0 + v48 * v48);
                  if (v49 < 0.0)
                    v49 = 0.0;
                  if (v49 > 1.0)
                    v49 = 1.0;
                  v50 = (v7 - (v41 + (v41 + v47 - v41) * v49)) * (v7 - (v41 + (v41 + v47 - v41) * v49))
                      + 0.0
                      + (v9 - (v40 + (v40 + v48 - v40) * v49)) * (v9 - (v40 + (v40 + v48 - v40) * v49));
                  v51 = v50 < v16;
                  if (v50 < v16)
                    v16 = v50;
                  v52 = v59;
                  if (v51)
                    v52 = v49;
                  v59 = v52;
                  if (v51)
                    v15 = v42;
                }
                ++v42;
                v44 += 3;
                v41 = v45;
                v40 = v46;
                --v43;
              }
              while (v43);
            }
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v13);
    }
    else
    {
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      v59 = 0.0;
    }

    if (v15 == 0x7FFFFFFFFFFFFFFFLL || v59 < 0.0 || v59 > 1.0)
    {
      v6 = -[GEORouteMatcher _guaranteedRouteCoordinateForLocationCoordinate:](self, "_guaranteedRouteCoordinateForLocationCoordinate:", v55, v56);
    }
    else
    {
      v53 = v59;
      if (v53 >= 1.0)
      {
        LODWORD(v15) = vcvtms_u32_f32(v53) + v15;
        v53 = v53 - (float)floorf(v53);
      }
      v6 = v15 | ((unint64_t)LODWORD(v53) << 32);
    }

  }
  else
  {
    return (PolylineCoordinate)0xBF80000000000000;
  }
  return (PolylineCoordinate)v6;
}

- (double)distanceToRouteFrom:(id)a3
{
  double result;

  -[GEORouteMatcher distanceToRouteFrom:startDistance:endDistance:](self, "distanceToRouteFrom:startDistance:endDistance:", a3.var0, a3.var1, 0.0, 1.79769313e308);
  return result;
}

- (double)distanceToRouteFrom:(id)a3 startDistance:(double)a4 endDistance:(double)a5
{
  double var1;
  double var0;
  unsigned int v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v40;
  double v41;
  double v42;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = -[GEOComposedRoute pointCount](self->_route, "pointCount");
  if (a5 < a4 || v10 < 2)
    return 1.79769313e308;
  v42 = a5;
  -[GEOComposedRoute pointAt:](self->_route, "pointAt:", 0);
  v13 = v12;
  v15 = v14;
  if (-[GEOComposedRoute pointCount](self->_route, "pointCount") < 2)
    return 1.79769313e308;
  v40 = var0;
  v41 = var1;
  v16 = 0.0;
  v17 = 1.79769313e308;
  v18 = 1;
  do
  {
    -[GEOComposedRoute pointAt:](self->_route, "pointAt:", v18);
    v20 = v19;
    v22 = v21;
    v23 = GEOCalculateDistanceRadius(v13, v15, v19, v21, 6367000.0);
    if (v16 > v42)
      break;
    v26 = v23;
    v27 = v16 + v23;
    if (v16 + v23 >= a4)
    {
      v28 = v13;
      v29 = v15;
      if (v16 < a4)
      {
        v28 = v13;
        v29 = v15;
        if (v27 >= a4)
        {
          v30 = (a4 - v16) / v26;
          v31 = v30;
          v28 = v13 + (v20 - v13) * v30;
          v29 = v15 + (v22 - v15) * v31;
        }
      }
      v32 = v20;
      v33 = v22;
      if (v27 > v42)
      {
        v34 = (v42 - v16) / v26;
        v35 = v34;
        v32 = v13 + (v20 - v13) * v35;
        v33 = v15 + (v22 - v15) * v35;
      }
      v36 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v28, v29, 1.79769313e308, v32, v33, 1.79769313e308, v24, v25, v40, v41);
      v38 = GEOCalculateDistanceRadius(v40, v41, v36, v37, 6367000.0);
      if (v17 > v38)
        v17 = v38;
      v13 = v20;
      v15 = v22;
      v16 = v27;
    }
    ++v18;
  }
  while (v18 < -[GEOComposedRoute pointCount](self->_route, "pointCount"));
  return v17;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  NSObject *v5;
  unint64_t targetLegIndex;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_targetLegIndex != a3)
  {
    GEOGetMapMatchingLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      targetLegIndex = self->_targetLegIndex;
      v7[0] = 67109376;
      v7[1] = targetLegIndex;
      v8 = 1024;
      v9 = a3;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEFAULT, "GEORouteMatcher changed target leg index from %d to %d", (uint8_t *)v7, 0xEu);
    }

    self->_targetLegIndex = a3;
  }
}

- (void)setRequiresRoadNetworkData:(BOOL)a3
{
  GEOPathMatcher *pathMatcher;

  if (self->_requiresRoadNetworkData != a3)
  {
    self->_requiresRoadNetworkData = a3;
    if (!a3)
    {
      pathMatcher = self->_pathMatcher;
      self->_pathMatcher = 0;

    }
  }
}

- (void)setShouldWaitForSnappedSegments:(BOOL)a3
{
  -[GEOPathMatcher setForceSync:](self->_pathMatcher, "setForceSync:");
  self->_shouldWaitForSnappedSegments = a3;
}

- (PolylineCoordinate)_guaranteedRouteCoordinateForLocationCoordinate:(id)a3
{
  double var1;
  double var0;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v28;
  double v29;

  var1 = a3.var1;
  var0 = a3.var0;
  -[GEOComposedRoute pointAt:](self->_route, "pointAt:", 0);
  v7 = v6;
  v9 = v8;
  v10 = -[GEOComposedRoute pointCount](self->_route, "pointCount");
  v28 = v7;
  v29 = v9;
  v11 = 0;
  if (v10 >= 2)
  {
    v12 = v10;
    v13 = 1.79769313e308;
    for (i = 1; i != v12; ++i)
    {
      -[GEOComposedRoute pointAt:](self->_route, "pointAt:", i);
      v16 = v15;
      v18 = v17;
      v21 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v7, v9, 1.79769313e308, v15, v17, 1.79769313e308, v19, v20, var0, var1);
      v23 = v22;
      v24 = GEOCalculateDistanceRadius(var0, var1, v21, v22, 6367000.0);
      if (v13 > v24)
      {
        v11 = i - 1;
        v28 = v21;
        v29 = v23;
        v13 = v24;
      }
      v9 = v18;
      v7 = v16;
    }
  }
  -[GEOComposedRoute pointAt:](self->_route, "pointAt:", v11);
  return (PolylineCoordinate)-[GEOComposedRoute coordinateAtOffset:fromRoutePoint:](self->_route, "coordinateAtOffset:fromRoutePoint:", v11, (double)GEOCalculateDistanceRadius(v25, v26, v28, v29, 6367000.0));
}

- (void)_forEachSegmentNearLocation:(id)a3 previousRouteMatch:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  long double v28;
  long double v29;
  long double v30;
  double v31;
  double v32;
  BOOL v35;
  double v36;
  float v39;
  void *v40;
  uint64_t v41;
  float v42;
  double v43;
  unint64_t v44;
  unsigned int v45;
  float v46;
  double i;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  _GEORouteMatchingSegment *v63;
  _GEORouteMatchingSegment *v64;
  float v65;
  double v66;
  unint64_t v67;
  id v68;
  void *v69;
  void (**v70)(id, void *);
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  id obj;
  uint64_t v77;
  double v78;
  __int128 v79;
  __int128 v80;
  double v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v69 = v8;
  v70 = (void (**)(id, void *))a5;
  v71 = v9;
  objc_msgSend(v8, "coordinate");
  v11 = v10;
  v13 = v12;
  v74 = GEOTilePointForCoordinate(v10, v12, 20.0);
  v78 = v14;
  -[GEORouteMatcher _startStepForPreviousRouteMatch:](self, "_startStepForPreviousRouteMatch:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "startRouteCoordinate");
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[GEOComposedRoute sections](self->_route, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
  if (!v17)
    goto LABEL_71;
  v72 = v13;
  v73 = v11;
  v77 = *(_QWORD *)v83;
  v18 = v74;
LABEL_3:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v83 != v77)
      objc_enumerationMutation(obj);
    v20 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v19);
    if (v20)
    {
      objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * v19), "bounds");
      v21 = *((double *)&v79 + 1);
      v22 = *(double *)&v79;
      v24 = *((double *)&v80 + 1);
      v23 = v81;
    }
    else
    {
      v80 = 0u;
      v81 = 0.0;
      v23 = 0.0;
      v24 = 0.0;
      v21 = 0.0;
      v22 = 0.0;
      v79 = 0u;
    }
    v25 = fabs(v22);
    v26 = fabs(v21);
    if (v25 != INFINITY && v26 != INFINITY)
    {
      v28 = exp(((v23 * 0.5 + v21) * 0.0078125 + -1048576.0) / 333772.107);
      v29 = atan(v28);
      v30 = GEOMapPointsPerMeterAtLatitude((v29 * -2.0 + 1.57079633) * 57.2957795) * -1000.0;
      v22 = v22 + v30;
      v21 = v21 + v30;
      v24 = v24 + v30 * -2.0;
      v23 = v23 + v30 * -2.0;
      v25 = fabs(v22);
      v26 = fabs(v21);
    }
    v31 = v22 + v24;
    v32 = v21 + v23;
    v35 = v25 != INFINITY && v26 != INFINITY && v18 >= v22 && v18 < v31;
    v36 = v78;
    if (!v35 || v78 < v21 || v78 >= v32)
      goto LABEL_67;
    v39 = *((float *)&v16 + 1);
    +[GEOPolylineCoordinateIterator iteratorWithRange:](GEOPolylineCoordinateIterator, "iteratorWithRange:", objc_msgSend(v20, "startPointIndex", v78, v26, v31, v32), objc_msgSend(v20, "endPointIndex"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "advance");
    if ((objc_msgSend(v40, "isCurrentValid") & 1) != 0)
      break;
LABEL_66:

LABEL_67:
    if (++v19 == v17)
    {
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v86, 16, v36, v26, v31, v32);
      if (!v17)
        goto LABEL_71;
      goto LABEL_3;
    }
  }
  v41 = objc_msgSend(v40, "previous");
  objc_msgSend(v40, "current");
  v42 = *((float *)&v41 + 1);
  v43 = -180.0;
  *(double *)&v44 = -180.0;
  while (2)
  {
    v45 = v41;
    v46 = v42;
    for (i = *(double *)&v44; ; i = -180.0)
    {
      if (!objc_msgSend(v40, "isCurrentValid"))
        goto LABEL_66;
      v48 = objc_msgSend(v40, "current");
      v41 = v48;
      if (v48 >= v16)
      {
        v42 = *((float *)&v48 + 1);
        if ((_DWORD)v48 != (_DWORD)v16 || *((float *)&v48 + 1) > v39)
          break;
      }
      objc_msgSend(v40, "advance");
      v49 = objc_msgSend(v40, "previous");
      v46 = *((float *)&v49 + 1);
      v45 = v49;
      v43 = -180.0;
    }
    if (v15)
    {
      -[GEORouteMatcher _stepForRouteCoordinate:stepHint:](self, "_stepForRouteCoordinate:stepHint:", v45 | ((unint64_t)LODWORD(v46) << 32), v15);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = objc_msgSend(v50, "endRouteCoordinate");
      if (v41 > v51
        || (v52 = 0, (_DWORD)v41 == (_DWORD)v51) && *((float *)&v41 + 1) > *((float *)&v51 + 1))
      {
        v41 = objc_msgSend(v50, "endRouteCoordinate");
        objc_msgSend(v50, "getNextStep");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *((float *)&v41 + 1);
      }
    }
    else
    {
      v52 = 0;
      v50 = 0;
    }
    if (i < -180.0 || i > 180.0 || v43 < -90.0 || v43 > 90.0)
    {
      -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", v45 | ((unint64_t)LODWORD(v46) << 32));
      v43 = v53;
      i = v54;
    }
    -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", v41 | ((unint64_t)LODWORD(v42) << 32));
    *(double *)&v44 = v55;
    v75 = v56;
    v59 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v43, i, 1.79769313e308, v56, v55, 1.79769313e308, v57, v58, v73, v72);
    if (GEOCalculateDistanceRadius(v73, v72, v59, v60, 6367000.0) <= self->_maxMatchDistanceFromPreviousRouteMatch)
    {
      v18 = v74;
      v39 = *((float *)&v16 + 1);
      if (vabds_f32(v46 + (float)v45, v42 + (float)v41) >= 0.001)
      {
        v63 = objc_alloc_init(_GEORouteMatchingSegment);
        v64 = v63;
        if (v63)
        {
          v63->_startPointIndex = v45;
          v65 = 1.0;
          if (v41 <= v45)
            v65 = v42;
          v63->_startRouteCoordinateOffset = v46;
          v63->_endRouteCoordinateOffset = v65;
          v63->_startCoordinate.latitude = v43;
          v63->_startCoordinate.longitude = i;
          v63->_endCoordinate.latitude = v75;
          v63->_endCoordinate.longitude = *(double *)&v44;
        }
        -[GEOComposedStringReplacementResult setStyleReplacementResults:]((uint64_t)v63, v50);
        v70[2](v70, v64);

      }
      if (v52)
      {
        v41 = objc_msgSend(v52, "startRouteCoordinate");
        -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", v41);
        v43 = v66;
        v44 = v67;
        v68 = v52;

        v42 = *((float *)&v41 + 1);
        v50 = v68;
      }
      else
      {
        objc_msgSend(v40, "advance");
        v43 = v75;
      }
      goto LABEL_65;
    }
    v18 = v74;
    v39 = *((float *)&v16 + 1);
    if (!v71
      || (v61 = objc_msgSend(v71, "routeCoordinate"), v45 <= v61)
      && (v45 != (_DWORD)v61 || v46 <= *((float *)&v61 + 1)))
    {
      objc_msgSend(v40, "advance");
      v62 = objc_msgSend(v40, "previous");
      v42 = *((float *)&v62 + 1);
      LODWORD(v41) = v62;
      v43 = -180.0;
      *(double *)&v44 = -180.0;
LABEL_65:

      v15 = v50;
      continue;
    }
    break;
  }

  v15 = v50;
LABEL_71:

}

- (id)_stepForRouteCoordinate:(PolylineCoordinate)a3 stepHint:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[GEORouteMatcher route](self, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "steps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  do
  {
    v11 = objc_msgSend(v8, "endRouteCoordinate");
    if (a3.index <= v11 && (a3.index != (_DWORD)v11 || a3.offset < *((float *)&v11 + 1)))
      break;
    objc_msgSend(v8, "getNextStep");
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v12;
  }
  while (v12);

  return v8;
}

- (NSArray)snappedSegments
{
  return self->_snappedSegments;
}

- (id)snappedSegmentForRouteCoordinate:(PolylineCoordinate)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  float v11;
  double v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_snappedSegments;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
      v9 = objc_msgSend(v8, "range", (_QWORD)v15);
      if ((_DWORD)v9 == a3.index)
      {
        LODWORD(v12) = HIDWORD(v9);
        if (*((float *)&v9 + 1) <= a3.offset)
          goto LABEL_10;
      }
      else if (v9 < a3.index)
      {
LABEL_10:
        if (a3.index == v10)
        {
          *(float *)&v12 = v11;
          if (a3.offset <= v11)
            goto LABEL_17;
        }
        else if (a3.index < v10)
        {
LABEL_17:
          v13 = v8;
          goto LABEL_18;
        }
      }
      if (v5 == ++v7)
      {
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16, v12);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (double)roadWidthForRouteCoordinate:(PolylineCoordinate)a3
{
  void *v4;
  double v5;
  double v6;

  -[GEORouteMatcher snappedSegmentForRouteCoordinate:](self, "snappedSegmentForRouteCoordinate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteMatcher _roadWidthForSnappedSegment:](self, "_roadWidthForSnappedSegment:", v4);
  v6 = v5;

  return v6;
}

- (double)_roadWidthForSnappedSegment:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double result;

  objc_msgSend(a3, "road");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roadWidth");
  v5 = v4;

  result = 11.1;
  if (v5 > 0.0)
    return v5;
  return result;
}

- (id)_startStepForPreviousRouteMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (-[GEORouteMatcher _stepForRouteCoordinate:stepHint:](self, "_stepForRouteCoordinate:stepHint:", objc_msgSend(v4, "routeCoordinate"), 0), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[GEOComposedRoute steps](self->_route, "steps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5
{
  double *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  long double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  _GEOCandidateRouteMatch *v41;
  _GEOCandidateRouteMatch *v42;
  double v43;
  void *v44;
  id v45;
  uint64_t v46;
  unint64_t v48;
  $AB5116BA7E623E054F959CECB034F4E7 v49;

  v8 = (double *)a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = v8[3];
    v12 = v8[4];
    v14 = v8[5];
    v13 = v8[6];
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
  }
  if (!-[GEORouteMatcher _shouldConsiderCourseForLocation:](self, "_shouldConsiderCourseForLocation:", v9))
    goto LABEL_17;
  objc_msgSend(v9, "course");
  v16 = v15;
  v17 = GEOBearingFromCoordinateToCoordinate(v11, v12, v14, v13);
  v18 = fmod(v17, 360.0);
  if (v18 >= 0.0)
    v19 = v18;
  else
    v19 = v18 + 360.0;
  v20 = fmod(v16, 360.0);
  if (v20 >= 0.0)
    v21 = v20;
  else
    v21 = v20 + 360.0;
  v22 = fmod(v19, 360.0);
  if (v22 < 0.0)
    v22 = v22 + 360.0;
  v23 = v21 - v22;
  if (v21 - v22 >= -180.0)
  {
    if (v23 > 180.0)
      v23 = v23 + -360.0;
  }
  else
  {
    v23 = v23 + 360.0;
  }
  objc_msgSend(v9, "courseAccuracy");
  if (fabs(v23) > v24 + 45.0)
  {
    v42 = 0;
  }
  else
  {
LABEL_17:
    v48 = 0xBF80000000000000;
    objc_msgSend(v9, "coordinate");
    v33 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v8, &v49.latitude, (uint64_t)&v48, v25, v26, v27, v28, v29, v30, v31, v32);
    objc_msgSend(v9, "horizontalAccuracy");
    v35 = v34;
    if (v8)
      v36 = (void *)*((_QWORD *)v8 + 7);
    else
      v36 = 0;
    v37 = v36;
    objc_msgSend(v10, "step");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORouteMatcher _scoreModifierForStep:previousStep:](self, "_scoreModifierForStep:previousStep:", v37, v38);
    v40 = v39;

    v41 = objc_alloc_init(_GEOCandidateRouteMatch);
    v42 = v41;
    if (v41)
    {
      v43 = 1.0 - v33 / (v35 + 50.0) + v40;
      v41->_isGoodMatch = v43 > 0.0;
      v41->_score = v43;
      v41->_distanceFromRoute = v33;
      v41->_routeCoordinate = (PolylineCoordinate)v48;
      v41->_locationCoordinate = v49;
    }
    if (v8)
      v44 = (void *)*((_QWORD *)v8 + 7);
    else
      v44 = 0;
    v45 = v44;
    v46 = objc_msgSend(v45, "stepIndex");
    if (v42)
      v42->_stepIndex = v46;

  }
  return v42;
}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isGoodMatch"))
  {
    self->_hasBeenOnRouteOnce = 1;
    objc_storeStrong((id *)&self->_lastGoodRouteMatch, a3);
  }
  else if (!self->_hasBeenOnRouteOnce && objc_msgSend(v7, "stepIndex") == 1)
  {
    objc_msgSend(v7, "setStepIndex:", 0);
  }

}

- (double)_scoreModifierForStep:(id)a3 previousStep:(id)a4
{
  return 0.0;
}

- (BOOL)_shouldConsiderCourseForLocation:(id)a3
{
  return objc_msgSend(a3, "hasAccurateCourse");
}

- (BOOL)_supportsSnapping
{
  return 0;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (BOOL)useStrictInitialOnRouteCriteria
{
  return self->_useStrictInitialOnRouteCriteria;
}

- (void)setUseStrictInitialOnRouteCriteria:(BOOL)a3
{
  self->_useStrictInitialOnRouteCriteria = a3;
}

- (double)maxMatchDistanceFromPreviousRouteMatch
{
  return self->_maxMatchDistanceFromPreviousRouteMatch;
}

- (void)setMaxMatchDistanceFromPreviousRouteMatch:(double)a3
{
  self->_maxMatchDistanceFromPreviousRouteMatch = a3;
}

- (BOOL)requiresRoadNetworkData
{
  return self->_requiresRoadNetworkData;
}

- (BOOL)shouldSnapRouteMatchToRoute
{
  return self->_shouldSnapRouteMatchToRoute;
}

- (void)setShouldSnapRouteMatchToRoute:(BOOL)a3
{
  self->_shouldSnapRouteMatchToRoute = a3;
}

- (BOOL)useMatchedCoordinateForMatching
{
  return self->_useMatchedCoordinateForMatching;
}

- (void)setUseMatchedCoordinateForMatching:(BOOL)a3
{
  self->_useMatchedCoordinateForMatching = a3;
}

- (BOOL)shouldWaitForSnappedSegments
{
  return self->_shouldWaitForSnappedSegments;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (GEORouteMatch)previousRouteMatch
{
  return self->_previousRouteMatch;
}

- (GEORouteMatch)lastGoodRouteMatch
{
  return self->_lastGoodRouteMatch;
}

- (BOOL)hasBeenOnRouteOnce
{
  return self->_hasBeenOnRouteOnce;
}

- (_GEOCandidateRouteMatch)closestCandidateRouteMatch
{
  return self->_closestCandidateRouteMatch;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_closestCandidateRouteMatch, 0);
  objc_storeStrong((id *)&self->_lastGoodRouteMatch, 0);
  objc_storeStrong((id *)&self->_previousRouteMatch, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_snappedSegments, 0);
  objc_storeStrong((id *)&self->_pathMatcher, 0);
}

@end
