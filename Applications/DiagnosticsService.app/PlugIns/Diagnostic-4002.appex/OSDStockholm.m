@implementation OSDStockholm

- (OSDStockholm)init
{
  return -[OSDStockholm initWithDelegate:](self, "initWithDelegate:", 0);
}

- (OSDStockholm)initWithDelegate:(id)a3
{
  id v4;
  OSDStockholm *v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *start_timeout_sema;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *end_timeout_sema;
  objc_super v11;

  v4 = a3;
  +[DASoftLinking isNearFieldFrameworkAvailable](DASoftLinking, "isNearFieldFrameworkAvailable");
  v11.receiver = self;
  v11.super_class = (Class)OSDStockholm;
  v5 = -[OSDStockholm init](&v11, "init");
  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    start_timeout_sema = v5->_start_timeout_sema;
    v5->_start_timeout_sema = (OS_dispatch_semaphore *)v6;

    v8 = dispatch_semaphore_create(0);
    end_timeout_sema = v5->_end_timeout_sema;
    v5->_end_timeout_sema = (OS_dispatch_semaphore *)v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSDStockholm contactlessSession](self, "contactlessSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSDStockholm contactlessSession](self, "contactlessSession"));
    objc_msgSend(v4, "endSession");

  }
  v5.receiver = self;
  v5.super_class = (Class)OSDStockholm;
  -[OSDStockholm dealloc](&v5, "dealloc");
}

- (BOOL)startCardEmulationWithTimeout:(double)a3
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *start_timeout_sema;
  dispatch_time_t v25;
  uint64_t v26;
  NSObject *v27;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  id buf;

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedHardwareManager](+[DASoftLinking nearFieldClass:](DASoftLinking, "nearFieldClass:", CFSTR("NFHardwareManager")), "sharedHardwareManager"));
  v6 = objc_msgSend(v5, "getHwSupport");
  if (v6 == 4)
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100005900(v8);
LABEL_4:

    v9 = 0;
    goto LABEL_22;
  }
  v10 = DiagnosticLogHandleForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Hardware state : %u", (uint8_t *)&buf, 8u);
  }

  if (v6 != 2)
  {
    v12 = 0;
    do
    {
      +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 0.100000001);
      v13 = objc_msgSend(v5, "getHwSupport");
      if (v13 == 2)
        break;
    }
    while (v12++ < 9);
    if (v13 != 2)
    {
      v15 = DiagnosticLogHandleForCategory(3);
      v8 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000059A4(v8, v16, v17, v18, v19, v20, v21, v22);
      goto LABEL_4;
    }
  }
  objc_initWeak(&buf, self);
  v29 = _NSConcreteStackBlock;
  v30 = 3221225472;
  v31 = sub_1000046C0;
  v32 = &unk_100008210;
  objc_copyWeak(&v34, &buf);
  v33 = &v35;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startContactlessSession:", &v29));
  -[OSDStockholm setSessionController:](self, "setSessionController:", v23, v29, v30, v31, v32);

  start_timeout_sema = self->_start_timeout_sema;
  v25 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  if (dispatch_semaphore_wait(start_timeout_sema, v25))
  {
    v26 = DiagnosticLogHandleForCategory(3);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100005978();

    v9 = 0;
    *((_BYTE *)v36 + 24) = 0;
  }
  else
  {
    v9 = *((_BYTE *)v36 + 24) != 0;
  }
  objc_destroyWeak(&v34);
  objc_destroyWeak(&buf);
LABEL_22:

  _Block_object_dispose(&v35, 8);
  return v9;
}

- (void)stopCardEmulation:(double)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v7[5];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000492C;
  v7[3] = &unk_100008260;
  objc_copyWeak(v8, &location);
  v7[4] = self;
  v8[1] = *(id *)&a3;
  dispatch_sync(v6, v7);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (id)serverRegistrationInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedRemoteAdminManager](+[DASoftLinking nearFieldClass:](DASoftLinking, "nearFieldClass:", CFSTR("NFRemoteAdminManager")), "sharedRemoteAdminManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "registrationInfo"));

  return v3;
}

- (id)serialNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class embeddedSecureElement](+[DASoftLinking nearFieldClass:](DASoftLinking, "nearFieldClass:", CFSTR("NFSecureElement")), "embeddedSecureElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serialNumber"));

  return v3;
}

- (BOOL)isNfcDisabledByProfile
{
  if (!-[OSDStockholm userNfcEnabledStateCaptured](self, "userNfcEnabledStateCaptured"))
    -[OSDStockholm updateUserNfcEnabledState](self, "updateUserNfcEnabledState");
  return -[OSDStockholm userNfcEnabledState](self, "userNfcEnabledState") == -1;
}

- (BOOL)overrideNfcEnabledState
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  _DWORD v11[2];
  __int16 v12;
  void *v13;

  if (!-[OSDStockholm userNfcEnabledStateCaptured](self, "userNfcEnabledStateCaptured"))
  {
    -[OSDStockholm updateUserNfcEnabledState](self, "updateUserNfcEnabledState");
    if (!-[OSDStockholm userNfcEnabledStateCaptured](self, "userNfcEnabledStateCaptured"))
    {
      v9 = DiagnosticLogHandleForCategory(3);
      v4 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_100005BD0();
      goto LABEL_9;
    }
  }
  v3 = objc_claimAutoreleasedReturnValue(-[objc_class sharedHardwareManager](+[DASoftLinking nearFieldClass:](DASoftLinking, "nearFieldClass:", CFSTR("NFHardwareManager")), "sharedHardwareManager"));
  v4 = v3;
  if (!v3)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject setRadioEnabledSetting:](v3, "setRadioEnabledSetting:", 1));
  v6 = DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = v5 == 0;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NFC radio state overridden: %d with error: %@", (uint8_t *)v11, 0x12u);
  }

  v8 = v5 == 0;
LABEL_10:

  return v8;
}

- (void)restoreNfcEnabledState
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int64_t v10;

  if (-[OSDStockholm userNfcEnabledStateCaptured](self, "userNfcEnabledStateCaptured"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[objc_class sharedHardwareManager](+[DASoftLinking nearFieldClass:](DASoftLinking, "nearFieldClass:", CFSTR("NFHardwareManager")), "sharedHardwareManager"));
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject setRadioEnabledSetting:](v3, "setRadioEnabledSetting:", (id)-[OSDStockholm userNfcEnabledState](self, "userNfcEnabledState") == (id)1));
      v5 = DiagnosticLogHandleForCategory(3);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      v7 = v6;
      if (v4)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100005BFC(self, (uint64_t)v4, v7);
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = -[OSDStockholm userNfcEnabledState](self, "userNfcEnabledState");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NFC radio enabled state restored to %ld", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else
  {
    v8 = DiagnosticLogHandleForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User NFC state was not captured. Not altering state", (uint8_t *)&v9, 2u);
    }
  }

}

- (BOOL)updateUserNfcEnabledState
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v18;
  uint8_t buf[4];
  int64_t v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedHardwareManager](+[DASoftLinking nearFieldClass:](DASoftLinking, "nearFieldClass:", CFSTR("NFHardwareManager")), "sharedHardwareManager"));
  v4 = v3;
  if (v3)
  {
    v18 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getRadioEnabledState:", &v18));
    v6 = v5 == 0;
    if (v5)
    {
      v7 = DiagnosticLogHandleForCategory(3);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100005C94((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    }
    else
    {
      -[OSDStockholm setUserNfcEnabledState:](self, "setUserNfcEnabledState:", v18);
      -[OSDStockholm setUserNfcEnabledStateCaptured:](self, "setUserNfcEnabledStateCaptured:", 1);
      v15 = DiagnosticLogHandleForCategory(3);
      v8 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = -[OSDStockholm userNfcEnabledState](self, "userNfcEnabledState");
        *(_DWORD *)buf = 134217984;
        v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully backed up original NFC radio state %ld", buf, 0xCu);
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_appletAID
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class embeddedSecureElement](+[DASoftLinking nearFieldClass:](DASoftLinking, "nearFieldClass:", CFSTR("NFSecureElement")), "embeddedSecureElement"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "hwType");
    v5 = (_DWORD)v4 - 1;
    if (((_DWORD)v4 - 1) < 5 && ((0x1Du >> v5) & 1) != 0)
    {
      v16 = *(&off_100008280 + v5);
      goto LABEL_11;
    }
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100005D24((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    v14 = DiagnosticLogHandleForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100005CF8();

  }
  v16 = &stru_1000084A8;
LABEL_11:

  return (id)v16;
}

- (void)contactlessSession:(id)a3 didDetectField:(BOOL)a4
{
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v6 = DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v11, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSDStockholm delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v10, "osdStockholmDidDetectField") & 1) != 0)
    objc_msgSend(v10, "osdStockholmDidDetectField");

}

- (void)contactlessSessionDidEndUnexpectedly:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v10, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OSDStockholm delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v9, "osdStockholmDidEndUnexpectedly") & 1) != 0)
    objc_msgSend(v9, "osdStockholmDidEndUnexpectedly");

}

- (void)contactlessSession:(id)a3 didSelectApplet:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v6 = a4;
  v7 = DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v15 = 138412546;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v15, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OSDStockholm delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v12, "osdStockholmDidSelectEchoApplet") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("D27600008554657374010101"));

    if (v14)
      objc_msgSend(v12, "osdStockholmDidSelectEchoApplet");
  }

}

- (OSDStockholmDelegate)delegate
{
  return (OSDStockholmDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NFSession)sessionController
{
  return self->_sessionController;
}

- (void)setSessionController:(id)a3
{
  objc_storeStrong((id *)&self->_sessionController, a3);
}

- (NFContactlessSession)contactlessSession
{
  return self->_contactlessSession;
}

- (void)setContactlessSession:(id)a3
{
  objc_storeStrong((id *)&self->_contactlessSession, a3);
}

- (int64_t)userNfcEnabledState
{
  return self->_userNfcEnabledState;
}

- (void)setUserNfcEnabledState:(int64_t)a3
{
  self->_userNfcEnabledState = a3;
}

- (BOOL)userNfcEnabledStateCaptured
{
  return self->_userNfcEnabledStateCaptured;
}

- (void)setUserNfcEnabledStateCaptured:(BOOL)a3
{
  self->_userNfcEnabledStateCaptured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactlessSession, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_end_timeout_sema, 0);
  objc_storeStrong((id *)&self->_start_timeout_sema, 0);
}

@end
