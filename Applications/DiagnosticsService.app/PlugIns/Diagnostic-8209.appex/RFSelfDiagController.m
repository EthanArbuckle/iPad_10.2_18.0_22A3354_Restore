@implementation RFSelfDiagController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  os_log_s *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;

  -[RFSelfDiagController setInputs:](self, "setInputs:", a3, a4);
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    v7 = objc_msgSend(v6, "command");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    v9 = objc_msgSend(v8, "measureType");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    v11 = objc_msgSend(v10, "detectChamberReadyWaitTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    v13[0] = 67109888;
    v13[1] = v7;
    v14 = 1024;
    v15 = v9;
    v16 = 1024;
    v17 = v11;
    v18 = 1024;
    v19 = objc_msgSend(v12, "detectChamberSensor");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Setup parameters: command(%d), measureType(%d), detectChamberReadyWaitTime(%dsec), detectChamberSensor(%x)", (uint8_t *)v13, 0x1Au);

  }
  -[RFSelfDiagController setFinished:](self, "setFinished:", 0);
}

- (void)abortTesting:(int64_t)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  os_log_s *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  os_log_s *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  unsigned int v17;

  switch(a3)
  {
    case 0:
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010AA8);
      v5 = CFSTR("Failed to Start");
      goto LABEL_14;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010AC0);
      v5 = CFSTR("Chamber is opened");
      goto LABEL_14;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010AD8);
      v5 = CFSTR("Failed to add AWD configuration");
      goto LABEL_14;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010AD8);
      v5 = CFSTR("Failed to register RF Self Test data event");
      goto LABEL_14;
    case 5:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010AD8);
      v5 = CFSTR("Failed to set FactoryTest mode");
      goto LABEL_14;
    case 7:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010AD8);
      v5 = CFSTR("Failed to start Baseband RF self test");
      goto LABEL_14;
    case 8:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v6, "setStatusCode:", &off_100010A90);

      v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
        return;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusCode"));
      v14 = 67109120;
      LODWORD(v15) = objc_msgSend(v9, "intValue");
      v10 = "[RFSelfTest] Received RF Self test result from baseband, statusCode=%d";
      v11 = v7;
      v12 = 8;
      goto LABEL_16;
    case 9:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010AF0);
      v5 = CFSTR("Failed to get test result from Baseband in time");
      goto LABEL_14;
    case 10:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010B08);
      v5 = CFSTR("Failed to recover baseband after test result received");
      goto LABEL_14;
    case 12:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010B20);
      v5 = CFSTR("Test not supported");
      goto LABEL_14;
    default:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      objc_msgSend(v4, "setStatusCode:", &off_100010B38);
      v5 = CFSTR("Other failiure");
LABEL_14:

      v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
        return;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusCode"));
      v14 = 138412546;
      v15 = v5;
      v16 = 1024;
      v17 = objc_msgSend(v9, "intValue");
      v10 = "[RFSelfTest] Abort test with error: %@, statusCode=%d";
      v11 = v13;
      v12 = 18;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);

      return;
  }
}

- (void)runRFSelfDiag
{
  RFSelfDiagExtensionHelper *fDiagHelper;
  uint64_t v4;
  void *v5;
  RFSelfDiagExtensionHelper *v6;
  uint64_t v7;
  void *v8;
  RFSelfDiagExtensionHelper *v9;
  uint64_t v10;
  void *v11;
  RFSelfDiagExtensionHelper *v12;
  uint64_t v13;
  void *v14;
  RFSelfDiagExtensionHelper *v15;
  int v16;
  _BOOL8 v17;
  void *v18;
  RFSelfDiagExtensionHelper *v19;
  int v20;
  _BOOL8 v21;
  void *v22;
  os_log_s *v23;
  void *v24;
  RFSelfDiagExtensionHelper *v25;
  void *v26;
  RFSelfDiagController *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v32;
  RFSelfDiagExtensionHelper *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  unsigned int v38;
  _BOOL4 v39;
  os_log_s *v40;
  _BOOL4 v41;
  void *v42;
  RFSelfDiagExtensionHelper *v43;
  void *v44;
  _BOOL8 v45;
  dispatch_semaphore_s *v46;
  dispatch_time_t v47;
  const char *v48;
  RFSelfDiagExtensionHelper *v49;
  void *v50;
  os_log_s *v51;
  RFSelfDiagExtensionHelper *v52;
  void *v53;
  id v54;
  void *v55;
  unsigned int v56;
  os_log_s *v57;
  void *v58;
  unsigned int v59;
  dispatch_semaphore_s *v60;
  dispatch_time_t v61;
  int64_t diagState;
  os_log_s *v63;
  const char *v64;
  os_log_s *v65;
  const char *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  const char *v80;

  if (-[RFSelfDiagExtensionHelper loadTestConfigFromUserDefaults](self->fDiagHelper, "loadTestConfigFromUserDefaults"))
  {
    fDiagHelper = self->fDiagHelper;
    if (fDiagHelper)
    {
      -[RFSelfDiagExtensionHelper testConfiguration](fDiagHelper, "testConfiguration");
      v4 = DWORD1(v77);
    }
    else
    {
      v4 = 0;
      v77 = 0u;
      v78 = 0u;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    objc_msgSend(v5, "setDetectChamberSensor:", v4);

    v6 = self->fDiagHelper;
    if (v6)
    {
      -[RFSelfDiagExtensionHelper testConfiguration](v6, "testConfiguration");
      v7 = DWORD2(v75);
    }
    else
    {
      v7 = 0;
      v75 = 0u;
      v76 = 0u;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    objc_msgSend(v8, "setDetectChamberReadyWaitTime:", v7);

    v9 = self->fDiagHelper;
    if (v9)
    {
      -[RFSelfDiagExtensionHelper testConfiguration](v9, "testConfiguration");
      v10 = HIDWORD(v73);
    }
    else
    {
      v10 = 0;
      v73 = 0u;
      v74 = 0u;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    objc_msgSend(v11, "setDetectChamberReadyALSThreshold:", v10);

    v12 = self->fDiagHelper;
    if (v12)
    {
      -[RFSelfDiagExtensionHelper testConfiguration](v12, "testConfiguration");
      v13 = v72;
    }
    else
    {
      v13 = 0;
      v71 = 0u;
      v72 = 0u;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    objc_msgSend(v14, "setTestCompleteAlertTime:", v13);

    v15 = self->fDiagHelper;
    if (v15)
    {
      -[RFSelfDiagExtensionHelper testConfiguration](v15, "testConfiguration");
      v16 = BYTE4(v70);
    }
    else
    {
      v16 = 0;
      v69 = 0u;
      v70 = 0u;
    }
    v17 = v16 != 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    objc_msgSend(v18, "setTestCompleteVibrationAlertEnabled:", v17);

    v19 = self->fDiagHelper;
    if (v19)
    {
      -[RFSelfDiagExtensionHelper testConfiguration](v19, "testConfiguration");
      v20 = BYTE5(v68);
    }
    else
    {
      v20 = 0;
      v67 = 0u;
      v68 = 0u;
    }
    v21 = v20 != 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs", v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78));
    objc_msgSend(v22, "setTestCompleteChimeAlertEnabled:", v21);

    v23 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Test parameters overrided", buf, 2u);
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  -[RFSelfDiagController setTestCompleteAlertTime:](self, "setTestCompleteAlertTime:", objc_msgSend(v24, "testCompleteAlertTime"));

  v25 = self->fDiagHelper;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  LOBYTE(v25) = -[RFSelfDiagExtensionHelper isTestSupported:](v25, "isTestSupported:", objc_msgSend(v26, "command"));

  v27 = self;
  if ((v25 & 1) == 0)
  {
    v29 = 12;
LABEL_39:
    -[RFSelfDiagController abortTesting:](v27, "abortTesting:", v29);
    v39 = 0;
    goto LABEL_40;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  if (objc_msgSend(v28, "command") == 1)
  {

  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    v31 = objc_msgSend(v30, "command");

    if (v31 != 3)
      goto LABEL_28;
  }
  -[RFSelfDiagExtensionHelper setFactoryTest](self->fDiagHelper, "setFactoryTest");
LABEL_28:
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  if (!objc_msgSend(v32, "detectChamberSensor"))
  {

    if (-[RFSelfDiagExtensionHelper prepareSetupForTest](self->fDiagHelper, "prepareSetupForTest"))
      goto LABEL_31;
LABEL_38:
    v27 = self;
    v29 = 1;
    goto LABEL_39;
  }
  v33 = self->fDiagHelper;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  v35 = objc_msgSend(v34, "detectChamberSensor");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  LOBYTE(v33) = -[RFSelfDiagExtensionHelper initMonitorChamber:ALSThreshold:](v33, "initMonitorChamber:ALSThreshold:", v35, objc_msgSend(v36, "detectChamberReadyALSThreshold"));

  if ((v33 & 1) == 0
    || !-[RFSelfDiagExtensionHelper prepareSetupForTest](self->fDiagHelper, "prepareSetupForTest"))
  {
    goto LABEL_38;
  }
LABEL_31:
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  v38 = objc_msgSend(v37, "detectChamberSensor");
  v39 = v38 != 0;

  v40 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  v41 = os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT);
  if (!v38)
  {
    if (!v41)
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v48 = "[RFSelfTest] Skip to detect Chamber";
    goto LABEL_52;
  }
  if (v41)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Wait and confirm if Chamber is closed", buf, 2u);
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  if (objc_msgSend(v42, "detectChamberSensor"))
  {
    v43 = self->fDiagHelper;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    LOBYTE(v43) = -[RFSelfDiagExtensionHelper waitForChamberClosed:](v43, "waitForChamberClosed:", objc_msgSend(v44, "detectChamberReadyWaitTime"));

    if ((v43 & 1) == 0)
    {
      v27 = self;
      v29 = 2;
      goto LABEL_39;
    }
  }
  else
  {

  }
  v40 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v48 = "[RFSelfTest] Chamber is ready";
LABEL_52:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_DEFAULT, v48, buf, 2u);
  }
LABEL_53:
  v49 = self->fDiagHelper;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  LOBYTE(v49) = -[RFSelfDiagExtensionHelper addAWDConfiguration:](v49, "addAWDConfiguration:", objc_msgSend(v50, "command"));

  if ((v49 & 1) != 0)
  {
    v51 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v51, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Add AWD configuration", buf, 2u);
    }
    v52 = self->fDiagHelper;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    v54 = objc_msgSend(v53, "measureType");
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    LOBYTE(v52) = -[RFSelfDiagExtensionHelper startBasebandRFSelfTest:TestCommand:](v52, "startBasebandRFSelfTest:TestCommand:", v54, objc_msgSend(v55, "command"));

    if ((v52 & 1) != 0)
    {
      v56 = -[RFSelfDiagExtensionHelper getBasebandResultWaitTime](self->fDiagHelper, "getBasebandResultWaitTime");
      v57 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v80) = v56;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v57, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Baseband starts RF Self test. Waiting (%dsec) for the result..", buf, 8u);
      }
      self->diagState = 6;
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
      v59 = objc_msgSend(v58, "detectChamberSensor");

      if (v59)
        -[RFSelfDiagExtensionHelper startMonitorChamberOpen](self->fDiagHelper, "startMonitorChamberOpen");
      v60 = (dispatch_semaphore_s *)dispatch_semaphore_create(0);
      self->fWaitForEvent = v60;
      v61 = dispatch_time(0, 1000000000 * v56);
      if (dispatch_semaphore_wait((dispatch_semaphore_t)v60, v61))
        diagState = 9;
      else
        diagState = self->diagState;
      -[RFSelfDiagController abortTesting:](self, "abortTesting:", diagState);
      -[RFSelfDiagExtensionHelper stopMonitorChamber](self->fDiagHelper, "stopMonitorChamber");
    }
    else
    {
      -[RFSelfDiagController abortTesting:](self, "abortTesting:", 7);
    }
    v63 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEFAULT))
    {
      if (-[RFSelfDiagExtensionHelper removeAWDConfiguration](self->fDiagHelper, "removeAWDConfiguration"))
        v64 = "Success";
      else
        v64 = "Failed";
      *(_DWORD *)buf = 136315138;
      v80 = v64;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v63, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Remove AWD configuration: %s", buf, 0xCu);
    }
    v65 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_DEFAULT))
    {
      if (-[RFSelfDiagExtensionHelper recoverBasebandState:](self->fDiagHelper, "recoverBasebandState:", self->diagState != 8))
      {
        v66 = "Success";
      }
      else
      {
        v66 = "Failed";
      }
      *(_DWORD *)buf = 136315138;
      v80 = v66;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v65, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Recover Baseband: %s", buf, 0xCu);
    }
  }
  else
  {
    -[RFSelfDiagController abortTesting:](self, "abortTesting:", 3);
  }
LABEL_40:
  v45 = self->diagState != 2 && v39;
  -[RFSelfDiagController startAlertsTestComplete:](self, "startAlertsTestComplete:", v45);
  if (-[RFSelfDiagController fAlertTestComplete](self, "fAlertTestComplete"))
  {
    v46 = (dispatch_semaphore_s *)dispatch_semaphore_create(0);
    self->fWaitForEvent = v46;
    v47 = dispatch_time(0, 1000000000 * -[RFSelfDiagController testCompleteAlertTime](self, "testCompleteAlertTime"));
    if (dispatch_semaphore_wait((dispatch_semaphore_t)v46, v47))
      -[RFSelfDiagController stopAlertsTestComplete](self, "stopAlertsTestComplete");
  }
  -[RFSelfDiagExtensionHelper restoreSetup](self->fDiagHelper, "restoreSetup");
}

- (void)start
{
  os_log_s *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  RFSelfDiagExtensionHelper *v8;
  RFSelfDiagExtensionHelper *fDiagHelper;
  void *v10;
  os_log_s *v11;
  int v12;
  void *v13;

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandDescription"));
    v12 = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "== RF Self Test [Diag] started : %@ ==", (uint8_t *)&v12, 0xCu);

  }
  -[RFSelfDiagController setFinished:](self, "setFinished:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  v7 = objc_msgSend(v6, "command");

  if (v7 > 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
    objc_msgSend(v10, "setStatusCode:", &off_100010B20);

  }
  else
  {
    self->diagState = 0;
    if (!self->fDiagHelper)
    {
      v8 = -[RFSelfDiagExtensionHelper initWithDelegate:]([RFSelfDiagExtensionHelper alloc], "initWithDelegate:", self);
      fDiagHelper = self->fDiagHelper;
      self->fDiagHelper = v8;

    }
    -[RFSelfDiagController runRFSelfDiag](self, "runRFSelfDiag");
  }
  -[RFSelfDiagController setFinished:](self, "setFinished:", 1);
  v11 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "== RF Self Test [Diag] finished ==", (uint8_t *)&v12, 2u);
  }
  -[RFSelfDiagExtensionHelper resetAll](self->fDiagHelper, "resetAll");
}

- (void)teardown
{
  os_log_s *v3;
  int64_t diagState;
  RFSelfDiagExtensionHelper *fDiagHelper;
  uint8_t v7[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] teardown called", v7, 2u);
  }
  diagState = self->diagState;
  if (diagState == 6 || diagState == 0)
    self->diagState = 11;
  if (self->fWaitForEvent)
  {
    if (-[RFSelfDiagController fAlertTestComplete](self, "fAlertTestComplete"))
      -[RFSelfDiagController stopAlertsTestComplete](self, "stopAlertsTestComplete");
    dispatch_semaphore_signal((dispatch_semaphore_t)self->fWaitForEvent);
  }
  fDiagHelper = self->fDiagHelper;
  if (fDiagHelper)
  {
    -[RFSelfDiagExtensionHelper stopMonitorChamber](fDiagHelper, "stopMonitorChamber");
    -[RFSelfDiagExtensionHelper restoreSetup](self->fDiagHelper, "restoreSetup");
    -[RFSelfDiagExtensionHelper resetAll](self->fDiagHelper, "resetAll");
  }
}

- (void)handleChamberOpenEvent:(int)a3
{
  os_log_s *v5;
  _DWORD v6[2];

  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Chamber open detected with sensor(%d)", (uint8_t *)v6, 8u);
  }
  if (self->fWaitForEvent)
  {
    if (-[RFSelfDiagController fAlertTestComplete](self, "fAlertTestComplete"))
    {
      -[RFSelfDiagController stopAlertsTestComplete](self, "stopAlertsTestComplete");
    }
    else
    {
      if (!self->fWaitForEvent)
        return;
      self->diagState = 2;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->fWaitForEvent);
  }
}

- (void)handleAWDMetricEvent:(id)a3
{
  id v4;
  os_log_s *v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_s *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  if (self->fWaitForEvent)
  {
    v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = objc_msgSend(v4, "length");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] AWD Metric received! size=%lu ", buf, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));
    v12 = CFSTR("RFSelfDiagBasebandTestData");
    v13 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
    objc_msgSend(v8, "setData:", v7);

    self->diagState = 8;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->fWaitForEvent);
    v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController result](self, "result"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "%@ ", buf, 0xCu);

    }
  }

}

- (void)startAlertsTestComplete:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  os_log_s *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  os_log_s *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  os_log_s *v19;
  os_log_s *v20;
  _DWORD v21[2];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  if (objc_msgSend(v5, "testCompleteVibrationAlertEnabled"))
  {

LABEL_4:
    -[RFSelfDiagExtensionHelper stopMonitorChamber](self->fDiagHelper, "stopMonitorChamber");
    if (!v3 || !-[RFSelfDiagExtensionHelper startMonitorChamberOpen](self->fDiagHelper, "startMonitorChamberOpen"))
    {
      -[RFSelfDiagController setTestCompleteAlertTime:](self, "setTestCompleteAlertTime:", 5);
      v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        v21[0] = 67109120;
        v21[1] = -[RFSelfDiagController testCompleteAlertTime](self, "testCompleteAlertTime");
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Failed to start monitoring chamber. Keep alert for %dsec", (uint8_t *)v21, 8u);
      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("RFSelfTestCompleteAlertsNotification"), 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    v11 = objc_msgSend(v10, "testCompleteVibrationAlertEnabled");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v12, kAudioServicesPlaySystemSoundOptionLoopKey));

      AudioServicesPlaySystemSoundWithOptions(1352, v13, 0);
      -[RFSelfDiagController setFAlertTestComplete:](self, "setFAlertTestComplete:", 1);
      v14 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Start Vibration alert started", (uint8_t *)v21, 2u);
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
    v16 = objc_msgSend(v15, "testCompleteChimeAlertEnabled");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v17, kAudioServicesPlaySystemSoundOptionLoopKey));

      AudioServicesPlaySystemSoundWithOptions(1428, v18, 0);
      -[RFSelfDiagController setFAlertTestComplete:](self, "setFAlertTestComplete:", 1);
      v19 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Start Sound alert started", (uint8_t *)v21, 2u);
      }

    }
    return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  v7 = objc_msgSend(v6, "testCompleteChimeAlertEnabled");

  if ((v7 & 1) != 0)
    goto LABEL_4;
  v20 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Alert not enabled", (uint8_t *)v21, 2u);
  }
}

- (void)stopAlertsTestComplete
{
  os_log_s *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  uint8_t v8[16];

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Stop alert", v8, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  v5 = objc_msgSend(v4, "testCompleteVibrationAlertEnabled");

  if (v5)
    AudioServicesStopSystemSound(1352, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfDiagController inputs](self, "inputs"));
  v7 = objc_msgSend(v6, "testCompleteChimeAlertEnabled");

  if (v7)
    AudioServicesStopSystemSound(1428, 1);
  -[RFSelfDiagController setFAlertTestComplete:](self, "setFAlertTestComplete:", 0);
  -[RFSelfDiagExtensionHelper stopMonitorChamber](self->fDiagHelper, "stopMonitorChamber");
}

- (RFSelfDiagInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (BOOL)fAlertTestComplete
{
  return self->_fAlertTestComplete;
}

- (void)setFAlertTestComplete:(BOOL)a3
{
  self->_fAlertTestComplete = a3;
}

- (unsigned)testCompleteAlertTime
{
  return self->_testCompleteAlertTime;
}

- (void)setTestCompleteAlertTime:(unsigned int)a3
{
  self->_testCompleteAlertTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->fDiagHelper, 0);
}

@end
