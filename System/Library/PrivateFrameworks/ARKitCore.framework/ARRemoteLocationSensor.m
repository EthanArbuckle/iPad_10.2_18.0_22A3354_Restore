@implementation ARRemoteLocationSensor

- (ARRemoteLocationSensor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARRemoteLocationSensor;
  return -[ARRemoteSensor initWithServiceName:](&v3, sel_initWithServiceName_, CFSTR("com.apple.arkit.service.location"));
}

- (ARRemoteLocationSensor)initWithServerConnection:(id)a3
{
  id v4;
  ARRemoteLocationSensor *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARRemoteLocationSensor;
  v5 = -[ARRemoteSensor initWithServerConnection:](&v9, sel_initWithServerConnection_, v4);
  if (v5)
  {
    ARRemoteLocationSensorClientInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v6);

    ARRemoteLocationSensorServiceInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v7);

  }
  return v5;
}

- (void)configureForReplay
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[ARRemoteSensor serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__ARRemoteLocationSensor_configureForReplay__block_invoke;
  v5[3] = &unk_1E6672EB8;
  v5[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "configureForReplay");
}

void __44__ARRemoteLocationSensor_configureForReplay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogSensor_7();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);

  }
}

- (ARLocationData)currentLocation
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  -[ARRemoteSensor serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__ARRemoteLocationSensor_currentLocation__block_invoke;
  v9[3] = &unk_1E6672EB8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __41__ARRemoteLocationSensor_currentLocation__block_invoke_81;
  v8[3] = &unk_1E6674DC0;
  v8[4] = &v10;
  objc_msgSend(v5, "currentLocationWithReply:", v8);
  v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (ARLocationData *)v6;
}

void __41__ARRemoteLocationSensor_currentLocation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogSensor_7();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);

  }
}

void __41__ARRemoteLocationSensor_currentLocation__block_invoke_81(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  double longitude;
  double latitude;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  -[ARRemoteSensor serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__ARRemoteLocationSensor_lookupAltitudeAtCoordinate_completionHandler___block_invoke;
  v10[3] = &unk_1E6672EB8;
  v10[4] = self;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lookupAltitudeAtCoordinate:completionHandler:", v7, latitude, longitude);
}

void __71__ARRemoteLocationSensor_lookupAltitudeAtCoordinate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogSensor_7();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);

  }
}

- (unint64_t)providedDataTypes
{
  return 64;
}

- (void)updateARSessionState:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[ARRemoteSensor serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ARRemoteLocationSensor_updateARSessionState___block_invoke;
  v7[3] = &unk_1E6672EB8;
  v7[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateARSessionState:", a3);
}

void __47__ARRemoteLocationSensor_updateARSessionState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogSensor_7();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)updateEstimationFromVIOPose:(id)a3 imageData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a4;
  v7 = a3;
  -[ARRemoteSensor serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__ARRemoteLocationSensor_updateEstimationFromVIOPose_imageData___block_invoke;
  v10[3] = &unk_1E6672EB8;
  v10[4] = self;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateEstimationFromVIOPose:imageData:", v7, v6);
}

void __64__ARRemoteLocationSensor_updateEstimationFromVIOPose_imageData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogSensor_7();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)updateFromVisualLocalizationResult:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[ARRemoteLocationSensor updateFromVisualLocalizationResult:]");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ should no longer be called remotely."), v5);

}

- (id)updateFromLocationData:(id)a3
{
  return a3;
}

@end
