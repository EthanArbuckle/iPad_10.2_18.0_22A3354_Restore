@implementation ASTNetworking

- (ASTNetworking)initWithSOCKSProxyServer:(id)a3 port:(id)a4
{
  id v6;
  id v7;
  ASTNetworking *v8;
  ASTNetworking *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSURLSession *session;
  uint64_t v15;
  NSMutableDictionary *networkStorage;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ASTNetworking;
  v8 = -[ASTNetworking init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ASTNetworking _sessionConfigurationWithSOCKSProxyServer:port:](v8, "_sessionConfigurationWithSOCKSProxyServer:port:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1850];
    v12 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v11, "sessionWithConfiguration:delegate:delegateQueue:", v10, v9, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    session = v9->_session;
    v9->_session = (NSURLSession *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    networkStorage = v9->_networkStorage;
    v9->_networkStorage = (NSMutableDictionary *)v15;

  }
  return v9;
}

- (ASTNetworking)init
{
  return -[ASTNetworking initWithSOCKSProxyServer:port:](self, "initWithSOCKSProxyServer:port:", 0, 0);
}

- (id)_sessionConfigurationWithSOCKSProxyServer:(id)a3 port:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWaitsForConnectivity:", 1);
  objc_msgSend(v8, "setTimeoutIntervalForRequest:", (double)-[ASTNetworking _requestTimeInterval](self, "_requestTimeInterval"));
  if (v6 && v7)
  {
    objc_msgSend(v8, "setWaitsForConnectivity:", 0);
    v15[0] = CFSTR("SOCKSEnable");
    v15[1] = CFSTR("SOCKSPort");
    v16[0] = MEMORY[0x24BDBD1C8];
    v16[1] = v7;
    v15[2] = CFSTR("SOCKSProxy");
    v16[2] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConnectionProxyDictionary:", v9);

    ASTLogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "connectionProxyDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_22D91B000, v10, OS_LOG_TYPE_DEFAULT, "Configuring SOCKS proxy: %@", (uint8_t *)&v13, 0xCu);

    }
  }

  return v8;
}

- (int)_requestTimeInterval
{
  if (_requestTimeInterval_onceToken != -1)
    dispatch_once(&_requestTimeInterval_onceToken, &__block_literal_global_1);
  if (_requestTimeInterval_requestTimeInSeconds)
    return 60;
  else
    return 0;
}

void __37__ASTNetworking__requestTimeInterval__block_invoke()
{
  _requestTimeInterval_requestTimeInSeconds = 1;
}

- (void)addConnection:(id)a3
{
  id v4;
  ASTNetworkObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  ASTNetworking *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(ASTNetworkObject);
  -[ASTNetworkObject setConnection:](v5, "setConnection:", v4);
  ASTLogHandleForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v4, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allHTTPHeaderFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_22D91B000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Request Headers: %@", buf, 0x16u);

  }
  ASTLogHandleForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend(v4, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v12;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_22D91B000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Request URL: %@", buf, 0x16u);

  }
  v16 = self;
  objc_sync_enter(v16);
  -[ASTNetworking session](v16, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v23 = 0;
    -[ASTNetworking _taskWithConnection:error:](v16, "_taskWithConnection:error:", v4, &v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v23;
    if (v18)
    {
      -[ASTNetworking networkStorage](v16, "networkStorage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v5, v18);

      objc_msgSend(v18, "resume");
    }
    else
    {
      objc_msgSend(v4, "didReceiveResponse");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v21)[2](v21, 0, v19);

      ASTLogHandleForCategory(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ASTNetworking addConnection:].cold.1();

    }
  }
  objc_sync_exit(v16);

}

- (void)cancelConnectionsOfClass:(Class)a3
{
  void *v5;
  _QWORD v6[6];

  -[ASTNetworking session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__ASTNetworking_cancelConnectionsOfClass___block_invoke;
  v6[3] = &unk_24F969CF8;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "getAllTasksWithCompletionHandler:", v6);

}

void __42__ASTNetworking_cancelConnectionsOfClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "networkStorage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "connection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          objc_msgSend(v8, "cancel");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  _BOOL4 v35;
  void *v36;
  dispatch_time_t v37;
  NSObject *v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  void *v40;
  void *v41;
  _QWORD block[5];
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  const __CFString *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  ASTLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ASTNetworking URLSession:task:didCompleteWithError:].cold.2((uint64_t)v8, v9);

  -[ASTNetworking networkStorage](self, "networkStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v28 = (void *)MEMORY[0x24BDBD1B8];
    goto LABEL_36;
  }
  objc_msgSend(v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "response");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v7, "response");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "statusCode");

    if (v16 == 200)
    {
      -[ASTNetworking updateConnectionState:newState:](self, "updateConnectionState:newState:", v12, 0);
      ASTLogHandleForCategory(2);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "response");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allHeaderFields");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v19;
        _os_log_impl(&dword_22D91B000, v17, OS_LOG_TYPE_DEFAULT, "Response Headers: %@", buf, 0xCu);

      }
      objc_msgSend(v11, "receivedData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v20, 4);
        ASTLogHandleForCategory(3);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "currentRequest");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "URL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v46 = v24;
          v47 = 2112;
          v48 = (uint64_t)v21;
          _os_log_impl(&dword_22D91B000, v22, OS_LOG_TYPE_DEFAULT, "URL: %@\nResponse Body: %@", buf, 0x16u);

        }
        +[ASTTestAutomation sharedInstance](ASTTestAutomation, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "testAutomationEnabled");

        if (v26)
        {
          v51 = CFSTR("payload");
          v52[0] = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[ASTTestAutomation postServerResponse:](ASTTestAutomation, "postServerResponse:", v27);

        }
        v44 = v8;
        +[ASTEncodingUtilities parseJSONResponseWithData:error:](ASTEncodingUtilities, "parseJSONResponseWithData:error:", v20, &v44);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v44;

        if (v28
          && !+[ASTConnectionUtilities isValidResponse:](ASTConnectionUtilities, "isValidResponse:", v28))
        {
          ASTLogHandleForCategory(1);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[ASTNetworking URLSession:task:didCompleteWithError:].cold.1();

          v28 = 0;
        }

        v8 = v29;
      }
      else
      {
        v28 = (void *)MEMORY[0x24BDBD1B8];
      }

      goto LABEL_28;
    }
  }
  objc_msgSend(v7, "response");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "statusCode");

  ASTLogHandleForCategory(1);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "originalRequest");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "URL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v46 = v41;
    v47 = 2048;
    v48 = v32;
    v49 = 2112;
    v50 = v8;
    _os_log_error_impl(&dword_22D91B000, v33, OS_LOG_TYPE_ERROR, "%@ responded with status code %ld, error: %@", buf, 0x20u);

  }
  if (!+[ASTConnectionUtilities didEncounterNetworkDisconnectionError:](ASTConnectionUtilities, "didEncounterNetworkDisconnectionError:", v8)|| (-[ASTNetworking updateConnectionState:newState:](self, "updateConnectionState:newState:", v12, 1), !objc_msgSend(v12, "retryOnNetworkDisconnected")))
  {
    v28 = 0;
LABEL_28:
    v35 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v12, "setNetworkDisconnectedRetryCount:", objc_msgSend(v12, "networkDisconnectedRetryCount") + 1);
  v34 = objc_msgSend(v12, "networkDisconnectedRetryCount");
  v28 = 0;
  v35 = v34 < -[ASTNetworking networkDisconnectRetryCount](self, "networkDisconnectRetryCount");
LABEL_29:
  -[ASTNetworking _verifyResultOfTask:connection:](self, "_verifyResultOfTask:connection:", v7, v12);
  -[ASTNetworking networkStorage](self, "networkStorage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeObjectForKey:", v7);

  if (v35)
  {
    if (-[ASTNetworking _isValidEasyRider](self, "_isValidEasyRider")
      && -[ASTNetworking _didRefetchProxyServer](self, "_didRefetchProxyServer"))
    {
      -[ASTNetworking _resetSessionToNewProxyServer](self, "_resetSessionToNewProxyServer");
    }
    v37 = dispatch_time(0, 3000000000);
    dispatch_get_global_queue(0, 0);
    v38 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__ASTNetworking_URLSession_task_didCompleteWithError___block_invoke;
    block[3] = &unk_24F969B48;
    block[4] = self;
    v43 = v12;
    dispatch_after(v37, v38, block);

  }
  else
  {
    objc_msgSend(v12, "didReceiveResponse");
    v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v39)[2](v39, v28, v8);

  }
LABEL_36:

}

uint64_t __54__ASTNetworking_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;

  v9 = a5;
  v10 = (void (**)(id, uint64_t, _QWORD))a6;
  v11 = a4;
  ASTLogHandleForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ASTNetworking URLSession:task:didReceiveChallenge:completionHandler:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);

  -[ASTNetworking networkStorage](self, "networkStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_8;
  objc_msgSend(v21, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protectionSpace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "authenticationMethod");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BDD12F8]);

  if (!v25)
  {

LABEL_8:
    v10[2](v10, 1, 0);
    goto LABEL_13;
  }
  objc_msgSend(v9, "protectionSpace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:](ASTConnectionUtilities, "trustIsValidWithProtectionSpace:rootOfTrust:", v26, objc_msgSend(v22, "rootOfTrust"));

  if (v27)
  {
    v28 = (void *)MEMORY[0x24BDD1818];
    objc_msgSend(v9, "protectionSpace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "credentialForTrust:", objc_msgSend(v29, "serverTrust"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v30);
  }
  else
  {
    ASTLogHandleForCategory(1);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[ASTNetworking URLSession:task:didReceiveChallenge:completionHandler:].cold.1();

    v10[2](v10, 2, 0);
  }

LABEL_13:
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;

  v11 = a4;
  ASTLogHandleForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ASTNetworking URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  -[ASTNetworking networkStorage](self, "networkStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v21, "connection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTNetworking updateConnectionState:newState:](self, "updateConnectionState:newState:", v22, 0);
    objc_msgSend(v22, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      objc_msgSend(v22, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "connection:didSendBodyData:totalBytesSent:totalBytesExpected:", v22, a5, a6, a7);

    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = (void (**)(id, void *))a5;
  v8 = a4;
  ASTLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ASTNetworking URLSession:task:needNewBodyStream:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  -[ASTNetworking networkStorage](self, "networkStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "conformsToProtocol:", &unk_255DAC3A8))
    {
      v20 = (void *)MEMORY[0x24BDBCE90];
      objc_msgSend(v19, "fileSteamLocationURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "inputStreamWithURL:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }
  v7[2](v7, v22);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;

  v9 = a6;
  v10 = (void (**)(id, void *))a7;
  ASTLogHandleForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ASTNetworking URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  v19 = v9;
  v20 = v19;
  v21 = v19;
  if (a5)
  {

    v21 = 0;
  }
  v10[2](v10, v21);

}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  ASTLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ASTNetworking URLSession:taskIsWaitingForConnectivity:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  -[ASTNetworking networkStorage](self, "networkStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      ASTLogHandleForCategory(1);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "connection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v15;
        v22 = 2112;
        v23 = v18;
        _os_log_impl(&dword_22D91B000, v17, OS_LOG_TYPE_DEFAULT, "Setting connection state to disconnected for network object {%@} with connection {%@}", (uint8_t *)&v20, 0x16u);

      }
      objc_msgSend(v15, "connection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTNetworking updateConnectionState:newState:](self, "updateConnectionState:newState:", v19, 1);

    }
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  ASTLogHandleForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ASTNetworking URLSession:dataTask:didReceiveData:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);

  -[ASTNetworking networkStorage](self, "networkStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTNetworking updateConnectionState:newState:](self, "updateConnectionState:newState:", v21, 0);
    if (objc_msgSend(v21, "conformsToProtocol:", &unk_255DAAC60))
    {
      v22 = v21;
      objc_msgSend(v22, "destinationFileHandle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "writeData:", v10);

    }
    else
    {
      objc_msgSend(v20, "receivedData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        objc_msgSend(MEMORY[0x24BDBCEC8], "data");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setReceivedData:", v25);

      }
      objc_msgSend(v20, "receivedData");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "appendData:", v10);
    }

  }
}

- (void)updateConnectionState:(id)a3 newState:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(v9, "state");
  objc_msgSend(v9, "setState:", a4);
  if (v5 != objc_msgSend(v9, "state"))
  {
    objc_msgSend(v9, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v9, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "connection:connectionStateChanged:", v9, objc_msgSend(v9, "state"));

    }
  }

}

- (void)invalidate
{
  NSObject *v3;
  ASTNetworking *v4;
  void *v5;
  uint8_t v6[16];

  ASTLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate current NSURLSession.", v6, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[ASTNetworking session](v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishTasksAndInvalidate");

  -[ASTNetworking setSession:](v4, "setSession:", 0);
  objc_sync_exit(v4);

}

- (id)_taskWithConnection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_255DAAC60))
  {
    -[ASTNetworking _downloadTaskWithDownloadConnection:error:](self, "_downloadTaskWithDownloadConnection:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_msgSend(v6, "conformsToProtocol:", &unk_255DAC3A8);
    -[ASTNetworking session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v9, "uploadTaskWithStreamedRequest:", v10);
    else
      objc_msgSend(v9, "dataTaskWithRequest:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_downloadTaskWithDownloadConnection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v6 = a3;
  objc_msgSend(v6, "destinationFileHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    ASTLogHandleForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ASTNetworking _downloadTaskWithDownloadConnection:error:].cold.1();
    goto LABEL_11;
  }
  objc_msgSend(v6, "destinationFileHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isOpenForUpdating");

  if ((v9 & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -3000, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    ASTLogHandleForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ASTNetworking _downloadTaskWithDownloadConnection:error:].cold.3();
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "destinationFileHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "truncateFileAtOffset:", 0);

  -[ASTNetworking session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataTaskWithRequest:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v13;
}

- (BOOL)_verifyResultOfTask:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_255DAAC60))
  {
    objc_msgSend(v7, "destinationFileHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ASTNetworking _verifyMD5ForFileHandle:task:](self, "_verifyMD5ForFileHandle:task:", v8, v6);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_verifyMD5ForFileHandle:(id)a3 task:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "synchronizeFile");
  +[ASTConnectionUtilities MD5HeaderValueForTask:](ASTConnectionUtilities, "MD5HeaderValueForTask:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[ASTEncodingUtilities MD5ForFileHandle:](ASTEncodingUtilities, "MD5ForFileHandle:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject caseInsensitiveCompare:](v8, "caseInsensitiveCompare:", v7))
    {

      v10 = 1;
      goto LABEL_10;
    }
    ASTLogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ASTNetworking _verifyMD5ForFileHandle:task:].cold.3();

  }
  else
  {
    ASTLogHandleForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ASTNetworking _verifyMD5ForFileHandle:task:].cold.2();
  }

  objc_msgSend(v5, "truncateFileAtOffset:", 0);
  v10 = 0;
LABEL_10:

  return v10;
}

- (int)networkDisconnectRetryCount
{
  if (networkDisconnectRetryCount_onceToken != -1)
    dispatch_once(&networkDisconnectRetryCount_onceToken, &__block_literal_global_135);
  return networkDisconnectRetryCount_networkDisconnectRetryCount;
}

void __44__ASTNetworking_networkDisconnectRetryCount__block_invoke()
{
  id v0;

  networkDisconnectRetryCount_networkDisconnectRetryCount = 200;
  v0 = (id)MGCopyAnswer();
  if (objc_msgSend(v0, "intValue") == 7)
    networkDisconnectRetryCount_networkDisconnectRetryCount = 10;

}

- (BOOL)_isValidEasyRider
{
  if (_isValidEasyRider_onceToken != -1)
    dispatch_once(&_isValidEasyRider_onceToken, &__block_literal_global_138);
  return _isValidEasyRider_isEasyRider;
}

void __34__ASTNetworking__isValidEasyRider__block_invoke()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[16];

  if (objc_msgSend(MEMORY[0x24BE15A68], "isCheckerBoardActive"))
  {
    objc_msgSend(MEMORY[0x24BE15A68], "proxyServer");
    v0 = (void *)objc_claimAutoreleasedReturnValue();

    if (v0)
    {
      _isValidEasyRider_isEasyRider = 1;
      ASTLogHandleForCategory(1);
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v2 = 0;
        _os_log_impl(&dword_22D91B000, v1, OS_LOG_TYPE_DEFAULT, "Valid EasyRider mode.", v2, 2u);
      }

    }
  }
}

- (BOOL)_didRefetchProxyServer
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (+[ASTLinking isCheckerBoardServicesFrameworkAvailable](ASTLinking, "isCheckerBoardServicesFrameworkAvailable")&& objc_msgSend(MEMORY[0x24BE15A68], "isCheckerBoardActive"))
  {
    objc_msgSend(MEMORY[0x24BE15A68], "proxyServer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "server");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "port");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (v6)
    {
      v7 = 0;
LABEL_18:

      return v7;
    }
    +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "SOCKSProxyServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v3) & 1) != 0)
    {
      objc_msgSend(v8, "SOCKSProxyPort");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToNumber:", v5);

      if ((v11 & 1) != 0)
      {
        v7 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    objc_msgSend(v8, "setSOCKSProxyServer:", v3);
    objc_msgSend(v8, "setSOCKSProxyPort:", v5);
    ASTLogHandleForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "SOCKSProxyServer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "SOCKSProxyPort");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_22D91B000, v12, OS_LOG_TYPE_DEFAULT, "Refetch ASTEnvironment to %@, %@", (uint8_t *)&v18, 0x16u);

    }
    v7 = 1;
    goto LABEL_17;
  }
  return 0;
}

- (void)_resetSessionToNewProxyServer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ASTNetworking *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "Resetting session to new proxy server.", (uint8_t *)&v15, 2u);
  }

  -[ASTNetworking invalidate](self, "invalidate");
  +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SOCKSProxyServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SOCKSProxyPort");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = self;
  objc_sync_enter(v8);
  -[ASTNetworking _sessionConfigurationWithSOCKSProxyServer:port:](v8, "_sessionConfigurationWithSOCKSProxyServer:port:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1850];
  v11 = objc_alloc_init(MEMORY[0x24BDD1710]);
  objc_msgSend(v10, "sessionWithConfiguration:delegate:delegateQueue:", v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTNetworking setSession:](v8, "setSession:", v12);

  ASTLogHandleForCategory(1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTNetworking session](v8, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v14;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_22D91B000, v13, OS_LOG_TYPE_DEFAULT, "New session[%@] is created with proxy server %@, %@ ", (uint8_t *)&v15, 0x20u);

  }
  objc_sync_exit(v8);

}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSMutableDictionary)networkStorage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNetworkStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkStorage, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)addConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Could not create task: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Server response invalid: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)URLSession:(uint64_t)a1 task:(NSObject *)a2 didCompleteWithError:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[ASTNetworking URLSession:task:didCompleteWithError:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_22D91B000, a2, OS_LOG_TYPE_DEBUG, "%s; %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)URLSession:task:didReceiveChallenge:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Server cert validity check failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)URLSession:(uint64_t)a3 task:(uint64_t)a4 didReceiveChallenge:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22D91B000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)URLSession:(uint64_t)a3 task:(uint64_t)a4 didSendBodyData:(uint64_t)a5 totalBytesSent:(uint64_t)a6 totalBytesExpectedToSend:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22D91B000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)URLSession:(uint64_t)a3 task:(uint64_t)a4 needNewBodyStream:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22D91B000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)URLSession:(uint64_t)a3 task:(uint64_t)a4 willPerformHTTPRedirection:(uint64_t)a5 newRequest:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22D91B000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)URLSession:(uint64_t)a3 taskIsWaitingForConnectivity:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22D91B000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)URLSession:dataTask:didReceiveData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Unable to write data to file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)URLSession:(uint64_t)a3 dataTask:(uint64_t)a4 didReceiveData:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_22D91B000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_downloadTaskWithDownloadConnection:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Download connection is missing a file handle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_downloadTaskWithDownloadConnection:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Exception occurred trying to truncate file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_downloadTaskWithDownloadConnection:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "File is not open for read+write.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyMD5ForFileHandle:task:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "File download MD5 key not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyMD5ForFileHandle:task:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "File download MD5 comparison failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyMD5ForFileHandle:task:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Exception occurred trying to synchronize file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
