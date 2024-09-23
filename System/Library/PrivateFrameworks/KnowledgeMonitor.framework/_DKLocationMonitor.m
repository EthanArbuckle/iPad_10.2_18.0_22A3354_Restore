@implementation _DKLocationMonitor

+ (id)eventStream
{
  return CFSTR("LocationVisit");
}

+ (id)entitlements
{
  return &unk_24DA70EB0;
}

- (_DKLocationMonitor)init
{
  _DKLocationMonitor *v2;
  NSObject *v3;
  uint64_t v4;
  RTRoutineManager *routineManager;
  NSObject *v6;
  _QWORD block[4];
  _DKLocationMonitor *v9;
  uint8_t buf[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_DKLocationMonitor;
  v2 = -[_DKMonitor init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_INFO, "Enabling location monitor", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE27ED0], "defaultManager");
    v4 = objc_claimAutoreleasedReturnValue();
    routineManager = v2->_routineManager;
    v2->_routineManager = (RTRoutineManager *)v4;

    -[_DKMonitor queue](v2, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26___DKLocationMonitor_init__block_invoke;
    block[3] = &unk_24DA66D10;
    v9 = v2;
    dispatch_sync(v6, block);

  }
  return v2;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKLocationMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v5, sel_instantMonitorNeedsActivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27___DKLocationMonitor_start__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKLocationMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v5, sel_instantMonitorNeedsDeactivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26___DKLocationMonitor_stop__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

- (id)_locationFromVisit:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x24BDBFA80];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "coordinate");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "horizontalAccuracy");
  v11 = v10;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v12, v7, v9, 0.0, v11, 0.0, 0.0, 0.0);

  return v13;
}

- (void)_handleVisit:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  _DKLocationMonitor *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  const __CFString *v45;
  id v46;
  const __CFString *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_new();
  objc_msgSend(v4, "departureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v5;
  if (v8 <= 0.0)
  {
    v47 = CFSTR("CLVisit");
    v48[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("DKLocationMonitorDidExitLOI"), 0, v12);

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNearbyLOIIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1A8], v14);

    v15 = objc_alloc(MEMORY[0x24BE0CD08]);
    objc_msgSend(v4, "_placeInference");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v41, "userType");
    if (v39)
    {
      objc_msgSend(v4, "_placeInference");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[_DKLocationMonitor userSpecificPlaceTypeFromType:](self, "userSpecificPlaceTypeFromType:", objc_msgSend(v36, "userType"));
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v4, "_placeInference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "placeType");
    if (v22)
    {
      objc_msgSend(v4, "_placeInference");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_DKLocationMonitor placeTypeFromType:](self, "placeTypeFromType:", objc_msgSend(v13, "placeType"));
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v4, "_placeInference");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_loiIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "UUIDString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v15, "initWithUserSpecificPlaceType:placeType:loiIdentifier:starting:", v16, v23, v34, 0);

    if (v22)
    v28 = v42;
    if (v39)

    objc_msgSend(v42, "source");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sendEvent:", v27);
  }
  else
  {
    v45 = CFSTR("CLVisit");
    v46 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("DKLocationMonitorDidEnterLOI"), 0, v10);

    v37 = objc_alloc(MEMORY[0x24BE0CD08]);
    objc_msgSend(v4, "_placeInference");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v40, "userType");
    if (v38)
    {
      objc_msgSend(v4, "_placeInference");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_DKLocationMonitor userSpecificPlaceTypeFromType:](self, "userSpecificPlaceTypeFromType:", objc_msgSend(v35, "userType"));
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v4, "_placeInference");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "placeType");
    if (v18)
    {
      objc_msgSend(v4, "_placeInference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self;
      v20 = -[_DKLocationMonitor placeTypeFromType:](self, "placeTypeFromType:", objc_msgSend(v10, "placeType"));
    }
    else
    {
      v19 = self;
      v20 = 0;
    }
    objc_msgSend(v4, "_placeInference");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_loiIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v37, "initWithUserSpecificPlaceType:placeType:loiIdentifier:starting:", v11, v20, v26, 1);

    if (v18)
    v28 = v42;
    if (v38)

    objc_msgSend(v42, "source");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sendEvent:", v27);

    -[_DKLocationMonitor _locationFromVisit:](v19, "_locationFromVisit:", v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v30;
      _os_log_impl(&dword_219056000, v31, OS_LOG_TYPE_INFO, "_DKLocationMonitor visit location %@", buf, 0xCu);
    }

    if (v30)
      -[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:](v19->_routineManager, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", v30, &__block_literal_global_11, 200.0);
  }

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
  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "authorizationStatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_INFO, "_DKLocationMonitor Authorization status changed %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219056000, v6, OS_LOG_TYPE_INFO, "_DKLocationMonitor visit occured", v7, 2u);
  }

  if (v5)
    -[_DKLocationMonitor _handleVisit:](self, "_handleVisit:", v5);

}

- (unint64_t)userSpecificPlaceTypeFromType:(unint64_t)a3
{
  unint64_t result;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = a3;
  if (a3 >= 5)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[_DKLocationMonitor userSpecificPlaceTypeFromType:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    return 0;
  }
  return result;
}

- (unint64_t)placeTypeFromType:(unint64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 < 3)
    return a3 + 1;
  objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[_DKLocationMonitor placeTypeFromType:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  return 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)userSpecificPlaceTypeFromType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_219056000, a1, a3, "_CLPlaceInferenceUserSpecificPlaceType does not match expected cases. Please verify.", a5, a6, a7, a8, 0);
}

- (void)placeTypeFromType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_219056000, a1, a3, "_CLPlaceInferencePlaceType does not match expected cases. Please verify.", a5, a6, a7, a8, 0);
}

@end
