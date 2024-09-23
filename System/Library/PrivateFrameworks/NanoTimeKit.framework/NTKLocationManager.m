@implementation NTKLocationManager

+ (id)sharedLocationManager
{
  if (sharedLocationManager_onceToken != -1)
    dispatch_once(&sharedLocationManager_onceToken, &__block_literal_global_36);
  return (id)sharedLocationManager_locationManager;
}

void __43__NTKLocationManager_sharedLocationManager__block_invoke()
{
  NTKSimulatedLocationManager *v0;
  void *v1;

  v0 = objc_alloc_init(NTKSimulatedLocationManager);
  v1 = (void *)sharedLocationManager_locationManager;
  sharedLocationManager_locationManager = (uint64_t)v0;

}

+ (id)fallbackLocation
{
  CLLocationCoordinate2D v2;
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v2 = CLLocationCoordinate2DMake(37.3353672, -122.011737);
  v3 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  v4 = *MEMORY[0x1E0C9E490];
  v5 = *MEMORY[0x1E0C9E4D0];
  +[CLKDate unmodifiedDate](NTKDate, "unmodifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v6, v2.latitude, v2.longitude, 48.768, v4, v5);

  return v7;
}

- (id)anyLocation
{
  return (id)objc_msgSend((id)objc_opt_class(), "fallbackLocation");
}

- (id)startLocationUpdatesWithIdentifier:(id)a3 handler:(id)a4
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return &stru_1E6BDC918;
}

- (id)startLocationUpdatesWithIdentifier:(id)a3 wantsGroundElevation:(BOOL)a4 handler:(id)a5
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return &stru_1E6BDC918;
}

- (void)stopLocationUpdatesForToken:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  NSRequestConcreteImplementation();
}

- (id)currentLocation
{
  void *v2;
  const char *v3;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  v2 = (void *)objc_opt_class();
  return (id)OUTLINED_FUNCTION_2_3(v2, v3);
}

- (id)previousLocation
{
  void *v2;
  const char *v3;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  v2 = (void *)objc_opt_class();
  return (id)OUTLINED_FUNCTION_2_3(v2, v3);
}

@end
