@implementation ASTMaterializedConnection

- (ASTMaterializedConnection)init
{
  ASTMaterializedConnection *v2;
  ASTMaterializedConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASTMaterializedConnection;
  v2 = -[ASTMaterializedConnection init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_networkDisconnectedRetryCount = 0;
    v2->_rootOfTrust = -[ASTMaterializedConnection _rootOfTrust](v2, "_rootOfTrust");
    v3->_state = 0;
  }
  return v3;
}

- (NSString)method
{
  return (NSString *)CFSTR("POST");
}

- (NSString)endpoint
{
  return (NSString *)CFSTR("session");
}

- (double)timeout
{
  return 60.0;
}

- (NSString)contentType
{
  return (NSString *)CFSTR("application/json; charset=utf-8");
}

- (NSString)accept
{
  return (NSString *)CFSTR("application/json");
}

- (NSURL)customServerURL
{
  return 0;
}

- (NSMutableURLRequest)request
{
  NSMutableURLRequest *request;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSMutableURLRequest *v18;
  NSMutableURLRequest *v19;
  void *v20;
  NSMutableURLRequest *v21;
  void *v22;
  NSMutableURLRequest *v23;
  void *v24;
  NSMutableURLRequest *v25;
  void *v26;
  NSMutableURLRequest *v27;
  void *v28;
  NSMutableURLRequest *v29;
  void *v30;
  void *v31;
  NSMutableURLRequest *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableURLRequest *v36;
  void *v37;
  void *v38;
  NSMutableURLRequest *v39;
  void *v40;
  _QWORD v42[4];
  id v43;

  request = self->_request;
  if (!request)
  {
    -[ASTMaterializedConnection customServerURL](self, "customServerURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ASTMaterializedConnection customServerURL](self, "customServerURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTMaterializedConnection endpoint](self, "endpoint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTMaterializedConnection endpoint](self, "endpoint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[ASTMaterializedConnection parameters](self, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v7, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTMaterializedConnection parameters](self, "parameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __36__ASTMaterializedConnection_request__block_invoke;
      v42[3] = &unk_24F96A230;
      v43 = v12;
      v14 = v12;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v42);

      v15 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v11, "setQueryItems:", v15);

      objc_msgSend(v11, "URL");
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v16;
    }
    v17 = objc_alloc(MEMORY[0x24BDD16B0]);
    -[ASTMaterializedConnection timeout](self, "timeout");
    v18 = (NSMutableURLRequest *)objc_msgSend(v17, "initWithURL:cachePolicy:timeoutInterval:", v7, 0);
    v19 = self->_request;
    self->_request = v18;

    -[ASTMaterializedConnection method](self, "method");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest setHTTPMethod:](self->_request, "setHTTPMethod:", v20);

    -[NSMutableURLRequest setHTTPShouldHandleCookies:](self->_request, "setHTTPShouldHandleCookies:", 0);
    -[NSMutableURLRequest setAllowsCellularAccess:](self->_request, "setAllowsCellularAccess:", -[ASTMaterializedConnection allowsCellularAccess](self, "allowsCellularAccess"));
    v21 = self->_request;
    -[ASTMaterializedConnection accept](self, "accept");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v21, "setValue:forHTTPHeaderField:", v22, CFSTR("Accept"));

    v23 = self->_request;
    -[ASTMaterializedConnection contentType](self, "contentType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v23, "setValue:forHTTPHeaderField:", v24, CFSTR("Content-Type"));

    v25 = self->_request;
    objc_msgSend(v7, "host");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v25, "setValue:forHTTPHeaderField:", v26, CFSTR("Host"));

    v27 = self->_request;
    -[ASTMaterializedConnection _acceptLanguage](self, "_acceptLanguage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v27, "setValue:forHTTPHeaderField:", v28, CFSTR("Accept-Language"));

    v29 = self->_request;
    -[ASTMaterializedConnection identity](self, "identity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "userAgent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v29, "setValue:forHTTPHeaderField:", v31, CFSTR("User-Agent"));

    v32 = self->_request;
    +[ASTConnectionUtilities getServerLoggingSelection](ASTConnectionUtilities, "getServerLoggingSelection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v32, "setValue:forHTTPHeaderField:", v34, CFSTR("X-DA-LOG-LEVEL"));

    -[ASTMaterializedConnection signature](self, "signature");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = self->_request;
      -[ASTMaterializedConnection signature](self, "signature");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v36, "setValue:forHTTPHeaderField:", v37, CFSTR("Signature"));

    }
    -[ASTMaterializedConnection sessionId](self, "sessionId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = self->_request;
      -[ASTMaterializedConnection sessionId](self, "sessionId");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v39, "setValue:forHTTPHeaderField:", v40, CFSTR("Diagnostic-Session-ID"));

    }
    request = self->_request;
  }
  return request;
}

void __36__ASTMaterializedConnection_request__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (NSDictionary)parameters
{
  return 0;
}

- (void)setSignature:(id)a3
{
  void *v4;
  id v5;

  objc_storeStrong((id *)&self->_signature, a3);
  -[ASTMaterializedConnection request](self, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection signature](self, "signature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v4, CFSTR("Signature"));

}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_allowsCellularAccess = a3;
  -[ASTMaterializedConnection request](self, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsCellularAccess:", v3);

}

- (void)setIdentity:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_identity, a3);
  v5 = a3;
  -[ASTMaterializedConnection request](self, "request");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userAgent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v6, CFSTR("User-Agent"));
}

- (void)setTimeout:(double)a3
{
  id v4;

  self->_timeout = a3;
  -[ASTMaterializedConnection request](self, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeoutInterval:", a3);

}

- (void)setSessionId:(id)a3
{
  void *v4;
  id v5;

  objc_storeStrong((id *)&self->_sessionId, a3);
  -[ASTMaterializedConnection request](self, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASTMaterializedConnection sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v4, CFSTR("Diagnostic-Session-ID"));

}

- (void)addBody:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  +[ASTEncodingUtilities jsonSerializeObject:error:](ASTEncodingUtilities, "jsonSerializeObject:error:", a3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v5)
  {
    ASTLogHandleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_22D91B000, v6, OS_LOG_TYPE_DEFAULT, "Error during json serialization: %@", buf, 0xCu);
    }

  }
  else if (v4)
  {
    -[ASTMaterializedConnection addBody:gzip:](self, "addBody:gzip:", v4, +[ASTConnectionUtilities isGzipEnabled](ASTConnectionUtilities, "isGzipEnabled"));
  }

}

- (void)addBody:(id)a3 gzip:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    if (v6)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
      ASTLogHandleForCategory(3);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v20 = (id)objc_opt_class();
        v21 = 2112;
        v22 = v8;
        v10 = v20;
        _os_log_impl(&dword_22D91B000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Request Body: %@", buf, 0x16u);

      }
      +[ASTTestAutomation sharedInstance](ASTTestAutomation, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "testAutomationEnabled");

      if (v12)
      {
        v17 = CFSTR("payload");
        v18 = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[ASTTestAutomation postServerRequest:](ASTTestAutomation, "postServerRequest:", v13);

      }
    }
    objc_msgSend(v7, "dataGZipDeflated");
    v14 = objc_claimAutoreleasedReturnValue();

    -[ASTMaterializedConnection request](self, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Content-Encoding"));

    v7 = (void *)v14;
  }
  -[ASTMaterializedConnection request](self, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHTTPBody:", v7);

}

- (void)signBodyWithPayloadSigner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[ASTMaterializedConnection rawBody](self, "rawBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASTMaterializedConnection rawBody](self, "rawBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTMaterializedConnection signPayload:withPayloadSigner:](self, "signPayload:withPayloadSigner:", v6, v4);

  }
  else
  {
    ASTLogHandleForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ASTMaterializedConnection signBodyWithPayloadSigner:].cold.1(v7);

  }
}

- (void)signPayload:(id)a3 withPayloadSigner:(id)a4
{
  void (**v6)(id, void *, id *);
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;

  v6 = (void (**)(id, void *, id *))a4;
  v25 = 0;
  +[ASTEncodingUtilities jsonSerializeObject:error:](ASTEncodingUtilities, "jsonSerializeObject:error:", a3, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  if (v8)
  {
    v9 = v8;
    ASTLogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ASTMaterializedConnection signPayload:withPayloadSigner:].cold.2((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_11:

    goto LABEL_12;
  }
  if (v6 && v7)
  {
    v24 = 0;
    v6[2](v6, v7, &v24);
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = v24;
    if (v10)
    {
      -[NSObject base64EncodedStringWithOptions:](v10, "base64EncodedStringWithOptions:", 0);
      v17 = objc_claimAutoreleasedReturnValue();
      -[ASTMaterializedConnection setSignature:](self, "setSignature:", v17);
    }
    else
    {
      ASTLogHandleForCategory(1);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ASTMaterializedConnection signPayload:withPayloadSigner:].cold.1((uint64_t)v9, v17, v18, v19, v20, v21, v22, v23);
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (unint64_t)_rootOfTrust
{
  void *v2;
  uint64_t v3;

  +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "server");

  if ((unint64_t)(v3 - 1) > 0xB)
    return 0;
  else
    return qword_22D948E30[v3 - 1];
}

- (id)_acceptLanguage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE15A68], "isCheckerBoardActive"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__ASTMaterializedConnection__acceptLanguage__block_invoke;
  v10[3] = &unk_24F96A110;
  v11 = v2;
  v7 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __44__ASTMaterializedConnection__acceptLanguage__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, BOOL *a4)
{
  float v5;
  void *v6;
  void *v7;

  v5 = (float)((float)a3 * -0.1) + 1.0;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@;q=%0.1g"), a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  *a4 = v5 <= 0.5;
}

- (id)didReceiveResponse
{
  return self->_didReceiveResponse;
}

- (void)setDidReceiveResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ASTConnectionStatusDelegate)delegate
{
  return (ASTConnectionStatusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)networkDisconnectedRetryCount
{
  return self->_networkDisconnectedRetryCount;
}

- (void)setNetworkDisconnectedRetryCount:(int64_t)a3
{
  self->_networkDisconnectedRetryCount = a3;
}

- (BOOL)retryOnNetworkDisconnected
{
  return self->_retryOnNetworkDisconnected;
}

- (void)setRetryOnNetworkDisconnected:(BOOL)a3
{
  self->_retryOnNetworkDisconnected = a3;
}

- (unint64_t)rootOfTrust
{
  return self->_rootOfTrust;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (NSString)signature
{
  return self->_signature;
}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (NSDictionary)rawBody
{
  return self->_rawBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawBody, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_didReceiveResponse, 0);
}

- (void)signBodyWithPayloadSigner:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D91B000, log, OS_LOG_TYPE_ERROR, "Unable to sign body, raw body is nil", v1, 2u);
}

- (void)signPayload:(uint64_t)a3 withPayloadSigner:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D91B000, a2, a3, "Unable to create connection signature, error: %@", a5, a6, a7, a8, 2u);
}

- (void)signPayload:(uint64_t)a3 withPayloadSigner:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D91B000, a2, a3, "Unable to serialize payload, error: %@", a5, a6, a7, a8, 2u);
}

@end
