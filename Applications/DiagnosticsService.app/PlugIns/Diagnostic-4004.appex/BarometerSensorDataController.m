@implementation BarometerSensorDataController

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  dispatch_time_t v10;
  void *v11;
  _QWORD block[5];

  -[BarometerSensorDataController setBarometerDataCount:](self, "setBarometerDataCount:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
  -[BarometerSensorDataController setEventMonitor:](self, "setEventMonitor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BarometerSensorDataController eventMonitor](self, "eventMonitor"));
  objc_msgSend(v4, "setDelegate:", self);

  if ((-[BarometerSensorDataController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BarometerSensorDataController eventMonitor](self, "eventMonitor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_1000044D0));
    v7 = objc_msgSend(v5, "startMonitoringWithHIDEvents:", v6);

    if (v7
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[BarometerSensorDataController eventMonitor](self, "eventMonitor")),
          v9 = objc_msgSend(v8, "serviceClientSetPropertyValue:forKey:forHIDEvent:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 40000), CFSTR("ReportInterval"), 5), v8, v9))
    {
      v10 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100002664;
      block[3] = &unk_100004298;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BarometerSensorDataController result](self, "result"));
      objc_msgSend(v11, "setStatusCode:", &off_1000044E8);

      -[BarometerSensorDataController setFinished:](self, "setFinished:", 1);
    }
  }
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if ((-[BarometerSensorDataController isCancelled](self, "isCancelled") & 1) == 0
    && IOHIDEventGetType(a3) == 31)
  {
    IOHIDEventGetFloatValue(a3, 2031616);
    -[BarometerSensorDataController setBarometerDataCount:](self, "setBarometerDataCount:", -[BarometerSensorDataController barometerDataCount](self, "barometerDataCount") + 1);
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

  if ((-[BarometerSensorDataController isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[BarometerSensorDataController teardown](self, "teardown");
    v3 = -[BarometerSensorDataController barometerDataCount](self, "barometerDataCount");
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if (v3 < 1)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_100002A40(v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BarometerSensorDataController result](self, "result"));
      v8 = v7;
      v9 = &off_100004518;
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = -[BarometerSensorDataController barometerDataCount](self, "barometerDataCount");
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Barometer found. (%d)", (uint8_t *)v10, 8u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BarometerSensorDataController result](self, "result"));
      v8 = v7;
      v9 = &off_100004500;
    }
    objc_msgSend(v7, "setStatusCode:", v9);

  }
  -[BarometerSensorDataController setFinished:](self, "setFinished:", 1);
}

- (void)teardown
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BarometerSensorDataController eventMonitor](self, "eventMonitor"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BarometerSensorDataController eventMonitor](self, "eventMonitor"));
    v5 = objc_msgSend(v4, "currentlyMonitoring");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BarometerSensorDataController eventMonitor](self, "eventMonitor"));
      objc_msgSend(v6, "stopMonitoring");

    }
    -[BarometerSensorDataController setEventMonitor:](self, "setEventMonitor:", 0);
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

- (int)barometerDataCount
{
  return self->_barometerDataCount;
}

- (void)setBarometerDataCount:(int)a3
{
  self->_barometerDataCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMonitor, 0);
}

@end
