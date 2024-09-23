@implementation ARGeoTrackingConfiguration

+ (id)checkAvailabilityQueue
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)checkAvailabilityQueue;
  if (!checkAvailabilityQueue)
  {
    ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.geoTrackingConfiguration.checkAvailabilityQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)checkAvailabilityQueue;
    checkAvailabilityQueue = v4;

    v3 = (void *)checkAvailabilityQueue;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (id)locationManagerQueue
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)locationManagerQueue;
  if (!locationManagerQueue)
  {
    ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.geoTrackingConfiguration.locationManagerQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)locationManagerQueue;
    locationManagerQueue = v4;

    v3 = (void *)locationManagerQueue;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (BOOL)verifyLocationPermissions
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v2 = a1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  objc_msgSend(a1, "locationManagerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ARGeoTrackingConfiguration_verifyLocationPermissions__block_invoke;
  block[3] = &unk_1E6673900;
  v8 = &v10;
  v9 = &v16;
  v4 = v3;
  v7 = v4;
  dispatch_sync(v4, block);
  LOBYTE(v2) = objc_msgSend(v2, "_verifyLocationPermissionsWithLocationManager:handler:", v17[5], v11[5]);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return (char)v2;
}

uint64_t __55__ARGeoTrackingConfiguration_verifyLocationPermissions__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "_initWithDelegate:onQueue:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), a1[4]);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setLocationManager:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)setVisualLocalizationCallInterval:(double)a3
{
  self->_visualLocalizationCallInterval = a3;
  self->_posteriorVisualLocalizationCallInterval = a3;
}

+ (BOOL)_verifyLocationPermissionsWithLocationManager:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  objc_class *v13;
  objc_class *v14;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled") & 1) != 0)
  {
    v8 = objc_msgSend(v6, "authorizationStatus");
    if (!v8)
    {
      objc_msgSend(v6, "requestWhenInUseAuthorization");
      v8 = objc_msgSend(v7, "waitForAuthorizationStatus");
    }
    if ((v8 - 5) > 0xFFFFFFFD)
    {
      if (!objc_msgSend(v6, "accuracyAuthorization"))
      {
        v15 = 1;
        goto LABEL_14;
      }
      _ARLogGeneral_11();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v11;
        v19 = 2048;
        v20 = a1;
        v12 = "%{public}@ <%p>: Precise location must be authorized for app to use geo tracking.";
        goto LABEL_12;
      }
    }
    else
    {
      _ARLogGeneral_11();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v11;
        v19 = 2048;
        v20 = a1;
        v12 = "%{public}@ <%p>: Location services must be authorized for app to use geo tracking.";
LABEL_12:
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v17, 0x16u);

      }
    }
  }
  else
  {
    _ARLogGeneral_11();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v11;
      v19 = 2048;
      v20 = a1;
      v12 = "%{public}@ <%p>: Location services must be enabled on device to use geo tracking.";
      goto LABEL_12;
    }
  }

  v15 = 0;
LABEL_14:

  return v15;
}

+ (BOOL)isSupported
{
  return objc_msgSend(a1, "isSupportedWithOptions:", 0);
}

+ (BOOL)isSupportedWithOptions:(unint64_t)a3
{
  unsigned int v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ARGeoTrackingConfiguration;
  v4 = objc_msgSendSuper2(&v6, sel_isSupported);
  if (v4)
    LOBYTE(v4) = +[ARGeoTrackingTechnique isSupportedWithOptions:](ARGeoTrackingTechnique, "isSupportedWithOptions:", a3);
  return v4;
}

+ (void)checkAvailabilityWithCompletionHandler:(void *)completionHandler
{
  objc_msgSend(a1, "checkAvailabilityWithOptions:completionHandler:", 0, completionHandler);
}

+ (void)checkAvailabilityWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  id *v11;
  id v12;
  _QWORD *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  _QWORD v19[3];
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _ARLogGeneral_11();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v9;
    v24 = 2048;
    v25 = a1;
    _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Checking geo tracking availability at current device location", buf, 0x16u);

  }
  if ((objc_msgSend(a1, "isSupportedWithOptions:", a3) & 1) != 0)
  {
    +[ARGeoTrackingConfiguration checkAvailabilityQueue](ARGeoTrackingConfiguration, "checkAvailabilityQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_2;
    v18[3] = &unk_1E6673978;
    v11 = (id *)v19;
    v19[0] = v6;
    v19[1] = a1;
    v19[2] = a3;
    v12 = v6;
    v13 = v18;
  }
  else
  {
    _ARLogGeneral_11();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      v24 = 2048;
      v25 = a1;
      _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking is not supported on this device", buf, 0x16u);

    }
    +[ARGeoTrackingConfiguration checkAvailabilityQueue](ARGeoTrackingConfiguration, "checkAvailabilityQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke;
    block[3] = &unk_1E6673928;
    v11 = &v21;
    v21 = v6;
    v17 = v6;
    v13 = block;
  }
  dispatch_async(v10, v13);

}

void __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(100, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  _QWORD v12[4];
  NSObject *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD block[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  objc_msgSend(*(id *)(a1 + 40), "locationManagerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v2);
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_3;
  block[3] = &unk_1E6673900;
  v18 = &v20;
  v19 = &v26;
  v4 = v2;
  v17 = v4;
  dispatch_sync(v4, block);
  if ((objc_msgSend(*(id *)(a1 + 40), "_verifyLocationPermissionsWithLocationManager:handler:", v27[5], v21[5]) & 1) != 0)
  {
    v5 = dispatch_semaphore_create(0);
    v6 = (void *)v21[5];
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_4;
    v12[3] = &unk_1E6673950;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 48);
    v13 = v7;
    v15 = v8;
    v11 = *(_OWORD *)(a1 + 32);
    v9 = (id)v11;
    v14 = v11;
    objc_msgSend(v6, "requestLocationWithCompletionHandler:", v12);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    ARErrorWithCodeAndUserInfo(105, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, NSObject *))(v10 + 16))(v10, 0, v7);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

}

uint64_t __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "_initWithDelegate:onQueue:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), a1[4]);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setDesiredAccuracy:", *MEMORY[0x1E0C9E490]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setActivityType:", 4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setLocationManager:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v5)
  {
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v5, "coordinate");
    objc_msgSend(v7, "checkAvailabilityAtCoordinate:withOptions:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  else
  {
    _ARLogGeneral_11();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2048;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not get location fix for geo tracking availability check: %@", buf, 0x20u);

    }
    +[ARGeoTrackingConfiguration checkAvailabilityQueue](ARGeoTrackingConfiguration, "checkAvailabilityQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_9;
    block[3] = &unk_1E6673928;
    v14 = *(id *)(a1 + 40);
    dispatch_async(v12, block);

  }
}

void __77__ARGeoTrackingConfiguration_checkAvailabilityWithOptions_completionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(102, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

+ (void)checkAvailabilityAtCoordinate:(CLLocationCoordinate2D)coordinate completionHandler:(void *)completionHandler
{
  objc_msgSend(a1, "checkAvailabilityAtCoordinate:withOptions:completionHandler:", 0, completionHandler, coordinate.latitude, coordinate.longitude);
}

+ (void)checkAvailabilityAtCoordinate:(CLLocationCoordinate2D)a3 withOptions:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  __int128 v9;
  void *v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  _QWORD v20[4];
  id v21;
  id v22;
  CLLocationDegrees v23;
  CLLocationDegrees v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  _QWORD block[4];
  id v29;
  _BYTE buf[32];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  latitude = a3.latitude;
  longitude = a3.longitude;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if ((objc_msgSend(a1, "isSupportedWithOptions:", a4) & 1) != 0)
  {
    v8 = (id)objc_opt_new();
    *(CLLocationDegrees *)&v9 = latitude;
    *((CLLocationDegrees *)&v9 + 1) = longitude;
    v25 = v9;
    v26 = 0u;
    ARLLAToECEF(v27);
    v16 = v27[1];
    v17 = v27[0];
    +[ARGeoTrackingConfiguration checkAvailabilityQueue](ARGeoTrackingConfiguration, "checkAvailabilityQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __90__ARGeoTrackingConfiguration_checkAvailabilityAtCoordinate_withOptions_completionHandler___block_invoke_2;
    v20[3] = &unk_1E66739A0;
    v23 = latitude;
    v24 = longitude;
    v21 = v7;
    v22 = a1;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v16;
    v31 = 0;
    v32 = 0;
    v11 = v7;
    objc_msgSend(v8, "determineAvailabilityAtLocation:callbackQueue:callback:", buf, v10, v20);

  }
  else
  {
    _ARLogGeneral_11();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking is not supported on this device", buf, 0x16u);

    }
    +[ARGeoTrackingConfiguration checkAvailabilityQueue](ARGeoTrackingConfiguration, "checkAvailabilityQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__ARGeoTrackingConfiguration_checkAvailabilityAtCoordinate_withOptions_completionHandler___block_invoke;
    block[3] = &unk_1E6673928;
    v29 = v7;
    v8 = v7;
    dispatch_async(v15, block);

    v11 = v29;
  }

}

void __90__ARGeoTrackingConfiguration_checkAvailabilityAtCoordinate_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(100, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __90__ARGeoTrackingConfiguration_checkAvailabilityAtCoordinate_withOptions_completionHandler___block_invoke_2(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    _ARLogGeneral_11();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[5];
      *(_DWORD *)buf = 138543618;
      v30 = v8;
      v31 = 2048;
      v32 = v9;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Geo tracking availability check succeeded", buf, 0x16u);

    }
    v10 = 0;
  }
  else
  {
    _ARLogGeneral_11();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v5)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = a1[5];
        v16 = a1[6];
        v17 = a1[7];
        objc_msgSend(v5, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544387;
        v30 = v14;
        v31 = 2048;
        v32 = v15;
        v33 = 2049;
        v34 = v16;
        v35 = 2049;
        v36 = v17;
        v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Geo tracking availability error at %{private}f, %{private}f: %@", buf, 0x34u);

      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Failed to complete geo tracking availability check."), &stru_1E6676798, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = *MEMORY[0x1E0CB2D68];
      v28 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(501, v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = a1[5];
        v25 = a1[6];
        v26 = a1[7];
        *(_DWORD *)buf = 138544131;
        v30 = v23;
        v31 = 2048;
        v32 = v24;
        v33 = 2049;
        v34 = v25;
        v35 = 2049;
        v36 = v26;
        _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking is not available at coordinate: %{private}f, %{private}f", buf, 0x2Au);

      }
      ARErrorWithCodeAndUserInfo(201, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  (*(void (**)(void))(a1[4] + 16))();

}

- (ARGeoTrackingConfiguration)init
{
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  float v11;
  float v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ARGeoTrackingConfiguration;
  v2 = -[ARConfiguration initPrivate](&v17, sel_initPrivate);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setAutoFocusEnabled:", 1);
    objc_msgSend(v3, "setMaximumNumberOfTrackedImages:", 0);
    objc_msgSend(v3, "setWantsHDREnvironmentTextures:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.environmentTexturing.wantsHDR")));
    v4 = objc_opt_new();
    v5 = (void *)*((_QWORD *)v3 + 19);
    *((_QWORD *)v3 + 19) = v4;

    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v3 + 21);
    *((_QWORD *)v3 + 21) = v6;

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "minVergenceAngle");
    *((_QWORD *)v3 + 22) = v9;
    v10 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.planeEstimation.mlOnANEDevices"));
    if (v10)
      LOBYTE(v10) = ARAppleNeuralEngine();
    v3[123] = v10;
    v3[124] = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.planeEstimation.enableLowQosScheduling"));
    *(_WORD *)(v3 + 125) = 1;
    v3[127] = 0;
    v3[128] = 0;
    v3[122] = 0;
    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.geotracking.visualLocalizationCallInterval"));
    *((double *)v3 + 23) = v11;
    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.geotracking.posteriorVisualLocalizationCallInterval"));
    *((double *)v3 + 14) = v12;
    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.geotracking.bypassChecksForANE")))
    {
      v13 = 4;
    }
    else
    {
      v13 = 0;
    }
    v14 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.geotracking.bypassChecksForGPS"));
    v15 = v13 | 2;
    if (!v14)
      v15 = v13;
    *((_QWORD *)v3 + 24) = v15;
    v3[129] = 1;
    v3[130] = 1;

  }
  return (ARGeoTrackingConfiguration *)v3;
}

+ (id)supportedVideoFormats
{
  void *v2;

  if (objc_msgSend(a1, "isSupportedWithOptions:", 6))
  {
    +[ARWorldTrackingConfiguration supportedVideoFormats](ARWorldTrackingConfiguration, "supportedVideoFormats");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

+ (id)recommendedVideoFormatFor4KResolution
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatFor4KResolution](ARWorldTrackingConfiguration, "recommendedVideoFormatFor4KResolution");
}

+ (id)recommendedVideoFormatForHighResolutionFrameCapturing
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatForHighResolutionFrameCapturing](ARWorldTrackingConfiguration, "recommendedVideoFormatForHighResolutionFrameCapturing");
}

+ (id)supportedVideoFormatsForUltraWide
{
  return +[ARWorldTrackingConfiguration supportedVideoFormatsForUltraWide](ARWorldTrackingConfiguration, "supportedVideoFormatsForUltraWide");
}

+ (BOOL)supportsAppClipCodeTracking
{
  return (ARAppleNeuralEngine() & 1) != 0
      || +[ARAppClipCodeTechnique shouldRunCameraOrScannerPerformanceTestingMode](ARAppClipCodeTechnique, "shouldRunCameraOrScannerPerformanceTestingMode");
}

- (BOOL)appClipCodeTrackingEnabled
{
  if (self->_appClipCodeTrackingEnabled)
    return objc_msgSend((id)objc_opt_class(), "supportsAppClipCodeTracking");
  else
    return 0;
}

- (id)parentImageSensorSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARGeoTrackingConfiguration;
  -[ARConfiguration parentImageSensorSettings](&v9, sel_parentImageSensorSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[ARGeoTrackingConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  -[ARConfiguration depthSensorSettingsForJasper](self, "depthSensorSettingsForJasper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(v3, "setSettings:", v5);

  return v3;
}

- (id)imageSensorSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  objc_class *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARGeoTrackingConfiguration *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)ARGeoTrackingConfiguration;
  -[ARConfiguration imageSensorSettings](&v15, sel_imageSensorSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVisionDataOutputEnabled:", -[ARGeoTrackingConfiguration shouldEnableVisionDataForImageSensorSettings:](self, "shouldEnableVisionDataForImageSensorSettings:", v3));
  if (objc_msgSend(v3, "visionDataOutputEnabled"))
  {
    -[ARGeoTrackingConfiguration _trackingOptions](self, "_trackingOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageSensorSettings:", v3);
    -[ARGeoTrackingConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageSensorSettingsForUltraWide:", v5);

    ARVisionDataParametersForWorldTrackingOptions(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setVisionDataOutputParameters:", v6);
      _ARLogGeneral_11();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v9;
        v18 = 2048;
        v19 = self;
        v20 = 2112;
        v21 = v6;
        v10 = "%{public}@ <%p>: Setting vision data output parameters for wide: %@";
        v11 = v7;
        v12 = 32;
LABEL_7:
        _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);

      }
    }
    else
    {
      _ARLogGeneral_11();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v9;
        v18 = 2048;
        v19 = self;
        v10 = "%{public}@ <%p>: Did not receive vision data output parameters for wide.";
        v11 = v7;
        v12 = 22;
        goto LABEL_7;
      }
    }

  }
  return v3;
}

- (ARImageSensorSettings)imageSensorSettingsForUltraWide
{
  void *v3;
  void *v4;
  ARImageSensorSettings *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  objc_class *v17;
  int v18;
  void *v19;
  __int16 v20;
  ARGeoTrackingConfiguration *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[ARGeoTrackingConfiguration shouldUseUltraWide](self, "shouldUseUltraWide"))
    return (ARImageSensorSettings *)0;
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForUltraWide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[ARImageSensorSettings initWithVideoFormat:]([ARImageSensorSettings alloc], "initWithVideoFormat:", v4);
    LODWORD(v6) = 1126170624;
    -[ARImageSensorSettings setMaxGainOverride:](v5, "setMaxGainOverride:", v6);
    -[ARImageSensorSettings setVisionDataOutputEnabled:](v5, "setVisionDataOutputEnabled:", -[ARGeoTrackingConfiguration shouldEnableVisionDataForImageSensorSettings:](self, "shouldEnableVisionDataForImageSensorSettings:", v5));
    if (-[ARImageSensorSettings visionDataOutputEnabled](v5, "visionDataOutputEnabled"))
    {
      -[ARGeoTrackingConfiguration _trackingOptions](self, "_trackingOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARGeoTrackingConfiguration imageSensorSettings](self, "imageSensorSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImageSensorSettings:", v8);

      objc_msgSend(v7, "setImageSensorSettingsForUltraWide:", v5);
      ARVisionDataParametersForWorldTrackingOptions(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[ARImageSensorSettings setVisionDataOutputParameters:](v5, "setVisionDataOutputParameters:", v9);
        _ARLogGeneral_11();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543874;
          v19 = v12;
          v20 = 2048;
          v21 = self;
          v22 = 2112;
          v23 = v9;
          v13 = "%{public}@ <%p>: Setting vision data output parameters for ultra wide: %@";
          v14 = v10;
          v15 = 32;
LABEL_11:
          _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, v15);

        }
      }
      else
      {
        _ARLogGeneral_11();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v12;
          v20 = 2048;
          v21 = self;
          v13 = "%{public}@ <%p>: Did not receive vision data output parameters for ultra wide.";
          v14 = v10;
          v15 = 22;
          goto LABEL_11;
        }
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseUltraWide
{
  void *v3;
  int shouldUseUltraWideIfAvailable;

  if (!ARDeviceSupportsUltraWideCamera() || !ARUserDefaultsMulticamModeEnabled())
    goto LABEL_8;
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForUltraWide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

LABEL_8:
    shouldUseUltraWideIfAvailable = 0;
LABEL_9:
    if ((ARLinkedOnOrAfterYukon() & 1) != 0)
      LOBYTE(shouldUseUltraWideIfAvailable) = 0;
    else
      return shouldUseUltraWideIfAvailable & ARDeviceSupportsJasper();
    return shouldUseUltraWideIfAvailable;
  }
  shouldUseUltraWideIfAvailable = self->_shouldUseUltraWideIfAvailable;

  if (!shouldUseUltraWideIfAvailable)
    goto LABEL_9;
  shouldUseUltraWideIfAvailable = 1;
  if ((ARDeviceSupportsMulticamMode() & 1) == 0)
    goto LABEL_9;
  return shouldUseUltraWideIfAvailable;
}

- (BOOL)shouldUseJasper
{
  int v3;

  v3 = ARDeviceSupportsJasper();
  if (v3)
    LOBYTE(v3) = -[ARGeoTrackingConfiguration useLidarIfAvailable](self, "useLidarIfAvailable");
  return v3;
}

- (BOOL)shouldEnableVisionDataForImageSensorSettings:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  _BOOL4 v10;

  objc_msgSend(a3, "videoFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && ((v5 = -[ARGeoTrackingConfiguration shouldUseUltraWide](self, "shouldUseUltraWide"),
         objc_msgSend(v4, "captureDeviceType"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = v6,
         !v5)
      ? (v8 = (void **)MEMORY[0x1E0C89FA0])
      : (v8 = (void **)MEMORY[0x1E0C89F98]),
        (v9 = *v8, v6, v7 == v9)
     && +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.visionData"))))
  {
    v10 = !+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.simulateHWFeatureDetection"));
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setWorldAlignment:(ARWorldAlignment)worldAlignment
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  ARGeoTrackingConfiguration *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral_11();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromARWorldAlignment(-[ARGeoTrackingConfiguration worldAlignment](self, "worldAlignment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to set world alignment of ARGeoTrackingConfiguration. Alignment is always set to %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

- (ARWorldAlignment)worldAlignment
{
  return 1;
}

- (void)setDetectionImages:(NSSet *)detectionImages
{
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;

  v4 = detectionImages;
  v6 = v4;
  if (!v4)
    v4 = (NSSet *)objc_opt_new();
  objc_storeStrong((id *)&self->_detectionImages, v4);
  v5 = v6;
  if (!v6)
  {

    v5 = 0;
  }

}

- (void)setVideoFormat:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ARGeoTrackingConfiguration;
  -[ARConfiguration setVideoFormat:](&v6, sel_setVideoFormat_, v4);
  if ((objc_msgSend(v4, "has4KVideoResolution") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isX420PixelFormat");
  -[ARGeoTrackingConfiguration setAlwaysUsePrimaryCameraForTracking:](self, "setAlwaysUsePrimaryCameraForTracking:", v5);

}

- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages
{
  self->_maximumNumberOfTrackedImages = +[ARODTHandleManager actualNumberOfImagesTracked:](ARODTHandleManager, "actualNumberOfImagesTracked:", maximumNumberOfTrackedImages);
}

- (void)createTechniques:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  const __CFString *v14;
  ARWorldTrackingTechnique *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  ARImageDetectionTechnique *v19;
  void *v20;
  void *v21;
  ARImageDetectionTechnique *v22;
  ARAppClipCodeTechnique *v23;
  void *v24;
  uint64_t v25;
  ARPlaneEstimationTechnique *v26;
  AREnvironmentTexturingTechnique *v27;
  void *v28;
  uint64_t v29;
  ARObjectDetectionTechnique *v30;
  void *v31;
  void *v32;
  ARObjectDetectionTechnique *v33;
  ARParentTechnique *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  ARWorldAlignmentTechnique *v38;
  void *v39;
  ARWorldAlignmentTechnique *v40;
  void *v41;
  void *v42;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  ARGeoTrackingConfiguration *v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARGeoTrackingConfiguration _trackingOptions](self, "_trackingOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARGeoTrackingConfiguration imageSensorSettings](self, "imageSensorSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSensorSettings:", v6);

  -[ARGeoTrackingConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSensorSettingsForUltraWide:", v7);

  if (-[ARGeoTrackingConfiguration environmentTexturing](self, "environmentTexturing"))
    objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x80);
  -[ARConfiguration replaySensor](self, "replaySensor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "replayMode"))
    objc_msgSend(v5, "setDeterministicMode:", 1);
  if (objc_msgSend(v5, "planeDetection"))
  {
    v10 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.accuratePlaneExtentCheck"));
    _ARLogGeneral_11();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("disabled");
      *(_DWORD *)buf = 138543874;
      v45 = v13;
      if (v10)
        v14 = CFSTR("enabled");
      v46 = 2048;
      v47 = self;
      v48 = 2114;
      v49 = v14;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Ray-cast accurate extent check: %{public}@", buf, 0x20u);

    }
    if (v10)
      objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x200);
  }
  v15 = -[ARWorldTrackingTechnique initWithOptions:]([ARWorldTrackingTechnique alloc], "initWithOptions:", v5);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);
    -[ARGeoTrackingConfiguration detectionImages](self, "detectionImages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = [ARImageDetectionTechnique alloc];
      -[ARGeoTrackingConfiguration detectionImages](self, "detectionImages");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[ARImageDetectionTechnique initWithReferenceImages:maximumNumberOfTrackedImages:](v19, "initWithReferenceImages:maximumNumberOfTrackedImages:", v21, -[ARGeoTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));

      -[ARImageDetectionTechnique setEnableAutomaticImageScaleEstimation:](v22, "setEnableAutomaticImageScaleEstimation:", -[ARGeoTrackingConfiguration automaticImageScaleEstimationEnabled](self, "automaticImageScaleEstimationEnabled"));
      objc_msgSend(v16, "addObject:", v22);

    }
    if (-[ARGeoTrackingConfiguration appClipCodeTrackingEnabled](self, "appClipCodeTrackingEnabled"))
    {
      v23 = -[ARAppClipCodeTechnique initWithIgnoreURLLimitation:]([ARAppClipCodeTechnique alloc], "initWithIgnoreURLLimitation:", -[ARGeoTrackingConfiguration ignoreAppClipCodeURLLimitation](self, "ignoreAppClipCodeURLLimitation"));
      objc_msgSend(v16, "addObject:", v23);

    }
    -[ARWorldTrackingTechnique options](v15, "options");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "planeDetection");

    if (v25)
    {
      v26 = -[ARPlaneEstimationTechnique initWithTrackingTechnique:]([ARPlaneEstimationTechnique alloc], "initWithTrackingTechnique:", v15);
      objc_msgSend(v4, "addObject:", v26);

    }
    if (-[ARGeoTrackingConfiguration environmentTexturing](self, "environmentTexturing"))
    {
      v27 = -[AREnvironmentTexturingTechnique initWithOptions:wantsHDREnvironmentTextures:]([AREnvironmentTexturingTechnique alloc], "initWithOptions:wantsHDREnvironmentTextures:", -[ARGeoTrackingConfiguration environmentTexturing](self, "environmentTexturing"), self->_wantsHDREnvironmentTextures);
      objc_msgSend(v4, "addObject:", v27);

    }
    -[ARGeoTrackingConfiguration detectionObjects](self, "detectionObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
    {
      v30 = [ARObjectDetectionTechnique alloc];
      -[ARGeoTrackingConfiguration detectionObjects](self, "detectionObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allObjects");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[ARObjectDetectionTechnique initWithDetectionObjects:](v30, "initWithDetectionObjects:", v32);

      objc_msgSend(v16, "addObject:", v33);
    }
    v42 = v9;
    v34 = -[ARParentTechnique initWithParallelTechniques:]([ARParentTechnique alloc], "initWithParallelTechniques:", v16);
    objc_msgSend(v4, "insertObject:atIndex:", v34, 0);
    v43.receiver = self;
    v43.super_class = (Class)ARGeoTrackingConfiguration;
    -[ARConfiguration createTechniques:](&v43, sel_createTechniques_, v4);
    if (objc_msgSend(v5, "planeDetection") && -[ARGeoTrackingConfiguration isMLModelEnabled](self, "isMLModelEnabled"))
    {
      v35 = ARDeviceSupportsJasper();
      v36 = -[ARConfiguration maxUltrawideImageForwardingFrameRate](self, "maxUltrawideImageForwardingFrameRate");
      if (v35)
        ARAddJasperTechniquesToParent(v34, v4, 1, 0, v36);
      else
        ARAddNonJasperSemanticsToParent(v34, v4, v36, 1);
    }
    v37 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_35);
    v38 = [ARWorldAlignmentTechnique alloc];
    -[ARConfiguration videoFormat](self, "videoFormat");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[ARWorldAlignmentTechnique initWithAlignment:cameraPosition:](v38, "initWithAlignment:cameraPosition:", 16, objc_msgSend(v39, "captureDevicePosition"));

    objc_msgSend(v4, "replaceObjectAtIndex:withObject:", v37, v40);
    v41 = (void *)objc_opt_new();
    -[ARGeoTrackingConfiguration visualLocalizationCallInterval](self, "visualLocalizationCallInterval");
    objc_msgSend(v41, "setVisualLocalizationCallInterval:");
    objc_msgSend(v41, "setPosteriorVisualLocalizationCallInterval:", self->_posteriorVisualLocalizationCallInterval);
    objc_msgSend(v41, "setVisualLocalizationUpdatesRequested:", -[ARGeoTrackingConfiguration visualLocalizationUpdatesRequested](self, "visualLocalizationUpdatesRequested"));
    objc_msgSend(v41, "setSupportEnablementOptions:", -[ARGeoTrackingConfiguration supportEnablementOptions](self, "supportEnablementOptions"));
    objc_msgSend(v4, "insertObject:atIndex:", v41, v37);

    v9 = v42;
  }

}

uint64_t __47__ARGeoTrackingConfiguration_createTechniques___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_trackingOptions
{
  ARWorldTrackingOptions *v3;
  void *v4;
  ARFrameSemantics v5;

  v3 = objc_alloc_init(ARWorldTrackingOptions);
  -[ARConfiguration deviceModel](self, "deviceModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldTrackingOptions setDeviceModel:](v3, "setDeviceModel:", v4);

  -[ARWorldTrackingOptions setRelocalizationEnabled:](v3, "setRelocalizationEnabled:", 0);
  -[ARWorldTrackingOptions setInitialWorldMap:](v3, "setInitialWorldMap:", 0);
  -[ARWorldTrackingOptions setSlamConfiguration:](v3, "setSlamConfiguration:", CFSTR("CoreLocationIntegration"));
  -[ARWorldTrackingOptions setPlaneDetection:](v3, "setPlaneDetection:", -[ARGeoTrackingConfiguration planeDetection](self, "planeDetection"));
  -[ARGeoTrackingConfiguration minVergenceAngle](self, "minVergenceAngle");
  -[ARWorldTrackingOptions setMinVergenceAngle:](v3, "setMinVergenceAngle:");
  -[ARWorldTrackingOptions setMlModelEnabled:](v3, "setMlModelEnabled:", -[ARGeoTrackingConfiguration isMLModelEnabled](self, "isMLModelEnabled"));
  -[ARWorldTrackingOptions setLowQosSchedulingEnabled:](v3, "setLowQosSchedulingEnabled:", -[ARGeoTrackingConfiguration isLowQosSchedulingEnabled](self, "isLowQosSchedulingEnabled"));
  -[ARWorldTrackingOptions setCollaborationEnabled:](v3, "setCollaborationEnabled:", 0);
  -[ARWorldTrackingOptions setSceneReconstruction:](v3, "setSceneReconstruction:", 0);
  v5 = -[ARConfiguration frameSemantics](self, "frameSemantics") & 8;
  if (v5 | -[ARConfiguration frameSemantics](self, "frameSemantics") & 0x10)
    -[ARWorldTrackingOptions setDepthBuffersWillBeProvided:](v3, "setDepthBuffersWillBeProvided:", 1);
  -[ARWorldTrackingOptions setAlwaysUsePrimaryCameraForTracking:](v3, "setAlwaysUsePrimaryCameraForTracking:", -[ARGeoTrackingConfiguration alwaysUsePrimaryCameraForTracking](self, "alwaysUsePrimaryCameraForTracking"));
  -[ARWorldTrackingOptions setDisableMLRelocalization:](v3, "setDisableMLRelocalization:", -[ARConfiguration disableMLRelocalization](self, "disableMLRelocalization"));
  return v3;
}

- (int64_t)_depthPrioritization
{
  if (-[ARGeoTrackingConfiguration depthOptimizedForStaticScene](self, "depthOptimizedForStaticScene"))
    return 4;
  else
    return 1;
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  objc_super v6;

  if ((a3 & 7) == 0 && (ARDeviceSupportsJasper() & 1) != 0
    || (a3 & 0x1C) == 0 && (ARAppleNeuralEngine() & 1) != 0
    || (a3 & 4) == 0 && ARAppleNeuralEngine() && (ARDeviceSupportsJasper() & 1) != 0)
  {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ARGeoTrackingConfiguration;
  return objc_msgSendSuper2(&v6, sel_supportsFrameSemantics_, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  NSSet *detectionImages;
  NSSet *v8;
  NSSet *detectionObjects;
  int automaticImageScaleEstimationEnabled;
  int shouldUseUltraWideIfAvailable;
  int depthOptimizedForStaticScene;
  int alwaysUsePrimaryCameraForTracking;
  int ignoreAppClipCodeURLLimitation;
  int appClipCodeTrackingEnabled;
  unint64_t supportEnablementOptions;
  double visualLocalizationCallInterval;
  double v18;
  int visualLocalizationUpdatesRequested;
  int useLidarIfAvailable;
  BOOL v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ARGeoTrackingConfiguration;
  if (-[ARConfiguration isEqual:](&v23, sel_isEqual_, v4))
  {
    v5 = (unsigned __int8 *)v4;
    v6 = v5;
    if (self->_planeDetection == *((_QWORD *)v5 + 18)
      && self->_minVergenceAngle == *((double *)v5 + 22)
      && self->_mlModelEnabled == v5[123]
      && self->_environmentTexturing == *((_QWORD *)v5 + 17)
      && self->_lowQosSchedulingEnabled == v5[124]
      && self->_wantsHDREnvironmentTextures == v5[120])
    {
      detectionImages = self->_detectionImages;
      objc_msgSend(v5, "detectionImages");
      v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (detectionImages != v8
        && !-[NSSet isEqual:](self->_detectionImages, "isEqual:", *((_QWORD *)v6 + 19)))
      {
        goto LABEL_28;
      }
      if (self->_maximumNumberOfTrackedImages != *((_QWORD *)v6 + 20))
        goto LABEL_28;
      detectionObjects = self->_detectionObjects;
      if (detectionObjects != *((NSSet **)v6 + 21) && !-[NSSet isEqual:](detectionObjects, "isEqual:"))
        goto LABEL_28;
      automaticImageScaleEstimationEnabled = self->_automaticImageScaleEstimationEnabled;
      if (automaticImageScaleEstimationEnabled != objc_msgSend(v6, "automaticImageScaleEstimationEnabled"))goto LABEL_28;
      shouldUseUltraWideIfAvailable = self->_shouldUseUltraWideIfAvailable;
      if (shouldUseUltraWideIfAvailable != objc_msgSend(v6, "shouldUseUltraWideIfAvailable"))
        goto LABEL_28;
      depthOptimizedForStaticScene = self->_depthOptimizedForStaticScene;
      if (depthOptimizedForStaticScene != objc_msgSend(v6, "depthOptimizedForStaticScene"))
        goto LABEL_28;
      alwaysUsePrimaryCameraForTracking = self->_alwaysUsePrimaryCameraForTracking;
      if (alwaysUsePrimaryCameraForTracking == objc_msgSend(v6, "alwaysUsePrimaryCameraForTracking")
        && (ignoreAppClipCodeURLLimitation = self->_ignoreAppClipCodeURLLimitation,
            ignoreAppClipCodeURLLimitation == objc_msgSend(v6, "ignoreAppClipCodeURLLimitation"))
        && (appClipCodeTrackingEnabled = self->_appClipCodeTrackingEnabled,
            appClipCodeTrackingEnabled == objc_msgSend(v6, "appClipCodeTrackingEnabled"))
        && (supportEnablementOptions = self->_supportEnablementOptions,
            supportEnablementOptions == objc_msgSend(v6, "supportEnablementOptions"))
        && (visualLocalizationCallInterval = self->_visualLocalizationCallInterval,
            objc_msgSend(v6, "visualLocalizationCallInterval"),
            visualLocalizationCallInterval == v18)
        && self->_posteriorVisualLocalizationCallInterval == *((double *)v6 + 14)
        && (visualLocalizationUpdatesRequested = self->_visualLocalizationUpdatesRequested,
            visualLocalizationUpdatesRequested == objc_msgSend(v6, "visualLocalizationUpdatesRequested")))
      {
        useLidarIfAvailable = self->_useLidarIfAvailable;
        v21 = useLidarIfAvailable == objc_msgSend(v6, "useLidarIfAvailable");
      }
      else
      {
LABEL_28:
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARGeoTrackingConfiguration;
  v5 = -[ARConfiguration copyWithZone:](&v11, sel_copyWithZone_);
  v5[18] = self->_planeDetection;
  v5[22] = *(_QWORD *)&self->_minVergenceAngle;
  *((_BYTE *)v5 + 123) = self->_mlModelEnabled;
  *((_BYTE *)v5 + 124) = self->_lowQosSchedulingEnabled;
  v5[17] = self->_environmentTexturing;
  *((_BYTE *)v5 + 120) = self->_wantsHDREnvironmentTextures;
  v6 = -[NSSet copyWithZone:](self->_detectionImages, "copyWithZone:", a3);
  v7 = (void *)v5[19];
  v5[19] = v6;

  v5[20] = self->_maximumNumberOfTrackedImages;
  v8 = -[NSSet copyWithZone:](self->_detectionObjects, "copyWithZone:", a3);
  v9 = (void *)v5[21];
  v5[21] = v8;

  *((_BYTE *)v5 + 121) = self->_automaticImageScaleEstimationEnabled;
  *((_BYTE *)v5 + 125) = self->_shouldUseUltraWideIfAvailable;
  *((_BYTE *)v5 + 126) = self->_depthOptimizedForStaticScene;
  *((_BYTE *)v5 + 127) = self->_alwaysUsePrimaryCameraForTracking;
  *((_BYTE *)v5 + 128) = self->_ignoreAppClipCodeURLLimitation;
  *((_BYTE *)v5 + 122) = self->_appClipCodeTrackingEnabled;
  v5[23] = *(_QWORD *)&self->_visualLocalizationCallInterval;
  v5[14] = *(_QWORD *)&self->_posteriorVisualLocalizationCallInterval;
  v5[24] = self->_supportEnablementOptions;
  *((_BYTE *)v5 + 129) = self->_visualLocalizationUpdatesRequested;
  *((_BYTE *)v5 + 130) = self->_useLidarIfAvailable;
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARConfiguration descriptionWithoutBrackets](self, "descriptionWithoutBrackets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  if (-[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled"))
    v8 = CFSTR("Enabled");
  else
    v8 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" autoFocus=%@"), v8);
  NSStringFromAREnvironmentTexturing(self->_environmentTexturing);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" environmentTexturing=%@"), v9);

  if (-[ARGeoTrackingConfiguration wantsHDREnvironmentTextures](self, "wantsHDREnvironmentTextures"))
    v10 = CFSTR("Enabled");
  else
    v10 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" wantsHDREnvironmentTextures=%@"), v10);
  NSStringFromARPlaneDetection(self->_planeDetection);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" planeDetection=%@"), v11);

  -[ARGeoTrackingConfiguration detectionImages](self, "detectionImages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR(" maximumNumberOfTrackedImages=%ld"), -[ARGeoTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));
    if (-[ARGeoTrackingConfiguration automaticImageScaleEstimationEnabled](self, "automaticImageScaleEstimationEnabled"))
    {
      v14 = CFSTR("Enabled");
    }
    else
    {
      v14 = CFSTR("Disabled");
    }
    objc_msgSend(v6, "appendFormat:", CFSTR(" automaticImageScaleEstimation=%@"), v14);
    -[ARGeoTrackingConfiguration detectionImages](self, "detectionImages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    -[ARGeoTrackingConfiguration detectionImages](self, "detectionImages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ar_map:", &__block_literal_global_79_0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" detectionImages=[count: %ld, %@]"), v16, v20);

  }
  -[ARGeoTrackingConfiguration detectionObjects](self, "detectionObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    -[ARGeoTrackingConfiguration detectionObjects](self, "detectionObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" detectionObjects=[%@]"), v25);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR(" visualLocalizationCallInterval=%f"), *(_QWORD *)&self->_visualLocalizationCallInterval);
  objc_msgSend(v6, "appendFormat:", CFSTR(" posteriorVisualLocalizationCallInterval=%f"), *(_QWORD *)&self->_posteriorVisualLocalizationCallInterval);
  objc_msgSend(v6, "appendFormat:", CFSTR(" supportEnablementOptions=%ld"), self->_supportEnablementOptions);
  objc_msgSend(v6, "appendFormat:", CFSTR(" visualLocalizationUpdatesRequested=%d"), self->_visualLocalizationUpdatesRequested);
  objc_msgSend(v6, "appendFormat:", CFSTR(" useLidarIfAvailable=%d"), self->_useLidarIfAvailable);
  if (-[ARGeoTrackingConfiguration appClipCodeTrackingEnabled](self, "appClipCodeTrackingEnabled"))
    v26 = CFSTR("Enabled");
  else
    v26 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" appClipCodeTracking=%@"), v26);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

uint64_t __41__ARGeoTrackingConfiguration_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortDebugDescription");
}

- (AREnvironmentTexturing)environmentTexturing
{
  return self->_environmentTexturing;
}

- (void)setEnvironmentTexturing:(AREnvironmentTexturing)environmentTexturing
{
  self->_environmentTexturing = environmentTexturing;
}

- (BOOL)wantsHDREnvironmentTextures
{
  return self->_wantsHDREnvironmentTextures;
}

- (void)setWantsHDREnvironmentTextures:(BOOL)wantsHDREnvironmentTextures
{
  self->_wantsHDREnvironmentTextures = wantsHDREnvironmentTextures;
}

- (ARPlaneDetection)planeDetection
{
  return self->_planeDetection;
}

- (void)setPlaneDetection:(ARPlaneDetection)planeDetection
{
  self->_planeDetection = planeDetection;
}

- (NSSet)detectionImages
{
  return self->_detectionImages;
}

- (BOOL)automaticImageScaleEstimationEnabled
{
  return self->_automaticImageScaleEstimationEnabled;
}

- (void)setAutomaticImageScaleEstimationEnabled:(BOOL)automaticImageScaleEstimationEnabled
{
  self->_automaticImageScaleEstimationEnabled = automaticImageScaleEstimationEnabled;
}

- (NSInteger)maximumNumberOfTrackedImages
{
  return self->_maximumNumberOfTrackedImages;
}

- (NSSet)detectionObjects
{
  return self->_detectionObjects;
}

- (void)setDetectionObjects:(NSSet *)detectionObjects
{
  objc_setProperty_nonatomic_copy(self, a2, detectionObjects, 168);
}

- (void)setAppClipCodeTrackingEnabled:(BOOL)appClipCodeTrackingEnabled
{
  self->_appClipCodeTrackingEnabled = appClipCodeTrackingEnabled;
}

- (double)minVergenceAngle
{
  return self->_minVergenceAngle;
}

- (void)setMinVergenceAngle:(double)a3
{
  self->_minVergenceAngle = a3;
}

- (BOOL)isMLModelEnabled
{
  return self->_mlModelEnabled;
}

- (void)setMlModelEnabled:(BOOL)a3
{
  self->_mlModelEnabled = a3;
}

- (BOOL)isLowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (BOOL)shouldUseUltraWideIfAvailable
{
  return self->_shouldUseUltraWideIfAvailable;
}

- (void)setShouldUseUltraWideIfAvailable:(BOOL)a3
{
  self->_shouldUseUltraWideIfAvailable = a3;
}

- (BOOL)depthOptimizedForStaticScene
{
  return self->_depthOptimizedForStaticScene;
}

- (void)setDepthOptimizedForStaticScene:(BOOL)a3
{
  self->_depthOptimizedForStaticScene = a3;
}

- (BOOL)alwaysUsePrimaryCameraForTracking
{
  return self->_alwaysUsePrimaryCameraForTracking;
}

- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3
{
  self->_alwaysUsePrimaryCameraForTracking = a3;
}

- (BOOL)ignoreAppClipCodeURLLimitation
{
  return self->_ignoreAppClipCodeURLLimitation;
}

- (void)setIgnoreAppClipCodeURLLimitation:(BOOL)a3
{
  self->_ignoreAppClipCodeURLLimitation = a3;
}

- (double)visualLocalizationCallInterval
{
  return self->_visualLocalizationCallInterval;
}

- (BOOL)visualLocalizationUpdatesRequested
{
  return self->_visualLocalizationUpdatesRequested;
}

- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3
{
  self->_visualLocalizationUpdatesRequested = a3;
}

- (unint64_t)supportEnablementOptions
{
  return self->_supportEnablementOptions;
}

- (void)setSupportEnablementOptions:(unint64_t)a3
{
  self->_supportEnablementOptions = a3;
}

- (BOOL)useLidarIfAvailable
{
  return self->_useLidarIfAvailable;
}

- (void)setUseLidarIfAvailable:(BOOL)a3
{
  self->_useLidarIfAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionObjects, 0);
  objc_storeStrong((id *)&self->_detectionImages, 0);
}

@end
