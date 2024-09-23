@implementation MSPMutableHistoryEntryRoute

+ (Class)immutableObjectClass
{
  return 0;
}

+ (id)immutableObjectProtocol
{
  return &unk_1EF083770;
}

+ (Class)mutableObjectClass
{
  return (Class)objc_opt_class();
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (MSPMutableHistoryEntryRoute)initWithStorage:(id)a3
{
  MSPHistoryEntryStorage *v4;
  MSPDirectionsSearch *v5;
  MSPMutableHistoryEntryRoute *v6;
  MSPMutableHistoryEntryRoute *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  MSPRidesharingInformationSource *v15;
  void *v16;
  void *v17;
  void *routeInformationSource;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MSPRouteInformationSource *v23;
  uint64_t v24;
  MSPMutableHistoryEntryRoute *v25;
  objc_super v27;

  v4 = (MSPHistoryEntryStorage *)a3;
  if (!v4)
  {
    v4 = objc_alloc_init(MSPHistoryEntryStorage);
    -[MSPHistoryEntryStorage setSearchType:](v4, "setSearchType:", 2);
    v5 = objc_alloc_init(MSPDirectionsSearch);
    -[MSPHistoryEntryStorage setDirectionsSearch:](v4, "setDirectionsSearch:", v5);

  }
  v27.receiver = self;
  v27.super_class = (Class)MSPMutableHistoryEntryRoute;
  v6 = -[MSPMutableHistoryEntry initWithStorage:](&v27, sel_initWithStorage_, v4);
  v7 = v6;
  if (!v6)
    goto LABEL_14;
  -[MSPMutableHistoryEntry storage](v6, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "searchType") == 2)
  {
    -[MSPMutableHistoryEntry storage](v7, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "directionsSearch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }

  -[MSPMutableHistoryEntry storage](v7, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "searchType") != 5)
  {

    if (!v11)
      goto LABEL_15;
LABEL_12:
    -[MSPMutableHistoryEntry storage](v7, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "directionsSearch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "routeRequestStorage");
    v24 = objc_claimAutoreleasedReturnValue();
    routeInformationSource = v7->_routeInformationSource;
    v7->_routeInformationSource = (MSPRouteInformationSource *)v24;
    goto LABEL_13;
  }
  -[MSPMutableHistoryEntry storage](v7, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ridesharingTrip");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_12;
  if (!v14)
  {
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  v15 = [MSPRidesharingInformationSource alloc];
  -[MSPMutableHistoryEntry storage](v7, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ridesharingTrip");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startWaypoint");
  routeInformationSource = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMutableHistoryEntry storage](v7, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ridesharingTrip");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endWaypoint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MSPRidesharingInformationSource initWithStartWaypoint:endWaypoint:](v15, "initWithStartWaypoint:endWaypoint:", routeInformationSource, v21);
  v23 = v7->_routeInformationSource;
  v7->_routeInformationSource = (MSPRouteInformationSource *)v22;

LABEL_13:
LABEL_14:
  v25 = v7;
LABEL_16:

  return v25;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_routeRequestStorage
{
  void *v2;
  void *v3;
  void *v4;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "directionsSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeRequestStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setRouteInformationSource:(id)a3
{
  MSPRouteInformationSource *v5;
  void *v6;
  void *v7;
  MSPDirectionsSearch *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  MSPRouteInformationSource *v14;
  void *v15;
  void *v16;
  MSPRidesharingTrip *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MSPRouteInformationSource *v22;

  v22 = (MSPRouteInformationSource *)a3;
  -[MSPMutableHistoryEntry _noteWillMutate](self, "_noteWillMutate");
  v5 = v22;
  if (self->_routeInformationSource != v22)
  {
    objc_storeStrong((id *)&self->_routeInformationSource, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MSPMutableHistoryEntry storage](self, "storage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSearchType:", 2);

      -[MSPMutableHistoryEntry storage](self, "storage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRidesharingTrip:", 0);

      v8 = objc_alloc_init(MSPDirectionsSearch);
      -[MSPMutableHistoryEntry storage](self, "storage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDirectionsSearch:", v8);

      v10 = (void *)-[MSPRouteInformationSource copy](v22, "copy");
      -[MSPMutableHistoryEntry storage](self, "storage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "directionsSearch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRouteRequestStorage:", v10);
LABEL_6:

      v5 = v22;
      goto LABEL_7;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v22;
    if ((isKindOfClass & 1) != 0)
    {
      v14 = v22;
      -[MSPMutableHistoryEntry storage](self, "storage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSearchType:", 5);

      -[MSPMutableHistoryEntry storage](self, "storage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDirectionsSearch:", 0);

      v17 = objc_alloc_init(MSPRidesharingTrip);
      -[MSPMutableHistoryEntry storage](self, "storage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRidesharingTrip:", v17);

      -[MSPRouteInformationSource _startWaypoint](v14, "_startWaypoint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSPMutableHistoryEntry storage](self, "storage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ridesharingTrip");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setStartWaypoint:", v19);

      -[MSPRouteInformationSource _endWaypoint](v14, "_endWaypoint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[MSPMutableHistoryEntry storage](self, "storage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ridesharingTrip");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEndWaypoint:", v10);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (GEOComposedWaypoint)startWaypoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ridesharingTrip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startWaypoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "waypoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      v5 = 0;
    }
    else
    {
      -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "waypoints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (GEOComposedWaypoint *)v5;
}

- (GEOComposedWaypoint)endWaypoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ridesharingTrip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endWaypoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "waypoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (GEOComposedWaypoint *)v5;
}

- (NSArray)waypoints
{
  void *v2;
  void *v3;

  -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waypoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)transportType
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  int v7;
  void *v8;
  unsigned int v9;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ridesharingTrip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 4;
  -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasTransportType");

  if (!v7)
    return 0;
  -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "transportType") - 1;
  if (v9 > 5)
    v5 = 1;
  else
    v5 = qword_1B3A36918[v9];

  return v5;
}

- (GEOURLRouteHandle)routeHandle
{
  void *v2;
  void *v3;
  void *v4;

  -[MSPMutableHistoryEntryRoute routeInformationSource](self, "routeInformationSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ifGEOStorageRouteRequestStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOURLRouteHandle *)v4;
}

- (GEOAutomobileOptions)automobileOptions
{
  void *v2;
  void *v3;

  -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "automobileOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOAutomobileOptions *)v3;
}

- (GEOTransitOptions)transitOptions
{
  void *v2;
  void *v3;

  -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitOptions *)v3;
}

- (GEOWalkingOptions)walkingOptions
{
  void *v2;
  void *v3;

  -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "walkingOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOWalkingOptions *)v3;
}

- (GEOCyclingOptions)cyclingOptions
{
  void *v2;
  void *v3;

  -[MSPMutableHistoryEntryRoute _routeRequestStorage](self, "_routeRequestStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cyclingOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOCyclingOptions *)v3;
}

- (BOOL)navigationWasInterrupted
{
  void *v2;
  void *v3;
  char v4;

  -[MSPMutableHistoryEntry storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "directionsSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "navigationInterrupted");

  return v4;
}

- (void)setNavigationInterrupted:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[MSPMutableHistoryEntry storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "directionsSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationInterrupted:", v3);

}

- (NSData)archivedSharedTripData
{
  return 0;
}

- (id)transferToImmutableIfValidWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MSPMutableHistoryEntryRoute routeInformationSource](self, "routeInformationSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = CFSTR("routeInformationSource");
    goto LABEL_7;
  }
  -[MSPMutableHistoryEntryRoute endWaypoint](self, "endWaypoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v5, "addObject:", CFSTR("endWaypoint"));
  if (!-[MSPMutableHistoryEntryRoute transportType](self, "transportType"))
  {
    v8 = CFSTR("transportType");
LABEL_7:
    objc_msgSend(v5, "addObject:", v8);
  }
  if (objc_msgSend(v5, "count"))
  {
    if (a3)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v12[0] = CFSTR("MSPContainerUntransferableObject");
      v12[1] = CFSTR("MSPContainerUnavailableKeys");
      v13[0] = self;
      v13[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MapsSupport.MSPContainer"), 1, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      a3 = 0;
    }
  }
  else
  {
    -[MSPMutableHistoryEntry _markImmutable](self, "_markImmutable");
    a3 = self;
  }

  return a3;
}

- (BOOL)_isUserVisibleDuplicateOfSameClassObject:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char IsEqualToMapItemForPurpose;
  void *v18;
  int v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a3;
  -[MSPMutableHistoryEntryRoute startWaypoint](self, "startWaypoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MSPMutableHistoryEntryRoute startWaypoint](self, "startWaypoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "isCurrentLocation");

    v8 = v3 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v5, "startWaypoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "startWaypoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v10, "isCurrentLocation");

    v11 = v3 ^ 1;
  }
  else
  {
    v11 = 0;
  }

  if ((v8 | v11) == 1)
  {
    -[MSPMutableHistoryEntryRoute startWaypoint](self, "startWaypoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v5, "startWaypoint");
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        -[MSPMutableHistoryEntryRoute startWaypoint](self, "startWaypoint");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "geoMapItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "startWaypoint");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "geoMapItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();

      }
      else
      {
        IsEqualToMapItemForPurpose = 0;
      }

    }
    else
    {
      IsEqualToMapItemForPurpose = 0;
    }

  }
  else
  {
    IsEqualToMapItemForPurpose = 1;
  }
  -[MSPMutableHistoryEntryRoute endWaypoint](self, "endWaypoint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isCurrentLocation");
  if (v19)
  {
    objc_msgSend(v5, "endWaypoint");
    v3 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v3, "isCurrentLocation") & 1) != 0)
    {
      v20 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  -[MSPMutableHistoryEntryRoute endWaypoint](self, "endWaypoint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "geoMapItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endWaypoint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "geoMapItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = GEOMapItemIsEqualToMapItemForPurpose();

  if (v19)
    goto LABEL_20;
LABEL_21:

  return IsEqualToMapItemForPurpose & v20;
}

- (MSPRouteInformationSource)routeInformationSource
{
  return self->_routeInformationSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeInformationSource, 0);
}

@end
