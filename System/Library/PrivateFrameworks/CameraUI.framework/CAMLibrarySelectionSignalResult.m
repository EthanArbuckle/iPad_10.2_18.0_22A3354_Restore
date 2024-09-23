@implementation CAMLibrarySelectionSignalResult

+ (CAMLibrarySelectionSignalResult)librarySelectionSignalResultWithIdentitiesInProximity:(id)a3 currentLocation:(id)a4 locationAuthorizationStatus:(int)a5 homeLocations:(id)a6 frequentLocations:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v8 = *(_QWORD *)&a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentitiesInProximity:currentLocation:locationAuthorizationStatus:homeLocations:frequentLocations:", v15, v14, v8, v13, v12);

  return (CAMLibrarySelectionSignalResult *)v16;
}

- (CAMLibrarySelectionSignalResult)initWithIdentitiesInProximity:(id)a3 currentLocation:(id)a4 locationAuthorizationStatus:(int)a5 homeLocations:(id)a6 frequentLocations:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CAMLibrarySelectionSignalResult *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSArray *frequentAndHomeLocations;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CAMLibrarySelectionSignalResult;
  v16 = -[CAMLibrarySelectionSignalResult init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    v18 = (void *)v17;
    v19 = (void *)MEMORY[0x1E0C9AA60];
    if (v17)
      v20 = (void *)v17;
    else
      v20 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v16->_identitiesInProximity, v20);

    objc_storeStrong((id *)&v16->_currentLocation, a4);
    v16->_locationAuthorizationStatus = a5;
    if (v14)
      v21 = v14;
    else
      v21 = v19;
    objc_storeStrong((id *)&v16->_homeLocations, v21);
    if (v15)
      v22 = v15;
    else
      v22 = v19;
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    frequentAndHomeLocations = v16->_frequentAndHomeLocations;
    v16->_frequentAndHomeLocations = (NSArray *)v23;

  }
  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CAMLibrarySelectionSignalResult;
  -[CAMLibrarySelectionSignalResult description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: identitiesInProximity: %@, currentLocation: %@, locationAuthorizationStatus: %d, homeLocations: %@, number of frequent and home locations: %lu"), v4, self->_identitiesInProximity, self->_currentLocation, self->_locationAuthorizationStatus, self->_homeLocations, -[NSArray count](self->_frequentAndHomeLocations, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)cameraHasAccessToLocation
{
  return -[CAMLibrarySelectionSignalResult locationAuthorizationStatus](self, "locationAuthorizationStatus")- 3 < 2;
}

- (BOOL)isOnTrip
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CAMLibrarySelectionSignalResult frequentAndHomeLocations](self, "frequentAndHomeLocations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

    return 0;
  }
  -[CAMLibrarySelectionSignalResult currentLocation](self, "currentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CAMLibrarySelectionSignalResult frequentAndHomeLocations](self, "frequentAndHomeLocations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)objc_opt_class();
        -[CAMLibrarySelectionSignalResult currentLocation](self, "currentLocation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "distanceBetweenLocation:andCircularRegion:atDate:", v12, v10, 0);
        v14 = v13;

        if (v14 < 50000.0)
        {
          v15 = 0;
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_15:

  return v15;
}

- (BOOL)currentLocationCloseToHome
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CAMLibrarySelectionSignalResult currentLocation](self, "currentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLibrarySelectionSignalResult homeLocations](self, "homeLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "currentLocation:isContainedInCircularRegions:", v4, v5);

  return (char)v3;
}

- (id)frequentLocationRegionContainingLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CAMLibrarySelectionSignalResult frequentAndHomeLocations](self, "frequentAndHomeLocations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_opt_class();
        v19 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend((id)v11, "currentLocation:isContainedInCircularRegions:", v4, v12);

        if ((v11 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)suggestsSharing
{
  NSNumber *suggestsSharingValue;
  void *v4;
  int v5;
  BOOL v6;
  int v7;
  void *v8;
  double v9;
  CLLocationDegrees v10;
  double v11;
  CLLocationDegrees v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  NSObject *v22;
  NSNumber *v23;
  NSNumber *v24;
  _DWORD v26[2];
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;
  CLLocationCoordinate2D v36;

  v35 = *MEMORY[0x1E0C80C00];
  suggestsSharingValue = self->_suggestsSharingValue;
  if (suggestsSharingValue)
    return -[NSNumber BOOLValue](suggestsSharingValue, "BOOLValue");
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMLibrarySelectionSignalResult locationAuthorizationStatus](self, "locationAuthorizationStatus");
  if (v5)
    v6 = v5 == -1;
  else
    v6 = 1;
  v7 = v6;
  if (v6 || !-[CAMLibrarySelectionSignalResult cameraHasAccessToLocation](self, "cameraHasAccessToLocation"))
  {
    v15 = 0;
    v16 = 0;
    LODWORD(v13) = 0;
  }
  else
  {
    -[CAMLibrarySelectionSignalResult currentLocation](self, "currentLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    v10 = v9;
    v12 = v11;

    -[CAMLibrarySelectionSignalResult currentLocation](self, "currentLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v36.latitude = v10;
      v36.longitude = v12;
      v14 = CLLocationCoordinate2DIsValid(v36);

      if (v14)
      {
        LODWORD(v13) = -[CAMLibrarySelectionSignalResult currentLocationCloseToHome](self, "currentLocationCloseToHome");
        v15 = 1;
      }
      else
      {
        v15 = 0;
        LODWORD(v13) = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    v16 = 1;
  }
  v17 = objc_msgSend(v4, "shareWhenAtHomeEnabled") & v13;
  -[CAMLibrarySelectionSignalResult identitiesInProximity](self, "identitiesInProximity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if ((v17 & 1) == 0 && v19)
  {
    if ((v7 & 1) != 0 || ((v16 ^ 1) & 1) != 0)
    {
      if (v7)
      {
LABEL_25:
        v17 = v15 & (v13 ^ 1);
        goto LABEL_28;
      }
    }
    else
    {
      -[CAMLibrarySelectionSignalResult homeLocations](self, "homeLocations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count"))
      {
        v21 = objc_msgSend(v4, "shareWhenAtHomeEnabled");

        if ((v21 & 1) != 0)
          goto LABEL_27;
        goto LABEL_25;
      }

    }
LABEL_27:
    v17 = 1;
  }
LABEL_28:
  v22 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v26[0] = 67110144;
    v26[1] = v17;
    v27 = 1024;
    v28 = v7;
    v29 = 1024;
    v30 = v16;
    v31 = 1024;
    v32 = (int)v13;
    v33 = 1024;
    v34 = v19 != 0;
    _os_log_impl(&dword_1DB760000, v22, OS_LOG_TYPE_INFO, "[CAMLibrarySelectionSignalResult] suggestsSharing: %d, cameraLocationAuthorizationPending: %d, cameraHasAccessToLocation: %d, currentLocationCloseToHome: %d, hasIdentitiesInProximity: %d", (uint8_t *)v26, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v24 = self->_suggestsSharingValue;
  self->_suggestsSharingValue = v23;

  suggestsSharingValue = self->_suggestsSharingValue;
  return -[NSNumber BOOLValue](suggestsSharingValue, "BOOLValue");
}

- (id)resultDiagnostics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v30[2];
  _QWORD v31[3];
  CLLocationCoordinate2D v32;

  v31[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMLibrarySelectionSignalResult identitiesInProximity](self, "identitiesInProximity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("countOfIdentitiesInProximity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAMLibrarySelectionSignalResult suggestsSharing](self, "suggestsSharing"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("suggestsSharing"));

  -[CAMLibrarySelectionSignalResult currentLocation](self, "currentLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v30[0] = CFSTR("coordinateIsValid");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "coordinate");
    objc_msgSend(v10, "numberWithBool:", CLLocationCoordinate2DIsValid(v32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = CFSTR("horizontalAccuracy");
    v31[0] = v11;
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "horizontalAccuracy");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("currentLocation"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA3B2DE0, CFSTR("currentLocation"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMLibrarySelectionSignalResult locationAuthorizationStatus](self, "locationAuthorizationStatus"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("locationAuthorizationStatus"));

  -[CAMLibrarySelectionSignalResult homeLocations](self, "homeLocations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLibrarySelectionSignalResult _diagnosticsForRegions:](self, "_diagnosticsForRegions:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("homeLocationsDiagnostics"));

  -[CAMLibrarySelectionSignalResult frequentAndHomeLocations](self, "frequentAndHomeLocations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLibrarySelectionSignalResult _diagnosticsForRegions:](self, "_diagnosticsForRegions:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("frequentLocationsDiagnostics"));

  v20 = (void *)objc_opt_class();
  -[CAMLibrarySelectionSignalResult homeLocations](self, "homeLocations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "currentLocation:isContainedInCircularRegions:", v9, v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("closeToHomeLocation"));

  v24 = (void *)objc_opt_class();
  -[CAMLibrarySelectionSignalResult frequentAndHomeLocations](self, "frequentAndHomeLocations");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "currentLocation:isContainedInCircularRegions:", v9, v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("closeToFrequentLocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAMLibrarySelectionSignalResult isOnTrip](self, "isOnTrip"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("isOnTrip"));

  return v3;
}

- (id)_diagnosticsForRegions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;
  CLLocationCoordinate2D v31;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  -[CAMLibrarySelectionSignalResult currentLocation](self, "currentLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = *MEMORY[0x1E0C9E318];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        v13 = v10;
        if (v6)
        {
          objc_msgSend((id)objc_opt_class(), "distanceBetweenLocation:andCircularRegion:atDate:", v6, v12, 0);
          v13 = v14;
        }
        v27[0] = CFSTR("coordinateIsValid");
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "center");
        objc_msgSend(v15, "numberWithBool:", CLLocationCoordinate2DIsValid(v31));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v16;
        v27[1] = CFSTR("radius");
        v17 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "radius");
        objc_msgSend(v17, "numberWithDouble:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28[1] = v18;
        v27[2] = CFSTR("distanceFromCurrentLocation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28[2] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v20);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v8);
  }

  return v5;
}

+ (double)distanceBetweenLocation:(id)a3 andCircularRegion:(id)a4 atDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CLLocationCoordinate2D v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "coordinate");
  if (!v7 || !CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v10))
    goto LABEL_10;
  if (v9)
  {
    objc_msgSend(v7, "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v12);
    v14 = v13;

    v15 = v14 <= 60.0 ? 0.0 : v14 * 30.0;
  }
  else
  {
    v15 = 0.0;
  }
  objc_msgSend(v7, "horizontalAccuracy");
  v17 = v16;
  objc_msgSend(v8, "center");
  if (CLLocationCoordinate2DIsValid(v21))
  {
    CLLocationCoordinate2DGetDistanceFrom();
    v19 = fmin(v18, fmax(v18 - (v15 + v17), 0.0));
  }
  else
  {
LABEL_10:
    v19 = *MEMORY[0x1E0C9E318];
  }

  return v19;
}

+ (BOOL)currentLocation:(id)a3 isContainedInCircularRegions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(a1, "distanceBetweenLocation:andCircularRegion:atDate:", v6, v12, 0, (_QWORD)v18);
        v14 = v13;
        objc_msgSend(v12, "radius");
        if (v14 < fmin(fmax(v15, 50.0), 750.0))
        {
          v16 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (NSArray)identitiesInProximity
{
  return self->_identitiesInProximity;
}

- (void)setIdentitiesInProximity:(id)a3
{
  objc_storeStrong((id *)&self->_identitiesInProximity, a3);
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (int)locationAuthorizationStatus
{
  return self->_locationAuthorizationStatus;
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (NSArray)frequentAndHomeLocations
{
  return self->_frequentAndHomeLocations;
}

- (NSNumber)suggestsSharingValue
{
  return self->_suggestsSharingValue;
}

- (void)setSuggestsSharingValue:(id)a3
{
  objc_storeStrong((id *)&self->_suggestsSharingValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestsSharingValue, 0);
  objc_storeStrong((id *)&self->_frequentAndHomeLocations, 0);
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_identitiesInProximity, 0);
}

@end
