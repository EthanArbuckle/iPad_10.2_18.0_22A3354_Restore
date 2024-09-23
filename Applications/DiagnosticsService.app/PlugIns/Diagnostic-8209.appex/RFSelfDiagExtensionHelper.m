@implementation RFSelfDiagExtensionHelper

- (RFSelfDiagExtensionHelper)initWithDelegate:(id)a3
{
  id v4;
  char *v5;
  dispatch_group_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  BasebandRFDiagnostics *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __int128 v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFSelfDiagExtensionHelper;
  v5 = -[RFSelfDiagExtensionHelper init](&v16, "init");
  objc_msgSend(v5, "setDelegate:", v4);
  v6 = dispatch_group_create();
  v7 = *((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v6;
  if (v7)
    dispatch_release(v7);
  v8 = *((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = 0;
  if (v8)
  {
    dispatch_group_leave(v8);
    dispatch_release(v8);
  }
  v9 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = 0;

  BasebandRFDiagnostics::create(v10);
  v11 = (std::__shared_weak_count *)*((_QWORD *)v5 + 2);
  *(_OWORD *)(v5 + 8) = v15;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  *((_DWORD *)v5 + 14) = 0;
  v5[60] = 0;
  objc_msgSend(v5, "setFSensor:", 0, 0);

  return (RFSelfDiagExtensionHelper *)v5;
}

- (void)dealloc
{
  os_log_s *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "RFSelfDiagExtensionHelper dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)RFSelfDiagExtensionHelper;
  -[RFSelfDiagExtensionHelper dealloc](&v4, "dealloc");
}

- (void)resetAll
{
  DiagExtALSDataMonitor *fALSMonitor;
  DiagExtWifiScanner *fWifiScanner;
  BasebandRFDiagnostics *ptr;
  os_log_s *v6;
  uint8_t v7[16];

  fALSMonitor = self->fALSMonitor;
  if (fALSMonitor)
    -[DiagExtALSDataMonitor releaseALSClient](fALSMonitor, "releaseALSClient");
  fWifiScanner = self->fWifiScanner;
  if (fWifiScanner)
    -[DiagExtWifiScanner releaseWifiManagerClient](fWifiScanner, "releaseWifiManagerClient");
  ptr = self->fBasebandDiagnostics.__ptr_;
  if (ptr)
    BasebandRFDiagnostics::resetAll(ptr);
  v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "RFSelfDiagExtensionHelper reset", v7, 2u);
  }
}

- (void)setFactoryTest
{
  *((_BYTE *)&self->fGroupMonitorChamber.gr_gid + 4) = 1;
}

- (BOOL)initMonitorChamber:(int)a3 ALSThreshold:(unsigned int)a4
{
  uint64_t v4;
  unsigned int v6;
  uint64_t v7;
  DiagExtALSDataMonitor *v8;
  DiagExtALSDataMonitor *fALSMonitor;
  DiagExtALSDataMonitor *v10;
  os_log_s *v11;
  const char *v12;
  DiagExtWifiScanner *v13;
  DiagExtWifiScanner *fWifiScanner;
  DiagExtWifiScanner *v15;
  os_log_s *v16;
  const char *v17;
  BOOL result;
  int v19;
  const char *v20;

  v4 = *(_QWORD *)&a3;
  self->fGroupMonitorChamber.gr_gid = 0;
  if ((a3 & 1) != 0)
  {
    v7 = *(_QWORD *)&a4;
    v8 = -[DiagExtALSDataMonitor initWithDelegate:]([DiagExtALSDataMonitor alloc], "initWithDelegate:", self);
    fALSMonitor = self->fALSMonitor;
    self->fALSMonitor = v8;

    v10 = self->fALSMonitor;
    if (v10)
    {
      v6 = -[DiagExtALSDataMonitor setupALSClient](v10, "setupALSClient");
      -[DiagExtALSDataMonitor setEnclosedLimit:](self->fALSMonitor, "setEnclosedLimit:", v7);
    }
    else
    {
      v6 = 0;
    }
    v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "Faiiled";
      if (v6)
        v12 = "Success";
      v19 = 136315138;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "ALS Monitor initialzation: %s", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    v6 = 1;
  }
  if ((v4 & 2) == 0
    || !v6
    || ((v13 = -[DiagExtWifiScanner initWithDelegate:]([DiagExtWifiScanner alloc], "initWithDelegate:", self), fWifiScanner = self->fWifiScanner, self->fWifiScanner = v13, fWifiScanner, (v15 = self->fWifiScanner) == 0)? (v6 = 0): (v6 = -[DiagExtWifiScanner setupWifiManagerClient](v15, "setupWifiManagerClient")), v16 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler"), !os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT)))
  {
    if (!v6)
      return 0;
LABEL_21:
    -[RFSelfDiagExtensionHelper setFSensor:](self, "setFSensor:", v4);
    return 1;
  }
  v17 = "Faiiled";
  if (v6)
    v17 = "Success";
  v19 = 136315138;
  v20 = v17;
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Wifi Scanner initialzation: %s", (uint8_t *)&v19, 0xCu);
  result = 0;
  if ((v6 & 1) != 0)
    goto LABEL_21;
  return result;
}

- (BOOL)isTestSupported:(int)a3
{
  unsigned int v3;
  char isRFTestSupported;
  os_log_s *v5;
  uint8_t v7[16];

  v3 = 0x2020101u >> (8 * a3);
  if (a3 >= 4)
    LOBYTE(v3) = 0;
  isRFTestSupported = BasebandRFDiagnostics::isRFTestSupported(self->fBasebandDiagnostics.__ptr_, v3 & 3);
  if ((isRFTestSupported & 1) == 0)
  {
    v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Test is not supported on this device", v7, 2u);
    }
  }
  return isRFTestSupported;
}

- (BOOL)prepareSetupForTest
{
  os_log_s *v3;
  unsigned int v4;
  os_log_s *v5;
  _BOOL4 v6;
  unsigned int v7;
  os_log_s *v8;
  os_log_s *v9;
  _DWORD v11[2];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Prepare setup for testing", (uint8_t *)v11, 2u);
  }
  v4 = +[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive");
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  v6 = os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Testing started in CB: disable network reconnect", (uint8_t *)v11, 2u);
    }
    +[CBSUtilities disableNetworkReconnect](CBSUtilities, "disableNetworkReconnect");
  }
  else if (v6)
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Testing started in SB", (uint8_t *)v11, 2u);
  }
  if (-[RFSelfDiagExtensionHelper fSensor](self, "fSensor")
    && (-[RFSelfDiagExtensionHelper fSensor](self, "fSensor") & 2) != 0)
  {
    v7 = -[DiagExtWifiScanner scanAndGetWifiAvailability:](self->fWifiScanner, "scanAndGetWifiAvailability:", 60);
    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Wifi Availability Current state is %D", (uint8_t *)v11, 8u);
    }
    if (v7 != 2)
      return 0;
    v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Disable wifi auto-join", (uint8_t *)v11, 2u);
    }
    -[DiagExtWifiScanner disableAutoJoin](self->fWifiScanner, "disableAutoJoin");
  }
  return 1;
}

- (void)restoreSetup
{
  os_log_s *v3;
  os_log_s *v4;
  os_log_s *v5;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Restore setup", buf, 2u);
  }
  if ((-[RFSelfDiagExtensionHelper fSensor](self, "fSensor") & 2) != 0 && self->fWifiScanner)
  {
    v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "Enable wifi auto-join", v7, 2u);
    }
    -[DiagExtWifiScanner enableAutoJoin](self->fWifiScanner, "enableAutoJoin");
  }
  if (+[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive"))
  {
    v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Enable CB network reconnect", v6, 2u);
    }
    +[CBSUtilities enableNetworkReconnect](CBSUtilities, "enableNetworkReconnect");
  }
}

- (void)stopMonitorChamber
{
  os_log_s *v3;
  DiagExtWifiScanner *fWifiScanner;
  DiagExtALSDataMonitor *fALSMonitor;
  char *gr_passwd;
  uint8_t v7[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Stop monitoring chamber", v7, 2u);
  }
  fWifiScanner = self->fWifiScanner;
  if (fWifiScanner)
    -[DiagExtWifiScanner stopMonitoring](fWifiScanner, "stopMonitoring");
  fALSMonitor = self->fALSMonitor;
  if (fALSMonitor)
    -[DiagExtALSDataMonitor stopMonitoring](fALSMonitor, "stopMonitoring");
  gr_passwd = self->fGroupMonitorChamber.gr_passwd;
  self->fGroupMonitorChamber.gr_passwd = 0;
  if (gr_passwd)
  {
    dispatch_group_leave((dispatch_group_t)gr_passwd);
    dispatch_release((dispatch_object_t)gr_passwd);
  }
  -[RFSelfDiagExtensionHelper setFMonitoring:](self, "setFMonitoring:", 0);
}

- (BOOL)startMonitorChamberOpen
{
  os_log_s *v3;
  unsigned int v4;
  BOOL result;
  unsigned int v6;
  unint64_t v7;
  uint8_t v8[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Start monitoring chamber Opened", v8, 2u);
    v6 = -[RFSelfDiagExtensionHelper updateEnclosedCheckRunningFlag:](self, "updateEnclosedCheckRunningFlag:", 0);
    result = 0;
    if (!v6)
      return result;
  }
  else
  {
    v4 = -[RFSelfDiagExtensionHelper updateEnclosedCheckRunningFlag:](self, "updateEnclosedCheckRunningFlag:", 0);
    result = 0;
    if (!v4)
      return result;
  }
  -[RFSelfDiagExtensionHelper setFMonitoring:](self, "setFMonitoring:", 1);
  if ((-[RFSelfDiagExtensionHelper fSensor](self, "fSensor") & 1) != 0
    && !-[DiagExtALSDataMonitor startMonitoring](self->fALSMonitor, "startMonitoring"))
  {
    goto LABEL_11;
  }
  if ((-[RFSelfDiagExtensionHelper fSensor](self, "fSensor") & 2) == 0)
    return 1;
  LODWORD(v7) = self->testConfig.override_detectChamberSensor;
  if (-[DiagExtWifiScanner startMonitoring:](self->fWifiScanner, "startMonitoring:", (double)v7))
    return 1;
LABEL_11:
  -[RFSelfDiagExtensionHelper stopMonitorChamber](self, "stopMonitorChamber");
  return 0;
}

- (BOOL)updateEnclosedCheckRunningFlag:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  unsigned int v6;
  int v7;
  os_log_s *v8;
  gid_t gr_gid;
  unsigned int v10;
  unsigned int v11;
  int v12;
  os_log_s *v13;
  gid_t v14;
  os_log_s *v15;
  const char *v17;
  gid_t v18;
  int v19;
  gid_t v20;
  __int16 v21;
  const char *v22;

  v3 = a3;
  self->fGroupMonitorChamber.gr_gid = 0;
  if ((-[RFSelfDiagExtensionHelper fSensor](self, "fSensor") & 1) != 0)
  {
    v5 = -[DiagExtALSDataMonitor currentALSEnclosedState](self->fALSMonitor, "currentALSEnclosedState");
    v6 = v5;
    if (v3)
      v7 = 1;
    else
      v7 = 2;
    if (v5 != v7)
      ++self->fGroupMonitorChamber.gr_gid;
    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      gr_gid = self->fGroupMonitorChamber.gr_gid;
      v19 = 67109376;
      v20 = v6;
      v21 = 1024;
      LODWORD(v22) = gr_gid;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "ALS current=%d, monitoring flag=%d", (uint8_t *)&v19, 0xEu);
    }
  }
  if ((-[RFSelfDiagExtensionHelper fSensor](self, "fSensor") & 2) != 0)
  {
    v10 = -[DiagExtWifiScanner currentWifiAvailabilityState](self->fWifiScanner, "currentWifiAvailabilityState");
    v11 = v10;
    if (v3)
      v12 = 1;
    else
      v12 = 2;
    if (v10 != v12)
      self->fGroupMonitorChamber.gr_gid += 2;
    v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->fGroupMonitorChamber.gr_gid;
      v19 = 67109376;
      v20 = v11;
      v21 = 1024;
      LODWORD(v22) = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Reachability current=%d, monitoring flag=%d", (uint8_t *)&v19, 0xEu);
    }
  }
  v15 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = "Opened";
    v18 = self->fGroupMonitorChamber.gr_gid;
    if (v3)
      v17 = "Closed";
    v19 = 67109378;
    v20 = v18;
    v21 = 2080;
    v22 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEBUG, "Update monitoring flag to 0x%x. target state=%s", (uint8_t *)&v19, 0x12u);
  }
  return self->fGroupMonitorChamber.gr_gid != 0;
}

- (BOOL)waitForChamberClosed:(unsigned int)a3
{
  os_log_s *v5;
  unint64_t v6;
  gid_t gr_gid;
  int64_t v8;
  char *v9;
  dispatch_time_t v10;
  os_log_s *v11;
  BOOL v12;
  char *gr_name;
  char *gr_passwd;
  BOOL v16;
  os_log_s *v17;
  _BOOL4 v18;
  gid_t v19;
  int v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109376;
    v21 = a3;
    v22 = 1024;
    v23 = -[RFSelfDiagExtensionHelper fSensor](self, "fSensor");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Waiting for Chamber Clossed: waitTime=%d, sensor=%d", (uint8_t *)&v20, 0xEu);
  }
  if (!-[RFSelfDiagExtensionHelper updateEnclosedCheckRunningFlag:](self, "updateEnclosedCheckRunningFlag:", 1))
    return 1;
  -[RFSelfDiagExtensionHelper setFMonitoring:](self, "setFMonitoring:", 2);
  gr_gid = self->fGroupMonitorChamber.gr_gid;
  if ((gr_gid & 1) != 0)
  {
    if (!-[DiagExtALSDataMonitor startMonitoring](self->fALSMonitor, "startMonitoring"))
      goto LABEL_13;
    gr_gid = self->fGroupMonitorChamber.gr_gid;
  }
  if ((gr_gid & 2) == 0
    || (LODWORD(v6) = self->testConfig.override_detectChamberSensor,
        -[DiagExtWifiScanner startMonitoring:](self->fWifiScanner, "startMonitoring:", (double)v6)))
  {
    if (!self->fGroupMonitorChamber.gr_passwd)
    {
      gr_name = self->fGroupMonitorChamber.gr_name;
      if (gr_name)
      {
        dispatch_retain((dispatch_object_t)self->fGroupMonitorChamber.gr_name);
        dispatch_group_enter((dispatch_group_t)gr_name);
        gr_passwd = self->fGroupMonitorChamber.gr_passwd;
        self->fGroupMonitorChamber.gr_passwd = gr_name;
        if (gr_passwd)
        {
          dispatch_group_leave((dispatch_group_t)gr_passwd);
          dispatch_release((dispatch_object_t)gr_passwd);
        }
      }
      else
      {
        self->fGroupMonitorChamber.gr_passwd = 0;
      }
    }
    v8 = 1000000000 * a3;
    v9 = self->fGroupMonitorChamber.gr_name;
    v10 = dispatch_time(0, v8);
    if (dispatch_group_wait((dispatch_group_t)v9, v10))
    {
      v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        v19 = self->fGroupMonitorChamber.gr_gid;
        v20 = 67109120;
        v21 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "Chamber is still Open: MonitoringFlag=%d", (uint8_t *)&v20, 8u);
      }
    }
    else
    {
      v16 = self->fGroupMonitorChamber.gr_gid == 0;
      v17 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      v18 = os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Chamber is ready", (uint8_t *)&v20, 2u);
        }
        v12 = 1;
        goto LABEL_14;
      }
      if (v18)
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Chamber monitor stopped", (uint8_t *)&v20, 2u);
      }
    }
  }
LABEL_13:
  v12 = 0;
LABEL_14:
  -[RFSelfDiagExtensionHelper stopMonitorChamber](self, "stopMonitorChamber");
  return v12;
}

- (void)handleALSEnclosedEvent:(int)a3
{
  os_log_s *v5;
  gid_t gr_gid;
  unsigned int v7;
  char *gr_passwd;
  gid_t v9;
  os_log_s *v10;
  unsigned int v11;
  os_log_s *v12;
  void *v13;
  os_log_s *v14;
  char *v15;
  _DWORD v16[2];
  __int16 v17;
  gid_t v18;

  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    gr_gid = self->fGroupMonitorChamber.gr_gid;
    v16[0] = 67109376;
    v16[1] = a3;
    v17 = 1024;
    v18 = gr_gid;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Received ALS event w/ state=%d, monitoring flag=%d", (uint8_t *)v16, 0xEu);
  }
  if (-[RFSelfDiagExtensionHelper fMonitoring](self, "fMonitoring") && (self->fGroupMonitorChamber.gr_gid & 1) != 0)
  {
    v7 = -[RFSelfDiagExtensionHelper fMonitoring](self, "fMonitoring");
    if (a3 == 1 && v7 == 2)
    {
      gr_passwd = self->fGroupMonitorChamber.gr_passwd;
      v9 = self->fGroupMonitorChamber.gr_gid - 1;
      self->fGroupMonitorChamber.gr_gid = v9;
      if (v9)
      {
        if (gr_passwd)
        {
          v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
          if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v16[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Wait for other sensor to declare Chamber Closed", (uint8_t *)v16, 2u);
          }
        }
      }
      else if (gr_passwd)
      {
        v14 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Chamber closed. Stop monitoring", (uint8_t *)v16, 2u);
        }
        v15 = self->fGroupMonitorChamber.gr_passwd;
        self->fGroupMonitorChamber.gr_passwd = 0;
        if (v15)
        {
          dispatch_group_leave((dispatch_group_t)v15);
          dispatch_release((dispatch_object_t)v15);
        }
      }
    }
    else
    {
      v11 = -[RFSelfDiagExtensionHelper fMonitoring](self, "fMonitoring");
      if (a3 == 2 && v11 == 1)
      {
        v12 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Chamber opened. Stop monitoring", (uint8_t *)v16, 2u);
        }
        --self->fGroupMonitorChamber.gr_gid;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagExtensionHelper delegate](self, "delegate"));
        objc_msgSend(v13, "handleChamberOpenEvent:", 1);

      }
    }
  }
}

- (void)handleWifiAvailabilityEvent:(int)a3
{
  os_log_s *v5;
  gid_t gr_gid;
  unsigned int v7;
  char *gr_passwd;
  gid_t v9;
  os_log_s *v10;
  unsigned int v11;
  void *v12;
  os_log_s *v13;
  char *v14;
  _DWORD v15[2];
  __int16 v16;
  gid_t v17;

  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    gr_gid = self->fGroupMonitorChamber.gr_gid;
    v15[0] = 67109376;
    v15[1] = a3;
    v16 = 1024;
    v17 = gr_gid;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Received wifi availability event w/ state=%d, monitoring flag=%d", (uint8_t *)v15, 0xEu);
  }
  if (-[RFSelfDiagExtensionHelper fMonitoring](self, "fMonitoring") && (self->fGroupMonitorChamber.gr_gid & 2) != 0)
  {
    v7 = -[RFSelfDiagExtensionHelper fMonitoring](self, "fMonitoring");
    if (a3 == 1 && v7 == 2)
    {
      gr_passwd = self->fGroupMonitorChamber.gr_passwd;
      v9 = self->fGroupMonitorChamber.gr_gid - 2;
      self->fGroupMonitorChamber.gr_gid = v9;
      if (v9)
      {
        if (gr_passwd)
        {
          v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
          if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v15[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Wait for other sensor to detect Chamber Closed", (uint8_t *)v15, 2u);
          }
        }
      }
      else if (gr_passwd)
      {
        v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Chamber closed. Stop monitoring", (uint8_t *)v15, 2u);
        }
        v14 = self->fGroupMonitorChamber.gr_passwd;
        self->fGroupMonitorChamber.gr_passwd = 0;
        if (v14)
        {
          dispatch_group_leave((dispatch_group_t)v14);
          dispatch_release((dispatch_object_t)v14);
        }
      }
    }
    else
    {
      v11 = -[RFSelfDiagExtensionHelper fMonitoring](self, "fMonitoring");
      if (a3 == 2 && v11 == 1)
      {
        self->fGroupMonitorChamber.gr_gid -= 2;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagExtensionHelper delegate](self, "delegate"));
        objc_msgSend(v12, "handleChamberOpenEvent:", 2);

      }
    }
  }
}

- (BOOL)addAWDConfiguration:(int)a3
{
  void *v5;
  void *v6;
  int RadioType;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  char *v15;
  BasebandRFDiagnostics *ptr;
  _QWORD *v17;
  uint64_t v18;
  os_log_s *v19;
  BOOL v20;
  os_log_s *v21;
  const char *v22;
  uint8_t v24[8];
  _QWORD v25[3];
  _QWORD *v26;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.DiagnosticsService.Diagnostic-8209")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleURL"));

  RadioType = BasebandDiagnostics::getRadioType((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
  if (RadioType)
  {
    if (RadioType != 1)
    {
      v19 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "Failed to get awd deviceconfig: unknown baseband", v24, 2u);
      }
      goto LABEL_15;
    }
    if ((a3 & 0xFFFFFFFE) == 2)
      v8 = CFSTR("mav-desense-rf-self-test-result.deviceconfig");
    else
      v8 = CFSTR("mav-rf-self-test-result.deviceconfig");
  }
  else
  {
    v8 = CFSTR("ice-rf-self-test-result.deviceconfig");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v8, 0));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:", v11);
    v13 = objc_msgSend(v12, "length");
    v14 = (unint64_t)v13;
    if (v13)
    {
      v15 = (char *)operator new[]((size_t)v13);
      objc_msgSend(v12, "getBytes:length:", v15, v14);
      BasebandDiagnostics::removeAWDConfig((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
      if (BasebandDiagnostics::addAWDConfigPayload((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_, v15, v14))
      {
        ptr = self->fBasebandDiagnostics.__ptr_;
        v25[0] = off_100010470;
        v25[1] = self;
        v26 = v25;
        BasebandDiagnostics::registerAWDMetricHandler(ptr, v25);
        v17 = v26;
        if (v26 == v25)
        {
          v18 = 4;
          v17 = v25;
        }
        else
        {
          if (!v26)
          {
LABEL_23:
            v20 = 1;
            goto LABEL_24;
          }
          v18 = 5;
        }
        (*(void (**)(void))(*v17 + 8 * v18))();
        goto LABEL_23;
      }
      v21 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      v20 = 0;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        v22 = "Failed to add AWD config to Baseband";
        goto LABEL_20;
      }
    }
    else
    {
      v21 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      v20 = 0;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        v22 = "Failed to read AWD Config file";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, v22, v24, 2u);
        v20 = 0;
      }
    }
LABEL_24:

    goto LABEL_25;
  }
LABEL_15:
  v20 = 0;
LABEL_25:

  return v20;
}

- (BOOL)removeAWDConfiguration
{
  return BasebandDiagnostics::removeAWDConfig((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
}

- (BOOL)startBasebandRFSelfTest:(unsigned int)a3 TestCommand:(unsigned int)a4
{
  uint64_t v5;
  int RadioType;
  uint64_t started;
  uint64_t v9;
  uint64_t v10;
  os_log_s *v11;
  os_log_s *v12;
  os_log_s *v13;
  os_log_s *v14;
  uint64_t v15;
  int v17;
  uint64_t v18;

  v5 = *(_QWORD *)&a3;
  RadioType = BasebandDiagnostics::getRadioType((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
  if (RadioType != 1)
  {
    if (!RadioType)
    {
      started = BasebandRFDiagnostics::startBasebandRFSelfTestAST2Mode(self->fBasebandDiagnostics.__ptr_);
      goto LABEL_10;
    }
    v12 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "Failed to start: unknown baseband", (uint8_t *)&v17, 2u);
    }
    v10 = 9;
    v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      return (_DWORD)v10 == 0;
LABEL_23:
    v15 = BasebandRFDiagnostics::asString(v10);
    v17 = 136315138;
    v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Start RF Self Test:  %s", (uint8_t *)&v17, 0xCu);
    return (_DWORD)v10 == 0;
  }
  if (!*((_BYTE *)&self->fGroupMonitorChamber.gr_gid + 4))
  {
    v10 = BasebandRFDiagnostics::setBasebandRFSelfTestTicket(self->fBasebandDiagnostics.__ptr_);
    v14 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = BasebandRFDiagnostics::asString(v10);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_ERROR, "Set RF Self Test Ticket: %s", (uint8_t *)&v17, 0xCu);
      if (!(_DWORD)v10)
        goto LABEL_5;
    }
    else if (!(_DWORD)v10)
    {
      goto LABEL_5;
    }
    v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      return (_DWORD)v10 == 0;
    goto LABEL_23;
  }
LABEL_5:
  if (-[RFSelfDiagExtensionHelper setBasebandFTM](self, "setBasebandFTM"))
  {
    if ((a4 & 0xFFFFFFFE) == 2)
      v9 = 2;
    else
      v9 = 1;
    started = BasebandRFDiagnostics::startBasebandRFSelfTestFTMMode(self->fBasebandDiagnostics.__ptr_, v5, v9);
LABEL_10:
    v10 = started;
    v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      return (_DWORD)v10 == 0;
    goto LABEL_23;
  }
  v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v17) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_ERROR, "Failed to set to FTM", (uint8_t *)&v17, 2u);
  }
  v10 = 8;
  v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    goto LABEL_23;
  return (_DWORD)v10 == 0;
}

- (BOOL)setBasebandFTM
{
  return BasebandDiagnostics::updateBasebandOperatingMode(self->fBasebandDiagnostics.__ptr_, 2, 0, 0);
}

- (unsigned)getBasebandResultWaitTime
{
  unsigned int result;

  result = BasebandRFDiagnostics::getBasebandEstimatedTestTime(self->fBasebandDiagnostics.__ptr_);
  if (!result)
    return *(_DWORD *)&self->testConfig.overrideTestConfigEnable;
  return result;
}

- (BOOL)resetBaseband:(BOOL)a3
{
  _BOOL8 v3;
  BasebandRFDiagnostics *ptr;
  BOOL result;
  BOOL v6;
  void *__p;
  __int128 v8;

  v3 = a3;
  ptr = self->fBasebandDiagnostics.__ptr_;
  __p = operator new(0x40uLL);
  v8 = xmmword_10000D370;
  strcpy((char *)__p, "RF Self Test: RFSelfDiag extension triggers baseband reset");
  result = BasebandDiagnostics::resetBaseband(ptr, &__p, v3);
  v6 = result;
  if (SHIBYTE(v8) < 0)
  {
    operator delete(__p);
    return v6;
  }
  return result;
}

- (BOOL)recoverBasebandState:(BOOL)a3
{
  _BOOL8 v3;
  int RadioType;
  os_log_s *v6;
  os_log_s *v7;
  int updated;
  const char *v9;
  NSObject *v10;
  dispatch_time_t v11;
  os_log_s *v12;
  BasebandRFDiagnostics *ptr;
  char v14;
  os_log_s *v15;
  _BYTE __p[24];

  v3 = a3;
  RadioType = BasebandDiagnostics::getRadioType((BasebandDiagnostics *)self->fBasebandDiagnostics.__ptr_);
  if (RadioType == 1)
  {
    if (!v3)
    {
      v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        updated = BasebandDiagnostics::updateBasebandOperatingMode(self->fBasebandDiagnostics.__ptr_, 0, 0, 0);
        v9 = "Failed";
        if (updated)
          v9 = "Success";
        *(_DWORD *)__p = 136315138;
        *(_QWORD *)&__p[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Set to baseband online: %s", __p, 0xCu);
      }
      v10 = dispatch_semaphore_create(0);
      v11 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v10, v11))
      {
        v12 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__p = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Trigger reset baseband", __p, 2u);
        }
      }
    }
    goto LABEL_14;
  }
  if (!RadioType)
  {
    v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Trigger reset baseband", __p, 2u);
    }
LABEL_14:
    ptr = self->fBasebandDiagnostics.__ptr_;
    *(_QWORD *)__p = operator new(0x40uLL);
    *(_OWORD *)&__p[8] = xmmword_10000D370;
    strcpy(*(char **)__p, "RF Self Test: RFSelfDiag extension triggers baseband reset");
    v14 = BasebandDiagnostics::resetBaseband(ptr, __p, v3);
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    return v14;
  }
  v15 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__p = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_ERROR, "Failed to recover baseband: unknown baseband", __p, 2u);
  }
  return 0;
}

- (BOOL)loadTestConfigFromUserDefaults
{
  BasebandRFDiagnostics *ptr;
  BasebandRFDiagnostics *v4;
  int IntegerFromUserDefaults;
  BasebandRFDiagnostics *v6;
  int v7;
  int v8;
  BasebandRFDiagnostics *v9;
  int v10;
  int v11;
  BasebandRFDiagnostics *v12;
  int v13;
  int v14;
  BasebandRFDiagnostics *v15;
  BasebandRFDiagnostics *v16;
  os_log_s *v17;
  int gr_mem_low;
  os_log_s *v19;
  int gr_mem_high;
  int fObj;
  int fObj_high;
  int fEnclosedCheckRunningFlag;
  _BOOL4 fFactoryTestEnabled;
  int v25;
  BasebandRFDiagnostics *v26;
  int v27;
  int v28;
  BasebandRFDiagnostics *v29;
  int v30;
  unsigned int v31;
  os_log_s *v32;
  int v33;
  unsigned int override_detectChamberSensor;
  _BYTE __p[26];
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  int v40;

  ptr = self->fBasebandDiagnostics.__ptr_;
  *(_QWORD *)__p = operator new(0x20uLL);
  *(_OWORD *)&__p[8] = xmmword_10000D380;
  strcpy(*(char **)__p, "overrideTestConfigEnable");
  LOBYTE(self->fGroupMonitorChamber.gr_mem) = BasebandDiagnostics::readIntegerFromUserDefaults(ptr, __p) != 0;
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  v4 = self->fBasebandDiagnostics.__ptr_;
  *(_QWORD *)__p = operator new(0x20uLL);
  *(_OWORD *)&__p[8] = xmmword_10000D390;
  strcpy(*(char **)__p, "override_detectChamberReady");
  IntegerFromUserDefaults = BasebandDiagnostics::readIntegerFromUserDefaults(v4, __p);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  HIDWORD(self->fGroupMonitorChamber.gr_mem) = IntegerFromUserDefaults & ~(IntegerFromUserDefaults >> 31);
  v6 = self->fBasebandDiagnostics.__ptr_;
  *(_QWORD *)__p = operator new(0x20uLL);
  *(_OWORD *)&__p[8] = xmmword_10000D3A0;
  strcpy(*(char **)__p, "override_closeChamberCountdown");
  v7 = BasebandDiagnostics::readIntegerFromUserDefaults(v6, __p);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (v7 >= 1)
    v8 = v7;
  else
    v8 = 120;
  LODWORD(self->fSessionMonitorChamber.fObj.fObj) = v8;
  v9 = self->fBasebandDiagnostics.__ptr_;
  __p[23] = 21;
  strcpy(__p, "override_ALSThreshold");
  v10 = BasebandDiagnostics::readIntegerFromUserDefaults(v9, __p);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (v10 >= 1)
    v11 = v10;
  else
    v11 = 4;
  HIDWORD(self->fSessionMonitorChamber.fObj.fObj) = v11;
  v12 = self->fBasebandDiagnostics.__ptr_;
  *(_QWORD *)__p = operator new(0x20uLL);
  *(_OWORD *)&__p[8] = xmmword_10000D3A0;
  strcpy(*(char **)__p, "override_testCompleteAlertTime");
  v13 = BasebandDiagnostics::readIntegerFromUserDefaults(v12, __p);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (v13 >= 1)
    v14 = v13;
  else
    v14 = 300;
  self->fEnclosedCheckRunningFlag = v14;
  v15 = self->fBasebandDiagnostics.__ptr_;
  *(_QWORD *)__p = operator new(0x19uLL);
  *(_OWORD *)&__p[8] = xmmword_10000D3B0;
  strcpy(*(char **)__p, "override_vibrationAlert");
  self->fFactoryTestEnabled = BasebandDiagnostics::readIntegerFromUserDefaults(v15, __p) != 0;
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  v16 = self->fBasebandDiagnostics.__ptr_;
  __p[23] = 19;
  strcpy(__p, "override_chimeAlert");
  *(&self->fFactoryTestEnabled + 1) = BasebandDiagnostics::readIntegerFromUserDefaults(v16, __p) != 0;
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  v17 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    gr_mem_low = LOBYTE(self->fGroupMonitorChamber.gr_mem);
    *(_DWORD *)__p = 67109120;
    *(_DWORD *)&__p[4] = gr_mem_low;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Test config: overrides test config enabled = %d", __p, 8u);
  }
  if (LOBYTE(self->fGroupMonitorChamber.gr_mem))
  {
    v19 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      gr_mem_high = HIDWORD(self->fGroupMonitorChamber.gr_mem);
      fObj = (int)self->fSessionMonitorChamber.fObj.fObj;
      fObj_high = HIDWORD(self->fSessionMonitorChamber.fObj.fObj);
      fEnclosedCheckRunningFlag = self->fEnclosedCheckRunningFlag;
      fFactoryTestEnabled = self->fFactoryTestEnabled;
      v25 = *((unsigned __int8 *)&self->fFactoryTestEnabled + 1);
      *(_DWORD *)__p = 67110400;
      *(_DWORD *)&__p[4] = gr_mem_high;
      *(_WORD *)&__p[8] = 1024;
      *(_DWORD *)&__p[10] = fObj;
      *(_WORD *)&__p[14] = 1024;
      *(_DWORD *)&__p[16] = fObj_high;
      *(_WORD *)&__p[20] = 1024;
      *(_DWORD *)&__p[22] = fEnclosedCheckRunningFlag;
      v37 = 1024;
      v38 = fFactoryTestEnabled;
      v39 = 1024;
      v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "\tdetectChamberReady=%d, closeChamberCountdown=%d, ALSThreshold=%d, testCompleteAlertTime=%d, vibrationAlert=%d, chimeAlert=%d", __p, 0x26u);
    }
  }
  v26 = self->fBasebandDiagnostics.__ptr_;
  strcpy(__p, "basebandResultWaitTime");
  __p[23] = 22;
  v27 = BasebandDiagnostics::readIntegerFromUserDefaults(v26, __p);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (v27 >= 1)
    v28 = v27;
  else
    v28 = 120;
  *(_DWORD *)&self->testConfig.overrideTestConfigEnable = v28;
  v29 = self->fBasebandDiagnostics.__ptr_;
  __p[23] = 16;
  strcpy(__p, "wifiScanInterval");
  v30 = BasebandDiagnostics::readIntegerFromUserDefaults(v29, __p);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (v30 >= 1)
    v31 = v30;
  else
    v31 = 8;
  self->testConfig.override_detectChamberSensor = v31;
  v32 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = *(_DWORD *)&self->testConfig.overrideTestConfigEnable;
    override_detectChamberSensor = self->testConfig.override_detectChamberSensor;
    *(_DWORD *)__p = 67109376;
    *(_DWORD *)&__p[4] = v33;
    *(_WORD *)&__p[8] = 1024;
    *(_DWORD *)&__p[10] = override_detectChamberSensor;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "Test config: basebandResultWaitTime=%d, wifiScanInterval=%d", __p, 0xEu);
  }
  return (BOOL)self->fGroupMonitorChamber.gr_mem;
}

- (TestConfigFlag)testConfiguration
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].override_testCompleteAlertTime;
  *(_OWORD *)&retstr->overrideTestConfigEnable = *(_OWORD *)&self[2].overrideTestConfigEnable;
  *(_OWORD *)&retstr->override_testCompleteAlertTime = v3;
  return self;
}

- (RFSelfDiagExtensionHelperDelegate)delegate
{
  return (RFSelfDiagExtensionHelperDelegate *)objc_loadWeakRetained((id *)&self->testConfig.override_testCompleteAlertTime);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->testConfig.override_testCompleteAlertTime, a3);
}

- (int)fMonitoring
{
  return self->testConfig.override_detectChamberReadyWaitTime;
}

- (void)setFMonitoring:(int)a3
{
  self->testConfig.override_detectChamberReadyWaitTime = a3;
}

- (int)fSensor
{
  return self->testConfig.override_detectChamberReadyALSThreshold;
}

- (void)setFSensor:(int)a3
{
  self->testConfig.override_detectChamberReadyALSThreshold = a3;
}

- (void).cxx_destruct
{
  char *gr_passwd;
  char *v4;
  char *gr_name;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;

  objc_destroyWeak((id *)&self->testConfig.override_testCompleteAlertTime);
  gr_passwd = self->fGroupMonitorChamber.gr_passwd;
  if (gr_passwd)
  {
    dispatch_group_leave((dispatch_group_t)gr_passwd);
    v4 = self->fGroupMonitorChamber.gr_passwd;
    if (v4)
      dispatch_release((dispatch_object_t)v4);
  }
  gr_name = self->fGroupMonitorChamber.gr_name;
  if (gr_name)
    dispatch_release((dispatch_object_t)gr_name);
  objc_storeStrong((id *)&self->fWifiScanner, 0);
  objc_storeStrong((id *)&self->fALSMonitor, 0);
  cntrl = self->fBasebandDiagnostics.__cntrl_;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
