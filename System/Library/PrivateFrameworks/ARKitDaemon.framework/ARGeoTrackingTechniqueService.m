@implementation ARGeoTrackingTechniqueService

- (ARGeoTrackingTechniqueService)initWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ARGeoTrackingTechniqueService *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  ARRemoteGeoTrackingTechniqueServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ARRemoteGeoTrackingTechniqueClientInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)ARGeoTrackingTechniqueService;
  v7 = -[ARTechniqueService initWithConnection:exportedInterface:remoteObjectInterface:](&v13, sel_initWithConnection_exportedInterface_remoteObjectInterface_, v4, v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARTechniqueService setClientProxy:](v7, "setClientProxy:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CB70]), "initWithNSXPCConnection:", v4);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFD940]), "initWithAuditToken:", v9);
    -[ARTechniqueService setTechnique:](v7, "setTechnique:", v10);

    -[ARTechniqueService technique](v7, "technique");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v7);

  }
  return v7;
}

- (id)processLocationData:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  ARLocationData *v15;
  ARLocationData *lastProcessedLocationData;
  ARLocationData *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  ARLocationData *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  int v26;
  uint64_t v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  ARGeoTrackingTechniqueService *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BYTE v37[14];
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[ARDaemonService isActive](self, "isActive"))
  {
    _ARLogDaemon_5();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v21;
      v32 = 2048;
      v33 = self;
      v34 = 2112;
      v35 = v4;
      _os_log_impl(&dword_235C46000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Service not active; skipping processing of location data: %@",
        buf,
        0x20u);

    }
    v22 = (ARLocationData *)v4;
    goto LABEL_13;
  }
  if (self->_lastProcessedLocationData)
  {
    objc_msgSend(v4, "timestamp");
    v6 = v5;
    -[ARLocationData timestamp](self->_lastProcessedLocationData, "timestamp");
    if (v6 <= v7)
    {
      _ARLogDaemon_5();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v4, "isSecure");
        objc_msgSend(v4, "timestamp");
        *(_DWORD *)buf = 138544386;
        v31 = v25;
        v32 = 2048;
        v33 = self;
        v34 = 2048;
        v35 = v4;
        v36 = 1024;
        *(_DWORD *)v37 = v26;
        *(_WORD *)&v37[4] = 2048;
        *(_QWORD *)&v37[6] = v27;
        _os_log_impl(&dword_235C46000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processLocationData - Already processed locationData (%p), isSecure: %d, timestamp: %f", buf, 0x30u);

      }
      v22 = self->_lastProcessedLocationData;
LABEL_13:
      v18 = v22;
      goto LABEL_14;
    }
  }
  _ARLogDaemon_5();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isSecure");
    objc_msgSend(v4, "timestamp");
    *(_DWORD *)buf = 138544642;
    v31 = v10;
    v32 = 2048;
    v33 = self;
    v34 = 2048;
    v35 = v4;
    v36 = 2112;
    *(_QWORD *)v37 = v4;
    *(_WORD *)&v37[8] = 1024;
    *(_DWORD *)&v37[10] = v11;
    v38 = 2048;
    v39 = v12;
    _os_log_impl(&dword_235C46000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processLocationData - Processing locationData (%p): %@, isSecure: %d, timestamp: %f", buf, 0x3Au);

  }
  -[ARDaemonService dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "service:peerServiceOfType:", self, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "updateFromLocationData:", v4);
  v15 = (ARLocationData *)objc_claimAutoreleasedReturnValue();
  lastProcessedLocationData = self->_lastProcessedLocationData;
  self->_lastProcessedLocationData = v15;

  v17 = self->_lastProcessedLocationData;
  v29.receiver = self;
  v29.super_class = (Class)ARGeoTrackingTechniqueService;
  -[ARTechniqueService processData:](&v29, sel_processData_, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v18;
}

- (id)processDeviceOrientationData:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ARDeviceOrientationData *v14;
  ARDeviceOrientationData *lastProcessedDeviceOrientationData;
  ARDeviceOrientationData *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  ARDeviceOrientationData *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  ARGeoTrackingTechniqueService *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[ARDaemonService isActive](self, "isActive"))
  {
    _ARLogDaemon_5();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v20;
      v30 = 2048;
      v31 = self;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_235C46000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Service not active; skipping processing of device orientation data: %@",
        buf,
        0x20u);

    }
    v21 = (ARDeviceOrientationData *)v4;
    goto LABEL_13;
  }
  if (self->_lastProcessedDeviceOrientationData)
  {
    objc_msgSend(v4, "timestamp");
    v6 = v5;
    -[ARDeviceOrientationData timestamp](self->_lastProcessedDeviceOrientationData, "timestamp");
    if (v6 <= v7)
    {
      _ARLogDaemon_5();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "timestamp");
        *(_DWORD *)buf = 138544130;
        v29 = v24;
        v30 = 2048;
        v31 = self;
        v32 = 2048;
        v33 = v4;
        v34 = 2048;
        v35 = v25;
        _os_log_impl(&dword_235C46000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processDeviceOrientationData - Already processed data (%p), timestamp: %f", buf, 0x2Au);

      }
      v21 = self->_lastProcessedDeviceOrientationData;
LABEL_13:
      v17 = v21;
      goto LABEL_14;
    }
  }
  _ARLogDaemon_5();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    *(_DWORD *)buf = 138544386;
    v29 = v10;
    v30 = 2048;
    v31 = self;
    v32 = 2048;
    v33 = v4;
    v34 = 2112;
    v35 = v4;
    v36 = 2048;
    v37 = v11;
    _os_log_impl(&dword_235C46000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processDeviceOrientationData - Processing data (%p): %@, timestamp: %f", buf, 0x34u);

  }
  -[ARDaemonService dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "service:peerServiceOfType:", self, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "updateFromDeviceOrientationData:", v4);
  v14 = (ARDeviceOrientationData *)objc_claimAutoreleasedReturnValue();
  lastProcessedDeviceOrientationData = self->_lastProcessedDeviceOrientationData;
  self->_lastProcessedDeviceOrientationData = v14;

  v16 = self->_lastProcessedDeviceOrientationData;
  v27.receiver = self;
  v27.super_class = (Class)ARGeoTrackingTechniqueService;
  -[ARTechniqueService processData:](&v27, sel_processData_, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v17;
}

- (void)getLocationFromWorldPosition:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *, id);
  double v6;
  void *v7;
  int8x16_t v8;
  void *v9;
  id v10;
  __int128 v11;
  void *v12;
  int8x16_t v13;
  uint64_t v14;
  double v15;
  int8x16_t v16;
  int8x16_t v17;
  uint64_t v18;
  id v19;
  _OWORD v20[2];

  v5 = (void (**)(id, void *, id))a4;
  ARVector3FromNSData();
  v15 = v6;
  -[ARTechniqueService technique](self, "technique");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v19 = 0;
  if (v7)
  {
    objc_msgSend(v7, "getLocationFromWorldPosition:error:", &v19, v15);
    v10 = v19;
    v16 = v17;
    v8 = vextq_s8(v16, v16, 8uLL);
    v14 = v8.i64[0];
    v8.i64[0] = v18;
  }
  else
  {
    v10 = 0;
    v16.i64[0] = 0;
    v14 = 0;
    v8.i64[0] = 0;
  }
  v13 = v8;

  *(_QWORD *)&v11 = v16.i64[0];
  *((_QWORD *)&v11 + 1) = v14;
  v20[0] = v11;
  v20[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v20, 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v12, v10);

}

- (void)setVisualLocalizationCallInterval:(double)a3
{
  id v4;

  -[ARTechniqueService technique](self, "technique");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisualLocalizationCallInterval:", a3);

}

- (void)visualLocalizationCallIntervalWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[ARTechniqueService technique](self, "technique");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualLocalizationCallInterval");
  (*((void (**)(id, _QWORD))a3 + 2))(v5, 0);

}

- (void)setPosteriorVisualLocalizationCallInterval:(double)a3
{
  id v4;

  -[ARTechniqueService technique](self, "technique");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosteriorVisualLocalizationCallInterval:", a3);

}

- (void)posteriorVisualLocalizationCallIntervalWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[ARTechniqueService technique](self, "technique");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posteriorVisualLocalizationCallInterval");
  (*((void (**)(id, _QWORD))a3 + 2))(v5, 0);

}

- (void)setVisualLocalizationCallIntervalTimeThreshold:(double)a3
{
  id v4;

  -[ARTechniqueService technique](self, "technique");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisualLocalizationCallIntervalTimeThreshold:", a3);

}

- (void)visualLocalizationCallIntervalTimeThresholdWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[ARTechniqueService technique](self, "technique");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualLocalizationCallIntervalTimeThreshold");
  (*((void (**)(id, _QWORD))a3 + 2))(v5, 0);

}

- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ARTechniqueService technique](self, "technique");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisualLocalizationUpdatesRequested:", v3);

}

- (void)visualLocalizationUpdatesRequestedWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[ARTechniqueService technique](self, "technique");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v5, objc_msgSend(v6, "visualLocalizationUpdatesRequested"), 0);

}

- (void)setSupportEnablementOptions:(unint64_t)a3
{
  id v4;

  -[ARTechniqueService technique](self, "technique");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportEnablementOptions:", a3);

}

- (void)supportEnablementOptionsWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[ARTechniqueService technique](self, "technique");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v5, objc_msgSend(v6, "supportEnablementOptions"), 0);

}

+ (id)serviceName
{
  return (id)*MEMORY[0x24BDFD8E8];
}

- (id)processData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ARGeoTrackingTechniqueService processLocationData:](self, "processLocationData:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ARGeoTrackingTechniqueService processDeviceOrientationData:](self, "processDeviceOrientationData:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)ARGeoTrackingTechniqueService;
      -[ARTechniqueService processData:](&v8, sel_processData_, v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
  }
  v6 = (void *)v5;

  return v6;
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  ARGeoTrackingTechniqueService *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  double v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v42 = a6;
  -[ARDaemonService dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "service:peerServiceOfType:", self, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v48;
    v16 = 0x24BDFD000uLL;
    v43 = v12;
    v44 = *(_QWORD *)v48;
    do
    {
      v17 = 0;
      v45 = v14;
      do
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v18;
          objc_msgSend(v19, "localizationResult");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            _ARLogDaemon_5();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v22 = (objc_class *)objc_opt_class();
              NSStringFromClass(v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "heading");
              *(_DWORD *)buf = 138543875;
              v52 = v23;
              v53 = 2048;
              v54 = self;
              v55 = 2049;
              v56 = v24;
              _os_log_impl(&dword_235C46000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: vlHeading,%{private}f", buf, 0x20u);

            }
            _ARLogDaemon_5();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "location");
              v28 = v11;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "coordinate");
              v31 = v30;
              objc_msgSend(v19, "location");
              v32 = v16;
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "coordinate");
              v35 = v34;
              objc_msgSend(v19, "location");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "altitude");
              *(_DWORD *)buf = 138544387;
              v52 = v27;
              v53 = 2048;
              v54 = self;
              v55 = 2049;
              v56 = v31;
              v57 = 2049;
              v58 = v35;
              v59 = 2049;
              v60 = v37;
              _os_log_impl(&dword_235C46000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: vlLocation,%{private}lf,%{private}lf,%{private}lf", buf, 0x34u);

              v14 = v45;
              v16 = v32;

              v11 = v28;
              v12 = v43;
              v15 = v44;

            }
            _ARLogDaemon_5();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              v39 = (objc_class *)objc_opt_class();
              NSStringFromClass(v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v52 = v40;
              v53 = 2048;
              v54 = self;
              v55 = 2048;
              v56 = v11;
              v57 = 2112;
              v58 = v11;
              v59 = 2112;
              v60 = v19;
              v61 = 2048;
              v62 = a5;
              _os_log_impl(&dword_235C46000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: technique:didOutputResultData: - Calling updateFromVisualLocalizationResult on locationSensorService (%p): %@, with visResult: %@, timestamp: %f", buf, 0x3Eu);

              v14 = v45;
            }

            objc_msgSend(v11, "updateFromVisualLocalizationResult:", v19);
          }

        }
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    }
    while (v14);
  }

  -[ARTechniqueService technique](self, "technique");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46.receiver = self;
  v46.super_class = (Class)ARGeoTrackingTechniqueService;
  -[ARTechniqueService technique:didOutputResultData:timestamp:context:](&v46, sel_technique_didOutputResultData_timestamp_context_, v41, v12, v42, a5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedDeviceOrientationData, 0);
  objc_storeStrong((id *)&self->_lastProcessedLocationData, 0);
}

@end
