@implementation ATXInformationHeuristicRefreshLocationTrigger

- (ATXInformationHeuristicRefreshLocationTrigger)initWithEnteringLocation:(CLLocationCoordinate2D)a3 radiusInMeters:(double)a4
{
  return -[ATXInformationHeuristicRefreshLocationTrigger initWithLocation:notifyOnEntry:notifyOnExit:radiusInMeters:](self, "initWithLocation:notifyOnEntry:notifyOnExit:radiusInMeters:", 1, 0, a3.latitude, a3.longitude, a4);
}

- (ATXInformationHeuristicRefreshLocationTrigger)initWithExitingLocation:(CLLocationCoordinate2D)a3 radiusInMeters:(double)a4
{
  return -[ATXInformationHeuristicRefreshLocationTrigger initWithLocation:notifyOnEntry:notifyOnExit:radiusInMeters:](self, "initWithLocation:notifyOnEntry:notifyOnExit:radiusInMeters:", 0, 1, a3.latitude, a3.longitude, a4);
}

- (ATXInformationHeuristicRefreshLocationTrigger)initWithLocation:(CLLocationCoordinate2D)a3 notifyOnEntry:(BOOL)a4 notifyOnExit:(BOOL)a5 radiusInMeters:(double)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  double longitude;
  double latitude;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ATXInformationHeuristicRefreshLocationTrigger *v17;

  v7 = a5;
  v8 = a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v12 = objc_alloc(MEMORY[0x1E0C9E368]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithCenter:radius:identifier:", v14, latitude, longitude, a6);

  objc_msgSend(v15, "setNotifyOnEntry:", v8);
  objc_msgSend(v15, "setNotifyOnExit:", v7);
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ATXInformationHeuristicRefreshLocationTrigger initWithLocationManager:regionToMonitor:](self, "initWithLocationManager:regionToMonitor:", v16, v15);

  return v17;
}

- (ATXInformationHeuristicRefreshLocationTrigger)initWithLocationManager:(id)a3 regionToMonitor:(id)a4
{
  id v7;
  id v8;
  ATXInformationHeuristicRefreshLocationTrigger *v9;
  ATXInformationHeuristicRefreshLocationTrigger *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXInformationHeuristicRefreshLocationTrigger;
  v9 = -[ATXInformationHeuristicRefreshTrigger init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationManager, a3);
    objc_storeStrong((id *)&v10->_regionToMonitor, a4);
  }

  return v10;
}

- (void)updateWithInjectedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void)_run
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CLCircularRegion *regionToMonitor;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ATXLocationManagerProtocol getCurrentLocation](self->_locationManager, "getCurrentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_gi();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(v3, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1C99DF000, v4, OS_LOG_TYPE_DEFAULT, "[Location] Received %@", (uint8_t *)&v14, 0xCu);

    }
    v7 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend((id)v7, "_locationIsStaleOrNotAccurateEnough:now:", v3, v8);

    if ((v7 & 1) == 0)
    {
      regionToMonitor = self->_regionToMonitor;
      objc_msgSend(v3, "coordinate");
      v10 = -[CLCircularRegion containsCoordinate:](regionToMonitor, "containsCoordinate:");
      if (-[CLCircularRegion notifyOnEntry](self->_regionToMonitor, "notifyOnEntry")
        && self->_previouslyOutsideRegion
        && v10)
      {
        __atxlog_handle_gi();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshLocationTrigger: Entering monitored region. Triggering heuristics refresh.", (uint8_t *)&v14, 2u);
        }
      }
      else
      {
        if (!-[CLCircularRegion notifyOnExit](self->_regionToMonitor, "notifyOnExit")
          || !self->_previouslyInsideRegion
          || v10)
        {
          goto LABEL_20;
        }
        __atxlog_handle_gi();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshLocationTrigger: Leaving monitored region. Triggering heuristics refresh.", (uint8_t *)&v14, 2u);
        }
      }

      -[ATXInformationHeuristicRefreshTrigger delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXInformationHeuristicRefreshTrigger registeredHeuristics](self, "registeredHeuristics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "informationHeuristicRefreshTrigger:didTriggerRefreshForHeuristics:", self, v13);

LABEL_20:
      self->_previouslyInsideRegion = v10;
      self->_previouslyOutsideRegion = !v10;
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1C99DF000, v4, OS_LOG_TYPE_DEFAULT, "[Location] Nil location received. Ignoring trigger.", (uint8_t *)&v14, 2u);
    }

  }
}

- (void)_start
{
  void *v3;
  void *v4;
  id token;
  _QWORD v6[4];
  id v7;
  id location;

  self->_previouslyInsideRegion = 0;
  self->_previouslyOutsideRegion = 0;
  if (!self->_token)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0DC5EB8];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__ATXInformationHeuristicRefreshLocationTrigger__start__block_invoke;
    v6[3] = &unk_1E82C49F0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "registerForSuggestedActionNudgeOfType:withOptions:block:", 5, 0, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    token = self->_token;
    self->_token = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __55__ATXInformationHeuristicRefreshLocationTrigger__start__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_run");
  }
  else
  {
    __atxlog_handle_gi();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__ATXInformationHeuristicRefreshLocationTrigger__start__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

+ (BOOL)_locationIsStaleOrNotAccurateEnough:(id)a3 now:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  const char *v11;
  double v12;
  double v13;
  BOOL v14;
  int v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 <= 900.0)
  {
    objc_msgSend(v5, "horizontalAccuracy");
    if (v12 <= 200.0)
    {
      v14 = 0;
      goto LABEL_10;
    }
    __atxlog_handle_gi();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "horizontalAccuracy");
      v16 = 134217984;
      v17 = v13;
      v11 = "[Location] Uncertainty too large, horizontalAccuracy, %f. Ignoring trigger.";
      goto LABEL_7;
    }
  }
  else
  {
    __atxlog_handle_gi();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v9;
      v11 = "[Location] Location is stale. Age: %f. Ignoring trigger.";
LABEL_7:
      _os_log_impl(&dword_1C99DF000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    }
  }

  v14 = 1;
LABEL_10:

  return v14;
}

- (void)_stop
{
  if (self->_token)
    objc_msgSend(MEMORY[0x1E0DC5EB8], "unregisterForSuggestedActionNudgeOfType:");
}

- (unint64_t)hash
{
  return (unint64_t)self->_regionToMonitor;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshLocationTrigger;
  v4 = a3;
  -[ATXInformationHeuristicRefreshTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_regionToMonitor, CFSTR("regionToMonitor"), v5.receiver, v5.super_class);

}

- (ATXInformationHeuristicRefreshLocationTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXInformationHeuristicRefreshLocationTrigger *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regionToMonitor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (!v6 && v5)
  {
    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ATXInformationHeuristicRefreshLocationTrigger initWithLocationManager:regionToMonitor:](self, "initWithLocationManager:regionToMonitor:", v8, v5);

    v7 = self;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_regionToMonitor, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __55__ATXInformationHeuristicRefreshLocationTrigger__start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, a1, a3, "ATXInformationHeuristicRefreshLocationTrigger: couldn't perform refresh operation because swelf is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

@end
