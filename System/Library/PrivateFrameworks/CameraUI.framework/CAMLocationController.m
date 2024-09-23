@implementation CAMLocationController

- (CAMLocationController)init
{
  CAMLocationController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *listenersQueue;
  uint64_t v6;
  NSHashTable *listenersWaitingForLocation;
  void *v8;
  CAMLocationController *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMLocationController;
  v2 = -[CAMLocationController init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.location-listeners-queue", v3);
    listenersQueue = v2->__listenersQueue;
    v2->__listenersQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    listenersWaitingForLocation = v2->__listenersWaitingForLocation;
    v2->__listenersWaitingForLocation = (NSHashTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__updateLocationMonitoring, *MEMORY[0x1E0DC4868], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__updateLocationMonitoring, *MEMORY[0x1E0DC4750], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__updateLocationMonitoring, *MEMORY[0x1E0DC4840], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__resetDidRequestLocation, *MEMORY[0x1E0DC4768], 0);
    v9 = v2;

  }
  return v2;
}

- (void)_updateLocationMonitoring
{
  _BOOL4 v3;
  _BOOL4 v4;

  v3 = -[CAMLocationController _isMonitoringLocation](self, "_isMonitoringLocation");
  if (-[CAMLocationController isEnabled](self, "isEnabled"))
  {
    v4 = +[CAMApplication isAppOrPlugInSuspended](CAMApplication, "isAppOrPlugInSuspended");
    if (!v4 && !v3)
    {
      -[CAMLocationController _startMonitoringLocationUpdates](self, "_startMonitoringLocationUpdates");
      return;
    }
    if (!v4)
      return;
  }
  if (v3)
    -[CAMLocationController _stopMonitoringLocationUpdates](self, "_stopMonitoringLocationUpdates");
}

- (BOOL)_isMonitoringLocation
{
  return self->__monitoringLocation;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[CAMLocationController _updateLocationMonitoring](self, "_updateLocationMonitoring");
  }
}

- (void)_startMonitoringLocationUpdates
{
  CLLocationManager *v3;
  CLLocationManager *locationManager;

  if (!-[CAMLocationController _isMonitoringLocation](self, "_isMonitoringLocation")
    && -[CAMLocationController isEnabled](self, "isEnabled"))
  {
    if (!self->__locationManager)
    {
      v3 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E0C9E3C8]);
      locationManager = self->__locationManager;
      self->__locationManager = v3;

      -[CLLocationManager setDelegate:](self->__locationManager, "setDelegate:", self);
      -[CLLocationManager setDistanceFilter:](self->__locationManager, "setDistanceFilter:", *MEMORY[0x1E0C9E480]);
      -[CLLocationManager setHeadingFilter:](self->__locationManager, "setHeadingFilter:", 5.0);
      -[CLLocationManager setDesiredAccuracy:](self->__locationManager, "setDesiredAccuracy:", *MEMORY[0x1E0C9E490]);
      if (_startMonitoringLocationUpdates_onceToken != -1)
        dispatch_once(&_startMonitoringLocationUpdates_onceToken, &__block_literal_global_45);
      if (_startMonitoringLocationUpdates_disableIndoorLocation)
        -[CLLocationManager setActivityType:](self->__locationManager, "setActivityType:", 3);
    }
    -[CAMLocationController _authorizeOrStartLocationManager](self, "_authorizeOrStartLocationManager");
  }
}

- (void)_authorizeOrStartLocationManager
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  -[CAMLocationController _locationManager](self, "_locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMLocationController lastKnownAuthorizationStatus](self, "lastKnownAuthorizationStatus");
  if (v4 == 4)
  {
    if (!-[CAMLocationController _isMonitoringLocation](self, "_isMonitoringLocation"))
    {
      v6 = MEMORY[0x1E0C809B0];
      self->__monitoringLocation = 1;
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke_2;
      v10[3] = &unk_1EA328A40;
      v10[4] = self;
      v7 = v3;
      v11 = v7;
      -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v10, CFSTR("-[CLLocationManager startUpdatingLocation]"), 0.2);
      if (-[CAMLocationController isHeadingEnabled](self, "isHeadingEnabled"))
      {
        v8[0] = v6;
        v8[1] = 3221225472;
        v8[2] = __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke_3;
        v8[3] = &unk_1EA328868;
        v9 = v7;
        -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v8, CFSTR("-[CLLocationManager startUpdatingHeading]"), 0.2);

      }
      v5 = v11;
      goto LABEL_9;
    }
  }
  else if (!v4 && !-[CAMLocationController _didRequestLocation](self, "_didRequestLocation"))
  {
    -[CAMLocationController _setDidRequestLocation:](self, "_setDidRequestLocation:", 1);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke;
    v12[3] = &unk_1EA328868;
    v13 = v3;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v12, CFSTR("-[CLLocationManager requestWhenInUseAuthorization]"), 0.2);
    v5 = v13;
LABEL_9:

  }
}

- (void)setHeadingEnabled:(BOOL)a3
{
  const __CFString *v4;
  uint64_t *v5;
  CLHeading *currentHeading;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CAMLocationController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  CAMLocationController *v16;

  if (self->_headingEnabled != a3)
  {
    self->_headingEnabled = a3;
    if (self->__monitoringLocation)
    {
      if (a3)
      {
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __43__CAMLocationController_setHeadingEnabled___block_invoke;
        v15 = &unk_1EA328868;
        v16 = self;
        v4 = CFSTR("-[CLLocationManager startUpdatingHeading]");
        v5 = &v12;
      }
      else
      {
        v7 = MEMORY[0x1E0C809B0];
        v8 = 3221225472;
        v9 = __43__CAMLocationController_setHeadingEnabled___block_invoke_2;
        v10 = &unk_1EA328868;
        v11 = self;
        v4 = CFSTR("-[CLLocationManager stopUpdatingHeading]");
        v5 = &v7;
      }
      -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v5, v4, 0.2, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
      *(_DWORD *)&a3 = self->_headingEnabled;
    }
    if (!a3)
    {
      currentHeading = self->_currentHeading;
      self->_currentHeading = 0;

    }
  }
}

uint64_t __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestWhenInUseAuthorization");
}

uint64_t __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke_2(uint64_t a1)
{
  CAMSignpostWithIDAndArgs(84, 0xEEEEB0B5B2B2EEEELL, *(_QWORD *)(a1 + 32), 0, 0, 0);
  return objc_msgSend(*(id *)(a1 + 40), "startUpdatingLocation");
}

- (BOOL)isHeadingEnabled
{
  return self->_headingEnabled;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  id v18;

  v18 = a4;
  v5 = -[CAMLocationController _isMonitoringLocation](self, "_isMonitoringLocation");
  v6 = v18;
  if (v5)
  {
    objc_msgSend(v18, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "horizontalAccuracy");
      v10 = v9;
      objc_msgSend(v8, "timestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceNow");
      v13 = v12;

      if (v13 < -60.0 || v10 < 0.0)
      {

        v8 = 0;
      }
      else
      {
        -[CAMLocationController currentLocation](self, "currentLocation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(v8, "horizontalAccuracy");
          v16 = (unint64_t)v15;
          objc_msgSend(v8, "verticalAccuracy");
          CAMSignpostWithIDAndArgs(85, 0xEEEEB0B5B2B2EEEELL, (uint64_t)self, v16, (unint64_t)v17, 0);
        }
      }
    }
    -[CAMLocationController _setCurrentLocation:](self, "_setCurrentLocation:", v8);
    -[CAMLocationController _notifyListenersWaitingOnLocation:](self, "_notifyListenersWaitingOnLocation:", v8);
    -[CAMLocationController _updateAssetsWaitingOnLocation](self, "_updateAssetsWaitingOnLocation");

    v6 = v18;
  }

}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  double v6;
  id v7;

  v7 = a4;
  if (-[CAMLocationController isHeadingEnabled](self, "isHeadingEnabled"))
  {
    objc_msgSend(v7, "headingAccuracy");
    if (v6 > 0.0)
    {
      -[CAMLocationController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentHeading"));
      objc_storeStrong((id *)&self->_currentHeading, a4);
      -[CAMLocationController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentHeading"));
    }
  }

}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (id)headingForOrientation:(int64_t)a3
{
  int v3;
  uint64_t v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[5];
  int v16;

  v3 = a3;
  if (-[CAMLocationController _isMonitoringLocation](self, "_isMonitoringLocation"))
  {
    v5 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__CAMLocationController_headingForOrientation___block_invoke;
    v15[3] = &unk_1EA32D5F8;
    v15[4] = self;
    v16 = v3;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v15, CFSTR("-[CLLocationManager setHeadingOrientation:]"), 0.2);
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__21;
    v13 = __Block_byref_object_dispose__21;
    v14 = 0;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __47__CAMLocationController_headingForOrientation___block_invoke_63;
    v8[3] = &unk_1EA32C0D8;
    v8[4] = self;
    v8[5] = &v9;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v8, CFSTR("-[CLLocationManager heading]"), 0.2);
    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (CLLocationManager)_locationManager
{
  return self->__locationManager;
}

+ (id)locationMetadataForLocation:(id)a3 heading:(id)a4 device:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  const __CFString *v16;
  float v17;
  const __CFString *v18;
  float v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  _BOOL8 v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  const __CFString *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "coordinate");
    v12 = v11;
    objc_msgSend(v8, "coordinate");
    v14 = v13;
    *(float *)&v15 = fabsf(v12);
    if (v12 >= 0.0)
      v16 = CFSTR("N");
    else
      v16 = CFSTR("S");
    if (v12 >= 0.0)
      *(float *)&v15 = v12;
    v17 = fabsf(v14);
    if (v14 >= 0.0)
      v18 = CFSTR("E");
    else
      v18 = CFSTR("W");
    if (v14 >= 0.0)
      v19 = v14;
    else
      v19 = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v20, *MEMORY[0x1E0CBCD90]);

    objc_msgSend(v10, "setObject:forKey:", v16, *MEMORY[0x1E0CBCD98]);
    *(float *)&v21 = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v22, *MEMORY[0x1E0CBCDA0]);

    objc_msgSend(v10, "setObject:forKey:", v18, *MEMORY[0x1E0CBCDA8]);
    objc_msgSend(v8, "timestamp");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(a1, "_sharedGPSTimestampFormatter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringFromDate:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(v10, "setObject:forKey:", v25, *MEMORY[0x1E0CBCDE8]);
      objc_msgSend(a1, "_sharedGPSDatestampFormatter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringFromDate:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_msgSend(v10, "setObject:forKey:", v27, *MEMORY[0x1E0CBCD20]);

    }
    objc_msgSend(v8, "horizontalAccuracy");
    if (v28 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v29, *MEMORY[0x1E0CBCD78]);

    }
    objc_msgSend(v8, "verticalAccuracy");
    if (v30 >= 0.0)
    {
      objc_msgSend(v8, "altitude");
      v32 = v31 < 0.0;
      v33 = fabs(v31);
      if (v31 < 0.0)
        v31 = v33;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v34, *MEMORY[0x1E0CBCD00]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v35, *MEMORY[0x1E0CBCD08]);

    }
    if (!v9)
      goto LABEL_40;
    objc_msgSend(v9, "headingAccuracy");
    if (v36 < 0.0)
      goto LABEL_40;
    if (CFPreferencesGetAppBooleanValue(CFSTR("kMagneticNorth"), CFSTR("com.apple.compass"), 0)
      || (objc_msgSend(v9, "trueHeading"), v37 < 0.0))
    {
      objc_msgSend(v9, "magneticHeading");
      v39 = v38;
      v40 = CFSTR("M");
    }
    else
    {
      objc_msgSend(v9, "trueHeading");
      v39 = v41;
      v40 = CFSTR("T");
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v42, *MEMORY[0x1E0CBCD28]);

    objc_msgSend(v10, "setObject:forKey:", v40, *MEMORY[0x1E0CBCD30]);
    if ((unint64_t)(a5 - 8) < 4 || a5 == 1)
    {
      v39 = v39 + 180.0;
      v43 = 360.0;
      if (v39 >= 360.0)
      {
        v43 = -360.0;
      }
      else if (v39 >= 0.0)
      {
        goto LABEL_39;
      }
      v39 = v39 + v43;
    }
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v44, *MEMORY[0x1E0CBCD80]);

    objc_msgSend(v10, "setObject:forKey:", v40, *MEMORY[0x1E0CBCD88]);
LABEL_40:
    v45 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "speed");
    objc_msgSend(v45, "numberWithDouble:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v46, *MEMORY[0x1E0CBCDD0]);

    objc_msgSend(v10, "setObject:forKey:", CFSTR("K"), *MEMORY[0x1E0CBCDD8]);
    goto LABEL_41;
  }
  v10 = 0;
LABEL_41:
  v47 = (void *)objc_msgSend(v10, "copy");

  return v47;
}

+ (id)_sharedGPSTimestampFormatter
{
  if (_sharedGPSTimestampFormatter_onceToken != -1)
    dispatch_once(&_sharedGPSTimestampFormatter_onceToken, &__block_literal_global_27);
  return (id)_sharedGPSTimestampFormatter_formatter;
}

uint64_t __53__CAMLocationController__sharedGPSTimestampFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_sharedGPSTimestampFormatter_formatter;
  _sharedGPSTimestampFormatter_formatter = (uint64_t)v0;

  v2 = (void *)_sharedGPSTimestampFormatter_formatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)_sharedGPSTimestampFormatter_formatter;
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "setCalendar:", v6);

  v7 = (void *)_sharedGPSTimestampFormatter_formatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v8);

  return objc_msgSend((id)_sharedGPSTimestampFormatter_formatter, "setDateFormat:", CFSTR("HH:mm:ss.SS"));
}

+ (id)_sharedGPSDatestampFormatter
{
  if (_sharedGPSDatestampFormatter_onceToken != -1)
    dispatch_once(&_sharedGPSDatestampFormatter_onceToken, &__block_literal_global_38);
  return (id)_sharedGPSDatestampFormatter_formatter;
}

uint64_t __53__CAMLocationController__sharedGPSDatestampFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_sharedGPSDatestampFormatter_formatter;
  _sharedGPSDatestampFormatter_formatter = (uint64_t)v0;

  v2 = (void *)_sharedGPSDatestampFormatter_formatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)_sharedGPSDatestampFormatter_formatter;
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "setCalendar:", v6);

  v7 = (void *)_sharedGPSDatestampFormatter_formatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v8);

  return objc_msgSend((id)_sharedGPSDatestampFormatter_formatter, "setDateFormat:", CFSTR("yyyy:MM:dd"));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CAMLocationController _stopMonitoringLocationUpdates](self, "_stopMonitoringLocationUpdates");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CAMLocationController;
  -[CAMLocationController dealloc](&v4, sel_dealloc);
}

uint64_t __43__CAMLocationController_setHeadingEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "startUpdatingHeading");
}

uint64_t __43__CAMLocationController_setHeadingEnabled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopUpdatingHeading");
}

- (void)_setCurrentLocation:(id)a3
{
  CLLocation *v5;
  CLLocation *v6;
  double v7;
  double v8;
  double v9;
  char v10;
  CLLocation *v11;

  v5 = (CLLocation *)a3;
  v6 = v5;
  v11 = v5;
  if (v5)
  {
    -[CLLocation horizontalAccuracy](v5, "horizontalAccuracy");
    v8 = v7;
    -[CLLocation verticalAccuracy](v11, "verticalAccuracy");
    if (v8 >= v9)
      v9 = v8;
    CAMSignpostWithIDAndArgs(86, 0xEEEEB0B5B2B2EEEELL, (uint64_t)self, (unint64_t)v9, 0, 0);
    v6 = v11;
  }
  if (self->_currentLocation != v6)
  {
    v10 = -[CLLocation isEqual:](v6, "isEqual:");
    v6 = v11;
    if ((v10 & 1) == 0)
    {
      -[CAMLocationController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentLocation"));
      objc_storeStrong((id *)&self->_currentLocation, a3);
      -[CAMLocationController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentLocation"));
      v6 = v11;
    }
  }

}

uint64_t __56__CAMLocationController__startMonitoringLocationUpdates__block_invoke()
{
  uint64_t result;
  BOOL v1;

  result = sysctlbyname("hw.memsize", &_block_invoke_amountOfPhysicalMemory, (size_t *)&_block_invoke_size, 0, 0);
  if ((_DWORD)result)
    v1 = 1;
  else
    v1 = _block_invoke_size == 0;
  if (!v1)
    _startMonitoringLocationUpdates_disableIndoorLocation = (unint64_t)_block_invoke_amountOfPhysicalMemory < 0x40000001;
  return result;
}

uint64_t __57__CAMLocationController__authorizeOrStartLocationManager__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startUpdatingHeading");
}

- (void)_stopMonitoringLocationUpdates
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (-[CAMLocationController _isMonitoringLocation](self, "_isMonitoringLocation"))
  {
    v3 = MEMORY[0x1E0C809B0];
    self->__monitoringLocation = 0;
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __55__CAMLocationController__stopMonitoringLocationUpdates__block_invoke;
    v5[3] = &unk_1EA328868;
    v5[4] = self;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v5, CFSTR("-[CLLocationManager stopUpdatingLocation]"), 0.2);
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __55__CAMLocationController__stopMonitoringLocationUpdates__block_invoke_2;
    v4[3] = &unk_1EA328868;
    v4[4] = self;
    -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", v4, CFSTR("-[CLLocationManager stopUpdatingHeading]"), 0.2);
  }
}

uint64_t __55__CAMLocationController__stopMonitoringLocationUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopUpdatingLocation");
}

uint64_t __55__CAMLocationController__stopMonitoringLocationUpdates__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopUpdatingHeading");
}

- (void)_resetDidRequestLocation
{
  -[CAMLocationController _setDidRequestLocation:](self, "_setDidRequestLocation:", 0);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __63__CAMLocationController_locationManagerDidChangeAuthorization___block_invoke;
  v12 = &unk_1EA32C0D8;
  v14 = &v15;
  v5 = v4;
  v13 = v5;
  -[CAMLocationController _performBlock:andLogIfExecutionExceeds:logPrefix:](self, "_performBlock:andLogIfExecutionExceeds:logPrefix:", &v9, CFSTR("-[CLLocationManager authorizationStatus]"), 0.2);
  -[CAMLocationController _setLastKnownAuthorizationStatus:](self, "_setLastKnownAuthorizationStatus:", *((unsigned int *)v16 + 6), v9, v10, v11, v12);
  v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *((int *)v16 + 6);
    if (v7 > 4)
      v8 = 0;
    else
      v8 = off_1EA32E368[v7];
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Received location authorization status %{public}@", buf, 0xCu);
  }

  if (*((_DWORD *)v16 + 6) <= 2u)
    -[CAMLocationController _setCurrentLocation:](self, "_setCurrentLocation:", 0);
  -[CAMLocationController _authorizeOrStartLocationManager](self, "_authorizeOrStartLocationManager");
  -[CAMLocationController _notifyListenersForAuthorizationStatusUpdate:](self, "_notifyListenersForAuthorizationStatusUpdate:", *((unsigned int *)v16 + 6));

  _Block_object_dispose(&v15, 8);
}

uint64_t __63__CAMLocationController_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "authorizationStatus");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __47__CAMLocationController_headingForOrientation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_locationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeadingOrientation:", *(unsigned int *)(a1 + 40));

}

void __47__CAMLocationController_headingForOrientation___block_invoke_63(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_locationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heading");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_performBlock:(id)a3 andLogIfExecutionExceeds:(double)a4 logPrefix:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  double Current;
  double v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void (**)(_QWORD))a3;
  Current = CFAbsoluteTimeGetCurrent();
  v8[2](v8);

  v10 = CFAbsoluteTimeGetCurrent() - Current;
  if (v10 > a4)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v7;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ took %.3f seconds", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)_notifyListenersForAuthorizationStatusUpdate:(int)a3
{
  NSObject *listenersQueue;
  _QWORD v4[5];
  int v5;

  listenersQueue = self->__listenersQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__CAMLocationController__notifyListenersForAuthorizationStatusUpdate___block_invoke;
  v4[3] = &unk_1EA32D5F8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(listenersQueue, v4);
}

void __70__CAMLocationController__notifyListenersForAuthorizationStatusUpdate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "listeningQueue");
          v9 = objc_claimAutoreleasedReturnValue();
          v10[0] = v6;
          v10[1] = 3221225472;
          v10[2] = __70__CAMLocationController__notifyListenersForAuthorizationStatusUpdate___block_invoke_2;
          v10[3] = &unk_1EA32D5F8;
          v10[4] = v8;
          v11 = *(_DWORD *)(a1 + 40);
          dispatch_async(v9, v10);

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __70__CAMLocationController__notifyListenersForAuthorizationStatusUpdate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "authorizationStatusUpdated:", *(unsigned int *)(a1 + 40));
}

- (void)_notifyListenersWaitingOnLocation:(id)a3
{
  id v4;
  NSObject *listenersQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  listenersQueue = self->__listenersQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CAMLocationController__notifyListenersWaitingOnLocation___block_invoke;
  v7[3] = &unk_1EA328A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listenersQueue, v7);

}

void __59__CAMLocationController__notifyListenersWaitingOnLocation___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "listeningQueue");
          v9 = objc_claimAutoreleasedReturnValue();
          v10[0] = v6;
          v10[1] = 3221225472;
          v10[2] = __59__CAMLocationController__notifyListenersWaitingOnLocation___block_invoke_2;
          v10[3] = &unk_1EA328A40;
          v10[4] = v8;
          v11 = *(id *)(a1 + 40);
          dispatch_async(v9, v10);

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __59__CAMLocationController__notifyListenersWaitingOnLocation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "currentLocationUpdated:", *(_QWORD *)(a1 + 40));
}

- (void)addListenerForLocationUpdates:(id)a3
{
  id v4;
  NSObject *listenersQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  listenersQueue = self->__listenersQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CAMLocationController_addListenerForLocationUpdates___block_invoke;
  v7[3] = &unk_1EA328A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listenersQueue, v7);

}

void __55__CAMLocationController_addListenerForLocationUpdates___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD block[7];
  _QWORD v9[5];
  id v10;
  _QWORD v11[3];
  int v12;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = __Block_byref_object_copy__21;
    v9[4] = __Block_byref_object_dispose__21;
    v10 = 0;
    v2 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__CAMLocationController_addListenerForLocationUpdates___block_invoke_2;
    block[3] = &unk_1EA32E348;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v11;
    block[6] = v9;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    objc_msgSend(*(id *)(a1 + 40), "listeningQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = v2;
    v4[1] = 3221225472;
    v4[2] = __55__CAMLocationController_addListenerForLocationUpdates___block_invoke_3;
    v4[3] = &unk_1EA32B500;
    v5 = *(id *)(a1 + 40);
    v6 = v11;
    v7 = v9;
    dispatch_async(v3, v4);

    _Block_object_dispose(v9, 8);
    _Block_object_dispose(v11, 8);
  }
}

void __55__CAMLocationController_addListenerForLocationUpdates___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "lastKnownAuthorizationStatus");
  objc_msgSend(*(id *)(a1 + 32), "currentLocation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __55__CAMLocationController_addListenerForLocationUpdates___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "authorizationStatusUpdated:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    return objc_msgSend(*(id *)(a1 + 32), "currentLocationUpdated:");
  return result;
}

- (void)removeListenerForLocationUpdates:(id)a3
{
  id v4;
  NSObject *listenersQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  listenersQueue = self->__listenersQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CAMLocationController_removeListenerForLocationUpdates___block_invoke;
  v7[3] = &unk_1EA328A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listenersQueue, v7);

}

uint64_t __58__CAMLocationController_removeListenerForLocationUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (CLHeading)currentHeading
{
  return self->_currentHeading;
}

- (int)lastKnownAuthorizationStatus
{
  return self->_lastKnownAuthorizationStatus;
}

- (void)_setLastKnownAuthorizationStatus:(int)a3
{
  self->_lastKnownAuthorizationStatus = a3;
}

- (NSMutableArray)_enqueuedAssetsWaitingForLocation
{
  return self->__enqueuedAssetsWaitingForLocation;
}

- (NSHashTable)_listenersWaitingForLocation
{
  return self->__listenersWaitingForLocation;
}

- (OS_dispatch_queue)_listenersQueue
{
  return self->__listenersQueue;
}

- (BOOL)_didRequestLocation
{
  return self->__didRequestLocation;
}

- (void)_setDidRequestLocation:(BOOL)a3
{
  self->__didRequestLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__listenersQueue, 0);
  objc_storeStrong((id *)&self->__listenersWaitingForLocation, 0);
  objc_storeStrong((id *)&self->__enqueuedAssetsWaitingForLocation, 0);
  objc_storeStrong((id *)&self->__locationManager, 0);
  objc_storeStrong((id *)&self->_currentHeading, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
}

@end
