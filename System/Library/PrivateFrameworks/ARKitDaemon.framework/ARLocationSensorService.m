@implementation ARLocationSensorService

- (ARLocationSensorService)initWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ARLocationSensorService *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  ARRemoteLocationSensorServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ARRemoteLocationSensorClientInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)ARLocationSensorService;
  v7 = -[ARDaemonService initWithConnection:exportedInterface:remoteObjectInterface:](&v14, sel_initWithConnection_exportedInterface_remoteObjectInterface_, v4, v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSensorService setClientProxy:](v7, "setClientProxy:", v8);

    v9 = objc_alloc(MEMORY[0x24BDFD968]);
    -[ARDaemonService clientBundleIdentifier](v7, "clientBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithBundleIdentifier:", v10);
    -[ARSensorService setSensor:](v7, "setSensor:", v11);

    -[ARSensorService sensor](v7, "sensor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v7);

  }
  return v7;
}

- (void)configureForReplay
{
  id v2;

  -[ARSensorService sensor](self, "sensor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureForReplay");

}

- (void)currentLocationWithReply:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, id, _QWORD))a3;
  -[ARSensorService sensor](self, "sensor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6, 0);
}

- (void)lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  double longitude;
  double latitude;
  id v7;
  id v8;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  -[ARSensorService sensor](self, "sensor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookupAltitudeAtCoordinate:completionHandler:", v7, latitude, longitude);

}

- (void)updateARSessionState:(unint64_t)a3
{
  id v4;

  -[ARSensorService sensor](self, "sensor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateARSessionState:", a3);

}

- (void)updateEstimationFromVIOPose:(id)a3 imageData:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ARSensorService sensor](self, "sensor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateEstimationFromVIOPose:imageData:", v7, v6);

}

- (void)updateFromVisualLocalizationResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ARSensorService sensor](self, "sensor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFromVisualLocalizationResult:", v4);

}

- (id)updateFromLocationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ARSensorService sensor](self, "sensor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFromLocationData:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)updateFromDeviceOrientationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ARSensorService sensor](self, "sensor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFromDeviceOrientationData:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)sensor:(id)a3 didOutputSensorData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  ARLocationSensorService *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ARDaemonService dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "service:peerServiceOfType:", self, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (_ARLogDaemon_onceToken_3 != -1)
      dispatch_once(&_ARLogDaemon_onceToken_3, &__block_literal_global_3);
    v8 = (void *)_ARLogDaemon_logObj_3;
    if (os_log_type_enabled((os_log_t)_ARLogDaemon_logObj_3, OS_LOG_TYPE_DEBUG))
    {
      v9 = v8;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2048;
      v20 = v7;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_235C46000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: sensor:didOutputSensorData: - Calling processLocationData on geoTrackingTechniqueService (%p): %@", buf, 0x2Au);

    }
    v12 = (id)objc_msgSend(v7, "processLocationData:", v5);

  }
  -[ARSensorService sensor](self, "sensor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)ARLocationSensorService;
  -[ARSensorService sensor:didOutputSensorData:](&v14, sel_sensor_didOutputSensorData_, v13, v5);

}

+ (id)serviceName
{
  return (id)*MEMORY[0x24BDFD8F0];
}

@end
