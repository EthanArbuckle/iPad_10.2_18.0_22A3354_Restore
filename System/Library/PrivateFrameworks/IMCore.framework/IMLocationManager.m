@implementation IMLocationManager

- (IMLocationManager)init
{
  IMLocationManager *v2;
  CLLocationManager *v3;
  CLLocationManager *locationManager;
  CLLocationManager *v5;
  NSMutableArray *v6;
  NSMutableArray *handlers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMLocationManager;
  v2 = -[IMLocationManager init](&v9, sel_init);
  if (v2)
  {
    if (qword_1EE65F6B0 != -1)
      dispatch_once(&qword_1EE65F6B0, &unk_1E471DB38);
    v3 = (CLLocationManager *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "__CLLocationManagerClass"));
    -[CLLocationManager setDelegate:](v3, "setDelegate:", v2);
    -[CLLocationManager setDesiredAccuracy:](v3, "setDesiredAccuracy:", *(double *)&qword_1EE65F6A8);
    locationManager = v2->_locationManager;
    v2->_locationManager = v3;
    v5 = v3;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    handlers = v2->_handlers;
    v2->_handlers = v6;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1ECF125D0 != -1)
    dispatch_once(&qword_1ECF125D0, &unk_1E471C2B0);
  return (id)qword_1ECF12630;
}

- (void)startUpdatingCurrentLocationWithAuthorizedHandler:(id)a3 updateHandler:(id)a4
{
  -[IMLocationManager startUpdatingCurrentLocationWithForegroundAssertionForBundleIdentifier:withAuthorizedHandler:updateHandler:](self, "startUpdatingCurrentLocationWithForegroundAssertionForBundleIdentifier:withAuthorizedHandler:updateHandler:", 0, a3, a4);
}

- (void)startUpdatingCurrentLocationWithForegroundAssertionForBundleIdentifier:(id)a3 withAuthorizedHandler:(id)a4 updateHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _BYTE buf[24];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (!v9 || !v10)
    goto LABEL_40;
  if (objc_msgSend(v8, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "IMLocationManager taking CLInUseAssertion for %@", buf, 0xCu);
      }

    }
    v13 = (void *)objc_msgSend((id)objc_opt_class(), "__CLInUseAssertionClass");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Treating %@ as a foreground process for location sending."), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "newAssertionForBundleIdentifier:withReason:level:", v8, v14, 1);

    -[IMLocationManager setInUseAssertion:](self, "setInUseAssertion:", v15);
  }
  -[IMLocationManager locationManager](self, "locationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "authorizationStatus");

  if (v17)
  {
    v18 = IMOSLoggingEnabled();
    if ((v17 - 3) >= 2)
    {
      if (v18)
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_INFO, "IMLocationManager denied when in use location authorization", buf, 2u);
        }

      }
      v39 = objc_alloc(MEMORY[0x1E0C99D80]);
      v40 = (void *)objc_msgSend(v39, "initWithObjectsAndKeys:", CFSTR("IMLocationManager does not have location access"), *MEMORY[0x1E0CB2D50], 0);
      v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v42 = (void *)objc_msgSend(v41, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D36350], 42, v40);
      ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v42);

    }
    else
    {
      if (v18)
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          -[IMLocationManager locationManager](self, "locationManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "_limitsPrecision");
          v22 = CFSTR("NO");
          if (v21)
            v22 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v22;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Starting with _limitsPrecision %@", buf, 0xCu);

        }
      }
      -[IMLocationManager locationUpdateTimer](self, "locationUpdateTimer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (!v24)
      {
        -[IMLocationManager locationUpdateTimer](self, "locationUpdateTimer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "invalidate");

        -[IMLocationManager setLocationUpdateTimer:](self, "setLocationUpdateTimer:", 0);
      }
      if (!-[IMLocationManager firstAuthorizationCallbackArrived](self, "firstAuthorizationCallbackArrived"))
      {
        v31 = (id)objc_msgSend(v9, "copy");

        v30 = (id)objc_msgSend(v11, "copy");
        -[IMLocationManager handlers](self, "handlers");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = _Block_copy(v31);
        v51[0] = v44;
        v45 = _Block_copy(v30);
        v51[1] = v45;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v46);

        goto LABEL_41;
      }
      -[IMLocationManager locationManager](self, "locationManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "_limitsPrecision"))
      {
        v27 = -[IMLocationManager inRequestPreciseLocation](self, "inRequestPreciseLocation");

        if (!v27)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "Requesting temporary full precision.", buf, 2u);
            }

          }
          -[IMLocationManager setInRequestPreciseLocation:](self, "setInRequestPreciseLocation:", 1);
          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, self);
          -[IMLocationManager locationManager](self, "locationManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = sub_1A2130FC4;
          v47[3] = &unk_1E4722C20;
          objc_copyWeak(&v50, (id *)buf);
          v30 = v11;
          v48 = v30;
          v31 = v9;
          v49 = v31;
          objc_msgSend(v29, "requestTemporaryFullAccuracyAuthorizationWithPurposeKey:completion:", CFSTR("SendLocationDescription"), v47);

          objc_destroyWeak(&v50);
          objc_destroyWeak((id *)buf);
          goto LABEL_41;
        }
      }
      else
      {

      }
      -[IMLocationManager setInRequestPreciseLocation:](self, "setInRequestPreciseLocation:", 0);
      -[IMLocationManager _startLocationUpdateTimerWithAuthorizedHandler:updateHandler:](self, "_startLocationUpdateTimerWithAuthorizedHandler:updateHandler:", v9, v11);
    }
LABEL_40:
    v30 = v11;
    v31 = v9;
    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v32, OS_LOG_TYPE_INFO, "IMLocationManager location authorization not determined, requesting when in use authorization", buf, 2u);
    }

  }
  -[IMLocationManager locationManager](self, "locationManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "requestWhenInUseAuthorization");

  v31 = (id)objc_msgSend(v9, "copy");
  v30 = (id)objc_msgSend(v11, "copy");

  -[IMLocationManager handlers](self, "handlers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = _Block_copy(v31);
  v52[0] = v35;
  v36 = _Block_copy(v30);
  v52[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObject:", v37);

LABEL_41:
}

- (void)_startLocationUpdateTimerWithAuthorizedHandler:(id)a3 updateHandler:(id)a4
{
  void (*v6)(void);
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t v21[8];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = (void (*)(void))*((_QWORD *)a3 + 2);
  v7 = a4;
  v8 = a3;
  v6();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = (void *)objc_msgSend(v7, "copy");
  -[IMLocationManager handlers](self, "handlers");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _Block_copy(v9);
  v22[0] = v12;
  v13 = _Block_copy(v10);
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "addObject:", v14);

  -[IMLocationManager locationUpdateTimer](self, "locationUpdateTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = v15 == 0;

  if ((v11 & 1) == 0)
  {
    -[IMLocationManager locationUpdateTimer](self, "locationUpdateTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    -[IMLocationManager setLocationUpdateTimer:](self, "setLocationUpdateTimer:", 0);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMLocationManager setLocateStartTime:](self, "setLocateStartTime:", v17);

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__locationUpdateTimerFired_, 0, 1, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMLocationManager setLocationUpdateTimer:](self, "setLocationUpdateTimer:", v18);
  -[IMLocationManager locationManager](self, "locationManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startUpdatingLocation");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Started location update", v21, 2u);
    }

  }
}

- (BOOL)locationAuthorizationDetermined
{
  void *v2;
  int v3;

  -[IMLocationManager locationManager](self, "locationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authorizationStatus");

  return v3 != 0;
}

- (BOOL)locationAuthorizationDenied
{
  void *v2;
  int v3;

  -[IMLocationManager locationManager](self, "locationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authorizationStatus");

  return (v3 - 1) < 2;
}

- (BOOL)preciseLocationAuthorized
{
  void *v2;
  BOOL v3;

  -[IMLocationManager locationManager](self, "locationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accuracyAuthorization") == 0;

  return v3;
}

- (CLLocation)currentLocation
{
  void *v2;
  void *v3;

  -[IMLocationManager locationManager](self, "locationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLLocation *)v3;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Location manager got updated location", v10, 2u);
      }

    }
    -[IMLocationManager setLocation:](self, "setLocation:", v8);
    -[IMLocationManager setError:](self, "setError:", 0);
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "code"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Location manager failed with error %@", (uint8_t *)&v9, 0xCu);
      }

    }
    -[IMLocationManager _errorHappend:](self, "_errorHappend:", v7);
  }

}

- (void)_errorHappend:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMLocationManager setLocation:](self, "setLocation:", 0);
  -[IMLocationManager setError:](self, "setError:", v4);

  -[IMLocationManager _fireCompletionHandlers](self, "_fireCompletionHandlers");
  -[IMLocationManager locationManager](self, "locationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopUpdatingLocation");

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v6, "_limitsPrecision");
      v9 = CFSTR("NO");
      if (v8)
        v9 = CFSTR("YES");
      *(_DWORD *)buf = 67109378;
      v28 = a4;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "authorization status did change %u, received Coarse Location %@", buf, 0x12u);
    }

  }
  -[IMLocationManager setFirstAuthorizationCallbackArrived:](self, "setFirstAuthorizationCallbackArrived:", 1);
  -[IMLocationManager handlers](self, "handlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") == 0;

  if (!v11)
  {
    if ((a4 - 3) > 1)
    {
      if ((a4 - 1) <= 1)
        -[IMLocationManager _locationManagerTimedOut](self, "_locationManagerTimedOut");
    }
    else
    {
      -[IMLocationManager handlers](self, "handlers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copy");

      -[IMLocationManager handlers](self, "handlers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAllObjects");

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0, (_QWORD)v22);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMLocationManager startUpdatingCurrentLocationWithAuthorizedHandler:updateHandler:](self, "startUpdatingCurrentLocationWithAuthorizedHandler:updateHandler:", v20, v21);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v16);
      }

    }
  }

}

- (BOOL)_shouldSendLocation:(id)a3 timeIntervalSinceStart:(double)a4
{
  id v5;
  double v6;
  double v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;

  v5 = a3;
  objc_msgSend(v5, "horizontalAccuracy");
  if (a4 <= 0.0)
    v7 = 15.0;
  else
    v7 = a4;
  if (v5)
  {
    v8 = v6 < 25.0 || v6 < 200.0 && v6 < v7 / 15.0 * 175.0 + 25.0;
    objc_msgSend(v5, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceNow");
    v12 = v11;

    v13 = v12 >= 0.0;
    if (-v12 - v7 <= 300.0)
      v13 = 1;
    v9 = v13 && v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_locationUpdateTimerFired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  -[IMLocationManager locationManager](self, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMLocationManager location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  -[IMLocationManager locateStartTime](self, "locateStartTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v8 - v10;

  if (-[IMLocationManager _shouldSendLocation:timeIntervalSinceStart:](self, "_shouldSendLocation:timeIntervalSinceStart:", v6, v11))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Location update timer fired, got location with desired accuracy", buf, 2u);
      }

    }
    -[IMLocationManager _fireCompletionHandlers](self, "_fireCompletionHandlers");
    objc_msgSend(v5, "stopUpdatingLocation");
  }
  else
  {
    v13 = IMOSLoggingEnabled();
    if (v11 >= 15.0)
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Location update timer fired, did not get desired accuracy before timeout. Firing completion handlers", v17, 2u);
        }

      }
      -[IMLocationManager _locationManagerTimedOut](self, "_locationManagerTimedOut");
    }
    else if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Location update timer fired, desired accuracy not obtained but we have time left", v16, 2u);
      }

    }
  }

}

- (void)_locationManagerTimedOut
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[IMLocationManager locationAuthorizationDenied](self, "locationAuthorizationDenied");
  v4 = CFSTR("IMLocationManager Timed Out");
  if (v3)
    v4 = CFSTR("IMLocationManager does not have location authorization");
  v5 = v4;
  if (-[IMLocationManager locationAuthorizationDenied](self, "locationAuthorizationDenied"))
    v6 = 42;
  else
    v6 = 41;
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v5, *MEMORY[0x1E0CB2D50], 0);
  v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v10 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D36350], v6, v8);
  -[IMLocationManager setLocation:](self, "setLocation:", 0);
  -[IMLocationManager setError:](self, "setError:", v10);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Location manager timed out. Reason: %@", buf, 0xCu);
    }

  }
  -[IMLocationManager _fireCompletionHandlers](self, "_fireCompletionHandlers");
  -[IMLocationManager locationManager](self, "locationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopUpdatingLocation");

}

- (void)_fireCompletionHandlers
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  void (**v17)(void *, _QWORD);
  void *v18;
  BOOL v19;
  void *v20;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMLocationManager location](self, "location");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMLocationManager error](self, "error");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v7 = CFSTR("YES");
      if (!v4)
        v7 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v23 = v7;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Location manager firing completion handlers. Has valid location %@ error %@", buf, 0x16u);

    }
  }
  -[IMLocationManager inUseAssertion](self, "inUseAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Invalidating CLInUseAssertion.", buf, 2u);
      }

    }
    -[IMLocationManager inUseAssertion](self, "inUseAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[IMLocationManager setInUseAssertion:](self, "setInUseAssertion:", 0);
  }
  -[IMLocationManager location](self, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    -[IMLocationManager error](self, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (v13)
      return;
  }
  -[IMLocationManager locationUpdateTimer](self, "locationUpdateTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (!v15)
  {
    -[IMLocationManager locationUpdateTimer](self, "locationUpdateTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    -[IMLocationManager setLocationUpdateTimer:](self, "setLocationUpdateTimer:", 0);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A2132294;
  aBlock[3] = &unk_1E4722C48;
  aBlock[4] = self;
  v17 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  -[IMLocationManager location](self, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  if (v19)
  {
    v17[2](v17, 0);
  }
  else
  {
    -[IMLocationManager location](self, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMLocationManager shiftedLocationWithLocation:completion:](self, "shiftedLocationWithLocation:completion:", v20, v17);

  }
}

+ (id)locationShifter
{
  if (qword_1EE65F6C0 != -1)
    dispatch_once(&qword_1EE65F6C0, &unk_1E471DE38);
  return (id)qword_1EE65F6B8;
}

- (void)shiftedLocationWithLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "locationShifter");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend((id)objc_opt_class(), "locationShifter"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend((id)objc_opt_class(), "isLocationShiftRequiredForLocation:", v6),
        v10,
        v9,
        v11))
  {
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A21325A4;
    block[3] = &unk_1E471E818;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(v12, block);

  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }

}

+ (Class)__CLLocationManagerClass
{
  if (qword_1EE65F6D0 != -1)
    dispatch_once(&qword_1EE65F6D0, &unk_1E471BB80);
  return (Class)(id)qword_1EE65F6C8;
}

+ (Class)__CLInUseAssertionClass
{
  if (qword_1EE65F6E0 != -1)
    dispatch_once(&qword_1EE65F6E0, &unk_1E471DE98);
  return (Class)(id)qword_1EE65F6D8;
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDate)locateStartTime
{
  return self->_locateStartTime;
}

- (void)setLocateStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_locateStartTime, a3);
}

- (NSTimer)locationUpdateTimer
{
  return self->_locationUpdateTimer;
}

- (void)setLocationUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_locationUpdateTimer, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)inRequestPreciseLocation
{
  return self->_inRequestPreciseLocation;
}

- (void)setInRequestPreciseLocation:(BOOL)a3
{
  self->_inRequestPreciseLocation = a3;
}

- (BOOL)firstAuthorizationCallbackArrived
{
  return self->_firstAuthorizationCallbackArrived;
}

- (void)setFirstAuthorizationCallbackArrived:(BOOL)a3
{
  self->_firstAuthorizationCallbackArrived = a3;
}

- (CLInUseAssertion)inUseAssertion
{
  return self->_inUseAssertion;
}

- (void)setInUseAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_inUseAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimer, 0);
  objc_storeStrong((id *)&self->_locateStartTime, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
