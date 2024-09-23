@implementation ATDeviceProvisioningHandler

- (ATDeviceProvisioningHandler)init
{
  ATDeviceProvisioningHandler *v2;
  uint64_t v3;
  ATDeviceSettings *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATDeviceProvisioningHandler;
  v2 = -[ATDeviceProvisioningHandler init](&v6, sel_init);
  if (v2)
  {
    +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (ATDeviceSettings *)v3;

  }
  return v2;
}

- (void)messageLinkWasOpened:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  double v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "endpointType");
  _ATLogCategoryFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == 1)
  {
    if (v7)
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opened - starting provisioning", (uint8_t *)&v9, 0xCu);
    }

    -[ATDeviceProvisioningHandler _sendRegisterEndpointRequestOnMessageLink:](self, "_sendRegisterEndpointRequestOnMessageLink:", v4);
  }
  else
  {
    if (v7)
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opened - waiting for provisioning message from server", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_linkOpenTime = v8;

}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isInitialized"))
  {
    _ATLogCategoryFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "command");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v9;
      v10 = "Received provisioning request on initialized link. command=%{public}@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
LABEL_4:
      _os_log_impl(&dword_1D1868000, v11, v12, v10, (uint8_t *)&v19, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v7, "command");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("ProvisioningRegisterEndpoint"));

    if (v14)
    {
      -[ATDeviceProvisioningHandler _handleRegisterEndpointRequest:onMessageLink:](self, "_handleRegisterEndpointRequest:onMessageLink:", v7, v6);
      goto LABEL_12;
    }
    objc_msgSend(v7, "command");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("ProvisioningCreateSession"));

    if (v16)
    {
      -[ATDeviceProvisioningHandler _handleCreateSessionRequest:onMessageLink:](self, "_handleCreateSessionRequest:onMessageLink:", v7, v6);
      goto LABEL_12;
    }
    objc_msgSend(v7, "command");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("ProvisioningBeginSession"));

    if (v18)
    {
      -[ATDeviceProvisioningHandler _handleBeginSessionRequest:onMessageLink:](self, "_handleBeginSessionRequest:onMessageLink:", v7, v6);
      goto LABEL_12;
    }
    _ATLogCategoryFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "command");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v9;
      v10 = "Received unexpected provisioning request. command=%{public}@";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
      goto LABEL_4;
    }
  }

  objc_msgSend(v6, "close");
LABEL_12:

}

- (void)_sendRegisterEndpointRequestOnMessageLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[ATDeviceProvisioningHandler _getEndpointInfo](self, "_getEndpointInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF76A0]), "initWithCommand:dataClass:parameters:", CFSTR("ProvisioningRegisterEndpoint"), CFSTR("Provisioning"), v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__ATDeviceProvisioningHandler__sendRegisterEndpointRequestOnMessageLink___block_invoke;
  v8[3] = &unk_1E927D660;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v7, "sendRequest:withCompletion:", v6, v8);

}

- (void)_handleRegisterEndpointRequest:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  ATGrappaSession *v22;
  ATGrappaSession *grappaSession;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningLibraryIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "setIdentifier:", v10);
    -[ATDeviceSettings hostInfoForLibrary:](self->_settings, "hostInfoForLibrary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningHostModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setModel:", v12);

    objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningHostOSType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOsType:", v13);

    objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningHostOSVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOsVersion:", v14);

    objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningDeviceInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGrappaInfo:", v15);

    objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningEnabledDataClasses"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabledDataClasses:", v16);

    objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningDevicePairingId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDevicePairingId:", v17);

    objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningDeviceGUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeviceGUID:", v18);

    objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningDevicePairingId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0DDC018], "sharedMonitor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activePairedDevicePairingID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v27, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
LABEL_3:
        objc_msgSend(v11, "setDevicePairingId:", v19);

      }
    }
    -[ATDeviceSettings setHostInfo:forLibrary:](self->_settings, "setHostInfo:forLibrary:", v11, v10);
    _ATLogCategoryFramework();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v10;
      v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_1D1868000, v20, OS_LOG_TYPE_DEFAULT, "Registering with endpoint %{public}@; hostInfo=%{public}@",
        buf,
        0x16u);
    }

    -[ATDeviceProvisioningHandler _getEndpointInfo](self, "_getEndpointInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v21);

    v22 = -[ATGrappaSession initWithType:]([ATGrappaSession alloc], "initWithType:", 0);
    grappaSession = self->_grappaSession;
    self->_grappaSession = v22;

    -[ATGrappaSession deviceInfo](self->_grappaSession, "deviceInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v8, "setObject:forKey:", v24, CFSTR("_ProvisioningDeviceInfo"));
      v25 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 21, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "responseWithError:parameters:", v25, v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __76__ATDeviceProvisioningHandler__handleRegisterEndpointRequest_onMessageLink___block_invoke;
  v30[3] = &unk_1E927E0D0;
  v31 = v7;
  v29 = v7;
  objc_msgSend(v29, "sendResponse:withCompletion:", v28, v30);

}

- (void)_processRegisterEndpointResponse:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  ATGrappaSession *v22;
  ATGrappaSession *grappaSession;
  ATGrappaSession *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isPartial") & 1) == 0)
  {
    objc_msgSend(v6, "error");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = 0;
    }
    else
    {
      objc_msgSend(v6, "parameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("_ProvisioningLibraryIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIdentifier:", v12);
      -[ATDeviceSettings hostInfoForLibrary:](self->_settings, "hostInfoForLibrary:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("_ProvisioningHostModel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setModel:", v14);

      objc_msgSend(v11, "objectForKey:", CFSTR("_ProvisioningHostOSType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setOsType:", v15);

      objc_msgSend(v11, "objectForKey:", CFSTR("_ProvisioningHostOSVersion"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setOsVersion:", v16);

      objc_msgSend(v11, "objectForKey:", CFSTR("_ProvisioningDeviceInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setGrappaInfo:", v17);

      objc_msgSend(v11, "objectForKey:", CFSTR("_ProvisioningEnabledDataClasses"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setEnabledDataClasses:", v18);

      objc_msgSend(v11, "objectForKey:", CFSTR("_ProvisioningDeviceGUID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDeviceGUID:", v19);

      objc_msgSend(v11, "objectForKey:", CFSTR("_ProvisioningDevicePairingId"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        goto LABEL_5;
      _ATLogCategoryFramework();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v12;
        _os_log_impl(&dword_1D1868000, v27, OS_LOG_TYPE_DEFAULT, "No pairing ID provided from endpoint %{public}@ - assuming active paired device", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0DDC018], "sharedMonitor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "activePairedDevicePairingID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v29, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
LABEL_5:
          objc_msgSend(v13, "setDevicePairingId:", v20);

        }
      }
      -[ATDeviceSettings setHostInfo:forLibrary:](self->_settings, "setHostInfo:forLibrary:", v13, v12);
      _ATLogCategoryFramework();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v32 = v12;
        v33 = 2114;
        v34 = v13;
        _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_DEFAULT, "Registered with endpoint %{public}@ hostInfo=%{public}@", buf, 0x16u);
      }

      if (-[ATDeviceSettings grappaEnabled](self->_settings, "grappaEnabled"))
      {
        v22 = -[ATGrappaSession initWithType:]([ATGrappaSession alloc], "initWithType:", 1);
        grappaSession = self->_grappaSession;
        self->_grappaSession = v22;

        v24 = self->_grappaSession;
        objc_msgSend(v13, "grappaInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        -[ATGrappaSession establishHostSessionWithDeviceInfo:clientRequestData:](v24, "establishHostSessionWithDeviceInfo:clientRequestData:", v25, &v30);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v30;

      }
      else
      {
        v10 = 0;
        v9 = 0;
      }

      if (!v9)
      {
        -[ATDeviceProvisioningHandler _sendCreateSessionRequestWithData:onMessageLink:](self, "_sendCreateSessionRequestWithData:onMessageLink:", v10, v7);
LABEL_15:

        goto LABEL_16;
      }
    }
    _ATLogCategoryFramework();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v9;
      _os_log_impl(&dword_1D1868000, v26, OS_LOG_TYPE_ERROR, "Failed to register endpoint: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v7, "close");
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_sendCreateSessionRequestWithData:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("_ProvisioningSessionRequestData"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF76A0]), "initWithCommand:dataClass:parameters:", CFSTR("ProvisioningCreateSession"), CFSTR("Provisioning"), v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__ATDeviceProvisioningHandler__sendCreateSessionRequestWithData_onMessageLink___block_invoke;
  v12[3] = &unk_1E927D660;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v11, "sendRequest:withCompletion:", v10, v12);

}

- (void)_handleCreateSessionRequest:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ATGrappaSession *grappaSession;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATDeviceSettings grappaEnabled](self->_settings, "grappaEnabled"))
  {
    objc_msgSend(v6, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("_ProvisioningSessionRequestData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    grappaSession = self->_grappaSession;
    v19 = 0;
    -[ATGrappaSession establishDeviceSessionWithRequestData:responseData:](grappaSession, "establishDeviceSessionWithRequestData:responseData:", v10, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    v14 = v13;
    if (!v12 && v13)
      objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("_ProvisioningSessionResposneData"));

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v6, "responseWithError:parameters:", v12, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__ATDeviceProvisioningHandler__handleCreateSessionRequest_onMessageLink___block_invoke;
  v17[3] = &unk_1E927E0D0;
  v18 = v7;
  v16 = v7;
  objc_msgSend(v16, "sendResponse:withCompletion:", v15, v17);

}

- (void)_processCreateSessionResponse:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isPartial") & 1) == 0)
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_3;
    if (!-[ATDeviceSettings grappaEnabled](self->_settings, "grappaEnabled"))
      goto LABEL_8;
    objc_msgSend(v6, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("_ProvisioningSessionResposneData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATGrappaSession beginHostSessionWithDeviceResponseData:](self->_grappaSession, "beginHostSessionWithDeviceResponseData:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_3:
      _ATLogCategoryFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v12 = 138543362;
        v13 = v8;
        _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_ERROR, "Failed to process CreateSession response: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v7, "close");
    }
    else
    {
LABEL_8:
      -[ATDeviceProvisioningHandler _sendBeginSessionRequestOnMessageLink:](self, "_sendBeginSessionRequestOnMessageLink:", v7);
    }
  }

}

- (void)_sendBeginSessionRequestOnMessageLink:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF76A0]), "initWithCommand:dataClass:parameters:", CFSTR("ProvisioningBeginSession"), CFSTR("Provisioning"), 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__ATDeviceProvisioningHandler__sendBeginSessionRequestOnMessageLink___block_invoke;
  v7[3] = &unk_1E927D660;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v6, "sendRequest:withCompletion:", v5, v7);

}

- (void)_handleBeginSessionRequest:(id)a3 onMessageLink:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  ATDeviceProvisioningHandler *v11;

  v6 = a4;
  objc_msgSend(a3, "responseWithError:parameters:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ATDeviceProvisioningHandler__handleBeginSessionRequest_onMessageLink___block_invoke;
  v9[3] = &unk_1E927E1C0;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v8, "sendResponse:withCompletion:", v7, v9);

}

- (void)_processBeginSessionResponse:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isPartial") & 1) == 0)
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      _ATLogCategoryFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "error");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_ERROR, "Failed to process BeginSession response: %{public}@", (uint8_t *)&v11, 0xCu);

      }
      objc_msgSend(v7, "close");
    }
    else
    {
      -[ATDeviceProvisioningHandler _setMessageLinkAsInitialized:](self, "_setMessageLinkAsInitialized:", v7);
    }
  }

}

- (id)_getEndpointInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSettings libraryIdentifier](self->_settings, "libraryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("_ProvisioningLibraryIdentifier"));

  v5 = (void *)MGCopyAnswer();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("_ProvisioningHostOSVersion"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("iOS"), CFSTR("_ProvisioningHostOSType"));
  v6 = (void *)MGCopyAnswer();
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("_ProvisioningHostModel"));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  +[ATClientController sharedInstance](ATClientController, "sharedInstance", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EFC7B610))
        {
          objc_msgSend(v14, "syncDataClass");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("_ProvisioningEnabledDataClasses"));

  objc_msgSend(MEMORY[0x1E0DDC018], "sharedMonitor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pairedDevicePairingID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("_ProvisioningDevicePairingId"));

  }
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deviceGUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("_ProvisioningDeviceGUID"));

  return v3;
}

- (void)_setMessageLinkAsInitialized:(id)a3
{
  ATGrappaSignatureProvider *v4;
  ATGrappaSignatureProvider *v5;
  id v6;

  v6 = a3;
  if (-[ATDeviceSettings grappaEnabled](self->_settings, "grappaEnabled"))
    v4 = -[ATGrappaSignatureProvider initWithGrappaSession:]([ATGrappaSignatureProvider alloc], "initWithGrappaSession:", self->_grappaSession);
  else
    v4 = objc_alloc_init(ATMD5SignatureProvider);
  v5 = v4;
  objc_msgSend(v6, "setSignatureProvider:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  ATReportEventAddDoubleToScalarKey();
  objc_msgSend(v6, "setInitialized:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grappaSession, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __72__ATDeviceProvisioningHandler__handleBeginSessionRequest_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "Failed to handle BeginSession request: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_setMessageLinkAsInitialized:", *(_QWORD *)(a1 + 32));
  }

}

void __69__ATDeviceProvisioningHandler__sendBeginSessionRequestOnMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isPartial") & 1) == 0)
  {
    if (v6)
    {
      _ATLogCategoryFramework();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 138543362;
        v9 = v6;
        _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_ERROR, "Failed to send BeginSession request: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "close");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_processBeginSessionResponse:onMessageLink:", v5, *(_QWORD *)(a1 + 40));
    }
  }

}

void __73__ATDeviceProvisioningHandler__handleCreateSessionRequest_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "Failed to send CreateSession response: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }

}

void __79__ATDeviceProvisioningHandler__sendCreateSessionRequestWithData_onMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isPartial") & 1) == 0)
  {
    if (v6)
    {
      _ATLogCategoryFramework();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 138543362;
        v9 = v6;
        _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_ERROR, "Failed to send create session request: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "close");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_processCreateSessionResponse:onMessageLink:", v5, *(_QWORD *)(a1 + 40));
    }
  }

}

void __76__ATDeviceProvisioningHandler__handleRegisterEndpointRequest_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "Failed to send RegisterEndpoint response: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }

}

void __73__ATDeviceProvisioningHandler__sendRegisterEndpointRequestOnMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isPartial") & 1) == 0)
  {
    if (v6)
    {
      _ATLogCategoryFramework();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 138543362;
        v9 = v6;
        _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_ERROR, "Failed to provision link: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "close");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_processRegisterEndpointResponse:onMessageLink:", v5, *(_QWORD *)(a1 + 40));
    }
  }

}

@end
