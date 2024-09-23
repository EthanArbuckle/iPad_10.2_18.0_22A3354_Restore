@implementation NTKVisitManager

+ (id)sharedVisitManager
{
  if (sharedVisitManager_onceToken != -1)
    dispatch_once(&sharedVisitManager_onceToken, &__block_literal_global_83);
  return (id)sharedVisitManager_visitManager;
}

void __37__NTKVisitManager_sharedVisitManager__block_invoke()
{
  NTKSimulatedVisitManager *v0;
  void *v1;

  v0 = objc_alloc_init(NTKSimulatedVisitManager);
  v1 = (void *)sharedVisitManager_visitManager;
  sharedVisitManager_visitManager = (uint64_t)v0;

}

+ (id)fallbackVisit
{
  id v2;
  CLLocationCoordinate2D v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x1E0C9E448]);
  v3 = CLLocationCoordinate2DMake(37.3353672, -122.011737);
  v4 = *MEMORY[0x1E0C9E490];
  +[CLKDate unmodifiedDate](NTKDate, "unmodifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKDate unmodifiedDate](NTKDate, "unmodifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKDate unmodifiedDate](NTKDate, "unmodifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:", v5, v6, v7, v3.latitude, v3.longitude, v4);

  return v8;
}

- (id)anyVisit
{
  return (id)objc_msgSend((id)objc_opt_class(), "fallbackVisit");
}

- (id)startVisitUpdatesWithIdentifier:(id)a3 handler:(id)a4
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return &stru_1E6BDC918;
}

- (void)stopVisitUpdatesForToken:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  NSRequestConcreteImplementation();
}

- (id)currentVisit
{
  void *v2;
  const char *v3;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  v2 = (void *)objc_opt_class();
  return (id)OUTLINED_FUNCTION_2_6(v2, v3);
}

- (id)previousVisit
{
  void *v2;
  const char *v3;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  v2 = (void *)objc_opt_class();
  return (id)OUTLINED_FUNCTION_2_6(v2, v3);
}

@end
