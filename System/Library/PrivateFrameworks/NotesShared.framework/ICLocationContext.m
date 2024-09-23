@implementation ICLocationContext

+ (id)sharedContext
{
  if (sharedContext_once != -1)
    dispatch_once(&sharedContext_once, &__block_literal_global_70);
  return (id)sharedContext_defaultContext;
}

void __34__ICLocationContext_sharedContext__block_invoke()
{
  ICLocationContext *v0;
  void *v1;

  v0 = objc_alloc_init(ICLocationContext);
  v1 = (void *)sharedContext_defaultContext;
  sharedContext_defaultContext = (uint64_t)v0;

}

- (BOOL)canGetLocation
{
  int v3;
  void *v4;
  int v5;

  v3 = objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled");
  if (v3)
  {
    -[ICLocationContext locationManager](self, "locationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "authorizationStatus");

    -[ICLocationContext requestAuthorizationIfNeeded](self, "requestAuthorizationIfNeeded");
    LOBYTE(v3) = v5 > 2;
  }
  return v3;
}

- (void)lookupPlaceAtLatitude:(double)a3 longitude:(double)a4 handler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", a3, a4);
  -[ICLocationContext geocoder](self, "geocoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C9E390]);
    -[ICLocationContext setGeocoder:](self, "setGeocoder:", v11);

  }
  -[ICLocationContext geocoder](self, "geocoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__ICLocationContext_lookupPlaceAtLatitude_longitude_handler___block_invoke;
  v14[3] = &unk_1E76D0088;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "reverseGeocodeLocation:completionHandler:", v9, v14);

}

void __61__ICLocationContext_lookupPlaceAtLatitude_longitude_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__ICLocationContext_lookupPlaceAtLatitude_longitude_handler___block_invoke_cold_1((uint64_t)v6, v7);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v3;

  -[ICLocationContext setRequestedAuthorization:](self, "setRequestedAuthorization:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICLocationContextAuthorizationStatusDidChange"), 0);

}

- (CLLocationManager)locationManager
{
  CLLocationManager *locationManager;
  CLLocationManager *v4;
  CLLocationManager *v5;

  locationManager = self->_locationManager;
  if (!locationManager)
  {
    v4 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E0C9E3C8]);
    v5 = self->_locationManager;
    self->_locationManager = v4;

    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
    locationManager = self->_locationManager;
  }
  return locationManager;
}

- (void)requestAuthorizationIfNeeded
{
  void *v3;
  int v4;
  void *v5;

  if (!-[ICLocationContext requestedAuthorization](self, "requestedAuthorization"))
  {
    -[ICLocationContext locationManager](self, "locationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "authorizationStatus");

    if (!v4)
    {
      -[ICLocationContext locationManager](self, "locationManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestWhenInUseAuthorization");

      -[ICLocationContext setRequestedAuthorization:](self, "setRequestedAuthorization:", 1);
    }
  }
}

- (CLGeocoder)geocoder
{
  return self->_geocoder;
}

- (void)setGeocoder:(id)a3
{
  objc_storeStrong((id *)&self->_geocoder, a3);
}

- (BOOL)requestedAuthorization
{
  return self->_requestedAuthorization;
}

- (void)setRequestedAuthorization:(BOOL)a3
{
  self->_requestedAuthorization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __61__ICLocationContext_lookupPlaceAtLatitude_longitude_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Error performing reverse geolocation %@", (uint8_t *)&v2, 0xCu);
}

@end
