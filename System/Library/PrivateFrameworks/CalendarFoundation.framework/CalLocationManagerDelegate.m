@implementation CalLocationManagerDelegate

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)didFinishLocationLookupWithLocation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  CalLocationManagerDelegate *v8;
  NSObject *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (-[CalLocationManagerDelegate didFinish](v8, "didFinish"))
  {
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CalLocationManagerDelegate didFinishLocationLookupWithLocation:error:].cold.1();

  }
  else
  {
    -[CalLocationManagerDelegate setDidFinish:](v8, "setDidFinish:", 1);
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:", v8);
    -[CalLocationManagerDelegate completionBlock](v8, "completionBlock");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v10)[2](v10, v6, v7);

    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CalLocationManagerDelegate didFinishLocationLookupWithLocation:error:].cold.2();

    -[CLLocationManager stopUpdatingLocation](v8->_manager, "stopUpdatingLocation");
    -[CLLocationManager setDelegate:](v8->_manager, "setDelegate:", 0);
  }
  objc_sync_exit(v8);

}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  objc_super v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:", self);
  -[CLLocationManager stopUpdatingLocation](self->_manager, "stopUpdatingLocation");
  -[CLLocationManager setDelegate:](self->_manager, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CalLocationManagerDelegate;
  -[CalLocationManagerDelegate dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBundleID, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
}

- (CalLocationManagerDelegate)initWithCurrentBundleID:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  CalLocationManagerDelegate *v9;
  CalLocationManagerDelegate *v10;
  uint64_t v11;
  id completionBlock;
  void *v13;
  uint64_t v14;
  CLLocationManager *manager;
  NSObject *v16;
  NSObject *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CalLocationManagerDelegate;
  v9 = -[CalLocationManagerDelegate init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentBundleID, a3);
    v11 = MEMORY[0x19400A168](v8);
    completionBlock = v10->_completionBlock;
    v10->_completionBlock = (id)v11;

    v13 = (void *)MEMORY[0x1E0C80D38];
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "initWithEffectiveBundleIdentifier:delegate:onQueue:", v10->_currentBundleID, v10, v13);
    manager = v10->_manager;
    v10->_manager = (CLLocationManager *)v14;

    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[CalLocationManagerDelegate initWithCurrentBundleID:completionBlock:].cold.2();

    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[CalLocationManagerDelegate initWithCurrentBundleID:completionBlock:].cold.1();

    -[CLLocationManager startUpdatingLocation](v10->_manager, "startUpdatingLocation");
    -[CalLocationManagerDelegate performSelector:withObject:afterDelay:](v10, "performSelector:withObject:afterDelay:", sel_timeout, 0, 30.0);
  }

  return v10;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CalLocationManagerDelegate locationManager:didUpdateLocations:].cold.1();

    objc_msgSend(v5, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalLocationManagerDelegate didFinishLocationLookupWithLocation:error:](self, "didFinishLocationLookupWithLocation:error:", v7, 0);

  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSObject *v4;
  void *v5;

  if (objc_msgSend(a3, "authorizationStatus") - 1 <= 1)
  {
    +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CalLocationManagerDelegate locationManagerDidChangeAuthorization:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CalLocationErrorDomain, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalLocationManagerDelegate didFinishLocationLookupWithLocation:error:](self, "didFinishLocationLookupWithLocation:error:", 0, v5);

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    goto LABEL_12;
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C9E488]))
  {
    v10 = objc_msgSend(v8, "code");

    if (v10 == 1 && !objc_msgSend(v6, "authorizationStatus"))
    {
      +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[CalLocationManagerDelegate locationManager:didFailWithError:].cold.1();

      goto LABEL_12;
    }
  }
  else
  {

  }
  +[CalFoundationLogSubsystem locations](CalFoundationLogSubsystem, "locations");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[CalLocationManagerDelegate locationManager:didFailWithError:].cold.2();

  -[CalLocationManagerDelegate didFinishLocationLookupWithLocation:error:](self, "didFinishLocationLookupWithLocation:error:", 0, v8);
LABEL_12:

}

- (void)timeout
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Our location lookup timed out.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Our location lookup was cancelled out.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (CLLocation)currentLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)initWithCurrentBundleID:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Start updating locations for [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCurrentBundleID:completionBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Initializing a location manager for [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)locationManager:didUpdateLocations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Our current location was updated by the location manager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)locationManagerDidChangeAuthorization:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Our location authorization status was updated by the location manager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
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

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "location manager says it failed because we have no location authorization, but authorization status is still undetermined. Ignoring this error and hoping the user authorizes us. [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)locationManager:didFailWithError:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_18FC12000, v0, OS_LOG_TYPE_ERROR, "Our location manager failed with the error [%@]", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)didFinishLocationLookupWithLocation:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_18FC12000, v0, v1, "Our location lookup was finished.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didFinishLocationLookupWithLocation:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "Stop updating locations for [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
