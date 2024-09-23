@implementation CARSessionRequestHandlerProxy

- (void)service_startSessionWithHost:(id)a3 requestIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CarGeneralLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v17 = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_INFO, "Received start session request for host %@, requestID: %@", (uint8_t *)&v17, 0x16u);
  }

  -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v14, "startSessionWithHost:requestIdentifier:completion:", v8, v9, v10);
LABEL_7:

    goto LABEL_8;
  }
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startSessionWithHost:completion:", v8, v10);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)service_stoppedSessionWithHostIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_INFO, "Received stop session request for host ID %@", (uint8_t *)&v12, 0xCu);
  }

  -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stoppedSessionForHostIdentifier:", v6);

  }
  v7[2](v7, 1, 0);

}

- (void)service_startAdvertisingCarPlayControlForWiFiUUID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_INFO, "Received startAdvertisingCarPlayControl for Wi-Fi UUID: %@", (uint8_t *)&v12, 0xCu);
  }

  -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startAdvertisingCarPlayControlForWiFiUUID:", v6);

  }
  v7[2](v7, 1, 0);

}

- (void)service_startAdvertisingCarPlayControlForUSBWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Received startAdvertisingCarPlayControl for USB", v9, 2u);
  }

  -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startAdvertisingCarPlayControlForUSB");

  }
  v4[2](v4, 1, 0);

}

- (void)service_prepareForRemovingWiFiUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_INFO, "Received prepareForRemovingWiFiUUID: %@", (uint8_t *)&v12, 0xCu);
  }

  -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prepareForRemovingWiFiUUID:completion:", v6, v7);

  }
}

- (void)service_cancelRequestsWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "Received cancelRequests", v9, 2u);
  }

  -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CARSessionRequestHandlerProxy requestHandler](self, "requestHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelRequests");

  }
  v4[2](v4, 1, 0);

}

- (CARSessionRequestHandling)requestHandler
{
  return (CARSessionRequestHandling *)objc_loadWeakRetained((id *)&self->_requestHandler);
}

- (void)setRequestHandler:(id)a3
{
  objc_storeWeak((id *)&self->_requestHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requestHandler);
}

@end
