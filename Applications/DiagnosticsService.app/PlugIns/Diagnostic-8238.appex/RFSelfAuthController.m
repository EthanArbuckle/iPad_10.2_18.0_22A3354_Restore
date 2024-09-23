@implementation RFSelfAuthController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[RFSelfAuthController setInputs:](self, "setInputs:", a3, a4);
  -[RFSelfAuthController setFinished:](self, "setFinished:", 0);
}

- (void)start
{
  os_log_s *v3;
  RFSelfAuthExtensionHelper *v4;
  RFSelfAuthExtensionHelper *fDiagHelper;
  uint64_t v6;
  void *v7;
  os_log_s *v8;
  int64_t v9;
  int v10;
  void *v11;
  void *v12;
  os_log_s *v13;
  const char *v14;
  RFSelfAuthExtensionHelper *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  os_log_s *v21;
  uint64_t v22;

  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "== RF Self Test [Auth] started ==", (uint8_t *)&v22, 2u);
  }
  -[RFSelfAuthController setFinished:](self, "setFinished:", 0);
  v4 = objc_alloc_init(RFSelfAuthExtensionHelper);
  fDiagHelper = self->fDiagHelper;
  self->fDiagHelper = v4;

  if (-[RFSelfAuthExtensionHelper loadTestConfigFromUserDefaults](self->fDiagHelper, "loadTestConfigFromUserDefaults"))
  {
    v6 = (-[RFSelfAuthExtensionHelper testConfiguration](self->fDiagHelper, "testConfiguration") >> 8) & 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfAuthController inputs](self, "inputs"));
    objc_msgSend(v7, "setAddAPTagToTicket:", v6);

    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Test parameters overrided", (uint8_t *)&v22, 2u);
    }
  }
  -[RFSelfAuthExtensionHelper clearRFSelfTestTicket](self->fDiagHelper, "clearRFSelfTestTicket");
  v9 = -[RFSelfAuthExtensionHelper getPersonalizationInfo](self->fDiagHelper, "getPersonalizationInfo");
  if (v9)
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfAuthController result](self, "result"));
    objc_msgSend(v12, "setStatusCode:", v11);

    v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LODWORD(v22) = 67109120;
    HIDWORD(v22) = v10;
    v14 = "[RFSelfTest] Abort test with error: Failed to get Personalized info, statusCode=%d";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v22, 8u);
    goto LABEL_14;
  }
  v15 = self->fDiagHelper;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfAuthController inputs](self, "inputs"));
  v17 = -[RFSelfAuthExtensionHelper getSignedTicketAndStore:](v15, "getSignedTicketAndStore:", objc_msgSend(v16, "addAPTagToTicket"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfAuthController result](self, "result"));
    objc_msgSend(v19, "setStatusCode:", v18);

    v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LODWORD(v22) = 67109120;
    HIDWORD(v22) = (_DWORD)v17;
    v14 = "[RFSelfTest] Abort test with error: Failed to get Signed ticket, statusCode=%d";
    goto LABEL_12;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RFSelfAuthController result](self, "result"));
  objc_msgSend(v20, "setStatusCode:", &off_1000041F8);

LABEL_14:
  -[RFSelfAuthController setFinished:](self, "setFinished:", 1, v22);
  v21 = +[ABMDiagnosticExtensionLogging getOSLogHandler](ABMDiagnosticExtensionLogging, "getOSLogHandler");
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "== RF Self Test [Auth] finished ==", (uint8_t *)&v22, 2u);
  }
  -[RFSelfAuthExtensionHelper resetAll](self->fDiagHelper, "resetAll");
}

- (RFSelfAuthInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->fDiagHelper, 0);
}

@end
