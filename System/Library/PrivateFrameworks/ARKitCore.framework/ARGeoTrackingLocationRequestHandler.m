@implementation ARGeoTrackingLocationRequestHandler

- (ARGeoTrackingLocationRequestHandler)init
{
  ARGeoTrackingLocationRequestHandler *v2;
  uint64_t v3;
  NSCondition *authorizationCondition;
  id locationCompletionHandler;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARGeoTrackingLocationRequestHandler;
  v2 = -[ARGeoTrackingLocationRequestHandler init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    authorizationCondition = v2->_authorizationCondition;
    v2->_authorizationCondition = (NSCondition *)v3;

    v2->_authorizationStatus = 0;
    locationCompletionHandler = v2->_locationCompletionHandler;
    v2->_locationCompletionHandler = 0;

  }
  return v2;
}

- (void)setLocationManager:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_locationManager, v4);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void (**locationCompletionHandler)(id, void *, _QWORD);
  id v13;
  int v14;
  void *v15;
  __int16 v16;
  ARGeoTrackingLocationRequestHandler *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _ARLogGeneral_21();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v10;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received location", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(v7, "stopUpdatingLocation");

  objc_msgSend(v6, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  locationCompletionHandler = (void (**)(id, void *, _QWORD))self->_locationCompletionHandler;
  if (locationCompletionHandler)
  {
    locationCompletionHandler[2](locationCompletionHandler, v11, 0);
    v13 = self->_locationCompletionHandler;
    self->_locationCompletionHandler = 0;

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void (**locationCompletionHandler)(id, _QWORD, id);
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  ARGeoTrackingLocationRequestHandler *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _ARLogGeneral_21();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Location request handler failed: %@", (uint8_t *)&v11, 0x20u);

  }
  if (objc_msgSend(v5, "code"))
  {
    locationCompletionHandler = (void (**)(id, _QWORD, id))self->_locationCompletionHandler;
    if (locationCompletionHandler)
    {
      locationCompletionHandler[2](locationCompletionHandler, 0, v5);
      v10 = self->_locationCompletionHandler;
      self->_locationCompletionHandler = 0;

    }
  }

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSCondition *authorizationCondition;
  id v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  ARGeoTrackingLocationRequestHandler *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  authorizationCondition = self->_authorizationCondition;
  v5 = a3;
  -[NSCondition lock](authorizationCondition, "lock");
  v6 = objc_msgSend(v5, "authorizationStatus");

  self->_authorizationStatus = v6;
  -[NSCondition broadcast](self->_authorizationCondition, "broadcast");
  -[NSCondition unlock](self->_authorizationCondition, "unlock");
  _ARLogGeneral_21();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2048;
    v13 = self;
    v14 = 1024;
    v15 = v6;
    _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: User has set location authorization status: %d", (uint8_t *)&v10, 0x1Cu);

  }
}

- (int)waitForAuthorizationStatus
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int authorizationStatus;
  int v8;
  void *v9;
  __int16 v10;
  ARGeoTrackingLocationRequestHandler *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral_21();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Waiting for location authorization from user", (uint8_t *)&v8, 0x16u);

  }
  -[NSCondition lock](self->_authorizationCondition, "lock");
  while (1)
  {
    authorizationStatus = self->_authorizationStatus;
    if (authorizationStatus)
      break;
    -[NSCondition wait](self->_authorizationCondition, "wait");
  }
  -[NSCondition unlock](self->_authorizationCondition, "unlock");
  return authorizationStatus;
}

- (void)requestLocationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  __int16 v11;
  ARGeoTrackingLocationRequestHandler *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogGeneral_21();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Waiting for location for availability check", (uint8_t *)&v9, 0x16u);

  }
  -[ARGeoTrackingLocationRequestHandler setLocationCompletionHandler:](self, "setLocationCompletionHandler:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_locationManager);
  objc_msgSend(WeakRetained, "startUpdatingLocation");

}

- (id)locationCompletionHandler
{
  return self->_locationCompletionHandler;
}

- (void)setLocationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_authorizationCondition, 0);
  objc_destroyWeak((id *)&self->_locationManager);
}

@end
