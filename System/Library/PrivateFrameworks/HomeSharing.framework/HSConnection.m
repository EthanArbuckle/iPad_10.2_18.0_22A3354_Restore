@implementation HSConnection

- (HSConnection)initWithBaseURL:(id)a3
{
  return -[HSConnection initWithBaseURL:connectionType:](self, "initWithBaseURL:connectionType:", a3, 0);
}

- (HSConnection)initWithBaseURL:(id)a3 connectionType:(int64_t)a4
{
  id v6;
  HSConnection *v7;
  uint64_t v8;
  NSURL *baseURL;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialQueue;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HSConnection;
  v7 = -[HSConnection init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    baseURL = v7->_baseURL;
    v7->_baseURL = (NSURL *)v8;

    v7->_connectionType = a4;
    v10 = dispatch_queue_create("com.apple.homesharing.HSConnection", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v10;

    v7->_databaseRevision = 1;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[HSConnection setHomeSharingGroupID:](self, "setHomeSharingGroupID:", 0);
  -[HSConnection setFairPlayInfo:](self, "setFairPlayInfo:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HSConnection;
  -[HSConnection dealloc](&v3, sel_dealloc);
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *serialQueue;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__HSConnection_connectWithCompletionHandler___block_invoke;
  v12[3] = &unk_24C364B50;
  v13 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x20BD2BA98](v12);
  serialQueue = self->_serialQueue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __45__HSConnection_connectWithCompletionHandler___block_invoke_3;
  block[3] = &unk_24C364C98;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(serialQueue, block);

}

- (void)disconnect
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__HSConnection_disconnect__block_invoke;
  block[3] = &unk_24C364D10;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__HSConnection_sendRequest_withResponseHandler___block_invoke;
  v10[3] = &unk_24C364BC8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x20BD2BA98](v10);
  -[HSConnection _sendRequest:withInternalResponseHandler:](self, "_sendRequest:withInternalResponseHandler:", v8, v9);

}

- (id)signedRequestFromURLRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "allHTTPHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[HSConnection fairPlayInfo](self, "fairPlayInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "securityInfoForURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HSConnection fairPlayInfo](self, "fairPlayInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "securityInfoForURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("Client-Daap-Validation"));

    objc_msgSend(v4, "setAllHTTPHeaderFields:", v9);
    v16 = v4;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)checkForDatabaseUpdatesWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *serialQueue;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke;
  v12[3] = &unk_24C364B50;
  v13 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x20BD2BA98](v12);
  serialQueue = self->_serialQueue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_3;
  block[3] = &unk_24C364C98;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(serialQueue, block);

}

- (void)_continueFPSetupNegotiationWithData:(id)a3 internalConnectionCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  +[HSRequest request](HSFairPlaySetupRequest, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBodyData:", v7);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __88__HSConnection__continueFPSetupNegotiationWithData_internalConnectionCompletionHandler___block_invoke;
  v10[3] = &unk_24C364B78;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[HSConnection _sendRequest:withInternalResponseHandler:](self, "_sendRequest:withInternalResponseHandler:", v8, v10);

}

- (void)_loadDatabaseWithInternalConnectionCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *serialQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke;
  v12[3] = &unk_24C364B78;
  v12[4] = self;
  v13 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x20BD2BA98](v12);
  serialQueue = self->_serialQueue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_38;
  v10[3] = &unk_24C364C98;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(serialQueue, v10);

}

- (unsigned)_sapVersionForConnectionType
{
  return 2;
}

- (void)_sendRequest:(id)a3 withInternalResponseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HSConnection__sendRequest_withInternalResponseHandler___block_invoke;
  block[3] = &unk_24C364CC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

}

- (void)_onSerialQueue_sendRequest:(id)a3 withInternalResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  HSConnection *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HSConnection homeSharingGroupID](self, "homeSharingGroupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = objc_msgSend(v8, "isEqual:", CFSTR("server-info"));

    if ((v10 & 1) != 0)
      goto LABEL_5;
    -[HSConnection homeSharingGroupID](self, "homeSharingGroupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forArgument:", v9, CFSTR("hsgid"));
  }

LABEL_5:
  if (!self->_connectionType)
  {
    if ((objc_msgSend(v8, "isEqual:", CFSTR("logout")) & 1) == 0)
      objc_msgSend(v6, "setValue:forArgument:", CFSTR("1"), CFSTR("daap-no-disconnect"));
    objc_msgSend(v6, "setValue:forArgument:", CFSTR("1"), CFSTR("hs-mobile-device-client"));
  }
  objc_msgSend(v6, "URLRequestForBaseURL:sessionID:", self->_baseURL, -[HSConnection sessionID](self, "sessionID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if ((objc_msgSend(v8, "isEqual:", CFSTR("login")) & 1) == 0
    && (objc_msgSend(v8, "isEqual:", CFSTR("logout")) & 1) == 0
    && (objc_msgSend(v8, "isEqual:", CFSTR("fp-setup")) & 1) == 0
    && (objc_msgSend(v8, "isEqual:", CFSTR("server-info")) & 1) == 0)
  {
    -[HSConnection fairPlayInfo](self, "fairPlayInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "securityInfoForURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forHTTPHeaderField:", v15, CFSTR("Client-Daap-Validation"));

  }
  v16 = os_log_create("com.apple.amp.HomeSharing", "Connections");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "method"))
      v19 = CFSTR("POST");
    else
      v19 = CFSTR("GET");
    objc_msgSend(v6, "action");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v32 = v18;
    v33 = 2048;
    v34 = v6;
    v35 = 2114;
    v36 = v19;
    v37 = 2114;
    v38 = v20;
    _os_log_impl(&dword_20AA9E000, v16, OS_LOG_TYPE_DEFAULT, "Sending request: <%{public}@: %p method=%{public}@ action=%{public}@>", buf, 0x2Au);

  }
  v21 = os_log_create("com.apple.amp.HomeSharing", "Connections_Oversize");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "allHTTPHeaderFields");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v22;
    _os_log_impl(&dword_20AA9E000, v21, OS_LOG_TYPE_DEFAULT, "Request headers: %{public}@", buf, 0xCu);

  }
  -[HSConnection _onSerialQueue_connectionSession](self, "_onSerialQueue_connectionSession");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __71__HSConnection__onSerialQueue_sendRequest_withInternalResponseHandler___block_invoke;
  v27[3] = &unk_24C364C30;
  v28 = v6;
  v29 = self;
  v30 = v7;
  v24 = v7;
  v25 = v6;
  objc_msgSend(v23, "msv_dataTaskWithRequest:completionHandler:", v12, v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "resume");
}

- (id)_onSerialQueue_connectionSession
{
  NSURLSession *connectionSession;
  void *v4;
  NSURLSession *v5;
  NSURLSession *v6;

  connectionSession = self->_connectionSession;
  if (!connectionSession)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsCellularAccess:", 0);
    objc_msgSend(v4, "setHTTPAdditionalHeaders:", &unk_24C36DF30);
    objc_msgSend(v4, "setHTTPShouldUsePipelining:", 1);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v4);
    v5 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v6 = self->_connectionSession;
    self->_connectionSession = v5;

    connectionSession = self->_connectionSession;
  }
  return connectionSession;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (HSFairPlayInfo)fairPlayInfo
{
  return self->_fairPlayInfo;
}

- (void)setFairPlayInfo:(id)a3
{
  objc_storeStrong((id *)&self->_fairPlayInfo, a3);
}

- (NSString)homeSharingGroupID
{
  return self->_homeSharingGroupID;
}

- (void)setHomeSharingGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unsigned)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(unsigned int)a3
{
  self->_databaseID = a3;
}

- (unsigned)databaseRevision
{
  return self->_databaseRevision;
}

- (void)setDatabaseRevision:(unsigned int)a3
{
  self->_databaseRevision = a3;
}

- (unsigned)basePlaylistContainerID
{
  return self->_basePlaylistContainerID;
}

- (void)setBasePlaylistContainerID:(unsigned int)a3
{
  self->_basePlaylistContainerID = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeSharingGroupID, 0);
  objc_storeStrong((id *)&self->_fairPlayInfo, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_connectionSession, 0);
  objc_storeStrong((id *)&self->_activityTimerSource, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __71__HSConnection__onSerialQueue_sendRequest_withInternalResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v38 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v40 = v13;
      v41 = 2114;
      v42 = v11;
      v43 = 2114;
      v44 = v9;
      _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_ERROR, "Got no response for request %p, error %{public}@. NSURLSessionDataTask: %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v10, "allHeaderFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "statusCode");
    objc_msgSend(v14, "objectForKey:", CFSTR("Content-Type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HSResponse responseWithCode:headerFields:data:MIMEType:error:](HSResponse, "responseWithCode:headerFields:data:MIMEType:error:", v15, v14, v38, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "canonicalResponseForResponse:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v10;
      v20 = *(_QWORD *)(a1 + 32);
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v33 = a1;
      v34 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v16;
      v24 = v9;
      v25 = objc_msgSend(v17, "responseCode");
      objc_msgSend(v17, "responseData");
      v36 = v18;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v40 = v20;
      v10 = v35;
      v41 = 2114;
      v42 = v22;
      v43 = 2048;
      v44 = v17;
      v45 = 2048;
      v46 = v25;
      v9 = v24;
      v16 = v23;
      v47 = 2048;
      v48 = objc_msgSend(v26, "length");
      _os_log_impl(&dword_20AA9E000, v19, OS_LOG_TYPE_DEFAULT, "Received request %p response: <%{public}@: %p code=%ld, length=%{bytes}lu>", buf, 0x34u);

      v18 = v36;
      a1 = v33;
      v14 = v34;
    }

    v27 = os_log_create("com.apple.amp.HomeSharing", "Connections_Oversize");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = (uint64_t)v14;
      _os_log_impl(&dword_20AA9E000, v27, OS_LOG_TYPE_DEFAULT, "Response headers: %{public}@", buf, 0xCu);
    }

    if (v15 == 403 || v15 >= 500)
    {
      v28 = os_log_create("com.apple.amp.HomeSharing", "Connections");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v40 = v15;
        v41 = 2114;
        v42 = v9;
        _os_log_impl(&dword_20AA9E000, v28, OS_LOG_TYPE_ERROR, "Disconnecting due to HTTP status code: %lu. NSURLSessionDataTask: %{public}@", buf, 0x16u);
      }

      v29 = os_log_create("com.apple.amp.HomeSharing", "Connections");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v38, 4);
        v37 = v18;
        v31 = (void *)v30;
        if (v30)
          v32 = v30;
        else
          v32 = (uint64_t)v38;
        *(_DWORD *)buf = 138543362;
        v40 = v32;
        _os_log_impl(&dword_20AA9E000, v29, OS_LOG_TYPE_ERROR, "Disconnecting response data: %{public}@", buf, 0xCu);

        v18 = v37;
      }

      objc_msgSend(*(id *)(a1 + 40), "disconnect");
      v18 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __57__HSConnection__sendRequest_withInternalResponseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSerialQueue_sendRequest:withInternalResponseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  HSDatabasesRequest *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "responseCode") != 204)
  {
    v7 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2048;
      v16 = objc_msgSend(v4, "responseCode");
      _os_log_impl(&dword_20AA9E000, v7, OS_LOG_TYPE_ERROR, "Got no homeSharingVerifyResponse: %{public}@ / http status code: %ld", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "disconnect");
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "error");
    v5 = (HSDatabasesRequest *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, HSDatabasesRequest *))(v9 + 16))(v9, 0, v5);
  }
  else
  {
    v5 = objc_alloc_init(HSDatabasesRequest);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_2;
    v10[3] = &unk_24C364B78;
    v6 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = v6;
    objc_msgSend(v11, "_sendRequest:withInternalResponseHandler:", v5, v10);

  }
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_38(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "homeSharingGroupID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    +[HSRequest request](HSHomeSharingVerifyRequest, "request");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sendRequest:withInternalResponseHandler:", v4, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "responseCode") == 200)
  {
    objc_msgSend(v3, "databases");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", CFSTR("dmap.itemid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDatabaseID:", objc_msgSend(v6, "unsignedIntValue"));

    v7 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "databaseID");
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v8;
      _os_log_impl(&dword_20AA9E000, v7, OS_LOG_TYPE_INFO, "Using database with id: %u", buf, 8u);
    }

    v9 = *(_QWORD **)(a1 + 32);
    if (!v9[7])
    {
      +[HSContainersRequest requestWithDatabaseID:](HSContainersRequest, "requestWithDatabaseID:", objc_msgSend(v9, "databaseID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forArgument:", CFSTR("dmap.itemid,daap.baseplaylist"), CFSTR("meta"));
      objc_msgSend(v10, "setValue:forArgument:", CFSTR("'daap.baseplaylist:1'"), CFSTR("query"));
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_32;
      v14[3] = &unk_24C364B78;
      v11 = *(void **)(a1 + 40);
      v15 = *(id *)(a1 + 32);
      v16 = v11;
      objc_msgSend(v15, "_sendRequest:withInternalResponseHandler:", v10, v14);

    }
  }
  else
  {
    v12 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v18 = objc_msgSend(v3, "responseCode");
      _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_ERROR, "Got no base database response: %ld", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "disconnect");
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v5);
  }

}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "containers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", CFSTR("daap.baseplaylist"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedCharValue");

        if (v11)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("dmap.itemid"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setBasePlaylistContainerID:", objc_msgSend(v12, "unsignedIntValue"));

          v13 = os_log_create("com.apple.amp.HomeSharing", "Connections");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v14 = objc_msgSend(*(id *)(a1 + 32), "basePlaylistContainerID");
            *(_DWORD *)buf = 67109120;
            v27 = v14;
            _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_INFO, "Base playlist container ID is %u", buf, 8u);
          }

          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_35;
          v19[3] = &unk_24C364C70;
          v15 = *(void **)(a1 + 40);
          v20 = *(id *)(a1 + 32);
          v21 = v15;
          objc_msgSend(v20, "checkForDatabaseUpdatesWithCompletionHandler:", v19);

          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  if (!objc_msgSend(*(id *)(a1 + 32), "basePlaylistContainerID"))
  {
    v16 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AA9E000, v16, OS_LOG_TYPE_ERROR, "Got no base playlistContainerID", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "disconnect");
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

  }
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_35(uint64_t a1)
{
  NSObject *v2;
  dispatch_source_t v3;
  uint64_t v4;
  void *v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD handler[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v2);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v6 = dispatch_time(0, 45000000000);
    dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 16), v6, 0xA7A358200uLL, 0x37E11D600uLL);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 16);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_2_36;
    handler[3] = &unk_24C364D10;
    handler[4] = v7;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  }
}

void __69__HSConnection__loadDatabaseWithInternalConnectionCompletionHandler___block_invoke_2_36(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 64) == 2)
  {
    +[HSRequest request](HSActivityRequest, "request");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sendRequest:withResponseHandler:", v5, &__block_literal_global_1525);
    v3 = (void *)v5;
  }
  else
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 16));
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;
  }

}

void __88__HSConnection__continueFPSetupNegotiationWithData_internalConnectionCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a2;
  if (objc_msgSend(v3, "responseCode") == 200)
  {
    v9 = 0;
    objc_msgSend(*(id *)(a1 + 32), "fairPlayInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "_sapVersionForConnectionType");
    objc_msgSend(v3, "responseData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "continueNegotationWithSAPVersion:data:isComplete:", v5, v6, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v9)
      objc_msgSend(v8, "_loadDatabaseWithInternalConnectionCompletionHandler:", *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_continueFPSetupNegotiationWithData:internalConnectionCompletionHandler:", v7, *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "disconnect");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_24C364B28;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

void __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  +[HSUpdateRequest requestWithDatabaseRevision:sessionID:connectionType:](HSUpdateRequest, "requestWithDatabaseRevision:sessionID:connectionType:", objc_msgSend(*(id *)(a1 + 32), "databaseRevision"), objc_msgSend(*(id *)(a1 + 32), "sessionID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_4;
  v4[3] = &unk_24C364B78;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "_sendRequest:withInternalResponseHandler:", v2, v4);

}

void __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  unint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) == 2)
  {
    v5 = objc_msgSend(v3, "responseCode");
    v6 = v4;
    v7 = v6;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 0xC8)
    {
      v8 = objc_msgSend(v6, "databaseRevision");
      v9 = objc_msgSend(*(id *)(a1 + 32), "databaseRevision") != (_DWORD)v8;
      objc_msgSend(*(id *)(a1 + 32), "setDatabaseRevision:", v8);
      if (!(_DWORD)v8)
      {
        v10 = (void *)MEMORY[0x24BDD1540];
        v22 = *MEMORY[0x24BDD0FC8];
        v23 = CFSTR("Disconnected from Home Sharing because the server is shutting down.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hs_homeSharingErrorWithCode:userInfo:", 1004, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setSessionID:", 0);
        objc_msgSend(*(id *)(a1 + 32), "disconnect");
LABEL_11:
        v9 = 0;
LABEL_17:
        (*(void (**)(_QWORD, _BOOL8, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9, v12);
        goto LABEL_18;
      }
    }
    else
    {
      if (v5 == 403 || v5 >= 0x1F4)
      {
        v17 = os_log_create("com.apple.amp.HomeSharing", "Connections");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v21 = v5;
          _os_log_impl(&dword_20AA9E000, v17, OS_LOG_TYPE_ERROR, "Disconnected from Home Sharing because of unrecovereable http status code: %lu", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "setSessionID:", 0);
        objc_msgSend(*(id *)(a1 + 32), "disconnect");
      }
      else if (v5 == 406)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v18 = *MEMORY[0x24BDD0FC8];
        v19 = CFSTR("Request was rejected by iTunes.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hs_homeSharingErrorWithCode:userInfo:", 1003, v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      v9 = 0;
    }
    v12 = 0;
    goto LABEL_17;
  }
  v13 = *(_QWORD *)(a1 + 40);
  v14 = (void *)MEMORY[0x24BDD1540];
  v24 = *MEMORY[0x24BDD0FC8];
  v25[0] = CFSTR("Home Sharing library is no longer connected.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hs_homeSharingErrorWithCode:userInfo:", 1003, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v12);
LABEL_18:

}

uint64_t __61__HSConnection_checkForDatabaseUpdatesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __48__HSConnection_sendRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__HSConnection_sendRequest_withResponseHandler___block_invoke_2;
    v6[3] = &unk_24C364C98;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __48__HSConnection_sendRequest_withResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __26__HSConnection_disconnect__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  HSLogoutRequest *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v3, "connectionState") != 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 3);
      objc_msgSend(*(id *)(a1 + 32), "fairPlayInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endSecuritySession");

      v5 = *(void **)(a1 + 32);
      v6 = objc_alloc_init(HSLogoutRequest);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __26__HSConnection_disconnect__block_invoke_2;
      v10[3] = &unk_24C364BA0;
      v10[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "_sendRequest:withInternalResponseHandler:", v6, v10);

    }
  }
  else
  {
    objc_msgSend(v3, "setDatabaseRevision:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 0);
  }
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  if (v7)
  {
    dispatch_source_cancel(v7);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = 0;

  }
}

uint64_t __26__HSConnection_disconnect__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSessionID:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDatabaseRevision:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 0);
}

void __45__HSConnection_connectWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__HSConnection_connectWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C364B28;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

void __45__HSConnection_connectWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "connectionState"))
  {
    v2 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      *(_DWORD *)buf = 134217984;
      v10 = v3;
      _os_log_impl(&dword_20AA9E000, v2, OS_LOG_TYPE_FAULT, "Unable to connect, current state: %ld", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 1);
    +[HSRequest request](HSLoginRequest, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__HSConnection_connectWithCompletionHandler___block_invoke_5;
    v6[3] = &unk_24C364B78;
    v5 = *(void **)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v7, "_sendRequest:withInternalResponseHandler:", v4, v6);

  }
}

void __45__HSConnection_connectWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "responseCode");
  if (v4 == 200)
  {
    v5 = objc_msgSend(v3, "sessionID");

    objc_msgSend(*(id *)(a1 + 32), "setSessionID:", v5);
    v6 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v15 = 67109120;
      LODWORD(v16) = v7;
      _os_log_impl(&dword_20AA9E000, v6, OS_LOG_TYPE_INFO, "Connected with session ID: %d", (uint8_t *)&v15, 8u);
    }

    v8 = *(_QWORD **)(a1 + 32);
    if (v8[7])
    {
      objc_msgSend(v8, "_loadDatabaseWithInternalConnectionCompletionHandler:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v8, "fairPlayInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "beginNegotiationWithSAPVersion:", objc_msgSend(*(id *)(a1 + 32), "_sapVersionForConnectionType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_continueFPSetupNegotiationWithData:internalConnectionCompletionHandler:", v14, *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v9 = v4;
    objc_msgSend(v3, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218498;
      v16 = v9;
      v17 = 2114;
      v18 = v12;
      v19 = 2048;
      v20 = objc_msgSend(v10, "code");
      _os_log_impl(&dword_20AA9E000, v11, OS_LOG_TYPE_ERROR, "Received non-200 login response: %ld error domain: %{public}@ error code: %ld", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "disconnect");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __45__HSConnection_connectWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
