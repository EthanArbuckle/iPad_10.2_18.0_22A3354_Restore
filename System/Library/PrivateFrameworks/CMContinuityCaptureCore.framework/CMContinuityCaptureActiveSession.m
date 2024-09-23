@implementation CMContinuityCaptureActiveSession

- (CMContinuityCaptureActiveSession)initWithDevice:(id)a3 transport:(int64_t)a4 initiatedOnCommunalDevice:(BOOL)a5
{
  id v9;
  CMContinuityCaptureActiveSession *v10;
  CMContinuityCaptureActiveSession *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *sCameraStreamingPowerEventsByCameraType;
  CMContinuityCaptureActiveSession *v14;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMContinuityCaptureActiveSession;
  v10 = -[CMContinuityCaptureActiveSession init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    v11->_transport = a4;
    v11->_initiatedOnCommunalDevice = a5;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sCameraStreamingPowerEventsByCameraType = v11->_sCameraStreamingPowerEventsByCameraType;
    v11->_sCameraStreamingPowerEventsByCameraType = v12;

    -[CMContinuityCaptureActiveSession launchShieldUI](v11, "launchShieldUI");
    v14 = v11;
  }

  return v11;
}

- (void)launchShieldUI
{
  NSObject *v3;
  ContinuityCaptureTransportDevice *device;
  void *v5;
  NSObject *v6;
  _BYTE *v7;
  void *v8;
  void *v9;
  int v10;
  CMContinuityCaptureActiveSession *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  ContinuityCaptureTransportDevice *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    device = self->_device;
    -[CMContinuityCaptureActiveSession device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = self;
    v12 = 2080;
    v13 = "-[CMContinuityCaptureActiveSession launchShieldUI]";
    v14 = 2114;
    v15 = device;
    v16 = 1024;
    v17 = objc_msgSend(v5, "isPlacementStepSkipped");
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@ (isPlacementStepSkipped:%d)", (uint8_t *)&v10, 0x26u);

  }
  if (FigGetCFPreferenceBooleanWithDefault()
    && ((-[ContinuityCaptureTransportDevice wired](self->_device, "wired") & 1) != 0
     || (-[ContinuityCaptureTransportDevice wifiP2pActive](self->_device, "wifiP2pActive") & 1) != 0))
  {
    v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 2));
    v7 = (_BYTE *)-[NSObject mutableBytes](v6, "mutableBytes");
    -[CMContinuityCaptureActiveSession device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *v7 = *v7 & 0xFE | objc_msgSend(v8, "isPlacementStepSkipped");

    -[CMContinuityCaptureActiveSession device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preLaunchShieldUIForTransport:data:", -[CMContinuityCaptureActiveSession transport](self, "transport"), v6);

  }
  else
  {
    CMContinuityCaptureLog(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = self;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ prelaunch shield disabled", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (ContinuityCaptureTransportDevice)device
{
  CMContinuityCaptureActiveSession *v2;
  ContinuityCaptureTransportDevice *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)transport
{
  CMContinuityCaptureActiveSession *v2;
  int64_t transport;

  v2 = self;
  objc_sync_enter(v2);
  transport = v2->_transport;
  objc_sync_exit(v2);

  return transport;
}

- (void)setDevice:(id)a3
{
  ContinuityCaptureTransportDevice *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CMContinuityCaptureActiveSession *v8;
  ContinuityCaptureTransportDevice *device;
  int v10;
  CMContinuityCaptureActiveSession *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  ContinuityCaptureTransportDevice *v19;
  __int16 v20;
  ContinuityCaptureTransportDevice *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (ContinuityCaptureTransportDevice *)a3;
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CMContinuityCaptureActiveSession device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureActiveSession device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413570;
    v11 = self;
    v12 = 2080;
    v13 = "-[CMContinuityCaptureActiveSession setDevice:]";
    v14 = 2112;
    v15 = v6;
    v16 = 2048;
    v17 = v7;
    v18 = 2112;
    v19 = v4;
    v20 = 2048;
    v21 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s %@(%p) -> %@(%p)", (uint8_t *)&v10, 0x3Eu);

  }
  v8 = self;
  objc_sync_enter(v8);
  device = v8->_device;
  v8->_device = v4;

  objc_sync_exit(v8);
  -[CMContinuityCaptureActiveSession launchShieldUI](v8, "launchShieldUI");
}

- (void)setTransport:(int64_t)a3
{
  NSObject *v5;
  CMContinuityCaptureActiveSession *v6;
  int v7;
  CMContinuityCaptureActiveSession *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138413058;
    v8 = self;
    v9 = 2080;
    v10 = "-[CMContinuityCaptureActiveSession setTransport:]";
    v11 = 1024;
    v12 = -[CMContinuityCaptureActiveSession transport](self, "transport");
    v13 = 1024;
    v14 = a3;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s %d -> %d", (uint8_t *)&v7, 0x22u);
  }

  v6 = self;
  objc_sync_enter(v6);
  v6->_transport = a3;
  objc_sync_exit(v6);

}

- (NSString)shieldSessionID
{
  CMContinuityCaptureActiveSession *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_shieldSessionID;
  objc_sync_exit(v2);

  return v3;
}

- (void)setShieldSessionID:(id)a3
{
  NSString *v4;
  NSString *shieldSessionID;
  CMContinuityCaptureActiveSession *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  shieldSessionID = obj->_shieldSessionID;
  obj->_shieldSessionID = v4;

  objc_sync_exit(obj);
}

- (NSDate)shieldSessionIDGeneratedTime
{
  CMContinuityCaptureActiveSession *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_shieldSessionIDGeneratedTime;
  objc_sync_exit(v2);

  return v3;
}

- (void)setShieldSessionIDGeneratedTime:(id)a3
{
  NSDate *v4;
  NSDate *shieldSessionIDGeneratedTime;
  CMContinuityCaptureActiveSession *obj;

  v4 = (NSDate *)a3;
  obj = self;
  objc_sync_enter(obj);
  shieldSessionIDGeneratedTime = obj->_shieldSessionIDGeneratedTime;
  obj->_shieldSessionIDGeneratedTime = v4;

  objc_sync_exit(obj);
}

- (void)setDeviceModel:(int64_t)a3
{
  CMContinuityCaptureActiveSession *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_deviceModel = a3;
  objc_sync_exit(obj);

}

- (int64_t)deviceModel
{
  CMContinuityCaptureActiveSession *v2;
  int64_t deviceModel;

  v2 = self;
  objc_sync_enter(v2);
  deviceModel = v2->_deviceModel;
  objc_sync_exit(v2);

  return deviceModel;
}

- (id)description
{
  void *v3;
  ContinuityCaptureTransportDevice *device;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  device = self->_device;
  -[CMContinuityCaptureActiveSession shieldSessionID](self, "shieldSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Device:%@ SID:%@ Transport:%d Model:%d"), device, v5, self->_transport, -[CMContinuityCaptureActiveSession deviceModel](self, "deviceModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isInitiatedOnCommunalDevice
{
  return self->_initiatedOnCommunalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sCameraStreamingPowerEventsByCameraType, 0);
  objc_storeStrong((id *)&self->_shieldSessionIDGeneratedTime, 0);
  objc_storeStrong((id *)&self->_shieldSessionID, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
