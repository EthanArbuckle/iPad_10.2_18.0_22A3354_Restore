@implementation _DKLocationCoordinatesMonitor

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  CLLocation **p_lastLocation;
  void *v12;
  void *v13;
  double v14;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  Class Class;
  objc_class *v51;
  id v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BMSource *locationCoordinatesStreamSource;
  void *v73;
  NSObject *v74;
  unint64_t v75;
  unint64_t v76;
  void *v77;
  id v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  id v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  BMSource *locationHashedCoordinatesStreamSource;
  void *v108;
  NSObject *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  uint64_t v117;
  void *v118;
  int v119;
  id v120;
  id v121;
  id v122;
  id v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;

  v6 = a3;
  v7 = a4;
  -[_DKMonitor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.7(v9, (uint64_t)self, v10);

  p_lastLocation = &self->_lastLocation;
  if (self->_lastLocation)
  {
    objc_msgSend(v9, "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLLocation timestamp](*p_lastLocation, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v13);
    if (fabs(v14) >= 1.0)
      goto LABEL_16;
    objc_msgSend(v9, "coordinate");
    v16 = v15;
    -[CLLocation coordinate](*p_lastLocation, "coordinate");
    if (v16 != v17)
      goto LABEL_16;
    objc_msgSend(v9, "coordinate");
    v19 = v18;
    -[CLLocation coordinate](*p_lastLocation, "coordinate");
    if (v19 != v20)
      goto LABEL_16;
    objc_msgSend(v9, "horizontalAccuracy");
    v22 = v21;
    -[CLLocation horizontalAccuracy](*p_lastLocation, "horizontalAccuracy");
    if (v22 != v23)
      goto LABEL_16;
    objc_msgSend(v9, "altitude");
    v25 = v24;
    -[CLLocation altitude](*p_lastLocation, "altitude");
    if (v25 != v26)
      goto LABEL_16;
    objc_msgSend(v9, "verticalAccuracy");
    v28 = v27;
    -[CLLocation verticalAccuracy](*p_lastLocation, "verticalAccuracy");
    if (v28 != v29)
      goto LABEL_16;
    objc_msgSend(v9, "speed");
    v31 = v30;
    -[CLLocation speed](*p_lastLocation, "speed");
    if (v31 == v32
      && (objc_msgSend(v9, "course"), v34 = v33, -[CLLocation course](*p_lastLocation, "course"), v34 == v35)
      && (v36 = objc_msgSend(v9, "type"), v36 == -[CLLocation type](*p_lastLocation, "type")))
    {
      objc_msgSend(v9, "floor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v37, "level");
      -[CLLocation floor](*p_lastLocation, "floor");
      v38 = v7;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "level");

      v7 = v38;
      if (v117 == v40)
      {
        +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.6(v9, v41);
        goto LABEL_54;
      }
    }
    else
    {
LABEL_16:

    }
  }
  objc_msgSend(v9, "timestamp");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLLocation timestamp](*p_lastLocation, "timestamp");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "timeIntervalSinceDate:", v43);
  v45 = v44;

  if (*p_lastLocation)
  {
    v46 = fabs(v45);
    if (v46 < 5.0)
    {
      +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.5(v47, v46, v48, v49);
LABEL_33:

      goto LABEL_34;
    }
  }
  objc_storeStrong((id *)&self->_lastLocation, v9);
  if (os_variant_has_internal_content() && self->_locationCoordinatesStreamSource)
  {
    v124 = 0;
    v125 = &v124;
    v126 = 0x2050000000;
    Class = (Class)getBMILocationCoordinatesClass_softClass;
    v127 = getBMILocationCoordinatesClass_softClass;
    if (!getBMILocationCoordinatesClass_softClass)
    {
      BiomeLibraryInternalLibraryCore();
      Class = objc_getClass("BMILocationCoordinates");
      v125[3] = (uint64_t)Class;
      getBMILocationCoordinatesClass_softClass = (uint64_t)Class;
    }
    v120 = v7;
    v122 = v6;
    v51 = objc_retainAutorelease(Class);
    _Block_object_dispose(&v124, 8);
    v52 = [v51 alloc];
    v53 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "coordinate");
    objc_msgSend(v53, "numberWithDouble:");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "coordinate");
    objc_msgSend(v54, "numberWithDouble:", v55);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "altitude");
    objc_msgSend(v56, "numberWithDouble:");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "speed");
    objc_msgSend(v57, "numberWithDouble:");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "course");
    objc_msgSend(v58, "numberWithDouble:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v52;
    if (v60)
    {
      v61 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v9, "floor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "numberWithInteger:", objc_msgSend(v111, "level"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = 0;
    }
    v63 = -[_DKLocationCoordinatesMonitor locationTypeFrom:](self, "locationTypeFrom:", objc_msgSend(v9, "type"));
    v64 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "horizontalAccuracy");
    objc_msgSend(v64, "numberWithDouble:");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "verticalAccuracy");
    objc_msgSend(v66, "numberWithDouble:");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "speedAccuracy");
    objc_msgSend(v68, "numberWithDouble:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "courseAccuracy");
    objc_msgSend(v70, "numberWithDouble:");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v110) = v63;
    v47 = objc_msgSend(v112, "initWithLatitude:longitude:altitude:speed:course:floor:locationType:horizontalAccuracy:verticalAccuracy:speedAccuracy:courseAccuracy:", v118, v115, v114, v113, v59, v62, v110, v65, v67, v69, v71);

    if (v60)
    {

    }
    locationCoordinatesStreamSource = self->_locationCoordinatesStreamSource;
    objc_msgSend(v9, "timestamp");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "timeIntervalSinceReferenceDate");
    -[BMSource sendEvent:timestamp:](locationCoordinatesStreamSource, "sendEvent:timestamp:", v47);

    +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.4();

    v7 = v120;
    v6 = v122;
    goto LABEL_33;
  }
LABEL_34:
  v75 = objc_msgSend(v9, "cd_privacyPreservingLocationHashWithLevel:", 16);
  v76 = v75;
  if (v75 == self->_lastLocationGeoHash300m)
  {
    +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.1();
  }
  else
  {
    self->_lastLocationGeoHash300m = v75;
    -[_DKLocationCoordinatesMonitor home](self, "home");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      v78 = objc_alloc(MEMORY[0x24BDBFA80]);
      -[_DKLocationCoordinatesMonitor home](self, "home");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "latitude");
      v81 = v80;
      -[_DKLocationCoordinatesMonitor home](self, "home");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "longitude");
      v84 = (void *)objc_msgSend(v78, "initWithLatitude:longitude:", v81, v83);
      objc_msgSend(v9, "distanceFromLocation:", v84);
      v86 = v85;

      v119 = -[_DKLocationCoordinatesMonitor distanceRangeFrom:](self, "distanceRangeFrom:", v86);
    }
    else
    {
      v119 = 0;
    }
    -[_DKLocationCoordinatesMonitor work](self, "work");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v121 = v7;
    v123 = v6;
    if (v87)
    {
      v88 = objc_alloc(MEMORY[0x24BDBFA80]);
      -[_DKLocationCoordinatesMonitor work](self, "work");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "latitude");
      v91 = v90;
      -[_DKLocationCoordinatesMonitor work](self, "work");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "longitude");
      v94 = (void *)objc_msgSend(v88, "initWithLatitude:longitude:", v91, v93);
      objc_msgSend(v9, "distanceFromLocation:", v94);
      v96 = v95;

      v116 = -[_DKLocationCoordinatesMonitor distanceRangeFrom:](self, "distanceRangeFrom:", v96);
    }
    else
    {
      v116 = 0;
    }
    v97 = (void *)objc_msgSend(v9, "cd_privacyPreservingLocationHashWithLevel:", 7);
    v98 = objc_msgSend(v9, "cd_privacyPreservingLocationHashWithLevel:", 13);
    v99 = objc_alloc(MEMORY[0x24BE0C468]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v76);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v98);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v97);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
    {
      v104 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v9, "floor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "numberWithInteger:", objc_msgSend(v97, "level"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v105 = 0;
    }
    objc_msgSend(v9, "speed");
    v106 = -[_DKLocationCoordinatesMonitor speedRangeFrom:](self, "speedRangeFrom:");
    objc_msgSend(v9, "altitude");
    v41 = objc_msgSend(v99, "initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:distanceFromHomeOfCurrentLocationInMeters:distanceFromWorkOfCurrentLocationInMeters:distanceFromSchoolOfCurrentLocationInMeters:distanceFromGymOfCurrentLocationInMeters:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:", v100, v101, v102, 0, 0, 0, 0, v105, __PAIR64__(-[_DKLocationCoordinatesMonitor altitudeRangeFrom:](self, "altitudeRangeFrom:"), v106), __PAIR64__(v116, v119), 0);
    if (v103)
    {

    }
    locationHashedCoordinatesStreamSource = self->_locationHashedCoordinatesStreamSource;
    v6 = v123;
    if (locationHashedCoordinatesStreamSource)
    {
      objc_msgSend(v9, "timestamp");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "timeIntervalSinceReferenceDate");
      -[BMSource sendEvent:timestamp:](locationHashedCoordinatesStreamSource, "sendEvent:timestamp:", v41);

      +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
      v109 = objc_claimAutoreleasedReturnValue();
      v7 = v121;
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.3();
    }
    else
    {
      +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
      v109 = objc_claimAutoreleasedReturnValue();
      v7 = v121;
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.2();
    }

  }
LABEL_54:

}

+ (id)log
{
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, &__block_literal_global_6);
  return (id)log_log_1;
}

- (int)locationTypeFrom:(int)a3
{
  NSObject *v4;

  if (a3 < 0xE && ((0x3FDFu >> a3) & 1) != 0)
    return dword_2190849C8[a3];
  +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_DKLocationCoordinatesMonitor locationTypeFrom:].cold.1(a3, v4);

  return 0;
}

+ (id)eventStream
{
  return CFSTR("LocationCoordinates");
}

+ (id)entitlements
{
  return &unk_24DA70E38;
}

- (_DKLocationCoordinatesMonitor)init
{
  _DKLocationCoordinatesMonitor *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  _DKLocationCoordinatesMonitor *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  BMStream *locationCoordinatesStream;
  uint64_t v11;
  BMSource *locationCoordinatesStreamSource;
  void *v13;
  void *v14;
  uint64_t v15;
  BMStream *locationHashedCoordinatesStream;
  uint64_t v17;
  BMSource *locationHashedCoordinatesStreamSource;
  NSObject *v19;
  dispatch_source_t v20;
  OS_dispatch_source *fetchLoiTimer;
  NSObject *v22;
  _QWORD handler[4];
  _DKLocationCoordinatesMonitor *v25;
  id v26;
  _QWORD block[4];
  _DKLocationCoordinatesMonitor *v28;
  uint8_t buf[16];
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)_DKLocationCoordinatesMonitor;
  v2 = -[_DKMonitor init](&v30, sel_init);
  if (v2)
  {
    +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_INFO, "Enabling location coordinates monitor", buf, 2u);
    }

    -[_DKMonitor queue](v2, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37___DKLocationCoordinatesMonitor_init__block_invoke;
    block[3] = &unk_24DA66D10;
    v6 = v2;
    v28 = v6;
    dispatch_sync(v4, block);

    if (os_variant_has_internal_content())
    {
      if (BiomeLibraryInternalLibraryCore())
      {
        BiomeLibraryInternalNodeBridge();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        objc_msgSend(v7, "streamWithIdentifier:error:", CFSTR("Location.Coordinates"), &v26);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = v26;
        locationCoordinatesStream = v6->_locationCoordinatesStream;
        v6->_locationCoordinatesStream = (BMStream *)v8;

        -[BMStream source](v6->_locationCoordinatesStream, "source");
        v11 = objc_claimAutoreleasedReturnValue();
        locationCoordinatesStreamSource = v6->_locationCoordinatesStreamSource;
        v6->_locationCoordinatesStreamSource = (BMSource *)v11;

      }
      else
      {
        +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[_DKLocationCoordinatesMonitor init].cold.1();
      }

    }
    BiomeLibrary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "Location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "HashedCoordinates");
    v15 = objc_claimAutoreleasedReturnValue();
    locationHashedCoordinatesStream = v6->_locationHashedCoordinatesStream;
    v6->_locationHashedCoordinatesStream = (BMStream *)v15;

    -[BMStream source](v6->_locationHashedCoordinatesStream, "source");
    v17 = objc_claimAutoreleasedReturnValue();
    locationHashedCoordinatesStreamSource = v6->_locationHashedCoordinatesStreamSource;
    v6->_locationHashedCoordinatesStreamSource = (BMSource *)v17;

    -[_DKMonitor queue](v6, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v19);
    fetchLoiTimer = v6->_fetchLoiTimer;
    v6->_fetchLoiTimer = (OS_dispatch_source *)v20;

    dispatch_source_set_timer((dispatch_source_t)v6->_fetchLoiTimer, 0, 0x4E94914F0000uLL, 0x7DBA8218000uLL);
    v22 = v6->_fetchLoiTimer;
    handler[0] = v5;
    handler[1] = 3221225472;
    handler[2] = __37___DKLocationCoordinatesMonitor_init__block_invoke_15;
    handler[3] = &unk_24DA66D10;
    v25 = v6;
    dispatch_source_set_event_handler(v22, handler);

  }
  return v2;
}

- (void)_fetchAndCacheLOIs
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_msgSend(MEMORY[0x24BE27ED0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke;
  v7[3] = &unk_24DA66D38;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "fetchLocationsOfInterestOfType:withHandler:", 0, v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_18;
  v5[3] = &unk_24DA66D38;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "fetchLocationsOfInterestOfType:withHandler:", 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKLocationCoordinatesMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v5, sel_instantMonitorNeedsActivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38___DKLocationCoordinatesMonitor_start__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

    dispatch_resume((dispatch_object_t)self->_fetchLoiTimer);
  }
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKLocationCoordinatesMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v5, sel_instantMonitorNeedsDeactivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37___DKLocationCoordinatesMonitor_stop__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

- (void)dealloc
{
  NSObject *fetchLoiTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  -[_DKLocationCoordinatesMonitor deactivate](self, "deactivate");
  fetchLoiTimer = self->_fetchLoiTimer;
  if (fetchLoiTimer)
  {
    dispatch_source_cancel(fetchLoiTimer);
    v4 = self->_fetchLoiTimer;
    self->_fetchLoiTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)_DKLocationCoordinatesMonitor;
  -[_DKMonitor dealloc](&v5, sel_dealloc);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_DKLocationCoordinatesMonitor locationManager:didFailWithError:].cold.1();

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[_DKLocationCoordinatesMonitor log](_DKLocationCoordinatesMonitor, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "authorizationStatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_INFO, "Authorization status changed %@", (uint8_t *)&v6, 0xCu);

  }
}

- (int)speedRangeFrom:(double)a3
{
  int v4;

  if (a3 < 0.0)
    return 0;
  if (a3 <= 2.0)
    return 1;
  if (a3 <= 4.0)
    return 2;
  if (a3 <= 6.0)
    return 3;
  if (a3 <= 8.0)
    return 4;
  if (a3 <= 10.0)
    return 5;
  if (a3 <= 12.0)
    return 6;
  if (a3 <= 16.0)
    return 7;
  if (a3 <= 20.0)
    return 8;
  if (a3 <= 24.0)
    v4 = 0;
  else
    v4 = 10;
  if (a3 > 24.0)
    return v4;
  else
    return 9;
}

- (int)altitudeRangeFrom:(double)a3
{
  if (a3 < 0.0)
    return 0;
  if (a3 <= 100.0)
    return 1;
  if (a3 <= 200.0)
    return 2;
  if (a3 <= 500.0)
    return 3;
  if (a3 <= 1000.0)
    return 4;
  if (a3 <= 2000.0)
    return 5;
  if (a3 <= 3000.0)
    return 6;
  if (a3 <= 4000.0)
    return 7;
  if (a3 <= 5000.0)
    return 8;
  return 9;
}

- (int)distanceRangeFrom:(double)a3
{
  if (a3 < 0.0)
    return 0;
  if (a3 <= 50.0)
    return 1;
  if (a3 <= 200.0)
    return 2;
  if (a3 <= 500.0)
    return 3;
  if (a3 <= 1000.0)
    return 4;
  if (a3 <= 2000.0)
    return 5;
  if (a3 <= 3000.0)
    return 6;
  if (a3 <= 4000.0)
    return 7;
  if (a3 <= 5000.0)
    return 8;
  return 9;
}

- (RTLocation)home
{
  return (RTLocation *)objc_getProperty(self, a2, 208, 1);
}

- (void)setHome:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (RTLocation)work
{
  return (RTLocation *)objc_getProperty(self, a2, 216, 1);
}

- (void)setWork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_work, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_locationHashedCoordinatesStreamSource, 0);
  objc_storeStrong((id *)&self->_locationHashedCoordinatesStream, 0);
  objc_storeStrong((id *)&self->_locationCoordinatesStreamSource, 0);
  objc_storeStrong((id *)&self->_locationCoordinatesStream, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_fetchLoiTimer, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_219056000, v0, v1, "BiomeLibraryInternal is not available on an internal build", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)locationManager:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_219056000, v0, v1, "location manager encountered error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)locationManager:didUpdateLocations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_219056000, v0, v1, "Skipping hashed location since the hash value is the same : %llu", v2);
  OUTLINED_FUNCTION_1();
}

- (void)locationManager:didUpdateLocations:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_219056000, v0, v1, "Location.HashedCoordinates stream is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)locationManager:didUpdateLocations:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_219056000, v0, v1, "Wrote location to external biome stream,GeoHashAt300m: %llu", v2);
  OUTLINED_FUNCTION_1();
}

- (void)locationManager:didUpdateLocations:.cold.4()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_219056000, v0, OS_LOG_TYPE_DEBUG, "Wrote location to internal biome stream", v1, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)locationManager:(uint64_t)a3 didUpdateLocations:(uint64_t)a4 .cold.5(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_0_2(&dword_219056000, a1, a4, "Skipping internal location since the time interval is less than minimum time : %f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)locationManager:(void *)a1 didUpdateLocations:(NSObject *)a2 .cold.6(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_219056000, a2, v4, "Dropping duplicate location with timestamp: %@", v5);

}

- (void)locationManager:(NSObject *)a3 didUpdateLocations:.cold.7(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a2 + 160), "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v9 = 134217984;
  v10 = fabs(v7);
  OUTLINED_FUNCTION_0_2(&dword_219056000, a3, v8, "Location manager received location. Time since last location: %f", (uint8_t *)&v9);

}

- (void)locationTypeFrom:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_219056000, a2, OS_LOG_TYPE_ERROR, "Unhandled Location Type, %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_1();
}

@end
