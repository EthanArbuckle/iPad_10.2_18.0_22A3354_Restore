@implementation GEOQuickETAResponse

- (GEOQuickETAResponse)initWithETAResult:(id)a3 fromRequest:(id)a4
{
  id v6;
  id v7;
  GEOQuickETAResponse *v8;
  GEOLocation *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  GEOLocation *sourceLocation;
  GEOLocation *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  GEOLocation *destinationLocation;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSString *routeDescription;
  double v34;
  uint64_t v35;
  NSMutableArray *sortedETAs;
  GEOQuickETAResponse *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)GEOQuickETAResponse;
  v8 = -[GEOQuickETAResponse init](&v43, sel_init);
  if (v8)
  {
    v9 = [GEOLocation alloc];
    objc_msgSend(v7, "sourceWaypoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "latLng");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GEOLocation initWithLocation:](v9, "initWithLocation:", v11);
    sourceLocation = v8->_sourceLocation;
    v8->_sourceLocation = (GEOLocation *)v12;

    v14 = [GEOLocation alloc];
    objc_msgSend(v7, "destinationWaypoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "latLng");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[GEOLocation initWithLocation:](v14, "initWithLocation:", v16);
    destinationLocation = v8->_destinationLocation;
    v8->_destinationLocation = (GEOLocation *)v17;

    -[GEOETAResult sortedETAs]((id *)v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      -[GEOETAResult sortedETAs]((id *)v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v40 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v27 = objc_msgSend(v7, "transportType", (_QWORD)v39);
            if (v27 == objc_msgSend(v26, "transportType"))
            {
              v8->_responseETASeconds = objc_msgSend(v26, "travelTimeBestEstimate");
              v8->_baselineETASeconds = objc_msgSend(v26, "historicTravelTime");
              v8->_distance = (double)objc_msgSend(v26, "distance");
              objc_msgSend(v26, "summaryForPredictedDestinations");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "firstObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "formatStrings");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "firstObject");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "copy");
              routeDescription = v8->_routeDescription;
              v8->_routeDescription = (NSString *)v32;

              goto LABEL_13;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          if (v23)
            continue;
          break;
        }
      }
LABEL_13:

    }
    else
    {
      if (v6)
      {
        v8->_responseETASeconds = *((_DWORD *)v6 + 17);
        v8->_baselineETASeconds = *((_DWORD *)v6 + 16);
        LODWORD(v20) = *((_DWORD *)v6 + 15);
        v34 = (double)v20;
      }
      else
      {
        *(_QWORD *)&v8->_responseETASeconds = 0;
        v34 = 0.0;
      }
      v8->_distance = v34;
    }
    -[GEOETAResult sortedETAs]((id *)v6);
    v35 = objc_claimAutoreleasedReturnValue();
    sortedETAs = v8->_sortedETAs;
    v8->_sortedETAs = (NSMutableArray *)v35;

    v37 = v8;
  }

  return v8;
}

- (GEOQuickETAResponse)initWithDirectionsResponse:(id)a3 fromRequest:(id)a4
{
  id v6;
  id v7;
  GEOQuickETAResponse *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  GEOLocation *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  GEOLocation *sourceLocation;
  GEOLocation *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *destinationLocation;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  GEOLocation *v26;
  void *v27;
  uint64_t v28;
  GEOLocation *v29;
  GEOLocation *v30;
  void *v31;
  uint64_t v32;
  GEOLocation *v33;
  void *v34;
  int v35;
  GEORouteInitializerData *v36;
  void *v37;
  void *v38;
  void *v39;
  GEORouteInitializerData *v40;
  GEOComposedRoute *v41;
  GEOQuickETATransitDeparturesInfo *v42;
  GEOQuickETATransitDeparturesInfo *transitDeparturesInfo;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  double v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  uint64_t v60;
  unsigned int v61;
  double v62;
  GEOQuickETAResponse *v63;
  void *v65;
  GEORouteInitializerData *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  _QWORD v73[4];

  v73[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v71.receiver = self;
  v71.super_class = (Class)GEOQuickETAResponse;
  v8 = -[GEOQuickETAResponse init](&v71, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "sourceWaypoint");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      && (v10 = (void *)v9,
          objc_msgSend(v7, "destinationWaypoint"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      v12 = [GEOLocation alloc];
      objc_msgSend(v7, "sourceWaypoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "latLng");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[GEOLocation initWithLocation:](v12, "initWithLocation:", v14);
      sourceLocation = v8->_sourceLocation;
      v8->_sourceLocation = (GEOLocation *)v15;

      v17 = [GEOLocation alloc];
      objc_msgSend(v7, "destinationWaypoint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "latLng");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[GEOLocation initWithLocation:](v17, "initWithLocation:", v19);
      destinationLocation = v8->_destinationLocation;
      v8->_destinationLocation = (GEOLocation *)v20;
    }
    else
    {
      objc_msgSend(v6, "placeSearchResponses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndex:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastObject");
      destinationLocation = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeResults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(destinationLocation, "placeResults");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndex:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = [GEOLocation alloc];
      objc_msgSend(v23, "place");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "coordinate");
      v28 = -[GEOLocation initWithGEOCoordinate:](v26, "initWithGEOCoordinate:");
      v29 = v8->_sourceLocation;
      v8->_sourceLocation = (GEOLocation *)v28;

      v30 = [GEOLocation alloc];
      objc_msgSend(v25, "place");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "coordinate");
      v32 = -[GEOLocation initWithGEOCoordinate:](v30, "initWithGEOCoordinate:");
      v33 = v8->_destinationLocation;
      v8->_destinationLocation = (GEOLocation *)v32;

    }
    if (objc_msgSend(v7, "transportType") == 1 && objc_msgSend(v6, "suggestedRoutesCount"))
    {
      objc_msgSend(v6, "suggestedRouteAtIndex:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "absEndTime");
      v8->_responseETASeconds = v35 - objc_msgSend(v34, "absStartTime");
      v8->_baselineETASeconds = 0;
      v36 = [GEORouteInitializerData alloc];
      objc_msgSend(v7, "sourceWaypoint");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v37;
      objc_msgSend(v7, "destinationWaypoint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v73[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[GEORouteInitializerData initWithWaypoints:routeAttributes:directionsResponse:](v36, "initWithWaypoints:routeAttributes:directionsResponse:", v39, 0, v6);

      v41 = -[GEOComposedRoute initWithSuggestedRoute:initializerData:]([GEOComposedRoute alloc], "initWithSuggestedRoute:initializerData:", v34, v40);
      v42 = -[GEOQuickETATransitDeparturesInfo initWithComposedRoute:]([GEOQuickETATransitDeparturesInfo alloc], "initWithComposedRoute:", v41);
      transitDeparturesInfo = v8->_transitDeparturesInfo;
      v8->_transitDeparturesInfo = v42;

      -[GEOComposedRoute segments](v41, "segments");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v8->_distanceToDepartureStop = 0.0;
      v8->_walkingDurationToDepartureStop = 0.0;
      if (objc_msgSend(v45, "type") == 2)
      {
        if (v8->_transitDeparturesInfo)
        {
          v65 = v45;
          v66 = v40;
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          objc_msgSend(v45, "steps");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v68;
            do
            {
              for (i = 0; i != v48; ++i)
              {
                if (*(_QWORD *)v68 != v49)
                  objc_enumerationMutation(v46);
                v51 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
                objc_msgSend(v51, "distance");
                v8->_distanceToDepartureStop = v52 + v8->_distanceToDepartureStop;
                v8->_walkingDurationToDepartureStop = v8->_walkingDurationToDepartureStop
                                                    + (double)objc_msgSend(v51, "duration");
              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
            }
            while (v48);
          }

          v45 = v65;
          v40 = v66;
        }
        else
        {
          -[GEOComposedRoute distance](v41, "distance");
          v8->_distance = v62;
        }
      }

      goto LABEL_29;
    }
    objc_msgSend(v6, "waypointRoutes");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count");

    if (v54)
    {
      objc_msgSend(v6, "waypointRoutes");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "traversalTimes");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_responseETASeconds = objc_msgSend(v56, "estimatedSeconds");

      objc_msgSend(v34, "traversalTimes");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_baselineETASeconds = objc_msgSend(v57, "historicalEstimatedSeconds");

      if (objc_msgSend(v7, "includeDistance"))
      {
        v58 = objc_msgSend(v34, "distanceMeters");
LABEL_26:
        v8->_distance = (double)v58;
      }
    }
    else
    {
      objc_msgSend(v6, "routes");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "count");

      if (!v60)
      {
LABEL_30:
        v63 = v8;
        goto LABEL_31;
      }
      objc_msgSend(v6, "routeAtIndex:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_responseETASeconds = objc_msgSend(v34, "expectedTime");
      v61 = objc_msgSend(v34, "hasHistoricTravelTime");
      if (v61)
        v61 = objc_msgSend(v34, "historicTravelTime");
      v8->_baselineETASeconds = v61;
      if (objc_msgSend(v7, "includeDistance"))
      {
        v58 = objc_msgSend(v34, "distance");
        goto LABEL_26;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_31:

  return v8;
}

- (GEOLocation)sourceLocation
{
  return self->_sourceLocation;
}

- (GEOLocation)destinationLocation
{
  return self->_destinationLocation;
}

- (unsigned)responseETASeconds
{
  return self->_responseETASeconds;
}

- (unsigned)baselineETASeconds
{
  return self->_baselineETASeconds;
}

- (double)distance
{
  return self->_distance;
}

- (NSString)routeDescription
{
  return self->_routeDescription;
}

- (GEOQuickETATransitDeparturesInfo)transitDeparturesInfo
{
  return self->_transitDeparturesInfo;
}

- (double)distanceToDepartureStop
{
  return self->_distanceToDepartureStop;
}

- (double)walkingDurationToDepartureStop
{
  return self->_walkingDurationToDepartureStop;
}

- (NSMutableArray)sortedETAs
{
  return self->_sortedETAs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedETAs, 0);
  objc_storeStrong((id *)&self->_transitDeparturesInfo, 0);
  objc_storeStrong((id *)&self->_routeDescription, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_sourceLocation, 0);
}

@end
