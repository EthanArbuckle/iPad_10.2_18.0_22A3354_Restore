@implementation MKLocationManager

- (double)headingUpdateTimeInterval
{
  return 0.2;
}

- (CLHeading)throttledHeading
{
  CLHeading *throttledHeading;
  CLHeading *heading;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  throttledHeading = self->_throttledHeading;
  if (throttledHeading)
  {
    heading = self->_heading;
    if (heading)
    {
      if (heading == throttledHeading)
        goto LABEL_11;
      -[CLHeading timestamp](throttledHeading, "timestamp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLHeading timestamp](self->_heading, "timestamp");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "compare:", v6);

      if (v7 == -1)
        goto LABEL_11;
      -[CLHeading headingAccuracy](self->_throttledHeading, "headingAccuracy");
      v9 = v8;
      -[CLHeading headingAccuracy](self->_heading, "headingAccuracy");
      v11 = vabdd_f64(v9, v10);
      -[CLHeading heading](self->_throttledHeading, "heading");
      v13 = v12;
      -[CLHeading heading](self->_heading, "heading");
      v15 = vabdd_f64(v13, v14);
      if (v11 <= 2.0 && v15 <= 2.0)
      {
LABEL_11:
        throttledHeading = 0;
        return throttledHeading;
      }
      throttledHeading = self->_throttledHeading;
    }
    throttledHeading = throttledHeading;
  }
  return throttledHeading;
}

- (void)locationProviderDidChangeAuthorizationStatus:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  CLLocation *lastLocation;
  CLLocation *lastGoodLocation;
  void *v10;
  void *v11;
  _BYTE buf[24];
  MKLocationManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v13 = self;
    v6 = *(id *)&buf[4];
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "Location provider [%@](%p) for %@ did change auth status", buf, 0x20u);

  }
  GEOOnce();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v13) = 0;
  v7 = v4;
  geo_isolate_sync();
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[NSLock lock](self->_lastLocationLock, "lock");
    lastLocation = self->_lastLocation;
    self->_lastLocation = 0;

    lastGoodLocation = self->_lastGoodLocation;
    self->_lastGoodLocation = 0;

    -[NSLock unlock](self->_lastLocationLock, "unlock");
  }
  if (-[MKLocationManager isLocationServicesAvailable](self, "isLocationServicesAvailable"))
    -[MKLocationManager _syncLocationProviderWithTracking](self, "_syncLocationProviderWithTracking");
  else
    -[MKLocationManager reset](self, "reset");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", MKLocationManagerApprovalDidChangeNotification, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotification:", v11);

  _Block_object_dispose(buf, 8);
}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4 lastKnownNavCourse:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  const __CFString *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  GEOLocationShifter *locationShifter;
  GEOLocationShifter *v54;
  GEOLocationShifter *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t, double, double);
  void *v61;
  id v62;
  MKLocationManager *v63;
  id v64;
  double v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _OWORD v74[2];
  uint8_t buf[96];
  __int128 v76;
  __int128 v77;
  _OWORD v78[2];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "coordinate");
    v12 = v11;
    objc_msgSend(v9, "coordinate");
    v14 = v13;
    objc_msgSend(v9, "rawCoordinate");
    v16 = v15;
    objc_msgSend(v9, "rawCoordinate");
    v18 = v17;
    objc_msgSend(v9, "course");
    v20 = v19;
    objc_msgSend(v9, "horizontalAccuracy");
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0C9E3B8], "_navigation_stringWithType:", objc_msgSend(v9, "type"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v9, "referenceFrame");
    v25 = CFSTR("Not shifted");
    *(_DWORD *)buf = 138414339;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2049;
    if (v24 == 2)
      v25 = CFSTR("Shifted");
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2049;
    *(_QWORD *)&buf[24] = v14;
    *(_WORD *)&buf[32] = 2049;
    *(_QWORD *)&buf[34] = v16;
    *(_WORD *)&buf[42] = 2049;
    *(_QWORD *)&buf[44] = v18;
    *(_WORD *)&buf[52] = 2049;
    *(_QWORD *)&buf[54] = v20;
    *(_WORD *)&buf[62] = 2049;
    *(_QWORD *)&buf[64] = v22;
    *(_WORD *)&buf[72] = 2112;
    *(_QWORD *)&buf[74] = v23;
    *(_WORD *)&buf[82] = 2112;
    *(_QWORD *)&buf[84] = v25;
    _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_INFO, "%@ received location update: %{private}f, %{private}f (raw: %{private}f %{private}f) | %{private}0.1f° | %{private}gm, | %@ | %@", buf, 0x5Cu);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      MKGetPuckTrackingLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[MKLocationManager locationProvider:didUpdateLocation:lastKnownNavCourse:]";
        _os_log_impl(&dword_18B0B0000, v27, OS_LOG_TYPE_INFO, "[MK] %@ Received - in %s", buf, 0x16u);
      }

    }
  }
  else
  {
    v26 = 0;
  }
  if (-[MKLocationManager isLocationServicesAvailable](self, "isLocationServicesAvailable"))
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C9E488], 0, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKLocationManager locationProvider:didReceiveError:](self, "locationProvider:didReceiveError:", v8, v33);

      goto LABEL_42;
    }
    if (!self->_trackingLocation)
    {
      GEOFindOrCreateLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_18B0B0000, v28, OS_LOG_TYPE_INFO, "didUpdateLocation while not tracking location: Stop updating location for %@", buf, 0xCu);
      }

      -[MKLocationManager locationProvider](self, "locationProvider");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stopUpdatingLocation");

    }
    objc_msgSend(v9, "matchInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v9, "matchInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "matchQuality") == 1)
      {
        v32 = 0;
      }
      else
      {
        objc_msgSend(v9, "matchInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v34, "isMatchShifted");

      }
    }
    else
    {
      v32 = 0;
    }

    if (objc_msgSend(v9, "referenceFrame") == 2)
      v35 = 1;
    else
      v35 = v32;
    -[MKLocationManager locationProvider](self, "locationProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v36, "isTracePlayer") & 1) == 0)
    {
      -[MKLocationManager locationProvider](self, "locationProvider");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v37, "shouldShiftIfNecessary") & 1) != 0)
      {
        v38 = (void *)MEMORY[0x1E0D27178];
        objc_msgSend(v9, "coordinate");
        LODWORD(v38) = objc_msgSend(v38, "isLocationShiftRequiredForCoordinate:");

        if ((_DWORD)v38)
        {
          if (v26)
          {
            MKGetPuckTrackingLog();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v26;
              _os_log_impl(&dword_18B0B0000, v39, OS_LOG_TYPE_INFO, "[MK] %@ Processing - Needs shifting", buf, 0xCu);
            }

          }
          if (v35)
          {
            v77 = 0u;
            memset(v78, 0, 28);
            v76 = 0u;
            memset(buf, 0, sizeof(buf));
            objc_msgSend(v9, "clientLocation");
            if (v32)
            {
              objc_msgSend(v9, "matchInfo");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "matchCoordinate");
              v42 = v41;
              objc_msgSend(v9, "matchInfo");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "matchCoordinate");
              *(_QWORD *)&buf[4] = v42;
              *(_QWORD *)&buf[12] = v44;

            }
            DWORD1(v78[0]) = 2;
            objc_msgSend(v9, "matchInfo");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            v46 = objc_alloc(MEMORY[0x1E0C9E3B8]);
            if (v45)
            {
              objc_msgSend(v9, "matchInfo");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v76;
              v73 = v77;
              v74[0] = v78[0];
              *(_OWORD *)((char *)v74 + 12) = *(_OWORD *)((char *)v78 + 12);
              v68 = *(_OWORD *)&buf[32];
              v69 = *(_OWORD *)&buf[48];
              v70 = *(_OWORD *)&buf[64];
              v71 = *(_OWORD *)&buf[80];
              v66 = *(_OWORD *)buf;
              v67 = *(_OWORD *)&buf[16];
              v48 = objc_msgSend(v46, "initWithClientLocation:matchInfo:", &v66, v47);
            }
            else
            {
              objc_msgSend(v9, "coarseMetaData");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v76;
              v73 = v77;
              v74[0] = v78[0];
              *(_OWORD *)((char *)v74 + 12) = *(_OWORD *)((char *)v78 + 12);
              v68 = *(_OWORD *)&buf[32];
              v69 = *(_OWORD *)&buf[48];
              v70 = *(_OWORD *)&buf[64];
              v71 = *(_OWORD *)&buf[80];
              v66 = *(_OWORD *)buf;
              v67 = *(_OWORD *)&buf[16];
              v48 = objc_msgSend(v46, "initWithClientLocation:coarseMetaData:", &v66, v47);
            }
            v57 = (void *)v48;

            -[MKLocationManager _locationProvider:didUpdateLocation:lastKnownNavCourse:](self, "_locationProvider:didUpdateLocation:lastKnownNavCourse:", v8, v57, a5);
          }
          else
          {
            v58 = MEMORY[0x1E0C809B0];
            v59 = 3221225472;
            v60 = __75__MKLocationManager_locationProvider_didUpdateLocation_lastKnownNavCourse___block_invoke;
            v61 = &unk_1E20D9160;
            v49 = v9;
            v62 = v49;
            v63 = self;
            v64 = v8;
            v65 = a5;
            v50 = (void *)MEMORY[0x18D778DB8](&v58);
            v51 = objc_alloc(MEMORY[0x1E0D27168]);
            v52 = (void *)objc_msgSend(v51, "initWithCLLocation:", v49, v58, v59, v60, v61);
            locationShifter = self->_locationShifter;
            if (!locationShifter)
            {
              v54 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E0D27178]);
              v55 = self->_locationShifter;
              self->_locationShifter = v54;

              locationShifter = self->_locationShifter;
            }
            objc_msgSend(v52, "latLng");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "horizontalAccuracy");
            -[GEOLocationShifter shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](locationShifter, "shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v56, v50, 0, 0, MEMORY[0x1E0C80D38]);

          }
          goto LABEL_42;
        }
LABEL_41:
        -[MKLocationManager _locationProvider:didUpdateLocation:lastKnownNavCourse:](self, "_locationProvider:didUpdateLocation:lastKnownNavCourse:", v8, v9, a5);
        goto LABEL_42;
      }

    }
    goto LABEL_41;
  }
LABEL_42:

}

- (BOOL)isHeadingServicesAvailable
{
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "headingAvailable");
}

- (void)setHeadingOrientation:(int64_t)a3
{
  id v4;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeadingOrientation:", a3);

}

- (void)startHeadingUpdateWithObserver:(id)a3
{
  id v4;
  NSHashTable *headingObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  headingObservers = self->_headingObservers;
  v8 = v4;
  if (!headingObservers)
  {
    v6 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 5);
    v7 = self->_headingObservers;
    self->_headingObservers = v6;

    v4 = v8;
    headingObservers = self->_headingObservers;
  }
  if (!-[NSHashTable containsObject:](headingObservers, "containsObject:", v4))
  {
    -[NSHashTable addObject:](self->_headingObservers, "addObject:", v8);
    -[MKLocationManager _setTrackingHeading:](self, "_setTrackingHeading:", 1);
  }

}

- (BOOL)isLocationServicesPossiblyAvailable:(id *)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  if (!-[MKLocationManager isLocationServicesPossiblyAvailable](self, "isLocationServicesPossiblyAvailable"))
  {
    v5 = MKLocationErrorDomain;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __57__MKLocationManager_isLocationServicesPossiblyAvailable___block_invoke;
    v17 = &unk_1E20D7E58;
    v9 = v6;
    v18 = v9;
    v10 = v8;
    v19 = v10;
    v11 = (void (**)(_QWORD))MEMORY[0x18D778DB8](&v14);
    if (-[MKLocationManager isLocationServicesEnabled](self, "isLocationServicesEnabled", v14, v15, v16, v17))
    {
      if (-[MKLocationManager isLocationServicesRestricted](self, "isLocationServicesRestricted"))
      {
        v12 = 1;
      }
      else
      {
        if (!-[MKLocationManager isLocationServicesDenied](self, "isLocationServicesDenied"))
        {
          v12 = -1;
          if (!a3)
            goto LABEL_10;
          goto LABEL_9;
        }
        v12 = 0;
      }
    }
    else
    {
      v12 = 2;
    }
    v11[2](v11);
    if (!a3)
    {
LABEL_10:

      return -[MKLocationManager isLocationServicesPossiblyAvailable](self, "isLocationServicesPossiblyAvailable");
    }
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v5, v12, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  return -[MKLocationManager isLocationServicesPossiblyAvailable](self, "isLocationServicesPossiblyAvailable");
}

- (BOOL)isLocationServicesPossiblyAvailable
{
  NSObject *v3;
  int v5;
  MKLocationManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager isLocationServicesPossiblyAvailable %@", (uint8_t *)&v5, 0xCu);
  }

  if (-[MKLocationManager isLocationServicesDenied](self, "isLocationServicesDenied"))
    return 0;
  else
    return !-[MKLocationManager isLocationServicesRestricted](self, "isLocationServicesRestricted");
}

- (BOOL)isLocationServicesDenied
{
  void *v2;
  BOOL v3;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authorizationStatus") == 2;

  return v3;
}

- (void)_syncLocationProviderWithTracking
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  MKLocationManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_suspended || self->_continuesWhileInactive)
  {
    if (self->_trackingLocation)
    {
      GEOFindOrCreateLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = self;
        _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "Sync with tracking: Start updating location for %@", (uint8_t *)&v8, 0xCu);
      }

      -[MKLocationManager locationProvider](self, "locationProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startUpdatingLocation");

      self->_locationUpdateStartTime = CFAbsoluteTimeGetCurrent();
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isRunningTest");

      if ((v6 & 1) == 0)
        -[MKLocationManager _setIsReceivingAccurateLocations:](self, "_setIsReceivingAccurateLocations:", 0);
    }
    if (self->_trackingHeading && !self->_useCourseForHeading)
    {
      -[MKLocationManager locationProvider](self, "locationProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startUpdatingHeading");

    }
  }
}

- (BOOL)isLocationServicesRestricted
{
  void *v2;
  BOOL v3;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authorizationStatus") == 1;

  return v3;
}

- (BOOL)isAuthorizedForPreciseLocation
{
  id v3;
  BOOL v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MKLocationManager locationProvider](self, "locationProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync();
  if (*((_BYTE *)v7 + 24))
    v4 = -[MKLocationManager isLocationServicesApproved](self, "isLocationServicesApproved");
  else
    v4 = 0;

  _Block_object_dispose(&v6, 8);
  return v4;
}

- (BOOL)isLocationServicesApproved
{
  void *v2;
  int v3;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authorizationStatus");

  return (v3 - 3) < 2;
}

- (MKLocationProvider)locationProvider
{
  if (self->_enabled)
    return self->_locationProvider;
  else
    return (MKLocationProvider *)0;
}

- (void)_setTrackingHeading:(BOOL)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  CLHeading *heading;

  if (self->_trackingHeading != a3)
  {
    if (a3)
    {
      if (!self->_useCourseForHeading)
      {
        -[MKLocationManager locationProvider](self, "locationProvider");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startUpdatingHeading");

      }
      v5 = 1;
    }
    else
    {
      -[MKLocationManager locationProvider](self, "locationProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopUpdatingHeading");

      heading = self->_heading;
      self->_heading = 0;

      v5 = 0;
      self->_headingUpdateTime = 0.0;
    }
    self->_trackingHeading = v5;
  }
}

- (CLHeading)heading
{
  return self->_heading;
}

+ (id)sharedLocationManager
{
  if (qword_1ECE2D8C0 != -1)
    dispatch_once(&qword_1ECE2D8C0, &__block_literal_global_13);
  return (id)_MergedGlobals_131;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

uint64_t __41__MKLocationManager_setLocationProvider___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 296) = 0;
  return result;
}

- (MKLocationManager)initWithCLLocationManager:(id)a3
{
  id v4;
  NSObject *v5;
  MKLocationManager *v6;
  void *v7;
  void *v8;
  dispatch_group_t v9;
  OS_dispatch_group *authStatusInitializationGroup;
  NSLock *v11;
  NSLock *lastLocationLock;
  NSLock *v13;
  NSLock *observersLock;
  uint64_t v15;
  geo_isolater *accuracyAuthorizationIsolater;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *recentLocationUpdateIntervals;
  MKCoreLocationProvider *v23;
  void *v24;
  NSObject *v25;
  objc_super v27;
  uint8_t buf[16];

  v4 = a3;
  MKGetMKLocationManagerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Initialization", (const char *)&unk_18B2CC343, buf, 2u);
  }

  v27.receiver = self;
  v27.super_class = (Class)MKLocationManager;
  v6 = -[MKLocationManager init](&v27, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startObserving");

    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_applicationDidBecomeActive_, CFSTR("MKApplicationStateDidBecomeActiveNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_applicationWillResignActive_, CFSTR("MKApplicationStateWillResignActiveNotification"), 0);
    v6->_enabled = 1;
    v6->_initializedAuthorizationStatus.lock._os_unfair_lock_opaque = 0;
    v6->_initializedAuthorizationStatus.didRun = 0;
    v9 = dispatch_group_create();
    authStatusInitializationGroup = v6->_authStatusInitializationGroup;
    v6->_authStatusInitializationGroup = (OS_dispatch_group *)v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lastLocationLock = v6->_lastLocationLock;
    v6->_lastLocationLock = v11;

    v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    observersLock = v6->_observersLock;
    v6->_observersLock = v13;

    v15 = geo_isolater_create();
    accuracyAuthorizationIsolater = v6->_accuracyAuthorizationIsolater;
    v6->_accuracyAuthorizationIsolater = (geo_isolater *)v15;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_continuesWhileInactive = objc_msgSend(&unk_1E2159DA8, "containsObject:", v20);

    }
    else
    {
      v6->_continuesWhileInactive = 0;
    }

    v6->_consecutiveOutOfCourseCount = 0;
    v6->_navCourse = -1.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v21 = objc_claimAutoreleasedReturnValue();
    recentLocationUpdateIntervals = v6->_recentLocationUpdateIntervals;
    v6->_recentLocationUpdateIntervals = (NSMutableArray *)v21;

    if (v4)
    {
      v23 = -[MKCoreLocationProvider initWithCLLocationManager:]([MKCoreLocationProvider alloc], "initWithCLLocationManager:", v4);
      -[MKLocationManager setLocationProvider:](v6, "setLocationProvider:", v23);

    }
    else
    {
      -[MKLocationManager _useDefaultCoreLocationProvider](v6, "_useDefaultCoreLocationProvider");
    }
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTileGroupObserver:queue:", v6, MEMORY[0x1E0C80D38]);

  }
  MKGetMKLocationManagerLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Initialization", (const char *)&unk_18B2CC343, buf, 2u);
  }

  return v6;
}

- (void)_useDefaultCoreLocationProvider
{
  MKCoreLocationProvider *v3;

  v3 = objc_alloc_init(MKCoreLocationProvider);
  -[MKLocationManager setLocationProvider:](self, "setLocationProvider:", v3);

}

void __42__MKLocationManager_sharedLocationManager__block_invoke()
{
  MKLocationManager *v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MKLocationManager);
  v1 = (void *)_MergedGlobals_131;
  _MergedGlobals_131 = (uint64_t)v0;

  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 134217984;
    v4 = &_MergedGlobals_131;
    _os_log_impl(&dword_18B0B0000, v2, OS_LOG_TYPE_INFO, "Shared location manager: %p", (uint8_t *)&v3, 0xCu);
  }

}

- (void)setLocationProvider:(id)a3
{
  MKLocationProvider *v5;
  MKLocationProvider *v6;
  MKLocationProvider **p_locationProvider;
  NSObject *v8;
  id v9;
  MKLocationProvider *locationProvider;
  NSObject *v11;
  MKLocationProvider *v12;
  CLLocation *lastLocation;
  CLLocation *lastGoodLocation;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  MKLocationProvider *v18;
  __int16 v19;
  MKLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (MKLocationProvider *)a3;
  v6 = v5;
  p_locationProvider = &self->_locationProvider;
  if (self->_locationProvider != v5)
  {
    if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v16 = (id)objc_opt_class();
        v17 = 2048;
        v18 = v6;
        v19 = 2112;
        v20 = self;
        v9 = v16;
        _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_INFO, "Setting location provider [%@](%p) for %@", buf, 0x20u);

      }
      locationProvider = self->_locationProvider;
      if (self->_trackingLocation && locationProvider)
      {
        GEOFindOrCreateLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v16 = self;
          _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_INFO, "Replacing location provider: Stop updating location for %@", buf, 0xCu);
        }

        -[MKLocationProvider stopUpdatingLocation](*p_locationProvider, "stopUpdatingLocation");
        locationProvider = *p_locationProvider;
      }
      if (self->_trackingHeading)
      {
        -[MKLocationProvider stopUpdatingHeading](locationProvider, "stopUpdatingHeading");
        locationProvider = *p_locationProvider;
      }
      -[MKLocationProvider setDelegate:](locationProvider, "setDelegate:", 0);
      v12 = self->_locationProvider;
      self->_locationProvider = 0;

      -[NSLock lock](self->_lastLocationLock, "lock");
      lastLocation = self->_lastLocation;
      self->_lastLocation = 0;

      lastGoodLocation = self->_lastGoodLocation;
      self->_lastGoodLocation = 0;

      -[NSLock unlock](self->_lastLocationLock, "unlock");
      if (v6)
        objc_storeStrong((id *)&self->_locationProvider, a3);
      else
        -[MKLocationManager _useDefaultCoreLocationProvider](self, "_useDefaultCoreLocationProvider");
      -[MKLocationProvider setDelegate:](self->_locationProvider, "setDelegate:", self);
      -[MKLocationManager _syncLocationProviderWithTracking](self, "_syncLocationProviderWithTracking");
      geo_isolate_sync();
    }
  }

}

- (MKLocationManager)init
{
  return -[MKLocationManager initWithCLLocationManager:](self, "initWithCLLocationManager:", 0);
}

void __32__MKLocationManager_setHeading___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "throttledHeading");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeading:", v1);

}

- (void)startLocationUpdateWithObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MKLocationManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager %@ startLocationUpdateWithObserver", (uint8_t *)&v6, 0xCu);
  }

  -[MKLocationManager _startLocationUpdateWithObserver:desiredAccuracy:](self, "_startLocationUpdateWithObserver:desiredAccuracy:", v4, *MEMORY[0x1E0C9E490]);
}

- (void)_startLocationUpdateWithObserver:(id)a3 desiredAccuracy:(double)a4
{
  id v6;
  NSHashTable *locationObservers;
  BOOL v8;
  NSHashTable *v9;
  NSHashTable *v10;
  NSHashTable *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  MKLocationManager *v15;
  NSObject *v16;
  MKLocationManager *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  NSObject *authStatusInitializationGroup;
  _QWORD block[5];
  uint8_t buf[4];
  MKLocationManager *v28;
  __int16 v29;
  MKLocationManager *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSLock lock](self->_observersLock, "lock");
  locationObservers = self->_locationObservers;
  if (locationObservers)
  {
    v8 = -[NSHashTable containsObject:](locationObservers, "containsObject:", v6);
    v9 = self->_locationObservers;
    if (v9)
      goto LABEL_6;
  }
  else
  {
    v8 = 0;
  }
  v10 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 5);
  v11 = self->_locationObservers;
  self->_locationObservers = v10;

  v9 = self->_locationObservers;
LABEL_6:
  v12 = -[NSHashTable count](v9, "count");
  if (!-[NSHashTable containsObject:](self->_locationObservers, "containsObject:", v6))
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (MKLocationManager *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v28 = v15;
      v29 = 2112;
      v30 = self;
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_INFO, "Adding location observer %{private}@ for %@", buf, 0x16u);

    }
    -[NSHashTable addObject:](self->_locationObservers, "addObject:", v6);
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[MKLocationManager observersDescription](self, "observersDescription");
      v17 = (MKLocationManager *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412547;
      v28 = self;
      v29 = 2113;
      v30 = v17;
      _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_DEBUG, "All location observers for %@: \n%{private}@", buf, 0x16u);

    }
  }
  -[NSLock unlock](self->_observersLock, "unlock");
  if (self->_hasCustomDesiredAccuracy)
  {
    if (v8)
      goto LABEL_27;
    goto LABEL_22;
  }
  -[MKLocationManager locationProvider](self, "locationProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v12)
  {
    objc_msgSend(v18, "desiredAccuracy");
    v21 = v20;
    v22 = a4;
    if (v20 < a4)
    {
      -[MKLocationManager locationProvider](self, "locationProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "desiredAccuracy");
      v22 = v23;
    }
    -[MKLocationManager locationProvider](self, "locationProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDesiredAccuracy:", v22);

    if (v21 < a4)
  }
  else
  {
    objc_msgSend(v18, "setDesiredAccuracy:", a4);
  }

  if (!v8)
  {
LABEL_22:
    if (self->_trackingLocation)
    {
      if (-[MKLocationManager hasLocation](self, "hasLocation") && !self->_isLastLocationStale)
        objc_msgSend(v6, "locationManagerUpdatedLocation:", self);
    }
    else
    {
      -[MKLocationManager _setTrackingLocation:](self, "_setTrackingLocation:", 1);
    }
  }
LABEL_27:
  -[MKLocationManager _initializeAuthStatusIfNecessary](self, "_initializeAuthStatusIfNecessary");
  authStatusInitializationGroup = self->_authStatusInitializationGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MKLocationManager__startLocationUpdateWithObserver_desiredAccuracy___block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_group_notify(authStatusInitializationGroup, MEMORY[0x1E0C80D38], block);

}

- (void)_setTrackingLocation:(BOOL)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  MKLocationManager *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_trackingLocation != a3)
  {
    if (a3)
    {
      self->_trackingLocation = 1;
      +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isActive");

      if ((v5 & 1) != 0 || self->_continuesWhileInactive)
      {
        GEOFindOrCreateLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v11 = 138412290;
          v12 = self;
          _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_INFO, "Set tracking location to YES: Start updating location for %@", (uint8_t *)&v11, 0xCu);
        }

        GEOFindOrCreateLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager startUpdatingLocation", (uint8_t *)&v11, 2u);
        }

        -[MKLocationManager locationProvider](self, "locationProvider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startUpdatingLocation");

        self->_locationUpdateStartTime = CFAbsoluteTimeGetCurrent();
        -[MKLocationManager _setIsReceivingAccurateLocations:](self, "_setIsReceivingAccurateLocations:", 0);
      }
      else
      {
        GEOFindOrCreateLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = 138412290;
          v12 = self;
          _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_INFO, "Set tracking location to YES: %@ is inactive", (uint8_t *)&v11, 0xCu);
        }

      }
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = self;
        _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_INFO, "Set tracking location to NO: Stop updating location for %@", (uint8_t *)&v11, 0xCu);
      }

      -[MKLocationProvider stopUpdatingLocation](self->_locationProvider, "stopUpdatingLocation");
      self->_trackingLocation = 0;
    }
  }
}

- (void)_initializeAuthStatusIfNecessary
{
  GEOOnce();
}

- (void)locationProvider:(id)a3 didUpdateHeading:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a4;
  -[MKLocationManager locationRecorder](self, "locationRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trueHeading");
  v7 = v6;
  objc_msgSend(v13, "magneticHeading");
  v9 = v8;
  objc_msgSend(v13, "headingAccuracy");
  v11 = v10;
  objc_msgSend(v13, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordCompassHeading:magneticHeading:accuracy:timestamp:", v12, v7, v9, v11);

  -[MKLocationManager setHeading:](self, "setHeading:", v13);
}

- (void)setHeading:(id)a3
{
  CLHeading *v5;
  CFTimeInterval v6;
  double v7;
  NSTimer *v8;
  void *v9;
  NSTimer *v10;
  NSTimer *headingThrottlingTimer;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = (CLHeading *)a3;
  if (self->_heading != v5)
  {
    v6 = CACurrentMediaTime();
    v7 = v6 - self->_headingUpdateTime;
    if (v7 < 0.2)
    {
      -[MKLocationManager setThrottledHeading:](self, "setThrottledHeading:", v5);
      if (!self->_headingThrottlingTimer)
      {
        objc_initWeak(&location, self);
        v9 = (void *)MEMORY[0x1E0C99E88];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __32__MKLocationManager_setHeading___block_invoke;
        v12[3] = &unk_1E20D9138;
        objc_copyWeak(&v13, &location);
        objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, 0.2 - v7);
        v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        headingThrottlingTimer = self->_headingThrottlingTimer;
        self->_headingThrottlingTimer = v10;

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      -[NSTimer invalidate](self->_headingThrottlingTimer, "invalidate");
      v8 = self->_headingThrottlingTimer;
      self->_headingThrottlingTimer = 0;

      -[MKLocationManager setThrottledHeading:](self, "setThrottledHeading:", 0);
      objc_storeStrong((id *)&self->_heading, a3);
      if (self->_heading)
      {
        -[MKLocationManager _reportHeadingSuccess](self, "_reportHeadingSuccess");
        self->_headingUpdateTime = v6;
      }
    }
  }

}

- (void)setThrottledHeading:(id)a3
{
  objc_storeStrong((id *)&self->_throttledHeading, a3);
}

- (MNLocationRecorder)locationRecorder
{
  return self->_locationRecorder;
}

- (void)_reportHeadingSuccess
{
  id v3;

  -[NSHashTable allObjects](self->_headingObservers, "allObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel_locationManagerUpdatedHeading_, self);

}

- (double)expectedGpsUpdateInterval
{
  void *v2;
  double v3;
  double v4;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expectedGpsUpdateInterval");
  v4 = v3;

  return v4;
}

- (void)_locationProvider:(id)a3 didUpdateLocation:(id)a4 lastKnownNavCourse:(double)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  int v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  int consecutiveOutOfCourseCount;
  void (**locationCorrector)(id, id, double);
  id v21;
  unsigned int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  double v26;
  id v27;
  void *v28;
  int v29;
  double v30;
  long double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  long double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[144];
  __int128 v50;
  uint8_t v51[28];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x18D777B1C]();

  if (!-[MKLocationManager _shouldAllowLocationUpdateInterval:](self, "_shouldAllowLocationUpdateInterval:", v9))
  {
    -[MKLocationManager locationRecorder](self, "locationRecorder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordLocation:correctedLocation:", v7, 0);

    v16 = v7;
    goto LABEL_48;
  }
  if (v7)
  {
    objc_msgSend(v7, "clientLocation");
    v10 = *(double *)((char *)&v50 + 4);
    objc_msgSend(v7, "clientLocation");
    v11 = *(double *)((char *)&v45 + 4);
    if (*(double *)((char *)&v45 + 4) > 0.0 && *(double *)((char *)&v45 + 4) < 20.0)
    {
      v13 = 0;
      v14 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    v11 = 0.0;
    v50 = 0u;
    memset(v51, 0, sizeof(v51));
    memset(&v49[32], 0, 112);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    memset(v49, 0, 28);
    v10 = 0.0;
  }
  objc_msgSend(v7, "speed", v11);
  if (v17 > 3.0)
    goto LABEL_12;
  v29 = objc_msgSend(v7, "_navigation_hasMatch");
  v14 = 0;
  v13 = 1;
  if (v29 && v10 >= 0.0)
  {
    if (a5 < 0.0)
      goto LABEL_12;
    objc_msgSend(v7, "course");
    v31 = v30;
    v32 = fmod(v10, 360.0);
    v33 = fmod(v31, 360.0);
    if (v31 < 0.0)
      v33 = v33 + 360.0;
    if (vabdd_f64(v32, v33) > 180.0)
    {
      if (v32 >= v33)
        v33 = v33 + 360.0;
      else
        v32 = v32 + 360.0;
    }
    v34 = vabdd_f64(v33, v32);
    objc_msgSend(v7, "course");
    v36 = v35;
    v37 = fmod(a5, 360.0);
    if (a5 >= 0.0)
      v38 = v37;
    else
      v38 = v37 + 360.0;
    v39 = fmod(v36, 360.0);
    if (v36 < 0.0)
      v39 = v39 + 360.0;
    if (vabdd_f64(v38, v39) > 180.0)
    {
      if (v38 >= v39)
        v39 = v39 + 360.0;
      else
        v38 = v38 + 360.0;
    }
    if (v34 < vabdd_f64(v39, v38))
    {
LABEL_12:
      v14 = 0;
      v13 = 0;
      goto LABEL_13;
    }
    v14 = 0;
    v13 = 1;
  }
LABEL_13:
  if (self->_navCourse != a5)
    self->_consecutiveOutOfCourseCount = 0;
  if (v10 == -1.0)
    v13 = 1;
  if (v13)
    v18 = a5;
  else
    v18 = v10;
  self->_navCourse = v18;
  if (v10 == -1.0)
  {
    self->_consecutiveOutOfCourseCount = 1;
LABEL_22:
    self->_navCourse = a5;
    goto LABEL_28;
  }
  consecutiveOutOfCourseCount = self->_consecutiveOutOfCourseCount;
  if (consecutiveOutOfCourseCount >= 1)
  {
    if (vabdd_f64(a5, v10) >= 45.0)
    {
      self->_consecutiveOutOfCourseCount = consecutiveOutOfCourseCount + 1;
      if (((consecutiveOutOfCourseCount < 3) & ~v14) != 0)
        goto LABEL_22;
    }
    self->_consecutiveOutOfCourseCount = 0;
  }
  a5 = v18;
LABEL_28:
  locationCorrector = (void (**)(id, id, double))self->_locationCorrector;
  if (locationCorrector)
  {
    locationCorrector[2](locationCorrector, v7, a5);
    v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
    v16 = v21;

    goto LABEL_34;
  }
  v22 = objc_msgSend(v7, "type");
  v16 = v7;
  if (v22 <= 0xA)
  {
    v16 = v7;
    if (((1 << v22) & 0x40E) != 0)
    {
      v40 = v7;
      -[MKLocationManager dampenGPSLocationAccuracy:](self, "dampenGPSLocationAccuracy:", &v40);
      v21 = v40;
      goto LABEL_33;
    }
  }
LABEL_34:
  -[MKLocationManager locationRecorder](self, "locationRecorder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "recordLocation:correctedLocation:", v7, v16);

  if (v16)
  {
    -[MKLocationManager setLastLocation:](self, "setLastLocation:", v16);
    self->_lastLocationUpdateTime = CFAbsoluteTimeGetCurrent();
    *(_WORD *)&self->_isLastLocationStale = 0;
    -[MKLocationManager _reportLocationSuccess](self, "_reportLocationSuccess");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        MKGetPuckTrackingLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v53 = v24;
          v54 = 2080;
          v55 = "-[MKLocationManager _locationProvider:didUpdateLocation:lastKnownNavCourse:]";
          _os_log_impl(&dword_18B0B0000, v25, OS_LOG_TYPE_INFO, "[MK] %@ Processed - in %s", buf, 0x16u);
        }

      }
    }
    if (!self->_isReceivingAccurateLocations)
    {
      if (CFAbsoluteTimeGetCurrent() - self->_locationUpdateStartTime > 10.0
        || (objc_msgSend(v16, "horizontalAccuracy"), v26 <= 65.0))
      {
        -[MKLocationManager _setIsReceivingAccurateLocations:](self, "_setIsReceivingAccurateLocations:", 1);
      }
    }
    if (self->_useCourseForHeading && self->_trackingHeading)
    {
      v27 = objc_alloc(MEMORY[0x1E0C9E3A0]);
      objc_msgSend(v16, "course");
      v28 = (void *)objc_msgSend(v27, "initWithHeading:accuracy:");
      -[MKLocationManager setHeading:](self, "setHeading:", v28);

    }
  }
LABEL_48:

}

- (void)setLastLocation:(id)a3
{
  double v5;
  CLLocation *v6;

  v6 = (CLLocation *)a3;
  -[NSLock lock](self->_lastLocationLock, "lock");
  if (self->_lastLocation != v6)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    -[CLLocation _navigation_setGtLog:](self->_lastLocation, "_navigation_setGtLog:", 1);
  }
  -[CLLocation horizontalAccuracy](v6, "horizontalAccuracy");
  if (v5 <= 200.0)
    objc_storeStrong((id *)&self->_lastGoodLocation, a3);
  -[NSLock unlock](self->_lastLocationLock, "unlock");

}

- (void)dampenGPSLocationAccuracy:(id *)a3
{
  id v5;
  CFAbsoluteTime Current;
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  _OWORD v18[8];
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];

  if (a3)
  {
    v5 = *a3;
    Current = CFAbsoluteTimeGetCurrent();
    -[MKLocationManager lastLocation](self, "lastLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");
    if (v8 <= 0xA && ((1 << v8) & 0x40E) != 0)
    {
      objc_msgSend(v5, "horizontalAccuracy");
      v10 = v9;
      objc_msgSend(v7, "horizontalAccuracy");
      if (vabdd_f64(v10, v11) >= 0.000001 && v10 > v11)
      {
        if (Current - self->_locationAccuracyUpdateTime >= 3.0)
        {
          self->_locationAccuracyUpdateTime = Current;
        }
        else
        {
          v27 = 0u;
          memset(v28, 0, 28);
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          v20 = 0u;
          if (v5)
            objc_msgSend(v5, "clientLocation");
          objc_msgSend(v7, "horizontalAccuracy");
          *(_QWORD *)((char *)&v21 + 4) = v13;
          v14 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          objc_msgSend(v5, "coarseMetaData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v18[6] = v26;
          v18[7] = v27;
          v19[0] = v28[0];
          *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)((char *)v28 + 12);
          v18[2] = v22;
          v18[3] = v23;
          v18[4] = v24;
          v18[5] = v25;
          v18[0] = v20;
          v18[1] = v21;
          v16 = objc_msgSend(v14, "initWithClientLocation:coarseMetaData:", v18, v15);

          v5 = (id)v16;
        }
      }
    }
    v17 = objc_retainAutorelease(v5);
    *a3 = v17;

  }
}

- (BOOL)_shouldAllowLocationUpdateInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSMutableArray *recentLocationUpdateIntervals;
  NSMutableArray *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  double v20;
  unint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t j;
  double v28;
  BOOL v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[MKLocationManager lastLocation](self, "lastLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || fabs(self->_minimumLocationUpdateInterval) < 0.000001)
    goto LABEL_23;
  objc_msgSend(v5, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x18D777B1C]();

  v9 = a3 - v8;
  recentLocationUpdateIntervals = self->_recentLocationUpdateIntervals;
  if (v9 < 0.0)
  {
    -[NSMutableArray removeAllObjects](recentLocationUpdateIntervals, "removeAllObjects");
LABEL_23:
    v29 = 1;
    goto LABEL_24;
  }
  if ((unint64_t)-[NSMutableArray count](recentLocationUpdateIntervals, "count") >= 5)
    -[NSMutableArray removeObjectAtIndex:](self->_recentLocationUpdateIntervals, "removeObjectAtIndex:", 0);
  v11 = self->_recentLocationUpdateIntervals;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v12);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = self->_recentLocationUpdateIntervals;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  v15 = 0.0;
  v16 = 0.0;
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "doubleValue");
        v16 = v16 + v20;
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v17);
  }

  v21 = -[NSMutableArray count](self->_recentLocationUpdateIntervals, "count");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = self->_recentLocationUpdateIntervals;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = v16 / (double)v21;
    v26 = *(_QWORD *)v32;
    v15 = 0.0;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "doubleValue", (_QWORD)v31);
        v15 = v15 + (v28 - v25) * (v28 - v25);
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v24);
  }

  if (v9
     + sqrt(v15 / (double)(unint64_t)-[NSMutableArray count](self->_recentLocationUpdateIntervals, "count"))
     + 0.1 >= self->_minimumLocationUpdateInterval)
    goto LABEL_23;
  -[NSMutableArray removeLastObject](self->_recentLocationUpdateIntervals, "removeLastObject");
  v29 = 0;
LABEL_24:

  return v29;
}

- (void)_setIsReceivingAccurateLocations:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSTimer *waitForAccurateLocationsTimer;
  NSMutableArray *v7;
  NSMutableArray *waitForAccurateLocationsHandlers;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (GEOConfigGetBOOL())
  {
    if (!self->_isReceivingAccurateLocations)
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "Now assuming locations are accurate", buf, 2u);
      }

    }
    v3 = 1;
  }
  if (self->_isReceivingAccurateLocations != v3)
  {
    self->_isReceivingAccurateLocations = v3;
    -[NSTimer invalidate](self->_waitForAccurateLocationsTimer, "invalidate");
    waitForAccurateLocationsTimer = self->_waitForAccurateLocationsTimer;
    self->_waitForAccurateLocationsTimer = 0;

    if (v3)
    {
      v7 = self->_waitForAccurateLocationsHandlers;
      waitForAccurateLocationsHandlers = self->_waitForAccurateLocationsHandlers;
      self->_waitForAccurateLocationsHandlers = 0;

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v9 = v7;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13));
            ++v13;
          }
          while (v11 != v13);
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        }
        while (v11);
      }

    }
  }
}

- (void)_reportLocationSuccess
{
  NSError *locationError;

  self->_lastLocationReportTime = CFAbsoluteTimeGetCurrent();
  locationError = self->_locationError;
  self->_locationError = 0;

  -[MKLocationManager _reportLocationStatus:](self, "_reportLocationStatus:", sel_locationManagerUpdatedLocation_);
}

- (void)_reportLocationStatus:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  objc_msgSend(v8, "makeObjectsPerformSelector:withObject:", a3, self);
  objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", a3, self);
  if (!objc_msgSend(v8, "count"))
    -[MKLocationManager _setTrackingLocation:](self, "_setTrackingLocation:", 0);

}

- (CLLocation)lastLocation
{
  CLLocation *v3;

  -[NSLock lock](self->_lastLocationLock, "lock");
  v3 = self->_lastLocation;
  -[NSLock unlock](self->_lastLocationLock, "unlock");
  return v3;
}

uint64_t __66__MKLocationManager_locationProviderDidChangeAuthorizationStatus___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 32), "accuracyAuthorization");
  if (result)
    v3 = 2;
  else
    v3 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 != *(_DWORD *)(*(_QWORD *)(a1 + 40) + 296);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 296) = v3;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 300) = 0;
  }
  return result;
}

uint64_t __51__MKLocationManager_isAuthorizedForPreciseLocation__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;

  v1 = result;
  v2 = *(_DWORD *)(*(_QWORD *)(result + 32) + 296);
  if (!v2)
  {
    result = objc_msgSend(*(id *)(result + 40), "accuracyAuthorization");
    if (result)
      v3 = 2;
    else
      v3 = 1;
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 296) = v3;
    v2 = *(_DWORD *)(*(_QWORD *)(v1 + 32) + 296);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = v2 == 1;
  return result;
}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4
{
  -[MKLocationManager locationProvider:didUpdateLocation:lastKnownNavCourse:](self, "locationProvider:didUpdateLocation:lastKnownNavCourse:", a3, a4, self->_navCourse);
}

- (void)resetAfterResumeIfNecessary
{
  if (!self->_continuedAfterBecomingInactive)
  {
    if (self->_suspended)
    {
      self->_applicationResumeTime = CFAbsoluteTimeGetCurrent();
      self->_suspended = 0;
      if (-[MKLocationManager _isTimeToResetOnResume](self, "_isTimeToResetOnResume"))
        -[MKLocationManager reset](self, "reset");
    }
    -[MKLocationManager _syncLocationProviderWithTracking](self, "_syncLocationProviderWithTracking");
  }
}

void __70__MKLocationManager__startLocationUpdateWithObserver_desiredAccuracy___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v7 = 0;
  v3 = objc_msgSend(v2, "isLocationServicesPossiblyAvailable:", &v7);
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_DEBUG, "Location Services not available for %@: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_reportLocationFailureWithError:", v4);
  }

}

void __53__MKLocationManager__initializeAuthStatusIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = (id)geo_dispatch_queue_create();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 320);
  v4 = v7[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MKLocationManager__initializeAuthStatusIfNecessary__block_invoke_80;
  v5[3] = &unk_1E20D7F20;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_group_async(v3, v4, v5);
  _Block_object_dispose(&v6, 8);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopObserving");

  -[MKLocationManager setLocationRecorder:](self, "setLocationRecorder:", 0);
  -[NSTimer invalidate](self->_waitForAccurateLocationsTimer, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)MKLocationManager;
  -[MKLocationManager dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, isShared:%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MKLocationManager *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActive");

  if (self->_trackingLocation && ((v7 & 1) != 0 || self->_continuesWhileInactive))
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_INFO, "didChangeActiveTileGroup: Stop then Start updating location for %@", (uint8_t *)&v11, 0xCu);
    }

    -[MKLocationManager locationProvider](self, "locationProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopUpdatingLocation");

    -[MKLocationManager locationProvider](self, "locationProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startUpdatingLocation");

  }
}

- (void)setLocationCorrector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id locationCorrector;
  void *v8;
  void (**v9)(id, void *, double);
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[32];

  v4 = a3;
  v5 = v4;
  if (self->_locationCorrector != v4)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    locationCorrector = self->_locationCorrector;
    self->_locationCorrector = v6;

    if (-[MKLocationManager hasLocation](self, "hasLocation"))
    {
      -[MKLocationManager lastLocation](self, "lastLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void (**)(id, void *, double))self->_locationCorrector;
      if (v9)
      {
        v9[2](v9, v8, self->_navCourse);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
        {
LABEL_11:

          goto LABEL_12;
        }
        v11 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        if (v8)
        {
          objc_msgSend(v8, "clientLocation");
        }
        else
        {
          v20 = 0u;
          memset(v21, 0, 28);
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          v14 = 0u;
          v15 = 0u;
          v13 = 0u;
        }
        objc_msgSend(v8, "coarseMetaData", v13, v14, v15, v16, v17, v18, v19, v20, *(_QWORD *)v21, *(_OWORD *)&v21[8], *(_QWORD *)&v21[24]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v11, "initWithClientLocation:coarseMetaData:", &v13, v12);

      }
      -[MKLocationManager setLastLocation:](self, "setLastLocation:", v10);

      goto LABEL_11;
    }
  }
LABEL_12:

}

- (void)setLocationRecorder:(id)a3
{
  MNLocationRecorder *v5;
  MNLocationRecorder *v6;

  v5 = (MNLocationRecorder *)a3;
  if (self->_locationRecorder != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_locationRecorder, a3);
    -[MNLocationRecorder recordInitialCourse:](self->_locationRecorder, "recordInitialCourse:", self->_navCourse);
    v5 = v6;
  }

}

- (BOOL)isLocationServicesEnabled
{
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled");
}

- (BOOL)isLocationServicesAuthorizationNeeded
{
  void *v2;
  BOOL v3;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authorizationStatus") == 0;

  return v3;
}

- (void)stopWaitingForAuthCallback
{
  id v2;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopWaitingForAuthCallback");

}

- (BOOL)isTemporaryPreciseLocationAuthorizationPromptShown
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __71__MKLocationManager_isTemporaryPreciseLocationAuthorizationPromptShown__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 300);
  return result;
}

- (NSBundle)effectiveBundle
{
  return (NSBundle *)-[MKLocationProvider effectiveBundle](self->_locationProvider, "effectiveBundle");
}

- (void)setEffectiveBundle:(id)a3
{
  -[MKLocationProvider setEffectiveBundle:](self->_locationProvider, "setEffectiveBundle:", a3);
  -[MKLocationManager _syncLocationProviderWithTracking](self, "_syncLocationProviderWithTracking");
}

- (NSString)effectiveBundleIdentifier
{
  return (NSString *)-[MKLocationProvider effectiveBundleIdentifier](self->_locationProvider, "effectiveBundleIdentifier");
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  -[MKLocationProvider setEffectiveBundleIdentifier:](self->_locationProvider, "setEffectiveBundleIdentifier:", a3);
  -[MKLocationManager _syncLocationProviderWithTracking](self, "_syncLocationProviderWithTracking");
}

- (CLLocation)lastGoodLocation
{
  CLLocation *v3;

  -[NSLock lock](self->_lastLocationLock, "lock");
  v3 = self->_lastGoodLocation;
  -[NSLock unlock](self->_lastLocationLock, "unlock");
  return v3;
}

- (CLLocation)lastProviderLocation
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MKLocationProvider lastLocation](self->_locationProvider, "lastLocation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (CLLocation *)v3;
}

- (GEOLocation)currentLocation
{
  id v3;
  void *v4;
  void *v5;

  if (-[MKLocationManager isLocationServicesApproved](self, "isLocationServicesApproved")
    && -[MKLocationManager hasLocation](self, "hasLocation"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D27168]);
    -[MKLocationManager lastLocation](self, "lastLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithCLLocation:", v4);

  }
  else
  {
    v5 = 0;
  }
  return (GEOLocation *)v5;
}

- (GEOLocation)gridSnappedCurrentLocation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  if (-[MKLocationManager isLocationServicesApproved](self, "isLocationServicesApproved")
    && -[MKLocationManager hasLocation](self, "hasLocation"))
  {
    -[MKLocationManager lastLocation](self, "lastLocation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "snapToResolution:", 3000.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    v8 = v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithGEOCoordinate:isUserLocation:", 1, v6, v8);
  }
  else
  {
    v9 = 0;
  }
  return (GEOLocation *)v9;
}

- (GEOLocation)courseCorrectedLocation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D27168];
  -[MKLocationManager lastLocation](self, "lastLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithCLLocation:course:", v4, self->_navCourse);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOLocation *)v5;
}

- (int64_t)headingOrientation
{
  return (int)-[MKLocationProvider headingOrientation](self->_locationProvider, "headingOrientation");
}

- (void)requestWhenInUseAuthorization
{
  id v2;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWhenInUseAuthorization");

}

- (double)currentVehicleHeading
{
  double lastVehicleHeadingUpdateTime;
  double result;
  double lastLocationUpdateTime;
  double v5;

  lastVehicleHeadingUpdateTime = self->_lastVehicleHeadingUpdateTime;
  result = -1.0;
  if (lastVehicleHeadingUpdateTime > 0.0)
  {
    lastLocationUpdateTime = self->_lastLocationUpdateTime;
    v5 = lastLocationUpdateTime - lastVehicleHeadingUpdateTime;
    if (lastLocationUpdateTime > 0.0 && v5 < 10.0)
      return self->_lastVehicleHeading;
  }
  return result;
}

- (double)currentVehicleSpeed
{
  double lastVehicleSpeedUpdateTime;
  double result;
  double lastLocationUpdateTime;
  double v5;

  lastVehicleSpeedUpdateTime = self->_lastVehicleSpeedUpdateTime;
  result = -1.0;
  if (lastVehicleSpeedUpdateTime > 0.0)
  {
    lastLocationUpdateTime = self->_lastLocationUpdateTime;
    v5 = lastLocationUpdateTime - lastVehicleSpeedUpdateTime;
    if (lastLocationUpdateTime > 0.0 && v5 < 10.0)
      return self->_lastVehicleSpeed;
  }
  return result;
}

- (double)vehicleHeadingOrCourse
{
  double v3;
  double v4;
  void *v5;
  double v6;

  -[MKLocationManager currentVehicleHeading](self, "currentVehicleHeading");
  v4 = v3;
  if (v3 < 0.0)
  {
    -[MKLocationManager lastLocation](self, "lastLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && !-[MKLocationManager isLastLocationStale](self, "isLastLocationStale")
      && objc_msgSend(v5, "_navigation_hasValidCourse"))
    {
      objc_msgSend(v5, "course");
      v4 = v6;
    }

  }
  return v4;
}

- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(id, _QWORD);
  id v12;
  id location[6];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[MKLocationManager isAuthorizedForPreciseLocation](self, "isAuthorizedForPreciseLocation")
    || !-[MKLocationManager isLocationServicesApproved](self, "isLocationServicesApproved"))
  {
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    location[1] = (id)MEMORY[0x1E0C809B0];
    location[2] = (id)3221225472;
    location[3] = __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke;
    location[4] = &unk_1E20D7D98;
    location[5] = self;
    geo_isolate_sync();
    objc_initWeak(location, self);
    -[MKLocationManager locationProvider](self, "locationProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_2;
    v10[3] = &unk_1E20D9110;
    objc_copyWeak(&v12, location);
    v10[4] = self;
    v11 = v7;
    objc_msgSend(v9, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey:completion:", v6, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }

}

uint64_t __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 300) = 1;
  return result;
}

void __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_3;
  v6[3] = &unk_1E20D90E8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v9);
}

void __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    geo_isolate_sync();
    v3 = *((unsigned __int8 *)v9 + 24);
    +[MKMapService sharedService](MKMapService, "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      v6 = 76;
    else
      v6 = 77;
    objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", v6, 689, 0);

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 40));
    _Block_object_dispose(&v8, 8);
  }

}

_QWORD *__91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_4(_QWORD *result)
{
  *(_BYTE *)(result[4] + 300) = 0;
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_DWORD *)(result[5] + 296) == 1;
  return result;
}

- (BOOL)hasLocation
{
  CLLocation *lastLocation;

  -[NSLock lock](self->_lastLocationLock, "lock");
  lastLocation = self->_lastLocation;
  -[NSLock unlock](self->_lastLocationLock, "unlock");
  return lastLocation != 0;
}

- (BOOL)_isTimeToResetOnResume
{
  double applicationSuspendTime;

  applicationSuspendTime = self->_applicationSuspendTime;
  return applicationSuspendTime > 0.0 && self->_applicationResumeTime - applicationSuspendTime > 60.0;
}

- (void)setContinuesWhileInactive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;

  if (self->_continuesWhileInactive != a3)
  {
    v3 = a3;
    self->_continuesWhileInactive = a3;
    +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isActive");

    if ((v6 & 1) == 0)
    {
      if (v3)
      {
        -[MKLocationManager _syncLocationProviderWithTracking](self, "_syncLocationProviderWithTracking");
      }
      else
      {
        self->_continuedAfterBecomingInactive = 0;
        -[MKLocationManager _suspend](self, "_suspend");
      }
    }
  }
}

- (void)applicationWillResignActive:(id)a3
{
  if (-[MKLocationManager continuesWhileInactive](self, "continuesWhileInactive", a3))
  {
    self->_continuedAfterBecomingInactive = 1;
  }
  else
  {
    self->_continuedAfterBecomingInactive = 0;
    -[MKLocationManager _suspend](self, "_suspend");
  }
}

- (void)_suspend
{
  NSObject *v3;
  CLHeading *heading;
  int v5;
  MKLocationManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  self->_applicationSuspendTime = CFAbsoluteTimeGetCurrent();
  self->_suspended = 1;
  if (self->_trackingLocation)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "Suspend: Stop updating location for %@", (uint8_t *)&v5, 0xCu);
    }

    -[MKLocationProvider stopUpdatingLocation](self->_locationProvider, "stopUpdatingLocation");
  }
  if (self->_trackingHeading)
  {
    -[MKLocationProvider stopUpdatingHeading](self->_locationProvider, "stopUpdatingHeading");
    heading = self->_heading;
    self->_heading = 0;

    self->_headingUpdateTime = 0.0;
  }
}

- (void)_reportLocationFailureWithError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  MKLocationManager *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v34 = v5;
    v35 = 2112;
    v36 = self;
    v37 = 2112;
    v38 = v7;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_INFO, "Location error: %@ for %@ while suspended: %@ while tracking location: %@", buf, 0x2Au);

  }
  objc_storeStrong((id *)&self->_locationError, a3);
  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17++), "locationManagerFailedToUpdateLocation:withError:", self, v5);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v15);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "locationManagerFailedToUpdateLocation:withError:", self, v5, (_QWORD)v23);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v20);
  }

}

- (void)_reportLocationReset
{
  -[MKLocationManager _reportLocationStatus:](self, "_reportLocationStatus:", sel_locationManagerDidReset_);
}

- (void)_reportHeadingFailureWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable allObjects](self->_headingObservers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "locationManagerFailedToUpdateHeading:withError:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)reset
{
  if (self->_trackingLocation)
  {
    self->_isLastLocationStale = 0;
    -[MKLocationManager setLastLocation:](self, "setLastLocation:", 0);
    -[MKLocationManager _reportLocationReset](self, "_reportLocationReset");
  }
}

void __57__MKLocationManager_isLocationServicesPossiblyAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  _MKLocalizedStringFromThisBundle(CFSTR("Location Services Off"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0CB2D50]);

  v3 = (void *)MEMORY[0x1E0CB3940];
  _MKLocalizedStringFromThisBundle(CFSTR("Turn on Location Services in Settings > Privacy & Security to allow %@ to determine your current location"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2D80]);

}

- (double)desiredAccuracy
{
  void *v2;
  double v3;
  double v4;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "desiredAccuracy");
  v4 = v3;

  return v4;
}

- (void)setDesiredAccuracy:(double)a3
{
  id v4;

  self->_hasCustomDesiredAccuracy = 1;
  -[MKLocationManager locationProvider](self, "locationProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDesiredAccuracy:", a3);

}

- (double)distanceFilter
{
  void *v2;
  double v3;
  double v4;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceFilter");
  v4 = v3;

  return v4;
}

- (void)setDistanceFilter:(double)a3
{
  id v4;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDistanceFilter:", a3);

}

- (BOOL)matchInfoEnabled
{
  void *v2;
  char v3;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "matchInfoEnabled");

  return v3;
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MKLocationManager locationProvider](self, "locationProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchInfoEnabled:", v3);

}

- (BOOL)fusionInfoEnabled
{
  void *v2;
  char v3;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fusionInfoEnabled");

  return v3;
}

- (void)setFusionInfoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MKLocationManager locationProvider](self, "locationProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFusionInfoEnabled:", v3);

}

- (int64_t)activityType
{
  void *v2;
  int64_t v3;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activityType");

  return v3;
}

- (void)setActivityType:(int64_t)a3
{
  id v4;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivityType:", a3);

}

- (double)timeScale
{
  void *v2;
  double v3;
  double v4;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeScale");
  v4 = v3;

  return v4;
}

- (void)dismissHeadingCalibrationDisplay
{
  id v2;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissHeadingCalibrationDisplay");

}

- (void)pushLocation:(id)a3
{
  if (a3)
  {
    -[MKLocationManager setLastLocation:](self, "setLastLocation:");
    self->_lastLocationUpdateTime = CFAbsoluteTimeGetCurrent();
    *(_WORD *)&self->_isLastLocationStale = 256;
  }
}

void __75__MKLocationManager_locationProvider_didUpdateLocation_lastKnownNavCourse___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _BYTE v14[32];
  _OWORD v15[2];
  _BYTE buf[32];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, 28);
  *(_OWORD *)&v14[16] = 0u;
  *(_DWORD *)v14 = 0;
  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v6, "clientLocation");
  *(double *)&v14[4] = a2;
  *(double *)&v14[12] = a3;
  DWORD1(v15[0]) = 2;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "coordinate");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "coordinate");
    *(_DWORD *)buf = 134284289;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2049;
    *(double *)&buf[24] = a2;
    LOWORD(v17) = 2049;
    *(double *)((char *)&v17 + 2) = a3;
    _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_INFO, "Maps shifting location %{private}f, %{private}f => %{private}f, %{private}f", buf, 0x2Au);
  }

  v11 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(*(id *)(a1 + 32), "coarseMetaData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23[0] = v15[0];
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v15 + 12);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  *(_OWORD *)buf = *(_OWORD *)v14;
  *(_OWORD *)&buf[16] = *(_OWORD *)&v14[16];
  v13 = (void *)objc_msgSend(v11, "initWithClientLocation:coarseMetaData:", buf, v12);

  objc_msgSend(*(id *)(a1 + 40), "_locationProvider:didUpdateLocation:lastKnownNavCourse:", *(_QWORD *)(a1 + 48), v13, *(double *)(a1 + 56));
}

- (void)locationProvider:(id)a3 didReceiveError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  MKLocationManager *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138413058;
    v12 = (id)objc_opt_class();
    v13 = 2048;
    v14 = v6;
    v15 = 2112;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    v9 = v12;
    _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_DEBUG, "Location provider [%@](%p) for %@ did receive error: %@", (uint8_t *)&v11, 0x2Au);

  }
  self->_isLastLocationStale = 1;
  -[MKLocationManager locationRecorder](self, "locationRecorder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordError:", v7);

  -[MKLocationManager _reportLocationFailureWithError:](self, "_reportLocationFailureWithError:", v7);
}

- (BOOL)locationProviderShouldPauseLocationUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  MKLocationManager *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v34 = (id)objc_opt_class();
    v35 = 2048;
    v36 = v4;
    v37 = 2112;
    v38 = self;
    v6 = v34;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "Location provider [%@](%p) for %@ should pause location updates", buf, 0x20u);

  }
  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "locationManagerShouldPauseLocationUpdates:", self))
        {
          v21 = 0;
          v16 = v11;
          goto LABEL_23;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v13)
        continue;
      break;
    }
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "locationManagerShouldPauseLocationUpdates:", self, (_QWORD)v23))
        {
          v21 = 0;
          goto LABEL_23;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v21 = 1;
      if (v18)
        continue;
      break;
    }
  }
  else
  {
    v21 = 1;
  }
LABEL_23:

  return v21;
}

- (void)locationProviderDidPauseLocationUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  MKLocationManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 138412802;
    v13 = (id)objc_opt_class();
    v14 = 2048;
    v15 = v4;
    v16 = 2112;
    v17 = self;
    v6 = v13;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "Location provider [%@](%p) for %@ did pause location updates", (uint8_t *)&v12, 0x20u);

  }
  -[MKLocationManager locationRecorder](self, "locationRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordLocationUpdatePause");

  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  objc_msgSend(v9, "makeObjectsPerformSelector:withObject:", sel_locationManagerDidPauseLocationUpdates_, self);
  objc_msgSend(v11, "makeObjectsPerformSelector:withObject:", sel_locationManagerDidPauseLocationUpdates_, self);

}

- (void)locationProviderDidResumeLocationUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  MKLocationManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 138412802;
    v13 = (id)objc_opt_class();
    v14 = 2048;
    v15 = v4;
    v16 = 2112;
    v17 = self;
    v6 = v13;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "Location provider [%@](%p) for %@ did resume location updates", (uint8_t *)&v12, 0x20u);

  }
  -[MKLocationManager locationRecorder](self, "locationRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordLocationUpdateResume");

  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  objc_msgSend(v9, "makeObjectsPerformSelector:withObject:", sel_locationManagerDidResumeLocationUpdates_, self);
  objc_msgSend(v11, "makeObjectsPerformSelector:withObject:", sel_locationManagerDidResumeLocationUpdates_, self);

}

- (void)locationProvider:(id)a3 didUpdateVehicleSpeed:(double)a4 timestamp:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  double v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  self->_lastVehicleSpeed = a4;
  self->_lastVehicleSpeedUpdateTime = MEMORY[0x18D777B1C]();
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218243;
    v23 = a4;
    v24 = 2113;
    v25 = v7;
    _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_DEBUG, "Vehicle speed: %g | Timestamp: %{private}@\n", buf, 0x16u);
  }

  -[MKLocationManager locationRecorder](self, "locationRecorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordVehicleSpeed:timestamp:", v7, a4);

  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "locationManager:didUpdateVehicleSpeed:timestamp:", self, v7, a4, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)locationProvider:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  double v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  self->_lastVehicleHeading = a4;
  self->_lastVehicleHeadingUpdateTime = MEMORY[0x18D777B1C]();
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218243;
    v23 = a4;
    v24 = 2113;
    v25 = v7;
    _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_DEBUG, "Vehicle heading: %g | Timestamp: %{private}@\n", buf, 0x16u);
  }

  -[MKLocationManager locationRecorder](self, "locationRecorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordVehicleHeading:timestamp:", v7, a4);

  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "locationManager:didUpdateVehicleHeading:timestamp:", self, v7, a4, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)listenForLocationUpdates:(id)a3
{
  NSHashTable *locationListeners;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  -[NSLock lock](self->_observersLock, "lock");
  locationListeners = self->_locationListeners;
  if (!locationListeners)
  {
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 5);
    v6 = self->_locationListeners;
    self->_locationListeners = v5;

    locationListeners = self->_locationListeners;
  }
  if (!-[NSHashTable containsObject:](locationListeners, "containsObject:", v7))
    -[NSHashTable addObject:](self->_locationListeners, "addObject:", v7);
  -[NSLock unlock](self->_observersLock, "unlock");

}

- (void)stopListeningForLocationUpdates:(id)a3
{
  NSHashTable *locationListeners;
  id v5;

  v5 = a3;
  -[NSLock lock](self->_observersLock, "lock");
  locationListeners = self->_locationListeners;
  if (locationListeners && -[NSHashTable containsObject:](locationListeners, "containsObject:", v5))
    -[NSHashTable removeObject:](self->_locationListeners, "removeObject:", v5);
  -[NSLock unlock](self->_observersLock, "unlock");

}

void __53__MKLocationManager__initializeAuthStatusIfNecessary__block_invoke_80(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "isLocationServicesApproved");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)stopLocationUpdateWithObserver:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  MKLocationManager *v7;
  NSObject *v8;
  MKLocationManager *v9;
  NSUInteger v10;
  int v11;
  MKLocationManager *v12;
  __int16 v13;
  MKLocationManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSLock lock](self->_observersLock, "lock");
  if (-[NSHashTable containsObject:](self->_locationObservers, "containsObject:", v4))
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (MKLocationManager *)objc_claimAutoreleasedReturnValue();
      v11 = 138478083;
      v12 = v7;
      v13 = 2112;
      v14 = self;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "Removing location observer %{private}@ for %@", (uint8_t *)&v11, 0x16u);

    }
    -[NSHashTable removeObject:](self->_locationObservers, "removeObject:", v4);
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[MKLocationManager observersDescription](self, "observersDescription");
      v9 = (MKLocationManager *)objc_claimAutoreleasedReturnValue();
      v11 = 138412547;
      v12 = self;
      v13 = 2113;
      v14 = v9;
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_DEBUG, "Remaining location observers for %@: \n%{private}@", (uint8_t *)&v11, 0x16u);

    }
    v10 = -[NSHashTable count](self->_locationObservers, "count");
    -[NSLock unlock](self->_observersLock, "unlock");
    if (!v10)
      -[MKLocationManager _setTrackingLocation:](self, "_setTrackingLocation:", 0);
  }
  else
  {
    -[NSLock unlock](self->_observersLock, "unlock");
  }

}

- (id)observersDescription
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_locationObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %p \n"), v12, v9, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (void)waitForAccurateLocationWithTimeout:(double)a3 handler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSMutableArray *waitForAccurateLocationsHandlers;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSTimer *v12;
  NSTimer *waitForAccurateLocationsTimer;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6 && self->_trackingLocation)
  {
    if (self->_isReceivingAccurateLocations)
    {
      (*((void (**)(id))v6 + 2))(v6);
    }
    else
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v23 = 134217984;
        v24 = a3;
        _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_DEBUG, "waitForAccurateLocationWithTimeout:handler: waiting %#.2fs for an accurate location", (uint8_t *)&v23, 0xCu);
      }

      waitForAccurateLocationsHandlers = self->_waitForAccurateLocationsHandlers;
      if (!waitForAccurateLocationsHandlers)
      {
        v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = self->_waitForAccurateLocationsHandlers;
        self->_waitForAccurateLocationsHandlers = v10;

        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__waitForAccurateLocationsTimerFired_, 0, 0, 10.0);
        v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        waitForAccurateLocationsTimer = self->_waitForAccurateLocationsTimer;
        self->_waitForAccurateLocationsTimer = v12;

        waitForAccurateLocationsHandlers = self->_waitForAccurateLocationsHandlers;
      }
      v14 = (void *)objc_msgSend(v7, "copy");
      -[NSMutableArray addObject:](waitForAccurateLocationsHandlers, "addObject:", v14);

      -[MKLocationManager lastGoodLocation](self, "lastGoodLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "timestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceNow");
        v19 = v18;

        if (v19 <= 0.0 && v19 >= -10.0)
        {
          objc_msgSend(v16, "horizontalAccuracy");
          if (v20 <= 65.0)
          {
            GEOFindOrCreateLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v16, "horizontalAccuracy");
              v23 = 134218240;
              v24 = -v19;
              v25 = 2048;
              v26 = v22;
              _os_log_impl(&dword_18B0B0000, v21, OS_LOG_TYPE_DEBUG, "waitForAccurateLocationWithTimeout:handler: lastGoodLocation is good enough to consider accurate, short-circuiting wait for new location (%#.1lfs old, %#.1lfm accuracy)", (uint8_t *)&v23, 0x16u);
            }

            -[MKLocationManager _setIsReceivingAccurateLocations:](self, "_setIsReceivingAccurateLocations:", 1);
          }
        }
      }

    }
  }

}

- (void)_waitForAccurateLocationsTimerFired:(id)a3
{
  NSObject *v4;
  int v5;
  MKLocationManager *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134218240;
    v6 = self;
    v7 = 2048;
    v8 = 0x4024000000000000;
    _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "No accurate locations received for %p after %f seconds", (uint8_t *)&v5, 0x16u);
  }

  -[MKLocationManager _setIsReceivingAccurateLocations:](self, "_setIsReceivingAccurateLocations:", 1);
}

- (id)singleLocationUpdateWithHandler:(id)a3
{
  id v4;
  MKLocationManagerSingleUpdater *v5;

  v4 = a3;
  v5 = -[MKLocationManagerSingleUpdater initWithLocationManager:handler:]([MKLocationManagerSingleUpdater alloc], "initWithLocationManager:handler:", self, v4);

  return v5;
}

- (id)singleLocationUpdateWithDesiredAccuracy:(double)a3 handler:(id)a4
{
  id v6;
  MKLocationManagerSingleUpdater *v7;

  v6 = a4;
  v7 = -[MKLocationManagerSingleUpdater initWithLocationManager:desiredAccuracy:handler:]([MKLocationManagerSingleUpdater alloc], "initWithLocationManager:desiredAccuracy:handler:", self, v6, a3);

  return v7;
}

- (id)singleLocationUpdateWithDesiredAccuracy:(double)a3 handler:(id)a4 timeout:(double)a5
{
  id v8;
  MKLocationManagerSingleUpdater *v9;

  v8 = a4;
  v9 = -[MKLocationManagerSingleUpdater initWithLocationManager:desiredAccuracy:handler:timeout:]([MKLocationManagerSingleUpdater alloc], "initWithLocationManager:desiredAccuracy:handler:timeout:", self, v8, a3, a5);

  return v9;
}

- (id)singleLocationUpdateWithDesiredAccuracy:(double)a3 handler:(id)a4 timeout:(double)a5 maxLocationAge:(double)a6
{
  id v10;
  MKLocationManagerSingleUpdater *v11;

  v10 = a4;
  v11 = -[MKLocationManagerSingleUpdater initWithLocationManager:desiredAccuracy:handler:timeout:maxLocationAge:]([MKLocationManagerSingleUpdater alloc], "initWithLocationManager:desiredAccuracy:handler:timeout:maxLocationAge:", self, v10, a3, a5, a6);

  return v11;
}

- (void)stopHeadingUpdateWithObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_headingObservers, "containsObject:"))
  {
    -[NSHashTable removeObject:](self->_headingObservers, "removeObject:", v4);
    if (!-[NSHashTable count](self->_headingObservers, "count"))
      -[MKLocationManager _setTrackingHeading:](self, "_setTrackingHeading:", 0);
  }

}

- (void)startVehicleSpeedUpdate
{
  id v2;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startUpdatingVehicleSpeed");

}

- (void)stopVehicleSpeedUpdate
{
  id v2;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopUpdatingVehicleSpeed");

}

- (void)startVehicleHeadingUpdate
{
  id v2;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startUpdatingVehicleHeading");

}

- (void)stopVehicleHeadingUpdate
{
  id v2;

  -[MKLocationManager locationProvider](self, "locationProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopUpdatingVehicleHeading");

}

+ (id)timeoutError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MKLocationErrorDomain, 5, 0);
}

- (BOOL)isLastLocationStale
{
  return self->_isLastLocationStale;
}

- (NSError)locationError
{
  return self->_locationError;
}

- (id)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)useCourseForHeading
{
  return self->_useCourseForHeading;
}

- (void)setUseCourseForHeading:(BOOL)a3
{
  self->_useCourseForHeading = a3;
}

- (BOOL)continuesWhileInactive
{
  return self->_continuesWhileInactive;
}

- (double)navigationCourse
{
  return self->_navCourse;
}

- (id)locationCorrector
{
  return self->_locationCorrector;
}

- (BOOL)wasLastLocationPushed
{
  return self->_lastLocationPushed;
}

- (double)minimumLocationUpdateInterval
{
  return self->_minimumLocationUpdateInterval;
}

- (void)setMinimumLocationUpdateInterval:(double)a3
{
  self->_minimumLocationUpdateInterval = a3;
}

- (BOOL)logStartStopLocationUpdates
{
  return self->_logStartStopLocationUpdates;
}

- (void)setLogStartStopLocationUpdates:(BOOL)a3
{
  self->_logStartStopLocationUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationError, 0);
  objc_storeStrong((id *)&self->_authStatusInitializationGroup, 0);
  objc_storeStrong((id *)&self->_accuracyAuthorizationIsolater, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_lastLocationLock, 0);
  objc_storeStrong((id *)&self->_recentLocationUpdateIntervals, 0);
  objc_storeStrong(&self->_locationCorrector, 0);
  objc_storeStrong(&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_headingThrottlingTimer, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_throttledHeading, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_waitForAccurateLocationsTimer, 0);
  objc_storeStrong((id *)&self->_waitForAccurateLocationsHandlers, 0);
  objc_storeStrong((id *)&self->_locationRecorder, 0);
  objc_storeStrong((id *)&self->_lastGoodLocation, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_headingObservers, 0);
  objc_storeStrong((id *)&self->_locationListeners, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end
