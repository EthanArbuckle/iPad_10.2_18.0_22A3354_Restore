@implementation CLSRoutineService

- (CLSRoutineService)initWithFetchDateInterval:(id)a3 locationCache:(id)a4
{
  id v7;
  id v8;
  CLSRoutineService *v9;
  CLSRoutineService *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSRoutineService;
  v9 = -[CLSRoutineService init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_routineIsAvailable = 1;
    objc_storeStrong((id *)&v9->_fetchDateInterval, a3);
    objc_storeStrong((id *)&v10->_locationCache, a4);
    -[CLSRoutineService invalidateLocationsOfInterest](v10, "invalidateLocationsOfInterest");
  }

  return v10;
}

- (void)invalidateLocationsOfInterest
{
  CLSLocationOfInterestCache *visitsCache;
  NSMutableSet *v4;
  NSMutableSet *pendingPinningVisitIdentifiers;

  self->_statistics.pinningVisitsRatio = 0.0;
  *(_OWORD *)&self->_statistics.numberOfTimeMatches = 0u;
  *(_OWORD *)&self->_statistics.numberOfRemoteLocationMatches = 0u;
  *(_OWORD *)&self->_statistics.routineAvailable = 0u;
  *(_OWORD *)&self->_statistics.numberOfVisits = 0u;
  visitsCache = self->_visitsCache;
  self->_visitsCache = 0;

  v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  pendingPinningVisitIdentifiers = self->_pendingPinningVisitIdentifiers;
  self->_pendingPinningVisitIdentifiers = v4;

}

- (BOOL)hasLocationsOfInterestInformation
{
  void *v2;
  BOOL v3;

  -[CLSRoutineService visitsCache](self, "visitsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfLocationsOfInterest") != 0;

  return v3;
}

- (id)lastLocationOfInterestVisit
{
  void *v2;
  void *v3;

  -[CLSRoutineService visitsCache](self, "visitsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastLocationOfInterestVisit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)visitsCache
{
  CLSRoutineService *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_visitsCache)
    -[CLSRoutineService _buildLocationsOfInterestCache](v2, "_buildLocationsOfInterestCache");
  objc_sync_exit(v2);

  return v2->_visitsCache;
}

- (void)cacheLocationOfInterest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CLSRoutineService visitsCache](self, "visitsCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addLocationOfInterest:", v4);

}

- (id)locationsOfInterestOfType:(int64_t)a3
{
  void *v4;
  void *v5;

  -[CLSRoutineService visitsCache](self, "visitsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationsOfInterestOfType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)placemarksOfInterestOfType:(int64_t)a3
{
  void *v4;
  void *v5;

  -[CLSRoutineService locationsOfInterestOfType:](self, "locationsOfInterestOfType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSRoutineService _placemarksFromLocationsOfInterest:](self, "_placemarksFromLocationsOfInterest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)locationOfInterestCloseToLocation:(id)a3 inDateInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[CLSRoutineService visitsCache](self, "visitsCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "closestLocationOfInterestVisitToLocation:withinDistance:inDateInterval:", v7, v6, 200.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "locationOfInterest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CLSRoutineService visitsCache](self, "visitsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationOfInterestAtLocation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)locationOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CLSRoutineService visitsCache](self, "visitsCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationsOfInterestVisitsAtLocation:inDateInterval:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)locationOfInterestVisitsInDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CLSRoutineService visitsCache](self, "visitsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationsOfInterestVisitsAtLocation:inDateInterval:", 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isRemoteLocation:(id)a3 inDateInterval:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableSet *pendingPinningVisitIdentifiers;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  _BOOL4 v26;
  double v27;
  unint64_t numberOfVisits;
  unint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ++self->_statistics.numberOfMatchRequests;
  -[CLSRoutineService visitsCache](self, "visitsCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationsOfInterestVisitsInDateInterval:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
    goto LABEL_3;
  objc_msgSend(v8, "earliestVisitStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

  if (v12 == 1)
    goto LABEL_3;
  v33 = v8;
  v34 = v7;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v32 = v9;
  obj = v9;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        pendingPinningVisitIdentifiers = self->_pendingPinningVisitIdentifiers;
        objc_msgSend(v19, "identifier", v32, v33, v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](pendingPinningVisitIdentifiers, "addObject:", v21);

        objc_msgSend(v19, "locationOfInterest");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "location");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "distanceFromLocation:", v6);
        v25 = v24;
        objc_msgSend(v22, "placemarkLocationDistanceFromLocation:locationCache:", v23, self->_locationCache);
        v26 = v25 <= 200.0;
        if (v27 <= 200.0)
          v26 = 1;
        if (v26)
          ++self->_statistics.numberOfCloseByLocationMatches;
        v16 |= v26;

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  self->_statistics.numberOfTimeMatches += objc_msgSend(obj, "count");
  numberOfVisits = self->_statistics.numberOfVisits;
  if (numberOfVisits)
    self->_statistics.pinningVisitsRatio = (double)(unint64_t)-[NSMutableSet count](self->_pendingPinningVisitIdentifiers, "count")/ (double)numberOfVisits;
  if ((v16 & 1) != 0)
  {
    v13 = 0;
LABEL_25:
    v8 = v33;
    v7 = v34;
    v9 = v32;
    goto LABEL_26;
  }
  v29 = -[CLSRoutineService _devicePlacementTypeForLocationsOfInterestVisits:](self, "_devicePlacementTypeForLocationsOfInterestVisits:", obj);
  v13 = 0;
  if (!v29)
    goto LABEL_25;
  v8 = v33;
  v7 = v34;
  v9 = v32;
  if (v29 == 3)
    goto LABEL_26;
  -[CLSRoutineService _disambiguationDistanceForDevicePlacementType:](self, "_disambiguationDistanceForDevicePlacementType:", v29);
  objc_msgSend(v33, "closestLocationOfInterestVisitToLocation:withinDistance:inDateInterval:", v6, v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    ++self->_statistics.numberOfRemoteLocationMatches;
    v13 = 1;
    goto LABEL_26;
  }
LABEL_3:
  v13 = 0;
LABEL_26:

  return v13;
}

- (unint64_t)_devicePlacementTypeForLocationsOfInterestVisits:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 <= 2)
    {
      objc_msgSend(v3, "anyObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "visitInterval");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "duration");
      v9 = v8;

      if (v9 >= 43200.0)
      {
        if (v9 >= 172800.0)
        {
          if (v9 <= 86400.0)
            v5 = 0;
          else
            v5 = 3;
        }
        else
        {
          v5 = 2;
        }
      }
      else
      {
        v5 = 1;
      }

    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_disambiguationDistanceForDevicePlacementType:(unint64_t)a3
{
  double result;

  result = 1.79769313e308;
  if (a3 == 2)
    result = 200000.0;
  if (a3 == 1)
    return 50000.0;
  return result;
}

- (int64_t)predominantTransportationModeForDateInterval:(id)a3 confidence:(double *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  double v29;
  uint64_t j;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CLSRoutineService visitsCache](self, "visitsCache");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "locationsOfInterestTransitionInDateInterval:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "transportationMode");
        objc_msgSend(v13, "transitionInterval");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "duration");
        v17 = v16;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17 + v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v23);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v10);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v24 = v7;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v41;
    v28 = -1;
    v29 = -1.79769313e308;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v24);
        v31 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(v24, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        v34 = v33;

        if (v34 > v29)
        {
          v28 = objc_msgSend(v31, "unsignedIntegerValue");
          v29 = v34;
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v26);

    v35 = 1.0;
    if (v29 != -1.79769313e308)
    {
      objc_msgSend(v5, "duration");
      if (v36 > 0.0)
        v35 = fmin(v29 / v36, 1.0);
    }
  }
  else
  {

    v35 = 1.0;
    v28 = -1;
  }
  if (a4)
    *a4 = v35;

  return v28;
}

- (void)_buildLocationsOfInterestCache
{
  CLSRoutineService *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  CLSLitePlacemark *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  CLSLocationOfInterest *v21;
  void *v22;
  void *v23;
  CLSLocationOfInterest *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  CLSLocationOfInterestVisit *v37;
  void *v38;
  CLSLocationOfInterestVisit *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  CLSLocationOfInterestTransition *v57;
  void *v58;
  CLSLocationOfInterestTransition *v59;
  CLSLocationOfInterestCache *visitsCache;
  CLSLocationOfInterestCache *v61;
  void *v62;
  void *v63;
  void *v64;
  CLSRoutineService *v65;
  id obj;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  CLSLitePlacemark *v70;
  void *v71;
  void *v72;
  void *context;
  void *contexta;
  uint64_t v75;
  CLSLocationOfInterestCache *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  unint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (self->_routineIsAvailable)
  {
    v2 = self;
    v76 = -[CLSLocationOfInterestCache initWithLocationCache:]([CLSLocationOfInterestCache alloc], "initWithLocationCache:", self->_locationCache);
    v3 = (void *)MEMORY[0x1D1796094]();
    objc_msgSend(MEMORY[0x1E0D18460], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSRoutineService _fetchLocationsOfInterestWithinDateInterval:routineManager:](v2, "_fetchLocationsOfInterestWithinDateInterval:routineManager:", v2->_fetchDateInterval, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2->_routineIsAvailable)
    {
      v62 = v3;
      v63 = v5;
      v64 = v4;
      v65 = v2;
      if (v5)
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        obj = v5;
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        if (v68)
        {
          v67 = *(_QWORD *)v82;
          do
          {
            v6 = 0;
            do
            {
              if (*(_QWORD *)v82 != v67)
                objc_enumerationMutation(obj);
              v7 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v6);
              v8 = MEMORY[0x1D1796094]();
              v9 = v7;
              objc_msgSend(v9, "mapItem");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v10, "validMUID"))
                v11 = objc_msgSend(v10, "muid");
              else
                v11 = 0;
              v12 = -[CLSLitePlacemark initWithRTMapItem:]([CLSLitePlacemark alloc], "initWithRTMapItem:", v10);
              v13 = objc_msgSend(v9, "type");
              v14 = v13 + 1;
              context = (void *)v8;
              v75 = v6;
              v71 = v10;
              if ((unint64_t)(v13 + 1) >= 5)
              {
                v17 = v13;
                +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "loggingConnection");
                v19 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  v92 = v17;
                  _os_log_error_impl(&dword_1CAB79000, v19, OS_LOG_TYPE_ERROR, "Undefined LocationOfInterestType %lu. File a radar against Photos Media Mining.", buf, 0xCu);
                }

                v15 = -1;
                v16 = 50.0;
              }
              else
              {
                v15 = qword_1CABE8E70[v14];
                v16 = dbl_1CABE8E98[v14];
              }
              -[CLSLitePlacemark location](v12, "location", v62);
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = [CLSLocationOfInterest alloc];
              objc_msgSend(v9, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = v12;
              -[CLSLitePlacemark region](v12, "region");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = (void *)v20;
              v24 = -[CLSLocationOfInterest initWithIdentifier:locationOfInterestType:location:placemarkRegion:businessItemMuid:radius:](v21, "initWithIdentifier:locationOfInterestType:location:placemarkRegion:businessItemMuid:radius:", v22, v15, v20, v23, v11, v16);

              v87 = 0u;
              v88 = 0u;
              v85 = 0u;
              v86 = 0u;
              v72 = v9;
              objc_msgSend(v9, "visits");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v85, buf, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v86;
                do
                {
                  for (i = 0; i != v27; ++i)
                  {
                    if (*(_QWORD *)v86 != v28)
                      objc_enumerationMutation(v25);
                    v30 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                    v31 = objc_alloc(MEMORY[0x1E0CB3588]);
                    objc_msgSend(v30, "entryDate");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "exitDate");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = (void *)objc_msgSend(v31, "initWithStartDate:endDate:", v32, v33);

                    objc_msgSend(v30, "locationOfInterestConfidence");
                    v36 = v35;
                    v37 = [CLSLocationOfInterestVisit alloc];
                    objc_msgSend(v30, "identifier");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = -[CLSLocationOfInterestVisit initWithIdentifier:visitInterval:confidence:](v37, "initWithIdentifier:visitInterval:confidence:", v38, v34, v36);

                    -[CLSLocationOfInterest addVisit:](v24, "addVisit:", v39);
                  }
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v85, buf, 16);
                }
                while (v27);
              }

              -[CLSLocationOfInterestCache addLocationOfInterest:](v76, "addLocationOfInterest:", v24);
              objc_autoreleasePoolPop(context);
              v6 = v75 + 1;
            }
            while (v75 + 1 != v68);
            v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
          }
          while (v68);
        }

        v2 = v65;
      }
      contexta = (void *)MEMORY[0x1D1796094]();
      -[CLSRoutineService _fetchLocationOfInterestTransitionsWithinDateInterval:routineManager:](v2, "_fetchLocationOfInterestTransitionsWithinDateInterval:routineManager:", v2->_fetchDateInterval, v4);
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v78;
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v78 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v44);
            v46 = (void *)MEMORY[0x1D1796094]();
            v47 = v45;
            v48 = objc_alloc(MEMORY[0x1E0CB3588]);
            objc_msgSend(v47, "startDate");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "stopDate");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = (void *)objc_msgSend(v48, "initWithStartDate:endDate:", v49, v50);

            v52 = objc_msgSend(v47, "modeOfTransportation");
            v53 = v52;
            if (v52 >= 4)
            {
              +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "loggingConnection");
              v56 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                v92 = v53;
                _os_log_error_impl(&dword_1CAB79000, v56, OS_LOG_TYPE_ERROR, "Undefined ModeOfTransportation %lu. File a radar against Photos Media Mining.", buf, 0xCu);
              }

              v54 = -1;
            }
            else
            {
              v54 = v52 - 1;
            }
            v57 = [CLSLocationOfInterestTransition alloc];
            objc_msgSend(v47, "identifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = -[CLSLocationOfInterestTransition initWithIdentifier:transitionInterval:transportationMode:](v57, "initWithIdentifier:transitionInterval:transportationMode:", v58, v51, v54);

            -[CLSLocationOfInterestCache addLocationOfInterestTransition:](v76, "addLocationOfInterestTransition:", v59);
            objc_autoreleasePoolPop(v46);
            ++v44;
          }
          while (v42 != v44);
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        }
        while (v42);
      }

      objc_autoreleasePoolPop(contexta);
      v4 = v64;
      v2 = v65;
      v3 = v62;
      v5 = v63;
    }

    objc_autoreleasePoolPop(v3);
    visitsCache = v2->_visitsCache;
    v2->_visitsCache = v76;
    v61 = v76;

    -[CLSLocationOfInterestCache numberOfLocationsOfInterest](v61, "numberOfLocationsOfInterest");
    -[CLSLocationOfInterestCache numberOfLocationsOfInterestVisits](v61, "numberOfLocationsOfInterestVisits");
    -[CLSLocationOfInterestCache numberOfLocationsOfInterestTransitions](v61, "numberOfLocationsOfInterestTransitions");

  }
}

- (id)_fetchLocationsOfInterestWithinDateInterval:(id)a3 routineManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  dispatch_block_t v12;
  void *v13;
  void *v14;
  id v15;
  dispatch_time_t v16;
  void *v17;
  NSObject *v18;
  uint8_t v20[8];
  _QWORD v21[4];
  id v22;
  CLSRoutineService *v23;
  id v24;

  v6 = a3;
  v7 = a4;
  -[CLSRoutineService _fetchHomeAndWorkLocationsOfInterestWithRoutineManager:](self, "_fetchHomeAndWorkLocationsOfInterestWithRoutineManager:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_routineIsAvailable)
  {
    if (v8)
    {
      v10 = objc_msgSend(v8, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (id)v10;
    if (v6)
    {
      v12 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_4354);
      objc_msgSend(v6, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __80__CLSRoutineService__fetchLocationsOfInterestWithinDateInterval_routineManager___block_invoke_2;
      v21[3] = &unk_1E84F88C8;
      v11 = v11;
      v22 = v11;
      v23 = self;
      v15 = v12;
      v24 = v15;
      objc_msgSend(v7, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:", v13, v14, v21);

      v16 = dispatch_time(0, 2000000000);
      if (dispatch_block_wait(v15, v16))
      {
        +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "loggingConnection");
        v18 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_error_impl(&dword_1CAB79000, v18, OS_LOG_TYPE_ERROR, "Timeout getting loi information from CoreRoutine", v20, 2u);
        }

        self->_routineIsAvailable = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_fetchHomeAndWorkLocationsOfInterestWithRoutineManager:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  CLSRoutineService *v16;

  v4 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __76__CLSRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke;
  v14 = &unk_1E84F8938;
  v15 = v4;
  v16 = self;
  v5 = v4;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D1796244](&v11);
  v6[2](v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_routineIsAvailable)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v6[2](v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_routineIsAvailable)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = (void *)objc_msgSend(v7, "mutableCopy", v11, v12, v13, v14, v15, v16);
  objc_msgSend(v9, "addObjectsFromArray:", v8);
LABEL_6:

  return v9;
}

- (id)_fetchLocationOfInterestTransitionsWithinDateInterval:(id)a3 routineManager:(id)a4
{
  id v6;
  id v7;
  dispatch_block_t v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_time_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t v17[8];
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__4343;
    v25 = __Block_byref_object_dispose__4344;
    v26 = 0;
    v8 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_11);
    objc_msgSend(v6, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__CLSRoutineService__fetchLocationOfInterestTransitionsWithinDateInterval_routineManager___block_invoke_2;
    v18[3] = &unk_1E84F8980;
    v20 = &v21;
    v18[4] = self;
    v11 = v8;
    v19 = v11;
    objc_msgSend(v7, "fetchTransitionsBetweenStartDate:endDate:handler:", v9, v10, v18);

    v12 = dispatch_time(0, 2000000000);
    if (dispatch_block_wait(v11, v12))
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_1CAB79000, v14, OS_LOG_TYPE_ERROR, "Timeout getting loi transitions from CoreRoutine", v17, 2u);
      }

      v15 = 0;
      self->_routineIsAvailable = 0;
    }
    else if (self->_routineIsAvailable)
    {
      v15 = (id)v22[5];
    }
    else
    {
      v15 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_pinPendingVisits
{
  uint64_t v3;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSMutableSet *v24;
  NSMutableSet *pendingPinningVisitIdentifiers;
  dispatch_semaphore_t v26;
  NSMutableSet *v27;
  dispatch_time_t v28;
  void *v29;
  NSObject *v30;
  NSMutableSet *v31;
  NSMutableSet *v32;
  uint8_t v33[8];
  _QWORD v34[5];
  NSObject *v35;
  _BYTE *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE buf[24];
  char v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableSet count](self->_pendingPinningVisitIdentifiers, "count");
  if (self->_routineIsAvailable && v3 != 0)
  {
    v5 = v3;
    -[CLSRoutineService visitsCache](self, "visitsCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (double)v5;
    v8 = (double)(unint64_t)objc_msgSend(v6, "numberOfLocationsOfInterestVisits");
    if (v8 * 0.8 <= (double)v5)
    {
      objc_msgSend(v6, "locationsOfInterestOfType:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v10 = 0;
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v42 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "visits");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "count");

            v10 += v15;
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        }
        while (v11);
      }
      objc_msgSend(v6, "locationsOfInterestOfType:", 1);
      v16 = objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v38 != v18)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "visits");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");

            v10 += v21;
          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        }
        while (v17);
      }
      if (v8 * 0.9 > (double)v10)
      {
        +[CLSLogging sharedLogging](CLSLogging, "sharedLogging", v8 * 0.9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "loggingConnection");
        v23 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(double *)&buf[4] = v7 / v8;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (double)v10 / v8;
          _os_log_impl(&dword_1CAB79000, v23, OS_LOG_TYPE_INFO, "Safeguard Pinning. Not pinning any visits. total %f, homeWork %f", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v24 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        pendingPinningVisitIdentifiers = self->_pendingPinningVisitIdentifiers;
        self->_pendingPinningVisitIdentifiers = v24;

LABEL_30:
        return;
      }

    }
    objc_msgSend(MEMORY[0x1E0D18460], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v46 = 0;
    v27 = self->_pendingPinningVisitIdentifiers;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __38__CLSRoutineService__pinPendingVisits__block_invoke;
    v34[3] = &unk_1E84F89A8;
    v36 = buf;
    v34[4] = self;
    v16 = v26;
    v35 = v16;
    objc_msgSend(v9, "extendLifetimeOfVisitsWithIdentifiers:handler:", v27, v34);
    v28 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v16, v28))
    {
      *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "loggingConnection");
      v30 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v33 = 0;
        _os_log_error_impl(&dword_1CAB79000, v30, OS_LOG_TYPE_ERROR, "Timeout pinning visits CoreRoutine", v33, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v31 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v32 = self->_pendingPinningVisitIdentifiers;
    self->_pendingPinningVisitIdentifiers = v31;

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
}

- (id)_placemarksFromLocationsOfInterest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "placemarkWithLocationCache:", self->_locationCache, (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)routineIsAvailable
{
  return self->_routineIsAvailable;
}

- (void)setRoutineIsAvailable:(BOOL)a3
{
  self->_routineIsAvailable = a3;
}

- (CLSRoutineServiceStatisticsStruct)statistics
{
  CLSRoutineServiceStatisticsStruct *result;

  objc_copyStruct(retstr, &self->_statistics, 72, 1, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_pendingPinningVisitIdentifiers, 0);
  objc_storeStrong((id *)&self->_visitsCache, 0);
  objc_storeStrong((id *)&self->_fetchDateInterval, 0);
}

void __38__CLSRoutineService__pinPendingVisits__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 == 0;
  if (v3)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(v3, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1CAB79000, v5, OS_LOG_TYPE_ERROR, "Could not pin visit with UUIDs %@. \"%@\", (uint8_t *)&v8, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __90__CLSRoutineService__fetchLocationOfInterestTransitionsWithinDateInterval_routineManager___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = (uint64_t)v7;
      v13 = 2112;
      v14 = v10;
      _os_log_error_impl(&dword_1CAB79000, v9, OS_LOG_TYPE_ERROR, "CoreRoutine error getting loi transitions, error: %@, userInfo: %@", (uint8_t *)&v11, 0x16u);

    }
    *(_BYTE *)(a1[4] + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1CAB79000, v9, OS_LOG_TYPE_INFO, "CoreRoutine found %lu transitions.", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  (*(void (**)(void))(a1[5] + 16))();

}

id __76__CLSRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke(uint64_t a1, uint64_t a2)
{
  dispatch_block_t v4;
  void *v5;
  id v6;
  dispatch_time_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t v12[16];
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4343;
  v21 = __Block_byref_object_dispose__4344;
  v22 = 0;
  v4 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__CLSRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke_2;
  v13[3] = &unk_1E84F8910;
  v15 = &v17;
  v16 = a2;
  v5 = *(void **)(a1 + 32);
  v13[4] = *(_QWORD *)(a1 + 40);
  v6 = v4;
  v14 = v6;
  objc_msgSend(v5, "fetchLocationsOfInterestOfType:withHandler:", a2, v13);
  v7 = dispatch_time(0, 2000000000);
  if (dispatch_block_wait(v6, v7))
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1CAB79000, v9, OS_LOG_TYPE_ERROR, "Timeout getting loi information from CoreRoutine", v12, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 40) = 0;
  }
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __76__CLSRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = (uint64_t)v7;
      v15 = 2112;
      v16 = v12;
      _os_log_error_impl(&dword_1CAB79000, v9, OS_LOG_TYPE_ERROR, "CoreRoutine error getting lois, error: %@, userInfo: %@", (uint8_t *)&v13, 0x16u);

    }
    *(_BYTE *)(a1[4] + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v6, "count");
      v11 = (void *)a1[7];
      v13 = 134218240;
      v14 = v10;
      v15 = 2048;
      v16 = v11;
      _os_log_impl(&dword_1CAB79000, v9, OS_LOG_TYPE_INFO, "CoreRoutine found %lu lois for type %lu", (uint8_t *)&v13, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __80__CLSRoutineService__fetchLocationsOfInterestWithinDateInterval_routineManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();

  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = (uint64_t)v6;
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_ERROR, "CoreRoutine error getting lois, error: %@, userInfo: %@", (uint8_t *)&v10, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_INFO, "CoreRoutine found %lu lois", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
