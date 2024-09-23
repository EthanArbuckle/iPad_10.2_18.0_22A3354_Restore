@implementation ENXPCConnection

uint64_t __39__ENXPCConnection__xpcManagerActivate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)xpcConnectionEvent:(id)a3
{
  void *v4;
  int v5;
  OS_xpc_object *xpcCnx;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (MEMORY[0x1D17A8408]() == MEMORY[0x1E0C812F8])
  {
    -[ENXPCConnection _xpcConnectionRequest:](self, "_xpcConnectionRequest:", v9);
    goto LABEL_14;
  }
  v4 = v9;
  if (v9 == (id)MEMORY[0x1E0C81260])
  {
    if (gLogCategory_ENDaemon <= 20 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      -[ENXPCClient pid](self->_client, "pid");
      CUPrintPID();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    -[ENXPCConnection invalidate](self, "invalidate");
    goto LABEL_14;
  }
  if (gLogCategory__ENDaemon <= 90)
  {
    if (gLogCategory__ENDaemon != -1 || (v5 = _LogCategory_Initialize(), v4 = v9, v5))
    {
      CUPrintXPC();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

LABEL_14:
      v4 = v9;
    }
  }

}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (ENManager)manager
{
  return self->_manager;
}

- (void)invalidate
{
  ENUserAlert *v3;
  ENUserAlert *userAlert;
  ENUserAlert *v5;
  ENExposureDetectionDaemonSession *v6;
  void *v7;
  char v8;
  ENExposureDetectionDaemonSession *detectionSession;
  ENManager *v10;
  ENManager *manager;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  OS_xpc_object *xpcCnx;
  void *v19;

  v3 = self->_userAlert;
  if (v3)
  {
    if (gLogCategory_ENDaemon < 31 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    -[ENUserAlert invalidate](v3, "invalidate");
    userAlert = self->_userAlert;
    self->_userAlert = 0;

    -[ENDaemon userAlert](self->_daemon, "userAlert");
    v5 = (ENUserAlert *)objc_claimAutoreleasedReturnValue();

    if (v3 == v5)
      -[ENDaemon setUserAlert:](self->_daemon, "setUserAlert:", 0);
  }

  v6 = self->_detectionSession;
  if (v6)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

    if ((v8 & 1) != 0
      && gLogCategory_ENDaemon <= 30
      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v19 = v6;
      LogPrintF_safe();
    }
    -[ENExposureDetectionDaemonSession invalidate](v6, "invalidate", v19);
    detectionSession = self->_detectionSession;
    self->_detectionSession = 0;

  }
  v10 = self->_manager;
  if (v10)
  {
    if (gLogCategory_ENDaemon < 31 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v19 = v10;
      LogPrintF_safe();
    }
    -[ENManager invalidate](v10, "invalidate", v19);
    manager = self->_manager;
    self->_manager = 0;

  }
  -[ENDaemon onboardingRegionTrigger](self->_daemon, "onboardingRegionTrigger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.Preferences"));

    if ((v14 & 1) != 0)
    {
      -[ENDaemon configurationManager](self->_daemon, "configurationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "configurationStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "configurationForRegion:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
          -[ENXPCConnection _sendOnboardingMetricForRegionConfiguration:](self, "_sendOnboardingMetricForRegionConfiguration:", v17, v12);
        }
        else
        {
          -[ENXPCConnection _sendOnboardingMetricForRegionConfiguration:](self, "_sendOnboardingMetricForRegionConfiguration:", v17, v19);
        }
      }

      -[ENDaemon setOnboardingTrigger:](self->_daemon, "setOnboardingTrigger:", 0);
      -[ENDaemon setOnboardingRegionTrigger:](self->_daemon, "setOnboardingRegionTrigger:", 0);
      -[ENDaemon setOnboardingFirstTime:](self->_daemon, "setOnboardingFirstTime:", 0);
      -[ENDaemon setOnboardingLegalConsentLastViewCount:](self->_daemon, "setOnboardingLegalConsentLastViewCount:", -[ENDaemon _getLegalConsentPageCount](self->_daemon, "_getLegalConsentPageCount"));

    }
  }

  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
    xpc_connection_cancel(xpcCnx);
  -[ENDaemon xpcConnectionInvalidated:](self->_daemon, "xpcConnectionInvalidated:", self);
}

- (void)_xpcSendMessage:(id)a3
{
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  xpc_object_t message;

  message = a3;
  v4 = self->_xpcCnx;
  v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_xpcMessageAddCommonKeys:(id)a3 allowed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  int v8;
  int64_t v9;
  xpc_object_t xdict;

  v4 = a4;
  v6 = a3;
  xdict = v6;
  if (v4)
  {
    xpc_dictionary_set_BOOL(v6, "enbd", -[ENDaemon prefEnabled](self->_daemon, "prefEnabled"));
    xpc_dictionary_set_BOOL(xdict, "paus", -[ENDaemon prefPaused](self->_daemon, "prefPaused"));
    v7 = -[ENDaemon prefDifferentialPrivacyConsent](self->_daemon, "prefDifferentialPrivacyConsent") == 2;
  }
  else
  {
    xpc_dictionary_set_BOOL(v6, "enbd", 0);
    xpc_dictionary_set_BOOL(xdict, "paus", 0);
    v7 = 0;
  }
  xpc_dictionary_set_BOOL(xdict, "dpEn", v7);
  v8 = -[ENXPCClient appAPIVersion](self->_client, "appAPIVersion");
  if (v4)
  {
    v9 = -[ENDaemon getOverallStatus](self->_daemon, "getOverallStatus");
  }
  else if (v8 <= 1)
  {
    v9 = 4;
  }
  else
  {
    v9 = 6;
  }
  xpc_dictionary_set_int64(xdict, "stat", v9);

}

- (BOOL)_xpcManagerActivateIfNecessaryWithRequest:(id)a3 error:(id *)a4
{
  id v5;
  int64_t int64;
  ENManager *v7;
  ENManager *manager;

  if (!self->_manager)
  {
    v5 = a3;
    int64 = xpc_dictionary_get_int64(v5, "apiV");
    CUXPCDecodeNSString();
    CUXPCDecodeBool();

    -[ENXPCClient accessLevel](self->_client, "accessLevel");
    -[ENXPCClient activateWithAppAPIVersion:regionISO:](self->_client, "activateWithAppAPIVersion:regionISO:", int64, 0);
    v7 = (ENManager *)objc_alloc_init(MEMORY[0x1E0CAA368]);
    manager = self->_manager;
    self->_manager = v7;

    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();

  }
  return 1;
}

- (void)_xpcManagerActivate:(id)a3
{
  id v4;
  id v5;
  id *v6;
  BOOL v7;
  id *v8;
  BOOL v9;
  xpc_object_t reply;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  int v28;
  ENDaemon *daemon;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD);
  id v36;
  id v37;
  id obj;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v4 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  v47 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __39__ENXPCConnection__xpcManagerActivate___block_invoke;
  v39[3] = &unk_1E87D9D88;
  v41 = &v42;
  v39[4] = self;
  v5 = v4;
  v40 = v5;
  v35 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v39);
  v6 = (id *)(v43 + 5);
  obj = (id)v43[5];
  v7 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &obj);
  objc_storeStrong(v6, obj);
  if (v7)
  {
    v36 = v5;
    if (self->_manager)
    {
      ENErrorF();
      v32 = objc_claimAutoreleasedReturnValue();
      reply = (xpc_object_t)v43[5];
      v43[5] = v32;
LABEL_28:

      v5 = v36;
      goto LABEL_29;
    }
    v8 = (id *)(v43 + 5);
    v37 = (id)v43[5];
    v9 = -[ENXPCConnection _xpcManagerActivateIfNecessaryWithRequest:error:](self, "_xpcManagerActivateIfNecessaryWithRequest:error:", v5, &v37);
    objc_storeStrong(v8, v37);
    if (v9)
    {
      -[ENDaemon setUsageManagerActivate:](self->_daemon, "setUsageManagerActivate:", -[ENDaemon usageManagerActivate](self->_daemon, "usageManagerActivate") + 1);
      -[ENDaemon _scheduleUpdate](self->_daemon, "_scheduleUpdate");
      reply = xpc_dictionary_create_reply(v5);
      if (!reply)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        goto LABEL_28;
      }
      -[ENXPCConnection _xpcMessageAddCommonKeys:allowed:](self, "_xpcMessageAddCommonKeys:allowed:", reply, -[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", 0));
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      CFStringGetTypeID();
      v11 = (void *)CFPrefs_CopyTypedValue();
      if (!v11)
        goto LABEL_26;
      -[ENDaemon activeEntity](self->_daemon, "activeEntity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "entity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v12;
      v15 = v14;
      if (v13 == v14)
      {

      }
      else
      {
        if (!v14)
        {
          v17 = 0;
LABEL_18:

LABEL_19:
          -[ENXPCConnection client](self, "client");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "signingIdentity");
          v26 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26 != CFSTR("com.apple.enutil"))
          {
            if (!v26)
            {
              v28 = 0;
LABEL_24:

              if ((v17 | v28) == 1)
                -[ENXPCConnection enqueuePreAuthorizedLockScreenActionForRequest:outError:](self, "enqueuePreAuthorizedLockScreenActionForRequest:outError:", v36, 0);
LABEL_26:

              daemon = self->_daemon;
              -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = -[ENDaemon appDequeueActivityFlagsWithBundleID:](daemon, "appDequeueActivityFlagsWithBundleID:", v30);

              if ((_DWORD)v31)
                -[ENXPCConnection xpcReportActivityFlags:](self, "xpcReportActivityFlags:", v31);
              goto LABEL_28;
            }
            v28 = -[__CFString isEqual:](v26, "isEqual:", CFSTR("com.apple.enutil"));

            if (!v28)
              goto LABEL_24;
          }
          v28 = IsAppleInternalBuild() != 0;
          goto LABEL_24;
        }
        v16 = objc_msgSend(v13, "isEqual:", v14);

        if (!v16)
        {
          v17 = 0;
          goto LABEL_19;
        }
      }
      -[ENXPCConnection client](self, "client");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "signingIdentity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENDaemon activeEntity](self->_daemon, "activeEntity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "entity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v18;
      v23 = v21;
      v24 = v23;
      if (v22 == v23)
      {
        v17 = 1;
      }
      else if ((v22 == 0) == (v23 != 0))
      {
        v17 = 0;
      }
      else
      {
        v17 = objc_msgSend(v22, "isEqual:", v23);
      }

      goto LABEL_18;
    }
  }
LABEL_29:
  v35[2](v35);

  _Block_object_dispose(&v42, 8);
}

- (void)_xpcConnectionRequest:(id)a3
{
  int64_t int64;
  int64_t v5;
  ENXPCConnection *v6;
  id v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  id v11;

  v11 = a3;
  int64 = xpc_dictionary_get_int64(v11, "mTyp");
  v5 = int64;
  if (int64 > 150)
  {
    switch(int64)
    {
      case 200:
        -[ENXPCConnection _xpcGetStatusForBundleIdentifier:](self, "_xpcGetStatusForBundleIdentifier:", v11);
        break;
      case 201:
        -[ENXPCConnection _xpcGetInfo:](self, "_xpcGetInfo:", v11);
        break;
      case 202:
        -[ENXPCConnection _xpcSetActiveApp:](self, "_xpcSetActiveApp:", v11);
        break;
      case 203:
      case 208:
LABEL_31:
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        if (xpc_dictionary_expects_reply())
        {
          v10 = v5;
          ENErrorF();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v11, v10);

        }
        break;
      case 204:
        -[ENXPCConnection _xpcGetLastExposureNotification:](self, "_xpcGetLastExposureNotification:", v11);
        break;
      case 205:
        -[ENXPCConnection _xpcDownload:](self, "_xpcDownload:", v11);
        break;
      case 206:
        -[ENXPCConnection _xpcSetActiveRegion:](self, "_xpcSetActiveRegion:", v11);
        break;
      case 207:
        -[ENXPCConnection _xpcSetAutomaticRegionSwitch:](self, "_xpcSetAutomaticRegionSwitch:", v11);
        break;
      case 209:
        -[ENXPCConnection _xpcOnboardingDidStart:](self, "_xpcOnboardingDidStart:", v11);
        break;
      case 210:
        -[ENXPCConnection _xpcGetPreAuthorizeDiagnosisKeysEnabled:](self, "_xpcGetPreAuthorizeDiagnosisKeysEnabled:", v11);
        break;
      case 211:
        -[ENXPCConnection _xpcSetPreAuthorizeDiagnosisKeysEnabled:](self, "_xpcSetPreAuthorizeDiagnosisKeysEnabled:", v11);
        break;
      case 212:
        -[ENXPCConnection _xpcGetRemotePresentationRequestIfNeeded:](self, "_xpcGetRemotePresentationRequestIfNeeded:", v11);
        break;
      case 213:
        -[ENXPCConnection _xpcRemotePresentationReceivedDecision:](self, "_xpcRemotePresentationReceivedDecision:", v11);
        break;
      case 214:
        -[ENXPCConnection _xpcGetDataVaultSize:](self, "_xpcGetDataVaultSize:", v11);
        break;
      case 215:
        -[ENXPCConnection _xpcSetAvailabilityAlertEnabled:](self, "_xpcSetAvailabilityAlertEnabled:", v11);
        break;
      case 216:
        -[ENXPCConnection _xpcSetMonthlySummaryAlertEnabled:](self, "_xpcSetMonthlySummaryAlertEnabled:", v11);
        break;
      case 217:
        -[ENXPCConnection _xpcShowBuddy:](self, "_xpcShowBuddy:", v11);
        break;
      case 218:
        -[ENXPCConnection _xpcVerifyTextMessage:](self, "_xpcVerifyTextMessage:", v11);
        break;
      case 219:
        -[ENXPCConnection _xpcLegalConsentPageCount:](self, "_xpcLegalConsentPageCount:", v11);
        break;
      default:
        switch(int64)
        {
          case 300:
            -[ENXPCConnection _xpcStartTestVerificationSession:](self, "_xpcStartTestVerificationSession:", v11);
            break;
          case 301:
            -[ENXPCConnection _xpcFetchTestVerificationMetadata:](self, "_xpcFetchTestVerificationMetadata:", v11);
            break;
          case 302:
            -[ENXPCConnection _xpcFinishTestVerificationSession:](self, "_xpcFinishTestVerificationSession:", v11);
            break;
          case 303:
            -[ENXPCConnection _xpcStartSelfReportWebSession:](self, "_xpcStartSelfReportWebSession:", v11);
            break;
          default:
            if (int64 != 151)
              goto LABEL_31;
            -[ENXPCConnection _xpcSetActiveEntity:](self, "_xpcSetActiveEntity:", v11);
            break;
        }
        break;
    }
  }
  else
  {
    switch(int64)
    {
      case 10:
        -[ENXPCConnection _xpcManagerActivate:](self, "_xpcManagerActivate:", v11);
        break;
      case 11:
        -[ENXPCConnection _xpcSetEnabled:](self, "_xpcSetEnabled:", v11);
        break;
      case 12:
      case 19:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 45:
      case 46:
      case 47:
      case 59:
      case 60:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
        goto LABEL_31;
      case 13:
        -[ENXPCConnection _xpcEntitlementCheck:](self, "_xpcEntitlementCheck:", v11);
        break;
      case 14:
        -[ENXPCConnection _xpcSetPaused:](self, "_xpcSetPaused:", v11);
        break;
      case 15:
        -[ENXPCConnection _xpcGetUserTraveled:](self, "_xpcGetUserTraveled:", v11);
        break;
      case 16:
        -[ENXPCConnection _xpcPreAuthorizeDiagnosisKeys:](self, "_xpcPreAuthorizeDiagnosisKeys:", v11);
        break;
      case 17:
        -[ENXPCConnection _xpcGetTravelStatusEnabled:](self, "_xpcGetTravelStatusEnabled:", v11);
        break;
      case 18:
        -[ENXPCConnection _xpcSetTravelStatusEnabled:](self, "_xpcSetTravelStatusEnabled:", v11);
        break;
      case 20:
        v6 = self;
        v7 = v11;
        v8 = 0;
        goto LABEL_47;
      case 21:
        -[ENXPCConnection _xpcResetData:](self, "_xpcResetData:", v11);
        break;
      case 22:
        v6 = self;
        v7 = v11;
        v8 = 1;
LABEL_47:
        -[ENXPCConnection _xpcGetDiagnosisKeys:testMode:](v6, "_xpcGetDiagnosisKeys:testMode:", v7, v8);
        break;
      case 23:
        -[ENXPCConnection _xpcRequestPreAuthorizedDiagnosisKeys:](self, "_xpcRequestPreAuthorizedDiagnosisKeys:", v11);
        break;
      case 40:
        -[ENXPCConnection _xpcExposureDetectionFileActivate:](self, "_xpcExposureDetectionFileActivate:", v11);
        break;
      case 41:
        -[ENXPCConnection _xpcExposureDetectionFileAdd:](self, "_xpcExposureDetectionFileAdd:", v11);
        break;
      case 42:
        -[ENXPCConnection _xpcExposureDetectionFileFinish:](self, "_xpcExposureDetectionFileFinish:", v11);
        break;
      case 43:
        -[ENXPCConnection _xpcExposureDetectionFileGetExposures:](self, "_xpcExposureDetectionFileGetExposures:", v11);
        break;
      case 44:
        -[ENXPCConnection _xpcExposureDetectionFileGetExposureWindows:](self, "_xpcExposureDetectionFileGetExposureWindows:", v11);
        break;
      case 48:
        -[ENXPCConnection _xpcExposureDetectionHistoryGetFiles:](self, "_xpcExposureDetectionHistoryGetFiles:", v11);
        break;
      case 49:
        -[ENXPCConnection _xpcExposureDetectionHistoryGetSessions:](self, "_xpcExposureDetectionHistoryGetSessions:", v11);
        break;
      case 50:
        -[ENXPCConnection _xpcGetActiveRegion:](self, "_xpcGetActiveRegion:", v11);
        break;
      case 51:
        -[ENXPCConnection _xpcGetRegionConfig:](self, "_xpcGetRegionConfig:", v11);
        break;
      case 52:
        -[ENXPCConnection _xpcGetAllRegionConfig:](self, "_xpcGetAllRegionConfig:", v11);
        break;
      case 53:
        -[ENXPCConnection _xpcSetRegionConsent:](self, "_xpcSetRegionConsent:", v11);
        break;
      case 54:
        -[ENXPCConnection _xpcSetDeveloperRegionServerConfig:](self, "_xpcSetDeveloperRegionServerConfig:", v11);
        break;
      case 55:
        -[ENXPCConnection _xpcGetRegionHistory:](self, "_xpcGetRegionHistory:", v11);
        break;
      case 56:
        -[ENXPCConnection _xpcGetRegionHistoryEnabled:](self, "_xpcGetRegionHistoryEnabled:", v11);
        break;
      case 57:
        -[ENXPCConnection _xpcSetRegionHistoryEnabled:](self, "_xpcSetRegionHistoryEnabled:", v11);
        break;
      case 58:
        -[ENXPCConnection _xpcGetCurrentAgencyConfig:](self, "_xpcGetCurrentAgencyConfig:", v11);
        break;
      case 61:
        -[ENXPCConnection _xpcGetRegionMonitorEnabled:](self, "_xpcGetRegionMonitorEnabled:", v11);
        break;
      case 62:
        -[ENXPCConnection _xpcGetSubdivisionList:](self, "_xpcGetSubdivisionList:", v11);
        break;
      case 70:
        -[ENXPCConnection _xpcTCCCheck:](self, "_xpcTCCCheck:", v11);
        break;
      default:
        switch(int64)
        {
          case 'd':
            -[ENXPCConnection _xpcDiagnosticControl:](self, "_xpcDiagnosticControl:", v11);
            break;
          case 'e':
            -[ENXPCConnection _xpcDiagnosticLog:](self, "_xpcDiagnosticLog:", v11);
            break;
          case 'f':
            -[ENXPCConnection _xpcDiagnosticShow:](self, "_xpcDiagnosticShow:", v11);
            break;
          case 'g':
            -[ENXPCConnection _xpcNotificationTrigger:](self, "_xpcNotificationTrigger:", v11);
            break;
          default:
            if (int64 != 150)
              goto LABEL_31;
            -[ENXPCConnection _xpcGetEntities:](self, "_xpcGetEntities:", v11);
            break;
        }
        break;
    }
  }

}

- (BOOL)_entitledForAccessLevel:(int)a3 error:(id *)a4
{
  int v6;
  int v7;

  v6 = -[ENXPCClient accessLevel](self->_client, "accessLevel");
  v7 = v6;
  if (a4 && v6 < a3)
  {
    ENErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 >= a3;
}

- (BOOL)_appActiveStatusWithError:(id *)a3
{
  __CFString *v5;
  __CFString *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  void *v16;
  int v17;
  int v18;
  BOOL v19;

  -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if (a3)
    {
LABEL_21:
      ENErrorF();
      v19 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_22:
    v19 = 0;
    goto LABEL_15;
  }
  if (v5 == CFSTR("com.apple.enutil"))
    v7 = 1;
  else
    v7 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("com.apple.enutil"));
  v8 = -[__CFString hasPrefix:](v6, "hasPrefix:", CFSTR("com.apple."));
  -[ENDaemon activeEntity](self->_daemon, "activeEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = v11;
  v14 = v13;
  if (v12 == v13)
  {

  }
  else
  {
    if (!v13)
    {

      goto LABEL_17;
    }
    v15 = -[__CFString isEqual:](v12, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
LABEL_17:

      if (((v7 | v8) & 1) == 0)
        goto LABEL_18;
      goto LABEL_14;
    }
  }
  -[ENDaemon activeEntity](self->_daemon, "activeEntity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "activeStatus");

  if (v17 == 3)
    v18 = v7;
  else
    v18 = 1;
  if (((v18 | v8) & 1) == 0)
  {
LABEL_18:
    if (a3)
      goto LABEL_21;
    goto LABEL_22;
  }
LABEL_14:
  v19 = 1;
LABEL_15:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_detectionSession, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_userAlert, 0);
}

- (id)description
{
  return -[ENXPCConnection descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  ENManager *manager;
  __CFString *v6;
  ENExposureDetectionDaemonSession *detectionSession;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  ENManager *v12;
  ENExposureDetectionDaemonSession *v13;

  if (self->_xpcCnx)
  {
    -[ENXPCClient pid](self->_client, "pid", *(_QWORD *)&a3);
    NSAppendPrintF();
    v4 = (__CFString *)0;
  }
  else
  {
    v4 = 0;
  }
  manager = self->_manager;
  if (manager)
  {
    v12 = manager;
    NSAppendPrintF_safe();
    v6 = v4;

    v4 = v6;
  }
  detectionSession = self->_detectionSession;
  if (detectionSession)
  {
    v13 = detectionSession;
    NSAppendPrintF_safe();
    v8 = v4;

    v4 = v8;
  }
  if (v4)
    v9 = v4;
  else
    v9 = &stru_1E87DD6B8;
  v10 = v9;

  return v10;
}

- (BOOL)_authorizedAndReturnError:(id *)a3
{
  int v4;
  BOOL v5;
  BOOL v6;
  id v8;

  if (!MEMORY[0x1E0DB0F98])
  {
    if (!a3)
      return 0;
    ENErrorF();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    goto LABEL_10;
  }
  xpc_connection_get_audit_token();
  v4 = TCCAccessCheckAuditToken();
  v5 = v4 != 0;
  if (v4)
    v6 = 1;
  else
    v6 = a3 == 0;
  if (!v6)
  {
    ENErrorF();
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    *a3 = v8;
  }
  return v5;
}

- (BOOL)_authorizationPreflightUnknownAndReturnError:(id *)a3
{
  BOOL result;
  id v5;

  if (MEMORY[0x1E0DB0F98])
  {
    xpc_connection_get_audit_token();
    return TCCAccessPreflightWithAuditToken() == 2;
  }
  else if (a3)
  {
    ENErrorF();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v5;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)_rateLimitAndReturnError:(id *)a3
{
  unint64_t Int64;
  double Current;
  double v7;
  int v8;
  ENDaemon *daemon;
  unsigned int v10;
  unint64_t v11;

  Int64 = CFPrefs_GetInt64();
  Current = CFAbsoluteTimeGetCurrent();
  CFPrefs_GetDouble();
  if (vabdd_f64(Current, v7) >= 86400.0)
  {
    CFPrefs_SetDouble();
    Int64 = 0;
  }
  v8 = -[ENXPCClient appAPIVersion](self->_client, "appAPIVersion");
  daemon = self->_daemon;
  if (v8 < 2)
    v10 = -[ENDaemon prefRateLimitMaxAPICount](daemon, "prefRateLimitMaxAPICount");
  else
    v10 = -[ENDaemon prefRateLimitMaxAPICountV2](daemon, "prefRateLimitMaxAPICountV2");
  v11 = v10;
  if (Int64 >= v10)
  {
    if (a3)
    {
      ENErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    CFPrefs_SetInt64();
  }
  return Int64 < v11;
}

- (id)_regionConfigForXPCRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[ENDaemon configurationManager](self->_daemon, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "region");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ENXPCDecodeSecureObjectIfPresent();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "configurationStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configurationForRegion:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        if (a4)
          goto LABEL_15;
        goto LABEL_16;
      }
    }
    else
    {
      if (!v10)
      {
        if (a4)
          goto LABEL_15;
        goto LABEL_16;
      }
      objc_msgSend(v7, "configurationStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "configurationForRegion:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        if (a4)
        {
LABEL_15:
          ENErrorF();
          v13 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
LABEL_16:
        v13 = 0;
      }
    }
LABEL_8:

    goto LABEL_9;
  }
  if (a4)
  {
    ENErrorF();
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (id)_regionServerConfigForXPCRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[ENDaemon configurationManager](self->_daemon, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "region");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ENXPCDecodeSecureObjectIfPresent();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "configurationStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serverConfigurationForRegion:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        if (a4)
          goto LABEL_15;
        goto LABEL_16;
      }
    }
    else
    {
      if (!v10)
      {
        if (a4)
          goto LABEL_15;
        goto LABEL_16;
      }
      objc_msgSend(v7, "configurationStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serverConfigurationForRegion:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        if (a4)
        {
LABEL_15:
          ENErrorF();
          v13 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
LABEL_16:
        v13 = 0;
      }
    }
LABEL_8:

    goto LABEL_9;
  }
  if (a4)
  {
    ENErrorF();
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v6;
  OS_xpc_object *v7;
  xpc_object_t reply;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self->_xpcCnx;
  if (v7)
  {
    reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      -[ENXPCConnection _xpcSendReplyError:reply:](self, "_xpcSendReplyError:reply:", v9, reply);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_xpcSendReplyError:(id)a3 reply:(id)a4
{
  id v6;
  OS_xpc_object *v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  void *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = self->_xpcCnx;
  if (v7)
  {
    CUXPCEncodeNSError();
    xpc_connection_send_message(v7, v6);
    -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
    v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    if (v8 != CFSTR("com.apple.enutil"))
    {
      v9 = v8;
      if (!v8
        || (v10 = -[__CFString isEqual:](v8, "isEqual:", CFSTR("com.apple.enutil")),
            v9,
            v9,
            (v10 & 1) == 0))
      {
        objc_msgSend(v16, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CAA290]);

        if (v12)
        {
          v13 = objc_msgSend(v16, "code") - 5;
          if (v13 <= 0xB && ((0xCE9u >> v13) & 1) != 0)
          {
            v14 = dword_1CC2511FC[v13];
            -[ENDaemon delegate](self->_daemon, "delegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "sendErrorMetricWithType:", v14);

          }
        }
      }
    }
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_xpcEntitlementCheck:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  xpc_object_t reply;
  id v9;

  v4 = a3;
  v9 = 0;
  v5 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &v9);
  v6 = v9;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (v5)
  {
    if (-[ENDaemon getOverallStatus](self->_daemon, "getOverallStatus") == 4)
    {
      ENErrorF();
      v7 = objc_claimAutoreleasedReturnValue();

      -[ENXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v7, v4);
      v6 = (id)v7;
    }
    else
    {
      reply = xpc_dictionary_create_reply(v4);
      if (reply)
      {
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
  else
  {
    -[ENXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v6, v4);
  }

}

- (void)_xpcGetUserTraveled:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  BOOL v9;
  id *v10;
  BOOL v11;
  id *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD v25[5];
  id v26;
  void *v27;
  void *v28;
  uint64_t *v29;
  id v30;
  id v31;
  id v32;
  id obj;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  id *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v4 = a3;
  v37 = 0;
  v38 = (id *)&v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __39__ENXPCConnection__xpcGetUserTraveled___block_invoke;
  v34[3] = &unk_1E87D9D88;
  v36 = &v37;
  v34[4] = self;
  v6 = v4;
  v35 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v34);
  v8 = v38;
  obj = v38[5];
  v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &obj);
  objc_storeStrong(v8 + 5, obj);
  if (v9)
  {
    v10 = v38;
    v32 = v38[5];
    v11 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v32);
    objc_storeStrong(v10 + 5, v32);
    if (v11)
    {
      v12 = v38;
      v31 = v38[5];
      v13 = -[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", &v31);
      objc_storeStrong(v12 + 5, v31);
      if (v13)
      {
        if (-[ENDaemon overallStatus](self->_daemon, "overallStatus") != 1
          || (-[ENDaemon regionMonitor](self->_daemon, "regionMonitor"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "getAuthorizationState"),
              v14,
              v15 != 2))
        {
          ENErrorF();
          v22 = objc_claimAutoreleasedReturnValue();
          v17 = v38[5];
          v38[5] = (id)v22;
          goto LABEL_15;
        }
        v16 = v38;
        v30 = v38[5];
        -[ENXPCConnection _regionConfigForXPCRequest:error:](self, "_regionConfigForXPCRequest:error:", v6, &v30);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v16 + 5, v30);
        if (!v17)
        {
LABEL_15:

          goto LABEL_16;
        }
        -[ENDaemon configurationManager](self->_daemon, "configurationManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "configurationStore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          ENErrorF();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v38[5];
          v38[5] = (id)v23;

          goto LABEL_14;
        }
        v20 = objc_msgSend(v17, "travelerModeEnabled");
        if (v20 == 1)
        {
          v21 = 0;
        }
        else
        {
          if (!v20)
          {
            v25[0] = v5;
            v25[1] = 3221225472;
            v25[2] = __39__ENXPCConnection__xpcGetUserTraveled___block_invoke_2;
            v25[3] = &unk_1E87DA740;
            v25[4] = self;
            v29 = &v37;
            v26 = v6;
            v27 = v17;
            v28 = v19;
            -[ENXPCConnection _xpcGetUserTraveledPromptWithCompletion:](self, "_xpcGetUserTraveledPromptWithCompletion:", v25);

LABEL_14:
            goto LABEL_15;
          }
          v21 = 1;
        }
        -[ENXPCConnection _xpcGetUserTraveledReplyAllowed:request:](self, "_xpcGetUserTraveledReplyAllowed:request:", v21, v6);
        goto LABEL_14;
      }
    }
  }
LABEL_16:
  v7[2](v7);

  _Block_object_dispose(&v37, 8);
}

uint64_t __39__ENXPCConnection__xpcGetUserTraveled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __39__ENXPCConnection__xpcGetUserTraveled___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  id v16;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  else
  {
    if ((_DWORD)a2)
      v5 = 2;
    else
      v5 = 1;
    objc_msgSend(*(id *)(a1 + 48), "setTravelerModeEnabled:", v5);
    v7 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(id *)(v8 + 40);
    v9 = objc_msgSend(v6, "saveRegionConfiguration:error:", v7, &v16);
    objc_storeStrong((id *)(v8 + 40), v16);
    v10 = *(_QWORD **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v10, "_xpcGetUserTraveledReplyAllowed:request:", a2, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v11 = v10[6];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __39__ENXPCConnection__xpcGetUserTraveled___block_invoke_3;
      v13[3] = &unk_1E87DA718;
      v12 = *(_QWORD *)(a1 + 64);
      v13[4] = v10;
      v15 = v12;
      v14 = *(id *)(a1 + 40);
      dispatch_async(v11, v13);

    }
  }
}

uint64_t __39__ENXPCConnection__xpcGetUserTraveled___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
}

- (void)_xpcGetUserTraveledPromptWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int Int64Ranged;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  const __CFString *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[6];
  id v22;
  _QWORD v23[6];
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3;
  v32 = __Block_byref_object_dispose__3;
  v5 = MEMORY[0x1E0C809B0];
  v33 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke;
  v25[3] = &unk_1E87DA768;
  v27 = &v28;
  v6 = v4;
  v26 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v25);
  if (self->_userAlert
    || (-[ENDaemon userAlert](self->_daemon, "userAlert"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    ENErrorF();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (id)v29[5];
    v29[5] = v9;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CFE2F8]);
    objc_msgSend(v10, "applicationInfoForPID:", -[ENXPCClient pid](self->_client, "pid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Int64Ranged = CFDictionaryGetInt64Ranged();
    objc_msgSend(v10, "invalidate");
    if (Int64Ranged == 8)
    {
      -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:placeholder:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedName");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc_init(MEMORY[0x1E0CAA3E0]);
        objc_storeStrong((id *)&self->_userAlert, v16);
        objc_msgSend(v16, "setDispatchQueue:", self->_dispatchQueue);
        objc_msgSend(v16, "setTitleKey:", CFSTR("SHARE_TRAVEL_TITLE_FORMAT"));
        if (v15)
          v17 = v15;
        else
          v17 = CFSTR("?");
        objc_msgSend(v16, "setTitleParameter:", v17);
        objc_msgSend(v16, "setSubTitleKey:", CFSTR("SHARE_TRAVEL_MESSAGE"));
        objc_msgSend(v16, "setDefaultButtonTitleKey:", CFSTR("SHARE_BUTTON"));
        objc_msgSend(v16, "setAlternativeButtonTitleKey:", CFSTR("DONT_SHARE_BUTTON"));
        v23[0] = v5;
        v23[1] = 3221225472;
        v23[2] = __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke_2;
        v23[3] = &unk_1E87DA790;
        v23[4] = self;
        v23[5] = v16;
        v18 = v6;
        v24 = v18;
        objc_msgSend(v16, "setActionHandler:", v23);
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        v21[0] = v5;
        v21[1] = 3221225472;
        v21[2] = __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke_3;
        v21[3] = &unk_1E87DA7B8;
        v21[4] = self;
        v21[5] = v16;
        v22 = v18;
        objc_msgSend(v16, "activateWithCompletionHandler:", v21);

      }
      else
      {
        ENErrorF();
        v20 = objc_claimAutoreleasedReturnValue();
        v15 = (__CFString *)v29[5];
        v29[5] = v20;
      }

    }
    else
    {
      ENErrorF();
      v19 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v29[5];
      v29[5] = v19;
    }

  }
  v7[2](v7);

  _Block_object_dispose(&v28, 8);
}

uint64_t __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v4 = a1[4];
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

  v6 = (void *)a1[5];
  objc_msgSend(*(id *)(a1[4] + 32), "userAlert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    objc_msgSend(*(id *)(a1[4] + 32), "setUserAlert:", 0);
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(a1[6] + 16))(a1[6], a2 == 1, 0);
}

void __59__ENXPCConnection__xpcGetUserTraveledPromptWithCompletion___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v3 = a1[4];
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;

    v5 = (void *)a1[5];
    objc_msgSend(*(id *)(a1[4] + 32), "userAlert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
      objc_msgSend(*(id *)(a1[4] + 32), "setUserAlert:", 0);
    (*(void (**)(_QWORD))(a1[6] + 16))(a1[6]);
  }
  else if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_xpcGetUserTraveledReplyAllowed:(BOOL)a3 request:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  int v18;
  xpc_object_t reply;
  uint64_t v20;
  void *v21;
  id obj;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v31 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__ENXPCConnection__xpcGetUserTraveledReplyAllowed_request___block_invoke;
  v23[3] = &unk_1E87D9D88;
  v25 = &v26;
  v23[4] = self;
  v7 = v6;
  v24 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v23);
  if (!v4)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v16 = 0;
    goto LABEL_16;
  }
  -[ENDaemon activeEntity](self->_daemon, "activeEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENDaemon regionMonitor](self->_daemon, "regionMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(v27 + 5);
  obj = (id)v27[5];
  objc_msgSend(v12, "getAllRegionsWithError:", &obj);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v13, obj);

  if (v27[5])
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    goto LABEL_26;
  }
  if (!v14 || !v11)
  {
    ENErrorF();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v27[5];
    v27[5] = v20;

LABEL_26:
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99E28], "setWithSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v11);
  v16 = (unint64_t)objc_msgSend(v15, "count") > 1;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

  if (v18 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();

LABEL_16:
  reply = xpc_dictionary_create_reply(v7);
  v11 = reply;
  if (reply)
  {
    xpc_dictionary_set_BOOL(reply, "userTraveled", v16);
    -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v11);
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_18:

  v8[2](v8);
  _Block_object_dispose(&v26, 8);

}

uint64_t __59__ENXPCConnection__xpcGetUserTraveledReplyAllowed_request___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetTravelStatusEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  xpc_object_t reply;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id obj;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v31 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__ENXPCConnection__xpcGetTravelStatusEnabled___block_invoke;
  v23[3] = &unk_1E87D9D88;
  v25 = &v26;
  v23[4] = self;
  v5 = v4;
  v24 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v23);
  v7 = (id *)(v27 + 5);
  obj = (id)v27[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v27 + 5);
    v21 = (id)v27[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v21);
    objc_storeStrong(v9, v21);
    if (v10)
    {
      v11 = (id *)(v27 + 5);
      v20 = (id)v27[5];
      -[ENXPCConnection _regionConfigForXPCRequest:error:](self, "_regionConfigForXPCRequest:error:", v5, &v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v11, v20);
      if (v12)
      {
        v13 = objc_msgSend(v12, "travelerModeEnabled");
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isSensitiveLoggingAllowed");

        if (v15
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v12, "region");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "regionCode");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        reply = xpc_dictionary_create_reply(v5);
        v18 = reply;
        if (reply)
        {
          xpc_dictionary_set_BOOL(reply, "enbd", v13 == 2);
          -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v18);
        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v26, 8);
}

uint64_t __46__ENXPCConnection__xpcGetTravelStatusEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetTravelStatusEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  id *v21;
  int v22;
  xpc_object_t reply;
  uint64_t v24;
  const char *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id obj;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v4 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3;
  v38 = __Block_byref_object_dispose__3;
  v39 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __46__ENXPCConnection__xpcSetTravelStatusEnabled___block_invoke;
  v31[3] = &unk_1E87D9D88;
  v33 = &v34;
  v31[4] = self;
  v5 = v4;
  v32 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v31);
  v7 = (id *)(v35 + 5);
  obj = (id)v35[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v35 + 5);
    v29 = (id)v35[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v29);
    objc_storeStrong(v9, v29);
    if (v10)
    {
      -[ENDaemon configurationManager](self->_daemon, "configurationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configurationStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (id *)(v35 + 5);
        v28 = (id)v35[5];
        -[ENXPCConnection _regionConfigForXPCRequest:error:](self, "_regionConfigForXPCRequest:error:", v5, &v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v13, v28);
        if (v14)
        {
          v15 = xpc_dictionary_get_BOOL(v5, "enbd");
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isSensitiveLoggingAllowed");

          if (v17
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            if (v15)
              v18 = "yes";
            else
              v18 = "no";
            objc_msgSend(v14, "region");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "regionCode");
            v25 = v18;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
          if (v15)
            v20 = 2;
          else
            v20 = 1;
          objc_msgSend(v14, "setTravelerModeEnabled:", v20, v25, v26);
          v21 = (id *)(v35 + 5);
          v27 = (id)v35[5];
          v22 = objc_msgSend(v12, "saveRegionConfiguration:error:", v14, &v27);
          objc_storeStrong(v21, v27);
          if (v22)
          {
            -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
            reply = xpc_dictionary_create_reply(v5);
            if (reply)
            {
              -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
            }
            else if (gLogCategory__ENDaemon <= 90
                   && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }

          }
        }
      }
      else
      {
        ENErrorF();
        v24 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v35[5];
        v35[5] = v24;
      }

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v34, 8);
}

uint64_t __46__ENXPCConnection__xpcSetTravelStatusEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)xpcReportActivityFlags:(unsigned int)a3
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, "mTyp", 19);
  xpc_dictionary_set_uint64(xdict, "actF", a3);
  -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", xdict);

}

- (void)_xpcSetEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  id *v11;
  BOOL v12;
  _BOOL4 v13;
  const char *v14;
  ENDaemon *daemon;
  void *v16;
  void *v17;
  xpc_object_t reply;
  uint64_t v19;
  const char *v20;
  id v21;
  id v22;
  id obj;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __34__ENXPCConnection__xpcSetEnabled___block_invoke;
  v24[3] = &unk_1E87D9D88;
  v26 = &v27;
  v24[4] = self;
  v5 = v4;
  v25 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v24);
  v7 = (id *)(v28 + 5);
  obj = (id)v28[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v28 + 5);
    v22 = (id)v28[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v22);
    objc_storeStrong(v9, v22);
    if (v10)
    {
      v11 = (id *)(v28 + 5);
      v21 = (id)v28[5];
      v12 = -[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", &v21);
      objc_storeStrong(v11, v21);
      if (v12)
      {
        if (-[ENXPCClient accessLevel](self->_client, "accessLevel") == 3)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          CFPrefs_SetValue();
        }
        else if (-[ENXPCClient accessLevel](self->_client, "accessLevel") == 2)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          CFPrefs_RemoveValue();
        }
        -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
        v13 = xpc_dictionary_get_BOOL(v5, "enbd");
        if (-[ENDaemon overallStatus](self->_daemon, "overallStatus") == 4)
        {
          ENErrorF();
          v19 = objc_claimAutoreleasedReturnValue();
          reply = (xpc_object_t)v28[5];
          v28[5] = v19;
        }
        else
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v14 = "Disable";
            if (v13)
              v14 = "Enable";
            v20 = v14;
            LogPrintF_safe();
          }
          CFPrefs_SetValue();
          daemon = self->_daemon;
          if (v13)
            -[ENDaemon setUsageUserEnabled:](daemon, "setUsageUserEnabled:", -[ENDaemon usageUserEnabled](self->_daemon, "usageUserEnabled") + 1);
          else
            -[ENDaemon setUsageUserDisabled:](daemon, "setUsageUserDisabled:", -[ENDaemon usageUserDisabled](self->_daemon, "usageUserDisabled") + 1);
          -[ENDaemon prefsChanged](self->_daemon, "prefsChanged", v20);
          -[ENXPCConnection client](self, "client");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appRegion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            -[ENDaemon startServerConfigurationFetchForRegion:](self->_daemon, "startServerConfigurationFetchForRegion:", v17);

          reply = xpc_dictionary_create_reply(v5);
          if (reply)
          {
            -[ENXPCConnection _xpcMessageAddCommonKeys:allowed:](self, "_xpcMessageAddCommonKeys:allowed:", reply, 1);
            -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
          }
          else if (gLogCategory__ENDaemon <= 90
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }

      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v27, 8);
}

uint64_t __34__ENXPCConnection__xpcSetEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetPaused:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  _BOOL4 v11;
  double v12;
  xpc_object_t reply;
  void *v14;
  id v15;
  id obj;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __33__ENXPCConnection__xpcSetPaused___block_invoke;
  v17[3] = &unk_1E87D9D88;
  v19 = &v20;
  v17[4] = self;
  v5 = v4;
  v18 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v17);
  v7 = (id *)(v21 + 5);
  obj = (id)v21[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v21 + 5);
    v15 = (id)v21[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v15);
    objc_storeStrong(v9, v15);
    if (v10)
    {
      v11 = xpc_dictionary_get_BOOL(v5, "paus");
      v12 = xpc_dictionary_get_double(v5, "dura");
      CFPrefs_SetValue();
      if (v11)
      {
        if (v12 <= 0.0)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          CFPrefs_RemoveValue();
        }
        else
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            CUPrintDurationDouble();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
          CFAbsoluteTimeGetCurrent();
          CFPrefs_SetDouble();
        }
        -[ENDaemon setUsageUserPaused:](self->_daemon, "setUsageUserPaused:", -[ENDaemon usageUserPaused](self->_daemon, "usageUserPaused", v14) + 1);
      }
      else
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        CFPrefs_RemoveValue();
        -[ENDaemon setUsageUserUnpaused:](self->_daemon, "setUsageUserUnpaused:", -[ENDaemon usageUserUnpaused](self->_daemon, "usageUserUnpaused") + 1);
      }
      -[ENDaemon pauseUpdate](self->_daemon, "pauseUpdate");
      -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
      reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        -[ENXPCConnection _xpcMessageAddCommonKeys:allowed:](self, "_xpcMessageAddCommonKeys:allowed:", reply, 1);
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v20, 8);
}

uint64_t __33__ENXPCConnection__xpcSetPaused___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)xpcStatusChanged
{
  _BOOL8 v3;
  id v4;

  v3 = -[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", 0);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "mTyp", 12);
  -[ENXPCConnection _xpcMessageAddCommonKeys:allowed:](self, "_xpcMessageAddCommonKeys:allowed:", v4, v3);
  -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v4);

}

- (void)_xpcGetPreAuthorizeDiagnosisKeysEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  id *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  id *v18;
  xpc_object_t reply;
  void *v20;
  id v21;
  id v22;
  id v23;
  id obj;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3;
  v32 = __Block_byref_object_dispose__3;
  v33 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__ENXPCConnection__xpcGetPreAuthorizeDiagnosisKeysEnabled___block_invoke;
  v25[3] = &unk_1E87D9D88;
  v27 = &v28;
  v25[4] = self;
  v5 = v4;
  v26 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v25);
  v7 = (id *)(v29 + 5);
  obj = (id)v29[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v29 + 5);
    v23 = (id)v29[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v23);
    objc_storeStrong(v9, v23);
    if (v10)
    {
      v11 = (id *)(v29 + 5);
      v22 = (id)v29[5];
      -[ENXPCConnection _regionConfigForXPCRequest:error:](self, "_regionConfigForXPCRequest:error:", v5, &v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v11, v22);
      if (v12)
      {
        objc_msgSend(v12, "diagnosisKeysPreAuthorization");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "userAuthorization");

        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isSensitiveLoggingAllowed");

        if (v16
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          -[ENXPCConnection client](self, "client");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        if (v14 == 1
          || (v18 = (id *)(v29 + 5),
              v21 = (id)v29[5],
              -[ENXPCConnection updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:](self, "updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:", v5, 0, &v21), objc_storeStrong(v18, v21), !v29[5]))
        {
          reply = xpc_dictionary_create_reply(v5);
          v20 = reply;
          if (reply)
          {
            xpc_dictionary_set_BOOL(reply, "enbd", v14 == 1);
            -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v20);
          }
          else if (gLogCategory__ENDaemon <= 90
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }

        }
      }

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v28, 8);
}

uint64_t __59__ENXPCConnection__xpcGetPreAuthorizeDiagnosisKeysEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetPreAuthorizeDiagnosisKeysEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  id *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id *v19;
  xpc_object_t reply;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id obj;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v4 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __59__ENXPCConnection__xpcSetPreAuthorizeDiagnosisKeysEnabled___block_invoke;
  v28[3] = &unk_1E87D9D88;
  v30 = &v31;
  v28[4] = self;
  v5 = v4;
  v29 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v28);
  v7 = (id *)(v32 + 5);
  obj = (id)v32[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v32 + 5);
    v26 = (id)v32[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v26);
    objc_storeStrong(v9, v26);
    if (v10)
    {
      v11 = (id *)(v32 + 5);
      v25 = (id)v32[5];
      -[ENXPCConnection _regionServerConfigForXPCRequest:error:](self, "_regionServerConfigForXPCRequest:error:", v5, &v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v11, v25);
      if (v12)
      {
        if (-[ENDaemon _isNKDActive](self->_daemon, "_isNKDActive")
          && (objc_msgSend(v12, "preArmTestVerificationEnabled") & 1) == 0)
        {
          ENErrorF();
          v21 = objc_claimAutoreleasedReturnValue();
          reply = (xpc_object_t)v32[5];
          v32[5] = v21;
        }
        else
        {
          v13 = xpc_dictionary_get_BOOL(v5, "enbd");
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isSensitiveLoggingAllowed");

          if (v15
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            -[ENXPCConnection client](self, "client");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            v18 = "no";
            if (v13)
              v18 = "yes";
            v22 = v18;
            v23 = v16;
            LogPrintF_safe();

          }
          v19 = (id *)(v32 + 5);
          v24 = (id)v32[5];
          -[ENXPCConnection updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:](self, "updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:", v5, v13, &v24, v22, v23);
          objc_storeStrong(v19, v24);
          if (v32[5])
            goto LABEL_17;
          reply = xpc_dictionary_create_reply(v5);
          if (reply)
          {
            -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
          }
          else if (gLogCategory__ENDaemon <= 90
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }

      }
LABEL_17:

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v31, 8);
}

uint64_t __59__ENXPCConnection__xpcSetPreAuthorizeDiagnosisKeysEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcPreAuthorizeDiagnosisKeys:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  void *v10;
  const uint8_t *uuid;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id obj;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__ENXPCConnection__xpcPreAuthorizeDiagnosisKeys___block_invoke;
  v22[3] = &unk_1E87D9D88;
  v24 = &v25;
  v22[4] = self;
  v5 = v4;
  v23 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v22);
  v7 = (id *)(v26 + 5);
  obj = (id)v26[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v26 + 5);
    v20 = (id)v26[5];
    -[ENXPCConnection _regionServerConfigForXPCRequest:error:](self, "_regionServerConfigForXPCRequest:error:", v5, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v20);
    if (!v10)
    {
LABEL_15:

      goto LABEL_16;
    }
    if (-[ENDaemon _isNKDActive](self->_daemon, "_isNKDActive")
      && (objc_msgSend(v10, "preArmTestVerificationEnabled") & 1) == 0
      || (uuid = xpc_dictionary_get_uuid(v5, "rpsid")) == 0)
    {
      ENErrorF();
      v19 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v26[5];
      v26[5] = v19;
      goto LABEL_14;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A30]), "initWithUUIDBytes:", uuid);
    -[ENDaemon remoteUISessions](self->_daemon, "remoteUISessions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "setOriginalRequest:", v5);
      objc_msgSend(v14, "setConnection:", self);
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isSensitiveLoggingAllowed");

      if (!v16 || gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_13;
      -[ENXPCConnection client](self, "client");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
    else
    {
      ENErrorF();
      v18 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v26[5];
      v26[5] = v18;
    }

LABEL_13:
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
  v6[2](v6);

  _Block_object_dispose(&v25, 8);
}

uint64_t __49__ENXPCConnection__xpcPreAuthorizeDiagnosisKeys___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return objc_msgSend(*(id *)(v1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), *(_QWORD *)(v1 + 40));
  }
  return result;
}

- (void)_xpcPreAuthorizeDiagnosisKeysComplete:(id)a3 userDecision:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id *v14;
  xpc_object_t reply;
  uint64_t v16;
  void *v17;
  int v18;
  const char *v19;
  uint64_t v20;
  id obj;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a4;
  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __70__ENXPCConnection__xpcPreAuthorizeDiagnosisKeysComplete_userDecision___block_invoke;
  v22[3] = &unk_1E87D9D88;
  v24 = &v25;
  v22[4] = self;
  v7 = v6;
  v23 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v22);
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

  if (v10 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    -[ENXPCConnection client](self, "client");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = "no";
    if (v4)
      v13 = "yes";
    v19 = v13;
    v20 = v11;
    LogPrintF_safe();

  }
  v14 = (id *)(v26 + 5);
  obj = (id)v26[5];
  -[ENXPCConnection updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:](self, "updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:", v7, v4, &obj, v19, v20);
  objc_storeStrong(v14, obj);
  if (!v26[5])
  {
    if (v4)
    {
      reply = xpc_dictionary_create_reply(v7);
      if (reply)
      {
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      }
      else
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

        if (v18
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
    else
    {
      ENErrorF();
      v16 = objc_claimAutoreleasedReturnValue();
      reply = (xpc_object_t)v26[5];
      v26[5] = v16;
    }

  }
  v8[2](v8);

  _Block_object_dispose(&v25, 8);
}

uint64_t __70__ENXPCConnection__xpcPreAuthorizeDiagnosisKeysComplete_userDecision___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return objc_msgSend(*(id *)(v1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), *(_QWORD *)(v1 + 40));
  }
  return result;
}

- (void)_xpcRequestPreAuthorizedDiagnosisKeys:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  id *v14;
  void *reply;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  id obj;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v31 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __57__ENXPCConnection__xpcRequestPreAuthorizedDiagnosisKeys___block_invoke;
  v23[3] = &unk_1E87D9D88;
  v25 = &v26;
  v23[4] = self;
  v5 = v4;
  v24 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v23);
  v7 = (id *)(v27 + 5);
  obj = (id)v27[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    if (-[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", 0))
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

      if (v10
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        -[ENXPCConnection client](self, "client");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      CFStringGetTypeID();
      v11 = (void *)CFPrefs_CopyTypedValue();
      if (v11)
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isSensitiveLoggingAllowed");

        if (v13
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
      else
      {
        v14 = (id *)(v27 + 5);
        v21 = (id)v27[5];
        -[ENXPCConnection enqueuePreAuthorizedLockScreenActionForRequest:outError:](self, "enqueuePreAuthorizedLockScreenActionForRequest:outError:", v5, &v21);
        objc_storeStrong(v14, v21);
        if (v27[5])
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      }
      else
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isSensitiveLoggingAllowed");

        if (v19
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
    else
    {
      -[ENXPCConnection client](self, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "signingIdentity");
      reply = (void *)objc_claimAutoreleasedReturnValue();
      ENErrorF();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v27[5];
      v27[5] = v16;

    }
    goto LABEL_17;
  }
LABEL_18:
  v6[2](v6);

  _Block_object_dispose(&v26, 8);
}

uint64_t __57__ENXPCConnection__xpcRequestPreAuthorizedDiagnosisKeys___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return objc_msgSend(*(id *)(v1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), *(_QWORD *)(v1 + 40));
  }
  return result;
}

- (void)enqueuePreAuthorizedLockScreenActionForRequest:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;
  id obj;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v31 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __75__ENXPCConnection_enqueuePreAuthorizedLockScreenActionForRequest_outError___block_invoke;
  v25[3] = &unk_1E87DA7E0;
  v25[4] = &v26;
  v25[5] = a4;
  v8 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v25);
  if (-[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", 0))
  {
    v9 = (id *)(v27 + 5);
    obj = (id)v27[5];
    -[ENXPCConnection _regionConfigForXPCRequest:error:](self, "_regionConfigForXPCRequest:error:", v6, &obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, obj);
    if (v10)
    {
      CFPrefs_RemoveValue();
      objc_msgSend(v10, "diagnosisKeysPreAuthorization");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userAuthorization");

      if (v12 == 1)
      {
        -[ENXPCConnection client](self, "client");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "signingIdentity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        CFPrefs_SetValue();

        location = 0;
        objc_initWeak(&location, self);
        v21[0] = v7;
        v21[1] = 3221225472;
        v21[2] = __75__ENXPCConnection_enqueuePreAuthorizedLockScreenActionForRequest_outError___block_invoke_2;
        v21[3] = &unk_1E87DA430;
        objc_copyWeak(&v22, &location);
        v15 = (void *)MEMORY[0x1D17A7E5C](v21);
        -[ENDaemon enqueueScreenUnlockAction:withIdentifier:](self->_daemon, "enqueueScreenUnlockAction:withIdentifier:", v15, CFSTR("PreArmUnlockActionIdentifier"));

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      else
      {
        ENErrorF();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v27[5];
        v27[5] = v18;

      }
    }
  }
  else
  {
    -[ENXPCConnection client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signingIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ENErrorF();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v27[5];
    v27[5] = v16;

  }
  v8[2](v8);

  _Block_object_dispose(&v26, 8);
}

void __75__ENXPCConnection_enqueuePreAuthorizedLockScreenActionForRequest_outError___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (*(_QWORD *)(a1 + 40))
      **(_QWORD **)(a1 + 40) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
}

void __75__ENXPCConnection_enqueuePreAuthorizedLockScreenActionForRequest_outError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcPreAuthorizedDiagnosisKeysAvailable");

}

- (void)updateDiagnosisKeysPreAuthorizationForRequest:(id)a3 withDecision:(BOOL)a4 errorOut:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  id *v10;
  void *v11;
  const char *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  double v51;
  id v52;
  void *v53;
  void (**v54)(_QWORD);
  id v55;
  id obj;
  _QWORD v57[6];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v6 = a4;
  v8 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__3;
  v62 = __Block_byref_object_dispose__3;
  v63 = 0;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __87__ENXPCConnection_updateDiagnosisKeysPreAuthorizationForRequest_withDecision_errorOut___block_invoke;
  v57[3] = &unk_1E87DA7E0;
  v57[4] = &v58;
  v57[5] = a5;
  v9 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v57);
  v10 = (id *)(v59 + 5);
  obj = (id)v59[5];
  -[ENXPCConnection _regionConfigForXPCRequest:error:](self, "_regionConfigForXPCRequest:error:", v8, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);
  if (v11)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v12 = "no";
      if (v6)
        v12 = "yes";
      v51 = *(double *)&v12;
      LogPrintF_safe();
    }
    if (v6)
    {
      v54 = v9;
      CFPrefs_GetDouble();
      v14 = v13;
      if (v13 > 0.0
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        v51 = v14;
        LogPrintF_safe();
      }
      objc_msgSend(MEMORY[0x1E0C99D60], "date", *(_QWORD *)&v51);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 432000.0;
      if (v14 > 0.0)
        v17 = v14;
      objc_msgSend(v15, "dateByAddingTimeInterval:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "diagnosisKeysPreAuthorization");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA3E8]), "initWithIdentifier:", CFSTR("DiagnosisKeysPreAuthorization"));
        objc_msgSend(v11, "setDiagnosisKeysPreAuthorization:", v20);

      }
      objc_msgSend(v11, "diagnosisKeysPreAuthorization");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setUserAuthorization:withExpiration:", 1, v18);
      v53 = (void *)v18;

      xpc_dictionary_get_value(v8, "meta");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1D17A8408]();
      v24 = (void *)MEMORY[0x1E0C9AA68];
      v25 = (void *)MEMORY[0x1E0C9AA68];
      if (v23 == MEMORY[0x1E0C812F8])
        v25 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      v52 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = v24;
      v27 = v26;
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CAA280]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(v11, "diagnosisKeysPreAuthorization");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if ((isKindOfClass & 1) != 0)
        v32 = v28;
      else
        v32 = 0;
      objc_msgSend(v30, "setSymptomOnsetDate:", v32);

      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CAA288]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v34 = objc_opt_isKindOfClass();
      objc_msgSend(v11, "diagnosisKeysPreAuthorization");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if ((v34 & 1) != 0)
        v37 = v33;
      else
        v37 = 0;
      objc_msgSend(v35, "setDidUserTravel:", v37);

      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CAA278]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v39 = objc_opt_isKindOfClass();
      objc_msgSend(v11, "diagnosisKeysPreAuthorization");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if ((v39 & 1) != 0)
        v42 = v38;
      else
        v42 = 0;
      objc_msgSend(v40, "setIsUserVaccinated:", v42);

      v9 = v54;
      v8 = v52;
    }
    else
    {
      objc_msgSend(v11, "setDiagnosisKeysPreAuthorization:", 0);
    }
    -[ENDaemon configurationManager](self->_daemon, "configurationManager", *(_QWORD *)&v51);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "configurationStore");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = (id *)(v59 + 5);
      v55 = (id)v59[5];
      v46 = objc_msgSend(v44, "saveRegionConfiguration:error:", v11, &v55);
      objc_storeStrong(v45, v55);
      if (!v46)
        goto LABEL_42;
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isSensitiveLoggingAllowed");

      if (!v48 || gLogCategory_ENDaemon > 30 || gLogCategory_ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_42;
      objc_msgSend(v11, "diagnosisKeysPreAuthorization");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
    else
    {
      ENErrorF();
      v50 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v59[5];
      v59[5] = v50;
    }

LABEL_42:
  }

  v9[2](v9);
  _Block_object_dispose(&v58, 8);

}

void __87__ENXPCConnection_updateDiagnosisKeysPreAuthorizationForRequest_withDecision_errorOut___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    if (*(_QWORD *)(a1 + 40))
      **(_QWORD **)(a1 + 40) = objc_retainAutorelease(v2);
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
}

- (void)xpcPreAuthorizedDiagnosisKeysAvailable
{
  void *v3;
  void *v4;
  void *v5;
  xpc_object_t v6;
  id *v7;
  void *v8;
  BOOL v9;
  id *v10;
  void *v11;
  uint64_t v12;
  ENXPCClient *client;
  id *v14;
  id v15;
  xpc_object_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  xpc_object_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  size_t count;
  void *v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  id obj;
  _QWORD v40[7];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  v46 = 0;
  -[ENXPCConnection client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signingIdentity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENDaemon activeEntity](self->_daemon, "activeEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "region");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __57__ENXPCConnection_xpcPreAuthorizedDiagnosisKeysAvailable__block_invoke;
  v40[3] = &unk_1E87D9D88;
  v40[6] = &v41;
  v40[4] = self;
  v40[5] = v32;
  v29 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v40);
  if (self->_xpcCnx)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "mTyp", 24);
    if (-[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", 0) && v32)
    {
      CFPrefs_RemoveValue();
      v7 = (id *)(v42 + 5);
      obj = (id)v42[5];
      -[ENXPCConnection _regionConfigForXPCRequest:error:](self, "_regionConfigForXPCRequest:error:", v6, &obj);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v7, obj);
      if (v30)
      {
        objc_msgSend(v30, "diagnosisKeysPreAuthorization");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "userAuthorization") == 1;

        if (v9)
        {
          v10 = (id *)(v42 + 5);
          v38 = (id)v42[5];
          -[ENXPCConnection updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:](self, "updateDiagnosisKeysPreAuthorizationForRequest:withDecision:errorOut:", v6, 0, &v38);
          objc_storeStrong(v10, v38);
          -[ENDaemon temporaryExposureKeyManager](self->_daemon, "temporaryExposureKeyManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = 144 * (((CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E0C9ADF0]) / 600.0) / 0x90) - 2016;
            client = self->_client;
            v14 = (id *)(v42 + 5);
            v37 = (id)v42[5];
            objc_msgSend(v11, "getTemporaryExposureKeysForClient:fromRollingStart:didPrompt:forTesting:forceRefresh:error:", client, v12, 1, 0, 0, &v37);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v14, v37);
            if (v15)
            {
              v16 = xpc_array_create(0, 0);
              v35 = 0u;
              v36 = 0u;
              v33 = 0u;
              v34 = 0u;
              v15 = v15;
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
              if (v17)
              {
                v18 = *(_QWORD *)v34;
                do
                {
                  for (i = 0; i != v17; ++i)
                  {
                    if (*(_QWORD *)v34 != v18)
                      objc_enumerationMutation(v15);
                    v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                    v21 = xpc_dictionary_create(0, 0, 0);
                    objc_msgSend(v20, "encodeWithXPCObject:", v21);
                    xpc_array_set_value(v16, 0xFFFFFFFFFFFFFFFFLL, v21);

                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
                }
                while (v17);
              }

              xpc_dictionary_set_value(v6, "tekA", v16);
              if (gLogCategory_ENDaemon <= 30
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                count = xpc_array_get_count(v16);
                LogPrintF_safe();
              }
              -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v6, count);

            }
          }
          else
          {
            ENErrorF();
            v26 = objc_claimAutoreleasedReturnValue();
            v15 = (id)v42[5];
            v42[5] = v26;
          }

        }
        else
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isSensitiveLoggingAllowed");

          if (v25
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }
      }

    }
    else
    {
      ENErrorF();
      v23 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v42[5];
      v42[5] = v23;

    }
  }
  else
  {
    ENErrorF();
    v22 = objc_claimAutoreleasedReturnValue();
    v6 = (xpc_object_t)v42[5];
    v42[5] = v22;
  }

  v29[2](v29);
  _Block_object_dispose(&v41, 8);

}

void __57__ENXPCConnection_xpcPreAuthorizedDiagnosisKeysAvailable__block_invoke(_QWORD *a1)
{
  id v1;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v1 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 32), "postPreAuthorizationNotificationForRegion:", a1[5]);
  }
}

- (void)_xpcGetDiagnosisKeys:(id)a3 testMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  id *v10;
  BOOL v11;
  id *v12;
  BOOL v13;
  id *v14;
  BOOL v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  const char *v20;
  const char *v21;
  id *v22;
  char v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  ENXPCClient *client;
  ENXPCClient *v31;
  const char *v32;
  const char *v33;
  id v34;
  id v35;
  id v36;
  id obj;
  _QWORD v38[5];
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v4 = a4;
  v6 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  v46 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __49__ENXPCConnection__xpcGetDiagnosisKeys_testMode___block_invoke;
  v38[3] = &unk_1E87D9D88;
  v40 = &v41;
  v38[4] = self;
  v7 = v6;
  v39 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v38);
  if (v4)
    v9 = 3;
  else
    v9 = 2;
  v10 = (id *)(v42 + 5);
  obj = (id)v42[5];
  v11 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", v9, &obj);
  objc_storeStrong(v10, obj);
  if (v11)
  {
    v12 = (id *)(v42 + 5);
    v36 = (id)v42[5];
    v13 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v36);
    objc_storeStrong(v12, v36);
    if (v13)
    {
      v14 = (id *)(v42 + 5);
      v35 = (id)v42[5];
      v15 = -[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", &v35);
      objc_storeStrong(v14, v35);
      if (v15)
      {
        -[ENDaemon temporaryExposureKeyManager](self->_daemon, "temporaryExposureKeyManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = xpc_dictionary_get_BOOL(v7, "refr");
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isSensitiveLoggingAllowed");

          if (v19
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v20 = "no";
            if (v4)
              v21 = "yes";
            else
              v21 = "no";
            if (v17)
              v20 = "yes";
            v32 = v21;
            v33 = v20;
            client = self->_client;
            LogPrintF_safe();
          }
          -[ENDaemon setUsageGetDiagnosisKeys:](self->_daemon, "setUsageGetDiagnosisKeys:", -[ENDaemon usageGetDiagnosisKeys](self->_daemon, "usageGetDiagnosisKeys", client, v32, v33) + 1);
          if (-[ENXPCClient entitledToSkipKeyReleasePrompt](self->_client, "entitledToSkipKeyReleasePrompt")
            || (objc_msgSend(v16, "requireKeyReleasePromptForClient:", self->_client) & 1) == 0)
          {
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isSensitiveLoggingAllowed");

            if (v25
              && gLogCategory_ENDaemon <= 50
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v31 = self->_client;
              LogPrintF_safe();
            }
            -[ENXPCConnection _xpcGetDiagnosisKeysCompletion:didPrompt:testMode:error:](self, "_xpcGetDiagnosisKeysCompletion:didPrompt:testMode:error:", v7, 0, v4, 0, v31);
          }
          else
          {
            v22 = (id *)(v42 + 5);
            v34 = (id)v42[5];
            v23 = CUXPCDecodeNSUUID();
            objc_storeStrong(v22, v34);
            if ((v23 & 1) != 0)
            {
              ENErrorF();
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = (void *)v42[5];
              v42[5] = v28;

            }
          }
        }
        else
        {
          ENErrorF();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v42[5];
          v42[5] = v26;

        }
      }
    }
  }
  v8[2](v8);

  _Block_object_dispose(&v41, 8);
}

uint64_t __49__ENXPCConnection__xpcGetDiagnosisKeys_testMode___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return objc_msgSend(*(id *)(v1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), *(_QWORD *)(v1 + 40));
  }
  return result;
}

- (void)_xpcGetDiagnosisKeysCompletion:(id)a3 didPrompt:(BOOL)a4 testMode:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  ENXPCClient *client;
  id *v15;
  id v16;
  xpc_object_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  xpc_object_t v22;
  void *v23;
  int v24;
  xpc_object_t reply;
  void *v26;
  uint64_t *v27;
  id v28;
  void *v29;
  int v30;
  uint64_t v31;
  void (**v32)(_QWORD);
  _BOOL4 v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id obj;
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v7 = a5;
  v33 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v34 = a6;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  v48 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __75__ENXPCConnection__xpcGetDiagnosisKeysCompletion_didPrompt_testMode_error___block_invoke;
  v40[3] = &unk_1E87D9D88;
  v42 = &v43;
  v40[4] = self;
  v10 = v9;
  v41 = v10;
  v32 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v40);
  if (v34)
  {
    v27 = v44;
    v28 = v34;
    v11 = (void *)v27[5];
    v27[5] = (uint64_t)v28;
  }
  else
  {
    -[ENDaemon temporaryExposureKeyManager](self->_daemon, "temporaryExposureKeyManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = xpc_dictionary_get_BOOL(v10, "refr")) && -[ENXPCClient accessLevel](self->_client, "accessLevel") <= 3)
    {
      ENErrorF();
      v31 = objc_claimAutoreleasedReturnValue();
      v16 = (id)v44[5];
      v44[5] = v31;
    }
    else
    {
      v13 = 144 * (((CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E0C9ADF0]) / 600.0) / 0x90) - 2016;
      client = self->_client;
      v15 = (id *)(v44 + 5);
      obj = (id)v44[5];
      objc_msgSend(v11, "getTemporaryExposureKeysForClient:fromRollingStart:didPrompt:forTesting:forceRefresh:error:", client, v13, v33, v7, v12, &obj);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v15, obj);
      if (v16)
      {
        v17 = xpc_array_create(0, 0);
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v16 = v16;
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v36 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              v22 = xpc_dictionary_create(0, 0, 0);
              objc_msgSend(v21, "encodeWithXPCObject:", v22);
              xpc_array_set_value(v17, 0xFFFFFFFFFFFFFFFFLL, v22);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
          }
          while (v18);
        }

        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isSensitiveLoggingAllowed");

        if (v24
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          xpc_array_get_count(v17);
          LogPrintF_safe();
        }
        reply = xpc_dictionary_create_reply(v10);
        v26 = reply;
        if (reply)
        {
          xpc_dictionary_set_value(reply, "tekA", v17);
          -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v26);
        }
        else
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isSensitiveLoggingAllowed");

          if (v30
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }

      }
    }

  }
  v32[2](v32);

  _Block_object_dispose(&v43, 8);
}

uint64_t __75__ENXPCConnection__xpcGetDiagnosisKeysCompletion_didPrompt_testMode_error___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return objc_msgSend(*(id *)(v1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), *(_QWORD *)(v1 + 40));
  }
  return result;
}

- (void)_xpcResetData:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  id *v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  xpc_object_t reply;
  id v16;
  id v17;
  id obj;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __33__ENXPCConnection__xpcResetData___block_invoke;
  v19[3] = &unk_1E87D9D88;
  v21 = &v22;
  v19[4] = self;
  v5 = v4;
  v20 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v19);
  v7 = (id *)(v23 + 5);
  obj = (id)v23[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v23 + 5);
    v17 = (id)v23[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v17);
    objc_storeStrong(v9, v17);
    if (v10)
    {
      v11 = (id *)(v23 + 5);
      v16 = (id)v23[5];
      v28 = 0;
      v12 = CUXPCDecodeUInt64RangedEx();
      v13 = v28;
      objc_storeStrong(v11, v16);
      if (v12 != 5)
      {
        if (v12 == 6)
          v14 = v13;
        else
          v14 = 0;
        -[ENDaemon _resetDataWithFlags:](self->_daemon, "_resetDataWithFlags:", v14);
        reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v22, 8);
}

uint64_t __33__ENXPCConnection__xpcResetData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcDiagnosticControl:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  const char *string;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  id *v17;
  int v18;
  uint64_t v19;
  void *v20;
  id *v21;
  id v22;
  id *v23;
  const char *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id *v30;
  const char *v31;
  _BOOL8 v32;
  uint64_t v33;
  id *v34;
  xpc_object_t reply;
  __CFString *v36;
  id v37;
  const char *v38;
  id *v39;
  void *v40;
  const char *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *dispatchQueue;
  id *v51;
  NSObject *v52;
  NSObject *v53;
  id v54;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id *v75;
  void *v76;
  char *v77;
  void *v78;
  void *v79;
  unint64_t v80;
  id *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  int v86;
  void *v87;
  void *v88;
  id *v89;
  int v90;
  id *v91;
  void *v92;
  id *v93;
  id *v94;
  id *v95;
  id *v96;
  id *v97;
  id *v98;
  id *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void **v107;
  void *v108;
  id v109;
  void *v110;
  id *v111;
  char v112;
  uint64_t v113;
  const char *v114;
  id v115;
  id v116;
  char *v117;
  void *v118;
  void *v119;
  const char *v120;
  id *v121;
  char v122;
  id v123;
  int v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  id v129;
  id *v130;
  id *v131;
  id *v132;
  id *v133;
  id *v134;
  id *v135;
  id *v136;
  id *v137;
  id *v138;
  id *v139;
  id *v140;
  id *v141;
  id *v142;
  id *v143;
  id *v144;
  id *v145;
  id *v146;
  id *v147;
  id *v148;
  id *v149;
  id *v150;
  id *v151;
  uint64_t v152;
  id v153;
  id v154;
  uint64_t v155;
  id v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  const char *v167;
  void *v168;
  unint64_t v169;
  void *v170;
  char *v171;
  void *v172;
  void (**v173)(void);
  void (**v174)(void);
  void *v175;
  void *v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  void *v199;
  void *v200;
  void *v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  void *v212;
  void *v213;
  void *v214;
  id v215;
  id v216;
  id v217;
  _QWORD v218[5];
  id v219;
  uint64_t *v220;
  id v221;
  void *v222;
  void *v223;
  id v224;
  _QWORD v225[5];
  id v226;
  uint64_t *v227;
  id v228;
  _QWORD v229[5];
  id v230;
  id v231;
  uint64_t *v232;
  id v233;
  id v234;
  _QWORD block[5];
  id v236;
  uint64_t *v237;
  id v238;
  id v239;
  _QWORD v240[5];
  id v241;
  id v242;
  uint64_t *v243;
  id v244;
  id v245;
  void *v246;
  void *v247;
  id obj;
  id v249;
  id v250;
  id location;
  id v252;
  id v253;
  _QWORD v254[5];
  _QWORD v255[5];
  uint64_t v256;
  uint64_t *v257;
  uint64_t v258;
  uint64_t (*v259)(uint64_t, uint64_t);
  void (*v260)(uint64_t);
  id v261;
  id v262;
  _QWORD v263[5];
  id v264;
  uint64_t *v265;
  uint64_t v266;
  id *v267;
  uint64_t v268;
  uint64_t (*v269)(uint64_t, uint64_t);
  void (*v270)(uint64_t);
  id v271;

  v4 = a3;
  v266 = 0;
  v267 = (id *)&v266;
  v268 = 0x3032000000;
  v269 = __Block_byref_object_copy__3;
  v270 = __Block_byref_object_dispose__3;
  v271 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v263[0] = MEMORY[0x1E0C809B0];
  v263[1] = 3221225472;
  v263[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke;
  v263[3] = &unk_1E87D9D88;
  v265 = &v266;
  v263[4] = self;
  v6 = v4;
  v264 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v263);
  v8 = v267;
  v262 = v267[5];
  v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &v262);
  objc_storeStrong(v8 + 5, v262);
  if (v9)
  {
    xpc_dictionary_get_value(v6, "parm");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (!v10 || MEMORY[0x1D17A8408](v10) != MEMORY[0x1E0C812F8])
    {
      ENErrorF();
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = v267[5];
      v267[5] = (id)v66;

      goto LABEL_93;
    }
    v256 = 0;
    v257 = &v256;
    v258 = 0x3032000000;
    v259 = __Block_byref_object_copy__3;
    v260 = __Block_byref_object_dispose__3;
    v261 = 0;
    string = xpc_dictionary_get_string(v11, "iStr");
    if (!string)
    {
      ENErrorF();
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = v267[5];
      v267[5] = (id)v68;

      goto LABEL_92;
    }
    v255[0] = v5;
    v255[1] = 3221225472;
    v255[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_2;
    v255[3] = &unk_1E87DA808;
    v255[4] = v11;
    v174 = (void (**)(void))MEMORY[0x1D17A7E5C](v255);
    v254[0] = v5;
    v254[1] = 3221225472;
    v254[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_3;
    v254[3] = &unk_1E87DA830;
    v254[4] = v11;
    v173 = (void (**)(void))MEMORY[0x1D17A7E5C](v254);
    -[ENDaemon delegate](self->_daemon, "delegate");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    if (strcasecmp(string, "Activity"))
    {
      if (!strcasecmp(string, "BTDebug"))
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        objc_msgSend(v175, "printBluetoothDebug");
        v30 = (id *)(v257 + 5);
        v252 = (id)v257[5];
        NSAppendPrintF_safe();
        v22 = v252;
        goto LABEL_66;
      }
      if (!strcasecmp(string, "chaff") && IsAppleInternalBuild())
      {
        location = 0;
        CUXPCDecodeNSString();
        objc_msgSend(0, "doubleValue");
        if (v15 > 0.0)
          CFPrefs_SetDouble();
        v250 = 0;
        CUXPCDecodeNSString();
        if (objc_msgSend(0, "integerValue") >= 1)
          CFPrefs_SetDouble();
        v249 = 0;
        CUXPCDecodeNSString();
        objc_msgSend(0, "doubleValue");
        if (v16 > 0.0)
          CFPrefs_SetDouble();
        -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
        v17 = (id *)(v257 + 5);
        obj = (id)v257[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v17, obj);

LABEL_47:
        goto LABEL_83;
      }
      if (!strcasecmp(string, "chaffReset") && IsAppleInternalBuild())
      {
        -[ENDaemon testResultManager](self->_daemon, "testResultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deactivateAutomatedChaffing");

        -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
        v21 = (id *)(v257 + 5);
        v247 = (void *)v257[5];
        NSAppendPrintF_safe();
        v22 = v247;
LABEL_54:
        v23 = v21;
LABEL_67:
        objc_storeStrong(v23, v22);
        goto LABEL_83;
      }
      if (!strcasecmp(string, "chaffOverridesReset") && IsAppleInternalBuild())
      {
        CFPrefs_RemoveValue();
        CFPrefs_RemoveValue();
        CFPrefs_RemoveValue();
        -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
        v21 = (id *)(v257 + 5);
        v246 = (void *)v257[5];
        NSAppendPrintF_safe();
        v22 = v246;
        goto LABEL_54;
      }
      if (!strcasecmp(string, "configureTestRegion") && IsAppleInternalBuild())
      {
        v24 = xpc_dictionary_get_string(v11, "mcc");
        if (!v24)
        {
          v174[2]();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_100;
        }
        objc_msgSend(MEMORY[0x1E0CB3938], "stringWithUTF8String:", v24);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:](ENCoreTelephonyUtility, "countryCodeISOForMobileCountryCode:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:", v26);

LABEL_100:
          if (v27)
          {
            v45 = objc_alloc(MEMORY[0x1E0CAA3B0]);
            objc_msgSend(MEMORY[0x1E0C99D60], "date");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)objc_msgSend(v45, "initWithRegion:date:", v27, v46);

            v245 = 0;
            objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v47, 1, &v245);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v245;
            if (v48)
            {
              CFPrefs_SetValue();
              CFPrefs_SetValue();
              location = 0;
              objc_initWeak(&location, self);
              dispatchQueue = self->_dispatchQueue;
              v240[0] = v5;
              v240[1] = 3221225472;
              v240[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_4;
              v240[3] = &unk_1E87DA858;
              v240[4] = self;
              v243 = &v256;
              v241 = v27;
              v242 = v6;
              objc_copyWeak(&v244, &location);
              dispatch_async(dispatchQueue, v240);
              v51 = (id *)(v257 + 5);
              v239 = (id)v257[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v51, v239);
              objc_destroyWeak(&v244);

              objc_destroyWeak(&location);
            }
            else
            {
              ENErrorF();
              v126 = objc_claimAutoreleasedReturnValue();
              v127 = v267[5];
              v267[5] = (id)v126;

            }
            goto LABEL_104;
          }
          ENErrorF();
          v125 = objc_claimAutoreleasedReturnValue();
          v25 = v267[5];
          v267[5] = (id)v125;
LABEL_90:

          goto LABEL_91;
        }
LABEL_273:
        ENErrorF();
        v128 = objc_claimAutoreleasedReturnValue();
        v129 = v267[5];
        v267[5] = (id)v128;

        goto LABEL_90;
      }
      if (!strcasecmp(string, "disableTestRegion"))
      {
        if (CFPrefs_GetInt64())
        {
          CFPrefs_RemoveValue();
          location = 0;
          objc_initWeak(&location, self);
          v28 = self->_dispatchQueue;
          block[0] = v5;
          block[1] = 3221225472;
          block[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_5;
          block[3] = &unk_1E87DA880;
          block[4] = self;
          v237 = &v256;
          v236 = v6;
          objc_copyWeak(&v238, &location);
          dispatch_async(v28, block);
          objc_destroyWeak(&v238);
          v29 = v236;
LABEL_62:

LABEL_63:
          objc_destroyWeak(&location);
          goto LABEL_91;
        }
        goto LABEL_35;
      }
      if (!strcasecmp(string, "phoneNumbers"))
      {
        v39 = (id *)(v257 + 5);
        v234 = (id)v257[5];
        +[ENCoreTelephonyUtility sharedInstance](ENCoreTelephonyUtility, "sharedInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "currentPhoneNumbers");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF();
        objc_storeStrong(v39, v234);

      }
      else
      {
        if (!strcasecmp(string, "setRegionMonitoringMode") && IsAppleInternalBuild())
        {
          v41 = xpc_dictionary_get_string(v11, "mode");
          if (v41)
          {
            objc_msgSend(MEMORY[0x1E0CB3938], "stringWithUTF8String:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_alloc_init(MEMORY[0x1E0CB37F8]);
            objc_msgSend(v43, "numberFromString:", v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v44 = 0;
          }
          location = 0;
          objc_initWeak(&location, self);
          v53 = self->_dispatchQueue;
          v229[0] = v5;
          v229[1] = 3221225472;
          v229[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_6;
          v229[3] = &unk_1E87DA8A8;
          v229[4] = self;
          v230 = v44;
          v232 = &v256;
          v231 = v6;
          v54 = v44;
          objc_copyWeak(&v233, &location);
          dispatch_async(v53, v229);
          objc_destroyWeak(&v233);

          goto LABEL_63;
        }
        if (!strcasecmp(string, "getRegionMonitoringMode") && IsAppleInternalBuild())
        {
          location = 0;
          objc_initWeak(&location, self);
          v52 = self->_dispatchQueue;
          v225[0] = v5;
          v225[1] = 3221225472;
          v225[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_7;
          v225[3] = &unk_1E87DA880;
          v225[4] = self;
          v227 = &v256;
          v226 = v6;
          objc_copyWeak(&v228, &location);
          dispatch_async(v52, v225);
          objc_destroyWeak(&v228);
          v29 = v226;
          goto LABEL_62;
        }
        if (strcasecmp(string, "ErrorTest"))
        {
          if (!strcasecmp(string, "getStateMetric"))
          {
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            -[ENDaemon stateMetricVersion](self->_daemon, "stateMetricVersion");
            v21 = (id *)(v257 + 5);
            v223 = (void *)v257[5];
            NSAppendPrintF_safe();
            v22 = v223;
            goto LABEL_54;
          }
          if (!strcasecmp(string, "PreAuthKeys"))
          {
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            -[ENDaemon xpcPreAuthorizedDiagnosisKeysAvailable](self->_daemon, "xpcPreAuthorizedDiagnosisKeysAvailable");
            v30 = (id *)(v257 + 5);
            v222 = (void *)v257[5];
            NSAppendPrintF_safe();
            v22 = v222;
            goto LABEL_66;
          }
          if (strcasecmp(string, "ServerFetch"))
          {
            if (strcasecmp(string, "RawConfig"))
            {
              if (!strcasecmp(string, "RemoveConfiguration") && IsAppleInternalBuild())
              {
                -[ENDaemon configurationManager](self->_daemon, "configurationManager");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v174[2]();
                v171 = (char *)objc_claimAutoreleasedReturnValue();
                if (!v171)
                {
                  -[ENDaemon activeEntity](self->_daemon, "activeEntity");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "entity");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "region");
                  v171 = (char *)objc_claimAutoreleasedReturnValue();

                  if (!v171)
                  {
                    ENErrorF();
                    v155 = objc_claimAutoreleasedReturnValue();
                    v156 = v267[5];
                    v267[5] = (id)v155;

                    goto LABEL_91;
                  }
                }
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  v162 = v171;
                  LogPrintF_safe();
                }
                -[ENDaemon configurationManager](self->_daemon, "configurationManager", v162);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "configurationStore");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = v267;
                v216 = v267[5];
                v90 = objc_msgSend(v88, "removeConfigurationsForRegion:includingSubdivisions:error:", v171, 1, &v216);
                objc_storeStrong(v89 + 5, v216);

                if (v90)
                  -[ENDaemon configurationManager:exposureNotificationRegionConfigurationRemovedForRegion:](self->_daemon, "configurationManager:exposureNotificationRegionConfigurationRemovedForRegion:", v58, v171);
                v91 = (id *)(v257 + 5);
                v215 = (id)v257[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v91, v215);

                goto LABEL_83;
              }
              if (!strcasecmp(string, "ResetCloudCache") && IsAppleInternalBuild())
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                -[ENDaemon configurationManager](self->_daemon, "configurationManager");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "resetConfigurationCache");

                -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
                v30 = (id *)(v257 + 5);
                v214 = (void *)v257[5];
                NSAppendPrintF_safe();
                v22 = v214;
                goto LABEL_66;
              }
              if (!strcasecmp(string, "SimulateRemoveCloudConfig") && IsAppleInternalBuild())
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                -[ENDaemon configurationManager](self->_daemon, "configurationManager");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "resetConfigurationCache");

                -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
                -[ENDaemon activeEntity](self->_daemon, "activeEntity");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "entity");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "region");
                v25 = (id)objc_claimAutoreleasedReturnValue();

                if (v25)
                {
                  -[ENDaemon _exposureNotificationRegionConfigurationRemoved:](self->_daemon, "_exposureNotificationRegionConfigurationRemoved:", v25);
                  v107 = (void **)(v257 + 5);
                  v213 = (void *)v257[5];
                  NSAppendPrintF_safe();
                  v108 = v213;
                }
                else
                {
                  v107 = (void **)(v257 + 5);
                  v212 = (void *)v257[5];
                  NSAppendPrintF_safe();
                  v108 = v212;
                }
                v109 = v108;
                v110 = *v107;
                *v107 = v109;

                goto LABEL_82;
              }
              if (!strcasecmp(string, "removeCloudOverrides"))
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v93 = (id *)(v257 + 5);
                v211 = (id)v257[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v93, v211);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v94 = (id *)(v257 + 5);
                v210 = (id)v257[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v94, v210);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v95 = (id *)(v257 + 5);
                v209 = (id)v257[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v95, v209);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v96 = (id *)(v257 + 5);
                v208 = (id)v257[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v96, v208);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v97 = (id *)(v257 + 5);
                v207 = (id)v257[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v97, v207);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v98 = (id *)(v257 + 5);
                v206 = (id)v257[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v98, v206);
                CFPrefs_RemoveValue();
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v99 = (id *)(v257 + 5);
                v205 = (id)v257[5];
                NSAppendPrintF_safe();
                objc_storeStrong(v99, v205);
                CFPrefs_RemoveValue();
                CFPrefs_RemoveValue();
                goto LABEL_83;
              }
              if (!strcasecmp(string, "telemetryAuthorization") && IsAppleInternalBuild())
              {
                -[ENDaemon configurationManager](self->_daemon, "configurationManager");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "configurationStore");
                v172 = (void *)objc_claimAutoreleasedReturnValue();

                v174[2]();
                v77 = (char *)objc_claimAutoreleasedReturnValue();
                if (v77)
                  goto LABEL_297;
                -[ENDaemon activeEntity](self->_daemon, "activeEntity");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "entity");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "region");
                v77 = (char *)objc_claimAutoreleasedReturnValue();

                if (v77)
                {
LABEL_297:
                  if (gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    v162 = v77;
                    LogPrintF_safe();
                  }
                  location = 0;
                  v111 = v267;
                  v204 = v267[5];
                  v112 = CUXPCDecodeNSString();
                  objc_storeStrong(v111 + 5, v204);
                  if ((v112 & 1) != 0)
                  {
                    v113 = objc_msgSend(location, "BOOLValue");
                    if (gLogCategory_ENDaemon <= 30
                      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                    {
                      v114 = "no";
                      if ((_DWORD)v113)
                        v114 = "yes";
                      v162 = v114;
                      LogPrintF_safe();
                    }
                    objc_msgSend(v172, "serverConfigurationResponseForRegion:", v77, v162);
                    v115 = (id)objc_claimAutoreleasedReturnValue();
                    if (v115)
                    {
                      objc_msgSend(MEMORY[0x1E0C99E00], "dictionaryWithDictionary:", v115);
                      v116 = (id)objc_claimAutoreleasedReturnValue();
                      v117 = v77;
                      objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("config"));
                      v170 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0C99E00], "dictionaryWithDictionary:", v170);
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithBool:", v113);
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v118, "setValue:forKey:", v119, CFSTR("telemetryAuthorization"));

                      if (gLogCategory_ENDaemon <= 30
                        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                      {
                        v120 = "no";
                        if ((_DWORD)v113)
                          v120 = "yes";
                        v167 = v120;
                        LogPrintF_safe();
                      }
                      objc_msgSend(v116, "setValue:forKey:", v118, CFSTR("config"), v167);
                      v121 = v267;
                      v203 = v267[5];
                      v122 = objc_msgSend(v172, "saveServerConfigurationResponse:error:", v116, &v203);
                      objc_storeStrong(v121 + 5, v203);
                      if ((v122 & 1) != 0)
                      {
                        objc_msgSend(v172, "configurationForRegion:", v117);
                        v123 = (id)objc_claimAutoreleasedReturnValue();
                        -[ENDaemon _exposureNotificationRegionConfigurationChanged:](self->_daemon, "_exposureNotificationRegionConfigurationChanged:", v123);
                        v124 = 0;
                      }
                      else
                      {
                        ENNestedErrorF();
                        v161 = objc_claimAutoreleasedReturnValue();
                        v123 = v267[5];
                        v267[5] = (id)v161;
                        v124 = 1;
                      }

                    }
                    else
                    {
                      ENErrorF();
                      v160 = objc_claimAutoreleasedReturnValue();
                      v117 = v77;
                      v116 = v267[5];
                      v267[5] = (id)v160;
                      v124 = 1;
                    }

                    v77 = v117;
                  }
                  else
                  {
                    ENErrorF();
                    v159 = objc_claimAutoreleasedReturnValue();
                    v115 = v267[5];
                    v267[5] = (id)v159;
                    v124 = 1;
                  }

                  if (v124)
                    goto LABEL_91;
                  goto LABEL_83;
                }
                ENErrorF();
                v157 = objc_claimAutoreleasedReturnValue();
                v158 = v267[5];
                v267[5] = (id)v157;

                v154 = v172;
LABEL_279:

                goto LABEL_91;
              }
              if (!strcasecmp(string, "sendErrorMetric"))
              {
                location = 0;
                v81 = v267;
                v202 = v267[5];
                CUXPCDecodeNSString();
                objc_storeStrong(v81 + 5, v202);
                if (gLogCategory_ENDaemon <= 90
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
              }
              else
              {
                if (!strcasecmp(string, "latestExposureDPMetric"))
                {
                  v86 = -[ENDaemon _getLatestExposureForDifferentialPrivacy](self->_daemon, "_getLatestExposureForDifferentialPrivacy");
                  if (v86 != 1)
                  {
                    v21 = (id *)(v257 + 5);
                    if (v86)
                    {
                      v199 = (void *)v257[5];
                      NSAppendPrintF();
                      v22 = v199;
                    }
                    else
                    {
                      v201 = (void *)v257[5];
                      NSAppendPrintF();
                      v22 = v201;
                    }
                    goto LABEL_54;
                  }
                  v30 = (id *)(v257 + 5);
                  v200 = (void *)v257[5];
                  NSAppendPrintF();
                  v22 = v200;
LABEL_66:
                  v23 = v30;
                  goto LABEL_67;
                }
                if (strcasecmp(string, "resetAA"))
                {
                  if (!strcasecmp(string, "help"))
                  {
                    if (gLogCategory_ENDaemon <= 30
                      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF_safe();
                    }
                    v130 = (id *)(v257 + 5);
                    v198 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v130, v198);
                    v131 = (id *)(v257 + 5);
                    v197 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v131, v197);
                    v132 = (id *)(v257 + 5);
                    v196 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v132, v196);
                    v133 = (id *)(v257 + 5);
                    v195 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v133, v195);
                    v134 = (id *)(v257 + 5);
                    v194 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v134, v194);
                    v135 = (id *)(v257 + 5);
                    v193 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v135, v193);
                    v136 = (id *)(v257 + 5);
                    v192 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v136, v192);
                    v137 = (id *)(v257 + 5);
                    v191 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v137, v191);
                    v138 = (id *)(v257 + 5);
                    v190 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v138, v190);
                    v139 = (id *)(v257 + 5);
                    v189 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v139, v189);
                    v140 = (id *)(v257 + 5);
                    v188 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v140, v188);
                    v141 = (id *)(v257 + 5);
                    v187 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v141, v187);
                    v142 = (id *)(v257 + 5);
                    v186 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v142, v186);
                    v143 = (id *)(v257 + 5);
                    v185 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v143, v185);
                    v144 = (id *)(v257 + 5);
                    v184 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v144, v184);
                    v145 = (id *)(v257 + 5);
                    v183 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v145, v183);
                    v146 = (id *)(v257 + 5);
                    v182 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v146, v182);
                    v147 = (id *)(v257 + 5);
                    v181 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v147, v181);
                    v148 = (id *)(v257 + 5);
                    v180 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v148, v180);
                    v149 = (id *)(v257 + 5);
                    v179 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v149, v179);
                    v150 = (id *)(v257 + 5);
                    v178 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v150, v178);
                    v151 = (id *)(v257 + 5);
                    v177 = (id)v257[5];
                    NSAppendPrintF_safe();
                    objc_storeStrong(v151, v177);
                    v21 = (id *)(v257 + 5);
                    v176 = (void *)v257[5];
                    NSAppendPrintF_safe();
                    v22 = v176;
                    goto LABEL_54;
                  }
                  goto LABEL_35;
                }
                location = 0;
                CUXPCDecodeNSString();
                if (objc_msgSend(0, "integerValue") >= 1)
                {
                  -[ENDaemon regionMonitor](self->_daemon, "regionMonitor");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "getCurrentRegionVisitWithError:", 0);
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v101, "region");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v102)
                  {
                    -[ENDaemon _writePreferenceRegionPendingOnboarding:](self->_daemon, "_writePreferenceRegionPendingOnboarding:", v102);
                    CFPrefs_SetDouble();
                    -[ENXPCConnection daemon](self, "daemon");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v103, "onboardingTriggerRetry:", 0);

                  }
                  else if (gLogCategory_ENDaemon <= 90
                         && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF_safe();
                  }

                  goto LABEL_47;
                }
                if (gLogCategory_ENDaemon <= 90
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                ENErrorF();
                v152 = objc_claimAutoreleasedReturnValue();
                v153 = v267[5];
                v267[5] = (id)v152;

              }
              v154 = location;
              goto LABEL_279;
            }
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            v174[2]();
            v25 = (id)objc_claimAutoreleasedReturnValue();
            if (v25)
              goto LABEL_167;
            -[ENDaemon activeEntity](self->_daemon, "activeEntity");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "entity");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "region");
            v25 = (id)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
LABEL_167:
              -[ENDaemon configurationManager](self->_daemon, "configurationManager");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "configurationStore");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "serverConfigurationResponseForRegion:", v25);
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v74)
                goto LABEL_273;
              v75 = (id *)(v257 + 5);
              v217 = (id)v257[5];
              NSAppendPrintF_safe();
              objc_storeStrong(v75, v217);

              goto LABEL_82;
            }
LABEL_35:
            ENErrorF();
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v267[5];
            v267[5] = (id)v13;

LABEL_91:
LABEL_92:
            _Block_object_dispose(&v256, 8);

LABEL_93:
            goto LABEL_94;
          }
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          v174[2]();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            -[ENDaemon activeEntity](self->_daemon, "activeEntity");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "entity");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "region");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v27)
              goto LABEL_35;
          }
          v173[2]();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "isSensitiveLoggingAllowed");

          if (v65
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v162 = (const char *)v27;
            v168 = v63;
            LogPrintF_safe();
          }
          if (objc_msgSend(v63, "length", v162, v168))
          {
            v80 = objc_msgSend(v63, "integerValue");
            if (v80 > 3)
            {
              if (gLogCategory_ENDaemon <= 90
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              ENErrorF();
              v84 = objc_claimAutoreleasedReturnValue();
              v85 = v267[5];
              v267[5] = (id)v84;

              goto LABEL_191;
            }
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v166 = v27;
              v169 = v80;
              LogPrintF_safe();
            }
            -[ENDaemon configurationManager](self->_daemon, "configurationManager", v166, v169);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "overrideRampModeForRegion:rampMode:", v27, v80);

          }
          location = 0;
          objc_initWeak(&location, self);
          -[ENDaemon configurationManager](self->_daemon, "configurationManager");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v218[0] = v5;
          v218[1] = 3221225472;
          v218[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_8;
          v218[3] = &unk_1E87DA8F8;
          v218[4] = self;
          v220 = &v256;
          v219 = v6;
          objc_copyWeak(&v221, &location);
          objc_msgSend(v83, "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v27, 0, v218);

          objc_destroyWeak(&v221);
          objc_destroyWeak(&location);
LABEL_191:

LABEL_104:
          goto LABEL_91;
        }
        ENErrorF();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        NSErrorF();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        ENNestedErrorF();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        v57 = (id *)(v257 + 5);
        v224 = (id)v257[5];
        NSAppendPrintF_safe();
        objc_storeStrong(v57, v224);

      }
LABEL_83:
      reply = xpc_dictionary_create_reply(v6);
      v25 = reply;
      if (reply)
      {
        if (v257[5])
          v36 = (__CFString *)v257[5];
        else
          v36 = CFSTR("None\n");
        v37 = reply;
        v38 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v36), "UTF8String");
        if (v38)
          xpc_dictionary_set_string(v37, "oStr", v38);

        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v37);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_90;
    }
    if (!xpc_dictionary_get_string(v11, "activity"))
      goto LABEL_35;
    if (stricmp_prefix())
    {
      if (stricmp_prefix())
      {
        if (stricmp_prefix())
        {
          if (stricmp_prefix())
            goto LABEL_35;
          v19 = 8;
          v18 = 1;
        }
        else
        {
          v18 = 0;
          v19 = 4;
        }
      }
      else
      {
        v18 = 0;
        v19 = 2;
      }
    }
    else
    {
      v18 = 0;
      v19 = 1;
    }
    v31 = xpc_dictionary_get_string(v11, "bundleID");
    if (!v31)
      goto LABEL_35;
    objc_msgSend(MEMORY[0x1E0CB3938], "stringWithUTF8String:", v31);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintFlags32();
      v162 = (const char *)v25;
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if ((v19 & 3) != 0)
    {
      v32 = 0;
      v33 = 30;
    }
    else
    {
      v32 = (v19 & 4) == 0;
      if ((v19 & 4) != 0)
        v33 = 210;
      else
        v33 = 0;
      if ((v18 | ((v19 & 4) >> 2)) != 1)
        goto LABEL_81;
    }
    -[ENDaemon appLaunchWithBundleID:activity:shouldEnterForeground:requiredRuntimeInSeconds:](self->_daemon, "appLaunchWithBundleID:activity:shouldEnterForeground:requiredRuntimeInSeconds:", v25, v19, v32, v33, v162, v168);
LABEL_81:
    v34 = (id *)(v257 + 5);
    v253 = (id)v257[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v34, v253);
LABEL_82:

    goto LABEL_83;
  }
LABEL_94:
  v7[2](v7);

  _Block_object_dispose(&v266, 8);
}

uint64_t __41__ENXPCConnection__xpcDiagnosticControl___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

id __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_2()
{
  CUXPCDecodeNSString();
  CUXPCDecodeNSString();

  return 0;
}

id __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_3()
{
  id v0;

  CUXPCDecodeNSString();
  v0 = 0;

  return v0;
}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  xpc_object_t reply;
  void *v9;
  __CFString *v10;
  id v11;
  const char *v12;
  id WeakRetained;
  uint64_t v14;
  id obj;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "regionMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testRegionDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "regionMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "testRegionDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regionChanged");

  }
  else
  {
    objc_msgSend(v4, "resetRegionMonitor");
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(_QWORD *)(a1 + 40);
  obj = *(id *)(v7 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v7 + 40), obj);
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v14 = *(_QWORD *)(a1 + 40);
    LogPrintF_safe();
  }
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  v9 = reply;
  if (reply)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      v10 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    else
      v10 = CFSTR("None\n");
    v11 = reply;
    v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String", v14);
    if (v12)
      xpc_dictionary_set_string(v11, "oStr", v12);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_xpcSendMessage:", v11);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  xpc_object_t reply;
  void *v7;
  __CFString *v8;
  id v9;
  const char *v10;
  id WeakRetained;
  void *v12;
  id obj;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "regionMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetRegionMonitor");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "regionMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCurrentRegionVisitWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = v4;
  obj = *(id *)(v5 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v12 = v4;
    LogPrintF_safe();
  }
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
  v7 = reply;
  if (reply)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      v8 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    else
      v8 = CFSTR("None\n");
    v9 = reply;
    v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String", v12);
    if (v10)
      xpc_dictionary_set_string(v9, "oStr", v10);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_xpcSendMessage:", v9);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  xpc_object_t reply;
  void *v5;
  __CFString *v6;
  id v7;
  const char *v8;
  id WeakRetained;
  uint64_t v10;
  id obj;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "regionMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateRegionMonitorMonitoringMode:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(_QWORD *)(a1 + 40);
  obj = *(id *)(v3 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v3 + 40), obj);
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v10 = *(_QWORD *)(a1 + 40);
    LogPrintF_safe();
  }
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  v5 = reply;
  if (reply)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      v6 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    else
      v6 = CFSTR("None\n");
    v7 = reply;
    v8 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String", v10);
    if (v8)
      xpc_dictionary_set_string(v7, "oStr", v8);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_xpcSendMessage:", v7);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  xpc_object_t reply;
  void *v8;
  __CFString *v9;
  id v10;
  const char *v11;
  id WeakRetained;
  id obj;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "regionMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getMonitoringMode");

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v4 + 40), obj);
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSensitiveLoggingAllowed");

  if (v6 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
  v8 = reply;
  if (reply)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      v9 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    else
      v9 = CFSTR("None");
    v10 = reply;
    v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
    if (v11)
      xpc_dictionary_set_string(v10, "oStr", v11);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_xpcSendMessage:", v10);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_9;
  block[3] = &unk_1E87DA8D0;
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  dispatch_async(v7, block);
  objc_destroyWeak(&v16);

}

void __41__ENXPCConnection__xpcDiagnosticControl___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  uint64_t v5;
  xpc_object_t reply;
  void *v7;
  __CFString *v8;
  id v9;
  const char *v10;
  id WeakRetained;
  uint64_t v12;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  obj = v4;
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    v5 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  NSAppendPrintF_safe();
  objc_storeStrong(v3, obj);
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  v7 = reply;
  if (reply)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      v8 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    else
      v8 = CFSTR("None\n");
    v9 = reply;
    v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String", v12);
    if (v10)
      xpc_dictionary_set_string(v9, "oStr", v10);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_xpcSendMessage:", v9);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_xpcDiagnosticLog:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  xpc_object_t reply;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __37__ENXPCConnection__xpcDiagnosticLog___block_invoke;
  v21[3] = &unk_1E87D9D88;
  v23 = &v24;
  v21[4] = self;
  v5 = v4;
  v22 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v21);
  v7 = (id *)(v25 + 5);
  obj = (id)v25[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    xpc_dictionary_get_value(v5, "parm");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      if (MEMORY[0x1D17A8408](v9) == MEMORY[0x1E0C812F8])
      {
        if (!xpc_dictionary_get_string(v10, "iStr") || !LogControl())
          goto LABEL_6;
        NSErrorF();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ENNestedErrorF();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v25[5];
        v25[5] = v18;

      }
      else
      {
        ENErrorF();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v25[5];
        v25[5] = v15;

      }
LABEL_10:

      goto LABEL_11;
    }
LABEL_6:
    if (LogShow())
    {
      NSErrorF();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ENNestedErrorF();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v25[5];
      v25[5] = v13;

    }
    else
    {
      reply = xpc_dictionary_create_reply(v5);
      v12 = reply;
      if (reply)
      {
        xpc_dictionary_set_string(reply, "oStr", 0);
        free(0);
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v12);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  v6[2](v6);

  _Block_object_dispose(&v24, 8);
}

uint64_t __37__ENXPCConnection__xpcDiagnosticLog___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcDiagnosticShow:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  const char *string;
  uint64_t v12;
  __CFString *v13;
  id v14;
  id v15;
  void *v16;
  xpc_object_t reply;
  __CFString *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  _QWORD v25[2];
  id obj;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v30 = 0;
  v31 = (id *)&v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v35 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __38__ENXPCConnection__xpcDiagnosticShow___block_invoke;
  v27[3] = &unk_1E87D9D88;
  v29 = &v30;
  v27[4] = self;
  v5 = v4;
  v28 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v27);
  v7 = v31;
  obj = v31[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    xpc_dictionary_get_value(v5, "parm");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (!v9)
      goto LABEL_7;
    if (MEMORY[0x1D17A8408](v9) != MEMORY[0x1E0C812F8])
      goto LABEL_6;
    string = xpc_dictionary_get_string(v10, "iStr");
    xpc_dictionary_get_int64(v10, "vrbL");
    if (string)
    {
      if (strcasecmp(string, "adv"))
      {
LABEL_6:
        ENErrorF();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = 0;
        v14 = v31[5];
        v31[5] = (id)v12;
LABEL_16:

        goto LABEL_17;
      }
      -[ENDaemon btTracingAppID](self->_daemon, "btTracingAppID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        NSAppendPrintF_safe();
        v13 = (__CFString *)0;
LABEL_9:
        reply = xpc_dictionary_create_reply(v5);
        v14 = reply;
        if (reply)
        {
          if (v13)
            v18 = v13;
          else
            v18 = CFSTR("None\n");
          v14 = reply;
          v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String");
          if (v19)
            xpc_dictionary_set_string(v14, "oStr", v19);

          -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v14);
        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        goto LABEL_16;
      }
      -[ENDaemon delegate](self->_daemon, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "retrieveCurrentAdvertisingPayload");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_retainAutorelease(v22);
      objc_msgSend(v15, "bytes");
      if ((unint64_t)objc_msgSend(v15, "length") < 0x14)
      {
        v24 = 0;
        v23 = (void **)&v24;
        objc_msgSend(v15, "length");
        NSAppendPrintF();
      }
      else
      {
        v25[0] = 0;
        v23 = (void **)v25;
        NSAppendPrintF();
      }
      v16 = *v23;
    }
    else
    {
LABEL_7:
      v25[1] = 0;
      CUDescriptionWithLevel();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF_safe();
      v16 = 0;
    }
    v13 = v16;

    goto LABEL_9;
  }
LABEL_17:
  v6[2](v6);

  _Block_object_dispose(&v30, 8);
}

uint64_t __38__ENXPCConnection__xpcDiagnosticShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcNotificationTrigger:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  int int64;
  uint64_t uint64;
  void *v11;
  void *v12;
  void *v13;
  const char *string;
  uint64_t v15;
  id *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  xpc_object_t reply;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id obj;
  _QWORD v44[5];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v4 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__3;
  v51 = __Block_byref_object_dispose__3;
  v52 = 0;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __43__ENXPCConnection__xpcNotificationTrigger___block_invoke;
  v44[3] = &unk_1E87D9D88;
  v46 = &v47;
  v44[4] = self;
  v5 = v4;
  v45 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v44);
  v7 = (id *)(v48 + 5);
  obj = (id)v48[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    int64 = xpc_dictionary_get_int64(v5, "noteType");
    uint64 = xpc_dictionary_get_uint64(v5, "intS");
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "entity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    string = xpc_dictionary_get_string(v5, "aBid");
    if (string)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3938]), "initWithUTF8String:", string);

      v13 = (void *)v15;
    }
    v16 = (id *)(v48 + 5);
    v42 = (id)v48[5];
    v17 = CUXPCDecodeNSString();
    objc_storeStrong(v16, v42);
    if ((v17 & 1) != 0)
    {
      -[ENDaemon activeEntity](self->_daemon, "activeEntity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "entity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "region");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      xpc_dictionary_get_value(v5, "regionData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_7;
      objc_opt_class();
      v22 = (id *)(v48 + 5);
      v41 = (id)v48[5];
      ENXPCDecodeSecureObject();
      v23 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v22, v41);

      v20 = (void *)v23;
      if (v23)
      {
LABEL_7:
        switch(int64)
        {
          case 1:
            if (!v20)
              goto LABEL_69;
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isSensitiveLoggingAllowed");

            if (v25
              && gLogCategory_ENDaemon <= 50
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
            v34 = objc_alloc_init(MEMORY[0x1E0CAA348]);
            objc_msgSend(MEMORY[0x1E0CB3A30], "UUID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setIdentifier:", v35);

            objc_msgSend(MEMORY[0x1E0C99E90], "URLWithString:", CFSTR("https://example.com"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setLearnMoreURL:", v36);

            objc_msgSend(v34, "setLocalizedBodyText:", CFSTR("Example body text."));
            objc_msgSend(v34, "setLocalizedSubjectText:", CFSTR("Example Title"));
            objc_msgSend(MEMORY[0x1E0C99D60], "date");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setNotificationDate:", v37);

            objc_msgSend(v34, "setRegion:", v20);
            -[ENDaemon postExposureNotification:](self->_daemon, "postExposureNotification:", v34);

            goto LABEL_55;
          case 2:
            if (!v20)
              goto LABEL_69;
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isSensitiveLoggingAllowed");

            if (v29
              && gLogCategory_ENDaemon <= 50
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v40 = v20;
              LogPrintF_safe();
            }
            -[ENDaemon postOnboardingNotificationForRegion:](self->_daemon, "postOnboardingNotificationForRegion:", v20, v40);
            goto LABEL_55;
          case 3:
            if (!objc_msgSend(v13, "length"))
              goto LABEL_13;
            if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            -[ENDaemon postExposureSummaryAccessNotificationWithAppBundleIdentifier:string:](self->_daemon, "postExposureSummaryAccessNotificationWithAppBundleIdentifier:string:", v13, CFSTR("{Example string from the Public Health Agency}"));
            goto LABEL_55;
          case 4:
            if (uint64)
            {
              if (gLogCategory_ENDaemon <= 30
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                v40 = (void *)uint64;
                LogPrintF_safe();
              }
              -[ENDaemon monthlyTriggerActivateWithIntervalOverride:](self->_daemon, "monthlyTriggerActivateWithIntervalOverride:", uint64, v40);
            }
            else
            {
              if (!objc_msgSend(v13, "length"))
              {
LABEL_13:
                ENErrorF();
                v26 = objc_claimAutoreleasedReturnValue();
                v27 = (void *)v48[5];
                v48[5] = v26;

                goto LABEL_58;
              }
              if (gLogCategory_ENDaemon <= 50
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              -[ENDaemon postMonthlySummaryNotificationForAppBundleIdentifier:](self->_daemon, "postMonthlySummaryNotificationForAppBundleIdentifier:", v13);
            }
            goto LABEL_55;
          case 5:
            if (!v20)
              goto LABEL_69;
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isSensitiveLoggingAllowed");

            if (v31
              && gLogCategory_ENDaemon <= 50
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v40 = v20;
              LogPrintF_safe();
            }
            -[ENDaemon postAnalyticsOptInNotificationForRegion:](self->_daemon, "postAnalyticsOptInNotificationForRegion:", v20, v40);
            goto LABEL_55;
          case 6:
            if (v20)
            {
              +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "isSensitiveLoggingAllowed");

              if (v33
                && gLogCategory_ENDaemon <= 50
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                v40 = v20;
                LogPrintF_safe();
              }
              -[ENDaemon postPreAuthorizationNotificationForRegion:](self->_daemon, "postPreAuthorizationNotificationForRegion:", v20, v40);
LABEL_55:
              reply = xpc_dictionary_create_reply(v5);
              if (reply)
              {
                -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
              }
              else if (gLogCategory__ENDaemon <= 90
                     && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }

            }
            else
            {
LABEL_69:
              ENErrorF();
              v39 = objc_claimAutoreleasedReturnValue();
              v20 = (void *)v48[5];
              v48[5] = v39;
            }
LABEL_58:

            break;
          default:
            goto LABEL_13;
        }
      }
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v47, 8);
}

uint64_t __43__ENXPCConnection__xpcNotificationTrigger___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetActiveRegion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  xpc_object_t reply;
  id *v13;
  int v14;
  uint64_t v15;
  id v16;
  id obj;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__ENXPCConnection__xpcGetActiveRegion___block_invoke;
  v18[3] = &unk_1E87D9D88;
  v20 = &v21;
  v18[4] = self;
  v5 = v4;
  v19 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v18);
  v7 = (id *)(v22 + 5);
  obj = (id)v22[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        v13 = (id *)(v22 + 5);
        v16 = (id)v22[5];
        v14 = ENXPCEncodeSecureObject();
        objc_storeStrong(v13, v16);
        if (v14)
          -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else
    {
      ENErrorF();
      v15 = objc_claimAutoreleasedReturnValue();
      reply = (xpc_object_t)v22[5];
      v22[5] = v15;
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v21, 8);
}

uint64_t __39__ENXPCConnection__xpcGetActiveRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetRegionHistory:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  xpc_object_t reply;
  id *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id obj;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __40__ENXPCConnection__xpcGetRegionHistory___block_invoke;
  v20[3] = &unk_1E87D9D88;
  v22 = &v23;
  v20[4] = self;
  v5 = v4;
  v21 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v20);
  v7 = (id *)(v24 + 5);
  obj = (id)v24[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    -[ENDaemon regionMonitor](self->_daemon, "regionMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v9, "getAllRegionVisitsWithError:", &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;

    if (v11)
    {
      ENNestedErrorF();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10)
      {
        reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          v13 = (id *)(v24 + 5);
          v17 = (id)v24[5];
          objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v13, v17);
          v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          xpc_dictionary_set_value(reply, "rgnHy", v15);
          -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);

        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        goto LABEL_6;
      }
      ENErrorF();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    reply = (xpc_object_t)v24[5];
    v24[5] = v16;
LABEL_6:

  }
  v6[2](v6);

  _Block_object_dispose(&v23, 8);
}

uint64_t __40__ENXPCConnection__xpcGetRegionHistory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetRegionHistoryEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  uint64_t Int64;
  xpc_object_t reply;
  void *v13;
  id v14;
  id obj;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__ENXPCConnection__xpcGetRegionHistoryEnabled___block_invoke;
  v16[3] = &unk_1E87D9D88;
  v18 = &v19;
  v16[4] = self;
  v5 = v4;
  v17 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v16);
  v7 = (id *)(v20 + 5);
  obj = (id)v20[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v20 + 5);
    v14 = (id)v20[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v14);
    objc_storeStrong(v9, v14);
    if (v10)
    {
      Int64 = CFPrefs_GetInt64();
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      reply = xpc_dictionary_create_reply(v5);
      v13 = reply;
      if (reply)
      {
        xpc_dictionary_set_BOOL(reply, "enbd", Int64 == 0);
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v13);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __47__ENXPCConnection__xpcGetRegionHistoryEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetRegionHistoryEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  xpc_object_t reply;
  id v12;
  id obj;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__ENXPCConnection__xpcSetRegionHistoryEnabled___block_invoke;
  v14[3] = &unk_1E87D9D88;
  v16 = &v17;
  v14[4] = self;
  v5 = v4;
  v15 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v14);
  v7 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v18 + 5);
    v12 = (id)v18[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v12);
    objc_storeStrong(v9, v12);
    if (v10)
    {
      xpc_dictionary_get_BOOL(v5, "enbd");
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      CFPrefs_SetValue();
      -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
      reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __47__ENXPCConnection__xpcSetRegionHistoryEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetRegionMonitorEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  xpc_object_t reply;
  void *v14;
  id v15;
  id obj;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__ENXPCConnection__xpcGetRegionMonitorEnabled___block_invoke;
  v17[3] = &unk_1E87D9D88;
  v19 = &v20;
  v17[4] = self;
  v5 = v4;
  v18 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v17);
  v7 = (id *)(v21 + 5);
  obj = (id)v21[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v21 + 5);
    v15 = (id)v21[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v15);
    objc_storeStrong(v9, v15);
    if (v10)
    {
      -[ENDaemon regionMonitor](self->_daemon, "regionMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "getAuthorizationState");

      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      reply = xpc_dictionary_create_reply(v5);
      v14 = reply;
      if (reply)
      {
        xpc_dictionary_set_BOOL(reply, "enbd", v12 == 2);
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v14);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v20, 8);
}

uint64_t __47__ENXPCConnection__xpcGetRegionMonitorEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetRegionConfig:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t int64;
  uint64_t v13;
  void *v14;
  id obj;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__ENXPCConnection__xpcGetRegionConfig___block_invoke;
  v16[3] = &unk_1E87D9D88;
  v18 = &v19;
  v16[4] = self;
  v5 = v4;
  v17 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v16);
  v7 = (id *)(v20 + 5);
  obj = (id)v20[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      int64 = xpc_dictionary_get_int64(v5, "cty");
      switch(int64)
      {
        case 0:
          -[ENXPCConnection _xpcGetRegionSystemConfig:](self, "_xpcGetRegionSystemConfig:", v5);
          goto LABEL_10;
        case 10:
          -[ENXPCConnection _xpcGetRegionServerConfig:](self, "_xpcGetRegionServerConfig:", v5);
          goto LABEL_10;
        case 20:
          -[ENXPCConnection _xpcGetRegionAgencyConfig:](self, "_xpcGetRegionAgencyConfig:", v5);
LABEL_10:

          goto LABEL_11;
      }
    }
    ENErrorF();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v20[5];
    v20[5] = v13;

    goto LABEL_10;
  }
LABEL_11:
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __39__ENXPCConnection__xpcGetRegionConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetRegionSystemConfig:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  xpc_object_t reply;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  id obj;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __45__ENXPCConnection__xpcGetRegionSystemConfig___block_invoke;
  v18[3] = &unk_1E87D9D88;
  v20 = &v21;
  v18[4] = self;
  v5 = v4;
  v19 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v18);
  -[ENDaemon activeEntity](self->_daemon, "activeEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      -[ENDaemon configurationManager](self->_daemon, "configurationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configurationStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configurationForRegion:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (id *)(v22 + 5);
        obj = (id)v22[5];
        objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &obj);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v14, obj);
        v16 = objc_retainAutorelease(v15);
        xpc_dictionary_set_data(reply, "svrCfg", (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));

      }
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  v6[2](v6);
  _Block_object_dispose(&v21, 8);

}

uint64_t __45__ENXPCConnection__xpcGetRegionSystemConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetRegionServerConfig:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  void *v8;
  xpc_object_t reply;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id obj;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __45__ENXPCConnection__xpcGetRegionServerConfig___block_invoke;
  v21[3] = &unk_1E87D9D88;
  v23 = &v24;
  v21[4] = self;
  v5 = v4;
  v22 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v21);
  objc_opt_class();
  v7 = (id *)(v25 + 5);
  obj = (id)v25[5];
  ENXPCDecodeSecureObjectIfPresent();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);
  if (v8)
    goto LABEL_2;
  if (v25[5])
    goto LABEL_24;
  -[ENDaemon activeEntity](self->_daemon, "activeEntity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_2:
    reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      -[ENDaemon configurationManager](self->_daemon, "configurationManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configurationStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serverConfigurationForRegion:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (id *)(v25 + 5);
        v19 = (id)v25[5];
        objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v13, v19);
        v15 = objc_retainAutorelease(v14);
        xpc_dictionary_set_data(reply, "svrCfg", (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      }
      else
      {
        ENErrorF();
        v16 = objc_claimAutoreleasedReturnValue();
        v15 = (id)v25[5];
        v25[5] = v16;
      }

    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else
  {
LABEL_24:
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
  v6[2](v6);

  _Block_object_dispose(&v24, 8);
}

uint64_t __45__ENXPCConnection__xpcGetRegionServerConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetRegionAgencyConfig:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  xpc_object_t reply;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  id obj;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __45__ENXPCConnection__xpcGetRegionAgencyConfig___block_invoke;
  v18[3] = &unk_1E87D9D88;
  v20 = &v21;
  v18[4] = self;
  v5 = v4;
  v19 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v18);
  -[ENDaemon activeEntity](self->_daemon, "activeEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      -[ENDaemon configurationManager](self->_daemon, "configurationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configurationStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "agencyConfigurationForRegion:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (id *)(v22 + 5);
        obj = (id)v22[5];
        objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &obj);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v14, obj);
        v16 = objc_retainAutorelease(v15);
        xpc_dictionary_set_data(reply, "svrCfg", (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));

      }
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  v6[2](v6);
  _Block_object_dispose(&v21, 8);

}

uint64_t __45__ENXPCConnection__xpcGetRegionAgencyConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetAllRegionConfig:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  int64_t int64;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__ENXPCConnection__xpcGetAllRegionConfig___block_invoke;
  v13[3] = &unk_1E87D9D88;
  v15 = &v16;
  v13[4] = self;
  v5 = v4;
  v14 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v13);
  v7 = (id *)(v17 + 5);
  obj = (id)v17[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    int64 = xpc_dictionary_get_int64(v5, "cty");
    if (int64)
    {
      if (int64 == 10)
      {
        -[ENXPCConnection _xpcGetAllRegionServerConfig:](self, "_xpcGetAllRegionServerConfig:", v5);
      }
      else if (int64 == 20)
      {
        -[ENXPCConnection _xpcGetAllRegionAgencyConfig:](self, "_xpcGetAllRegionAgencyConfig:", v5);
      }
      else
      {
        ENErrorF();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v17[5];
        v17[5] = v10;

      }
    }
    else
    {
      -[ENXPCConnection _xpcGetAllRegionGeneralConfig:](self, "_xpcGetAllRegionGeneralConfig:", v5);
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v16, 8);
}

uint64_t __42__ENXPCConnection__xpcGetAllRegionConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetAllRegionGeneralConfig:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  xpc_object_t reply;
  void *v9;
  void *v10;
  _QWORD v11[7];
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__3;
  v15[4] = __Block_byref_object_dispose__3;
  v16 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__ENXPCConnection__xpcGetAllRegionGeneralConfig___block_invoke;
  v12[3] = &unk_1E87D9D88;
  v14 = v15;
  v12[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v12);
  reply = xpc_dictionary_create_reply(v6);
  if (reply)
  {
    -[ENDaemon configurationManager](self->_daemon, "configurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __49__ENXPCConnection__xpcGetAllRegionGeneralConfig___block_invoke_2;
    v11[3] = &unk_1E87DA920;
    v11[5] = self;
    v11[6] = v15;
    v11[4] = reply;
    objc_msgSend(v10, "allRegionConfigurationsWithCompletion:", v11);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  v7[2](v7);
  _Block_object_dispose(v15, 8);

}

uint64_t __49__ENXPCConnection__xpcGetAllRegionGeneralConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __49__ENXPCConnection__xpcGetAllRegionGeneralConfig___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(void **)(a1 + 32);
  v6 = objc_retainAutorelease(v4);
  xpc_dictionary_set_data(v5, "svrCfg", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  objc_msgSend(*(id *)(a1 + 40), "_xpcSendMessage:", *(_QWORD *)(a1 + 32));

}

- (void)_xpcGetAllRegionServerConfig:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  xpc_object_t reply;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void (**v14)(_QWORD, _QWORD);
  id *v15;
  void *v16;
  int int64;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void (**v21)(_QWORD);
  _QWORD v22[7];
  id obj;
  _QWORD v24[7];
  _QWORD v25[6];
  id v26;
  xpc_object_t v27;
  uint64_t *v28;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  v37 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke;
  v29[3] = &unk_1E87D9D88;
  v31 = &v32;
  v29[4] = self;
  v6 = v4;
  v30 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v29);
  v21 = v7;
  -[ENDaemon configurationManager](self->_daemon, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDaemon configurationManager](self->_daemon, "configurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !v10)
  {
    ENErrorF();
    v19 = objc_claimAutoreleasedReturnValue();
    reply = v33[5];
    v33[5] = (id)v19;
    goto LABEL_28;
  }
  reply = xpc_dictionary_create_reply(v6);
  if (reply)
  {
    v25[0] = v5;
    v25[1] = 3221225472;
    v25[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_2;
    v25[3] = &unk_1E87DA998;
    v20 = v8;
    v25[4] = v8;
    v25[5] = self;
    v28 = &v32;
    v12 = v6;
    v26 = v12;
    v27 = reply;
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17A7E5C](v25);
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_5;
    v24[3] = &unk_1E87DA9E8;
    v24[4] = v10;
    v24[5] = self;
    v24[6] = reply;
    v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A7E5C](v24);
    objc_opt_class();
    v15 = v33;
    obj = v33[5];
    ENXPCDecodeSecureObjectIfPresent();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v15 + 5, obj);
    if (v16)
    {
      if (!xpc_dictionary_get_BOOL(v12, "frcFet"))
      {
        int64 = xpc_dictionary_get_int64(v12, "feRsn");
        switch(int64)
        {
          case 0:
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            ((void (**)(_QWORD, void *))v14)[2](v14, v16);
            goto LABEL_27;
          case 1:
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v18 = 1;
              LogPrintF_safe();
            }
            else
            {
              v18 = 1;
            }
            break;
          case 2:
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            v18 = 0;
            break;
          default:
            goto LABEL_27;
        }
        ((void (**)(_QWORD, void *, uint64_t))v13)[2](v13, v16, v18);
        goto LABEL_27;
      }
      ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v16, 0);
    }
    else
    {
      v22[0] = v5;
      v22[1] = 3221225472;
      v22[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_8;
      v22[3] = &unk_1E87DA920;
      v22[5] = self;
      v22[6] = &v32;
      v22[4] = reply;
      objc_msgSend(v10, "allRegionServerConfigurationsWithCompletion:", v22);
    }
LABEL_27:

    v8 = v20;
    v7 = v21;
    goto LABEL_28;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_28:

  v7[2](v7);
  _Block_object_dispose(&v32, 8);

}

uint64_t __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_3;
  v10[3] = &unk_1E87DA970;
  v14 = *(_QWORD *)(a1 + 64);
  v6 = *(void **)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v12 = v7;
  v13 = v8;
  v9 = v5;
  objc_msgSend(v6, "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v9, a3, v10);

}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_4;
  block[3] = &unk_1E87DA948;
  v22 = *(_QWORD *)(a1 + 64);
  block[1] = 3221225472;
  v16 = v6;
  v17 = v5;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v18 = v9;
  v19 = v10;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v20 = v11;
  v21 = v12;
  v13 = v5;
  v14 = v6;
  dispatch_async(v8, block);

}

uint64_t __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      return objc_msgSend(*(id *)(a1 + 56), "_processServerResponseConfigurationsForRegion:serverResponses:request:", *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 72));
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  ENNestedErrorF();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(a1 + 56), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 64));
}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_6;
  v8[3] = &unk_1E87DA2A0;
  v6 = a1[6];
  v8[4] = a1[5];
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v4, "allCachedServerResponseConfigurationsWithCountryCode:completion:", v5, v8);

}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_6(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = *(NSObject **)(v4 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_7;
  v8[3] = &unk_1E87DA9C0;
  v8[4] = v4;
  v9 = v5;
  v10 = v3;
  v11 = a1[6];
  v7 = v3;
  dispatch_async(v6, v8);

}

uint64_t __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processServerResponseConfigurationsForRegion:serverResponses:request:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __48__ENXPCConnection__xpcGetAllRegionServerConfig___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(void **)(a1 + 32);
  v6 = objc_retainAutorelease(v4);
  xpc_dictionary_set_data(v5, "svrCfg", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  objc_msgSend(*(id *)(a1 + 40), "_xpcSendMessage:", *(_QWORD *)(a1 + 32));

}

- (void)_processServerResponseConfigurationsForRegion:(id)a3 serverResponses:(id)a4 request:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id *v38;
  void *v39;
  id v40;
  id *v41;
  void *v42;
  id v43;
  id *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void (**v50)(_QWORD);
  ENXPCConnection *v51;
  void *v52;
  id v53;
  xpc_object_t xdict;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  id obj;
  _QWORD v69[5];
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _BYTE v78[128];
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v53 = a4;
  v8 = a5;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__3;
  v76 = __Block_byref_object_dispose__3;
  v77 = 0;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __89__ENXPCConnection__processServerResponseConfigurationsForRegion_serverResponses_request___block_invoke;
  v69[3] = &unk_1E87D9D88;
  v71 = &v72;
  v51 = self;
  v69[4] = self;
  xdict = v8;
  v70 = xdict;
  v50 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v69);
  -[ENDaemon configurationManager](self->_daemon, "configurationManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDaemon configurationManager](self->_daemon, "configurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52 || !v10)
  {
    ENErrorF();
    v48 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v73[5];
    v73[5] = v48;
    goto LABEL_25;
  }
  objc_msgSend(v10, "serverConfigurationForRegion:", v58);
  v11 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithCapacity:", objc_msgSend(v53, "count"));
    v56 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithCapacity:", objc_msgSend(v53, "count"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithCapacity:", objc_msgSend(v53, "count"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v26 = v53;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    if (!v27)
      goto LABEL_23;
    v28 = *(_QWORD *)v63;
    while (1)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v63 != v28)
          objc_enumerationMutation(v26);
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA390]), "initWithServerResponseDictionary:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
        objc_msgSend(v30, "region");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "isEqual:", v58))
        {

        }
        else
        {
          objc_msgSend(v30, "region");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isCountryCodeEqualToRegion:", v58);

          if (!v33)
            goto LABEL_21;
        }
        objc_msgSend(v57, "addObject:", v30);
        objc_msgSend(v30, "region");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "configurationForRegion:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
          objc_msgSend(v56, "addObject:", v35);
        objc_msgSend(v35, "region");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "agencyConfigurationForRegion:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          objc_msgSend(v55, "addObject:", v37);

LABEL_21:
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
      if (!v27)
      {
LABEL_23:

        v38 = (id *)(v73 + 5);
        v61 = (id)v73[5];
        objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v57, 1, &v61);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v38, v61);
        v40 = objc_retainAutorelease(v39);
        xpc_dictionary_set_data(xdict, "svrCfg", (const void *)objc_msgSend(v40, "bytes"), objc_msgSend(v40, "length"));
        v41 = (id *)(v73 + 5);
        v60 = (id)v73[5];
        objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v56, 1, &v60);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v41, v60);

        v43 = objc_retainAutorelease(v42);
        xpc_dictionary_set_data(xdict, "rgnCfg", (const void *)objc_msgSend(v43, "bytes"), objc_msgSend(v43, "length"));
        v44 = (id *)(v73 + 5);
        v59 = (id)v73[5];
        objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v55, 1, &v59);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v44, v59);

        v46 = objc_retainAutorelease(v45);
        xpc_dictionary_set_data(xdict, "agnCfg", (const void *)objc_msgSend(v46, "bytes"), objc_msgSend(v46, "length"));

        goto LABEL_24;
      }
    }
  }
  v12 = (void *)MEMORY[0x1E0CB3700];
  v81[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v81, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id *)(v73 + 5);
  obj = (id)v73[5];
  objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &obj);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v14, obj);

  v56 = objc_retainAutorelease(v15);
  xpc_dictionary_set_data(xdict, "svrCfg", (const void *)objc_msgSend(v56, "bytes"), objc_msgSend(v56, "length"));
  objc_msgSend(v10, "configurationForRegion:", v58);
  v16 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v16;
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3700];
    v80 = v16;
    objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v80, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id *)(v73 + 5);
    v67 = (id)v73[5];
    objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v67);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v19, v67);

    v56 = objc_retainAutorelease(v20);
    xpc_dictionary_set_data(xdict, "rgnCfg", (const void *)objc_msgSend(v56, "bytes"), objc_msgSend(v56, "length"));
  }
  objc_msgSend(v10, "agencyConfigurationForRegion:", v58);
  v21 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v21;
  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CB3700];
    v79 = v21;
    objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v79, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id *)(v73 + 5);
    v66 = (id)v73[5];
    objc_msgSend(v22, "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, &v66);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v24, v66);

    v56 = objc_retainAutorelease(v25);
    xpc_dictionary_set_data(xdict, "agnCfg", (const void *)objc_msgSend(v56, "bytes"), objc_msgSend(v56, "length"));
  }
LABEL_24:

  -[ENXPCConnection _xpcSendMessage:](v51, "_xpcSendMessage:", xdict);
  v47 = v49;
LABEL_25:

  v50[2](v50);
  _Block_object_dispose(&v72, 8);

}

uint64_t __89__ENXPCConnection__processServerResponseConfigurationsForRegion_serverResponses_request___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetAllRegionAgencyConfig:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  xpc_object_t reply;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[7];
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__ENXPCConnection__xpcGetAllRegionAgencyConfig___block_invoke;
  v13[3] = &unk_1E87D9D88;
  v15 = &v16;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v13);
  if (xpc_dictionary_get_string(v6, "loc"))
  {
    reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      -[ENDaemon configurationManager](self->_daemon, "configurationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configurationStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __48__ENXPCConnection__xpcGetAllRegionAgencyConfig___block_invoke_2;
      v12[3] = &unk_1E87DA920;
      v12[5] = self;
      v12[6] = &v16;
      v12[4] = reply;
      objc_msgSend(v10, "allAgencyServerRegionConfigurationsWithCompletion:", v12);

    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    ENErrorF();
    v11 = objc_claimAutoreleasedReturnValue();
    reply = (xpc_object_t)v17[5];
    v17[5] = v11;
  }

  v7[2](v7);
  _Block_object_dispose(&v16, 8);

}

uint64_t __48__ENXPCConnection__xpcGetAllRegionAgencyConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __48__ENXPCConnection__xpcGetAllRegionAgencyConfig___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(void **)(a1 + 32);
  v6 = objc_retainAutorelease(v4);
  xpc_dictionary_set_data(v5, "svrCfg", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  objc_msgSend(*(id *)(a1 + 40), "_xpcSendMessage:", *(_QWORD *)(a1 + 32));

}

- (void)_xpcGetSubdivisionList:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  xpc_object_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  const char *v18;
  xpc_object_t reply;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  xpc_object_t v28;
  id v29;
  uint64_t *v30;
  id v31;
  id location;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  id obj;
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  v48 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __42__ENXPCConnection__xpcGetSubdivisionList___block_invoke;
  v40[3] = &unk_1E87D9D88;
  v42 = &v43;
  v40[4] = self;
  v6 = v4;
  v41 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v40);
  objc_opt_class();
  v8 = (id *)(v44 + 5);
  obj = (id)v44[5];
  ENXPCDecodeSecureObjectIfPresent();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);
  if (v9)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__3;
    v37 = __Block_byref_object_dispose__3;
    v38 = 0;
    -[ENDaemon configurationManager](self->_daemon, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subdivisionListForRegion:", v9);
    v38 = (id)objc_claimAutoreleasedReturnValue();

    v12 = xpc_array_create(0, 0);
    if (v34[5])
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v13 = (id)v34[5];
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v49, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v13);
            v17 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i));
            v18 = (const char *)objc_msgSend(v17, "cStringUsingEncoding:", 4, (_QWORD)v22);
            if (v18)
              xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v18);
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v49, 16);
        }
        while (v14);
      }

      reply = xpc_dictionary_create_reply(v6);
      v20 = reply;
      if (reply)
      {
        xpc_dictionary_set_value(reply, "subCodes", v12);
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v20);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
    else
    {
      location = 0;
      objc_initWeak(&location, self);
      -[ENDaemon configurationManager](self->_daemon, "configurationManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v5;
      v26[1] = 3221225472;
      v26[2] = __42__ENXPCConnection__xpcGetSubdivisionList___block_invoke_2;
      v26[3] = &unk_1E87DAA10;
      v30 = &v33;
      v26[4] = self;
      v27 = v9;
      v28 = v12;
      v29 = v6;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v21, "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", v27, 0, v26);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v33, 8);
  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  v7[2](v7);
  _Block_object_dispose(&v43, 8);

}

uint64_t __42__ENXPCConnection__xpcGetSubdivisionList___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __42__ENXPCConnection__xpcGetSubdivisionList___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  const char *v13;
  xpc_object_t reply;
  void *v15;
  id WeakRetained;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subdivisionListForRegion:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v13 = (const char *)objc_msgSend(v12, "cStringUsingEncoding:", 4, (_QWORD)v17);
        if (v13)
          xpc_array_set_string(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 56));
  v15 = reply;
  if (reply)
  {
    xpc_dictionary_set_value(reply, "subCodes", *(xpc_object_t *)(a1 + 48));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "_xpcSendMessage:", v15);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_xpcGetCurrentAgencyConfig:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  BOOL v9;
  void *v10;
  void *reply;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  xpc_object_t v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[7];
  id obj;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __46__ENXPCConnection__xpcGetCurrentAgencyConfig___block_invoke;
  v24[3] = &unk_1E87D9D88;
  v26 = &v27;
  v24[4] = self;
  v6 = v4;
  v25 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v24);
  v8 = (id *)(v28 + 5);
  obj = (id)v28[5];
  v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v8, obj);
  if (v9)
  {
    -[ENDaemon configurationManager](self->_daemon, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      goto LABEL_14;
    }
    if (xpc_dictionary_get_BOOL(v6, "feAll"))
    {
      reply = xpc_dictionary_create_reply(v6);
      if (!reply)
      {
        if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        goto LABEL_13;
      }
      objc_msgSend(v10, "configurationStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v5;
      v22[1] = 3221225472;
      v22[2] = __46__ENXPCConnection__xpcGetCurrentAgencyConfig___block_invoke_2;
      v22[3] = &unk_1E87DA920;
      v22[5] = self;
      v22[6] = &v27;
      v22[4] = reply;
      objc_msgSend(v12, "allAgencyServerRegionConfigurationsWithCompletion:", v22);
    }
    else
    {
      -[ENDaemon activeEntity](self->_daemon, "activeEntity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "region");
      reply = (void *)objc_claimAutoreleasedReturnValue();

      if (reply)
      {
        objc_msgSend(v10, "configurationStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "agencyConfigurationForRegion:", reply);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (id *)(v28 + 5);
        v21 = (id)v28[5];
        objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v16, v21);
        if (v17)
        {
          v18 = xpc_dictionary_create_reply(v6);
          if (v18)
          {
            v19 = objc_retainAutorelease(v17);
            xpc_dictionary_set_data(v18, "svrCfg", (const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"));
            -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v18);
          }
          else if (gLogCategory__ENDaemon <= 90
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }

        }
      }
      else
      {
        ENErrorF();
        v20 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v28[5];
        v28[5] = v20;
      }
    }

LABEL_13:
LABEL_14:

  }
  v7[2](v7);

  _Block_object_dispose(&v27, 8);
}

uint64_t __46__ENXPCConnection__xpcGetCurrentAgencyConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __46__ENXPCConnection__xpcGetCurrentAgencyConfig___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(void **)(a1 + 32);
  v6 = objc_retainAutorelease(v4);
  xpc_dictionary_set_data(v5, "svrCfg", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  objc_msgSend(*(id *)(a1 + 40), "_xpcSendMessage:", *(_QWORD *)(a1 + 32));

}

- (void)_xpcSetDeveloperRegionServerConfig:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *reply;
  id *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void (**v25)(_QWORD);
  id v26;
  id v27;
  id obj;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  v37 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __54__ENXPCConnection__xpcSetDeveloperRegionServerConfig___block_invoke;
  v29[3] = &unk_1E87D9D88;
  v31 = &v32;
  v29[4] = self;
  v5 = v4;
  v30 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v29);
  v7 = (id *)(v33 + 5);
  obj = (id)v33[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    if (!-[ENDaemon prefDeveloperServerConfiguration](self->_daemon, "prefDeveloperServerConfiguration"))
    {
      ENErrorF();
      v23 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v33[5];
      v33[5] = v23;
      goto LABEL_29;
    }
    xpc_dictionary_get_value(v5, "svrCfg");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    -[ENDaemon configurationManager](self->_daemon, "configurationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      objc_msgSend(v12, "clearTemporaryCountrySubdivisionList");
      objc_msgSend(v12, "clearTemporaryServerConfigurations");
      goto LABEL_26;
    }
    v25 = v6;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("appConfigs"));
    reply = (void *)objc_claimAutoreleasedReturnValue();
    if (reply && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(reply, "count"))
    {
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      v14 = (id *)(v33 + 5);
      v27 = (id)v33[5];
      v15 = objc_msgSend(v12, "saveTemporaryServerConfigurations:error:", reply, &v27, v9);
      objc_storeStrong(v14, v27);
      if ((v15 & 1) == 0)
      {
        v9 = v24;
        goto LABEL_28;
      }
      objc_msgSend(reply, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("countryCode"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subdivisions"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_25;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v18, "count"))
        goto LABEL_25;
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      objc_msgSend(MEMORY[0x1E0CAA378], "regionWithCode:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id *)(v33 + 5);
      v26 = (id)v33[5];
      v21 = objc_msgSend(v12, "saveTemporaryCountrySubdivisionList:region:error:", v18, v19, &v26);
      objc_storeStrong(v20, v26);

      if (v21)
      {
LABEL_25:

        v9 = v24;
        v6 = v25;
LABEL_26:
        -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
        reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        goto LABEL_28;
      }

      v9 = v24;
      v6 = v25;
    }
    else
    {
      ENErrorF();
      v22 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v33[5];
      v33[5] = v22;
    }

LABEL_28:
LABEL_29:

  }
  v6[2](v6);

  _Block_object_dispose(&v32, 8);
}

uint64_t __54__ENXPCConnection__xpcSetDeveloperRegionServerConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetRegionConsent:(id)a3
{
  id v4;
  id *v5;
  BOOL v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  id *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  const char *v46;
  int v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  int v55;
  int v56;
  xpc_object_t reply;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  const char *v65;
  unint64_t v66;
  void *v67;
  void (**v68)(_QWORD);
  void *v69;
  void *v70;
  id v71;
  xpc_object_t original;
  void *v73;
  _QWORD v74[4];
  id v75;
  ENXPCConnection *v76;
  id v77;
  id v78;
  id v79;
  id obj;
  _QWORD v81[5];
  id v82;
  uint64_t *v83;
  uint64_t v84;
  id *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v84 = 0;
  v85 = (id *)&v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__3;
  v88 = __Block_byref_object_dispose__3;
  v89 = 0;
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __40__ENXPCConnection__xpcSetRegionConsent___block_invoke;
  v81[3] = &unk_1E87D9D88;
  v83 = &v84;
  v81[4] = self;
  original = v4;
  v82 = original;
  v68 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v81);
  v5 = v85;
  obj = v85[5];
  v6 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v5 + 5, obj);
  if (v6)
  {
    -[ENDaemon configurationManager](self->_daemon, "configurationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v7;
    if (!v7)
    {
      ENErrorF();
      v58 = objc_claimAutoreleasedReturnValue();
      v71 = v85[5];
      v85[5] = (id)v58;

      goto LABEL_62;
    }
    objc_msgSend(v7, "configurationStore");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v85;
    v79 = v85[5];
    -[ENXPCConnection _regionConfigForXPCRequest:error:](self, "_regionConfigForXPCRequest:error:", original, &v79);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8 + 5, v79);
    if (!v9)
    {
LABEL_61:

LABEL_62:
      goto LABEL_63;
    }
    if ((unint64_t)objc_msgSend(v9, "enVersion") <= 1)
    {
      ENErrorF();
      v59 = objc_claimAutoreleasedReturnValue();
      v10 = v85[5];
      v85[5] = (id)v59;
      goto LABEL_60;
    }
    objc_msgSend(v9, "region");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "serverConfigurationForRegion:", v10);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "appBundleID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      objc_msgSend(MEMORY[0x1E0CA5858], "applicationProxyForIdentifier:placeholder:", v73, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isInstalled"))
      {

        goto LABEL_8;
      }
      objc_msgSend(v11, "appState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isPlaceholder");

      if (v14)
      {
LABEL_8:
        ENErrorF();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v85[5];
        v85[5] = (id)v15;

LABEL_59:
LABEL_60:

        goto LABEL_61;
      }

    }
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "entity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "region");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "regionCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "regionCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "hasPrefix:", v21) & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v9, "userConsent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "consent") == 4;

      if (v23)
      {
        ENErrorF();
        v24 = objc_claimAutoreleasedReturnValue();
        v11 = v85[5];
        v85[5] = (id)v24;
        goto LABEL_59;
      }
    }
    objc_opt_class();
    v25 = v85;
    v78 = v85[5];
    ENXPCDecodeSecureObjectIfPresent();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v25 + 5, v78);
    if (!v11)
      goto LABEL_59;
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v60 = v10;
      v63 = v11;
      LogPrintF_safe();
    }
    objc_msgSend(v9, "userConsent", v60, v63);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "consentVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "consentVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqualToString:", v28);

    if ((v29 & 1) == 0)
    {
      objc_msgSend(v69, "legalConsentVersion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "consentVersion");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToString:", v31);

      if ((v32 & 1) == 0)
      {
        objc_msgSend(v11, "consentVersion");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        ENErrorF();
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v85[5];
        v85[5] = (id)v36;
LABEL_58:

        goto LABEL_59;
      }
    }
    objc_msgSend(v9, "userConsent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "updatedConsent:", v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserConsent:", v34);

    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v9, "userConsent");
      v61 = v10;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    -[ENXPCConnection _sendOnboardingMetricForRegionConfiguration:](self, "_sendOnboardingMetricForRegionConfiguration:", v9, v61, v64);
    v38 = v85;
    v77 = v85[5];
    v39 = objc_msgSend(v70, "saveRegionConfiguration:error:", v9, &v77);
    objc_storeStrong(v38 + 5, v77);
    if (!v39)
      goto LABEL_59;
    objc_msgSend(v9, "userConsent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "consent");

    -[ENDaemon _readPreferenceRegionPendingOnboarding](self->_daemon, "_readPreferenceRegionPendingOnboarding");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v41 - 1;
    switch(v41)
    {
      case 1:
        goto LABEL_30;
      case 2:
        -[ENDaemon _disableAvailabilityAlertIfNeeded](self->_daemon, "_disableAvailabilityAlertIfNeeded");
        -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
        break;
      case 3:
LABEL_30:
        -[ENDaemon activeEntity](self->_daemon, "activeEntity");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "entity");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "region");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v10, "isEqual:", v44);

        if (v45)
        {
          if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            if (v66 > 2)
              v46 = "?";
            else
              v46 = off_1E87DAFD0[v66];
            v62 = v10;
            v65 = v46;
            LogPrintF_safe();
          }
          -[ENDaemon _turnOffEN](self->_daemon, "_turnOffEN", v62, v65);
        }
        break;
    }
    v47 = objc_msgSend(v35, "isEqual:", v10);
    if (v41)
      v48 = v47;
    else
      v48 = 0;
    if (v48 == 1)
    {
      -[ENDaemon userNotificationCenter](self->_daemon, "userNotificationCenter");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = CFSTR("com.apple.ExposureNotification.onboarding");
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v90, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "removeDeliveredNotificationsWithIdentifiers:", v50);

      -[ENDaemon onboardingManager](self->_daemon, "onboardingManager");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setShouldObserveDeviceUnlocks:", 0);

      -[ENDaemon onboardingManager](self->_daemon, "onboardingManager");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setPendingBuddyOnboarding:", 0);

    }
    -[ENDaemon userNotificationCenter](self->_daemon, "userNotificationCenter");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __40__ENXPCConnection__xpcSetRegionConsent___block_invoke_2;
    v74[3] = &unk_1E87DAA38;
    v54 = v10;
    v75 = v54;
    v76 = self;
    objc_msgSend(v53, "getDeliveredNotificationsWithCompletionHandler:", v74);

    v55 = objc_msgSend(v35, "isEqual:", v54);
    if (v66 < 2)
      v56 = v55;
    else
      v56 = 0;
    if (v56 == 1)
      -[ENDaemon onboardingTriggerDeactivate](self->_daemon, "onboardingTriggerDeactivate");
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    reply = xpc_dictionary_create_reply(original);
    if (reply)
    {
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    v37 = v75;
    goto LABEL_58;
  }
LABEL_63:
  v68[2](v68);

  _Block_object_dispose(&v84, 8);
}

uint64_t __40__ENXPCConnection__xpcSetRegionConsent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __40__ENXPCConnection__xpcSetRegionConsent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v2)
  {
    v3 = v2;
    v20 = *(_QWORD *)v22;
    v4 = CFSTR("regionCode");
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "request");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "content");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "request");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "categoryIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ExposureNotification.UserNotification.analyticsConsent")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "regionCode");
            v14 = v4;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v10);

            v4 = v14;
            if (!v16)
              goto LABEL_11;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "userNotificationCenter");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "request");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v13;
            objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v25, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeDeliveredNotificationsWithIdentifiers:", v17);

            v4 = v14;
          }
        }

LABEL_11:
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v3);
  }

}

- (void)_sendOnboardingMetricForRegionConfiguration:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  _BOOL4 v33;
  unsigned int v34;
  id v35;

  v35 = a3;
  v4 = -[ENDaemon onboardingTrigger](self->_daemon, "onboardingTrigger");
  v5 = v35;
  if ((_DWORD)v4)
  {
    objc_msgSend(v35, "userConsent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "consent");

    v33 = -[ENDaemon onboardingFirstTime](self->_daemon, "onboardingFirstTime");
    objc_msgSend(v35, "region");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "countryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "utf8ValueSafe");

    -[ENDaemon onboardingRegionTrigger](self->_daemon, "onboardingRegionTrigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isSubdivisionCodeEqualToRegion:", v11);
    v13 = -[ENDaemon _getLegalConsentPageCount](self->_daemon, "_getLegalConsentPageCount");
    if (-[ENDaemon onboardingLegalConsentLastViewCount](self->_daemon, "onboardingLegalConsentLastViewCount") < v13)
      v14 = v12;
    else
      v14 = 0;
    v34 = v14;
    if (objc_msgSend(v8, "validSubdivisionCode"))
    {
      objc_msgSend(v8, "subdivisionCode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("-"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") == 2)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "utf8ValueSafe");

    }
    else
    {
      v18 = 0;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      if (v4 > 4)
        v19 = "?";
      else
        v19 = off_1E87DAFE8[(int)v4 - 1];
      if (v18)
        v20 = v18;
      else
        v20 = v10;
      v21 = "no";
      if (v34)
        v22 = "yes";
      else
        v22 = "no";
      if (v7 == 2)
        v23 = "yes";
      else
        v23 = "no";
      if (v33)
        v21 = "yes";
      v31 = v23;
      v32 = v21;
      v29 = v20;
      v30 = v22;
      v28 = v19;
      LogPrintF_safe();
    }
    -[ENDaemon delegate](self->_daemon, "delegate", v28, v29, v30, v31, v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "countryCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "validSubdivisionCode") & 1) != 0)
    {
      objc_msgSend(v8, "subdivisionCode");
      v26 = v11;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendOnBoardingMetricWithTrigger:completed:firstTime:countryCode:subdivisionCode:legalConsent:", v4, v7 == 2, v33, v25, v27, v34);

      v11 = v26;
    }
    else
    {
      objc_msgSend(v24, "sendOnBoardingMetricWithTrigger:completed:firstTime:countryCode:subdivisionCode:legalConsent:", v4, v7 == 2, v33, v25, CFSTR("Unknown"), v34);
    }

    -[ENDaemon setOnboardingTrigger:](self->_daemon, "setOnboardingTrigger:", 0);
    -[ENDaemon setOnboardingFirstTime:](self->_daemon, "setOnboardingFirstTime:", 0);
    -[ENDaemon setOnboardingRegionTrigger:](self->_daemon, "setOnboardingRegionTrigger:", 0);
    -[ENDaemon setOnboardingLegalConsentLastViewCount:](self->_daemon, "setOnboardingLegalConsentLastViewCount:", -[ENDaemon _getLegalConsentPageCount](self->_daemon, "_getLegalConsentPageCount"));

    v5 = v35;
  }

}

- (void)_xpcTCCCheck:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  _BOOL4 v8;
  const char *v9;
  __CFDictionary *Mutable;
  int v11;
  const char *v12;
  xpc_object_t reply;
  uint64_t v14;
  id v15;
  uint64_t v16;
  const char *v17;
  id obj;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __32__ENXPCConnection__xpcTCCCheck___block_invoke;
  v19[3] = &unk_1E87D9D88;
  v21 = &v22;
  v19[4] = self;
  v5 = v4;
  v20 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v19);
  if (MEMORY[0x1E0DB0F98])
  {
    v7 = v23;
    obj = v23[5];
    v8 = -[ENXPCConnection _authorizationPreflightUnknownAndReturnError:](self, "_authorizationPreflightUnknownAndReturnError:", &obj);
    objc_storeStrong(v7 + 5, obj);
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v9 = "no";
      if (v8)
        v9 = "yes";
      v17 = v9;
      LogPrintF_safe();
    }
    xpc_connection_get_audit_token();
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE08], 1, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0DB1090], (const void *)*MEMORY[0x1E0C9AE58]);
    v11 = TCCAccessCheckAuditToken();
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v12 = "granted";
      if (!v11)
        v12 = "not granted";
      v17 = v12;
      LogPrintF_safe();
    }
    if (v8)
      -[ENXPCConnection _updateActiveEntityFromTCCResult:](self, "_updateActiveEntityFromTCCResult:", v11 != 0, v17);
    CFRelease(Mutable);
    if (v11)
    {
      reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else
    {
      ENErrorF();
      v16 = objc_claimAutoreleasedReturnValue();
      reply = v23[5];
      v23[5] = (id)v16;
    }

  }
  else
  {
    ENErrorF();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v23[5];
    v23[5] = (id)v14;

  }
  v6[2](v6);

  _Block_object_dispose(&v22, 8);
}

uint64_t __32__ENXPCConnection__xpcTCCCheck___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_updateActiveEntityFromTCCResult:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ENActiveEntity *v10;
  id v11;
  void *v12;
  void *v13;
  ENActiveEntity *v14;
  ENActiveEntity *v15;
  id v16;
  void *v17;
  void *v18;
  ENDaemon *daemon;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  void *v33;
  ENDaemon *v34;
  void *v35;
  id v36;
  _QWORD v37[7];
  id v38;

  v5 = (void *)MEMORY[0x1E0CA5858];
  -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationProxyForIdentifier:placeholder:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ENDaemon _getInfoDictFromAppProxy:](self->_daemon, "_getInfoDictFromAppProxy:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      goto LABEL_34;
    }
    -[ENDaemon regionForBundleInfo:](self->_daemon, "regionForBundleInfo:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a3)
      {
        v10 = [ENActiveEntity alloc];
        v11 = objc_alloc(MEMORY[0x1E0CAA2F8]);
        -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithBundleID:region:", v12, v9);
        v14 = -[ENActiveEntity initWithEntity:activeStatus:](v10, "initWithEntity:activeStatus:", v13, 2);

        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v35 = v9;
          LogPrintF_safe();
        }
        -[ENDaemon configurationManager](self->_daemon, "configurationManager", v35);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "configurationStore");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "configurationForRegion:", v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v27, "userConsent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setConsent:", 4);

          -[ENDaemon configurationManager](self->_daemon, "configurationManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "configurationStore");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0;
          v31 = objc_msgSend(v30, "saveRegionConfiguration:error:", v27, &v38);
          v32 = v38;

          if ((v31 & 1) == 0
            && gLogCategory__ENDaemon <= 90
            && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            v36 = v32;
            LogPrintF_safe();
          }

        }
        -[ENDaemon _writePreferenceActiveEntity:](self->_daemon, "_writePreferenceActiveEntity:", v14, v36);

        goto LABEL_30;
      }
      -[ENDaemon activeEntity](self->_daemon, "activeEntity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "entity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "region");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqual:", v9);

      if (v24)
      {
        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        -[ENDaemon _turnOffEN](self->_daemon, "_turnOffEN");
        goto LABEL_33;
      }
    }
    else if (a3)
    {
      v15 = [ENActiveEntity alloc];
      v16 = objc_alloc(MEMORY[0x1E0CAA2F8]);
      -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithBundleID:region:", v17, 0);
      v14 = -[ENActiveEntity initWithEntity:activeStatus:](v15, "initWithEntity:activeStatus:", v18, 2);

      -[ENDaemon _writePreferenceActiveEntity:](self->_daemon, "_writePreferenceActiveEntity:", v14);
      daemon = self->_daemon;
      -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENDaemon _setActiveRegionForApp:infoDict:](daemon, "_setActiveRegionForApp:infoDict:", v20, v8);

LABEL_30:
      TCCAccessSetForBundleId();
      -[ENDaemon _disableAvailabilityAlertIfNeeded](self->_daemon, "_disableAvailabilityAlertIfNeeded");
      -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
      if (v9 && -[ENXPCClient accessLevel](self->_client, "accessLevel") <= 2)
      {
        -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = self->_daemon;
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __52__ENXPCConnection__updateActiveEntityFromTCCResult___block_invoke;
        v37[3] = &unk_1E87DAA60;
        v37[4] = v33;
        v37[5] = v9;
        v37[6] = self;
        -[ENDaemon fetchServerConfigurationForRegion:completion:](v34, "fetchServerConfigurationForRegion:completion:", v9, v37);

      }
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    goto LABEL_33;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_35:

}

void __52__ENXPCConnection__updateActiveEntityFromTCCResult___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  ENActiveEntity *v3;
  id v6;
  void *v7;
  uint64_t v8;
  ENActiveEntity *v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = a3;
  if (v11)
  {
    objc_msgSend(v11, "appBundleID");
    v3 = (ENActiveEntity *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_7:
      v9 = [ENActiveEntity alloc];
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA2F8]), "initWithBundleID:region:", a1[4], a1[5]);
      v3 = -[ENActiveEntity initWithEntity:activeStatus:](v9, "initWithEntity:activeStatus:", v10, 1);

      objc_msgSend(*(id *)(a1[6] + 32), "_writePreferenceActiveEntity:", v3);
      CFPrefs_RemoveValue();
      objc_msgSend(*(id *)(a1[6] + 32), "prefsChanged");
LABEL_9:

      goto LABEL_10;
    }
  }
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ENConfigurationManagerErrorDomain")))
  {
    v8 = objc_msgSend(v6, "code");

    if (v11)
    if (v8 == 5)
      goto LABEL_7;
  }
  else
  {

    if (v11)
      goto LABEL_9;
  }
LABEL_10:

}

- (void)_xpcExposureDetectionFileActivate:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  id *v11;
  BOOL v12;
  id *v13;
  BOOL v14;
  id *v15;
  BOOL v16;
  ENExposureDetectionDaemonSession *detectionSession;
  id v18;
  id *v19;
  id v20;
  void *v21;
  ENXPCClient *client;
  void *v23;
  id *v24;
  id v25;
  id *v26;
  char v27;
  xpc_object_t reply;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v4 = a3;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  v47 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __53__ENXPCConnection__xpcExposureDetectionFileActivate___block_invoke;
  v39[3] = &unk_1E87D9D88;
  v41 = &v42;
  v39[4] = self;
  v5 = v4;
  v40 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v39);
  v7 = v43;
  obj = v43[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &obj);
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    v9 = v43;
    v37 = v43[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v37);
    objc_storeStrong(v9 + 5, v37);
    if (v10)
    {
      if (!-[ENDaemon prefEnabled](self->_daemon, "prefEnabled"))
      {
        ENErrorF();
        v29 = objc_claimAutoreleasedReturnValue();
        v20 = v43[5];
        v43[5] = (id)v29;
LABEL_20:

        goto LABEL_21;
      }
      v11 = v43;
      v36 = v43[5];
      v12 = -[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", &v36);
      objc_storeStrong(v11 + 5, v36);
      if (v12)
      {
        v13 = v43;
        v35 = v43[5];
        v14 = -[ENXPCConnection _xpcManagerActivateIfNecessaryWithRequest:error:](self, "_xpcManagerActivateIfNecessaryWithRequest:error:", v5, &v35);
        objc_storeStrong(v13 + 5, v35);
        if (v14)
        {
          if (-[ENXPCClient accessLevel](self->_client, "accessLevel") > 2
            || (v15 = v43,
                v34 = v43[5],
                v16 = -[ENXPCConnection _rateLimitAndReturnError:](self, "_rateLimitAndReturnError:", &v34),
                objc_storeStrong(v15 + 5, v34),
                v16))
          {
            -[ENExposureDetectionDaemonSession invalidate](self->_detectionSession, "invalidate");
            detectionSession = self->_detectionSession;
            self->_detectionSession = 0;

            v18 = objc_alloc(MEMORY[0x1E0CAA318]);
            v19 = v43;
            v33 = v43[5];
            v20 = (id)objc_msgSend(v18, "initWithXPCObject:error:", v5, &v33);
            objc_storeStrong(v19 + 5, v33);
            if (v20)
            {
              -[ENDaemon exposureDetectionManager](self->_daemon, "exposureDetectionManager");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                client = self->_client;
                objc_msgSend(v20, "configuration");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v43;
                v32 = v43[5];
                objc_msgSend(v21, "createDetectionSessionForClient:configuration:error:", client, v23, &v32);
                v25 = (id)objc_claimAutoreleasedReturnValue();
                objc_storeStrong(v24 + 5, v32);

                if (v25)
                {
                  objc_msgSend(v25, "setSkipFileSigningVerification:", -[ENXPCConnection skipFileSigningVerification](self, "skipFileSigningVerification"));
                  -[ENDaemon setUsageExposureDetectFileActivate:](self->_daemon, "setUsageExposureDetectFileActivate:", -[ENDaemon usageExposureDetectFileActivate](self->_daemon, "usageExposureDetectFileActivate") + 1);
                  if (gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    -[ENXPCClient appAPIVersion](self->_client, "appAPIVersion");
                    LogPrintF_safe();
                  }
                  objc_storeStrong((id *)&self->_detectionSession, v25);
                  v26 = v43;
                  v31 = v43[5];
                  v27 = objc_msgSend(v25, "prepareAndReturnError:", &v31);
                  objc_storeStrong(v26 + 5, v31);
                  if ((v27 & 1) != 0)
                  {
                    reply = xpc_dictionary_create_reply(v5);
                    if (reply)
                    {
                      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
                    }
                    else if (gLogCategory__ENDaemon <= 90
                           && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF_safe();
                    }

                  }
                  else if (gLogCategory__ENDaemon <= 90
                         && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF_safe();
                  }
                }
              }
              else
              {
                ENErrorF();
                v30 = objc_claimAutoreleasedReturnValue();
                v25 = v43[5];
                v43[5] = (id)v30;
              }

            }
            goto LABEL_20;
          }
        }
      }
    }
  }
LABEL_21:
  v6[2](v6);

  _Block_object_dispose(&v42, 8);
}

uint64_t __53__ENXPCConnection__xpcExposureDetectionFileActivate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcExposureDetectionFileAdd:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  BOOL v9;
  void *v10;
  ENExposureDetectionDaemonSession *v11;
  int v12;
  id *v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  void *v16;
  id *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  ENExposureDetectionDaemonSession *v43;
  _QWORD v44[5];
  id v45;
  void *v46;
  id obj;
  id v48;
  _QWORD v49[4];
  int v50;
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  uint64_t *v55;
  uint64_t v56;
  id *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v4 = a3;
  v56 = 0;
  v57 = (id *)&v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__3;
  v60 = __Block_byref_object_dispose__3;
  v61 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke;
  v53[3] = &unk_1E87D9D88;
  v55 = &v56;
  v53[4] = self;
  v6 = v4;
  v54 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v53);
  v8 = v57;
  v52 = v57[5];
  v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &v52);
  objc_storeStrong(v8 + 5, v52);
  if (v9)
  {
    -[ENDaemon exposureDetectionManager](self->_daemon, "exposureDetectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = self->_detectionSession;
      if (!v11
        || (-[ENDaemon setUsageExposureDetectFileAddKeys:](self->_daemon, "setUsageExposureDetectFileAddKeys:", -[ENDaemon usageExposureDetectFileAddKeys](self->_daemon, "usageExposureDetectFileAddKeys") + 1), v12 = xpc_dictionary_dup_fd(v6, "fd"), v12 < 0))
      {
        ENErrorF();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v57[5];
        v57[5] = (id)v27;

      }
      else
      {
        xpc_dictionary_get_string(v6, "sbTk");
        v13 = v57;
        v51 = v57[5];
        v14 = ENCloneFileToTemporaryDirectory();
        objc_storeStrong(v13 + 5, v51);
        v49[0] = v5;
        v49[1] = 3221225472;
        v49[2] = __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_2;
        v49[3] = &__block_descriptor_36_e5_v8__0l;
        v50 = v12;
        v15 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v49);
        if ((v14 & 0x80000000) == 0)
        {
          v43 = v11;
          v48 = 0;
          CUXPCDecodeNSData();
          objc_msgSend(v10, "createFileSession");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v57;
          obj = v57[5];
          v18 = objc_msgSend(v16, "activateWithFD:signatureData:error:", v14, 0, &obj);
          objc_storeStrong(v17 + 5, obj);
          if ((v18 & 1) != 0)
          {
            objc_msgSend(v16, "signatures");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "firstObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "keyID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "keyVersion");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isSensitiveLoggingAllowed");

            if (v23
              && gLogCategory_ENDaemon <= 30
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(v16, "sha256Data");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "appleBundleID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v20, "batchNumber");
              v36 = objc_msgSend(v20, "batchCount");
              objc_msgSend(v20, "keyID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "keyVersion");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "metadata");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              CUPrintNSObjectOneLine();
              v34 = v39;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v36;
              v33 = v40;
              v30 = v24;
              v31 = v37;
              v29 = v41;
              LogPrintF_safe();

            }
            objc_msgSend(v20, "signatureData", v29, v30, v31, v32, v33, v34, v35);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25 && v21)
            {
              v44[0] = MEMORY[0x1E0C809B0];
              v44[1] = 3221225472;
              v44[2] = __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_3;
              v44[3] = &unk_1E87DAAD0;
              v44[4] = self;
              v45 = v6;
              v46 = v16;
              -[ENXPCConnection _fetchClientPublicKeyWithVerificationID:keyVersion:completion:](self, "_fetchClientPublicKeyWithVerificationID:keyVersion:completion:", v42, v21, v44);

            }
            else
            {
              -[ENXPCConnection _xpcExposureDetectionFileAddNext:fileSession:publicKey:](self, "_xpcExposureDetectionFileAddNext:fileSession:publicKey:", v6, v16, 0);
            }

          }
          else
          {
            close(v14);
          }

          v11 = v43;
        }
        v15[2](v15);

      }
    }
    else
    {
      ENErrorF();
      v26 = objc_claimAutoreleasedReturnValue();
      v11 = (ENExposureDetectionDaemonSession *)v57[5];
      v57[5] = (id)v26;
    }

  }
  v7[2](v7);

  _Block_object_dispose(&v56, 8);
}

uint64_t __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_4;
  block[3] = &unk_1E87DAAA8;
  v7 = a1[4];
  v8 = (void *)a1[5];
  v9 = *(NSObject **)(v7 + 48);
  block[1] = 3221225472;
  v15 = v5;
  v16 = v7;
  v17 = v6;
  v10 = v8;
  v11 = a1[6];
  v18 = v10;
  v19 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v9, block);

}

uint64_t __48__ENXPCConnection__xpcExposureDetectionFileAdd___block_invoke_4(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 32)
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  return objc_msgSend(*(id *)(a1 + 40), "_xpcExposureDetectionFileAddNext:fileSession:publicKey:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
}

- (void)_fetchClientPublicKeyWithVerificationID:(id)a3 keyVersion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  ENDaemon *daemon;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  ENXPCClient *client;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__3;
  v39 = __Block_byref_object_dispose__3;
  v11 = MEMORY[0x1E0C809B0];
  v40 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke;
  v32[3] = &unk_1E87DA768;
  v34 = &v35;
  v12 = v10;
  v33 = v12;
  v13 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v32);
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v25 = v8;
    v26 = v9;
    client = self->_client;
    LogPrintF_safe();
  }
  if (!objc_msgSend(v9, "length", client, v25, v26))
  {
    ENErrorF();
    v22 = objc_claimAutoreleasedReturnValue();
    v15 = (id)v36[5];
    v36[5] = v22;
    goto LABEL_15;
  }
  -[ENXPCClient appRegion](self->_client, "appRegion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = v8;
    -[ENDaemon prefRegionIdentifierOverride](self->_daemon, "prefRegionIdentifierOverride");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:](ENCoreTelephonyUtility, "countryCodeISOForMobileCountryCode:", v15);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = v17 ? (id)v17 : v15;
      v16 = v19;

      if (!v16)
      {
        ENErrorF();
        v23 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v36[5];
        v36[5] = v23;
        goto LABEL_14;
      }
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:", v16);

  }
  daemon = self->_daemon;
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke_2;
  v27[3] = &unk_1E87DAB38;
  v31 = &v35;
  v30 = v12;
  v27[4] = self;
  v15 = v14;
  v28 = v15;
  v29 = v9;
  -[ENDaemon fetchServerConfigurationForRegion:completion:](daemon, "fetchServerConfigurationForRegion:completion:", v15, v27);

  v21 = v30;
LABEL_14:

LABEL_15:
  v13[2](v13);

  _Block_object_dispose(&v35, 8);
}

uint64_t __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  id obj;
  _QWORD v33[4];
  __int128 v34;

  v5 = a2;
  v6 = a3;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke_3;
  v33[3] = &unk_1E87DA768;
  v31 = *(_OWORD *)(a1 + 56);
  v7 = (id)v31;
  v34 = v31;
  v8 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v33);
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ENConfigurationManagerErrorDomain")) & 1) != 0)
    {
      v10 = objc_msgSend(v6, "code");

      if (v10 == 5)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "signingIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        ENErrorF();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        goto LABEL_24;
      }
    }
    else
    {

    }
LABEL_11:
    ENNestedErrorF();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;
    goto LABEL_24;
  }
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v5, "publicKeyVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v16 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "signingIdentity");
      v29 = v16;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v15;
      v28 = v11;
      LogPrintF_safe();

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "configurationManager", v27, v28, v29, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchServerConfigurationsForRegion:userInitiated:withCompletion:", *(_QWORD *)(a1 + 40), 0, &__block_literal_global_2067);

  }
  objc_msgSend(v5, "publicKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v27 = v20;
    LogPrintF_safe();
  }
  v21 = *MEMORY[0x1E0CD6A08];
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v22 + 40);
  +[ENSecKey keyFromBase64String:keyClass:error:](ENSecKey, "keyFromBase64String:keyClass:error:", v20, v21, &obj, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v22 + 40), obj);
  if (v23)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if ((objc_msgSend(*(id *)(a1 + 32), "skipFileSigningVerification") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "configurationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "configurationStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "configurationForRegion:", *(_QWORD *)(a1 + 40));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_exposureNotificationRegionConfigurationChanged:", v26);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }

LABEL_24:
  v8[2](v8);

}

uint64_t __81__ENXPCConnection__fetchClientPublicKeyWithVerificationID_keyVersion_completion___block_invoke_3(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_xpcExposureDetectionFileAddNext:(id)a3 fileSession:(id)a4 publicKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  ENExposureDetectionDaemonSession *v13;
  ENExposureDetectionDaemonSession *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  xpc_object_t reply;
  uint64_t v23;
  id v24;
  id obj;
  _QWORD v26[4];
  id v27;
  ENXPCConnection *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v24 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __74__ENXPCConnection__xpcExposureDetectionFileAddNext_fileSession_publicKey___block_invoke;
  v26[3] = &unk_1E87DAB60;
  v10 = v9;
  v30 = &v31;
  v27 = v10;
  v28 = self;
  v11 = v8;
  v29 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v26);
  v13 = self->_detectionSession;
  v14 = v13;
  if (!v13)
  {
    ENErrorF();
    v23 = objc_claimAutoreleasedReturnValue();
    reply = (xpc_object_t)v32[5];
    v32[5] = v23;
LABEL_10:

    goto LABEL_11;
  }
  -[ENExposureDetectionDaemonSession statistics](v13, "statistics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fileKeyCount");

  -[ENExposureDetectionDaemonSession statistics](v14, "statistics");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "matchedKeyCount");

  v17 = (id *)(v32 + 5);
  obj = (id)v32[5];
  LOBYTE(v16) = -[ENExposureDetectionDaemonSession addMatchesFromFileSession:publicKey:endpoint:error:](v14, "addMatchesFromFileSession:publicKey:endpoint:error:", v10, v24, 0, &obj);
  objc_storeStrong(v17, obj);
  if ((v16 & 1) != 0)
  {
    -[ENExposureDetectionDaemonSession statistics](v14, "statistics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileKeyCount");

    -[ENExposureDetectionDaemonSession statistics](v14, "statistics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "matchedKeyCount");

    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isSensitiveLoggingAllowed");

    if (v21 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    reply = xpc_dictionary_create_reply(v11);
    if (reply)
    {
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_10;
  }
LABEL_11:

  v12[2](v12);
  _Block_object_dispose(&v31, 8);

}

uint64_t __74__ENXPCConnection__xpcExposureDetectionFileAddNext_fileSession_publicKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 56);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 56), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 56);
      }
    }
    return objc_msgSend(*(id *)(a1 + 40), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)_xpcExposureDetectionFileFinish:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  ENExposureDetectionDaemonSession *v9;
  ENExposureDetectionDaemonSession *v10;
  id *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  xpc_object_t reply;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id obj;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __51__ENXPCConnection__xpcExposureDetectionFileFinish___block_invoke;
  v24[3] = &unk_1E87D9D88;
  v26 = &v27;
  v24[4] = self;
  v5 = v4;
  v25 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v24);
  v7 = (id *)(v28 + 5);
  obj = (id)v28[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = self->_detectionSession;
    v10 = v9;
    if (v9)
    {
      v11 = (id *)(v28 + 5);
      v22 = (id)v28[5];
      -[ENExposureDetectionDaemonSession finishAndReturnError:](v9, "finishAndReturnError:", &v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v11, v22);
      if (v12)
      {
        objc_msgSend(v12, "statistics");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v14 = objc_msgSend(v13, "processedFileCount");
          v20 = objc_msgSend(v13, "fileKeyCount");
          v21 = objc_msgSend(v13, "invalidFileSignatureCount");
          v19 = v14;
          LogPrintF_safe();
        }
        -[ENDaemon setUsageExposureDetectFileFinish:](self->_daemon, "setUsageExposureDetectFileFinish:", -[ENDaemon usageExposureDetectFileFinish](self->_daemon, "usageExposureDetectFileFinish", v19, v20, v21) + 1);
        reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          objc_msgSend(v12, "summary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "encodeWithXPCObject:", reply);
            -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
          }
          else if (gLogCategory__ENDaemon <= 90
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }

        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else
    {
      ENErrorF();
      v18 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v28[5];
      v28[5] = v18;
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v27, 8);
}

uint64_t __51__ENXPCConnection__xpcExposureDetectionFileFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcExposureDetectionFileGetExposures:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  BOOL v9;
  ENExposureDetectionDaemonSession *v10;
  ENExposureDetectionDaemonSession *v11;
  id *v12;
  id v13;
  const char *string;
  uint64_t v15;
  uint64_t v16;
  CFAbsoluteTime Current;
  xpc_object_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  int v27;
  xpc_object_t reply;
  void *v29;
  ENExposureDetectionDaemonSession *detectionSession;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void (**v38)(_QWORD);
  __CFString *v39;
  void *v40;
  id v41;
  void *v42;
  _QWORD v43[11];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  uint64_t *v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v4 = a3;
  v59 = 0;
  v60 = (id *)&v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__3;
  v63 = __Block_byref_object_dispose__3;
  v64 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __57__ENXPCConnection__xpcExposureDetectionFileGetExposures___block_invoke;
  v56[3] = &unk_1E87D9D88;
  v58 = &v59;
  v56[4] = self;
  v6 = v4;
  v57 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v56);
  v8 = v60;
  v55 = v60[5];
  v38 = v7;
  v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &v55);
  objc_storeStrong(v8 + 5, v55);
  if (v9)
  {
    if (-[ENXPCClient accessLevel](self->_client, "accessLevel") <= 3
      && -[ENXPCClient appAPIVersion](self->_client, "appAPIVersion") >= 2)
    {
      ENErrorF();
      v33 = objc_claimAutoreleasedReturnValue();
      v11 = (ENExposureDetectionDaemonSession *)v60[5];
      v60[5] = (id)v33;
    }
    else
    {
      v10 = self->_detectionSession;
      v11 = v10;
      if (v10)
      {
        -[ENExposureDetectionDaemonSession exposureCalculationSession](v10, "exposureCalculationSession");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          v12 = v60;
          v54 = v60[5];
          -[ENExposureDetectionDaemonSession getAnalysisSessionAndReturnError:](v11, "getAnalysisSessionAndReturnError:", &v54);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v12 + 5, v54);
          if (v13)
          {
            objc_msgSend(v13, "configuration");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            string = xpc_dictionary_get_string(v6, "auEx");
            if (string)
            {
              objc_msgSend(MEMORY[0x1E0CB3938], "stringWithUTF8String:", string);
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v39 = &stru_1E87DD6B8;
            }
            v50 = 0;
            v51 = &v50;
            v52 = 0x2020000000;
            v53 = 0;
            v48[0] = 0;
            v48[1] = v48;
            v48[2] = 0x2020000000;
            v49 = 0;
            v49 = objc_msgSend(v42, "minimumRiskScore");
            objc_msgSend(v42, "minimumRiskScoreFullRange");
            v16 = v15;
            v44 = 0;
            v45 = &v44;
            v46 = 0x2020000000;
            v47 = 0;
            Current = CFAbsoluteTimeGetCurrent();
            v18 = xpc_array_create(0, 0);
            v43[0] = v5;
            v43[1] = 3221225472;
            v43[2] = __57__ENXPCConnection__xpcExposureDetectionFileGetExposures___block_invoke_2;
            v43[3] = &unk_1E87DAB88;
            v43[6] = &v50;
            v43[7] = v48;
            *(CFAbsoluteTime *)&v43[9] = Current;
            v43[10] = v16;
            v43[8] = &v44;
            v43[4] = v13;
            v43[5] = v18;
            objc_msgSend(v40, "enumerateCachedExposureInfo:", v43);
            if (v51[3])
            {
              v37 = v13;
              v19 = v6;
              -[ENDaemon activeEntity](self->_daemon, "activeEntity");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "entity");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "bundleIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v22, "length"))
              {
                -[ENDaemon activeEntity](self->_daemon, "activeEntity");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "entity");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "bundleIdentifier");
                v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v25 = CFSTR("?");
              }

              -[ENDaemon postExposureSummaryAccessNotificationWithAppBundleIdentifier:string:](self->_daemon, "postExposureSummaryAccessNotificationWithAppBundleIdentifier:string:", v25, v39);
              v6 = v19;
              v13 = v37;
            }
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isSensitiveLoggingAllowed");

            if (v27
              && gLogCategory_ENDaemon <= 30
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              v35 = v45[3];
              v36 = v42;
              v34 = v51[3];
              LogPrintF_safe();
            }
            -[ENDaemon setUsageExposureDetectFileGetExposures:](self->_daemon, "setUsageExposureDetectFileGetExposures:", -[ENDaemon usageExposureDetectFileGetExposures](self->_daemon, "usageExposureDetectFileGetExposures", v34, v35, v36)+ 1);
            reply = xpc_dictionary_create_reply(v6);
            v29 = reply;
            if (reply)
            {
              xpc_dictionary_set_value(reply, "exIA", v18);
              -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v29);
              if (gLogCategory_ENDaemon <= 30
                && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              -[ENExposureDetectionDaemonSession invalidate](v11, "invalidate");
              detectionSession = self->_detectionSession;
              self->_detectionSession = 0;

            }
            else if (gLogCategory__ENDaemon <= 90
                   && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }

            _Block_object_dispose(&v44, 8);
            _Block_object_dispose(v48, 8);
            _Block_object_dispose(&v50, 8);

          }
        }
        else
        {
          ENErrorF();
          v32 = objc_claimAutoreleasedReturnValue();
          v13 = v60[5];
          v60[5] = (id)v32;
        }

        v7 = v38;
      }
      else
      {
        ENErrorF();
        v31 = objc_claimAutoreleasedReturnValue();
        v41 = v60[5];
        v60[5] = (id)v31;

      }
    }

  }
  v7[2](v7);

  _Block_object_dispose(&v59, 8);
}

uint64_t __57__ENXPCConnection__xpcExposureDetectionFileGetExposures___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __57__ENXPCConnection__xpcExposureDetectionFileGetExposures___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  xpc_object_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int16 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v3, "count");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    v25 = v4;
    v26 = a1;
    v24 = *(_QWORD *)v36;
    do
    {
      v8 = 0;
      v27 = v6;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
        v34 = 0;
        objc_msgSend(*(id *)(a1 + 32), "estimateRiskWithExposureInfo:referenceTime:transmissionRiskLevel:skip:", v9, (char *)&v34 + 1, &v34, *(double *)(a1 + 72), v24, v25);
        if (!(_BYTE)v34)
        {
          v11 = v10;
          if (v10 > 255.0)
            v10 = 255.0;
          if (v10 < 0.0)
            v10 = 0.0;
          if (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) <= (int)v10
            && v11 >= *(double *)(a1 + 80))
          {
            v28 = (int)v10;
            objc_msgSend(v9, "duration");
            v13 = 60 * ((v12 + 59) / 0x3C);
            if (v13 >= 0x708)
              v13 = 1800;
            objc_msgSend(v9, "setDuration:", (double)v13);
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v29 = v9;
            objc_msgSend(v9, "attenuationDurations");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v31;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v31 != v18)
                    objc_enumerationMutation(v15);
                  v20 = 60
                      * ((objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "unsignedIntValue") + 59)
                       / 0x3C);
                  if (v20 >= 0x708)
                    v21 = 1800;
                  else
                    v21 = v20;
                  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v22);

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
              }
              while (v17);
            }

            objc_msgSend(v29, "setAttenuationDurations:", v14);
            objc_msgSend(v29, "setTotalRiskScore:", v28);
            objc_msgSend(v29, "setTotalRiskScoreFullRange:", v11);
            objc_msgSend(v29, "setTransmissionRiskLevel:", HIBYTE(v34));
            v23 = xpc_dictionary_create(0, 0, 0);
            objc_msgSend(v29, "encodeWithXPCObject:", v23);
            a1 = v26;
            xpc_array_set_value(*(xpc_object_t *)(v26 + 40), 0xFFFFFFFFFFFFFFFFLL, v23);

            v7 = v24;
            v4 = v25;
            v6 = v27;
          }
          else
          {
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          }
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v6);
  }

}

- (void)_xpcExposureDetectionFileGetExposureWindows:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  ENExposureDetectionDaemonSession *v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t uint64;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  xpc_object_t v30;
  void *v31;
  xpc_object_t reply;
  void *v33;
  int v34;
  ENExposureDetectionDaemonSession *detectionSession;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  ENExposureDetectionDaemonSession *v45;
  xpc_object_t original;
  void *v47;
  _QWORD v48[7];
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  _QWORD v55[5];
  id v56;
  uint64_t *v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v4 = a3;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__3;
  v62 = __Block_byref_object_dispose__3;
  v63 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __63__ENXPCConnection__xpcExposureDetectionFileGetExposureWindows___block_invoke;
  v55[3] = &unk_1E87D9D88;
  v57 = &v58;
  v55[4] = self;
  v6 = v4;
  v56 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v55);
  v8 = v59;
  obj = v59[5];
  v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &obj);
  objc_storeStrong(v8 + 5, obj);
  if (v9)
  {
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "region");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[ENDaemon configurationManager](self->_daemon, "configurationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v13;
    objc_msgSend(v13, "serverConfigurationForRegion:", v47);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "variantOfConcernEnabled");

    v16 = self->_detectionSession;
    v45 = v16;
    if (!v16)
    {
      ENErrorF();
      v36 = objc_claimAutoreleasedReturnValue();
      v18 = v59[5];
      v59[5] = (id)v36;
      goto LABEL_31;
    }
    -[ENExposureDetectionDaemonSession exposureCalculationSession](v16, "exposureCalculationSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17
      || (v19 = objc_msgSend(v17, "cachedExposureWindowCount"),
          uint64 = xpc_dictionary_get_uint64(v6, "expWndIdx"),
          v21 = uint64,
          v19 < uint64))
    {
      ENErrorF();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v59[5];
      v59[5] = (id)v37;

      goto LABEL_31;
    }
    original = v6;
    if (v19 - uint64 >= 0x400)
      v22 = 1024;
    else
      v22 = v19 - uint64;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v23 = xpc_array_create(0, 0);
    v24 = v23;
    if (v22)
    {
      v48[0] = v5;
      v48[1] = 3221225472;
      v48[2] = __63__ENXPCConnection__xpcExposureDetectionFileGetExposureWindows___block_invoke_2;
      v48[3] = &unk_1E87DABB0;
      v48[5] = v23;
      v48[6] = &v50;
      v49 = v15;
      v48[4] = self;
      objc_msgSend(v18, "enumerateCachedExposureWindows:inRange:withBatchSize:", v48, v21, v22, 1024);
    }
    v25 = v51[3] + v21;
    if (v25 >= v19)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isSensitiveLoggingAllowed");

      if (v29
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        v42 = v25;
        v43 = v19;
        v40 = v22;
        v41 = v51[3];
        v39 = v21;
        LogPrintF_safe();
      }
      -[ENDaemon setUsageExposureDetectFileGetExposureWindows:](self->_daemon, "setUsageExposureDetectFileGetExposureWindows:", -[ENDaemon usageExposureDetectFileGetExposureWindows](self->_daemon, "usageExposureDetectFileGetExposureWindows", v39, v40, v41, v42, v43)+ 1);
      reply = xpc_dictionary_create_reply(original);
      v31 = reply;
      if (reply)
      {
        xpc_dictionary_set_value(reply, "expWndA", v24);
        xpc_dictionary_set_uint64(v31, "expWndIdx", 0);
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v31);
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isSensitiveLoggingAllowed");

        if (v34
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        -[ENExposureDetectionDaemonSession invalidate](v45, "invalidate");
        detectionSession = self->_detectionSession;
        self->_detectionSession = 0;

        goto LABEL_30;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
      {
LABEL_30:

        _Block_object_dispose(&v50, 8);
        v6 = original;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isSensitiveLoggingAllowed");

      if (v27
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v30 = xpc_dictionary_create_reply(original);
      v31 = v30;
      if (v30)
      {
        xpc_dictionary_set_value(v30, "expWndA", v24);
        xpc_dictionary_set_uint64(v31, "expWndIdx", v25);
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v31);
        goto LABEL_30;
      }
      if (gLogCategory__ENDaemon > 90 || gLogCategory__ENDaemon == -1 && !_LogCategory_Initialize())
        goto LABEL_30;
    }
    LogPrintF_safe();
    goto LABEL_30;
  }
LABEL_32:
  v7[2](v7);

  _Block_object_dispose(&v58, 8);
}

uint64_t __63__ENXPCConnection__xpcExposureDetectionFileGetExposureWindows___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __63__ENXPCConnection__xpcExposureDetectionFileGetExposureWindows___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  xpc_object_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v3, "count");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "prefSkipExposureWindowShuffling") & 1) == 0)
  {
    objc_msgSend(v3, "enRandomlyShuffled");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "infectiousness", (_QWORD)v12))
        {
          if (!*(_BYTE *)(a1 + 56))
            objc_msgSend(v10, "setVariantOfConcernType:", 0);
          v11 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v10, "encodeWithXPCObject:", v11);
          xpc_array_set_value(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_xpcExposureDetectionHistoryGetFiles:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  char v10;
  id v11;
  id v12;
  id v13;
  id obj;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = (id *)&v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__ENXPCConnection__xpcExposureDetectionHistoryGetFiles___block_invoke;
  v15[3] = &unk_1E87D9D88;
  v17 = &v18;
  v15[4] = self;
  v5 = v4;
  v16 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v15);
  v7 = v19;
  obj = v19[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    v9 = v19;
    v12 = v19[5];
    v13 = 0;
    v10 = CUXPCDecodeNSUUID();
    objc_storeStrong(v9 + 5, v12);
    if ((v10 & 1) != 0)
      v11 = (id)ENErrorF();

  }
  v6[2](v6);

  _Block_object_dispose(&v18, 8);
}

uint64_t __56__ENXPCConnection__xpcExposureDetectionHistoryGetFiles___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __56__ENXPCConnection__xpcExposureDetectionHistoryGetFiles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t value;

  v3 = a2;
  value = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v3, "encodeWithXPCObject:", value);

  xpc_array_set_value(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, value);
}

- (void)_xpcExposureDetectionHistoryGetSessions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  BOOL v9;
  ENDaemon *daemon;
  id *v11;
  void *v12;
  xpc_object_t v13;
  void *v14;
  id *v15;
  char v16;
  xpc_object_t reply;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id obj;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v31 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__ENXPCConnection__xpcExposureDetectionHistoryGetSessions___block_invoke;
  v23[3] = &unk_1E87D9D88;
  v25 = &v26;
  v23[4] = self;
  v6 = v4;
  v24 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v23);
  v8 = (id *)(v27 + 5);
  obj = (id)v27[5];
  v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v8, obj);
  if (v9)
  {
    daemon = self->_daemon;
    v11 = (id *)(v27 + 5);
    v21 = (id)v27[5];
    -[ENDaemon getExposureDatabaseAndReturnError:](daemon, "getExposureDatabaseAndReturnError:", &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11, v21);
    if (v12)
    {
      -[ENDaemon _migrateLegacyHistoryIfNecessary](self->_daemon, "_migrateLegacyHistoryIfNecessary");
      v13 = xpc_array_create(0, 0);
      v15 = (id *)(v27 + 5);
      v14 = (void *)v27[5];
      v19[4] = v13;
      v20 = v14;
      v19[0] = v5;
      v19[1] = 3221225472;
      v19[2] = __59__ENXPCConnection__xpcExposureDetectionHistoryGetSessions___block_invoke_2;
      v19[3] = &unk_1E87DABD8;
      v16 = objc_msgSend(v12, "enumerateExposureDetectionHistorySessionsWithError:handler:", &v20, v19);
      objc_storeStrong(v15, v20);
      if ((v16 & 1) != 0)
      {
        reply = xpc_dictionary_create_reply(v6);
        v18 = reply;
        if (reply)
        {
          xpc_dictionary_set_value(reply, "detHS", v13);
          -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v18);
        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

      }
    }

  }
  v7[2](v7);

  _Block_object_dispose(&v26, 8);
}

uint64_t __59__ENXPCConnection__xpcExposureDetectionHistoryGetSessions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __59__ENXPCConnection__xpcExposureDetectionHistoryGetSessions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t value;

  v3 = a2;
  value = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v3, "encodeWithXPCObject:", value);

  xpc_array_set_value(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, value);
}

- (void)_xpcDownload:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  xpc_object_t reply;
  void *v14;
  uint64_t v15;
  _QWORD v16[6];
  BOOL v17;
  id obj;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __32__ENXPCConnection__xpcDownload___block_invoke;
  v19[3] = &unk_1E87D9D88;
  v21 = &v22;
  v19[4] = self;
  v6 = v4;
  v20 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v19);
  v8 = (id *)(v23 + 5);
  obj = (id)v23[5];
  v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v8, obj);
  if (v9)
  {
    v10 = xpc_dictionary_get_BOOL(v6, "detX");
    -[ENDaemon downloadManager](self->_daemon, "downloadManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "enabledEndpointCount"))
    {
      reply = xpc_dictionary_create_reply(v6);
      v14 = reply;
      if (reply)
      {
        v16[0] = v5;
        v16[1] = 3221225472;
        v16[2] = __32__ENXPCConnection__xpcDownload___block_invoke_2;
        v16[3] = &unk_1E87DAC28;
        v17 = v10;
        v16[4] = self;
        v16[5] = reply;
        objc_msgSend(v12, "performDownloadsForced:completion:", 1, v16);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else
    {
      ENErrorF();
      v15 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v23[5];
      v23[5] = v15;
    }

  }
  v7[2](v7);

  _Block_object_dispose(&v22, 8);
}

uint64_t __32__ENXPCConnection__xpcDownload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __32__ENXPCConnection__xpcDownload___block_invoke_2(uint64_t a1)
{
  int v2;
  id *v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3[4], "exposureDetectionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __32__ENXPCConnection__xpcDownload___block_invoke_3;
    v5[3] = &unk_1E87DAC00;
    v6 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v4, "performNativeExposureDetectionWithResultHandler:", v5);

  }
  else
  {
    objc_msgSend(v3, "_xpcSendMessage:", *(_QWORD *)(a1 + 40));
  }
}

void __32__ENXPCConnection__xpcDownload___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_xpcSendMessage:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      ENErrorF();
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:reply:", v7, *(_QWORD *)(a1 + 40), v8);

  }
}

- (void)_xpcGetInfo:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  void *v9;
  const char *string;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  xpc_object_t reply;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  id obj;
  _QWORD v44[5];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v4 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__3;
  v51 = __Block_byref_object_dispose__3;
  v52 = 0;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __31__ENXPCConnection__xpcGetInfo___block_invoke;
  v44[3] = &unk_1E87D9D88;
  v46 = &v47;
  v44[4] = self;
  v5 = v4;
  v45 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v44);
  v7 = (id *)(v48 + 5);
  obj = (id)v48[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    -[ENDaemon delegate](self->_daemon, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    string = xpc_dictionary_get_string(v5, "iStr");
    if (!string)
    {
      ENErrorF();
      v38 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v48[5];
      v48[5] = v38;
      goto LABEL_36;
    }
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v42 = string;
      LogPrintF_safe();
    }
    -[ENDaemon activeEntity](self->_daemon, "activeEntity", v42);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!strcmp(string, "activeApp"))
    {
      switch(objc_msgSend(v11, "activeStatus"))
      {
        case 2u:
          objc_msgSend(v11, "entity");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "bundleIdentifier");
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (!v16)
            goto LABEL_35;
          goto LABEL_30;
        default:
          goto LABEL_35;
      }
    }
    if (!strcmp(string, "activeRegion"))
    {
      -[ENDaemon activeEntity](self->_daemon, "activeEntity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "entity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "region");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_35;
      objc_msgSend(v14, "regionCode");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!strcmp(string, "automaticRegionSwitch"))
      {
        v17 = -[ENDaemon automaticRegionSwitchEnabled](self->_daemon, "automaticRegionSwitchEnabled");
        goto LABEL_23;
      }
      if (!strcmp(string, "availabilityAlertEnabled"))
      {
        v17 = -[ENDaemon availabilityAlertDisabled](self->_daemon, "availabilityAlertDisabled");
LABEL_25:
        v18 = (void *)MEMORY[0x1E0C9AAA8];
        v19 = (void *)MEMORY[0x1E0C9AA98];
        goto LABEL_26;
      }
      if (!strcmp(string, "dataPresent"))
      {
        v27 = objc_msgSend(v9, "storedAdvertisementCount");
        v28 = (void *)MEMORY[0x1E0C9AAA8];
        if (!v27)
        {
          objc_msgSend(v9, "retrieveTEKHistoryIncludingActive:generateNewTEK:", 1, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "count");

          if (!v30)
            v28 = (void *)MEMORY[0x1E0C9AA98];
        }
        v20 = v28;
        goto LABEL_29;
      }
      if (strcmp(string, "differentialPrivacyMetadata"))
      {
        if (strcmp(string, "profileInstalled"))
        {
          if (strcmp(string, "supported"))
          {
            if (strcmp(string, "weeklySummaryAlertEnabled"))
            {
LABEL_35:
              ENErrorF();
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = (void *)v48[5];
              v48[5] = v25;

LABEL_36:
              goto LABEL_37;
            }
            v17 = -[ENDaemon monthlySummaryDisabled](self->_daemon, "monthlySummaryDisabled");
            goto LABEL_25;
          }
          objc_msgSend(v11, "entity");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "region");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v32)
            goto LABEL_35;
          -[ENDaemon configurationManager](self->_daemon, "configurationManager");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "configurationStore");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "serverConfigurationForRegion:", v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v35)
          {
            ENErrorF();
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = (void *)v48[5];
            v48[5] = v40;

            goto LABEL_36;
          }
          v36 = objc_msgSend(v35, "enEnabled");
          v37 = (void *)MEMORY[0x1E0C9AA98];
          if (v36)
            v37 = (void *)MEMORY[0x1E0C9AAA8];
          v16 = v37;

LABEL_30:
          v21 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          if (v21)
          {
            reply = xpc_dictionary_create_reply(v5);
            v23 = reply;
            if (reply)
            {
              xpc_dictionary_set_value(reply, "oObj", v21);
              -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v23);
            }
            else if (gLogCategory__ENDaemon <= 90
                   && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
          }
          else
          {
            ENErrorF();
            v39 = objc_claimAutoreleasedReturnValue();
            v23 = (void *)v48[5];
            v48[5] = v39;
          }

          goto LABEL_36;
        }
        v17 = objc_msgSend(v9, "isENLoggingProfileInstalled");
LABEL_23:
        v18 = (void *)MEMORY[0x1E0C9AA98];
        v19 = (void *)MEMORY[0x1E0C9AAA8];
LABEL_26:
        if (v17)
          v18 = v19;
        v20 = v18;
LABEL_29:
        v16 = v20;
        goto LABEL_30;
      }
      if (!-[ENXPCClient entitledForDifferentialPrivacy](self->_client, "entitledForDifferentialPrivacy"))
        goto LABEL_35;
      -[ENDaemon differentialPrivacyManager](self->_daemon, "differentialPrivacyManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "metadata");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (id)v15;

    if (!v16)
      goto LABEL_35;
    goto LABEL_30;
  }
LABEL_37:
  v6[2](v6);

  _Block_object_dispose(&v47, 8);
}

uint64_t __31__ENXPCConnection__xpcGetInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetDataVaultSize:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  xpc_object_t reply;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD);
  xpc_object_t original;
  id v26;
  ENXPCConnection *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id obj;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3;
  v44 = __Block_byref_object_dispose__3;
  v45 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __40__ENXPCConnection__xpcGetDataVaultSize___block_invoke;
  v37[3] = &unk_1E87D9D88;
  v39 = &v40;
  v27 = self;
  v37[4] = self;
  original = v4;
  v38 = original;
  v24 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v37);
  v5 = v41;
  obj = v41[5];
  LOBYTE(self) = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v5 + 5, obj);
  if ((self & 1) != 0)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0CB3618]);
    ENDataVaultURL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0C999A0];
    v47[0] = *MEMORY[0x1E0C999A0];
    objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v47, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = v8;
    v9 = 0;
    v10 = 0;
    v11 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v28);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v30 = 0;
          v31 = 0;
          v15 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v31, v29, &v30, v22, v23);
          v16 = v31;
          v17 = v30;
          if (v15)
          {
            v9 += objc_msgSend(v16, "unsignedLongLongValue");
            ++v10;
          }
          else
          {
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isSensitiveLoggingAllowed");

            if (v19
              && gLogCategory_ENDaemon <= 90
              && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
            {
              CUPrintNSError();
              v22 = v14;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF_safe();

            }
          }

        }
        v11 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v11);
    }

    if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    reply = xpc_dictionary_create_reply(original);
    v21 = reply;
    if (reply)
    {
      xpc_dictionary_set_uint64(reply, "bytes", v9);
      -[ENXPCConnection _xpcSendMessage:](v27, "_xpcSendMessage:", v21);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  v24[2](v24);

  _Block_object_dispose(&v40, 8);
}

uint64_t __40__ENXPCConnection__xpcGetDataVaultSize___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetEntities:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  id obj;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v4 = a3;
  v31 = 0;
  v32 = (id *)&v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __35__ENXPCConnection__xpcGetEntities___block_invoke;
  v28[3] = &unk_1E87D9D88;
  v30 = &v31;
  v28[4] = self;
  v6 = v4;
  v29 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v28);
  v8 = v32;
  obj = v32[5];
  v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v8 + 5, obj);
  if (v9)
  {
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "isSensitiveLoggingAllowed");

    if ((_DWORD)v11
      && gLogCategory_ENDaemon <= 30
      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    -[ENDaemon configurationManager](self->_daemon, "configurationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __35__ENXPCConnection__xpcGetEntities___block_invoke_2;
    v21[3] = &unk_1E87DAC78;
    v21[4] = self;
    v18 = v12;
    v22 = v18;
    v19 = v14;
    v23 = v19;
    v20 = v15;
    v24 = v20;
    v25 = v6;
    v26 = &v31;
    objc_msgSend(v17, "allRegionConfigurationsWithCompletion:", v21);

  }
  v7[2](v7);

  _Block_object_dispose(&v31, 8);
}

uint64_t __35__ENXPCConnection__xpcGetEntities___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __35__ENXPCConnection__xpcGetEntities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __35__ENXPCConnection__xpcGetEntities___block_invoke_3;
  block[3] = &unk_1E87DAC50;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 48);
  block[1] = 3221225472;
  block[4] = v4;
  v11 = v3;
  v12 = v5;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v15 = v7;
  v16 = v8;
  v9 = v3;
  dispatch_async(v6, block);

}

void __35__ENXPCConnection__xpcGetEntities___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  int v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  void *v79;
  int v80;
  void *v81;
  int v82;
  xpc_object_t reply;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  const void *v93;
  size_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  id obj;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  id v136;
  void *v137;
  void *v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v2 = (void *)TCCAccessCopyInformation();
  v3 = (_QWORD *)MEMORY[0x1E0DB10B0];
  objc_msgSend(MEMORY[0x1E0CB3878], "predicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0DB10B0], *MEMORY[0x1E0C9AE58]);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3878], "predicateWithFormat:", CFSTR("%K == %@"), *v3, *MEMORY[0x1E0C9AE48]);
  v114 = v2;
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "regionMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = 0;
  objc_msgSend(v5, "getAllRegionsWithError:", &v136);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v136;

  v111 = v6;
  if ((v6 || !v115)
    && gLogCategory__ENDaemon <= 90
    && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

  if (v8 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v107 = v115;
    LogPrintF_safe();
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v107);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

  if (v10 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v108 = *(void **)(a1 + 40);
    LogPrintF_safe();
  }
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v132, v141, 16);
  v13 = (_QWORD *)MEMORY[0x1E0DB10A0];
  v120 = v11;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v133;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v133 != v15)
          objc_enumerationMutation(v11);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1) + 8 * i), "objectForKey:", *v13, v108);
        if (v17)
        {
          v18 = v17;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_getBundleIDFromBundle:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_getInfoDictFromBundle:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "regionForBundleInfo:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA2F8]), "initWithBundleID:region:", v19, v21);
              objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v19, "isEqual:", v23);

              if ((v24 & 1) == 0)
              {
                objc_msgSend(*(id *)(a1 + 48), "region");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v21, "isEqual:", v25);

                if ((v26 & 1) == 0)
                  objc_msgSend(*(id *)(a1 + 56), "addObject:", v22);
              }

              v11 = v120;
              v13 = (_QWORD *)MEMORY[0x1E0DB10A0];
            }

          }
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v132, v141, 16);
    }
    while (v14);
  }

  v131 = 0u;
  v129 = 0u;
  v130 = 0u;
  v128 = 0u;
  v27 = v118;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v128, v140, 16);
  v119 = v27;
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v129;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v129 != v30)
          objc_enumerationMutation(v27);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * j), "objectForKey:", *v13, v108);
        if (v32)
        {
          v33 = v32;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_getBundleIDFromBundle:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_getInfoDictFromBundle:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "regionForBundleInfo:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA2F8]), "initWithBundleID:region:", v34, v36);
              objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v34, "isEqual:", v38);

              if ((v39 & 1) == 0)
              {
                objc_msgSend(*(id *)(a1 + 48), "region");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v36, "isEqual:", v40);

                if ((v41 & 1) == 0)
                  objc_msgSend(*(id *)(a1 + 64), "addObject:", v37);
              }

              v27 = v119;
              v13 = (_QWORD *)MEMORY[0x1E0DB10A0];
            }

          }
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v128, v140, 16);
    }
    while (v29);
  }

  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v42 = *(id *)(a1 + 40);
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v124, v139, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v125;
    v116 = v42;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v125 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * k);
        objc_msgSend(v47, "region", v108);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "configurationManager");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "configurationStore");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "serverConfigurationForRegion:", v48);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          if (objc_msgSend(v51, "enEnabled"))
          {
            if ((unint64_t)objc_msgSend(v51, "enVersion") >= 2)
            {
              objc_msgSend(*(id *)(a1 + 48), "region");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v48, "isEqual:", v52);

              if ((v53 & 1) == 0)
              {
                v54 = objc_alloc(MEMORY[0x1E0CAA2F8]);
                objc_msgSend(v51, "appBundleID");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = (void *)objc_msgSend(v54, "initWithBundleID:region:", v55, v48);

                objc_msgSend(v56, "bundleIdentifier");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v57, "length"))
                {

                  goto LABEL_61;
                }
                objc_msgSend(v56, "region");
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v58)
                  goto LABEL_104;
LABEL_61:
                objc_msgSend(v47, "userConsent");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v59, "consent");

                if (v60 == 2)
                {
                  v61 = (void *)MEMORY[0x1E0CB3878];
                  objc_msgSend(v56, "region");
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "predicateWithFormat:", CFSTR("region == %@"));
                  v62 = (id)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(*(id *)(a1 + 64), "filteredSetUsingPredicate:", v62);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v61) = objc_msgSend(v63, "isSensitiveLoggingAllowed");

                  if ((_DWORD)v61
                    && gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    v109 = *(void **)(a1 + 64);
                    LogPrintF_safe();
                  }
                  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v109);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  v74 = objc_msgSend(v73, "isSensitiveLoggingAllowed");

                  if (v74
                    && gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    v110 = v117;
                    LogPrintF_safe();
                  }
                  if ((objc_msgSend(*(id *)(a1 + 64), "containsObject:", v56, v110) & 1) != 0
                    || (objc_msgSend(v117, "containsObject:", v56) & 1) != 0)
                  {
                    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v76 = objc_msgSend(v75, "isSensitiveLoggingAllowed");

                    if (v76
                      && gLogCategory_ENDaemon <= 30
                      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                    {
                      v108 = v56;
                      LogPrintF_safe();
                    }
                  }
                  else
                  {
                    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    v78 = objc_msgSend(v77, "isSensitiveLoggingAllowed");

                    if (v78
                      && gLogCategory_ENDaemon <= 30
                      && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                    {
                      LogPrintF_safe();
                      objc_msgSend(*(id *)(a1 + 56), "addObject:", v56, v56);
                    }
                    else
                    {
                      objc_msgSend(*(id *)(a1 + 56), "addObject:", v56, v108);
                    }
                  }

                  goto LABEL_103;
                }
                if ((objc_msgSend(v115, "containsObject:", v48) & 1) == 0)
                {
                  objc_msgSend(v48, "countryCode");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "prefRegionIdentifierOverride");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = v64;
                  v66 = v65;
                  if (v62 == v66)
                  {

                  }
                  else
                  {
                    v67 = v66;
                    if ((v62 == 0) == (v66 != 0))
                    {

                      goto LABEL_103;
                    }
                    v68 = objc_msgSend(v62, "isEqual:", v66);

                    if ((v68 & 1) == 0)
                      goto LABEL_104;
                  }
                }
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "configurationManager");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "configurationStore");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "agencyConfigurationForRegion:", v48);
                v62 = (id)objc_claimAutoreleasedReturnValue();

                if (v62)
                {
                  if ((objc_msgSend(*(id *)(a1 + 56), "containsObject:", v56) & 1) == 0)
                    objc_msgSend(*(id *)(a1 + 64), "addObject:", v56);
                }
                else
                {
                  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v72 = objc_msgSend(v71, "isSensitiveLoggingAllowed");

                  if (v72
                    && gLogCategory_ENDaemon <= 30
                    && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                  {
                    v108 = 0;
                    LogPrintF_safe();
                  }
                }
LABEL_103:

LABEL_104:
                v42 = v116;
              }
            }
          }
        }

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v124, v139, 16);
    }
    while (v44);
  }

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "isSensitiveLoggingAllowed");

  if (v80 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
  {
    v108 = *(void **)(a1 + 56);
    LogPrintF_safe();
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v108);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "isSensitiveLoggingAllowed");

  if (v82 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 72));
  if (reply)
  {
    v84 = *(_QWORD *)(a1 + 48);
    v85 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v85 + 40);
    objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v84, 1, &obj);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v85 + 40), obj);
    v87 = objc_retainAutorelease(v86);
    xpc_dictionary_set_data(reply, "acEn", (const void *)objc_msgSend(v87, "bytes"), objc_msgSend(v87, "length"));
    CFDataGetTypeID();
    v88 = CFPrefs_CopyTypedValue();
    v89 = (void *)v88;
    if (v88)
      v90 = (void *)v88;
    else
      v90 = v87;
    v91 = v90;

    v92 = objc_retainAutorelease(v91);
    v93 = (const void *)objc_msgSend(v92, "bytes");
    v94 = objc_msgSend(v92, "length");

    xpc_dictionary_set_data(reply, "tnEn", v93, v94);
    v95 = (void *)MEMORY[0x1E0CB3700];
    objc_msgSend(*(id *)(a1 + 56), "allObjects");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v96;
    objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v138, 1);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v122 = *(id *)(v98 + 40);
    objc_msgSend(v95, "archivedDataWithRootObject:requiringSecureCoding:error:", v97, 1, &v122);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v98 + 40), v122);

    v100 = objc_retainAutorelease(v99);
    xpc_dictionary_set_data(reply, "auEn", (const void *)objc_msgSend(v100, "bytes"), objc_msgSend(v100, "length"));
    v101 = (void *)MEMORY[0x1E0CB3700];
    objc_msgSend(*(id *)(a1 + 64), "allObjects");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v102;
    objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v137, 1);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v121 = *(id *)(v104 + 40);
    objc_msgSend(v101, "archivedDataWithRootObject:requiringSecureCoding:error:", v103, 1, &v121);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v104 + 40), v121);

    v106 = objc_retainAutorelease(v105);
    xpc_dictionary_set_data(reply, "avaEn", (const void *)objc_msgSend(v106, "bytes"), objc_msgSend(v106, "length"));
    objc_msgSend(*(id *)(a1 + 32), "_xpcSendMessage:", reply);

  }
  else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_xpcSetActiveEntity:(id)a3
{
  id v4;
  id *v5;
  BOOL v6;
  id *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  void *v28;
  ENActiveEntity *v29;
  void *v30;
  ENActiveEntity *v31;
  xpc_object_t reply;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  void (**v40)(_QWORD);
  xpc_object_t original;
  void *v42;
  ENXPCConnection *v43;
  id v44;
  id obj;
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49 = 0;
  v50 = (id *)&v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__3;
  v53 = __Block_byref_object_dispose__3;
  v54 = 0;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __39__ENXPCConnection__xpcSetActiveEntity___block_invoke;
  v46[3] = &unk_1E87D9D88;
  v48 = &v49;
  v43 = self;
  v46[4] = self;
  original = v4;
  v47 = original;
  v40 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v46);
  v5 = v50;
  obj = v50[5];
  v6 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v5 + 5, obj);
  if (v6)
  {
    objc_opt_class();
    v7 = v50 + 5;
    v44 = v50[5];
    ENXPCDecodeSecureObjectIfPresent();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v7, v44);
    if (v50[5])
    {
      ENErrorF();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v50[5];
      v50[5] = (id)v35;

    }
    else
    {
      if (v42)
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isSensitiveLoggingAllowed");

        if (v9
          && gLogCategory_ENDaemon <= 30
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          v39 = v42;
          LogPrintF_safe();
        }
        -[ENDaemon configurationManager](self->_daemon, "configurationManager", v39);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "configurationStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "configurationForRegion:", v42);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v42;
        -[ENDaemon configurationManager](self->_daemon, "configurationManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "configurationStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "serverConfigurationForRegion:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v22 = 0;
          v23 = 0;
LABEL_24:
          if (!-[ENDaemon prefEnabled](v43->_daemon, "prefEnabled"))
          {
            if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
              LogPrintF_safe();
            CFPrefs_SetValue();
          }

          v29 = [ENActiveEntity alloc];
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA2F8]), "initWithBundleID:region:", v22, v13);
          v31 = -[ENActiveEntity initWithEntity:activeStatus:](v29, "initWithEntity:activeStatus:", v30, v23);

          if (-[ENDaemon _writePreferenceActiveEntity:](v43->_daemon, "_writePreferenceActiveEntity:", v31))
          {
            -[ENDaemon _disableAvailabilityAlertIfNeeded](v43->_daemon, "_disableAvailabilityAlertIfNeeded");
            -[ENDaemon prefsChanged](v43->_daemon, "prefsChanged");
            -[ENDaemon xpcReportStatus](v43->_daemon, "xpcReportStatus");
          }
          else if (gLogCategory__ENDaemon <= 90
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          reply = xpc_dictionary_create_reply(original);
          if (reply)
          {
            -[ENXPCConnection _xpcSendMessage:](v43, "_xpcSendMessage:", reply);
          }
          else if (gLogCategory__ENDaemon <= 90
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }

          goto LABEL_42;
        }
        v17 = (void *)MEMORY[0x1E0CA5858];
        objc_msgSend(v16, "appBundleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "applicationProxyForIdentifier:placeholder:", v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "appBundleID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
        {
          objc_msgSend(v16, "appBundleID");
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = &stru_1E87DD6B8;
        }

        objc_msgSend(v19, "appState");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "isInstalled"))
        {
          v25 = -[__CFString length](v21, "length") == 0;

          if (!v25)
          {
            if (-[ENDaemon tccAccessForBundleID:](v43->_daemon, "tccAccessForBundleID:", v21) != 2)
            {
              objc_msgSend(v16, "appBundleID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = 2;
LABEL_23:

              goto LABEL_24;
            }
LABEL_45:
            ENErrorF();
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = v50[5];
            v50[5] = (id)v33;

            v22 = 0;
LABEL_42:

            goto LABEL_43;
          }
        }
        else
        {

        }
        if (objc_msgSend(v12, "enVersion") == 2)
        {
          objc_msgSend(v12, "userConsent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "consent");

          if ((unint64_t)(v27 - 1) < 2)
          {
            TCCAccessSetForBundleId();
            v22 = 0;
            v23 = 3;
            goto LABEL_23;
          }
        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v19, "appState");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "isInstalled");
          objc_msgSend(v12, "enVersion");
          LogPrintF_safe();

        }
        goto LABEL_45;
      }
      CUXPCDecodeNSString();
      ENErrorF();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v50[5];
      v50[5] = (id)v37;

    }
    v22 = 0;
    v13 = 0;
    goto LABEL_42;
  }
LABEL_43:
  v40[2](v40);

  _Block_object_dispose(&v49, 8);
}

uint64_t __39__ENXPCConnection__xpcSetActiveEntity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetLastExposureNotification:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  ENDaemon *daemon;
  id *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  char v14;
  id v15;
  xpc_object_t reply;
  id *v17;
  int v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id obj;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __51__ENXPCConnection__xpcGetLastExposureNotification___block_invoke;
  v24[3] = &unk_1E87D9D88;
  v26 = &v27;
  v24[4] = self;
  v5 = v4;
  v25 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v24);
  v7 = (id *)(v28 + 5);
  obj = (id)v28[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    daemon = self->_daemon;
    v10 = (id *)(v28 + 5);
    v22 = (id)v28[5];
    -[ENDaemon getExposureDatabaseAndReturnError:](daemon, "getExposureDatabaseAndReturnError:", &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, v22);
    if (v11)
    {
      v21 = 0;
      v12 = objc_opt_class();
      v13 = (id *)(v28 + 5);
      v20 = (id)v28[5];
      v14 = objc_msgSend(v11, "getValue:forKey:ofClass:error:", &v21, CFSTR("LastExposureNotification"), v12, &v20);
      v15 = v21;
      objc_storeStrong(v13, v20);
      if ((v14 & 1) != 0)
      {
        reply = xpc_dictionary_create_reply(v5);
        if (reply)
        {
          if (!v15
            || (v17 = (id *)(v28 + 5), v19 = (id)v28[5],
                                       v18 = ENXPCEncodeSecureObject(),
                                       objc_storeStrong(v17, v19),
                                       v18))
          {
            -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply, v19);
          }
        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

      }
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v27, 8);
}

uint64_t __51__ENXPCConnection__xpcGetLastExposureNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetStatusForBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *string;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  _BOOL4 v23;
  uint64_t v24;
  double v25;
  unsigned int v26;
  xpc_object_t reply;
  void *v28;
  id obj;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  v38 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __52__ENXPCConnection__xpcGetStatusForBundleIdentifier___block_invoke;
  v30[3] = &unk_1E87D9D88;
  v32 = &v33;
  v30[4] = self;
  v5 = v4;
  v31 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v30);
  v7 = (id *)(v34 + 5);
  obj = (id)v34[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (!v8)
    goto LABEL_21;
  -[ENDaemon activeEntity](self->_daemon, "activeEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "region");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ENDaemon configurationManager](self->_daemon, "configurationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serverConfigurationForRegion:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    string = xpc_dictionary_get_string(v5, "aBid");
    if (!string)
    {
      LOBYTE(v23) = 0;
      v24 = 0;
LABEL_14:
      if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      reply = xpc_dictionary_create_reply(v5);
      v28 = reply;
      if (reply)
      {
        xpc_dictionary_set_BOOL(reply, "enbd", v23);
        xpc_dictionary_set_uint64(v28, "aBARi", v24);
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", v28);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

      goto LABEL_21;
    }
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "entity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (const char *)objc_msgSend(v21, "utf8ValueSafe");

    if (v22)
    {
      v23 = strcmp(v22, string) == 0;
      if (!v17)
        goto LABEL_10;
    }
    else
    {
      v23 = 0;
      if (!v17)
      {
LABEL_10:
        v26 = 14400;
LABEL_11:
        if (v23)
          v24 = v26;
        else
          v24 = 0;
        goto LABEL_14;
      }
    }
    objc_msgSend(v17, "applicationBackgroundRuntimeInterval");
    v26 = v25;
    if (v25)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_21:
  v6[2](v6);

  _Block_object_dispose(&v33, 8);
}

uint64_t __52__ENXPCConnection__xpcGetStatusForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcLegalConsentPageCount:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  void *v8;
  xpc_object_t reply;
  void *v10;
  id obj;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__ENXPCConnection__xpcLegalConsentPageCount___block_invoke;
  v12[3] = &unk_1E87D9D88;
  v14 = &v15;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v12);
  objc_opt_class();
  v7 = (id *)(v16 + 5);
  obj = (id)v16[5];
  ENXPCDecodeSecureObject();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);
  if (v8)
  {
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v10 = v8;
      LogPrintF_safe();
    }
    -[ENDaemon _getLegalConsentPageCount](self->_daemon, "_getLegalConsentPageCount", v10);
    CFPrefs_SetInt64();
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v15, 8);
}

uint64_t __45__ENXPCConnection__xpcLegalConsentPageCount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcOnboardingDidStart:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  const char *string;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id *v20;
  char v21;
  void *v22;
  const char *v23;
  const char *v24;
  xpc_object_t reply;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  void (**v34)(_QWORD);
  void *v35;
  id v36;
  id v37;
  id obj;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v4 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  v47 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __42__ENXPCConnection__xpcOnboardingDidStart___block_invoke;
  v39[3] = &unk_1E87D9D88;
  v41 = &v42;
  v39[4] = self;
  v5 = v4;
  v40 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v39);
  v7 = (id *)(v43 + 5);
  obj = (id)v43[5];
  v34 = v6;
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    string = xpc_dictionary_get_string(v5, "iStr");
    if (!string)
    {
      ENErrorF();
      v26 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v43[5];
      v43[5] = v26;
      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x1E0CB3938], "stringWithUTF8String:", string);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0)
    {
      v11 = 1;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.PublicHealthRemoteUI")))
    {
      if (gLogCategory_ENDaemon <= 50 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      CFPrefs_SetValue();
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ENDaemon")) & 1) != 0)
    {
      v11 = 3;
    }
    else
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.HealthENLauncher")) & 1) == 0)
      {
        ENErrorF();
        v27 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v43[5];
        v43[5] = v27;
        goto LABEL_32;
      }
      v11 = 4;
    }
    objc_opt_class();
    v12 = (id *)(v43 + 5);
    v37 = (id)v43[5];
    ENXPCDecodeSecureObject();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12, v37);
    if (!v13)
    {
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    v35 = v5;
    v33 = v10;
    -[ENDaemon configurationManager](self->_daemon, "configurationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "configurationStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configurationForRegion:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = objc_msgSend(v17, "everStartedOnboarding");
        objc_msgSend(v17, "setEverStartedOnboarding:", 1);
        objc_msgSend(v15, "configurationStore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id *)(v43 + 5);
        v36 = (id)v43[5];
        v21 = objc_msgSend(v19, "saveRegionConfiguration:error:", v17, &v36);
        objc_storeStrong(v20, v36);

        if ((v21 & 1) == 0)
        {
          v6 = v34;
          goto LABEL_31;
        }
        objc_msgSend(v13, "regionCode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = "yes";
        if (v18)
          v23 = "no";
        if (v22)
          v24 = v23;
        else
          v24 = "N/A";

        if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v13, "regionCode");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v24;
          v30 = string;
          LogPrintF_safe();

        }
        -[ENDaemon setOnboardingTrigger:](self->_daemon, "setOnboardingTrigger:", v11, v30, v31, v32);
        -[ENDaemon setOnboardingFirstTime:](self->_daemon, "setOnboardingFirstTime:", v18 ^ 1u);
        -[ENDaemon setOnboardingRegionTrigger:](self->_daemon, "setOnboardingRegionTrigger:", v13);
        -[ENDaemon setOnboardingLegalConsentLastViewCount:](self->_daemon, "setOnboardingLegalConsentLastViewCount:", -[ENDaemon _getLegalConsentPageCount](self->_daemon, "_getLegalConsentPageCount"));
        v6 = v34;
        reply = xpc_dictionary_create_reply(v35);
        if (reply)
        {
          -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
        }
        else if (gLogCategory__ENDaemon <= 90
               && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
      else
      {
        ENErrorF();
        v29 = objc_claimAutoreleasedReturnValue();
        reply = (xpc_object_t)v43[5];
        v43[5] = v29;
      }

    }
    else
    {
      ENErrorF();
      v28 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v43[5];
      v43[5] = v28;
    }
LABEL_31:

    v10 = v33;
    v5 = v35;
    goto LABEL_32;
  }
LABEL_34:
  v6[2](v6);

  _Block_object_dispose(&v42, 8);
}

uint64_t __42__ENXPCConnection__xpcOnboardingDidStart___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetActiveApp:(id)a3
{
  id v4;
  id *v5;
  BOOL v6;
  const char *string;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t i;
  __CFBundle *v14;
  void *v15;
  void *v16;
  CFDictionaryRef InfoDictionary;
  id v18;
  ENActiveEntity *v19;
  void *v20;
  ENActiveEntity *v21;
  xpc_object_t reply;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void (**v26)(_QWORD);
  xpc_object_t xdict;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id obj;
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0;
  v37 = (id *)&v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3;
  v40 = __Block_byref_object_dispose__3;
  v41 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __36__ENXPCConnection__xpcSetActiveApp___block_invoke;
  v33[3] = &unk_1E87D9D88;
  v35 = &v36;
  v33[4] = self;
  xdict = v4;
  v34 = xdict;
  v26 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v33);
  v5 = v37;
  obj = v37[5];
  v6 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v5 + 5, obj);
  if (v6)
  {
    string = xpc_dictionary_get_string(xdict, "aBid");
    if (string)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v8 = (id)TCCAccessCopyInformation();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      if (v9)
      {
        v10 = 0;
        v11 = *(_QWORD *)v29;
        v12 = (_QWORD *)MEMORY[0x1E0DB10A0];
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(v8);
            v14 = (__CFBundle *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "objectForKey:", *v12, v25);
            if (v14)
            {
              -[ENDaemon _getBundleIDFromBundle:](self->_daemon, "_getBundleIDFromBundle:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (v15 && !strcmp(string, (const char *)objc_msgSend(v15, "utf8ValueSafe")))
              {
                if (gLogCategory_ENDaemon <= 30
                  && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
                {
                  v25 = v16;
                  LogPrintF_safe();
                }
                InfoDictionary = CFBundleGetInfoDictionary(v14);
                if (InfoDictionary)
                {
                  -[ENDaemon regionForBundleInfo:](self->_daemon, "regionForBundleInfo:", InfoDictionary);
                  v18 = (id)objc_claimAutoreleasedReturnValue();
                  if (v18)
                    -[ENDaemon fetchServerConfigurationForAppBundleIdentifier:infoDictionary:](self->_daemon, "fetchServerConfigurationForAppBundleIdentifier:infoDictionary:", v16, InfoDictionary);

                  goto LABEL_25;
                }
                v10 = 1;
              }

            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
          if (v9)
            continue;
          break;
        }

        if ((v10 & 1) != 0)
        {
          v16 = 0;
          v18 = 0;
LABEL_25:
          v19 = [ENActiveEntity alloc];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA2F8]), "initWithBundleID:region:", v16, v18);
          v21 = -[ENActiveEntity initWithEntity:activeStatus:](v19, "initWithEntity:activeStatus:", v20, 2);

          -[ENDaemon _writePreferenceActiveEntity:](self->_daemon, "_writePreferenceActiveEntity:", v21);
          -[ENDaemon xpcReportStatus](self->_daemon, "xpcReportStatus");
          reply = xpc_dictionary_create_reply(xdict);
          if (reply)
          {
            -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
          }
          else if (gLogCategory__ENDaemon <= 90
                 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }

          goto LABEL_28;
        }
      }
      else
      {

      }
      ENErrorF();
      v23 = objc_claimAutoreleasedReturnValue();
      v18 = v37[5];
      v37[5] = (id)v23;
LABEL_28:

    }
    else
    {
      ENErrorF();
      v24 = objc_claimAutoreleasedReturnValue();
      v8 = v37[5];
      v37[5] = (id)v24;
    }

  }
  v26[2](v26);

  _Block_object_dispose(&v36, 8);
}

uint64_t __36__ENXPCConnection__xpcSetActiveApp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetAutomaticRegionSwitch:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  xpc_object_t reply;
  id obj;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__ENXPCConnection__xpcSetAutomaticRegionSwitch___block_invoke;
  v11[3] = &unk_1E87D9D88;
  v13 = &v14;
  v11[4] = self;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v11);
  v7 = (id *)(v15 + 5);
  obj = (id)v15[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    xpc_dictionary_get_BOOL(v5, "enbd");
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    CFPrefs_SetValue();
    -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
    reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v14, 8);
}

uint64_t __48__ENXPCConnection__xpcSetAutomaticRegionSwitch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetAvailabilityAlertEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  xpc_object_t reply;
  id obj;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__ENXPCConnection__xpcSetAvailabilityAlertEnabled___block_invoke;
  v11[3] = &unk_1E87D9D88;
  v13 = &v14;
  v11[4] = self;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v11);
  v7 = (id *)(v15 + 5);
  obj = (id)v15[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    xpc_dictionary_get_BOOL(v5, "enbd");
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    CFPrefs_SetValue();
    -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
    reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v14, 8);
}

uint64_t __51__ENXPCConnection__xpcSetAvailabilityAlertEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetActiveRegion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  ENActiveEntity *v26;
  void *v27;
  ENActiveEntity *v28;
  xpc_object_t reply;
  void *v30;
  id v31;
  id obj;
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v4 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3;
  v40 = __Block_byref_object_dispose__3;
  v41 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __39__ENXPCConnection__xpcSetActiveRegion___block_invoke;
  v33[3] = &unk_1E87D9D88;
  v35 = &v36;
  v33[4] = self;
  v5 = v4;
  v34 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v33);
  v7 = (id *)(v37 + 5);
  obj = (id)v37[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    objc_opt_class();
    v9 = (id *)(v37 + 5);
    v31 = (id)v37[5];
    ENXPCDecodeSecureObjectIfPresent();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v31);
    if (v10 || !v37[5])
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isSensitiveLoggingAllowed");

      if (v12
        && gLogCategory_ENDaemon <= 30
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        v30 = v10;
        LogPrintF_safe();
      }
      -[ENDaemon configurationManager](self->_daemon, "configurationManager", v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configurationStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "configurationForRegion:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[ENDaemon configurationManager](self->_daemon, "configurationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configurationStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "serverConfigurationForRegion:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (void *)MEMORY[0x1E0CA5858];
        objc_msgSend(v18, "appBundleID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "applicationProxyForIdentifier:placeholder:", v20, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "appState");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isInstalled");

        if (v23)
        {
          objc_msgSend(v18, "appBundleID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 2;
        }
        else
        {
          v24 = 0;
          if (objc_msgSend(v15, "enVersion") == 2)
            v25 = 3;
          else
            v25 = 0;
        }

      }
      else
      {
        v24 = 0;
        v25 = 0;
      }
      v26 = [ENActiveEntity alloc];
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA2F8]), "initWithBundleID:region:", v24, v10);
      v28 = -[ENActiveEntity initWithEntity:activeStatus:](v26, "initWithEntity:activeStatus:", v27, v25);

      if (-[ENDaemon _writePreferenceActiveEntity:](self->_daemon, "_writePreferenceActiveEntity:", v28))
      {
        -[ENDaemon prefsChanged](self->_daemon, "prefsChanged");
        -[ENDaemon xpcReportStatus](self->_daemon, "xpcReportStatus");
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      reply = xpc_dictionary_create_reply(v5);
      if (reply)
      {
        -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v36, 8);
}

uint64_t __39__ENXPCConnection__xpcSetActiveRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcSetMonthlySummaryAlertEnabled:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  _BOOL4 v9;
  const char *v10;
  xpc_object_t reply;
  const char *v12;
  id obj;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__ENXPCConnection__xpcSetMonthlySummaryAlertEnabled___block_invoke;
  v14[3] = &unk_1E87D9D88;
  v16 = &v17;
  v14[4] = self;
  v5 = v4;
  v15 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v14);
  v7 = (id *)(v18 + 5);
  obj = (id)v18[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = xpc_dictionary_get_BOOL(v5, "enbd");
    if (gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v10 = "disabled";
      if (v9)
        v10 = "enabled";
      v12 = v10;
      LogPrintF_safe();
    }
    -[ENDaemon setMonthlySummaryDisabled:](self->_daemon, "setMonthlySummaryDisabled:", !v9, v12);
    reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __53__ENXPCConnection__xpcSetMonthlySummaryAlertEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcGetRemotePresentationRequestIfNeeded:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  BOOL v10;
  int64_t int64;
  int64_t v12;
  id *v13;
  BOOL v14;
  int v15;
  int v16;
  id *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  xpc_object_t reply;
  void *v22;
  int v23;
  void *v24;
  int Int64Ranged;
  void *v26;
  void *v27;
  void *v28;
  ENRemoteUISession *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  xpc_object_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id obj;
  _QWORD v45[5];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v4 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__3;
  v52 = __Block_byref_object_dispose__3;
  v53 = 0;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __60__ENXPCConnection__xpcGetRemotePresentationRequestIfNeeded___block_invoke;
  v45[3] = &unk_1E87D9D88;
  v47 = &v48;
  v45[4] = self;
  v5 = v4;
  v46 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v45);
  v7 = (id *)(v49 + 5);
  obj = (id)v49[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 2, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v49 + 5);
    v43 = (id)v49[5];
    v10 = -[ENXPCConnection _authorizedAndReturnError:](self, "_authorizedAndReturnError:", &v43);
    objc_storeStrong(v9, v43);
    if (v10)
    {
      int64 = xpc_dictionary_get_int64(v5, "rprt");
      v12 = int64;
      switch(int64)
      {
        case 1:
          v16 = 0;
          v15 = 1;
LABEL_16:
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isSensitiveLoggingAllowed");

          if (v23
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          if (v15)
          {
            if (!v16)
            {
LABEL_25:
              reply = xpc_dictionary_create_reply(v5);
              if (reply)
              {
                objc_msgSend(MEMORY[0x1E0CAA3B8], "presentationRequestWithType:", v12);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setAppBundleIdentifier:", v27);

                -[ENXPCClient appRegion](self->_client, "appRegion");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setAgencyRegion:", v28);

                v29 = objc_alloc_init(ENRemoteUISession);
                objc_msgSend(v26, "receiptId");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[ENRemoteUISession setSessionID:](v29, "setSessionID:", v30);

                -[ENDaemon remoteUISessions](self->_daemon, "remoteUISessions");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "receiptId");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, v32);

                v33 = (id *)(v49 + 5);
                v40 = (id)v49[5];
                ENXPCEncodeSecureObject();
                objc_storeStrong(v33, v40);
                xpc_dictionary_set_BOOL(reply, "rpn", 1);
                -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);

              }
              else
              {
                ENErrorF();
                v37 = objc_claimAutoreleasedReturnValue();
                v26 = (void *)v49[5];
                v49[5] = v37;
              }

              goto LABEL_30;
            }
            reply = objc_alloc_init(MEMORY[0x1E0CFE2F8]);
            objc_msgSend(reply, "applicationInfoForPID:", -[ENXPCClient pid](self->_client, "pid"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            Int64Ranged = CFDictionaryGetInt64Ranged();
            objc_msgSend(reply, "invalidate");
            if (Int64Ranged == 8)
            {

              goto LABEL_25;
            }
            ENErrorF();
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = (void *)v49[5];
            v49[5] = v38;

          }
          else
          {
            v34 = xpc_dictionary_create_reply(v5);
            reply = v34;
            if (v34)
            {
              xpc_dictionary_set_BOOL(v34, "rpn", 0);
              -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
            }
            else
            {
              ENErrorF();
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = (void *)v49[5];
              v49[5] = v35;

            }
          }
LABEL_30:

          break;
        case 2:
          v17 = (id *)(v49 + 5);
          v41 = (id)v49[5];
          v18 = -[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", &v41);
          objc_storeStrong(v17, v41);
          if (v18)
          {
            -[ENDaemon temporaryExposureKeyManager](self->_daemon, "temporaryExposureKeyManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[ENXPCClient entitledToSkipKeyReleasePrompt](self->_client, "entitledToSkipKeyReleasePrompt"))
              v15 = 0;
            else
              v15 = objc_msgSend(v19, "requireKeyReleasePromptForClient:", self->_client);

            goto LABEL_15;
          }
          break;
        case 3:
          v13 = (id *)(v49 + 5);
          v42 = (id)v49[5];
          v14 = -[ENXPCConnection _appActiveStatusWithError:](self, "_appActiveStatusWithError:", &v42);
          objc_storeStrong(v13, v42);
          if (v14)
          {
            v15 = 1;
LABEL_15:
            v16 = 1;
            goto LABEL_16;
          }
          break;
        default:
          ENErrorF();
          v20 = objc_claimAutoreleasedReturnValue();
          reply = (xpc_object_t)v49[5];
          v49[5] = v20;
          goto LABEL_30;
      }
    }
  }
  v6[2](v6);

  _Block_object_dispose(&v48, 8);
}

uint64_t __60__ENXPCConnection__xpcGetRemotePresentationRequestIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcRemotePresentationReceivedDecision:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  id *v6;
  BOOL v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  xpc_object_t reply;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (**v30)(_QWORD);
  xpc_object_t original;
  id v32;
  id obj;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v4 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __58__ENXPCConnection__xpcRemotePresentationReceivedDecision___block_invoke;
  v34[3] = &unk_1E87D9D88;
  v36 = &v37;
  v34[4] = self;
  original = v4;
  v35 = original;
  v5 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v34);
  v6 = (id *)(v38 + 5);
  obj = (id)v38[5];
  v30 = v5;
  v7 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v6, obj);
  if (v7)
  {
    objc_opt_class();
    v8 = (id *)(v38 + 5);
    v32 = (id)v38[5];
    ENXPCDecodeSecureObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v32);
    if (!v9)
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v9, "receiptId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENDaemon remoteUISessions](self->_daemon, "remoteUISessions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      ENErrorF();
      v27 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v38[5];
      v38[5] = v27;
      goto LABEL_20;
    }
    -[ENDaemon remoteUISessions](self->_daemon, "remoteUISessions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v10);

    objc_msgSend(v12, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      ENErrorF();
      v28 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v38[5];
      v38[5] = v28;
      goto LABEL_19;
    }
    objc_msgSend(v12, "originalRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15
      || (objc_msgSend(v9, "decisionInfo"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("decisionType")),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "integerValue"),
          v17,
          v16,
          v18 != objc_msgSend(v9, "requestType")))
    {
      ENErrorF();
      v29 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v38[5];
      v38[5] = v29;
      goto LABEL_18;
    }
    v19 = objc_msgSend(v9, "testMode");
    objc_msgSend(v9, "decisionInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("decisionResult"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if ((v22 & 1) != 0)
    {
      v23 = 0;
    }
    else
    {
      ENErrorF();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_msgSend(v9, "requestType");
    if (v24 == 2)
    {
      objc_msgSend(v14, "_xpcGetDiagnosisKeysCompletion:didPrompt:testMode:error:", v15, 1, v19, v23);
    }
    else
    {
      if (v24 != 3)
      {
        objc_msgSend(v9, "requestType");
        ENErrorF();
        v26 = objc_claimAutoreleasedReturnValue();
        reply = (xpc_object_t)v38[5];
        v38[5] = v26;
LABEL_17:

LABEL_18:
LABEL_19:

LABEL_20:
        v5 = v30;
        goto LABEL_21;
      }
      objc_msgSend(v14, "_xpcPreAuthorizeDiagnosisKeysComplete:userDecision:", v15, v22);
    }
    reply = xpc_dictionary_create_reply(original);
    if (reply)
    {
      -[ENXPCConnection _xpcSendMessage:](self, "_xpcSendMessage:", reply);
    }
    else if (gLogCategory__ENDaemon <= 90 && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_17;
  }
LABEL_22:
  v5[2](v5);

  _Block_object_dispose(&v37, 8);
}

uint64_t __58__ENXPCConnection__xpcRemotePresentationReceivedDecision___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_xpcStartSelfReportWebSession:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  ENDaemon *daemon;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  const __CFString *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  void *v27;
  __CFString *v28;
  uint64_t *v29;
  id obj;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v4 = a3;
  v34 = 0;
  v35 = (id *)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3;
  v38 = __Block_byref_object_dispose__3;
  v39 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke;
  v31[3] = &unk_1E87D9D88;
  v33 = &v34;
  v31[4] = self;
  v6 = v4;
  v32 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v31);
  objc_opt_class();
  v8 = v35;
  obj = v35[5];
  ENXPCDecodeSecureObjectIfPresent();
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8 + 5, obj);
  if (!v35[5])
  {
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isSensitiveLoggingAllowed");

    if (v12 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v13 = CFSTR(" <>");
      if (v9)
        v13 = v9;
      v23 = v13;
      v24 = v10;
      LogPrintF_safe();
    }
    if (-[ENDaemon _isNKDActive](self->_daemon, "_isNKDActive", v23, v24))
    {
      -[ENDaemon testResultManager](self->_daemon, "testResultManager");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (v9)
          goto LABEL_13;
        -[ENDaemon activeEntity](self->_daemon, "activeEntity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "entity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "region");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
LABEL_13:
          daemon = self->_daemon;
          v25[0] = v5;
          v25[1] = 3221225472;
          v25[2] = __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke_2;
          v25[3] = &unk_1E87DACC8;
          v29 = &v34;
          v25[4] = self;
          v26 = v6;
          v27 = v14;
          v9 = v9;
          v28 = v9;
          -[ENDaemon fetchServerConfigurationForRegion:completion:](daemon, "fetchServerConfigurationForRegion:completion:", v9, v25);

        }
        else
        {
          ENTestResultErrorF(9);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v35[5];
          v35[5] = (id)v21;

          v9 = 0;
        }
      }
      else
      {
        ENErrorF();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v35[5];
        v35[5] = (id)v19;

      }
    }
    else
    {
      ENErrorF();
      v18 = objc_claimAutoreleasedReturnValue();
      v14 = v35[5];
      v35[5] = (id)v18;
    }

  }
  v7[2](v7);

  _Block_object_dispose(&v34, 8);
}

uint64_t __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return objc_msgSend(*(id *)(v1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), *(_QWORD *)(v1 + 40));
  }
  return result;
}

void __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *reply;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[6];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if ((objc_msgSend(v5, "supportsFeatures:", 2) & 1) == 0)
    {
      ENErrorF();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      goto LABEL_12;
    }
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
    if (reply)
    {
      v9 = *(void **)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke_3;
      v21[3] = &unk_1E87DACA0;
      v11 = *(_QWORD *)(a1 + 32);
      v21[4] = reply;
      v21[5] = v11;
      objc_msgSend(v9, "startSelfReportWebSession:completionHandler:", v10, v21);
    }
    else
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

      if (v18
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  else
  {
    ENNestedTestResultErrorF(v6, 9);
    reply = (void *)objc_claimAutoreleasedReturnValue();
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isSensitiveLoggingAllowed");

    if (v13 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", reply, *(_QWORD *)(a1 + 40), v20);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", reply, *(_QWORD *)(a1 + 40), v19);
    }
  }

LABEL_12:
}

void __49__ENXPCConnection__xpcStartSelfReportWebSession___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v11 && v7
    || (!v8 ? (ENErrorF(), v9 = (id)objc_claimAutoreleasedReturnValue()) : (v9 = v8),
        v10 = v9,
        CUXPCEncodeNSError(),
        v10,
        v7))
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "nonce", (const char *)objc_msgSend(v7, "utf8ValueSafe"));
  }
  if (v11)
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "APIKey", (const char *)objc_msgSend(v11, "utf8ValueSafe"));
  objc_msgSend(*(id *)(a1 + 40), "_xpcSendMessage:", *(_QWORD *)(a1 + 32));

}

- (void)_xpcStartTestVerificationSession:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id *v11;
  char v12;
  id *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  ENDaemon *daemon;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  id v40;
  const __CFString *v41;
  void *v42;
  void (**v43)(_QWORD);
  _QWORD v44[5];
  id v45;
  void *v46;
  __CFString *v47;
  id v48;
  void *v49;
  void *v50;
  BOOL v51;
  id v52;
  id v53;
  id v54;
  id obj;
  _QWORD v56[5];
  id v57;
  uint64_t *v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v4 = a3;
  v59 = 0;
  v60 = (id *)&v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__3;
  v63 = __Block_byref_object_dispose__3;
  v64 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke;
  v56[3] = &unk_1E87D9D88;
  v58 = &v59;
  v56[4] = self;
  v6 = v4;
  v57 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v56);
  if (-[ENXPCClient entitledForTestVerification](self->_client, "entitledForTestVerification")
    || (v8 = v60,
        obj = v60[5],
        v9 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj),
        objc_storeStrong(v8 + 5, obj),
        v9))
  {
    v10 = xpc_dictionary_get_BOOL(v6, "chaff");
    v11 = v60;
    v53 = v60[5];
    v54 = 0;
    v12 = CUXPCDecodeNSString();
    objc_storeStrong(v11 + 5, v53);
    if ((v12 & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    if (!v10)
    {
      ENErrorF();
      v36 = objc_claimAutoreleasedReturnValue();
      v14 = (__CFString *)v60[5];
      v60[5] = (id)v36;
      goto LABEL_25;
    }
    objc_opt_class();
    v13 = v60;
    v52 = v60[5];
    ENXPCDecodeSecureObjectIfPresent();
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13 + 5, v52);
    if (v60[5])
    {
LABEL_25:

      goto LABEL_26;
    }
    -[ENDaemon activeEntity](self->_daemon, "activeEntity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isSensitiveLoggingAllowed");

    if (v17 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v18 = "";
      if (v10)
        v18 = "Chaff, ";
      v19 = CFSTR(" <>");
      if (v14)
        v19 = v14;
      v41 = v19;
      v42 = v15;
      v39 = v18;
      v40 = v54;
      LogPrintF_safe();
    }
    if (-[ENDaemon getOverallStatus](self->_daemon, "getOverallStatus", v39, v40, v41, v42) == 2)
      goto LABEL_29;
    if (objc_msgSend(v15, "activeStatus") == 2)
    {
      objc_msgSend(v15, "entity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bundleIdentifier");
      v21 = (id)objc_claimAutoreleasedReturnValue();

      ENErrorF();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v60[5];
      v60[5] = (id)v22;

      objc_msgSend(v60[5], "userInfo", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "mutableCopy");

      objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CAA2A8]);
      v26 = objc_alloc(MEMORY[0x1E0CB35C0]);
      objc_msgSend(v60[5], "domain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, objc_msgSend(v60[5], "code"), v25);
      v29 = v60[5];
      v60[5] = (id)v28;

LABEL_24:
      goto LABEL_25;
    }
    if (!-[ENDaemon _isNKDActive](self->_daemon, "_isNKDActive"))
    {
LABEL_29:
      ENErrorF();
      v37 = objc_claimAutoreleasedReturnValue();
      v21 = v60[5];
      v60[5] = (id)v37;
      goto LABEL_24;
    }
    v43 = v7;
    -[ENDaemon testResultManager](self->_daemon, "testResultManager");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (v14)
        goto LABEL_22;
      -[ENDaemon activeEntity](self->_daemon, "activeEntity");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "entity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "region");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
LABEL_22:
        -[ENDaemon dispatchQueue](self->_daemon, "dispatchQueue");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = v5;
        -[ENDaemon differentialPrivacyManager](self->_daemon, "differentialPrivacyManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        daemon = self->_daemon;
        v44[0] = v33;
        v44[1] = 3221225472;
        v44[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_2;
        v44[3] = &unk_1E87DAD40;
        v44[4] = self;
        v51 = v10;
        v45 = v6;
        v46 = v21;
        v14 = v14;
        v47 = v14;
        v48 = v54;
        v49 = v32;
        v50 = v34;
        -[ENDaemon fetchServerConfigurationForRegion:completion:](daemon, "fetchServerConfigurationForRegion:completion:", v14, v44);

        v7 = v43;
LABEL_23:

        goto LABEL_24;
      }
      ENTestResultErrorF(9);
      v38 = objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }
    else
    {
      ENErrorF();
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v32 = v60[5];
    v60[5] = (id)v38;
    goto LABEL_23;
  }
LABEL_27:
  v7[2](v7);

  _Block_object_dispose(&v59, 8);
}

uint64_t __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return objc_msgSend(*(id *)(v1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), *(_QWORD *)(v1 + 40));
  }
  return result;
}

void __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t reply;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  _QWORD v20[8];
  _QWORD v21[6];

  if (a2)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
    v5 = reply;
    if (reply)
    {
      v6 = *(void **)(a1 + 48);
      if (*(_BYTE *)(a1 + 88))
      {
        v7 = *(_QWORD *)(a1 + 56);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_3;
        v21[3] = &unk_1E87DACF0;
        v8 = *(_QWORD *)(a1 + 32);
        v21[4] = reply;
        v21[5] = v8;
        objc_msgSend(v6, "startChaffTestVerficationSessionForRegion:completionHandler:", v7, v21);
      }
      else
      {
        v11 = *(_QWORD *)(a1 + 64);
        v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "prefNetworkProxyEnabled");
        v13 = *(_QWORD *)(a1 + 56);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_4;
        v20[3] = &unk_1E87DAD18;
        v14 = *(_QWORD *)(a1 + 80);
        v20[4] = *(_QWORD *)(a1 + 72);
        v20[5] = v5;
        v15 = *(_QWORD *)(a1 + 32);
        v20[6] = v14;
        v20[7] = v15;
        objc_msgSend(v6, "startTestVerficationSessionWithCode:proxyEnabled:region:completionHandler:", v11, v12, v13, v20);
      }
    }
    else
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isSensitiveLoggingAllowed");

      if (v17
        && gLogCategory_ENDaemon <= 90
        && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }

  }
  else
  {
    ENNestedTestResultErrorF(a3, 9);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

    if (v10 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", v19, *(_QWORD *)(a1 + 40), v18);

  }
}

uint64_t __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    CUXPCEncodeNSError();
  return objc_msgSend(*(id *)(a1 + 40), "_xpcSendMessage:", *(_QWORD *)(a1 + 32));
}

void __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_5;
  block[3] = &unk_1E87DAAA8;
  v11 = v5;
  v12 = *(_OWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

uint64_t __52__ENXPCConnection__xpcStartTestVerificationSession___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v13;
  void *v14;
  unsigned __int8 uuid[8];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v10 = *(void **)(a1 + 64);
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      ENErrorF();
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v11;
    CUXPCEncodeNSError();
LABEL_13:

    return objc_msgSend(*(id *)(a1 + 56), "_xpcSendMessage:", *(_QWORD *)(a1 + 40));
  }
  v3 = *(void **)(a1 + 40);
  *(_QWORD *)uuid = 0;
  v16 = 0;
  v4 = v3;
  objc_msgSend(v2, "getUUIDBytes:", uuid);
  xpc_dictionary_set_uuid(v4, "sessID", uuid);

  if (*(_QWORD *)(a1 + 48))
  {
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "_getLatestExposureForDifferentialPrivacy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "_getReportTypeForSession:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSensitiveLoggingAllowed");

    if (v9 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      v13 = v6;
      v14 = v7;
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 48), "reportUserCodeVerified:reportType:", v6, objc_msgSend(v7, "unsignedIntValue", v13, v14));

    goto LABEL_13;
  }
  return objc_msgSend(*(id *)(a1 + 56), "_xpcSendMessage:", *(_QWORD *)(a1 + 40));
}

- (void)_xpcFetchTestVerificationMetadata:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id obj;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__ENXPCConnection__xpcFetchTestVerificationMetadata___block_invoke;
  v16[3] = &unk_1E87D9D88;
  v18 = &v19;
  v16[4] = self;
  v5 = v4;
  v17 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v16);
  v7 = (id *)(v20 + 5);
  obj = (id)v20[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = (id *)(v20 + 5);
    v13 = (id)v20[5];
    v14 = 0;
    v10 = CUXPCDecodeNSUUID();
    objc_storeStrong(v9, v13);
    if ((v10 & 1) != 0)
    {
      ENErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v20[5];
      v20[5] = v11;

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __53__ENXPCConnection__xpcFetchTestVerificationMetadata___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return objc_msgSend(*(id *)(v1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), *(_QWORD *)(v1 + 40));
  }
  return result;
}

- (void)_xpcFinishTestVerificationSession:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  id *v7;
  BOOL v8;
  id *v9;
  char v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id obj;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = (id *)&v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__ENXPCConnection__xpcFinishTestVerificationSession___block_invoke;
  v16[3] = &unk_1E87D9D88;
  v18 = &v19;
  v16[4] = self;
  v5 = v4;
  v17 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v16);
  v7 = v20;
  obj = v20[5];
  v8 = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v7 + 5, obj);
  if (v8)
  {
    v9 = v20;
    v13 = v20[5];
    v14 = 0;
    v10 = CUXPCDecodeNSUUID();
    objc_storeStrong(v9 + 5, v13);
    if ((v10 & 1) != 0)
    {
      ENErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v20[5];
      v20[5] = (id)v11;

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __53__ENXPCConnection__xpcFinishTestVerificationSession___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return objc_msgSend(*(id *)(v1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), *(_QWORD *)(v1 + 40));
  }
  return result;
}

void __53__ENXPCConnection__xpcFinishTestVerificationSession___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v5 = a3;
  v21 = v5;
  if ((a2 & 1) == 0)
  {
    if (v5)
    {
      v10 = v5;
    }
    else
    {
      ENErrorF();
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isSensitiveLoggingAllowed");

    if (v13 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v19 = objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    CUXPCEncodeNSError();
    goto LABEL_26;
  }
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "differentialPrivacyManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "_getLatestExposureForDifferentialPrivacy");
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isSensitiveLoggingAllowed");

      if (v9 && gLogCategory_ENDaemon <= 90 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        v19 = v7;
        v20 = *(_QWORD *)(a1 + 48);
        LogPrintF_safe();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "differentialPrivacyManager", v19, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reportUserKeysUploaded:reportType:", v7, objc_msgSend(*(id *)(a1 + 48), "unsignedIntValue"));

      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *MEMORY[0x1E0CAA278]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "_getDiagnosedVaccineStatusForDifferentialPrivacyWithUserVaccinationStatus:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "differentialPrivacyManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reportUserDiagnosedVaccineStatus:", v15);

      }
      else
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

        if (v18
          && gLogCategory_ENDaemon <= 90
          && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }

LABEL_26:
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_xpcSendMessage:", *(_QWORD *)(a1 + 32), v19);

}

- (void)_xpcShowBuddy:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  id *v8;
  void *v9;
  xpc_object_t reply;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[6];
  id obj;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = (id *)&v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __33__ENXPCConnection__xpcShowBuddy___block_invoke;
  v17[3] = &unk_1E87D9D88;
  v19 = &v20;
  v17[4] = self;
  v6 = v4;
  v18 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v17);
  if (-[ENXPCClient entitledToShowBuddy](self->_client, "entitledToShowBuddy"))
  {
    objc_opt_class();
    v8 = v21;
    obj = v21[5];
    ENXPCDecodeSecureObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8 + 5, obj);
    if (v9)
    {
      reply = xpc_dictionary_create_reply(v6);
      v11 = reply;
      if (reply)
      {
        v15[0] = v5;
        v15[1] = 3221225472;
        v15[2] = __33__ENXPCConnection__xpcShowBuddy___block_invoke_2;
        v15[3] = &unk_1E87DACF0;
        v15[4] = reply;
        v15[5] = self;
        v12 = (void *)MEMORY[0x1D17A7E5C](v15);
        v14[0] = v5;
        v14[1] = 3221225472;
        v14[2] = __33__ENXPCConnection__xpcShowBuddy___block_invoke_3;
        v14[3] = &unk_1E87DAD90;
        v14[4] = self;
        v14[5] = v11;
        v13 = (void *)MEMORY[0x1D17A7E5C](v14);
        -[ENDaemon presentBuddyForRegion:errorHandler:completionHandler:](self->_daemon, "presentBuddyForRegion:errorHandler:completionHandler:", v9, v12, v13);

      }
      else if (gLogCategory__ENDaemon <= 90
             && (gLogCategory__ENDaemon != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
  v7[2](v7);

  _Block_object_dispose(&v20, 8);
}

uint64_t __33__ENXPCConnection__xpcShowBuddy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory_ENDaemon <= 90)
    {
      if (gLogCategory_ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __33__ENXPCConnection__xpcShowBuddy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    CUXPCEncodeNSError();
  objc_msgSend(*(id *)(a1 + 40), "_xpcSendMessage:", *(_QWORD *)(a1 + 32));

}

uint64_t __33__ENXPCConnection__xpcShowBuddy___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_xpcSendMessage:", *(_QWORD *)(a1 + 40));
  return 1;
}

- (void)_xpcVerifyTextMessage:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  id *v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  id v32;
  void *v33;
  id *v34;
  int v35;
  uint64_t v36;
  _BOOL4 v37;
  const char *v38;
  int v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  id *v46;
  int v47;
  xpc_object_t reply;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  void *v63;
  id v64;
  int v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  xpc_object_t original;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  ENXPCConnection *v78;
  void (**v79)(_QWORD);
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  char v92;
  id v93;
  id v94;
  id obj;
  int v96;
  _QWORD v97[5];
  id v98;
  uint64_t *v99;
  uint64_t v100;
  id *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  _BYTE v106[128];
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v100 = 0;
  v101 = (id *)&v100;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__3;
  v104 = __Block_byref_object_dispose__3;
  v105 = 0;
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __41__ENXPCConnection__xpcVerifyTextMessage___block_invoke;
  v97[3] = &unk_1E87D9D88;
  v99 = &v100;
  v78 = self;
  v97[4] = self;
  original = v4;
  v98 = original;
  v5 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v97);
  v96 = 0;
  v6 = v101;
  obj = v101[5];
  v79 = v5;
  LOBYTE(self) = -[ENXPCConnection _entitledForAccessLevel:error:](self, "_entitledForAccessLevel:error:", 4, &obj);
  objc_storeStrong(v6 + 5, obj);
  if ((self & 1) != 0)
  {
    if (-[ENDaemon overallStatus](v78->_daemon, "overallStatus") != 1)
    {
      ENErrorF();
      v49 = objc_claimAutoreleasedReturnValue();
      v81 = v101[5];
      v101[5] = (id)v49;

      goto LABEL_78;
    }
    -[ENDaemon textMessageManager](v78->_daemon, "textMessageManager");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v80)
    {
      ENErrorF();
      v50 = objc_claimAutoreleasedReturnValue();
      v77 = v101[5];
      v101[5] = (id)v50;

      goto LABEL_77;
    }
    -[ENDaemon configurationManager](v78->_daemon, "configurationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationStore");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v76)
    {
      ENErrorF();
      v51 = objc_claimAutoreleasedReturnValue();
      v85 = v101[5];
      v101[5] = (id)v51;

      goto LABEL_76;
    }
    objc_opt_class();
    v8 = v101 + 5;
    v94 = v101[5];
    ENXPCDecodeSecureObject();
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v94);
    if (!v84)
    {
LABEL_75:

LABEL_76:
LABEL_77:

      goto LABEL_78;
    }
    objc_msgSend(v84, "testVerificationCode");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v66)
      goto LABEL_82;
    objc_msgSend(v84, "testVerificationRegion");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[ENDaemon activeEntity](v78->_daemon, "activeEntity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "entity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "region");
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = v12;
      if (!v12)
      {
LABEL_82:
        ENErrorF();
        v52 = objc_claimAutoreleasedReturnValue();
        v73 = v101[5];
        v101[5] = (id)v52;

        goto LABEL_74;
      }
    }
    v72 = (void *)v9;
    objc_msgSend(v76, "configurationForRegion:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v69)
    {
      ENErrorF();
      v53 = objc_claimAutoreleasedReturnValue();
      v75 = v101[5];
      v101[5] = (id)v53;

      goto LABEL_73;
    }
    objc_msgSend(v76, "serverConfigurationForRegion:", v72);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v13;
    if (!v13 || (objc_msgSend(v13, "textMessageVerificationEnabled") & 1) == 0)
    {
      ENErrorF();
      v54 = objc_claimAutoreleasedReturnValue();
      v68 = v101[5];
      v101[5] = (id)v54;

      goto LABEL_72;
    }
    objc_msgSend(v76, "agencyConfigurationForRegion:", v72);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v14;
    if (!v14
      || (objc_msgSend(v14, "localizedConfiguration"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "testVerificationNotificationBody"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = v16 == 0,
          v16,
          v15,
          v17))
    {
      ENErrorF();
      v55 = objc_claimAutoreleasedReturnValue();
      v64 = v101[5];
      v101[5] = (id)v55;

      goto LABEL_71;
    }
    v65 = objc_msgSend(v74, "preArmTestVerificationEnabled");
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isSensitiveLoggingAllowed");

    if (v19 && gLogCategory_ENDaemon <= 30 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
    {
      if (v65)
        v20 = "yes";
      else
        v20 = "no";
      v60 = v84;
      v62 = v20;
      LogPrintF_safe();
    }
    CFStringGetTypeID();
    v21 = CFPrefs_CopyTypedValue();
    v63 = (void *)v21;
    if (v21)
    {
      v107[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v107, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[ENCoreTelephonyUtility sharedInstance](ENCoreTelephonyUtility, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "currentPhoneNumbers");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!objc_msgSend(v70, "count", v60, v62))
    {
      ENErrorF();
      v56 = objc_claimAutoreleasedReturnValue();
      v83 = v101[5];
      v101[5] = (id)v56;

      goto LABEL_70;
    }
    objc_msgSend(v74, "textMessagePublicKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CD6A08];
    v25 = v101 + 5;
    v93 = v101[5];
    +[ENSecKey keyFromBase64String:keyClass:error:](ENSecKey, "keyFromBase64String:keyClass:error:", v23, v24, &v93);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v25, v93);

    if (!v82)
    {
LABEL_69:

LABEL_70:
LABEL_71:

LABEL_72:
LABEL_73:

LABEL_74:
      goto LABEL_75;
    }
    objc_msgSend(v74, "textMessagePublicKeyVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v27 = v70;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v89;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v89 != v29)
            objc_enumerationMutation(v27);
          v31 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
          v32 = v101[5];
          v101[5] = 0;

          objc_msgSend(MEMORY[0x1E0C99D60], "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v101 + 5;
          v87 = v101[5];
          LOBYTE(v31) = objc_msgSend(v80, "verifyTextMessage:phoneNumber:verificationDate:publicKey:publicKeyVersion:userReport:outError:", v84, v31, v33, v82, v26, &v92, &v87);
          objc_storeStrong(v34, v87);
          v5 = v79;

          if ((v31 & 1) != 0)
          {
            v35 = 1;
            goto LABEL_37;
          }
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
        if (v28)
          continue;
        break;
      }
    }
    v35 = 0;
LABEL_37:

    if (v92)
      v36 = 3;
    else
      v36 = 0;
    if (!v92 || (objc_msgSend(v74, "supportsFeatures:", 2) & 1) != 0)
    {
      if (CFPrefs_GetInt64())
        v37 = IsAppleInternalBuild() != 0;
      else
        v37 = 0;
      if (gLogCategory_ENDaemon <= 40 && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
      {
        v38 = "no";
        if (v37)
          v38 = "yes";
        v61 = v38;
        LogPrintF_safe();
      }
      if (((v35 | v37) & 1) != 0)
      {
        if (v92)
          v39 = 0;
        else
          v39 = v65;
        if (v39 == 1
          && (objc_msgSend(v69, "diagnosisKeysPreAuthorization"),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              v41 = objc_msgSend(v40, "userAuthorization") == 1,
              v40,
              v41))
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "isSensitiveLoggingAllowed");

          if (v43
            && gLogCategory_ENDaemon <= 30
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          objc_msgSend(v69, "diagnosisKeysPreAuthorization", v61);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setVerificationCode:", v66);

          objc_msgSend(v69, "diagnosisKeysPreAuthorization");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setReportType:", v36);

          v46 = v101 + 5;
          v86 = v101[5];
          v47 = objc_msgSend(v76, "saveRegionConfiguration:error:", v69, &v86);
          objc_storeStrong(v46, v86);
          if (!v47)
            goto LABEL_68;
          -[ENDaemon enqueuePreauthorizedTestVerificationUnlockAction](v78->_daemon, "enqueuePreauthorizedTestVerificationUnlockAction");
        }
        else
        {
          -[ENDaemon postTestVerificationReceivedNotification:region:reportType:](v78->_daemon, "postTestVerificationReceivedNotification:region:reportType:", v84, v72, v36, v61);
        }
        reply = xpc_dictionary_create_reply(original);
        if (reply)
        {
          -[ENXPCConnection _xpcSendMessage:](v78, "_xpcSendMessage:", reply);
        }
        else
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "isSensitiveLoggingAllowed");

          if (v58
            && gLogCategory_ENDaemon <= 90
            && (gLogCategory_ENDaemon != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
        }
        goto LABEL_67;
      }
      if (v101[5])
        goto LABEL_68;
    }
    ENErrorF();
    v59 = objc_claimAutoreleasedReturnValue();
    reply = v101[5];
    v101[5] = (id)v59;
LABEL_67:

LABEL_68:
    goto LABEL_69;
  }
LABEL_78:
  v5[2](v5);

  _Block_object_dispose(&v100, 8);
}

uint64_t __41__ENXPCConnection__xpcVerifyTextMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENDaemon <= 90)
    {
      if (gLogCategory__ENDaemon != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (ENXPCClient)client
{
  return self->_client;
}

- (ENDaemon)daemon
{
  return self->_daemon;
}

- (ENExposureDetectionDaemonSession)detectionSession
{
  return self->_detectionSession;
}

- (void)setDetectionSession:(id)a3
{
  objc_storeStrong((id *)&self->_detectionSession, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (BOOL)skipFileSigningVerification
{
  return self->_skipFileSigningVerification;
}

- (void)setSkipFileSigningVerification:(BOOL)a3
{
  self->_skipFileSigningVerification = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

@end
