@implementation GEORoadMatcher

- (GEORoadMatcher)init
{
  GEORoadMatcher *result;

  result = (GEORoadMatcher *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEORoadMatcher)initWithAuditToken:(id)a3
{
  id v4;
  GEORoadMatcher *v5;
  GEORoadMatcher *v6;
  GEOMapFeatureAccess *v7;
  void *global_queue;
  uint64_t v9;
  GEOMapFeatureAccess *mapFeatureAccess;
  GEORoadMatcherCandidateSegment *previousMatch;
  GEORoadMatcher *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEORoadMatcher;
  v5 = -[GEORoadMatcher init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_searchRadius = 65.0;
    v7 = [GEOMapFeatureAccess alloc];
    global_queue = (void *)geo_get_global_queue();
    v9 = -[GEOMapFeatureAccess initWithQueue:](v7, "initWithQueue:", global_queue);
    mapFeatureAccess = v6->_mapFeatureAccess;
    v6->_mapFeatureAccess = (GEOMapFeatureAccess *)v9;

    -[GEOMapFeatureAccess setAuditToken:](v6->_mapFeatureAccess, "setAuditToken:", v4);
    -[GEOMapFeatureAccess setAllowNetworkTileLoad:](v6->_mapFeatureAccess, "setAllowNetworkTileLoad:", 1);
    -[GEOMapFeatureAccess setFlipNegativeTravelDirectionRoads:](v6->_mapFeatureAccess, "setFlipNegativeTravelDirectionRoads:", 1);
    -[GEOMapFeatureAccess setVisitDoubleTravelDirectionRoadsTwice:](v6->_mapFeatureAccess, "setVisitDoubleTravelDirectionRoadsTwice:", 0);
    -[GEOMapFeatureAccess setCachedTilesCallbackImmediately:](v6->_mapFeatureAccess, "setCachedTilesCallbackImmediately:", 1);
    previousMatch = v6->_previousMatch;
    v6->_previousMatch = 0;

    v12 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GEORoadMatcher;
  -[GEORoadMatcher dealloc](&v2, sel_dealloc);
}

- (GEOApplicationAuditToken)auditToken
{
  return -[GEOMapFeatureAccess auditToken](self->_mapFeatureAccess, "auditToken");
}

- (id)matchLocation:(id)a3 forTransportType:(int)a4
{
  void *v5;
  GEORoadMatch *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[4];
  GEORoadMatch *v20;

  -[GEORoadMatcher _bestCandidateSegmentForLocation:transportType:](self, "_bestCandidateSegmentForLocation:transportType:", a3, *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(GEORoadMatch);
    objc_msgSend(v5, "road");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORoadMatch setRoadFeature:](v6, "setRoadFeature:", v8);

    objc_msgSend(v5, "coordinateOnSegment");
    -[GEORoadMatch setCoordinateOnRoad:](v6, "setCoordinateOnRoad:");
    objc_msgSend(v5, "segmentAngle");
    -[GEORoadMatch setCourseOnRoad:](v6, "setCourseOnRoad:");
    objc_msgSend(v5, "distanceFromSegment");
    -[GEORoadMatch setDistanceFromRoad:](v6, "setDistanceFromRoad:");
    objc_msgSend(v5, "road");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "roadWidth");
    -[GEORoadMatch setRoadWidth:](v6, "setRoadWidth:");

    objc_msgSend(v5, "distanceFromJunction");
    -[GEORoadMatch setDistanceFromJunction:](v6, "setDistanceFromJunction:");
    objc_msgSend(v5, "road");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "feature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "feature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "name"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(v12, "name"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEORoadMatch setRoadName:](v6, "setRoadName:", v13);

      }
      objc_msgSend(v5, "junction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v12, "containingTile");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "junction");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "connectivityJunction");
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __49__GEORoadMatcher_matchLocation_forTransportType___block_invoke;
        v19[3] = &unk_1E1C12B90;
        v20 = v6;
        objc_msgSend(v15, "forEachEdgeOnJunction:visitor:", v17, v19);

      }
    }
    -[GEORoadMatcher setPreviousMatch:](self, "setPreviousMatch:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __49__GEORoadMatcher_matchLocation_forTransportType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v4 = a2;
  if (v4)
  {
    v11 = v4;
    objc_msgSend(v4, "road");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v11;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "junctionRadius");
      v7 = v6;
      objc_msgSend(v11, "road");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (double)objc_msgSend(v8, "roadWidth") * 0.01 * 0.5;
      if (v7 > v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "junctionRadius");
      }
      else
      {
        objc_msgSend(v11, "road");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (double)objc_msgSend(v2, "roadWidth") * 0.01 * 0.5;
      }
      objc_msgSend(*(id *)(a1 + 32), "setJunctionRadius:", v10);
      if (v7 <= v9)

      v4 = v11;
    }
  }

}

- (void)setPreviousMatch:(id)a3
{
  id v5;
  GEORoadMatcherCandidateSegment **p_previousMatch;
  GEORoadMatcherCandidateSegment *previousMatch;
  id v8;

  v5 = a3;
  previousMatch = self->_previousMatch;
  p_previousMatch = &self->_previousMatch;
  v8 = v5;
  if ((-[GEORoadMatcherCandidateSegment isEqual:](previousMatch, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_previousMatch, a3);

}

- (id)_bestCandidateSegmentForLocation:(id)a3 transportType:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  uint64_t v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  GEOMapFeatureAccess *mapFeatureAccess;
  id v28;
  id v29;
  id v30;
  _QWORD v32[9];
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  int v36;
  _QWORD v37[4];
  _QWORD v38[4];
  id v39;
  GEORoadMatcher *v40;
  uint64_t *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  BOOL v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v6 = a3;
  v7 = v6;
  if (self->_useRawLocations && objc_msgSend(v6, "hasRawCoordinate"))
  {
    objc_msgSend(v7, "rawCoordinate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    v10 = v9;
    v12 = v11;

  }
  else
  {
    objc_msgSend(v7, "coordinate");
    v10 = v13;
    v12 = v14;
  }
  v15 = objc_msgSend(v7, "altitude");
  if (self->_useRawLocations && objc_msgSend(v7, "hasRawCourse"))
    objc_msgSend(v7, "rawCourse");
  else
    objc_msgSend(v7, "course");
  v17 = v16;
  v18 = (double)v15;
  v19 = v16 >= 0.0 && (a4 == 3 || a4 == 0);
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__76;
  v52 = __Block_byref_object_dispose__76;
  v21 = MEMORY[0x1E0C809B0];
  v53 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke;
  v38[3] = &unk_1E1C12BB8;
  v46 = a4;
  v22 = v7;
  v39 = v22;
  v40 = self;
  v42 = v10;
  v43 = v12;
  v47 = v19;
  v44 = v18;
  v45 = v17;
  v41 = &v48;
  v23 = (void *)MEMORY[0x18D765024](v38);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  -[GEORoadMatcher searchRadius](self, "searchRadius");
  v24 = 1.0;
  if (v25 >= 1.0)
  {
    -[GEORoadMatcher searchRadius](self, "searchRadius");
    v24 = v26;
  }
  mapFeatureAccess = self->_mapFeatureAccess;
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke_2;
  v33[3] = &unk_1E1C12BE0;
  v35 = v37;
  v28 = v23;
  v34 = v28;
  v36 = a4;
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke_3;
  v32[3] = &unk_1E1C12C08;
  v32[4] = v37;
  *(double *)&v32[5] = v24;
  *(double *)&v32[6] = v10;
  *(double *)&v32[7] = v12;
  *(double *)&v32[8] = v18;
  v29 = -[GEOMapFeatureAccess findRoadsNear:radius:handler:completionHandler:](mapFeatureAccess, "findRoadsNear:radius:handler:completionHandler:", v33, v32, v10, v12, v24);
  v30 = (id)v49[5];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v48, 8);

  return v30;
}

void __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  GEORoadCoursePenalty *v9;
  double *v10;
  uint64_t v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  GEORoadMatcherCandidateSegment *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  GEORoadMatcherCandidateSegment *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_DWORD *)(a1 + 88);
  if (v5 == 3)
  {
    v8 = objc_msgSend(v3, "bikeableSide");
    goto LABEL_10;
  }
  if (v5 == 2)
  {
    v8 = objc_msgSend(v3, "walkableSide");
LABEL_10:
    if (!v8)
      goto LABEL_22;
    goto LABEL_11;
  }
  if (v5
    || objc_msgSend(v3, "isDrivable")
    && objc_msgSend(v4, "travelDirection") != 6
    && (objc_msgSend(v4, "feature"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "type"),
        v6,
        v7 == 1))
  {
LABEL_11:
    v9 = -[GEORoadCoursePenalty initWithLocation:]([GEORoadCoursePenalty alloc], "initWithLocation:", *(_QWORD *)(a1 + 32));
    -[GEORoadCoursePenalty setUseRawLocations:](v9, "setUseRawLocations:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16));
    v10 = (double *)objc_msgSend(v4, "coordinates3d");
    v11 = 0;
    v12 = *v10;
    v13 = v10[1];
    v14 = 1;
    v15 = v10[2];
    while (1)
    {
      if (v14 >= objc_msgSend(v4, "coordinateCount"))
      {

        break;
      }
      v16 = objc_msgSend(v4, "coordinates3d");
      v17 = *(double *)(v16 + v11 + 24);
      v30 = *(double *)(v16 + v11 + 40);
      v31 = *(double *)(v16 + v11 + 32);
      v18 = [GEORoadMatcherCandidateSegment alloc];
      if (*(_BYTE *)(a1 + 92))
        v19 = *(double *)(a1 + 80);
      else
        v19 = -1.0;
      v20 = *(double *)(a1 + 56);
      v21 = *(double *)(a1 + 64);
      v22 = *(double *)(a1 + 72);
      v32[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[GEORoadMatcherCandidateSegment initWithCoordinate:angle:road:startCoordinate:endCoordinate:penalties:](v18, "initWithCoordinate:angle:road:startCoordinate:endCoordinate:penalties:", v4, v23, v20, v21, v22, v19, v12, v13, v15, *(_QWORD *)&v17, *(_QWORD *)&v31, *(_QWORD *)&v30);

      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v26 = *(void **)(v25 + 40);
      if (v26)
      {
        objc_msgSend(v26, "score");
        v28 = v27;
        -[GEORoadMatcherCandidateSegment score](v24, "score");
        if (v28 <= v29)
          goto LABEL_20;
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      }
      objc_storeStrong((id *)(v25 + 40), v24);
LABEL_20:

      ++v14;
      v11 += 24;
      v12 = v17;
      v15 = v30;
      v13 = v31;
    }
  }
LABEL_22:

}

void __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  if ((unint64_t)objc_msgSend(v4, "coordinateCount") >= 2)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = *(_DWORD *)(a1 + 48);
    if ((v3 - 2) < 2 || !v3 && !objc_msgSend(v4, "travelDirection"))
    {
      objc_msgSend(v4, "flip");
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

void __65__GEORoadMatcher__bestCandidateSegmentForLocation_transportType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  _BYTE v8[10];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    GEOGetGEORoadMatcherLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      *(_QWORD *)v8 = v3;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "GEOMapFeatureAccess encountered an error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    GEOGetGEORoadMatcherLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (int)*(double *)(a1 + 40);
      v7 = 67109635;
      *(_DWORD *)v8 = v6;
      *(_WORD *)&v8[4] = 1040;
      *(_DWORD *)&v8[6] = 24;
      v9 = 2097;
      v10 = a1 + 48;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "GEOMapFeatureAccess found no roads within %dm of (%{private,geo:coordinate}.*P). This is not necessarily an error, but most likely is", (uint8_t *)&v7, 0x18u);
    }

  }
}

- (BOOL)useRawLocations
{
  return self->_useRawLocations;
}

- (void)setUseRawLocations:(BOOL)a3
{
  self->_useRawLocations = a3;
}

- (double)searchRadius
{
  return self->_searchRadius;
}

- (void)setSearchRadius:(double)a3
{
  self->_searchRadius = a3;
}

- (GEORoadMatcherCandidateSegment)previousMatch
{
  return self->_previousMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousMatch, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
}

@end
