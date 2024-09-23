@implementation APNetworkClient

- (id)POST:(id)a3 client:(id)a4 headers:(id)a5 body:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend__billedSessionForRequester_(self, v16, (uint64_t)a4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_POST_headers_body_withCompletionHandler_(v18, v19, (uint64_t)v15, (uint64_t)v14, v13, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_billedSessionForRequester:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend_serviceManager(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionForService_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (APHTTPSessionManagerProtocol)serviceManager
{
  return self->_serviceManager;
}

+ (id)sharedAPNetworkClient
{
  return (id)qword_1ED2BC760;
}

- (id)temporarySessionForClient:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend_serviceManager(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_temporarySessionForService_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_defaultSessionConfig
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x1E0CB39F8], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3990]);
  v7 = (void *)objc_msgSend_initWithMemoryCapacity_diskCapacity_diskPath_(v5, v6, 0, 0, 0);
  objc_msgSend_setURLCache_(v4, v8, (uint64_t)v7, v9);

  return v4;
}

- (id)_createSessionForRequester:(id)a3 httpMaximumConnectionsPerHost:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  APHTTPSession *v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  objc_msgSend__defaultSessionConfig(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set_sourceApplicationBundleIdentifier_(v10, v11, (uint64_t)v6, v12);

  if (a4 >= 1)
    objc_msgSend_setHTTPMaximumConnectionsPerHost_(v10, v13, a4, v14);
  v15 = [APHTTPSession alloc];
  v18 = (void *)objc_msgSend_initWithSessionConfiguration_(v15, v16, (uint64_t)v10, v17);

  return v18;
}

+ (void)createSharedNetworkClientForUnitTest
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  APNetworkClientConfig *v14;

  v14 = objc_alloc_init(APNetworkClientConfig);
  objc_msgSend_setUseFixedHttpSessionManager_(v14, v3, 0, v4);
  objc_msgSend_setLookBackWindow_(v14, v5, v6, v7, 5.0);
  objc_msgSend_setHttpMaximumConnectionsPerHost_(v14, v8, 4, v9);
  objc_msgSend_setHttpMaximumConnectionsPerHostTempSession_(v14, v10, 1, v11);
  objc_msgSend_createSharedNetworkClientWithConfig_(a1, v12, (uint64_t)v14, v13);

}

+ (void)createSharedNetworkClientWithConfig:(id)a3
{
  id v4;
  APNetworkClient *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  if (!qword_1ED2BC760)
  {
    v4 = a3;
    v5 = [APNetworkClient alloc];
    v10 = (id)objc_msgSend_initWithConfig_(v5, v6, (uint64_t)v4, v7);

    objc_msgSend_setSharedAPNetworkClient_(a1, v8, (uint64_t)v10, v9);
  }
}

+ (void)setSharedAPNetworkClient:(id)a3
{
  objc_storeStrong((id *)&qword_1ED2BC760, a3);
}

- (APNetworkClient)initWithConfig:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APNetworkClient *v8;
  APFixedHTTPSessionManager *v9;
  APHTTPSessionManagerProtocol *serviceManager;
  NSObject *v11;
  const char *v12;
  APFlexibleHTTPSessionManager *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  APHTTPSessionManagerProtocol *v29;
  const char *v30;
  uint64_t v31;
  _QWORD v33[4];
  id v34;
  id buf[2];
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)APNetworkClient;
  v8 = -[APNetworkClient init](&v36, sel_init);
  if (v8)
  {
    if (objc_msgSend_useFixedHttpSessionManager(v4, v5, v6, v7))
    {
      v9 = objc_alloc_init(APFixedHTTPSessionManager);
      serviceManager = v8->_serviceManager;
      v8->_serviceManager = (APHTTPSessionManagerProtocol *)v9;

      APLogForCategory(0x1EuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        v12 = "Created fixed HTTP session manager.";
LABEL_7:
        _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)buf, 2u);
      }
    }
    else
    {
      v13 = [APFlexibleHTTPSessionManager alloc];
      objc_msgSend_lookBackWindow(v4, v14, v15, v16);
      v18 = v17;
      v22 = objc_msgSend_httpMaximumConnectionsPerHost(v4, v19, v20, v21);
      v26 = objc_msgSend_httpMaximumConnectionsPerHostTempSession(v4, v23, v24, v25);
      v28 = objc_msgSend_initWithLookBackWindow_httpMaximumConnectionsPerHost_httpMaximumConnectionsPerHostTempSession_(v13, v27, v22, v26, v18);
      v29 = v8->_serviceManager;
      v8->_serviceManager = (APHTTPSessionManagerProtocol *)v28;

      APLogForCategory(0x1EuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        v12 = "Created flexible HTTP session manager.";
        goto LABEL_7;
      }
    }

    objc_initWeak(buf, v8);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_1CF26E104;
    v33[3] = &unk_1E8C48B30;
    objc_copyWeak(&v34, buf);
    objc_msgSend_setCreateSessionBlock_(v8->_serviceManager, v30, (uint64_t)v33, v31);
    objc_destroyWeak(&v34);
    objc_destroyWeak(buf);
  }

  return v8;
}

- (BOOL)invalidateService:(id)a3 andCancelTasks:(BOOL)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v4 = a4;
  v6 = a3;
  objc_msgSend_serviceManager(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend_invalidateService_andCancelTasks_(v10, v11, (uint64_t)v6, v4);

  return v4;
}

- (id)urlSessionForService:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend__billedSessionForRequester_(self, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_session(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)cancelTasksForService:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend_serviceManager(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_cancelTasksForService_withCompletionHandler_(v11, v12, (uint64_t)v7, (uint64_t)v6);

  return v13;
}

- (void)_invalidateAllServicesAndCancelTasks:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend_serviceManager(self, a2, a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidateAllServicesAndCancelTasks_(v7, v5, v4, v6);

}

- (id)sessionForClient:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend_serviceManager(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionForService_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)temporarySessionForDaemon
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_serviceManager(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_temporarySessionForService_(v4, v5, (uint64_t)CFSTR("com.apple.ap.promotedcontentd"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sendRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  objc_msgSend_serviceName(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__billedSessionForRequester_(self, v9, (uint64_t)v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sendRequest_(v11, v12, (uint64_t)v4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)GET:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_GET_client_headers_withCompletionHandler_, a3, CFSTR("com.apple.ap.promotedcontentd"));
}

- (id)POST:(id)a3 headers:(id)a4 body:(id)a5 withCompletionHandler:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_POST_client_headers_body_completionHandler_, a3, CFSTR("com.apple.ap.promotedcontentd"));
}

- (id)HEAD:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_HEAD_client_headers_withCompletionHandler_, a3, CFSTR("com.apple.ap.promotedcontentd"));
}

- (id)GET:(id)a3 client:(id)a4 headers:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend__billedSessionForRequester_(self, v13, (uint64_t)a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GET_headers_withCompletionHandler_(v15, v16, (uint64_t)v12, (uint64_t)v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)HEAD:(id)a3 client:(id)a4 headers:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend__billedSessionForRequester_(self, v13, (uint64_t)a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_HEAD_headers_withCompletionHandler_(v15, v16, (uint64_t)v12, (uint64_t)v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)GET:(id)a3 headers:(id)a4 withService:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend__billedSessionForRequester_(self, v13, (uint64_t)a5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GET_headers_withCompletionHandler_(v15, v16, (uint64_t)v12, (uint64_t)v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)POST:(id)a3 headers:(id)a4 body:(id)a5 withService:(id)a6 andCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend__billedSessionForRequester_(self, v16, (uint64_t)a6, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_POST_headers_body_withCompletionHandler_(v18, v19, (uint64_t)v15, (uint64_t)v14, v13, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)HEAD:(id)a3 headers:(id)a4 withService:(id)a5 andCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend__billedSessionForRequester_(self, v13, (uint64_t)a5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_HEAD_headers_withCompletionHandler_(v15, v16, (uint64_t)v12, (uint64_t)v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_serviceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

@end
