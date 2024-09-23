@implementation AAFAnalyticsTransportInProcessRTC

- (AAFAnalyticsTransportInProcessRTC)initWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v9;
  AAFAnalyticsTransportInProcessRTC *v10;
  AAFAnalyticsTransportInProcessRTC *v11;
  NSDictionary *v12;
  NSDictionary *sessionInfo;
  NSDictionary *v14;
  NSDictionary *userInfo;
  void *v16;
  NSNumber *clientType;
  _QWORD *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  NSString *clientBundleId;
  _QWORD *v31;
  void *v32;
  void *v33;
  int AppBooleanValue;
  _QWORD *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSDictionary *v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  NSString *clientName;
  _QWORD *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSDictionary *v49;
  uint64_t v50;
  NSMutableArray *eventQueue;
  void *v52;
  objc_class *v53;
  uint64_t v54;
  RTCReporting *rtcReportingSession;
  id v57;
  id v58;
  objc_super v59;
  Boolean keyExistsAndHasValidFormat[8];
  Boolean *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  void *v66;
  Boolean *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v58 = a4;
  v9 = a5;
  v59.receiver = self;
  v59.super_class = (Class)AAFAnalyticsTransportInProcessRTC;
  v10 = -[AAFAnalyticsTransportInProcessRTC init](&v59, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_77;
  objc_storeStrong((id *)&v10->_clientType, a3);
  objc_storeStrong((id *)&v11->_clientBundleId, a4);
  objc_storeStrong((id *)&v11->_clientName, a5);
  v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  sessionInfo = v11->_sessionInfo;
  v11->_sessionInfo = v12;

  v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  userInfo = v11->_userInfo;
  v11->_userInfo = v14;

  v16 = (void *)-[NSDictionary mutableCopy](v11->_sessionInfo, "mutableCopy", v57, v58);
  clientType = v11->_clientType;
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v64 = xmmword_1E9946738;
    v65 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RTCReportingLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)&v64 = 0;
    *((_QWORD *)&v64 + 1) = &v64;
    v65 = 0x2020000000;
    v18 = (_QWORD *)getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
    v66 = (void *)getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
    if (!getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr)
    {
      v19 = (void *)RTCReportingLibrary();
      v18 = dlsym(v19, "kRTCReportingSessionInfoClientType");
      *(_QWORD *)(*((_QWORD *)&v64 + 1) + 24) = v18;
      getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(&v64, 8);
    if (!v18)
      goto LABEL_78;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", clientType, *v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", clientType, v20);

  }
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v64 = xmmword_1E9946738;
    v65 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RTCReportingLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)&v64 = 0;
    *((_QWORD *)&v64 + 1) = &v64;
    v65 = 0x2020000000;
    v21 = (_QWORD *)getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
    v66 = (void *)getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
    if (!getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr)
    {
      v22 = (void *)RTCReportingLibrary();
      v21 = dlsym(v22, "kRTCReportingSessionInfoClientVersion");
      *(_QWORD *)(*((_QWORD *)&v64 + 1) + 24) = v21;
      getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr = (uint64_t)v21;
    }
    _Block_object_dispose(&v64, 8);
    if (!v21)
      goto LABEL_78;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E994BA68, *v21);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E994BA68, v23);

  }
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v64 = xmmword_1E9946738;
    v65 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RTCReportingLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)&v64 = 0;
    *((_QWORD *)&v64 + 1) = &v64;
    v65 = 0x2020000000;
    v24 = (_QWORD *)getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
    v66 = (void *)getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
    if (!getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr)
    {
      v25 = (void *)RTCReportingLibrary();
      v24 = dlsym(v25, "kRTCReportingSessionInfoSessionID");
      *(_QWORD *)(*((_QWORD *)&v64 + 1) + 24) = v24;
      getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr = (uint64_t)v24;
    }
    _Block_object_dispose(&v64, 8);
    if (!v24)
      goto LABEL_78;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E994BA68, *v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E994BA68, v26);

  }
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v64 = xmmword_1E9946738;
    v65 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RTCReportingLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)&v64 = 0;
    *((_QWORD *)&v64 + 1) = &v64;
    v65 = 0x2020000000;
    v27 = (_QWORD *)getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
    v66 = (void *)getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
    if (!getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr)
    {
      v28 = (void *)RTCReportingLibrary();
      v27 = dlsym(v28, "kRTCReportingSessionInfoBatchEvent");
      *(_QWORD *)(*((_QWORD *)&v64 + 1) + 24) = v27;
      getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr = (uint64_t)v27;
    }
    _Block_object_dispose(&v64, 8);
    if (!v27)
      goto LABEL_78;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *v27);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v29);

  }
  clientBundleId = v11->_clientBundleId;
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v64 = xmmword_1E9946738;
    v65 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RTCReportingLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)&v64 = 0;
    *((_QWORD *)&v64 + 1) = &v64;
    v65 = 0x2020000000;
    v31 = (_QWORD *)getkRTCReportingSessionInfoClientBundleIDSymbolLoc_ptr;
    v66 = (void *)getkRTCReportingSessionInfoClientBundleIDSymbolLoc_ptr;
    if (!getkRTCReportingSessionInfoClientBundleIDSymbolLoc_ptr)
    {
      v32 = (void *)RTCReportingLibrary();
      v31 = dlsym(v32, "kRTCReportingSessionInfoClientBundleID");
      *(_QWORD *)(*((_QWORD *)&v64 + 1) + 24) = v31;
      getkRTCReportingSessionInfoClientBundleIDSymbolLoc_ptr = (uint64_t)v31;
    }
    _Block_object_dispose(&v64, 8);
    if (!v31)
      goto LABEL_78;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", clientBundleId, *v31);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", clientBundleId, v33);

  }
  if (+[AFUtilities isInternalBuild](AFUtilities, "isInternalBuild"))
  {
    keyExistsAndHasValidFormat[0] = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("realTimeEvents"), CFSTR("com.apple.aaafoundation"), keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat[0])
    {
      if (AppBooleanValue)
      {
        if (!RTCReportingLibraryCore_frameworkLibrary)
        {
          v64 = xmmword_1E9946738;
          v65 = 0;
          RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
        }
        if (RTCReportingLibraryCore_frameworkLibrary)
        {
          *(_QWORD *)&v64 = 0;
          *((_QWORD *)&v64 + 1) = &v64;
          v65 = 0x2020000000;
          v35 = (_QWORD *)getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
          v66 = (void *)getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
          if (!getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr)
          {
            v36 = (void *)RTCReportingLibrary();
            v35 = dlsym(v36, "kRTCReportingSessionInfoContainsRealtimeEvents");
            *(_QWORD *)(*((_QWORD *)&v64 + 1) + 24) = v35;
            getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr = (uint64_t)v35;
          }
          _Block_object_dispose(&v64, 8);
          if (!v35)
            goto LABEL_78;
          objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v35);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v37);

        }
      }
    }
  }
  v38 = objc_msgSend(v16, "copy");
  v39 = v11->_sessionInfo;
  v11->_sessionInfo = (NSDictionary *)v38;

  v40 = (void *)-[NSDictionary mutableCopy](v11->_userInfo, "mutableCopy");
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v64 = xmmword_1E9946738;
    v65 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RTCReportingLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)&v64 = 0;
    *((_QWORD *)&v64 + 1) = &v64;
    v65 = 0x2020000000;
    v41 = (_QWORD *)getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
    v66 = (void *)getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
    if (!getkRTCReportingUserInfoServiceNameSymbolLoc_ptr)
    {
      v42 = (void *)RTCReportingLibrary();
      v41 = dlsym(v42, "kRTCReportingUserInfoServiceName");
      *(_QWORD *)(*((_QWORD *)&v64 + 1) + 24) = v41;
      getkRTCReportingUserInfoServiceNameSymbolLoc_ptr = (uint64_t)v41;
    }
    _Block_object_dispose(&v64, 8);
    if (!v41)
      goto LABEL_78;
    objc_msgSend(v40, "setObject:forKeyedSubscript:", CFSTR("default"), *v41);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", CFSTR("default"), v43);

  }
  clientName = v11->_clientName;
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v64 = xmmword_1E9946738;
    v65 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", clientName, v47);

    goto LABEL_69;
  }
  *(_QWORD *)&v64 = 0;
  *((_QWORD *)&v64 + 1) = &v64;
  v65 = 0x2020000000;
  v45 = (_QWORD *)getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  v66 = (void *)getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  if (!getkRTCReportingUserInfoClientNameSymbolLoc_ptr)
  {
    v46 = (void *)RTCReportingLibrary();
    v45 = dlsym(v46, "kRTCReportingUserInfoClientName");
    *(_QWORD *)(*((_QWORD *)&v64 + 1) + 24) = v45;
    getkRTCReportingUserInfoClientNameSymbolLoc_ptr = (uint64_t)v45;
  }
  _Block_object_dispose(&v64, 8);
  if (!v45)
  {
LABEL_78:
    -[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:].cold.1();
    __break(1u);
  }
  objc_msgSend(v40, "setObject:forKeyedSubscript:", clientName, *v45);
LABEL_69:
  v48 = objc_msgSend(v40, "copy");
  v49 = v11->_userInfo;
  v11->_userInfo = (NSDictionary *)v48;

  *(_OWORD *)&v11->_sessionState = xmmword_1D51B2050;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = objc_claimAutoreleasedReturnValue();
  eventQueue = v11->_eventQueue;
  v11->_eventQueue = (NSMutableArray *)v50;

  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v64 = xmmword_1E9946738;
    v65 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RTCReportingLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)keyExistsAndHasValidFormat = 0;
    v61 = keyExistsAndHasValidFormat;
    v62 = 0x2050000000;
    v52 = (void *)getRTCReportingClass_softClass;
    v63 = getRTCReportingClass_softClass;
    if (!getRTCReportingClass_softClass)
    {
      *(_QWORD *)&v64 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v64 + 1) = 3221225472;
      v65 = (uint64_t)__getRTCReportingClass_block_invoke;
      v66 = &unk_1E9946758;
      v67 = keyExistsAndHasValidFormat;
      __getRTCReportingClass_block_invoke((uint64_t)&v64);
      v52 = (void *)*((_QWORD *)v61 + 3);
    }
    v53 = objc_retainAutorelease(v52);
    _Block_object_dispose(keyExistsAndHasValidFormat, 8);
  }
  else
  {
    v53 = 0;
  }
  v54 = objc_msgSend([v53 alloc], "initWithSessionInfo:userInfo:frameworksToCheck:", v11->_sessionInfo, v11->_userInfo, 0);
  rtcReportingSession = v11->_rtcReportingSession;
  v11->_rtcReportingSession = (RTCReporting *)v54;

LABEL_77:
  return v11;
}

- (id)_createPayloadWith:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "reportData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("eventName"));

  }
  return v5;
}

- (void)configureReportingSessionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AAFAnalyticsTransportInProcessRTC rtcReportingSession](self, "rtcReportingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__AAFAnalyticsTransportInProcessRTC_configureReportingSessionWithCompletion___block_invoke;
  v7[3] = &unk_1E9946718;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "startConfigurationWithCompletionHandler:", v7);

}

uint64_t __77__AAFAnalyticsTransportInProcessRTC_configureReportingSessionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_sendMessageWithCategory:(id)a3 payload:(id)a4 error:(id *)a5
{
  RTCReporting *rtcReportingSession;
  id v8;

  rtcReportingSession = self->_rtcReportingSession;
  v8 = a4;
  LOBYTE(a5) = -[RTCReporting sendMessageWithCategory:type:payload:error:](rtcReportingSession, "sendMessageWithCategory:type:payload:error:", (unsigned __int16)objc_msgSend(a3, "unsignedIntValue"), 0, v8, a5);

  return (char)a5;
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "eventCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AAFAnalyticsTransportInProcessRTC _createPayloadWith:](self, "_createPayloadWith:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v8 = -[AAFAnalyticsTransportInProcessRTC _sendMessageWithCategory:payload:error:](self, "_sendMessageWithCategory:payload:error:", v7, v6, &v19);
    v9 = v19;

    _AAFLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[AAFAnalyticsTransportInProcessRTC sendEvent:].cold.2((uint64_t)self, v11);
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[AAFAnalyticsTransportInProcessRTC sendEvent:].cold.3((uint64_t)self, (uint64_t)v9, v11);
    }

  }
  else
  {
    _AAFLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AAFAnalyticsTransportInProcessRTC sendEvent:].cold.1(v6, v12, v13, v14, v15, v16, v17, v18);
  }

}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D51A2000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated", (uint8_t *)&v2, 0xCu);
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AAFAnalyticsTransportInProcessRTC clientType](self, "clientType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFAnalyticsTransportInProcessRTC clientBundleId](self, "clientBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFAnalyticsTransportInProcessRTC clientName](self, "clientName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFAnalyticsTransportInProcessRTC sessionInfo](self, "sessionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFAnalyticsTransportInProcessRTC userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> ClientType: [%@], ClientBundleId: [%@], ClientName: [%@], SessionInfo: %@, UserInfo: %@"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (id)analyticsTransportRTCWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClientType:clientBundleId:clientName:", v8, v9, v10);
  }
  else
  {
    _AAFLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[AAFAnalyticsTransportInProcessRTC analyticsTransportRTCWithClientType:clientBundleId:clientName:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    v12 = 0;
  }

  return v12;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (unint64_t)sessionGracePeriod
{
  return self->_sessionGracePeriod;
}

- (void)setSessionGracePeriod:(unint64_t)a3
{
  self->_sessionGracePeriod = a3;
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSDictionary)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (RTCReporting)rtcReportingSession
{
  return self->_rtcReportingSession;
}

- (void)setRtcReportingSession:(id)a3
{
  objc_storeStrong((id *)&self->_rtcReportingSession, a3);
}

- (NSMutableArray)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_rtcReportingSession, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
}

- (uint64_t)initWithClientType:clientBundleId:clientName:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[AAFAnalyticsTransportInProcessRTC sendEvent:].cold.1(v0);
}

- (void)sendEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D51A2000, a1, a3, "Error sending report for event. RTC event needs a category.", a5, a6, a7, a8, 0);
}

- (void)sendEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  id v4;
  id v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_1_3();
  v7 = a1;
  v5 = v4;
  _os_log_debug_impl(&dword_1D51A2000, a2, OS_LOG_TYPE_DEBUG, "<%@: %p> RTCReporting send success!", v6, 0x16u);

}

- (void)sendEvent:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v6;
  id v7;
  uint8_t v8[14];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_1_3();
  v9 = a1;
  v10 = 2114;
  v11 = a2;
  v7 = v6;
  _os_log_error_impl(&dword_1D51A2000, a3, OS_LOG_TYPE_ERROR, "<%@: %p> RTCReporting send failed with error: %{public}@", v8, 0x20u);

}

+ (void)analyticsTransportRTCWithClientType:(uint64_t)a3 clientBundleId:(uint64_t)a4 clientName:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D51A2000, a1, a3, "Failed to initialize AAFAnalyticsTransportRTC. Please check if all required parameters are provided.", a5, a6, a7, a8, 0);
}

@end
