@implementation AmbientLightSensorDataController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___DKBrightnessResponder))
    -[AmbientLightSensorDataController setBrightnessResponder:](self, "setBrightnessResponder:", v5);

}

- (void)start
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  dispatch_time_t v22;
  void *v23;
  _QWORD block[5];
  uint8_t buf[4];
  void *v26;

  -[AmbientLightSensorDataController setALSDataCount:](self, "setALSDataCount:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessResponder](self, "brightnessResponder"));

  v4 = DiagnosticLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using DKBrightnessResponder to increase brightness for ALS", buf, 2u);
    }

    v7 = objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessResponder](self, "brightnessResponder"));
    LODWORD(v8) = 1.0;
    -[NSObject setScreenToBrightness:animate:](v7, "setScreenToBrightness:animate:", 1, v8);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No DKBrightnessResponder. Falling back to CoreBrightness", buf, 2u);
    }

    v9 = objc_alloc_init((Class)BrightnessSystemClient);
    -[AmbientLightSensorDataController setBrightnessSystemClient:](self, "setBrightnessSystemClient:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessSystemClient](self, "brightnessSystemClient"));
    v11 = objc_msgSend(v10, "copyPropertyForKey:", CFSTR("DisplayBrightnessFactor"));
    -[AmbientLightSensorDataController setBrightnessFactor:](self, "setBrightnessFactor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessSystemClient](self, "brightnessSystemClient"));
    objc_msgSend(v12, "setProperty:forKey:", &off_100008570, CFSTR("DisplayBrightnessFactor"));

    v13 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessFactor](self, "brightnessFactor"));
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Brightness factor is %@", buf, 0xCu);

    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
  -[AmbientLightSensorDataController setEventMonitor:](self, "setEventMonitor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));
  objc_msgSend(v16, "setDelegate:", self);

  if ((-[AmbientLightSensorDataController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_100008510));
    v19 = objc_msgSend(v17, "startMonitoringWithHIDEvents:", v18);

    if (v19
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor")),
          v21 = objc_msgSend(v20, "serviceClientSetPropertyValue:forKey:forHIDEvent:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 100000), CFSTR("ReportInterval"), 6), v20, v21))
    {
      v22 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006004;
      block[3] = &unk_1000082A8;
      block[4] = self;
      dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController result](self, "result"));
      objc_msgSend(v23, "setStatusCode:", &off_100008528);

      -[AmbientLightSensorDataController setFinished:](self, "setFinished:", 1);
    }
  }
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if ((-[AmbientLightSensorDataController isCancelled](self, "isCancelled") & 1) == 0
    && IOHIDEventGetType(a3) == 12)
  {
    IOHIDEventGetFloatValue(a3, 786432);
    IOHIDEventGetFloatValue(a3, 786433);
    IOHIDEventGetFloatValue(a3, 786434);
    IOHIDEventGetFloatValue(a3, 786435);
    -[AmbientLightSensorDataController setALSDataCount:](self, "setALSDataCount:", -[AmbientLightSensorDataController ALSDataCount](self, "ALSDataCount", IOHIDEventGetFloatValue(a3, 786436))+ 1);
  }
}

- (void)finish
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _UNKNOWN **v9;
  _DWORD v10[2];

  if ((-[AmbientLightSensorDataController isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[AmbientLightSensorDataController teardown](self, "teardown");
    v3 = -[AmbientLightSensorDataController ALSDataCount](self, "ALSDataCount");
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if (v3 < 1)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1000065D4(v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController result](self, "result"));
      v8 = v7;
      v9 = &off_100008558;
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = -[AmbientLightSensorDataController ALSDataCount](self, "ALSDataCount");
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ambient Light Sensor found. (%d)", (uint8_t *)v10, 8u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController result](self, "result"));
      v8 = v7;
      v9 = &off_100008540;
    }
    objc_msgSend(v7, "setStatusCode:", v9);

  }
  -[AmbientLightSensorDataController setFinished:](self, "setFinished:", 1);
}

- (void)teardown
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));
    v5 = objc_msgSend(v4, "currentlyMonitoring");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));
      objc_msgSend(v6, "stopMonitoring");

    }
    -[AmbientLightSensorDataController setEventMonitor:](self, "setEventMonitor:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessResponder](self, "brightnessResponder"));
  if (v7)
  {

  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessSystemClient](self, "brightnessSystemClient"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessFactor](self, "brightnessFactor"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessSystemClient](self, "brightnessSystemClient"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessFactor](self, "brightnessFactor"));
        objc_msgSend(v11, "setProperty:forKey:", v12, CFSTR("DisplayBrightnessFactor"));

        -[AmbientLightSensorDataController setBrightnessSystemClient:](self, "setBrightnessSystemClient:", 0);
        -[AmbientLightSensorDataController setBrightnessFactor:](self, "setBrightnessFactor:", 0);
      }
    }
  }
}

- (DAHIDEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_eventMonitor, a3);
}

- (int)ALSDataCount
{
  return self->_ALSDataCount;
}

- (void)setALSDataCount:(int)a3
{
  self->_ALSDataCount = a3;
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return self->_brightnessSystemClient;
}

- (void)setBrightnessSystemClient:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessSystemClient, a3);
}

- (id)brightnessFactor
{
  return self->_brightnessFactor;
}

- (void)setBrightnessFactor:(id)a3
{
  objc_storeStrong(&self->_brightnessFactor, a3);
}

- (DKBrightnessResponder)brightnessResponder
{
  return self->_brightnessResponder;
}

- (void)setBrightnessResponder:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessResponder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessResponder, 0);
  objc_storeStrong(&self->_brightnessFactor, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_eventMonitor, 0);
}

@end
